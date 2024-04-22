LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sccreg is
port(
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;
	rd		:in std_logic;
	
	regno	:out std_logic_vector(3 downto 0);
	regwr	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end sccreg;

architecture rtl of sccreg is
signal	regsel	:std_logic;
signal	lwr		:std_logic;
signal	lrd		:std_logic;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				regno<=(others=>'0');
				regsel<='0';
				lwr<='0';
				lrd<='0';
			elsif(ce = '1')then
				lwr<=wr;
				if(lwr='0' and wr='1')then
					if(regsel='0' and wrdat(7 downto 4)="0000")then
						regno<=wrdat(3 downto 0);
						regsel<='1';
					else
						regno<=(others=>'0');
						regsel<='0';
					end if;
				elsif(lrd='1' and rd='0')then
					regno<=(others=>'0');
					regsel<='0';
				end if;
			end if;
		end if;
	end process;
	regwr<='1' when wr='1' and lwr='0' else '0';
end rtl;

