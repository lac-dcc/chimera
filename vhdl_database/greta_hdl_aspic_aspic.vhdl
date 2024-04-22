-- Copyright (C) 2016 Martin Åberg
--
--  This program is free software: you can redistribute it
--  and/or modify it under the terms of the GNU General Public
--  License as published by the Free Software Foundation,
--  either version 3 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will
--  be useful, but WITHOUT ANY WARRANTY; without even the
--  implied warranty of MERCHANTABILITY or FITNESS FOR A
--  PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General
--  Public License along with this program.  If not, see
--  <http://www.gnu.org/licenses/>.

-- ASPIC - SPI controller for GRETA
-- SPI mode 0 is supported
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.greta_pkg.all;
use work.aspic_regs.all;

entity aspic is
  generic(
    -- GRETA bus slave index
    gslave : gslave;
    -- Data width
    dwidth  : positive := 8;
    -- Scaler width
    swidth  : positive := 12;
    -- SPI slave select polarity. 0:active low, 1:active high
    sspol   : std_ulogic := '1'
  );
  port(
    clk   : in    std_logic;
    -- GRETA bus protocol
    gbi   : in    gbus_in;
    gbo   : out   gbus_out;
    -- SPI
    spii  : in    spi_in;
    spio  : out   spi_out
  );
end;

architecture rtl of aspic is
  type acstate is (UNCONFIGURED, SHUT_UP_FOREVER, CONFIGURED);
  type shstate is (IDLE, TRANSFER);

  constant ssinv : std_ulogic := not sspol;
  signal addr_ac_me : boolean := false;
  signal rom_rdata : std_logic_vector(15 downto 12);
  signal addr_low7 : std_logic_vector(7 downto 0);
  signal miso_sync : std_logic_vector(1 downto 0);

  type user_regs is record
    cap     : cap_reg;
    status  : status_reg;
    ctrl    : ctrl_reg;
    scaler  : scaler_reg;
    txdata  : txdata_reg;
    rxdata  : rxdata_reg;
  end record;

  type reg_t is record
    acstate     : acstate;
    slot        : autoconfig_slot;
    dev_select  : std_logic;
    rdata       : bus_data;
    user        : user_regs;
    shstate     : shstate;
    trig        : std_logic;
    shreg       : std_logic_vector(dwidth-1 downto 0);
    scount      : unsigned(1 + swidth-1 downto 0);
    spio        : spi_out;
    bitcount    : unsigned(3 downto 0);
  end record;
  function REG_RESET return reg_t is
    variable v : reg_t;
  begin
    v.acstate         := UNCONFIGURED;
    v.slot            := "000";
    v.dev_select      := '0';
    v.rdata           := (others => '0');
    v.user.cap.dma    := '0';
    v.user.status.tip := '0';
    v.user.status.tc  := '0';
    v.user.ctrl.ss    := '0';
    v.user.ctrl.tcim  := '0';
    v.shstate         := IDLE;
    v.trig            := '0';
    v.spio.clk        := '0';
    v.spio.mosi       := '0';
    v.spio.ss         := '0' xor ssinv;
    return v;
  end;

  signal r, rin : reg_t;

  -- Address decoding for user registers
  function user_rdata(
    addr  : bus_addr24;
    user  : user_regs
  ) return bus_data is
    variable ret : bus_data;
    variable a : std_logic_vector(3 downto 0) := addr(3 downto 1) & '0';
  begin
    if CAP_OFFSET(3 downto 0) = a then
      ret := encode(user.cap);
    elsif STATUS_OFFSET(3 downto 0) = a then
      ret := encode(user.status);
    elsif CTRL_OFFSET(3 downto 0) = a then
      ret := encode(user.ctrl);
    elsif SCALER_OFFSET(3 downto 0) = a then
      ret := encode(user.scaler);
    elsif TXDATA_OFFSET(3 downto 0) = a then
      ret := encode(user.txdata);
    elsif RXDATA_OFFSET(3 downto 0) = a then
      ret := encode(user.rxdata);
    end if;
    return ret;
  end;

begin
  comb : process(r, gbi, spii, addr_ac_me, rom_rdata, addr_low7, miso_sync)
    variable v : reg_t;
    variable vstatus : status_reg;
  begin
    v := r;
    v.trig := '0';

    v.spio.ss := r.user.ctrl.ss xor ssinv;
    case r.shstate is
      when IDLE =>
        v.scount := unsigned('0' & r.user.scaler.reload(swidth-1 downto 0));
        v.shreg :=     '0' & r.user.txdata.txdata(r.shreg'high-1 downto 0);
        v.spio.mosi := r.user.txdata.txdata(r.shreg'high);
        v.bitcount := "1111";
        v.user.status.tip := '0';
        if r.user.status.tip = '1' then
          v.user.status.tc := '1';
        end if;
        v.spio.clk := '0';
        if r.trig = '1' then
          v.shstate := TRANSFER;
          v.user.status.tip := '1';
        end if;

      when TRANSFER =>
        v.scount := r.scount - 1;
        -- Could save registers shifting directly into rxdata.
        v.user.rxdata.rxdata(r.shreg'range) := r.shreg;
        -- NOTE: scount counts one cycle extra before reload.
        if r.scount(r.scount'high) = '1' then
          v.scount := unsigned('0' & r.user.scaler.reload(swidth-1 downto 0));
          v.bitcount := r.bitcount - 1;
          v.spio.clk := not r.spio.clk;
          if r.spio.clk = '0' then
            -- NOTE: Should be shifted in later due to synchronization.
            v.shreg := r.shreg(dwidth-2 downto 0) & miso_sync(0);
          end if;
          if r.spio.clk = '1' then
            -- NOTE: ss prolonged for one host cycle, where mosi is also
            -- invalid.
            v.spio.mosi := r.shreg(r.shreg'high);
          end if;
          if r.bitcount = "0000" then
            v.shstate := IDLE;
          end if;
        end if;
    end case;

    -- AUTOCONFIG state
    case r.acstate is
      when UNCONFIGURED =>
        if (
          gbi.req = '1' and
          gbi.nwe(UPPER) = '0' and
          addr_ac_me and
          gbi.config(gslave) = '1'
        ) then
          if is_autoconfig_reg(ec_ShutUp, gbi.addr) then
            v.acstate := SHUT_UP_FOREVER;
          elsif is_autoconfig_reg(ec_BaseAddress, gbi.addr) then
            v.acstate := CONFIGURED;
            v.slot := gbi.wdata(10 downto 8);
          end if;
        end if;

      when others =>
        null;
    end case;

    -- Generate rdata back to bus_interface.
    -- We must give zeroes out when not selected (or bus).
    v.dev_select := '0';
    v.rdata := x"0000";
    if addr_ac_me then
      case r.acstate is
        when UNCONFIGURED =>
          if gbi.config(gslave) = '1' then
            v.dev_select := '1';
            -- Output AUTOCONFIG ROM data
            v.rdata(15 downto 12) := rom_rdata;
          end if;

        when SHUT_UP_FOREVER=>
          null;

        when CONFIGURED =>
          v.dev_select := '1';
          -- Output ASPIC register data.
          v.rdata := user_rdata(gbi.addr & '0', r.user);
      end case;
    end if;

    -- Register write
    if (
      r.acstate = CONFIGURED and
      addr_ac_me and
      gbi.req = '1' and
      gbi.nwe = WRITE_WORD
    ) then
      if STATUS_OFFSET(3 downto 1) = gbi.addr(3 downto 1) then
        vstatus := decode(gbi.wdata);
        if vstatus.tc = '1' then
          v.user.status.tc := '0';
        end if;
      elsif CTRL_OFFSET(3 downto 1) = gbi.addr(3 downto 1) then
        v.user.ctrl := decode(gbi.wdata);
      elsif SCALER_OFFSET(3 downto 1) = gbi.addr(3 downto 1) then
        v.user.scaler := decode(gbi.wdata);
        -- Limit reload register bits.
        v.user.scaler.reload(r.user.scaler.reload'high downto swidth) :=
          (others => '0');
      elsif TXDATA_OFFSET(3 downto 1) = gbi.addr(3 downto 1) then
        v.user.txdata := decode(gbi.wdata);
        v.user.txdata.txdata(r.user.txdata.txdata'high downto dwidth) :=
          (others => '0');
        v.trig := '1';
      end if;
    end if;

    rin <= v;
    -- Outputs
  end process;

  -- Address comparator for the unconfigured or configured
  -- device.
  addr_ac_me <=
    is_autoconfig(gbi.addr) and
    get_autoconfig_slot(gbi.addr) = r.slot;

  -- AUTOCONFIG ROM
  addr_low7 <= '0' & gbi.addr(6 downto 1) & '0';
  with addr_low7 select
    rom_rdata <=
      (ERT_ZORROII)                           when x"00",
      (ERT_CHAINEDCONFIG or ERT_MEMSIZE_64K)  when x"02",
      not (ASPIC_PRODUCT_NUMBER)              when x"06",
      not (HACKER_MANUFACTURER(15 downto 12)) when x"10",
      not (HACKER_MANUFACTURER(11 downto  8)) when x"12",
      not (HACKER_MANUFACTURER( 7 downto  4)) when x"14",
      not (HACKER_MANUFACTURER( 3 downto  0)) when x"16",
      "0000"                                  when x"40",
      "0000"                                  when x"42",
      "1111" when others;

  gbo.dev_select  <= r.dev_select;
  gbo.rdata       <= r.rdata;
  gbo.interrupt   <= r.user.status.tc and r.user.ctrl.tcim;
  gbo.config      <=  '0' when r.acstate = UNCONFIGURED else
                  '1';

  spio <= r.spio;

  reg : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
      if gbi.reset = '1' then
        r <= REG_RESET;
      end if;

      miso_sync <= spii.miso & miso_sync(1);
    end if;
  end process;

end;

