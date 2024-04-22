------------------------------------------------------------------------------
-- FPGA MOONCRESTA STARS
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
------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity MC_STARS is
	port (
		I_CLK_12M     : in  std_logic;
		I_CLK_6M      : in  std_logic;
		I_H_FLIP      : in  std_logic;
		I_V_SYNC      : in  std_logic;
		I_8HF         : in  std_logic;
		I_256HnX      : in  std_logic;
		I_1VF         : in  std_logic;
		I_2V          : in  std_logic;
		I_STARS_ON    : in  std_logic;
		I_STARS_OFFn  : in  std_logic;

		O_R           : out std_logic_vector(1 downto 0);
		O_G           : out std_logic_vector(1 downto 0);
		O_B           : out std_logic_vector(1 downto 0);
		O_NOISE       : out std_logic
	);
end;

architecture RTL of MC_STARS is
	signal CLK_1C           : std_logic := '0';
	signal W_2D_Qn          : std_logic := '0';
	
	signal W_3B             : std_logic := '0';
	signal noise            : std_logic := '0';
	signal W_2A             : std_logic := '0';
	signal W_4P             : std_logic := '0';
	signal CLK_1AB          : std_logic := '0';
	signal W_1AB_Q          : std_logic_vector(15 downto 0) := (others => '0');
	signal W_1C_Q           : std_logic_vector( 1 downto 0) := (others => '0');
begin
	O_R       <= (W_1AB_Q( 9) & W_1AB_Q (8) ) when (W_2A = '0' and W_4P = '0') else (others => '0');
	O_G       <= (W_1AB_Q(11) & W_1AB_Q(10) ) when (W_2A = '0' and W_4P = '0') else (others => '0');
	O_B       <= (W_1AB_Q(13) & W_1AB_Q(12) ) when (W_2A = '0' and W_4P = '0') else (others => '0');

	CLK_1C    <= not (I_CLK_12M and (not I_CLK_6M )and (not I_V_SYNC) and I_256HnX);
	CLK_1AB   <= not (CLK_1C or (not (I_H_FLIP or W_1C_Q(1))));
	W_3B      <= W_2D_Qn xor W_1AB_Q(4);

	W_2A      <= '0' when (W_1AB_Q(7 downto 0) = x"ff") else '1';
	W_4P      <= not (( I_8HF xor I_1VF ) and W_2D_Qn and I_STARS_OFFn);

	O_NOISE   <= noise ;

	process(I_2V)
	begin
		if rising_edge(I_2V) then
			noise <= W_2D_Qn;
		end if;
	end process;

	process(CLK_1C, I_V_SYNC)
	begin
		if(I_V_SYNC = '1') then
			W_1C_Q <= (others => '0');
		elsif rising_edge(CLK_1C) then
			W_1C_Q <= W_1C_Q(0) & '1';
		end if;
	end process;

	process(CLK_1AB, I_STARS_ON)
	begin
		if(I_STARS_ON = '0') then
			W_1AB_Q <= (others => '0');
			W_2D_Qn <= '1';
		elsif rising_edge(CLK_1AB) then
			W_1AB_Q <= W_1AB_Q(14 downto 0) & W_3B;
			W_2D_Qn <= not W_1AB_Q(15);
		end if;
	end process;
end RTL;
