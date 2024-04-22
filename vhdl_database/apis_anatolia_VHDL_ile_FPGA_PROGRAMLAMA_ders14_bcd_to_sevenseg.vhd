library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_sevenseg is
port (
bcd_i		: in std_logic_vector (3 downto 0);
sevenseg_o	: out std_logic_vector (7 downto 0)
);
end bcd_to_sevenseg;

architecture Behavioral of bcd_to_sevenseg is

begin

process (bcd_i) begin

	case bcd_i is
		
		when "0000" =>			
			sevenseg_o	<= "00000011"; -- CACBCCCDCECFCGDP
			
		when "0001" =>		
			sevenseg_o	<= "10011111"; -- CACBCCCDCECFCGDP
			
		when "0010" =>		
			sevenseg_o	<= "00100101"; -- CACBCCCDCECFCGDP
			
		when "0011" =>
			sevenseg_o	<= "00001101"; -- CACBCCCDCECFCGDP
			
		when "0100" =>
			sevenseg_o	<= "10011001"; -- CACBCCCDCECFCGDP
			
		when "0101" =>
			sevenseg_o	<= "01001001"; -- CACBCCCDCECFCGDP
			
		when "0110" =>
			sevenseg_o	<= "01000001"; -- CACBCCCDCECFCGDP
			
		when "0111" =>
			sevenseg_o	<= "00011111"; -- CACBCCCDCECFCGDP
			
		when "1000" =>
			sevenseg_o	<= "00000001"; -- CACBCCCDCECFCGDP
			
		when "1001" =>
			sevenseg_o	<= "00001001"; -- CACBCCCDCECFCGDP
			
		when others =>
			sevenseg_o	<= "11111111"; -- CACBCCCDCECFCGDP
		
	end case;

end process;

end Behavioral;