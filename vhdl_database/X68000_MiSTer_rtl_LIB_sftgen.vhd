library IEEE,work;
use IEEE.std_logic_1164.all;
use	IEEE.std_logic_unsigned.all;

entity sftgen is
generic(
	maxlen	:integer	:=100
);
port(
	len		:in integer range 0 to maxlen;
	sft		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end sftgen;
architecture rtl of sftgen is
signal	count	:integer range 0 to maxlen;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				count<=0;
				sft<='0';
			elsif(ce = '1')then
				if(count>1)then
					count<=count-1;
					sft<='0';
				else
					sft<='1';
					count<=len;
				end if;
			end if;
		end if;
	end process;
end rtl;
