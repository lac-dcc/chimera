-------------------------------------------------------------------------------
-- FPGA MOONCRESTA COLOR-PALETTE
--
-- Version : 2.00
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004- 9-18 added Xilinx Device.  K.Degawa
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;

entity MC_COL_PAL is
port (
	I_CLK_6M     : in  std_logic;
	I_VID        : in  std_logic_vector(1 downto 0);
	I_COL        : in  std_logic_vector(2 downto 0);

	O_R          : out std_logic_vector(2 downto 0);
	O_G          : out std_logic_vector(2 downto 0);
	O_B          : out std_logic_vector(2 downto 0)
);
end;

architecture RTL of MC_COL_PAL is
	---    Parts 6M    --------------------------------------------------------
	signal W_COL_ROM_DO : std_logic_vector(7 downto 0);

begin
	
clut : entity work.col
	port map (
		clk		=> I_CLK_6M,
		addr	=> I_COL(2 downto 0) & I_VID(1 downto 0),
		data			=> W_COL_ROM_DO
	);
	---    VID OUT     --------------------------------------------------------
	O_R <= W_COL_ROM_DO(2 downto 0);
	O_G <= W_COL_ROM_DO(5 downto 3);
	O_B <= W_COL_ROM_DO(7 downto 6) & "0";

end;
