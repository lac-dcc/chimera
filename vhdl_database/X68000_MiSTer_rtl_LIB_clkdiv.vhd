library IEEE,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity clkdiv is
generic(
	dwidth	:integer	:=8
);
port(
	div		:in std_logic_vector(dwidth-1 downto 0);
	
	cout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end clkdiv;

architecture rtl of clkdiv is
signal	count	:std_logic_vector(dwidth-1 downto 0);
signal	log		:std_logic;
constant allzero	:std_logic_vector(dwidth-1 downto 0)	:=(others=>'0');
signal	dec		:std_logic_vector(dwidth-1 downto 0);

begin
	
	dec(dwidth-1 downto 1)<=(others=>'0');
	dec(0)<='1';

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				log<='0';
				count<=(others=>'0');
			elsif(ce = '1')then
				if(count=allzero)then
					count<=div;
					log<=not log;
				else
					count<=count-dec;
				end if;
			end if;
		end if;
	end process;

	cout<=log;

end rtl;
