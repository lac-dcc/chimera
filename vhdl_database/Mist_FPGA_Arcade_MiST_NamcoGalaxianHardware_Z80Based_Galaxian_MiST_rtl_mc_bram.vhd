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

--  mc_top.v use
entity MC_CPU_RAM is
	port (
		I_CLK  : in  std_logic;
		I_CS   : in  std_logic;
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
	O_D <= W_D when I_OE ='1' else (others=>'0');

	ram_inst : work.spram generic map(10,8)
	port map
	(
		address  => I_ADDR,
		clock    => I_CLK,
		data     => I_D,
		wren		=> I_WE and I_CS,
		q			=> W_D
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

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

	ram_inst : work.dpram generic map(8,8)
	port map
	(
		clock_a		=> I_CLKA,
		address_a	=> I_ADDRA,
		data_a		=> I_DA,
		q_a			=> O_DA,
		enable_a    => I_CEA,
		wren_a		=> I_WEA,

		clock_b		=> I_CLKB,
		address_b	=> I_ADDRB,
		data_b		=> I_DB,
		q_b			=> O_DB,
		enable_b    => I_CEB,
		wren_b		=> I_WEB
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

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
	ram_inst : work.dpram generic map(10,8)
	port map
	(
		clock_a		=> I_CLKA,
		address_a	=> I_ADDRA,
		data_a		=> I_DA,
		q_a			=> O_DA,
		enable_a    => I_CEA,
		wren_a		=> I_WEA,

		clock_b		=> I_CLKB,
		address_b	=> I_ADDRB,
		data_b		=> I_DB,
		q_b			=> O_DB,
		enable_b    => I_CEB,
		wren_b		=> I_WEB
	);
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

--  mc_video.v use
entity MC_LRAM is
	port (
		I_WCLK  : in  std_logic;
		I_RCLK  : in  std_logic;
		I_ADDR  : in  std_logic_vector(7 downto 0);
		I_D     : in  std_logic_vector(4 downto 0);
		O_Dn    : out std_logic_vector(4 downto 0)
	);
end;

architecture RTL of MC_LRAM is
begin

	ram_inst : work.dpram generic map(8,5)
	port map
	(
		clock_a		=> I_WCLK,
		address_a	=> I_ADDR,
		data_a		=> not I_D,
		wren_a		=> '1',

		clock_b		=> not I_RCLK,
		address_b	=> I_ADDR,
		data_b		=> (others => '0'),
		q_b			=> O_Dn,
		enable_b    => '1',
		wren_b		=> '0'
	);
end RTL;
