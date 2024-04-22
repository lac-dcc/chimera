LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity e8255 is
generic(
	deflogic	:std_logic	:='0'
);
port(
	CSn		:in std_logic;
	RDn		:in std_logic;
	WRn		:in std_logic;
	ADR		:in std_logic_vector(1 downto 0);
	DATIN	:in std_logic_vector(7 downto 0);
	DATOUT	:out std_logic_vector(7 downto 0);
	DATOE	:out std_logic;
	
	PAi		:in std_logic_vector(7 downto 0);
	PAo		:out std_logic_vector(7 downto 0);
	PAoe	:out std_logic;
	PBi		:in std_logic_vector(7 downto 0);
	PBo		:out std_logic_vector(7 downto 0);
	PBoe	:out std_logic;
	PCHi	:in std_logic_vector(3 downto 0);
	PCHo	:out std_logic_vector(3 downto 0);
	PCHoe	:out std_logic;
	PCLi	:in std_logic_vector(3 downto 0);
	PCLo	:out std_logic_vector(3 downto 0);
	PCLoe	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end e8255;

architecture rtl of e8255 is
signal	OE_A	:std_logic;
signal	OE_B	:std_logic;
signal	OE_CH	:std_logic;
signal	OE_CL	:std_logic;
signal	ODAT_A	:std_logic_vector(7 downto 0);
signal	ODAT_B	:std_logic_vector(7 downto 0);
signal	ODAT_C	:std_logic_vector(7 downto 0);
signal	REG		:std_logic_vector(7 downto 0);
signal	PA,PB,PC:std_logic_vector(7 downto 0);
signal	RD		:std_logic;
signal	WR		:std_logic;
signal	MODE	:std_logic_vector(1 downto 0);
begin
	RD<='1' when CSn='0' and RDn='0' else '0';
	WR<='1' when CSn='0' and WRn='0' else '0';
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ODAT_A<=(others=>deflogic);
				ODAT_B<=(others=>deflogic);
				ODAT_C<=(others=>deflogic);
				REG<=(others=>'0');
				OE_A<='0';
				OE_B<='0';
				OE_CH<='0';
				OE_CL<='0';
			elsif(ce = '1')then
				if(WR='1')then
					case ADR is
					when "00" =>
						ODAT_A<=DATIN;
					when "01" =>
						ODAT_B<=DATIN;
					when "10" =>
						ODAT_C<=DATIN;
					when "11" =>
						REG<=DATIN;
						if(DATIN(7)='1')then	--mode select
							--MODE<=DATIN(6 downto 5);
							OE_A<=not DATIN(4);
							OE_CH<=not DATIN(3);
							OE_B<=not DATIN(1);
							OE_CL<=not DATIN(0);
							if(DATIN(4)='0')then
								ODAT_A<=(others=>'0');
							end if;
							if(DATIN(1)='0')then
								ODAT_B<=(others=>'0');
							end if;
							if(DATIN(3)='0')then
								ODAT_C(7 downto 4)<=(others=>'0');
							end if;
							if(DATIN(0)='0')then
								ODAT_C(3 downto 0)<=(others=>'0');
							end if;
						else
							case DATIN(3 downto 1) is
							when "000" =>
								ODAT_C(0)<=DATIN(0);
							when "001" =>
								ODAT_C(1)<=DATIN(0);
							when "010" =>
								ODAT_C(2)<=DATIN(0);
							when "011" =>
								ODAT_C(3)<=DATIN(0);
							when "100" =>
								ODAT_C(4)<=DATIN(0);
							when "101" =>
								ODAT_C(5)<=DATIN(0);
							when "110" =>
								ODAT_C(6)<=DATIN(0);
							when "111" =>
								ODAT_C(7)<=DATIN(0);
							when others =>
							end case;
						end if;
					when others=>
					end case;
				end if;
			end if;
		end if;
	end process;
	
	PAo<=ODAT_A;
	PBo<=ODAT_B;
	PCHo<=ODAT_C(7 downto 4);
	PCLo<=ODAT_C(3 downto 0);
	
	PAoe<=OE_A;
	PBoe<=OE_B;
	PCHoe<=OE_CH;
	PCLoe<=OE_CL;
	
	PA<=PAi when OE_A='0' else ODAT_A;
	PB<=PBi when OE_B='0' else ODAT_B;
	PC(7 downto 4)<=PCHi when OE_CH='0' else ODAT_C(7 downto 4);
	PC(3 downto 0)<=PCLi when OE_CL='0' else ODAT_C(3 downto 0);
	
	DATOUT<=
			PA when ADR="00" else
			PB when ADR="01" else
			PC when ADR="10" else
			REG;
	DATOE<=RD;
	
end rtl;
						
						
				
		