LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bwlatch	is
generic(
	awidth	:integer	:=24;
	dwidth	:integer	:=16
);
port(
	addr	:in std_logic_vector(awidth-1 downto 0);
	ce      :in std_logic := '1';
	wr		:in std_logic;
	din		:in std_logic_vector(dwidth-1 downto 0);
	
	myaddr	:in std_logic_vector(awidth-1 downto 0);
	pout	:out std_logic_vector(dwidth-1 downto 0);
	clk		:in std_logic;
	rstn	:in std_logic
);
end bwlatch;

--FIXME: had an existing ce
architecture rtl of bwlatch is
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				pout<=(others=>'0');
			elsif(ce = '1')then
				if(addr=myaddr and ce='1' and wr='1')then
					pout<=din;
				end if;
			end if;
		end if;
	end process;
end rtl;
