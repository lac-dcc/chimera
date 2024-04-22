
-- Modeled after altera demo usb api

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEG7_LUT is
  PORT(
	clk50 : in std_logic;
	seg : out std_logic_vector( 6 downto 0 );
	dig : in std_logic_vector( 3 downto 0 )
      );
--reg		[6:0]	oSEG;
end SEG7_LUT;

architecture rtl of SEG7_LUT is
begin
  process(dig)
  begin
    case dig(3 downto 0) is
      when x"1" =>
	seg <= "1111001";	
      when x"2" =>
	seg <= "0100100";
      when x"3" =>
	seg <= "0110000";
      when x"4" =>
	seg <= "0011001";
      when x"5" =>
	seg <= "0010010";
      when x"6" =>
	seg <= "0000010";
      when x"7" =>
	seg <= "1111000";
      when x"8" =>
	seg <= "0000000";
      when x"9" =>
	seg <= "0011000";
      when x"a" =>
	seg <= "0001000";
      when x"b" =>
	seg <= "0000011";
      when x"c" =>
	seg <= "1000110";
      when x"d" =>
	seg <= "0100001";
      when x"e" =>
	seg <= "0000110";
      when x"f" =>
	seg <= "0001110";
      when x"0" =>
	seg <= "1000000";
    end case;
  end process;

end rtl; 

