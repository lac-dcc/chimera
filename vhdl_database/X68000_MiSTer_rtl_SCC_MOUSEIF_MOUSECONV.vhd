LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MOUSECONV is
generic(
	CLKCYC	:integer	:=20000;
	SFTCYC	:integer	:=400;
	RXINT	:integer	:=2			--msec
);
port(
	REQ		:in std_logic;
	DATOUT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;

	MCLKIN	:in std_logic;
	MCLKOUT:out std_logic;
	MDATIN	:in std_logic;
	MDATOUT:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end MOUSECONV;

architecture MAIN of MOUSECONV is

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

signal	SFT		:std_logic;

type PS2STATE_T is (
	P2ST_IDLE,
	P2ST_INIT,
	P2ST_RESET,
	P2ST_RESET_BAT,
	P2ST_IDRD,
	P2ST_SETDEF,
	P2ST_SETDEF_ACK,
	P2ST_DATAREP,
	P2ST_DATAREP_ACK,
	P2ST_RECVDAT2,
	P2ST_RECVDAT3
);
signal	PS2STATE	:PS2STATE_T;

type SCCSTATE_T is (
	SCST_IDLE,
	SCST_TX0,
	SCST_TX1,
	SCST_TX2
);
signal	SCCSTATE	:SCCSTATE_T;

signal	M_TXDAT	:std_logic_vector(7 downto 0);
signal	M_RXDAT	:std_logic_vector(7 downto 0);
signal	M_WRn		:std_logic;
signal	M_BUSY		:std_logic;
signal	M_RXED		:std_logic;
signal	M_RESET	:std_logic;
signal	M_COL		:std_logic;
signal	M_PERR		:std_logic;
signal	MWAIT		:std_logic;
signal	WAITCNT		:integer range 0 to 5;
constant waitcont	:integer	:=1;
constant waitsep	:integer	:=20;
constant waitccount	:integer	:=waitcont*SFTCYC;
constant waitscount	:integer	:=waitsep*SFTCYC;
signal	WAITSFT		:integer range 0 to waitscount;

signal	RXDONE		:std_logic;
signal	RXRDY		:std_logic;

signal	TXEMPb		:std_logic;

signal	valX,valY	:std_logic_vector(9 downto 0);
signal	msbX,msbY	:std_logic;
signal	sw0,sw1		:std_logic;
signal	TXDAT0		:std_logic_vector(7 downto 0);
signal	TXDAT1		:std_logic_vector(7 downto 0);
signal	TXDAT2		:std_logic_vector(7 downto 0);
constant waitrlen	:integer	:=RXINT*CLKCYC;
signal	waitrcount	:integer range 0 to waitrlen-1;

begin

	MSFT	:sftclk generic map(CLKCYC,SFTCYC,1) port map("1",SFT,clk,ce,rstn);

	MOUSE	:PS2IF port map(
	DATIN	=>M_TXDAT,
	DATOUT	=>M_RXDAT,
	WRn		=>M_WRn,
	BUSY	=>M_BUSY,
	RXED	=>M_RXED,
	RESET	=>M_RESET,
	--COL		=>M_COL,
	--PERR	=>M_PERR,
	TWAIT	=>'0',

	KBCLKIN	=>MCLKIN,
	KBCLKOUT=>MCLKOUT,
	KBDATIN	=>MDATIN,
	KBDATOUT=>MDATOUT,

	SFT		=>SFT,
	clk		=>clk,
	ce      =>ce,
	rstn	=>rstn
	);

	process(clk,rstn)
	variable tmp	:std_logic_vector(9 downto 0);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				PS2STATE<=P2ST_INIT;
				M_WRn<='1';
				M_RESET<='0';
				WAITCNT<=0;
				WAITSFT<=0;
				M_TXDAT<=(others=>'0');
				--TXEMPb<='0';
				RXED<='0';
				waitrcount<=0;
				TXDAT0<=(others=>'0');
				TXDAT1<=(others=>'0');
				TXDAT2<=(others=>'0');
			elsif(ce = '1')then
				M_WRn<='1';
				RXED<='0';
				if(WAITCNT>0)then
					WAITCNT<=WAITCNT-1;
				elsif(WAITSFT>0)then
					if(SFT='1')then
						WAITSFT<=WAITSFT-1;
					end if;
				else
					case PS2STATE is
					when P2ST_INIT =>
						if(M_BUSY='0')then
							WAITSFT<=waitscount;
							PS2STATE<=P2ST_RESET;
						end if;
					when P2ST_RESET =>
						if(M_BUSY='0')then
							M_TXDAT<=x"ff";						--reset
							M_WRn<='0';
							PS2STATE<=P2ST_RESET_BAT;
						end if;
					when P2ST_RESET_BAT =>
						if(M_RXED='1' and M_RXDAT=x"aa")then	--ack
							PS2STATE<=P2ST_IDRD;
						end if;
					when P2ST_IDRD =>
						if(M_RXED='1')then						--Mouse ID
							WAITSFT<=waitscount;
							PS2STATE<=P2ST_SETDEF;
						end if;
					when P2ST_SETDEF =>
						if(M_BUSY='0')then
							M_TXDAT<=x"f6";						--Set default
							M_WRn<='0';
							PS2STATE<=P2ST_SETDEF_ACK;
						end if;
					when P2ST_SETDEF_ACK =>
						if(M_RXED='1' and M_RXDAT=x"fa")then	--true
							WAITSFT<=waitscount;
							PS2STATE<=P2ST_DATAREP;
						end if;
					when P2ST_DATAREP =>
						if(M_BUSY='0')then
							M_TXDAT<=x"f4";
							M_WRn<='0';
							PS2STATE<=P2ST_DATAREP_ACK;
						end if;
					when P2ST_DATAREP_ACK =>
						if(M_RXED='1' and M_RXDAT=x"fa")then
	--						WAITSFT<=waitscount;
							PS2STATE<=P2ST_IDLE;
						end if;
					when P2ST_IDLE =>
						if(M_RXED='1')then
							if(M_RXDAT(7)='1')then
								if(M_RXDAT(5)='0')then
									valY<="1011111111";
								else
									valY<="0100000000";
								end if;
							end if;
							if(M_RXDAT(6)='1')then
								if(M_RXDAT(4)='1')then
									valX<="1011111111";
								else
									valX<="0100000000";
								end if;
							end if;
							sw1<=M_RXDAT(1);
							sw0<=M_RXDAT(0);
							msbY<=M_RXDAT(5);
							msbX<=M_RXDAT(4);
							PS2STATE<=P2ST_RECVDAT2;
						end if;
					when P2ST_RECVDAT2 =>
						if(M_RXED='1')then
							tmp:=valX;
							tmp:=tmp+(msbX & msbX & M_RXDAT);
							case tmp(9 downto 8) is
							when "01" =>
								valX<="0100000000";
							when "10" =>
								valX<="1011111111";
							when others =>
								valX<=tmp;
							end case;
							PS2STATE<=P2ST_RECVDAT3;
						end if;
					when P2ST_RECVDAT3 =>
						if(M_RXED='1')then
							tmp:=valY;
							tmp:=tmp-(msbY & msbY & M_RXDAT);
							case tmp(9 downto 8) is
							when "01" =>
								valY<="0100000000";
							when "10" =>
								valY<="1011111111";
							when others =>
								valY<=tmp;
							end case;
							PS2STATE<=P2ST_IDLE;
						end if;
					when others =>
						PS2STATE<=P2ST_IDLE;
					end case;
				end if;

				if(waitrcount>0)then
					waitrcount<=waitrcount-1;
				else
					case SCCSTATE is
					when SCST_IDLE =>
						if(REQ='1')then
							case valX(9 downto 8) is
							when "01" =>
								TXDAT0(6)<='0';
								TXDAT0(4)<='1';
							when "10" =>
								TXDAT0(6)<='1';
								TXDAT0(4)<='0';
							when others =>
								TXDAT0(6)<='0';
								TXDAT0(4)<='0';
							end case;

							case valY(9 downto 8) is
							when "01" =>
								TXDAT0(7)<='0';
								TXDAT0(5)<='1';
							when "10" =>
								TXDAT0(7)<='1';
								TXDAT0(5)<='0';
							when others =>
								TXDAT0(7)<='0';
								TXDAT0(5)<='0';
							end case;

							TXDAT0(3 downto 0)<="00" & sw1 & sw0;
							TXDAT1<=valX(8 downto 1);
							TXDAT2<=valY(8 downto 1);
							valX<=(others=>'0');
							valY<=(others=>'0');

							waitrcount<=waitrlen-1;
							SCCSTATE<=SCST_TX0;
						end if;
					when SCST_TX0 =>
						DATOUT<=TXDAT0;
						RXED<='1';
						waitrcount<=waitrlen-1;
						SCCSTATE<=SCST_TX1;
					when SCST_TX1 =>
						DATOUT<=TXDAT1;
						RXED<='1';
						waitrcount<=waitrlen-1;
						SCCSTATE<=SCST_TX2;
					when SCST_TX2 =>
						DATOUT<=TXDAT2;
						RXED<='1';
						SCCSTATE<=SCST_IDLE;
					when others =>
						SCCSTATE<=SCST_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;
end MAIN;
