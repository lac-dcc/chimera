LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KBCONV is
generic(
	CLKCYC	:integer	:=20000;
	SFTCYC	:integer	:=400
);
port(
	DATIN	:in std_logic_vector(7 downto 0);
	DATOUT	:out std_logic_vector(7 downto 0);
	DOE		:out std_logic;
	CONTRD	:in std_logic;
	CONTWR	:in std_logic;
	RXSTRD	:in std_logic;
	RXSTWR	:in std_logic;
	TXSTRD	:in std_logic;
	TXSTWR	:in std_logic;
	DATRD	:in std_logic;
	DATWR	:in std_logic;
	KBWAIT	:in std_logic;
	KBen	:out std_logic;
	
	TXEMP	:out std_logic;
	RXED	:out std_logic;

	KBCLKIN	:in std_logic;
	KBCLKOUT:out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT:out std_logic;
	
	monout	:out std_logic_vector(7 downto 0);
	
	kbsel	:in std_logic	:='0';
	kbout	:out std_logic_vector(7 downto 0);
	kbrx	:out std_logic;
	
	LED		:out std_logic_vector(6 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end KBCONV;

architecture MAIN of KBCONV is

component PS2IF
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
	TWAIT	:in std_logic;
	
	KBCLKIN	:in	std_logic;
	KBCLKOUT :out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT :out std_logic;
	
	SFT		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic;
	rstn	:in std_logic
);
end component;

component SFTCLK
generic(
	SYS_CLK	:integer	:=20000;
	OUT_CLK	:integer	:=1600;
	selWIDTH :integer	:=2
);
port(
	sel		:in std_logic_vector(selWIDTH-1 downto 0);
	SFT		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component  ktbln
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END component;

component  ktble0
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END component;

signal	E0en	:std_logic;
signal	F0en	:std_logic;
signal	SFT		:std_logic;
signal	TBLADR	:std_logic_vector(7 downto 0);
signal	TBLDAT	:std_logic_vector(6 downto 0);
signal	NTBLDAT	:std_logic_vector(6 downto 0);
signal	E0TBLDAT:std_logic_vector(6 downto 0);

type KBSTATE_T is (
	KS_IDLE,
	KS_RESET,
	KS_RESET_BAT,
	KS_IDRD,
	KS_IDRD_ACK,
	KS_IDRD_LB,
	KS_IDRD_HB,
	KS_LEDS,
	KS_LEDW,
	KS_LEDB,
	KS_LEDS_ACK,
	KS_RDTBL,
	KS_REP,
	KS_WINT,
	KS_SETREP,
	KS_SETREP1,
	KS_SETREP2,
	KS_SETREP3,
	KS_SENDDONE
);

signal	KBSTATE	:KBSTATE_T;
signal	KB_TXDAT	:std_logic_vector(7 downto 0);
signal	KB_RXDAT	:std_logic_vector(7 downto 0);
signal	KB_RXEDx	:std_logic;
signal	KB_WRn		:std_logic;
signal	KBSELx		:std_logic;
signal	KB_BUSY		:std_logic;
signal	KB_RXED		:std_logic;
signal	KB_RESET	:std_logic;
signal	KB_COL		:std_logic;
signal	KB_PERR		:std_logic;
signal	WAITCNT		:integer range 0 to 5;
constant waitcont	:integer	:=1;
constant waitsep	:integer	:=20;
constant waitccount	:integer	:=waitcont*SFTCYC;
constant waitscount	:integer	:=waitsep*SFTCYC;
signal	WAITSFT		:integer range 0 to waitscount;

signal	TXEN			:std_logic;
signal	RXEN			:std_logic;
signal	RXDONE		:std_logic;
signal	RXRDY		:std_logic;

signal	LASTCODE	:std_logic_vector(6 downto 0);
signal	KBDAT		:std_logic_vector(7 downto 0);
signal	UCR			:std_logic_vector(7 downto 0);
signal	RSR			:std_logic_vector(7 downto 0);
signal	TSR			:std_logic_vector(7 downto 0);

signal	SLED		:std_logic_vector(6 downto 0);
signal	KBLED		:std_logic_vector(2 downto 0);
signal	KBWAIT_CMD	:std_logic;
signal	KBREP		:std_logic_vector(3 downto 0);
signal	KBINT		:std_logic_vector(3 downto 0);
signal	REPVAL		:std_logic_vector(7 downto 0);
signal	lDATRD		:std_logic;
signal	TXEMPb		:std_logic;
signal	AT_REEN		:std_logic;
signal	END_SET		:std_logic;
signal	TSR_UE		:std_logic;
begin
--	MONOUT<="00000000" when KBSTATE=KS_IDLE else
--			"00000001" when KBSTATE=KS_CLRRAM or KBSTATE=KS_CLRRAM1 else
--			"00000010" when KBSTATE=KS_RESET or KBSTATE=KS_RESET_BAT else
--			"00000100" when KBSTATE=KS_IDRD or KBSTATE=KS_IDRD_ACK else
--			"00001000" when KBSTATE=KS_IDRD_LB or KBSTATE=KS_IDRD_HB else
--			"00010000" when KBSTATE=KS_LEDS or KBSTATE=KS_LEDB else
--			"00100000" when KBSTATE=KS_LEDS_ACK else
--			"01000000" when KBSTATE=KS_RDTBL or KBSTATE=KS_RDE0TBL else
--			"10000000" when KBSTATE=KS_RDRAM or KBSTATE=KS_WRRAM else
--			"00000000";
--	monout<= KB_RXDAT;
	monout<='0' & TBLDAT;
--	monout<=WRDAT;
	
	KBSFT	:sftclk generic map(CLKCYC,SFTCYC,1) port map("1",SFT,clk,ce,rstn);
	
	KB	:PS2IF port map(
	DATIN	=>KB_TXDAT,
	DATOUT	=>KB_RXDAT,
	WRn		=>KB_WRn,
	BUSY	=>KB_BUSY,
	RXED	=>KB_RXEDx,
	RESET	=>KB_RESET,
	--COL		=>KB_COL,
	--PERR	=>KB_PERR,
	TWAIT	=>KBWAIT,
	
	KBCLKIN	=>KBCLKIN,
	KBCLKOUT=>KBCLKOUT,
	KBDATIN	=>KBDATIN,
	KBDATOUT=>KBDATOUT,
	
	SFT		=>SFT,
	clk		=>clk,
	ce      =>ce,
	rstn	=>rstn
	);

	KB_RXED<=KB_RXEDx when KBSELx='0' else '0';
	kbrx<=KB_RXEDx when KBSELx='1' else '0';
	kbout<=KB_RXDAT;
	TXEMP<= '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				KBSELx<='0';
			elsif(ce = '1')then
				if(KBSTATE=KS_IDLE)then
					if(kbsel='1')then
						KBSELx<='1';
					else
						KBSELx<='0';
					end if;
				else
					KBSELx<='0';
				end if;
			end if;
		end if;
	end process;
	
	LED		<=SLED;
	KBLED	<=SLED(3) & '0' & SLED(4);
	
	REPVAL(7 downto 5)<=
		"000"	when KBREP=x"0" else
		"000"	when KBREP=x"1" else
		"001"	when KBREP=x"2" else
		"001"	when KBREP=x"3" else
		"001"	when KBREP=x"4" else
		"010"	when KBREP=x"5" else
		"010"	when KBREP=x"6" else
		"010"	when KBREP=x"7" else
		"011";
	REPVAL(4 downto 0)<=
		"00000"		when KBINT=x"0" else
		"00001"		when KBINT=x"1" else
		"00100"		when KBINT=x"2" else
		"01001"		when KBINT=x"3" else
		"01101"		when KBINT=x"4" else
		"10001"		when KBINT=x"5" else
		"10101"		when KBINT=x"6" else
		"11000"		when KBINT=x"7" else
		"11011"		when KBINT=x"8" else
		"11101"		when KBINT=x"9" else
		"11111";
	
	process(clk,rstn)
	variable iBITSEL	:integer range 0 to 7;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				KBSTATE<=KS_RESET;
				E0EN<='0';
				F0EN<='0';
				KB_WRn<='1';
				KB_RESET<='0';
				WAITCNT<=0;
				WAITSFT<=0;
				KB_TXDAT<=(others=>'0');
				RXDONE<='0';
				LASTCODE<=(others=>'0');
				SLED<=(others=>'0');
				TXEMPb<='0';
				KBREP<=x"3";
				KBINT<=x"4";
				KBEN<='0';
			elsif(ce = '1')then
				KB_WRn<='1';
				RXDONE<='0';
				AT_REEN<='0';
				END_SET<='0';
				if(WAITCNT>0)then
					WAITCNT<=WAITCNT-1;
				elsif(WAITSFT>0)then
					if(SFT='1')then
						WAITSFT<=WAITSFT-1;
					end if;
				else
					case KBSTATE is
					when KS_RESET =>
						if(KB_BUSY='0')then
							KB_TXDAT<=x"ff";
							KB_WRn<='0';
							KBSTATE<=KS_RESET_BAT;
						end if;
					when KS_RESET_BAT =>
						if(KB_RXED='1' and KB_RXDAT=x"aa")then
							WAITSFT<=waitscount;
							KBSTATE<=KS_IDRD;
						end if;
					when KS_IDRD =>
						if(KB_BUSY='0')then
							KB_TXDAT<=x"f2";
							KB_WRn<='0';
							KBSTATE<=KS_IDRD_ACK;
						end if;
					when KS_IDRD_ACK =>
						if(KB_RXED='1' and KB_RXDAT=x"fa")then
							KBSTATE<=KS_IDRD_LB;
						end if;
					when KS_IDRD_LB =>
						if(KB_RXED='1')then
							KBSTATE<=KS_IDRD_HB;
						end if;
					when KS_IDRD_HB =>
						if(KB_RXED='1')then
							WAITSFT<=waitscount;
							KBEN<='1';
							KBSTATE<=KS_LEDS;
						end if;
					when KS_LEDS =>
						if(KB_BUSY='0')then
							KB_TXDAT<=x"ed";
							KB_WRn<='0';
							KBSTATE<=KS_LEDW;
							WAITSFT<=1;
						end if;
					when KS_LEDW =>
						if(KB_BUSY='0')then
							WAITSFT<=waitccount;
							KBSTATE<=KS_LEDB;
						end if;
					when KS_LEDB =>
						if(KB_BUSY='0')then
							KB_TXDAT<="00000" & KBLED;
							KB_WRn<='0';
							KBSTATE<=KS_LEDS_ACK;
						end if;
					when KS_LEDS_ACK =>
						if(KB_RXED='1')then
	--					monout<=KB_RXDAT;
							if(KB_RXDAT=x"fa")then
								WAITSFT<=waitscount;
								KBSTATE<=KS_IDLE;
							elsif(KB_RXDAT=x"fe")then
								WAITSFT<=waitscount;
								KBSTATE<=KS_LEDS;
							end if;
						end if;
					when KS_IDLE =>
						TXEMPb<='1';
						if(KB_RXED='1')then
							if(KB_RXDAT=x"e0" or KB_RXDAT=x"e1")then
								E0en<='1';
							elsif(KB_RXDAT=x"f0")then
								F0en<='1';
							else
								KBSTATE<=KS_RDTBL;
								TBLADR<=KB_RXDAT;
								WAITCNT<=2;
							end if;
						elsif(DATWR='1')then
							if(DATIN(7 downto 6)="00")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
							elsif(DATIN(7 downto 3)="01001")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
								KBWAIT_CMD<=not DATIN(0);
							elsif(DATIN(7 downto 2)="010100")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
							elsif(DATIN(7 downto 2)="010101")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
							elsif(DATIN(7 downto 2)="010110")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
							elsif(DATIN(7 downto 2)="010111")then
								TXEMPb<='0';
								KBSTATE<=KS_SENDDONE;
								WAITCNT<=2;
							elsif(DATIN(7 downto 4)="0110")then
								TXEMPb<='0';
								KBREP<=DATIN(3 downto 0);
								KBSTATE<=KS_SETREP;
							elsif(DATIN(7 downto 4)="0111")then
								TXEMPb<='0';
								KBINT<=DATIN(3 downto 0);
								KBSTATE<=KS_SETREP;
							elsif(DATIN(7)='1')then
								TXEMPb<='0';
								SLED<=not DATIN(6 downto 0);
								KBSTATE<=KS_LEDS;
							end if;
						end if;
					when KS_RDTBL =>
						if(TBLDAT="1111111")then
							E0en<='0';
							F0en<='0';
							KBSTATE<=KS_IDLE;
						elsif(TBLDAT="1111110")then
							KBSTATE<=KS_IDLE;
						else
							if(F0en='1')then
								LASTCODE<=(others=>'0');
								KBDAT<='1' & TBLDAT;
								RXDONE<='1';
								KBSTATE<=KS_WINT;
							else
								if(LASTCODE=TBLDAT)then
									KBDAT<='1' & TBLDAT;
									if(RXEN='1')then
										RXDONE<='1';
										KBSTATE<=KS_REP;
									else
										KBSTATE<=KS_IDLE;
									end if;
								else
									LASTCODE<=TBLDAT;
									KBDAT<='0' & TBLDAT;
									if(RXEN='1')then
										RXDONE<='1';
										KBSTATE<=KS_WINT;
									else
										KBSTATE<=KS_IDLE;
									end if;
								end if;
							end if;
							WAITCNT<=1;
						end if;
					when KS_REP =>
						if(RXRDY='0')then
							KBDAT<='0' & TBLDAT;
							RXDONE<='1';
							KBSTATE<=KS_WINT;
						end if;
					when KS_WINT =>
						if(RXRDY='0')then
							E0en<='0';
							F0en<='0';
							KBSTATE<=KS_IDLE;
						end if;
					when KS_SETREP =>
						if(KB_BUSY='0')then
							KB_TXDAT<=x"f3";	--Set Typematic Rate/Delay
							KB_WRn<='0';
							KBSTATE<=KS_SETREP1;
							WAITSFT<=1;
						end if;
					when KS_SETREP1 =>
						if(KB_BUSY='0')then
							WAITSFT<=waitccount;
							KBSTATE<=KS_SETREP2;
						end if;
					when KS_SETREP2 =>
						if(KB_BUSY='0')then
							KB_TXDAT<=REPVAL;
							KB_WRn<='0';
							KBSTATE<=KS_SETREP3;
						end if;
					when KS_SETREP3 =>
						if(KB_RXED='1')then
							if(KB_RXDAT=x"fa")then
								WAITSFT<=waitscount;
								KBSTATE<=KS_SENDDONE;
							elsif(KB_RXDAT=x"fe")then
								WAITSFT<=waitscount;
								KBSTATE<=KS_SETREP;
							end if;
						end if;
					when KS_SENDDONE =>
						if(TSR(5)='1')then
							AT_REEN<='1';
						end if;
						if(TSR(0)='0')then
							END_SET<='1';
						end if;
						KBSTATE<=KS_IDLE;
					when others =>
						KBSTATE<=KS_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;
	
	RXEN<=(not KBWAIT_CMD) and RSR(0);
	TXEN<=TSR(0);
	
	NTBL	:ktbln port map(TBLADR,clk,NTBLDAT);
	E0TBL	:ktble0 port map(TBLADR,clk,E0TBLDAT);
	TBLDAT<=E0TBLDAT when E0en='1' else NTBLDAT;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				RXRDY<='0';
				lDATRD<='0';
			elsif(ce = '1')then
				lDATRD<=DATRD;
				if(RXDONE='1')then
					RXRDY<='1';
				elsif(DATRD='0' and lDATRD='1')then
					RXRDY<='0';
				end if;
			end if;
		end if;
	end process;
	RXED<=RXRDY;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				UCR<=(others=>'0');
				RSR<=(others=>'0');
				TSR<=(others=>'0');
			elsif(ce = '1')then
				if(CONTWR='1')then
					UCR<=DATIN;
				elsif(RXSTWR='1')then
					RSR<=DATIN;
				elsif(TXSTWR='1')then
					TSR<=DATIN;
				end if;
				if(AT_REEN='1')then
					RSR(0)<='1';
					TSR(5)<='0';
				end if;
				if(END_SET='1')then
					RSR(4)<='1';
				end if;
			end if;
		end if;
	end process;
	
	DATOUT<=
		KBDAT	when DATRD='1' else
		UCR		when CONTRD='1' else
		RXRDY & "0000" & KB_BUSY & '0' & RSR(0) when RXSTRD='1' else
		TXEMPb & TSR_UE & TSR(5 downto 0) when TXSTRD='1' else
		x"00";
	
	DOE<=	'1' when DATRD='1' else
			'1' when CONTRD='1' else
			'1' when RXSTRD='1' else
			'1' when TXSTRD='1' else
			'0';
	process(clk,rstn)
	variable lTXEMP	:std_logic;
	variable lTXSTRD	:std_logic;
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				TSR_UE<='0';
			elsif(ce = '1')then
				if(TXEN='0')then
					TSR_UE<='0';
				elsif(lTXEMP='0' and TXEMPb='1')then
					TSR_UE<='1';
				elsif(TXSTRD='0' and lTXSTRD='1')then
					TSR_UE<='0';
				end if;
				lTXEMP:=TXEMPb;
				lTXSTRD:=TXSTRD;
			end if;
		end if;
	end process;
end MAIN;
