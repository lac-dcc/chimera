library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pcmclk is
port(
	clkmode	:in std_logic;
	pcmsft	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end pcmclk;

architecture rtl of pcmclk is
signal	clkdiv	:integer range 0 to 7;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				clkdiv<=0;
				pcmsft<='0';
			elsif(ce = '1')then
				pcmsft<='0';
				if(clkdiv>0)then
					clkdiv<=clkdiv-1;
				else
					pcmsft<='1';
					if(clkmode='1')then
						clkdiv<=7;
					else
						clkdiv<=3;
					end if;
				end if;
			end if;
		end if;
	end process;
end rtl;
