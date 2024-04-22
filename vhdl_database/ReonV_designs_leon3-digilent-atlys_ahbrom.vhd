
----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2010 Aeroflex Gaisler
----------------------------------------------------------------------------
-- Entity: 	ahbrom
-- File:	ahbrom.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	AHB rom. 0/1-waitstate read
----------------------------------------------------------------------------
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
constant abits : integer := 10;
constant bytes : integer := 976;

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
    when 16#00000# => romdata <= X"821020C0";
    when 16#00001# => romdata <= X"81884000";
    when 16#00002# => romdata <= X"01000000";
    when 16#00003# => romdata <= X"01000000";
    when 16#00004# => romdata <= X"81900000";
    when 16#00005# => romdata <= X"01000000";
    when 16#00006# => romdata <= X"01000000";
    when 16#00007# => romdata <= X"81980000";
    when 16#00008# => romdata <= X"01000000";
    when 16#00009# => romdata <= X"01000000";
    when 16#0000A# => romdata <= X"C0A00040";
    when 16#0000B# => romdata <= X"01000000";
    when 16#0000C# => romdata <= X"01000000";
    when 16#0000D# => romdata <= X"11200000";
    when 16#0000E# => romdata <= X"90122100";
    when 16#0000F# => romdata <= X"821020A2";
    when 16#00010# => romdata <= X"C222200C";
    when 16#00011# => romdata <= X"82102003";
    when 16#00012# => romdata <= X"C2222008";
    when 16#00013# => romdata <= X"11000000";
    when 16#00014# => romdata <= X"90122344";
    when 16#00015# => romdata <= X"40000091";
    when 16#00016# => romdata <= X"01000000";
    when 16#00017# => romdata <= X"113FFC00";
    when 16#00018# => romdata <= X"90122200";
    when 16#00019# => romdata <= X"82102018";
    when 16#0001A# => romdata <= X"C2222004";
    when 16#0001B# => romdata <= X"9010202E";
    when 16#0001C# => romdata <= X"40000080";
    when 16#0001D# => romdata <= X"01000000";
    when 16#0001E# => romdata <= X"113FFC00";
    when 16#0001F# => romdata <= X"90122200";
    when 16#00020# => romdata <= X"C2022008";
    when 16#00021# => romdata <= X"80886004";
    when 16#00022# => romdata <= X"02BFFFFC";
    when 16#00023# => romdata <= X"01000000";
    when 16#00024# => romdata <= X"9010202E";
    when 16#00025# => romdata <= X"40000077";
    when 16#00026# => romdata <= X"01000000";
    when 16#00027# => romdata <= X"113FFC00";
    when 16#00028# => romdata <= X"90122100";
    when 16#00029# => romdata <= X"13208821";
    when 16#0002A# => romdata <= X"92126091";
    when 16#0002B# => romdata <= X"D2220000";
    when 16#0002C# => romdata <= X"1300B140";
    when 16#0002D# => romdata <= X"D2222008";
    when 16#0002E# => romdata <= X"92102100";
    when 16#0002F# => romdata <= X"D222200C";
    when 16#00030# => romdata <= X"130011C0";
    when 16#00031# => romdata <= X"92126004";
    when 16#00032# => romdata <= X"D2222010";
    when 16#00033# => romdata <= X"13208821";
    when 16#00034# => romdata <= X"92126091";
    when 16#00035# => romdata <= X"03000040";
    when 16#00036# => romdata <= X"92124001";
    when 16#00037# => romdata <= X"D2220000";
    when 16#00038# => romdata <= X"9010202E";
    when 16#00039# => romdata <= X"40000063";
    when 16#0003A# => romdata <= X"01000000";
    when 16#0003B# => romdata <= X"40000051";
    when 16#0003C# => romdata <= X"01000000";
    when 16#0003D# => romdata <= X"40000081";
    when 16#0003E# => romdata <= X"01000000";
    when 16#0003F# => romdata <= X"9010202E";
    when 16#00040# => romdata <= X"4000005C";
    when 16#00041# => romdata <= X"01000000";
    when 16#00042# => romdata <= X"40000070";
    when 16#00043# => romdata <= X"01000000";
    when 16#00044# => romdata <= X"9010202E";
    when 16#00045# => romdata <= X"40000057";
    when 16#00046# => romdata <= X"01000000";
    when 16#00047# => romdata <= X"A2100000";
    when 16#00048# => romdata <= X"A4100000";
    when 16#00049# => romdata <= X"A6103FFF";
    when 16#0004A# => romdata <= X"40000074";
    when 16#0004B# => romdata <= X"01000000";
    when 16#0004C# => romdata <= X"80A460A0";
    when 16#0004D# => romdata <= X"22800002";
    when 16#0004E# => romdata <= X"90100000";
    when 16#0004F# => romdata <= X"80A22000";
    when 16#00050# => romdata <= X"1280000B";
    when 16#00051# => romdata <= X"A404A001";
    when 16#00052# => romdata <= X"80A4A010";
    when 16#00053# => romdata <= X"24800008";
    when 16#00054# => romdata <= X"A4100000";
    when 16#00055# => romdata <= X"80A4FFFF";
    when 16#00056# => romdata <= X"32800005";
    when 16#00057# => romdata <= X"A4100000";
    when 16#00058# => romdata <= X"A534A001";
    when 16#00059# => romdata <= X"A6244012";
    when 16#0005A# => romdata <= X"A4100000";
    when 16#0005B# => romdata <= X"4000003D";
    when 16#0005C# => romdata <= X"01000000";
    when 16#0005D# => romdata <= X"80A460A0";
    when 16#0005E# => romdata <= X"A2046001";
    when 16#0005F# => romdata <= X"12BFFFEB";
    when 16#00060# => romdata <= X"01000000";
    when 16#00061# => romdata <= X"80A4FFFF";
    when 16#00062# => romdata <= X"02800022";
    when 16#00063# => romdata <= X"01000000";
    when 16#00064# => romdata <= X"11000000";
    when 16#00065# => romdata <= X"9012234F";
    when 16#00066# => romdata <= X"40000040";
    when 16#00067# => romdata <= X"01000000";
    when 16#00068# => romdata <= X"9134E004";
    when 16#00069# => romdata <= X"40000033";
    when 16#0006A# => romdata <= X"90022030";
    when 16#0006B# => romdata <= X"900CE00F";
    when 16#0006C# => romdata <= X"80A2200A";
    when 16#0006D# => romdata <= X"90022030";
    when 16#0006E# => romdata <= X"36800002";
    when 16#0006F# => romdata <= X"90022027";
    when 16#00070# => romdata <= X"4000002C";
    when 16#00071# => romdata <= X"01000000";
    when 16#00072# => romdata <= X"4000001A";
    when 16#00073# => romdata <= X"01000000";
    when 16#00074# => romdata <= X"4000004A";
    when 16#00075# => romdata <= X"01000000";
    when 16#00076# => romdata <= X"80A4E000";
    when 16#00077# => romdata <= X"02800006";
    when 16#00078# => romdata <= X"01000000";
    when 16#00079# => romdata <= X"4000001F";
    when 16#0007A# => romdata <= X"01000000";
    when 16#0007B# => romdata <= X"10BFFFF9";
    when 16#0007C# => romdata <= X"A624E001";
    when 16#0007D# => romdata <= X"11000000";
    when 16#0007E# => romdata <= X"90122360";
    when 16#0007F# => romdata <= X"40000027";
    when 16#00080# => romdata <= X"01000000";
    when 16#00081# => romdata <= X"03380000";
    when 16#00082# => romdata <= X"81C04000";
    when 16#00083# => romdata <= X"01000000";
    when 16#00084# => romdata <= X"11000000";
    when 16#00085# => romdata <= X"90122368";
    when 16#00086# => romdata <= X"40000020";
    when 16#00087# => romdata <= X"01000000";
    when 16#00088# => romdata <= X"40000004";
    when 16#00089# => romdata <= X"01000000";
    when 16#0008A# => romdata <= X"10BFFFF7";
    when 16#0008B# => romdata <= X"01000000";
    when 16#0008C# => romdata <= X"03200000";
    when 16#0008D# => romdata <= X"113FFC00";
    when 16#0008E# => romdata <= X"90122100";
    when 16#0008F# => romdata <= X"1300B140";
    when 16#00090# => romdata <= X"92124001";
    when 16#00091# => romdata <= X"D2222008";
    when 16#00092# => romdata <= X"82102014";
    when 16#00093# => romdata <= X"82A06001";
    when 16#00094# => romdata <= X"12BFFFFF";
    when 16#00095# => romdata <= X"01000000";
    when 16#00096# => romdata <= X"81C3E008";
    when 16#00097# => romdata <= X"01000000";
    when 16#00098# => romdata <= X"0300003F";
    when 16#00099# => romdata <= X"821063FF";
    when 16#0009A# => romdata <= X"10BFFFF3";
    when 16#0009B# => romdata <= X"01000000";
    when 16#0009C# => romdata <= X"03200000";
    when 16#0009D# => romdata <= X"82106100";
    when 16#0009E# => romdata <= X"C2006004";
    when 16#0009F# => romdata <= X"80886004";
    when 16#000A0# => romdata <= X"02BFFFFC";
    when 16#000A1# => romdata <= X"03200000";
    when 16#000A2# => romdata <= X"82106100";
    when 16#000A3# => romdata <= X"D0204000";
    when 16#000A4# => romdata <= X"81C3E008";
    when 16#000A5# => romdata <= X"01000000";
    when 16#000A6# => romdata <= X"9A10000F";
    when 16#000A7# => romdata <= X"92100008";
    when 16#000A8# => romdata <= X"D00A4000";
    when 16#000A9# => romdata <= X"80A20000";
    when 16#000AA# => romdata <= X"02800006";
    when 16#000AB# => romdata <= X"92026001";
    when 16#000AC# => romdata <= X"7FFFFFF0";
    when 16#000AD# => romdata <= X"01000000";
    when 16#000AE# => romdata <= X"10BFFFFA";
    when 16#000AF# => romdata <= X"01000000";
    when 16#000B0# => romdata <= X"81C36008";
    when 16#000B1# => romdata <= X"01000000";
    when 16#000B2# => romdata <= X"11100000";
    when 16#000B3# => romdata <= X"13000000";
    when 16#000B4# => romdata <= X"92126374";
    when 16#000B5# => romdata <= X"94102010";
    when 16#000B6# => romdata <= X"C2024000";
    when 16#000B7# => romdata <= X"92026004";
    when 16#000B8# => romdata <= X"C2220000";
    when 16#000B9# => romdata <= X"94A2A001";
    when 16#000BA# => romdata <= X"12BFFFFC";
    when 16#000BB# => romdata <= X"90022004";
    when 16#000BC# => romdata <= X"81C3E008";
    when 16#000BD# => romdata <= X"01000000";
    when 16#000BE# => romdata <= X"11100000";
    when 16#000BF# => romdata <= X"13000000";
    when 16#000C0# => romdata <= X"92126374";
    when 16#000C1# => romdata <= X"D41A0000";
    when 16#000C2# => romdata <= X"90022008";
    when 16#000C3# => romdata <= X"C2024000";
    when 16#000C4# => romdata <= X"80A0400A";
    when 16#000C5# => romdata <= X"1280000A";
    when 16#000C6# => romdata <= X"C2026004";
    when 16#000C7# => romdata <= X"80A0400B";
    when 16#000C8# => romdata <= X"12800007";
    when 16#000C9# => romdata <= X"92026008";
    when 16#000CA# => romdata <= X"808A2040";
    when 16#000CB# => romdata <= X"02BFFFF6";
    when 16#000CC# => romdata <= X"01000000";
    when 16#000CD# => romdata <= X"81C3E008";
    when 16#000CE# => romdata <= X"90102001";
    when 16#000CF# => romdata <= X"81C3E008";
    when 16#000D0# => romdata <= X"90102000";
    when 16#000D1# => romdata <= X"0D0A4148";
    when 16#000D2# => romdata <= X"42524F4D";
    when 16#000D3# => romdata <= X"3A200020";
    when 16#000D4# => romdata <= X"64647232";
    when 16#000D5# => romdata <= X"5F64656C";
    when 16#000D6# => romdata <= X"6179203D";
    when 16#000D7# => romdata <= X"20307800";
    when 16#000D8# => romdata <= X"2C204F4B";
    when 16#000D9# => romdata <= X"2E0D0A00";
    when 16#000DA# => romdata <= X"4641494C";
    when 16#000DB# => romdata <= X"45440D0A";
    when 16#000DC# => romdata <= X"00000000";
    when 16#000DD# => romdata <= X"12345678";
    when 16#000DE# => romdata <= X"F0C3A596";
    when 16#000DF# => romdata <= X"6789ABCD";
    when 16#000E0# => romdata <= X"A6F1590E";
    when 16#000E1# => romdata <= X"EDCBA987";
    when 16#000E2# => romdata <= X"0F3C5A69";
    when 16#000E3# => romdata <= X"98765432";
    when 16#000E4# => romdata <= X"590EA6F1";
    when 16#000E5# => romdata <= X"FFFF0000";
    when 16#000E6# => romdata <= X"0000FFFF";
    when 16#000E7# => romdata <= X"5AC3FFFF";
    when 16#000E8# => romdata <= X"0000A53C";
    when 16#000E9# => romdata <= X"01510882";
    when 16#000EA# => romdata <= X"F4D908FD";
    when 16#000EB# => romdata <= X"9B6F7A46";
    when 16#000EC# => romdata <= X"C721271D";
    when 16#000ED# => romdata <= X"00000000";
    when 16#000EE# => romdata <= X"00000000";
    when 16#000EF# => romdata <= X"00000000";
    when 16#000F0# => romdata <= X"00000000";
    when 16#000F1# => romdata <= X"00000000";
    when 16#000F2# => romdata <= X"00000000";
    when 16#000F3# => romdata <= X"00000000";
    when 16#000F4# => romdata <= X"00000000";
    when others => romdata <= (others => '-');
    end case;
  end process;
  -- pragma translate_off
  bootmsg : report_version 
  generic map ("ahbrom" & tost(hindex) &
  ": 32-bit AHB ROM Module,  " & tost(bytes/4) & " words, " & tost(abits-2) & " address bits" );
  -- pragma translate_on
  end;
