
----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2009 Aeroflex Gaisler
-----------------------------------------------------------------------------
-- Entity: 	ahbrom
-- File:	ahbrom.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	AHB rom. 0/1-waitstate read
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

entity ahbrom is
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#fff#;
    pipe    : integer := 0;
    tech    : integer := 0;
    kbytes  : integer := 1);
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type
  );
end;

architecture rtl of ahbrom is
constant abits : integer := 9;
constant bytes : integer := 368;

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_AHBROM, 0, 0, 0),
  4 => ahb_membar(haddr, '1', '1', hmask), others => zero32);

signal romdata : std_logic_vector(31 downto 0);
signal addr : std_logic_vector(abits-1 downto 2);
signal hsel, hready : std_ulogic;

begin

  ahbso.hresp   <= "00"; 
  ahbso.hsplit  <= (others => '0'); 
  ahbso.hirq    <= (others => '0');
  ahbso.hconfig <= hconfig;
  ahbso.hindex  <= hindex;

  reg : process (clk)
  begin
    if rising_edge(clk) then 
      addr <= ahbsi.haddr(abits-1 downto 2);
    end if;
  end process;

  p0 : if pipe = 0 generate
    ahbso.hrdata  <= ahbdrivedata(romdata);
    ahbso.hready  <= '1';
  end generate;

  p1 : if pipe = 1 generate
    reg2 : process (clk)
    begin
      if rising_edge(clk) then
	hsel <= ahbsi.hsel(hindex) and ahbsi.htrans(1);
	hready <= ahbsi.hready;
	ahbso.hready <=  (not rst) or (hsel and hready) or
	  (ahbsi.hsel(hindex) and not ahbsi.htrans(1) and ahbsi.hready);
	ahbso.hrdata  <= ahbdrivedata(romdata);
      end if;
    end process;
  end generate;

  comb : process (addr)
  begin
    case conv_integer(addr) is
    when 16#00000# => romdata <= X"81D82000";
    when 16#00001# => romdata <= X"03000004";
    when 16#00002# => romdata <= X"821060E0";
    when 16#00003# => romdata <= X"81884000";
    when 16#00004# => romdata <= X"81900000";
    when 16#00005# => romdata <= X"81980000";
    when 16#00006# => romdata <= X"81800000";
    when 16#00007# => romdata <= X"01000000";
    when 16#00008# => romdata <= X"03002040";
    when 16#00009# => romdata <= X"8210600F";
    when 16#0000A# => romdata <= X"C2A00040";
    when 16#0000B# => romdata <= X"87444000";
    when 16#0000C# => romdata <= X"8608E01F";
    when 16#0000D# => romdata <= X"88100000";
    when 16#0000E# => romdata <= X"8A100000";
    when 16#0000F# => romdata <= X"8C100000";
    when 16#00010# => romdata <= X"8E100000";
    when 16#00011# => romdata <= X"A0100000";
    when 16#00012# => romdata <= X"A2100000";
    when 16#00013# => romdata <= X"A4100000";
    when 16#00014# => romdata <= X"A6100000";
    when 16#00015# => romdata <= X"A8100000";
    when 16#00016# => romdata <= X"AA100000";
    when 16#00017# => romdata <= X"AC100000";
    when 16#00018# => romdata <= X"AE100000";
    when 16#00019# => romdata <= X"90100000";
    when 16#0001A# => romdata <= X"92100000";
    when 16#0001B# => romdata <= X"94100000";
    when 16#0001C# => romdata <= X"96100000";
    when 16#0001D# => romdata <= X"98100000";
    when 16#0001E# => romdata <= X"9A100000";
    when 16#0001F# => romdata <= X"9C100000";
    when 16#00020# => romdata <= X"9E100000";
    when 16#00021# => romdata <= X"86A0E001";
    when 16#00022# => romdata <= X"16BFFFEF";
    when 16#00023# => romdata <= X"81E00000";
    when 16#00024# => romdata <= X"82102002";
    when 16#00025# => romdata <= X"81904000";
    when 16#00026# => romdata <= X"03000004";
    when 16#00027# => romdata <= X"821060E0";
    when 16#00028# => romdata <= X"81884000";
    when 16#00029# => romdata <= X"01000000";
    when 16#0002A# => romdata <= X"01000000";
    when 16#0002B# => romdata <= X"01000000";
    when 16#0002C# => romdata <= X"83480000";
    when 16#0002D# => romdata <= X"8330600C";
    when 16#0002E# => romdata <= X"80886001";
    when 16#0002F# => romdata <= X"02800019";
    when 16#00030# => romdata <= X"01000000";
    when 16#00031# => romdata <= X"07000000";
    when 16#00032# => romdata <= X"8610E118";
    when 16#00033# => romdata <= X"C108C000";
    when 16#00034# => romdata <= X"C118C000";
    when 16#00035# => romdata <= X"C518C000";
    when 16#00036# => romdata <= X"C918C000";
    when 16#00037# => romdata <= X"CD18E008";
    when 16#00038# => romdata <= X"D118C000";
    when 16#00039# => romdata <= X"D518C000";
    when 16#0003A# => romdata <= X"D918C000";
    when 16#0003B# => romdata <= X"DD18C000";
    when 16#0003C# => romdata <= X"E118C000";
    when 16#0003D# => romdata <= X"E518C000";
    when 16#0003E# => romdata <= X"E918C000";
    when 16#0003F# => romdata <= X"ED18C000";
    when 16#00040# => romdata <= X"F118C000";
    when 16#00041# => romdata <= X"F518C000";
    when 16#00042# => romdata <= X"F918C000";
    when 16#00043# => romdata <= X"10800005";
    when 16#00044# => romdata <= X"FD18C000";
    when 16#00045# => romdata <= X"01000000";
    when 16#00046# => romdata <= X"00000000";
    when 16#00047# => romdata <= X"00000000";
    when 16#00048# => romdata <= X"05000008";
    when 16#00049# => romdata <= X"82100000";
    when 16#0004A# => romdata <= X"3D1003FF";
    when 16#0004B# => romdata <= X"BC17A3E0";
    when 16#0004C# => romdata <= X"BC278001";
    when 16#0004D# => romdata <= X"9C27A060";
    when 16#0004E# => romdata <= X"03100000";
    when 16#0004F# => romdata <= X"81C04000";
    when 16#00050# => romdata <= X"01000000";
    when 16#00051# => romdata <= X"01000000";
    when 16#00052# => romdata <= X"01000000";
    when 16#00053# => romdata <= X"01000000";
    when 16#00054# => romdata <= X"01000000";
    when 16#00055# => romdata <= X"01000000";
    when 16#00056# => romdata <= X"01000000";
    when 16#00057# => romdata <= X"01000000";
    when 16#00058# => romdata <= X"00000000";
    when 16#00059# => romdata <= X"00000000";
    when 16#0005A# => romdata <= X"00000000";
    when 16#0005B# => romdata <= X"00000000";
    when 16#0005C# => romdata <= X"00000000";
    when others => romdata <= (others => '-');
    end case;
  end process;
  -- pragma translate_off
  bootmsg : report_version 
  generic map ("ahbrom" & tost(hindex) &
  ": 32-bit AHB ROM Module,  " & tost(bytes/4) & " words, " & tost(abits-2) & " address bits" );
  -- pragma translate_on
  end;

