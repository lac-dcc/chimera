library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PS2IF is
generic(
	SFTCYC	:integer	:=400;		--kHz
	STCLK	:integer	:=150;		--usec
	TOUT	:integer	:=150		--usec
);
port(
	DATIN	:in std_logic_vector(7 downto 0);
	DATOUT	:out std_logic_vector(7 downto 0);
	WRn		:in std_logic;
	BUSY	:out std_logic;
	RXED	:out std_logic;
	RESET	:in std_logic;
	COL		:out std_logic;
	PERR	:out std_logic;
	TWAIT	:in std_logic	:='0';
	
	KBCLKIN	:in	std_logic;
	KBCLKOUT :out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT :out std_logic;
	
	SFT		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end PS2IF;

architecture MAIN of PS2IF is
signal	TXDAT	:std_logic_vector(11 downto 0);
signal	SFTCNT	:integer range 0 to 11;
signal	STATE	:integer range 0 to 6;
 constant ST_IDLE	:integer	:=0;
 constant ST_READM1	:integer	:=1;
 constant ST_READM2	:integer	:=2;
 constant ST_WRSTART :integer	:=3;
 constant ST_WRSTART1:integer	:=4;
 constant ST_WRITE	:integer	:=5;
 constant ST_DATREL	:integer	:=6;
signal	PAR		:std_logic;
signal	LASTCLK	:std_logic;
constant BITCNT		:integer	:=STCLK*SFTCYC/1000;
constant TOCNT		:integer	:=TOUT*SFTCYC/1000;
signal	TIMECNT	:integer range 0 to BITCNT;
signal	LASTWRn		:std_logic;
signal	RXDAT	:std_logic_vector(7 downto 0);

component PARGEN
generic(
	WIDTH	:integer	:=8;
	O_En	:std_logic	:='0'
);
port(
	DAT		:in std_logic_vector(0 to WIDTH-1);
	PAR		:out std_logic
);
end component;

		
begin
	PU	:PARGEN port map(TXDAT(8 downto 1),PAR);
	
	DATOUT<=	RXDAT;
			
	BUSY<=	'1' when WRn='0' else
			'0' when STATE=ST_IDLE else '1';

	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TXDAT<=(others=>'0');
				STATE<=ST_IDLE;
				SFTCNT<=0;
				LASTCLK<='1';
				KBDATOUT<='1';
				KBCLKOUT<='1';
				RXDAT<=(others=>'0');
				RXED<='0';
				COL<='0';
				PERR<='0';
				TIMECNT<=0;
				--LASTWRn<='1';
			elsif(ce = '1')then
				LASTCLK<=KBCLKIN;
				--LASTWRn<=WRn;
				RXED<='0';
				if(RESET='1')then
					STATE<=ST_IDLE;
				elsif(WRn='0')then
					if(STATE/=ST_IDLE)then
						COL<='1';
					else
						COL<='0';
						TXDAT<="110" & DATIN & '0';
						SFTCNT<=11;
						TIMECNT<=BITCNT;
						KBCLKOUT<='0';
						KBDATOUT<='1';
						STATE<=ST_WRSTART;
					end if;
	
				elsif(STATE=ST_IDLE)then
					if(TWAIT='1')then
						KBCLKOUT<='0';
					else
						KBCLKOUT<='1';
					end if;
					if(KBCLKIN='0' and LASTCLK='1')then
						if(KBDATIN='0')then
							SFTCNT<=10;
							STATE<=ST_READM2;
						else
							SFTCNT<=8;
							STATE<=ST_READM1;
						end if;
						TIMECNT<=TOCNT;
					end if;
				elsif(STATE=ST_READM1 or STATE=ST_READM2)then
					if(SFT='1')then
						if(TIMECNT=0)then
							STATE<=ST_IDLE;		--timeout
						else
							TIMECNT<=TIMECNT-1;
						end if;
					end if;
					if(KBCLKIN='0' and LASTCLK='1')then
						TIMECNT<=TOCNT;
						TXDAT(8 downto 0)<=TXDAT(9 downto 1);
						TXDAT(9)<=KBDATIN;
						SFTCNT<=SFTCNT-1;
					elsif(KBCLKIN='1' and LASTCLK='0')then
						TIMECNT<=TOCNT;
						if(SFTCNT=0)then
							RXED<='1';
							STATE<=ST_DATREL;
							if(STATE=ST_READM2)then
								RXDAT<=TXDAT(7 downto 0);
							else
								RXDAT<=TXDAT(9 downto 2);
							end if;
						end if;
					end if;
				elsif(STATE=ST_WRSTART)then
					TXDAT(9)<=not PAR;
					if(SFT='1')then
						if(TIMECNT/=0)then
							TIMECNT<=TIMECNT-1;
						else
							KBDATOUT<='0';
							STATE<=ST_WRSTART1;
							TIMECNT<=1;
						end if;
					end if;
				elsif(STATE=ST_WRSTART1)then
					if(SFT='1')then
						TIMECNT<=TIMECNT-1;
						if(TIMECNT=0)then
							KBCLKOUT<='1';
							STATE<=ST_WRITE;
						end if;
					end if;
				elsif(STATE=ST_WRITE)then
					if(KBCLKIN='0' and LASTCLK='1')then
						KBDATOUT<=TXDAT(1);
						TXDAT(10 downto 0)<=TXDAT(11 downto 1);
						SFTCNT<=SFTCNT-1;
						if(SFTCNT=1)then
							if(KBDATIN='1')then
								PERR<='1';
							else
								PERR<='0';
							end if;
						end if;
					elsif(KBCLKIN='1' and LASTCLK='0')then
						if(SFTCNT=0)then
							STATE<=ST_DATREL;
						end if;
					end if;
				else	--ST_DATREL
					if(KBDATIN='1')then
						STATE<=ST_IDLE;
					end if;
				end if;
			end if;
		end if;
	end process;
end MAIN;
					