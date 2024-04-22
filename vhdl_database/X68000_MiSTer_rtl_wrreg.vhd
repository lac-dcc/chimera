library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity wrreg is
generic(
	address	:std_logic_vector(23 downto 0)	:=x"000000"
);
port(
	addr	:in std_logic_vector(23 downto 0);
	wrdat	:in std_logic_vector(15 downto 0);
	wr		:in std_logic_vector(1 downto 0);
	
	do		:out std_logic_vector(15 downto 0);
	wrote	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end wrreg;
architecture rtl of wrreg is
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				do<=(others=>'0');
			elsif(ce = '1')then
				if(addr(23 downto 1)=address(23 downto 1))then
					if(wr(1)='1')then
						do(15 downto 8)<=wrdat(15 downto 8);
					end if;
					if(wr(0)='1')then
						do(7 downto 0)<=wrdat(7 downto 0);
					end if;
					wrote<=wr(0) or wr(1);
				end if;
			end if;
		end if;
	end process;
end rtl;
