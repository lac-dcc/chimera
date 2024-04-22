LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tracktable is
port(
	wraddr	:in std_logic_vector(9 downto 0);
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;
	
	table	:in std_logic_vector(7 downto 0);
	haddr	:out std_logic_vector(31 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1'
);
end tracktable;
 
architecture rtl of tracktable is
subtype DAT_LAT_TYPE is std_logic_vector(7 downto 0); 
type DAT_LAT_ARRAY is array (natural range <>) of DAT_LAT_TYPE; 
signal	RAM0,RAM1,RAM2,RAM3	:DAT_LAT_ARRAY(0 to 256);
signal	iwaddr	:integer range 0 to 256;
signal	itable	:integer range 0 to 256;

begin

	iwaddr<=conv_integer(wraddr(9 downto 2));
	itable<=conv_integer(table);
	
	process(clk)begin
		if rising_edge(clk) then
			if(ce = '1')then
				if(wr='1')then
					case wraddr(1 downto 0) is
					when "00" =>
						RAM0(iwaddr)<=wrdat;
					when "01" =>
						RAM1(iwaddr)<=wrdat;
					when "10" =>
						RAM2(iwaddr)<=wrdat;
					when "11" =>
						RAM3(iwaddr)<=wrdat;
					when others =>
					end case;
				end if;
				haddr<=RAM3(itable) & RAM2(itable) & RAM1(itable) & RAM0(itable);
			end if;
		end if;
	end process;
	
end rtl;
