library IEEE,work;
use IEEE.std_logic_1164.all;

entity g_srff is
port(
	set		:in std_logic;
	reset	:in std_logic;
	
	q		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end g_srff;

architecture rtl of g_srff is
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				q<='0';
			elsif(ce = '1')then
				if(reset='1')then
					q<='0';
				elsif(set='1')then
					q<='1';
				end if;
			end if;
		end if;
	end process;
end rtl;
