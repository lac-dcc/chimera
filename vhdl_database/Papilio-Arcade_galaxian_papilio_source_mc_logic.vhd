-------------------------------------------------------------------------------
-- FPGA MOONCRESTA    LOGIC IP MODULE
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
-------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- 74xx138
-- 3-to-8 line decoder
-------------------------------------------------------------------------------
entity LOGIC_74XX138 is
	port (
		I_G1  : in  std_logic;
		I_G2a : in  std_logic;
		I_G2b : in  std_logic;
		I_Sel : in  std_logic_vector(2 downto 0);
		O_Q   : out std_logic_vector(7 downto 0)
	);
end logic_74xx138;

architecture RTL of LOGIC_74XX138 is
	signal I_G : std_logic_vector(2 downto 0) := (others => '0');

begin
	I_G <= I_G1 & I_G2a & I_G2b;

	xx138 : process(I_G, I_Sel)
	begin
		if(I_G = "100" ) then
			case I_Sel is
				when "000" => O_Q <= "11111110";
				when "001" => O_Q <= "11111101";
				when "010" => O_Q <= "11111011";
				when "011" => O_Q <= "11110111";
				when "100" => O_Q <= "11101111";
				when "101" => O_Q <= "11011111";
				when "110" => O_Q <= "10111111";
				when "111" => O_Q <= "01111111";
				when others => null;
			end case;
		 else
				O_Q <= (others => '1');
		 end if;
	end process;
end RTL;

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- 74xx139
-- 2-to-4 line decoder
-------------------------------------------------------------------------------
entity LOGIC_74XX139 is
	port (
		I_G   : in  std_logic;
		I_Sel : in  std_logic_vector(1 downto 0);
		O_Q   : out std_logic_vector(3 downto 0)
	);
end;

architecture RTL of LOGIC_74XX139 is
begin
	xx139 : process (I_G, I_Sel)
	begin
		if I_G = '0' then
			case I_Sel is
				when "00" => O_Q <= "1110";
				when "01" => O_Q <= "1101";
				when "10" => O_Q <= "1011";
				when "11" => O_Q <= "0111";
				when others => null;
			end case;
		else
			O_Q <= "1111";
		end if;
	end process;
end RTL;
