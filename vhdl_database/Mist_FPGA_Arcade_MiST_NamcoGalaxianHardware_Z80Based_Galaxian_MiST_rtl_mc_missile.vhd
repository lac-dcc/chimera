--------------------------------------------------------------------------------
---- FPGA MOONCRESTA VIDEO-MISSILE
----
---- Version : 2.00
----
---- Copyright(c) 2004 Katsumi Degawa , All rights reserved
----
---- Important !
----
---- This program is freeware for non-commercial use. 
---- The author does not guarantee this program.
---- You can use this at your own risk.
----
---- 2004- 9-22 The problem which missile didn't sometimes come out from was improved.
--------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity MC_MISSILE is
	port(
		I_CLK_6M    : in std_logic;
		I_C_BLn_X   : in std_logic;
		I_MLDn      : in std_logic;
		I_SLDn      : in std_logic;
		I_HPOS      : in std_logic_vector (7 downto 0);

		O_MISSILEn  : out std_logic;
		O_SHELLn    : out std_logic
	);
end;

architecture RTL of MC_MISSILE is
	signal W_45R_Q   : std_logic_vector (7 downto 0) := (others => '0');
	signal W_45S_Q   : std_logic_vector (7 downto 0) := (others => '0');
	signal W_5P1_Q   : std_logic := '0';
	signal W_5P2_Q   : std_logic := '0';
	signal W_5P1_CLK : std_logic := '0';
	signal W_5P2_CLK : std_logic := '0';
begin

	O_MISSILEn <= W_5P1_CLK;
	O_SHELLn   <= W_5P2_CLK;

	-- missile counter
	process(I_CLK_6M)
	begin
		if falling_edge(I_CLK_6M) then
			if (I_MLDn = '0') then
				W_45R_Q <= I_HPOS;
			else
				if (I_C_BLn_X = '1') then
					W_45R_Q <= W_45R_Q + 1;
					if (W_45R_Q(7 downto 2) = "111111") and W_5P1_Q = '1' then
						W_5P1_CLK <= '0';
					else
						W_5P1_CLK <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;

	-- shell counter
	process(I_CLK_6M)
	begin
		if falling_edge(I_CLK_6M) then
			if(I_SLDn = '0') then
				W_45S_Q <= I_HPOS;
			else
				if(I_C_BLn_X = '1') then
					W_45S_Q <= W_45S_Q + 1;
					if (W_45S_Q(7 downto 2) = "111111") and W_5P2_Q = '1' then
						W_5P2_CLK <= '0';
					else
						W_5P2_CLK <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;

	-- Standard D-type flip-flop with D input tied low, async active
	-- low preset (I_MLDn) and clock active on rising edge (W_5P1_CLK)
	process(W_5P1_CLK, I_MLDn)
	begin
		if (I_MLDn = '0') then
			W_5P1_Q <= '1';
		elsif rising_edge(W_5P1_CLK) then
			W_5P1_Q <= '0';
		end if;
	end process;

	-- Standard D-type flip-flop with D input tied low, async active
	-- low preset (I_SLDn) and clock active on rising edge (W_5P2_CLK)
	process(W_5P2_CLK, I_SLDn)
	begin
		if (I_SLDn = '0') then
			W_5P2_Q <= '1';
		elsif rising_edge(W_5P2_CLK) then
			W_5P2_Q <= '0';
		end if;
	end process;

end RTL;