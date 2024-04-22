library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TEXTSCRv_m is
generic(
	TAWIDTH	:integer	:=13;
	CURLINE	:integer	:=4;
	CBLINKINT :integer	:=20;
	BLINKINT :integer	:=40;
	LWIDTH	:integer	:=5;
	CWIDTH	:integer	:=7
);
port(
	TRAMADR	:out std_logic_vector(TAWIDTH-1 downto 0);
	TRAMDAT	:in std_logic_vector(7 downto 0);

	FRAMADR	:out std_logic_vector(11 downto 0);
	FRAMDAT	:in std_logic_vector( 7 downto 0);

	BITOUT	:out std_logic;
	FGCOLOR	:out std_logic_vector(2 downto 0);
	BGCOLOR	:out std_logic_vector(2 downto 0);
	THRUE	:out std_logic;
	BLINK	:out std_logic;

	CURL	:in std_logic_vector(LWIDTH-1 downto 0);
	CURC	:in std_logic_vector(CWIDTH-1 downto 0);
	CURE	:in std_logic;
	CURM	:in std_logic;
	CBLINK	:in std_logic;

	HMODE	:in std_logic;
	VMODE	:in std_logic;

	UCOUNT	:in integer;
	HUCOUNT	:in integer;
	VVCOUNT :in integer;
	HVCOUNT :in integer;
	VCOUNT	:in integer;
	VIR     :in std_logic;
	HIR     :in std_logic;
	HCOMP	:in std_logic;
	VCOMP	:in std_logic;

	HUVIS   :in integer;
	HIV     :in integer;
	VIV     :in integer;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end TEXTSCRv_m;

architecture MAIN of TEXTSCRv_m is

signal	CURDOT	:std_logic_vector(7 downto 0);
signal	NXTDOT	:std_logic_vector(7 downto 0);
signal	NXTFGCLR :std_logic_vector(2 downto 0);
signal	NXTBGCLR :std_logic_vector(2 downto 0);
signal	NXTTH	:std_logic;
signal	NXTBL	:std_logic;
signal	CHAR	:std_logic_vector(7 downto 0);
signal	TRAMADRb	:std_logic_vector(TAWIDTH-1 downto 0);
signal	DHCOMP	:std_logic;
signal	DVCOMP	:std_logic;
signal	C_LOW	:integer; -- range 0 to (VWIDTH/16)-1;
signal	C_LIN	:integer; -- range 0 to 19;
signal	C_COL	:integer; -- range 0 to (HWIDTH/8)-1;
signal	iCURL	:integer; -- range 0 to (2**LWIDTH)-1;
signal	iCURC	:integer; -- range 0 to (2**CWIDTH)-1;
signal	CURV	:std_logic;
signal	CURF	:std_logic;
signal	CICOUNT	:integer range 0 to CBLINKINT-1;
signal	BLKF	:std_logic;
signal	BICOUNT	:integer range 0 to BLINKINT-1;
signal	CHRLINES	:integer range 0 to 20;
signal	VMODEC	:std_logic;
signal	HMODEC	:std_logic;

component delayer is
generic(
	counts	:integer	:=5
);
port(
	a		:in std_logic;
	q		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin

	iCURL<=conv_integer(CURL);
	iCURC<=conv_integer(CURC);

	Hdelay	:delayer generic map(1) port map(HCOMP,DHCOMP,clk,ce,rstn);
	Vdelay	:delayer generic map(2) port map(VCOMP,DVCOMP,clk,ce,rstn);

	C_LIN<=0 when VIR = '0' else VVCOUNT mod CHRLINES;
	C_COL<=0 when HIR = '0' else HVCOUNT;
	CURV<=CURE when CBLINK='0' else (CURE and CURF);
	CHRLINES<=16 when VMODEC='1' else 20;
	TRAMADR<=TRAMADRb;

	process(clk)
	variable BNXTDOT	:std_logic_vector(7 downto 0);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				CURF<='1';
				CICOUNT<=CBLINKINT-1;
				BLKF<='0';
				BICOUNT<=BLINKINT-1;
				HMODEC<='0';
				VMODEC<='0';
				NXTDOT<=(others=>'0');
				NXTFGCLR<=(others=>'0');
				NXTBGCLR<=(others=>'0');
				NXTTH<='0';
				NXTBL<='0';
				TRAMADRb<=(others=>'0');
				FRAMADR<=(others=>'0');
				C_LOW<=0;
				BITOUT<='0';
				FGCOLOR<=(others=>'0');
				BGCOLOR<=(others=>'0');
				THRUE<='0';
				BLINK<='0';
				CURDOT<=(others=>'0');
			elsif(ce = '1')then
				if (ce = '1') then
					if(VCOMP='1')then
						if(CICOUNT=0)then
							CURF<=not CURF;
							CICOUNT<=CBLINKINT-1;
						else
							CICOUNT<=CICOUNT-1;
						end if;
					end if;
				end if;

				if(VCOMP='1')then
					if(BICOUNT=0)then
						BLKF<=not BLKF;
						BICOUNT<=BLINKINT-1;
					else
						BICOUNT<=BICOUNT-1;
					end if;
				end if;

				if(VCOMP='1')then
					HMODEC<=HMODE;
					VMODEC<=VMODE;
				end if;

	-- Data	section
				if(DHCOMP='1')then
					if(VIR = '1')then
						if(C_LIN/=0)then
							TRAMADRb<=TRAMADRb-(HUVIS*2);
						else
							C_LOW<=C_LOW+1;
						end if;
					end if;
				end if;
				if(DVCOMP='1')then
					TRAMADRb<=(others=>'0');
					C_LOW<=0;
				end if;

				if(UCOUNT=4)then
						FRAMADR(11 downto 4)<=TRAMDAT;
					if(C_LIN<16)then
						FRAMADR(3 downto 0)<=conv_std_logic_vector(C_LIN,4);
					else
						FRAMADR(3 downto 0)<=(others=>'0');
					end if;
					if(VIR = '1' and HIR = '1')then
						TRAMADRb<=TRAMADRb+1;
					end if;
				elsif(UCOUNT=6)then
					if(VIR = '1' and HIR = '1')then
						if(TRAMDAT(3)='1' and BLKF='1')then
							BNXTDOT:=(others=>'0');
						else
							if(C_LIN<16)then
								BNXTDOT:=FRAMDAT;
							else
								BNXTDOT:=(others=>'0');
							end if;
						end if;
						if(CURV='1' and C_LOW=iCURL and C_COL=iCURC and (CURM='1' or C_LIN>(CHRLINES-CURLINE-1)))then
							NXTDOT<=not BNXTDOT;
						else
							NXTDOT<=BNXTDOT;
						end if;
						NXTFGCLR<=TRAMDAT(2 downto 0);
						NXTBGCLR<=TRAMDAT(6 downto 4);
						NXTBL<=TRAMDAT(3);
						NXTTH<=TRAMDAT(7);
						TRAMADRb<=TRAMADRb+1;
					else
						NXTDOT<=(others=>'0');
						NXTFGCLR<=(others=>'0');
						NXTBGCLR<=(others=>'0');
						NXTBL<='0';
						NXTTH<='0';
					end if;
				end if;

				if(HMODEC='1')then
					if(UCOUNT=0)then
						BITOUT<=NXTDOT(7);
						CURDOT<=NXTDOT;
						FGCOLOR<=NXTFGCLR;
						BGCOLOR<=NXTBGCLR;
						THRUE<=NXTTH;
						BLINK<=NXTBL;
					else
						BITOUT<=CURDOT(6);
						CURDOT<=CURDOT(6 downto 0) & '0';
					end if;
				else
					if(UCOUNT=0 and (HUCOUNT mod 2)=1)then
						BITOUT<=NXTDOT(7);
						CURDOT<=NXTDOT;
						FGCOLOR<=NXTFGCLR;
						BGCOLOR<=NXTBGCLR;
						THRUE<=NXTTH;
						BLINK<=NXTBL;
					elsif((UCOUNT mod 2)=0)then
						BITOUT<=CURDOT(6);
						CURDOT<=CURDOT(6 downto 0) & '0';
					end if;
				end if;
			end if;
		end if;
	end process;


end MAIN;

