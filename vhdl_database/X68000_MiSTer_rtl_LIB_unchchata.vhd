library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity UNCHCHATA is
	generic(
		MASKTIME	:integer	:=200;	--usec
		SYS_CLK		:integer	:=20	--MHz
	);
	port(
		SRC		:in std_logic;
		DST		:out std_logic;
		
		clk		:in std_logic;
		ce      :in std_logic := '1';
		rstn	:in std_logic
	);
end UNCHCHATA;

architecture MAIN of UNCHCHATA is
signal	TIMER	:integer range 0 to MASKTIME*SYS_CLK;
signal	LAST	:std_logic;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TIMER<=(MASKTIME*SYS_CLK);
				LAST<='0';
			elsif(ce = '1')then
				if(LAST='0' and SRC='1')then
					if(TIMER=0)then
						DST<='1';
					else
						DST<='0';
					end if;
				else
					DST<='0';
				end if;
				if(TIMER/=0)then
					TIMER<=TIMER-1;
				end if;
				LAST<=SRC;
				if(SRC='1')then
					TIMER<=(MASKTIME*SYS_CLK);
				end if;
			end if;
		end if;
	end process;
end MAIN;
