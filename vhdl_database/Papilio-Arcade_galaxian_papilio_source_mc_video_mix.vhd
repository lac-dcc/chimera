------------------------------------------------------------------------------
-- FPGA MOONCRESTA VIDO-MIX
--
-- Version : 1.00
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_VIDEO_MIX is
port (
	I_VID_R    : in std_logic_vector(2 downto 0);
	I_VID_G    : in std_logic_vector(2 downto 0);
	I_VID_B    : in std_logic_vector(1 downto 0);
	I_STR_R    : in std_logic_vector(2 downto 0);
	I_STR_G    : in std_logic_vector(2 downto 0);
	I_STR_B    : in std_logic_vector(1 downto 0);

	I_C_BLnXX  : in  std_logic;
	I_C_BLX    : in  std_logic;
	I_MISSILEn : in  std_logic;
	I_SHELLn   : in  std_logic;

	O_R        : out std_logic_vector(2 downto 0);
	O_G        : out std_logic_vector(2 downto 0);
	O_B        : out std_logic_vector(1 downto 0)
);
end;

architecture RTL of MC_VIDEO_MIX is
	-- MISSILE => Yellow ;
	-- SHELL   => White  ;
	signal W_MS_D : std_logic := '0';
	signal W_MS_R : std_logic := '0';
	signal W_MS_G : std_logic := '0';
	signal W_MS_B : std_logic := '0';
begin
	W_MS_D <= not (I_MISSILEn and I_SHELLn);
	W_MS_R <= not    I_C_BLX  and W_MS_D;
	W_MS_G <= not    I_C_BLX  and W_MS_D;
	W_MS_B <= not    I_C_BLX  and W_MS_D and not I_SHELLn ;

	O_R <= I_VID_R or I_STR_R or ("0" & W_MS_R & W_MS_R) when I_C_BLnXX = '1' else "000";
	O_G <= I_VID_G or I_STR_G or ("0" & W_MS_G & W_MS_G) when I_C_BLnXX = '1' else "000";
	O_B <= I_VID_B or I_STR_B or (      W_MS_B & W_MS_B) when I_C_BLnXX = '1' else "00";
end;