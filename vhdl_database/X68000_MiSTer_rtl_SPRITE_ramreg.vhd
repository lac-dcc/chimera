library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ramreg is
generic(
	address	:std_logic_vector(23 downto 0)
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	doe		:out std_logic;

	reg		:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end ramreg;

architecture rtl of ramreg is
signal	data	:std_logic_vector(15 downto 0);
signal	reg_cs	:std_logic;
signal	reg_wr	:std_logic_vector(1 downto 0);
begin
	reg_cs<='1' when addr(23 downto 1)=address(23 downto 1) else '0';
	reg_wr<=wr when reg_cs='1' else "00";
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				data<=(others=>'0');
			elsif(ce = '1')then
				if(reg_wr(1)='1')then
					data(15 downto 8)<=wdat(15 downto 8);
				end if;
				if(reg_wr(0)='1')then
					data(7 downto 0)<=wdat(7 downto 0);
				end if;
			end if;
		end if;
	end process;
	
	reg<=data;
	rdat<=data;
	doe<='1' when reg_cs='1' and rd='1' else '0';
end rtl;
