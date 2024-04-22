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
  use work.mc_pack.all;

entity MC_INPORT is
port (
	I_HWSEL    : in  integer;
	I_TABLE    : in  std_logic;   -- UP = 0
	I_TEST     : in  std_logic;
	I_SERVICE  : in  std_logic;
	I_SW1_67   : in  std_logic_vector(1 downto 0);
	I_COIN1    : in  std_logic;   --  active high
	I_COIN2    : in  std_logic;   --  active high
	I_1P_LE    : in  std_logic;   --  active high
	I_1P_RI    : in  std_logic;   --  active high
	I_1P_UP    : in  std_logic;   --  active high
	I_1P_DN    : in  std_logic;   --  active high
	I_1P_SH    : in  std_logic;   --  active high
	I_2P_LE    : in  std_logic;
	I_2P_RI    : in  std_logic;
	I_2P_UP    : in  std_logic;
	I_2P_DN    : in  std_logic;
	I_2P_SH    : in  std_logic;
	I_1P_START : in  std_logic;   --  active high
	I_2P_START : in  std_logic;   --  active high
	I_SW0_OE   : in  std_logic;
	I_SW1_OE   : in  std_logic;
	I_DIP_OE   : in  std_logic;
	I_DIP      : in  std_logic_vector(7 downto 0);
	I_SPEECH_DIP : in std_logic;
	I_RAND     : in  std_logic;   --  for kingball noise check
	O_D        : out std_logic_vector(7 downto 0)
);

end;

architecture RTL of MC_INPORT is

	signal W_SW0_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SW1_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal W_DIP_DO : std_logic_vector(7 downto 0) := (others => '0');

	signal W_SW0    : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SW1    : std_logic_vector(7 downto 0) := (others => '0');

begin

	ioports: process (I_HWSEL, I_COIN1, I_COIN2, I_1P_START, I_2P_START, I_SERVICE, I_TEST, I_TABLE,
	                  I_1P_LE, I_1P_RI, I_1P_DN, I_1P_UP, I_1P_SH,
	                  I_2P_LE, I_2P_RI, I_2P_DN, I_2P_UP, I_2P_SH,
	                  I_SW0_OE, W_SW0, I_SW1_OE, W_SW1, W_SW0_DO, W_SW1_DO, I_DIP_OE, W_DIP_DO,
                    I_SW1_67, I_DIP, I_RAND, I_SPEECH_DIP)
	begin
		if I_HWSEL = HW_AZURIAN then
			W_SW0 <= '0'  & I_1P_SH & I_1P_SH & I_COIN1 & I_1P_LE & I_1P_RI & I_1P_UP  & I_1P_DN;
			W_SW1 <= I_SW1_67 & I_1P_LE & I_1P_RI & I_2P_UP & I_2P_DN & I_2P_START & I_1P_START;
		elsif I_HWSEL = HW_DEVILFSH or I_HWSEL = HW_TRIPLEDR then
			W_SW0 <= I_1P_UP & I_2P_UP &  I_1P_DN &  I_1P_SH &  I_1P_RI & I_1P_LE & I_COIN2    & I_COIN1;
			W_SW1 <= "01"              &  I_2P_DN &  I_2P_SH &  I_2P_RI & I_2P_LE & I_2P_START & I_1P_START;
		elsif I_HWSEL = HW_MRDONIGH then
			W_SW0 <= I_SERVICE & I_TEST &  I_TABLE &  I_1P_SH &  I_1P_RI & I_1P_LE & I_COIN2    & I_COIN1;
			W_SW1 <= "000"                         &  I_1P_SH &  I_1P_DN & I_1P_UP & I_2P_START & I_1P_START;
		elsif I_HWSEL = HW_ORBITRON or I_HWSEL = HW_VICTORY or I_HWSEL = HW_WAROFBUG then
			W_SW0 <= I_1P_UP & I_1P_DN &  I_2P_DN  &  I_1P_SH &  I_1P_RI &  I_1P_LE &    I_COIN2 &    I_COIN1;
			W_SW1 <= I_2P_UP &     "1" & "0"       &  I_1P_SH &  I_1P_RI &  I_1P_LE & I_2P_START & I_1P_START;
		elsif I_HWSEL = HW_ZIGZAG then
			W_SW0 <= '0' & I_1P_DN & I_1P_UP &  I_1P_SH &  I_1P_RI & I_1P_LE & I_COIN2 & I_COIN1;
			W_SW1 <= "000000" & I_2P_START & I_1P_START;
		else
			W_SW0 <= I_SERVICE & I_TEST &  I_TABLE &  I_1P_SH &  I_1P_RI & I_1P_LE & I_COIN2    & I_COIN1;
			W_SW1 <= I_SW1_67 & '0'                &  I_2P_SH &  I_2P_RI & I_2P_LE & I_2P_START & I_1P_START;
		end if;

		if I_HWSEL = HW_KINGBAL then
			if I_SPEECH_DIP = '1' then
				W_SW0(6) <= '1'; -- Speech enable
			end if;
			W_SW1(5) <= I_RAND; -- kingball checks for randomness at $2529
		end if;

		if I_SW0_OE = '0' then W_SW0_DO <= x"00"; else W_SW0_DO <= W_SW0; end if;
		if I_SW1_OE = '0' then W_SW1_DO <= x"00"; else W_SW1_DO <= W_SW1; end if;
		if I_DIP_OE = '0' then W_DIP_DO <= x"00"; else W_DIP_DO <= I_DIP; end if;

		O_D      <= W_SW0_DO or W_SW1_DO or W_DIP_DO ;
	end process;

end RTL;