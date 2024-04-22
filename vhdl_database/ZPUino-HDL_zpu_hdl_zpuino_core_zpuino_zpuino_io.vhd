--
--  IO dispatcher for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_io is
  port (
    wb_clk_i:   in std_logic;
	 	wb_rst_i:   in std_logic;
    wb_dat_o:   out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i:   in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i:   in std_logic_vector(maxAddrBitIncIO downto 0);
    wb_we_i:    in std_logic;
    wb_cyc_i:   in std_logic;
    wb_stb_i:   in std_logic;
    wb_ack_o:   out std_logic;
    wb_inta_o:  out std_logic;

    intready:   in std_logic;
    cache_flush: out std_logic;
    memory_enable: out std_logic;

    slot_cyc:   out slot_std_logic_type;
    slot_we:    out slot_std_logic_type;
    slot_stb:   out slot_std_logic_type;
    slot_read:  in slot_cpuword_type := (others => (others => DontCareValue) );
    slot_write: out slot_cpuword_type;
    slot_address:  out slot_address_type;
    slot_ack:   in slot_std_logic_type := (others => '1');
    slot_interrupt: in slot_std_logic_type := (others => '0' );
    slot_id:    in slot_id_type;

    -- PPS information
    pps_in_slot:  in ppsininfotype;
    pps_in_pin:  in ppsininfotype;
    pps_out_slot:  in ppsoutinfotype;
    pps_out_pin:  in ppsoutinfotype

  );
end entity zpuino_io;

architecture behave of zpuino_io is

  constant io_registered_read: boolean := true;

  signal ivecs: std_logic_vector(17 downto 0);

  -- For busy-implementation
  signal addr_save_q: std_logic_vector(maxAddrBitIncIO downto 0);
  signal write_save_q: std_logic_vector(wordSize-1 downto 0);

  signal io_address: std_logic_vector(maxAddrBitIncIO downto 0);
  signal io_write: std_logic_vector(wordSize-1 downto 0);
  signal io_cyc: std_logic;
  signal io_stb: std_logic;
  signal io_we: std_logic;

  signal io_device_ack: std_logic;

  signal io_read_selected: cpuword_type;

  signal wb_in_transaction: std_logic;

  -- I/O Signals
  signal slot_cyc_i:   slot_std_logic_type;
  signal slot_we_i:    slot_std_logic_type;
  signal slot_stb_i:   slot_std_logic_type;
  signal slot_read_i:  slot_cpuword_type;
  signal slot_write_i: slot_cpuword_type;
  signal slot_address_i:  slot_address_type;
  signal slot_ack_i:   slot_std_logic_type;
  signal slot_interrupt_i: slot_std_logic_type;


  signal sysctl_read:  std_logic_vector(wordSize-1 downto 0);
  signal sysctl_ack: std_logic;
  signal sysctl_stb, sysctl_we, sysctl_cyc: std_logic;

begin

  slot_cyc      <= slot_cyc_i;
  slot_we       <= slot_we_i;
  slot_stb      <= slot_stb_i;
  slot_read_i   <= slot_read;
  slot_write    <= slot_write_i;
  slot_address  <= slot_address_i;
  slot_ack_i      <= slot_ack;
  slot_interrupt_i <= slot_interrupt;



  -- Ack generator  (We have an hack for slot0 here)

  process(slot_ack_i, sysctl_ack)
  begin
    io_device_ack <= '0';
    for i in 0 to num_devices-1 loop
      if i/=0 then
        if slot_ack_i(i) = '1' then
          io_device_ack<='1';
        end if;
      end if;
    end loop;
    if sysctl_ack='1' then
      io_device_ack<='1';
    end if;
  end process;

  iobusy: if zpuino_iobusyinput=true generate
    process(wb_clk_i)
    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' then
          wb_in_transaction <= '0';
        else

          if wb_in_transaction='0' then
            io_cyc <= wb_cyc_i;
            io_stb <= wb_stb_i;
            io_we <= wb_we_i;
          elsif io_device_ack='1' then
            io_stb<='0';
            --io_we<='0'; -- safe side
            -- How to keep cyc ????
          end if;

          if wb_cyc_i='1' then
            wb_in_transaction<='1';
          else
            io_cyc <= '0';
            wb_in_transaction<='0';
          end if;

          if wb_stb_i='1' and wb_cyc_i='1' then
            addr_save_q <= wb_adr_i;
          end if;
          if wb_we_i='1' then
            write_save_q <= wb_dat_i;
          end if;
        end if;
      end if;
    end process;

    io_address <= addr_save_q;
    io_write <= write_save_q;

    rread: if io_registered_read=true generate
    -- Read/ack
    process(wb_clk_i)
    begin
      if rising_edge(wb_clk_i) then
        if wb_rst_i='1' then
          wb_ack_o<='0';
          wb_dat_o<=(others => DontCareValue);
        else
          wb_ack_o <= io_device_ack;
          wb_dat_o <= io_read_selected;
        end if;
      end if;
    end process;

    end generate;

    nrread: if io_registered_read=false generate

      process(io_device_ack)
      begin
        wb_ack_o <= io_device_ack;
      end process;

      process(io_read_selected)
      begin
        wb_dat_o <= io_read_selected;
      end process;

    end generate;

  end generate;

  noiobusy: if zpuino_iobusyinput=false generate
    -- TODO: remove this

    io_address <= wb_adr_i;
    io_write <= wb_dat_i;
    io_cyc <= wb_cyc_i;
    io_stb <= wb_stb_i;
    io_we <= wb_we_i;

    wb_ack_o <= io_device_ack;
  end generate;

  -- Interrupt vectors
  ivecs(0) <= '0';

  process(slot_interrupt_i)
  begin
    for i in 1 to num_devices-1 loop
      ivecs(i) <= slot_interrupt_i(i);
    end loop;
  end process;

  -- Write and address signals, shared by all slots
  process(wb_dat_i,wb_adr_i,io_write,io_address)
  begin
    for i in 1 to num_devices-1 loop
      slot_write_i(i) <= io_write;
      slot_address_i(i) <= io_address(maxAddrBitIncIO-1 downto 2);
    end loop;
  end process;

  process(io_address,slot_read_i,sysctl_read)
    variable slotNumber: integer range 0 to num_devices-1;
  begin

    slotNumber := to_integer(unsigned(io_address(maxAddrBitIncIO-1 downto maxAddrBitIncIO-zpuino_number_io_select_bits)));
    if slotNumber/=0 then
      io_read_selected <= slot_read_i(slotNumber);
    else
      io_read_selected <= sysctl_read;
    end if;

  end process;

  -- Enable signals

  process(io_address,wb_stb_i,wb_cyc_i,wb_we_i,io_stb,io_cyc,io_we)
    variable slotNumber: integer range 0 to num_devices-1;
  begin

    slotNumber := to_integer(unsigned(io_address(maxAddrBitIncIO-1 downto maxAddrBitIncIO-zpuino_number_io_select_bits)));

    for i in 1 to num_devices-1 loop

      slot_stb_i(i) <= io_stb;
      slot_we_i(i) <= io_we;

      if i = slotNumber then
        slot_cyc_i(i) <= io_cyc;
      else
        slot_cyc_i(i) <= '0';
      end if;
    end loop;

    -- Sysctl

    sysctl_cyc<='0';
    if slotNumber=0 then
      sysctl_cyc <= io_cyc;
    end if;

  end process;
  
  sysctl_stb  <= io_stb;
  sysctl_we   <= io_we;

  --
  -- IO SLOT 0 - reserved
  --

  ctlinst: zpuino_sysctl
  generic map (
    INTERRUPT_LINES =>  18
  )
  port map (
    wb_clk_i    => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o    => sysctl_read,
    wb_dat_i    => io_write,
    wb_adr_i    => io_address(maxAddrBitIncIO-1 downto 2),
    wb_we_i     => sysctl_we,
    wb_cyc_i    => sysctl_cyc,
    wb_stb_i    => sysctl_stb,
    wb_ack_o    => sysctl_ack,
    wb_inta_o   => wb_inta_o, -- Interrupt signal to core
    slot_id     => slot_id,

    pps_in_slot => pps_in_slot,
    pps_in_pin  => pps_in_pin,

    pps_out_slot => pps_out_slot,
    pps_out_pin  => pps_out_pin,

    poppc_inst=> intready,
    cache_flush => cache_flush,
    memory_enable => memory_enable,
    intr_in     => ivecs,
    intr_cfglvl => "110000000000000000"
  );

end behave;
