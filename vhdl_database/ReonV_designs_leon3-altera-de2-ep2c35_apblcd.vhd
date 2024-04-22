
library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.stdlib.all; --tost
use grlib.amba.all;
use grlib.devices.all; -- vendor gaisler etc
--library gaisler;
--use gaisler.misc.all; --vår typ

use work.mypackage.all; --contains type

entity apblcd is
  generic (
    pindex  : integer := 0;
    paddr   : integer := 0;
    pmask   : integer := 16#fff#;
    oepol   : integer range 0 to 1 := 0;
    tas     : integer range 0 to 15 := 1;
    epw     : integer range 0 to 127 := 12
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    apbi    : in apb_slv_in_type;
    apbo    : out apb_slv_out_type;
    lcdo    : out lcd_out_type;
    lcdi    : in lcd_in_type
  );
end;

architecture rtl of apblcd is

--FSM states
type statetype is (idle,as,pwh,pwl); --idle, adress hold time, pulse width high, pulse width low


type lcd_cfg_type is record
  tas     : std_logic_vector(3 downto 0); --****
  epw     : std_logic_vector(6 downto 0); --****
end record;


type lcd_regs is record
  rs      : std_ulogic;
  rw      : std_ulogic;
  e       : std_ulogic;
  db      : std_logic_vector(7 downto 0);
  cmstate : statetype;
  clkcnt  : std_logic_vector(6 downto 0);
  cfg     : lcd_cfg_type;
----new regs----
  busy    : std_ulogic;
  prdata  : std_logic_vector(7 downto 0);
  db_oe   : std_ulogic;
----------------
end record;

constant TAS_RESET : std_logic_vector(3 downto 0) := conv_std_logic_vector(tas, 4);
constant EPW_RESET : std_logic_vector(6 downto 0) := conv_std_logic_vector(epw, 7);

constant OUTPUT         : std_ulogic := conv_std_logic(oepol = 1);
constant INPUT          : std_ulogic := conv_std_logic(oepol = 0);

constant REVISION       : amba_version_type := 0; 
constant pconfig        : apb_config_type := (
                        0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_LCDCTRL, 0, REVISION, 0),
                        1 => apb_iobar(paddr, pmask)); --OBS ändra till GAISLER_APBLCD

signal r, rin : lcd_regs;

begin

  ctrl : process(r, rst, apbi, lcdi)
    variable v : lcd_regs;
  begin
    v := r;

    if r.clkcnt /= "0000000" then v.clkcnt := r.clkcnt - 1; end if;

    if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(3 downto 2) is

        when "11" =>
          if r.cmstate = idle then
            v.cfg.tas := apbi.pwdata(3 downto 0); --****
            v.cfg.epw := apbi.pwdata(10 downto 4); --****
          end if;

        when others =>
          if r.cmstate = idle then
            v.rs := apbi.pwdata(9);
            v.rw := apbi.pwdata(8);
            v.busy := '1'; --new
            if(apbi.pwdata(8) = '0') then --write command => drive bus
              v.db := apbi.pwdata(7 downto 0);
              v.db_oe := OUTPUT; --set drive signal for write
            else
              v.db_oe := INPUT;
            end if;
            v.cmstate := as;
            v.clkcnt := "000" & r.cfg.tas; --(generic value should be 2. And decreased to 2-1 =1 so that value is used here. tas will be the value
          end if;            --assigned here +1, hence (2-1)+1 = 2.

      end case;
    end if;

    case r.cmstate is
      
      when as =>
        if (r.clkcnt = "0000000") then 
          v.cmstate := pwh;
          v.e := '1';
          v.clkcnt := r.cfg.epw; --spend epw -1 cycles with enable high
        end if;
 
      when pwh => --when entering here tas is fulfilled and enable goes high
        if (r.clkcnt = "0000000") then 
          v.cmstate := pwl;
          v.e := '0';
          if(r.rw = '1') then --sample read data
            v.prdata := lcdi.db;
          end if;
          v.clkcnt := r.cfg.epw; --spend epw -1 cycles with enable low
        end if;

      when pwl =>
        if (r.clkcnt = "0000000") then 
          v.cmstate := idle;
          v.busy := '0';
        end if;

      when others => null; --idle

    end case;

        
    if rst = '0' then
      v.busy := '0'; --new
      v.e := '0'; 
      v.cmstate := idle;
      v.clkcnt := (others => '0');
      v.cfg.tas := TAS_RESET; --"0001"; --default 2 cyles w8 time
      v.cfg.epw := EPW_RESET; --"0001100";--default 13 cycles w8 time
    end if;

    --update registers
    rin <= v;

    --drive outputs
    apbo.prdata              <= (others => '0');
    apbo.prdata(19 downto 0) <= r.cfg.epw & r.cfg.tas & r.busy & r.prdata; --***** 11 + 1 + 8
    apbo.pirq                <= (others => '0');
    apbo.pindex              <= pindex;
   
    lcdo.rs <= r.rs;
    lcdo.rw <= r.rw;
    lcdo.e  <= r.e;
    lcdo.db <= r.db;
    lcdo.db_oe <= r.db_oe;
  end process;

  apbo.pconfig <= pconfig;

  regs : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;

  -- pragma translate_off
    bootmsg : report_version 
    generic map ("apblcd" & tost(pindex) & ": APB LCD module rev " & tost(REVISION));
  -- pragma translate_on
end;

