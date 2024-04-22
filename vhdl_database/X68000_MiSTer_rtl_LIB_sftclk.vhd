library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SFTCLK is
generic(
	SYS_CLK	:integer	:=20000;
	OUT_CLK	:integer	:=1600;
	selWIDTH :integer	:=2
);
port(
	sel		:in std_logic_vector(selWIDTH-1 downto 0);
	SFT		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end SFTCLK;

architecture main of SFTCLK is
constant count	:integer	:=SYS_CLK/OUT_CLK;
signal	counter	:integer range 0 to count-1;
signal	selcounter :std_logic_vector(selWIDTH-1 downto 0);
constant selallzero	:std_logic_vector(selWIDTH-1 downto 0)	:=(others=>'0');
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				counter<=count-1;
				SFT<='0';
				selcounter<=(others=>'0');
			elsif(ce = '1')then
				if(counter=0)then
					if(selcounter=selallzero)then
						selcounter<=sel;
						SFT<='1';
					else
						selcounter<=selcounter-1;
						SFT<='0';
					end if;
					counter<=count-1;
				else
					SFT<='0';
					counter<=counter-1;
				end if;
			end if;
		end if;
	end process;
end main;

	