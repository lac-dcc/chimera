library IEEE,work;
use IEEE.std_logic_1164.all;
use	IEEE.std_logic_unsigned.all;

entity signext is
generic(
	extmax	:integer	:=10
);
port(
	len		:in integer range 0 to extmax;
	signin	:in std_logic;
	
	signout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end signext;

architecture rtl of signext is
signal	count	:integer range 0 to extmax;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				count<=0;
			elsif(ce = '1')then
				if(signin='1')then
					count<=len;
					signout<='1';
				elsif(count>0)then
					count<=count-1;
				else
					signout<='0';
				end if;
			end if;
		end if;
	end process;
end rtl;