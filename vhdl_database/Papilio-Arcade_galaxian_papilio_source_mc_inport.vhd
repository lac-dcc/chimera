-----------------------------------------------------------------------
-- FPGA MOONCRESTA INPORT
--
-- Version : 1.01
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important !
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004-4-30  galaxian modify by K.DEGAWA
-----------------------------------------------------------------------

--    DIP SW        0     1     2     3     4     5
-----------------------------------------------------------------
--  COIN CHUTE
-- 1 COIN/1 PLAY   1'b0  1'b0
-- 2 COIN/1 PLAY   1'b1  1'b0
-- 1 COIN/2 PLAY   1'b0  1'b1
-- FREE PLAY       1'b1  1'b1
--   BOUNS
--                             1'b0  1'b0
--                             1'b1  1'b0
--                             1'b0  1'b1
--                             1'b1  1'b1
--   LIVES
--     2                                   1'b0
--     3                                   1'b1
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_INPORT is
port (
	I_COIN1    : in  std_logic;   --  active high
	I_COIN2    : in  std_logic;   --  active high
	I_1P_LE    : in  std_logic;   --  active high
	I_1P_RI    : in  std_logic;   --  active high
	I_1P_SH    : in  std_logic;   --  active high
	I_2P_LE    : in  std_logic;
	I_2P_RI    : in  std_logic;
	I_2P_SH    : in  std_logic;
	I_1P_START : in  std_logic;   --  active high
	I_2P_START : in  std_logic;   --  active high
	I_SW0_OEn  : in  std_logic;
	I_SW1_OEn  : in  std_logic;
	I_DIP_OEn  : in  std_logic;
	O_D        : out std_logic_vector(7 downto 0)
);

end;

architecture RTL of MC_INPORT is

signal W_TABLE : std_logic := '0';   --  UP TYPE = 0;

	signal W_SW0_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SW1_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal W_DIP_DO : std_logic_vector(7 downto 0) := (others => '0');

begin

	W_SW0_DO <= x"00" when I_SW0_OEn = '1' else "00" &  W_TABLE &  I_1P_SH &  I_1P_RI &  I_1P_LE &    I_COIN2 &    I_COIN1;
	W_SW1_DO <= x"00" when I_SW1_OEn = '1' else "000"           &  I_2P_SH &  I_2P_RI &  I_2P_LE & I_2P_START & I_1P_START;
	W_DIP_DO <= x"00" when I_DIP_OEn = '1' else "00000100";
	O_D      <= W_SW0_DO or W_SW1_DO or W_DIP_DO ;

end RTL;