library IEEE,work;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use	IEEE.std_logic_unsigned.all;

entity sftdiv is
generic(
	width	:integer	:=8
);
port(
	sel		:in std_logic_vector(width-1 downto 0);
	sftin	:in std_logic;
	
	sftout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end sftdiv;

architecture rtl of sftdiv is
signal	count	:integer range 0 to (2**width)-1;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				count<=0;
			elsif(ce = '1')then
				if(sftin='1')then
					if(count=0)then
						sftout<='1';
						count<=conv_integer(sel);
					else
						sftout<='0';
						count<=count-1;
					end if;
				else
					sftout<='0';
				end if;
			end if;
		end if;
	end process;
end rtl;