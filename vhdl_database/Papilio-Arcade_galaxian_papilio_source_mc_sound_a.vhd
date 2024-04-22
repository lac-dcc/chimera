------------------------------------------------------------------------------
-- FPGA MOONCRESTA SOUND I/F
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
	use IEEE.std_logic_arith.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity MC_SOUND_A is
port (
	I_CLK_12M  : in   std_logic;
	I_CLK_6M   : in   std_logic;
	I_H_CNT1   : in   std_logic;
	I_BD       : in   std_logic_vector(7 downto 0);
	I_PITCHn   : in   std_logic;
	I_VOL1     : in   std_logic;
	I_VOL2     : in   std_logic;

	O_SDAT     : out  std_logic_vector(7 downto 0);
	O_DO       : out  std_logic_vector(3 downto 0)
);
end;

architecture RTL of MC_SOUND_A is
	signal W_PITCHn    : std_logic := '0';
	signal W_89K_LDn   : std_logic := '0';
	signal W_89K_Q     : std_logic_vector(7 downto 0) := (others => '0');
	signal W_89K_LDATA : std_logic_vector(7 downto 0) := (others => '0');
	signal W_6T_Q      : std_logic_vector(3 downto 0) := (others => '0');
	signal W_SDAT0     : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SDAT2     : std_logic_vector(7 downto 0) := (others => '0');
	signal W_SDAT3     : std_logic_vector(7 downto 0) := (others => '0');

begin
	O_DO <= W_6T_Q;

	process (I_CLK_12M)
	begin
		if rising_edge(I_CLK_12M)  then
			W_PITCHn  <= I_PITCHn;
	--	W_89K_LDn <= ~(&W_89K_Q[7:0]);
			if (W_89K_Q = x"ff") then
				W_89K_LDn <= '0' ;
			else
				W_89K_LDn <= '1' ;
			end if;
		end if;
	end process;

	-- Parts 9J
	process (W_PITCHn)
	begin
		if rising_edge(W_PITCHn) then
			W_89K_LDATA <= I_BD;
		end if;
	end process;

	process (I_H_CNT1)
	begin
		if rising_edge(I_H_CNT1) then
			if (W_89K_LDn = '0') then
				W_89K_Q <= W_89K_LDATA;
			else
				W_89K_Q <= W_89K_Q + 1;
			end if;
		end if;
	end process;

	process (W_89K_LDn)
	begin
		if falling_edge(W_89K_LDn) then
			W_6T_Q <= W_6T_Q + 1;
		end if;
	end process;

	process (I_CLK_6M)
	begin
		if rising_edge(I_CLK_6M) then
			-- W_SDAT0 <= W_6T_Q[0]==1'b0 ? 8'd0 : 8'd42 ;
			-- W_SDAT2 <= W_6T_Q[2]==1'b0 ? 8'd0 : I_VOL1 ? 8'd105 : 8'd57 ;
			-- W_SDAT3 <= W_6T_Q[3]==1'b0 ? 8'd0 : I_VOL2 ? 8'd72  : 8'd0  ;
			O_SDAT <= (x"14" + W_SDAT3) + (W_SDAT0 + W_SDAT2);

			if W_6T_Q(0)='1' then
				W_SDAT0 <= x"2a";
			else
				W_SDAT0 <= (others => '0');
			end if;

			if W_6T_Q(2)='1' then
				if I_VOL1 = '1' then
					W_SDAT2 <= x"69";
				else
					W_SDAT2 <= x"39";
				end if;
			else
				W_SDAT2 <= (others => '0');
			end if;

			if (W_6T_Q(3)='1') and (I_VOL2 = '1') then
				W_SDAT3 <= x"48" ;
			else
				W_SDAT3 <= (others => '0');
			end if;

		end if;
	end process;

end;