LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.VIDEO_TIMING_800x600_pkg.all;

entity CRTCX68TXT is
generic(
	DACRES		:integer	:=4
);
port(
	LRAMSEL		:out std_logic;
	LRAMADR		:out std_logic_vector(9 downto 0);
	LRAMDAT		:in std_logic_vector(15 downto 0);
	
	TRAM_ADR	:out std_logic_vector(12 downto 0);
	TRAM_DAT	:in std_logic_vector(7 downto 0);
	
	FRAM_ADR	:out std_logic_vector(11 downto 0);
	FRAM_DAT	:in std_logic_vector(7 downto 0);
	
	CURL		:in std_logic_vector(5 downto 0);
	CURC		:in std_logic_vector(6 downto 0);
	CURE		:in std_logic;

	TXTMODE		:in std_logic;
	
	ROUT		:out std_logic_vector(DACRES-1 downto 0);
	GOUT		:out std_logic_vector(DACRES-1 downto 0);
	BOUT		:out std_logic_vector(DACRES-1 downto 0);
	
	RFOUT		:out std_logic_vector(5 downto 0);
	GFOUT		:out std_logic_vector(5 downto 0);
	BFOUT		:out std_logic_vector(5 downto 0);
	
	HSYNC		:out std_logic;
	VSYNC		:out std_logic;
	
	HMODE		:in std_logic_vector(1 downto 0);		-- "00":256 "01":512 "10":768 "11":768
	VMODE		:in std_logic;		-- 1:512 0:256

	VRTC		:out std_logic;
	HRTC		:out std_logic;
	VIDEN		:out std_logic;
	
	HCOMP		:out std_logic;
	VCOMP		:out std_logic;
	VPSTART		:out std_logic;
	
	dclk		:out std_logic;

	gclk		:in std_logic;
	rstn		:in std_logic
);
end CRTCX68TXT;

architecture rtl of CRTCX68TXT is
component VTIMINGX68 is
generic(
	DOTPU	:integer	:=8;
	HWIDTH	:integer	:=800;
	VWIDTH	:integer	:=525;
	HVIS	:integer	:=640;
	VVIS	:integer	:=400;
	CPD		:integer	:=3;		--clocks per dot
	HFP		:integer	:=3;
	HSY		:integer	:=12;
	VFP		:integer	:=51;
	VSY		:integer	:=2
);	
port(
	VCOUNT	:out integer range 0 to VWIDTH-1;
	HUCOUNT	:out integer range 0 to (HWIDTH/DOTPU)-1;
	UCOUNT	:out integer range 0 to DOTPU-1;
	
	HCOMP	:out std_logic;
	VCOMP	:out std_logic;
	
	clk2	:out std_logic;
	
	clk		:in std_logic;
	rstn	:in std_logic
);
end component;

component TEXTSCRv
generic(
	DOTPU	:integer	:=8;
	HWIDTH	:integer	:=1040;
	VWIDTH	:integer	:=666;
	HVIS	:integer	:=800;
	VVIS	:integer	:=600;
	HFP		:integer	:=6;
	HSY		:integer	:=16;
	VFP		:integer	:=37;
	VSY		:integer	:=6;
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
	
	UCOUNT	:in integer range 0 to DOTPU-1;
	HUCOUNT	:in integer range 0 to (HWIDTH/DOTPU)-1;
	VCOUNT	:in integer range 0 to VWIDTH-1;
	HCOMP	:in std_logic;
	VCOMP	:in std_logic;

	clk		:in std_logic;
	rstn	:in std_logic
);
end component;

component synccont
generic(
	DOTPU	:integer	:=8;
	HWIDTH	:integer	:=800;
	VWIDTH	:integer	:=525;
	HVIS	:integer	:=640;
	VVIS	:integer	:=400;
	CPD		:integer	:=3;		--clocks per dot
	HFP		:integer	:=3;
	HSY		:integer	:=12;
	VFP		:integer	:=51;
	VSY		:integer	:=2
);	
port(
	UCOUNT	:in integer range 0 to DOTPU-1;
	HUCOUNT	:in integer range 0 to (HWIDTH/DOTPU)-1;
	VCOUNT	:in integer range 0 to VWIDTH-1;
	HCOMP	:in std_logic;
	VCOMP	:in std_logic;

	HSYNC	:out std_logic;
	VSYNC	:out std_logic;
	VISIBLE	:out std_logic;
	
	HRTC	:out std_logic;
	VRTC	:out std_logic;
	
	clk		:in std_logic;
	rstn	:in std_logic
);
end component;

component  delayer
generic(
	counts	:integer	:=5
);
port(
	a		:in std_logic;
	q		:out std_logic;
	
	clk		:in std_logic;
	rstn	:in std_logic
);
end component;

signal VCOUNT	:integer range 0 to VWIDTH-1;
signal HUCOUNT	:integer range 0 to (HWIDTH/DOTPU)-1;
signal HUVCOUNT	:integer range 0 to (HWIDTH/DOTPU)-1;
signal UCOUNT	:integer range 0 to DOTPU-1;
signal HCOMPw	:std_logic;
signal VCOMPw	:std_logic;
signal HCOMPb	:std_logic;
signal VCOMPb	:std_logic;
signal VISIBLE	:std_logic;
signal lVISIBLE	:std_logic;
signal	LSEL	:std_logic;
signal	HCOMPl	:std_logic;
signal	VCOMPl	:std_logic;
constant	VIV		:integer	:=VFP+VSY+VBP;
signal clk2		:std_logic;
signal	Rdat	:std_logic_vector(4 downto 0);
signal	Gdat	:std_logic_vector(4 downto 0);
signal	Bdat	:std_logic_vector(4 downto 0);
signal	Idat	:std_logic;

signal	X68R	:std_logic_vector(5 downto 0);
signal	X68G	:std_logic_vector(5 downto 0);
signal	X68B	:std_logic_vector(5 downto 0);
signal	TXTR	:std_logic_vector(5 downto 0);
signal	TXTG	:std_logic_vector(5 downto 0);
signal	TXTB	:std_logic_vector(5 downto 0);

signal	Rdat6	:std_logic_vector(5 downto 0);
signal	Gdat6	:std_logic_vector(5 downto 0);
signal	Bdat6	:std_logic_vector(5 downto 0);
signal	Rdat4	:std_logic_vector(3 downto 0);
signal	Gdat4	:std_logic_vector(3 downto 0);
signal	Bdat4	:std_logic_vector(3 downto 0);


signal	dsel	:std_logic;
signal	ssel	:std_logic;

signal T_BIT	:std_logic;
signal X_BIT	:std_logic;
signal T_FGCOLOR:std_logic_vector(2 downto 0);
signal T_BGCOLOR:std_logic_vector(2 downto 0);


begin
	TIM	:vtimingx68 generic map(
		DOTPU	=>DOTPU,
		HWIDTH	=>HWIDTH,
		VWIDTH	=>VWIDTH,
		HVIS	=>HVIS,
		VVIS	=>VVIS,
		CPD		=>CPD,
		HFP		=>HFP,
		HSY		=>HSY,
		VFP		=>VFP,
		VSY		=>VSY
	) port map(VCOUNT,HUCOUNT,UCOUNT,HCOMPw,VCOMPw,clk2,gclk,rstn);
	dclk<=clk2;

	sync:synccont generic map(
		DOTPU	=>DOTPU,
		HWIDTH	=>HWIDTH,
		VWIDTH	=>VWIDTH,
		HVIS	=>HVIS,
		VVIS	=>VVIS,
		CPD		=>CPD,
		HFP		=>HFP,
		HSY		=>HSY,
		VFP		=>VFP,
		VSY		=>VSY
	) port map(UCOUNT,HUCOUNT,VCOUNT,HCOMPw,VCOMPw,HSYNC,VSYNC,VISIBLE,HRTC,VRTC,clk2,rstn);

	TXT	:textscrv generic map(
		DOTPU	=>DOTPU,
		HWIDTH	=>HWIDTH,
		VWIDTH	=>VWIDTH,
		HVIS	=>HVIS,
		VVIS	=>VVIS,
		HFP		=>HFP,
		HSY		=>HSY,
		VFP		=>VFP,
		VSY		=>VSY,
		TAWIDTH	=>13,
		CURLINE	=>4,
		CBLINKINT =>20,
		BLINKINT =>20,
		LWIDTH	=>6,
		CWIDTH	=>7
	)port map(
		TRAMADR	=>TRAM_ADR,
		TRAMDAT	=>TRAM_DAT,
		
		FRAMADR	=>FRAM_ADR,
		FRAMDAT	=>FRAM_DAT,

		BITOUT	=>T_BIT,
		FGCOLOR	=>T_FGCOLOR,
		BGCOLOR	=>T_BGCOLOR,
		THRUE	=>open,
		BLINK	=>open,
		
		CURL	=>CURL,
		CURC	=>CURC,
		CURE	=>CURE,
		CURM	=>'0',
		CBLINK	=>'1',

		HMODE	=>'1',
		VMODE	=>'1',
		
		UCOUNT	=>UCOUNT,
		HUCOUNT	=>HUCOUNT,
		VCOUNT	=>VCOUNT,
		HCOMP	=>HCOMPw,
		VCOMP	=>VCOMPw,

		clk		=>clk2,
		rstn	=>rstn
	);
	
	HUVCOUNT<=	HUVIS-1 when HUCOUNT=0 else
					HUCOUNT-HIV-1;
	LRAMADR(2 downto 0)<=conv_std_logic_vector(UCOUNT,3);
	LRAMADR(9 downto 3)<=conv_std_logic_vector(HUVCOUNT,7);
	
--	vdelay	:delayer generic map(1) port map(VISIBLE,lVISIBLE,gclk,rstn);
	lVISIBLE<=VISIBLE;
	VIDEN<=VISIBLE;
	
	Rdat<=LRAMDAT(10 downto 6);
	Gdat<=LRAMDAT(15 downto 11);
	Bdat<=LRAMDAT(5 downto 1);
	Idat<=LRAMDAT(0);

	
	process(gclk,rstn)begin
		if(rstn='0')then
			ssel<='0';
			dsel<='0';
		elsif(gclk' event and gclk='1')then
			if(VCOMPb='1')then
				ssel<=not ssel;
			end if;
			if(clk2='1')then
				dsel<=not dsel;
			end if;
		end if;
	end process;
	
--	ROUT<=(others=>'0')when lVISIBLE='0' else LRAMDAT(10 downto 11-DACRES);
--	GOUT<=(others=>'0')when lVISIBLE='0' else LRAMDAT(15 downto 16-DACRES);
--	BOUT<=(others=>'0')when lVISIBLE='0' else LRAMDAT(5 downto 6-DACRES);
	X68R<=(others=>'0')when lVISIBLE='0' else Rdat & Idat;
	X68G<=(others=>'0')when lVISIBLE='0' else Gdat & Idat;
	X68B<=(others=>'0')when lVISIBLE='0' else Bdat & Idat;
	
	process(gclk)begin
		if(gclk' event and gclk='1')then
			HCOMPl<=HCOMPw;
			VCOMPl<=VCOMPw;
		end if;
	end process;
	
	HCOMPb<='1' when HCOMPw='1' and HCOMPl='0' else '0';
	VCOMPb<='1' when VCOMPw='1' and VCOMPl='0' else '0';
	
	process(gclk,rstn)begin
		if(rstn='0')then
			LSEL<='0';
		elsif(gclk' event and gclk='1')then
			if(HCOMPb='1')then
				LSEL<=not LSEL;
			end if;
		end if;
	end process;
	
	LRAMSEL<=LSEL;
	HCOMP<=HCOMPb;
	VCOMP<=VCOMPb;
	VPSTART<='1' when HCOMPb='1' and VCOUNT=VIV-1 else '0';
	
	TXTR<=(others=>T_FGCOLOR(2))when T_BIT='1' else (others=>T_BGCOLOR(2));
	TXTG<=(others=>T_FGCOLOR(1))when T_BIT='1' else (others=>T_BGCOLOR(1));
	TXTB<=(others=>T_FGCOLOR(0))when T_BIT='1' else (others=>T_BGCOLOR(0));
	
	Rdat6<=X68R when TXTMODE='0' else TXTR;
	Gdat6<=X68G when TXTMODE='0' else TXTG;
	Bdat6<=X68B when TXTMODE='0' else TXTB;

	Rdat4<=	(Rdat6(5 downto 2)+"0001") when (lsel xor ssel xor dsel)='1' and Rdat6(5 downto 2)/="1111" and Rdat6(1)='1' else
			Rdat6(5 downto 2);
	Gdat4<=	(Gdat6(5 downto 2)+"0001") when (lsel xor ssel xor dsel)='1' and Gdat6(5 downto 2)/="1111" and Gdat6(1)='1' else
			Gdat6(5 downto 2);
	Bdat4<=	(Bdat6(5 downto 2)+"0001") when (lsel xor ssel xor dsel)='1' and Bdat6(5 downto 2)/="1111" and Bdat6(1)='1' else
			Bdat6(5 downto 2);
	ROUT<=RDAT4;
	GOUT<=GDAT4;
	BOUT<=BDAT4;
	RFOUT<=RDAT6;
	GFOUT<=GDAT6;
	BFOUT<=BDAT6;
	
end rtl;


	