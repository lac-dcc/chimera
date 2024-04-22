------------------------------------------------------------------------------
-- FPGA MOONCRESTA & GALAXIAN
--      FPGA BLOCK RAM I/F (XILINX SPARTAN)
--
-- Version : 2.50
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use. 
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- mc_col_rom(6L) added by k.Degawa
--
-- 2004- 5- 6  first release.
-- 2004- 8-23  Improvement with T80-IP.    K.Degawa
-- 2004- 9-18  added Xilinx Device         K.Degawa
------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

--  mc_top.v use
entity MC_CPU_RAM is
	port (
		I_CLK  : in  std_logic;
		I_ADDR : in  std_logic_vector(9 downto 0);
		I_D    : in  std_logic_vector(7 downto 0);
		I_WE   : in  std_logic;
		I_OE   : in  std_logic;
		O_D    : out std_logic_vector(7 downto 0)
	);
end;
architecture RTL of MC_CPU_RAM is

	signal W_D : std_logic_vector(7 downto 0) := (others => '0');
begin
	O_D <= x"00" when I_OE ='0' else W_D;

	CPURAM : RAMB16_S9
	port map (
		CLK              => I_CLK,
		ADDR(10)         => '0',
		ADDR(9 downto 0) => I_ADDR,
		DI               => I_D,
		DIP              => "0",
		DO               => W_D,
		DOP              => open,
		EN               => '1',
		WE               => I_WE,
		SSR              => '0'
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

--  mc_video.v use
entity MC_OBJ_RAM is
	port(
		I_CLKA  : in  std_logic := '0';
		I_WEA   : in  std_logic := '0';
		I_CEA   : in  std_logic := '0';
		I_ADDRA : in  std_logic_vector(7 downto 0);
		I_DA    : in  std_logic_vector(7 downto 0);
		O_DA    : out std_logic_vector(7 downto 0);

		I_CLKB  : in  std_logic := '0';
		I_WEB   : in  std_logic := '0';
		I_CEB   : in  std_logic := '0';
		I_ADDRB : in  std_logic_vector(7 downto 0);
		I_DB    : in  std_logic_vector(7 downto 0);
		O_DB    : out std_logic_vector(7 downto 0)
	);
	end;

architecture RTL of MC_OBJ_RAM is
begin

	OBJRAM : RAMB16_S9_S9
	port map(
		CLKA               => I_CLKA,
		ADDRA(10 downto 8) => "000",
		ADDRA(7 downto 0)  => I_ADDRA,
		DIA                => I_DA,
		DIPA               => "0",
		DOA                => O_DA,
		DOPA               => open,
		ENA                => I_CEA,
		WEA                => I_WEA,
		SSRA               => '0',

		CLKB               => I_CLKB,
		ADDRB(10 downto 8) => "000",
		ADDRB(7 downto 0)  => I_ADDRB,
		DIB                => I_DB,
		DIPB               => "0",
		DOB                => O_DB,
		DOPB               => open,
		ENB                => I_CEB,
		WEB                => I_WEB,
		SSRB               => '0'
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

--  mc_video.v use
entity MC_VID_RAM is
	port (
		I_CLKA  : in  std_logic := '0';
		I_WEA   : in  std_logic := '0';
		I_CEA   : in  std_logic := '0';
		I_ADDRA : in  std_logic_vector(9 downto 0);
		I_DA    : in  std_logic_vector(7 downto 0);
		O_DA    : out std_logic_vector(7 downto 0);

		I_CLKB  : in  std_logic := '0';
		I_WEB   : in  std_logic := '0';
		I_CEB   : in  std_logic := '0';
		I_ADDRB : in  std_logic_vector(9 downto 0);
		I_DB    : in  std_logic_vector(7 downto 0);
		O_DB    : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of MC_VID_RAM is
begin
	VIDRAM : RAMB16_S9_S9
	port map (
		CLKA              => I_CLKA,
		ADDRA(10)         => '0',
		ADDRA(9 downto 0) => I_ADDRA,
		DIA               => I_DA,
		DIPA              => "0",
		DOA               => O_DA,
		DOPA              => open,
		ENA               => I_CEA,
		WEA               => I_WEA,
		SSRA              => '0',

		CLKB              => I_CLKB,
		ADDRB(10)         => '0',
		ADDRB(9 downto 0) => I_ADDRB,
		DIB               => I_DB,
		DIPB              => "0",
		DOB               => O_DB,
		DOPB              => open,
		ENB               => I_CEB,
		WEB               => I_WEB,
		SSRB              => '0'
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

--  mc_video.v use
entity MC_LRAM is
	port (
		I_CLK   : in  std_logic;
		I_ADDR  : in  std_logic_vector(7 downto 0);
		I_D     : in  std_logic_vector(4 downto 0);
		I_WE    : in  std_logic;
		O_Dn    : out std_logic_vector(4 downto 0)
	);
end;

architecture RTL of MC_LRAM is
	signal W_D  : std_logic_vector(7 downto 0) := (others => '0');
begin

	process(I_CLK)
	begin
		if falling_edge(I_CLK) then
			O_Dn <= not W_D(4 downto 0);
		end if;
	end process;

	LRAM : RAMB16_S9
	port map (
		CLK               => I_CLK,
		ADDR(10 downto 8) => "000",
		ADDR(7 downto 0)  => I_ADDR,
		DI(7 downto 5)    => "000",
		DI(4 downto 0)    => I_D,
		DIP               => "0",
		DO                => W_D,
		DOP               => open,
		EN                => '1',
		WE                => I_WE,
		SSR               => '0'
	);
end RTL;