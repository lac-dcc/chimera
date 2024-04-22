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