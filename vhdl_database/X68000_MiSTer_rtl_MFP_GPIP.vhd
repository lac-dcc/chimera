LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPIP is
port(
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	doe		:out std_logic;
	GPIR	:in std_logic;
	GPIW	:in std_logic;
	GPIER	:in std_logic;
	GPIEW	:in std_logic;
	GPIDR	:in std_logic;
	GPIDW	:in std_logic;

	GPIPI7	:in std_logic;
	GPIPI6	:in std_logic;
	GPIPI5	:in std_logic;
	GPIPI4	:in std_logic;
	GPIPI3	:in std_logic;
	GPIPI2	:in std_logic;
	GPIPI1	:in std_logic;
	GPIPI0	:in std_logic;

	GPIPO7	:out std_logic;
	GPIPO6	:out std_logic;
	GPIPO5	:out std_logic;
	GPIPO4	:out std_logic;
	GPIPO3	:out std_logic;
	GPIPO2	:out std_logic;
	GPIPO1	:out std_logic;
	GPIPO0	:out std_logic;

	GPIPD7	:out std_logic;
	GPIPD6	:out std_logic;
	GPIPD5	:out std_logic;
	GPIPD4	:out std_logic;
	GPIPD3	:out std_logic;
	GPIPD2	:out std_logic;
	GPIPD1	:out std_logic;
	GPIPD0	:out std_logic;
	
	GPIPR7	:out std_logic;
	GPIPR6	:out std_logic;
	GPIPR5	:out std_logic;
	GPIPR4	:out std_logic;
	GPIPR3	:out std_logic;
	GPIPR2	:out std_logic;
	GPIPR1	:out std_logic;
	GPIPR0	:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end GPIP;
architecture rtl of GPIP is
signal	GPI,sGPI,lGPI,GPO,GPD,GPR,GPE	:std_logic_vector(7 downto 0);
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				GPO<=(others=>'0');
				GPD<=(others=>'0');
				GPE<=(others=>'0');
			elsif(ce = '1')then
				if(GPIW='1')then
					GPO<=wdat;
				end if;
				if(GPIDW='1')then
					GPD<=wdat;
				end if;
				if(GPIEW='1')then
					GPE<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	GPI<=GPIPI7 & GPIPI6 & GPIPI5 & GPIPI4 & GPIPI3 & GPIPI2 & GPIPI1 & GPIPI0;
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				sGPI<=(others=>'0');
				lGPI<=(others=>'0');
			elsif(ce = '1')then
				lGPI<=sGPI;
				for i in 0 to 7 loop
					if(GPD(i)='1')then
						sGPI(i)<=GPO(i);
					else
						sGPI(i)<=GPI(i);
					end if;
				end loop;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				GPR<=(others=>'0');
			elsif(ce = '1')then
				for i in 0 to 7 loop
					if(sGPI(i)/=lGPI(i))then
						if(sGPI(i)=GPE(i))then
							GPR(i)<='1';
						else
							GPR(i)<='0';
						end if;
					else
						GPR(i)<='0';
					end if;
				end loop;
			end if;
		end if;
	end process;
	
	GPIPO7<=GPO(7);
	GPIPO6<=GPO(6);
	GPIPO5<=GPO(5);
	GPIPO4<=GPO(4);
	GPIPO3<=GPO(3);
	GPIPO2<=GPO(2);
	GPIPO1<=GPO(1);
	GPIPO0<=GPO(0);

	GPIPD7<=GPD(7);
	GPIPD6<=GPD(6);
	GPIPD5<=GPD(5);
	GPIPD4<=GPD(4);
	GPIPD3<=GPD(3);
	GPIPD2<=GPD(2);
	GPIPD1<=GPD(1);
	GPIPD0<=GPD(0);

	GPIPR7<=GPR(7);
	GPIPR6<=GPR(6);
	GPIPR5<=GPR(5);
	GPIPR4<=GPR(4);
	GPIPR3<=GPR(3);
	GPIPR2<=GPR(2);
	GPIPR1<=GPR(1);
	GPIPR0<=GPR(0);
	
	rdat<=	sGPI	when GPIR='1' else
			GPE		when GPIER='1' else
			GPD		when GPIDR='1' else
			x"00";
	doe<=	'1' when GPIR='1' else
			'1' when GPIER='1' else
			'1' when GPIDR='1' else
			'0';
end rtl;
	