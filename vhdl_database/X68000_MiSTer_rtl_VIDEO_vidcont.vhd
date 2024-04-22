LIBRARY	IEEE,work;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.numeric_std.ALL;

entity vidcont is
generic(
	arange	:integer	:=22
	);
port(
	t_base	:in std_logic_vector(arange-1 downto 0);
	g_base	:in std_logic_vector(arange-1 downto 0);

	g00_addr	:out std_logic_vector(arange-1 downto 0);
	g00_rd	:out std_logic;
	g00_rdat	:in std_logic_vector(15 downto 0);

	g01_addr	:out std_logic_vector(arange-1 downto 0);
	g01_rd	:out std_logic;
	g01_rdat	:in std_logic_vector(15 downto 0);

	g02_addr	:out std_logic_vector(arange-1 downto 0);
	g02_rd	:out std_logic;
	g02_rdat	:in std_logic_vector(15 downto 0);

	g03_addr	:out std_logic_vector(arange-1 downto 0);
	g03_rd	:out std_logic;
	g03_rdat	:in std_logic_vector(15 downto 0);

	g10_addr	:out std_logic_vector(arange-1 downto 0);
	g10_rd	:out std_logic;
	g10_rdat	:in std_logic_vector(15 downto 0);

	g11_addr	:out std_logic_vector(arange-1 downto 0);
	g11_rd	:out std_logic;
	g11_rdat	:in std_logic_vector(15 downto 0);

	g12_addr	:out std_logic_vector(arange-1 downto 0);
	g12_rd	:out std_logic;
	g12_rdat	:in std_logic_vector(15 downto 0);

	g13_addr	:out std_logic_vector(arange-1 downto 0);
	g13_rd	:out std_logic;
	g13_rdat	:in std_logic_vector(15 downto 0);

	t0_addr	:out std_logic_vector(arange-3 downto 0);
	t0_rd		:out std_logic;
	t0_rdat0	:in std_logic_vector(15 downto 0);
	t0_rdat1	:in std_logic_vector(15 downto 0);
	t0_rdat2	:in std_logic_vector(15 downto 0);
	t0_rdat3	:in std_logic_vector(15 downto 0);
	
	t1_addr	:out std_logic_vector(arange-3 downto 0);
	t1_rd		:out std_logic;
	t1_rdat0	:in std_logic_vector(15 downto 0);
	t1_rdat1	:in std_logic_vector(15 downto 0);
	t1_rdat2	:in std_logic_vector(15 downto 0);
	t1_rdat3	:in std_logic_vector(15 downto 0);
	
	g0_caddr	:out std_logic_vector(arange-1 downto 7);
	g0_clear	:out std_logic;
	
	g1_caddr	:out std_logic_vector(arange-1 downto 7);
	g1_clear	:out std_logic;

	g2_caddr	:out std_logic_vector(arange-1 downto 7);
	g2_clear	:out std_logic;

	g3_caddr	:out std_logic_vector(arange-1 downto 7);
	g3_clear	:out std_logic;

	t_hoffset	:in std_logic_vector(9 downto 0);
	t_voffset	:in std_logic_vector(9 downto 0);
	
	g0_hoffset	:in std_logic_vector(9 downto 0);
	g0_voffset	:in std_logic_vector(9 downto 0);
	g1_hoffset	:in std_logic_vector(8 downto 0);
	g1_voffset	:in std_logic_vector(8 downto 0);
	g2_hoffset	:in std_logic_vector(8 downto 0);
	g2_voffset	:in std_logic_vector(8 downto 0);
	g3_hoffset	:in std_logic_vector(8 downto 0);
	g3_voffset	:in std_logic_vector(8 downto 0);

	gmode	:in std_logic_vector(1 downto 0);		--00:4bit color 01:8bit color 11/10:16bit color
	memres	:in std_logic;							--0:512x512 1:1024x1024
	hres	:in std_logic_vector(1 downto 0);		--00:256 01:512 10/11:768
	vres	:in std_logic;							--0:256 1:512
	txten	:in std_logic;
	grpen	:in std_logic;
	spren	:in std_logic;
	graphen	:in std_logic_vector(4 downto 0);
	grpri	:in std_logic_vector(7 downto 0);
	pri_sp	:in std_logic_vector(1 downto 0);
	pri_tx	:in std_logic_vector(1 downto 0);
	pri_gr	:in std_logic_vector(1 downto 0);
	exon		:in std_logic;
	hp			:in std_logic;
	bp			:in std_logic;
	gg			:in std_logic;
	gt			:in std_logic;
	ah			:in std_logic;
	ys          :in std_logic;
	vht         :in std_logic;
	lsel      :in std_logic;
	
	lbaddr	:out std_logic_vector(9 downto 0);
	lbwdat	:out std_logic_vector(15 downto 0);
	lbwr	:out std_logic;
	
	hcomp	:in std_logic;
	vpstart	:in std_logic;
	hfreq	:in std_logic;
	htotal	:in std_logic_vector(7 downto 0);
	hvbgn	:in std_logic_vector(7 downto 0);
	hvend	:in std_logic_vector(7 downto 0);
	vtotal	:in std_logic_vector(9 downto 0);
	vvbgn	:in std_logic_vector(9 downto 0);
	vvend	:in std_logic_vector(9 downto 0);
	
	addrx	:out std_logic_vector(9 downto 0);
	addry	:out std_logic_vector(9 downto 0);
	sprite_in:in std_logic_vector(7 downto 0);
	
	tpalno	:out std_logic_vector(7 downto 0);
	tpalin	:in std_logic_vector(15 downto 0);
	tpal0in	:in std_logic_vector(15 downto 0);
	gpal0in	:in std_logic_vector(15 downto 0);
	
	spalno	:out std_logic_vector(7 downto 0);
	spalin	:in std_logic_vector(15 downto 0);

	gpal0no	:out std_logic_vector(7 downto 0);
	gpal1no	:out std_logic_vector(7 downto 0);
	gpalin	:in std_logic_vector(15 downto 0);
	
	vvideoen	:out std_logic;
	rintline:in std_logic_vector(9 downto 0);
	rint	:out std_logic;

	vlineno	:out std_logic_vector(9 downto 0);
	
	gclrbgn	:in std_logic;
	gclrend	:in std_logic;
	gclrpage:in std_logic_vector(3 downto 0);
	gclrbusy:out std_logic;
	
	hblank  :in std_logic;
	vblank  :in std_logic;
	
	vidclk		:in std_logic;
	vid_ce      :in std_logic := '1';
	rstn	:in std_logic
);
end vidcont;

architecture rtl of vidcont is
signal	ramsel	:std_logic;
signal	nxt_g0addr	:std_logic_vector(17 downto 0);
signal	nxt_g1addr	:std_logic_vector(17 downto 0);
signal	nxt_g2addr	:std_logic_vector(17 downto 0);
signal	nxt_g3addr	:std_logic_vector(17 downto 0);
signal	nxt_taddr	:std_logic_vector(arange-3 downto 0);
signal	cur_g0addr	:std_logic_vector(17 downto 0);
signal	cur_g1addr	:std_logic_vector(17 downto 0);
signal	cur_g2addr	:std_logic_vector(17 downto 0);
signal	cur_g3addr	:std_logic_vector(17 downto 0);
signal	cur_taddr	:std_logic_vector(arange-3 downto 0);
signal	nxt_g0rd	:std_logic;
signal	nxt_g1rd	:std_logic;
signal	nxt_g2rd	:std_logic;
signal	nxt_g3rd	:std_logic;
signal	nxt_trd		:std_logic;
signal	cur_g0rd	:std_logic;
signal	cur_g1rd	:std_logic;
signal	cur_g2rd	:std_logic;
signal	cur_g3rd	:std_logic;
signal	cur_trd		:std_logic;
signal	ten			:std_logic;
signal	g0en		:std_logic;
signal	g1en		:std_logic;
signal	g2en		:std_logic;
signal	g3en		:std_logic;
signal	t_rdat0		:std_logic_vector(15 downto 0);
signal	t_rdat1		:std_logic_vector(15 downto 0);
signal	t_rdat2		:std_logic_vector(15 downto 0);
signal	t_rdat3		:std_logic_vector(15 downto 0);
signal	g0_rdat		:std_logic_vector(15 downto 0);
signal	g1_rdat		:std_logic_vector(15 downto 0);
signal	g2_rdat		:std_logic_vector(15 downto 0);
signal	g3_rdat		:std_logic_vector(15 downto 0);

signal	cur_taddrh	:std_logic_vector(arange-9 downto 0);

signal	haddr	:std_logic_vector(9 downto 0);
signal	vaddr   :std_logic_vector(9 downto 0);
signal	raster  :std_logic_vector(9 downto 0);

signal	haddrmod:std_logic_vector(9 downto 0);
signal	vaddrmod:std_logic_vector(9 downto 0);
signal	vaddroff:std_logic_vector(9 downto 0);
signal	h3count	:integer range 0 to 2;

signal	hadly2	:std_logic_vector(9 downto 0);
signal	hadly1	:std_logic_vector(9 downto 0);
signal	thodly1	:std_logic_vector(3 downto 0);
signal	g0hodly1:std_logic_vector(3 downto 0);
signal	g1hodly1:std_logic_vector(3 downto 0);
signal	g2hodly1:std_logic_vector(3 downto 0);
signal	g3hodly1:std_logic_vector(3 downto 0);
signal	datsel,datseld:std_logic_vector(1 downto 0);
signal	sprite_ind	:std_logic_vector(7 downto 0);
signal	t_ddatd		:std_logic_vector(3 downto 0);

signal	thaddr_offset	:std_logic_vector(9 downto 0);
signal	tvaddr_offset	:std_logic_vector(9 downto 0);
signal	t_ddat	:std_logic_vector(3 downto 0);

signal	g0haddr_offset	:std_logic_vector(9 downto 0);
signal	g1haddr_offset	:std_logic_vector(9 downto 0);
signal	g2haddr_offset	:std_logic_vector(9 downto 0);
signal	g3haddr_offset	:std_logic_vector(9 downto 0);
signal	g0vaddr_offset	:std_logic_vector(9 downto 0);
signal	g1vaddr_offset	:std_logic_vector(9 downto 0);
signal	g2vaddr_offset	:std_logic_vector(9 downto 0);
signal	g3vaddr_offset	:std_logic_vector(9 downto 0);
signal	g40_ddat	:std_logic_vector(3 downto 0);
signal	g41_ddat	:std_logic_vector(3 downto 0);
signal	g42_ddat	:std_logic_vector(3 downto 0);
signal	g43_ddat	:std_logic_vector(3 downto 0);
signal	g80_ddat	:std_logic_vector(7 downto 0);
signal	g81_ddat	:std_logic_vector(7 downto 0);
signal	g16_ddat	:std_logic_vector(15 downto 0);

signal	g4p1_ddat	:std_logic_vector(3 downto 0);
signal	g4p2_ddat	:std_logic_vector(3 downto 0);
signal	g4p3_ddat	:std_logic_vector(3 downto 0);
signal	g4p4_ddat	:std_logic_vector(3 downto 0);
signal	g4_ddat		:std_logic_vector(3 downto 0);
signal	g8p1_ddat	:std_logic_vector(7 downto 0);
signal	g8p2_ddat	:std_logic_vector(7 downto 0);
signal	g8_ddat		:std_logic_vector(7 downto 0);

signal	nxt_g0r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g0r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g0r0c4addrl	:std_logic_vector(6 downto 0);
signal	nxt_g1r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g1r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g1r0c4addrl	:std_logic_vector(6 downto 0);
signal	nxt_g2r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g2r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g2r0c4addrl	:std_logic_vector(6 downto 0);
signal	nxt_g3r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g3r0c4addrh	:std_logic_vector(17 downto 7);
signal	cur_g3r0c4addrl	:std_logic_vector(6 downto 0);

signal	nxt_g0r1c4addrh	:std_logic_vector(17 downto 8);
signal	cur_g0r1c4addrh	:std_logic_vector(17 downto 8);
signal	cur_g0r1c4addrl	:std_logic_vector(7 downto 0);

signal	nxt_g0r0c8addrh	:std_logic_vector(17 downto 8);
signal	cur_g0r0c8addrh	:std_logic_vector(17 downto 8);
signal	cur_g0r0c8addrl	:std_logic_vector(7 downto 0);
signal	nxt_g1r0c8addrh	:std_logic_vector(17 downto 8);
signal	cur_g1r0c8addrh	:std_logic_vector(17 downto 8);
signal	cur_g1r0c8addrl	:std_logic_vector(7 downto 0);

signal	nxt_g0r0c16addrh:std_logic_vector(17 downto 9);
signal	cur_g0r0c16addrh:std_logic_vector(17 downto 9);
signal	cur_g0r0c16addrl:std_logic_vector(8 downto 0);

signal	g_ddaten		:std_logic;
signal	g_ddatend	:std_logic;
signal	gdoten		:std_logic;
signal	tdoten		:std_logic;
signal	sdoten		:std_logic;
signal	exbit,exbitd		:std_logic;
signal	vviden,lvviden	:std_logic;
signal	hviden,lhviden	:std_logic;

signal	wdatpr0		:std_logic_vector(15 downto 0);
signal	wdatpr1		:std_logic_vector(15 downto 0);
signal	wdatpr2		:std_logic_vector(15 downto 0);

signal	wenpr0	:std_logic;
signal	wenpr1	:std_logic;
signal	wenpr2	:std_logic;

signal	gclrrast	:std_logic_vector(9 downto 0);
signal	gclrbgnrq	:std_logic;
signal	gclrendrq	:std_logic;
signal	gclrbusyb	:std_logic;

signal	mixg,mixr,mixb	:std_logic_vector(5 downto 0);
signal	msrcpr1	:std_logic_vector(15 downto 0);
signal	msrcpr2	:std_logic_vector(15 downto 0);
signal	msenpr1,msenpr2	:std_logic;
signal	mixsrc,mixdst	:std_logic_vector(15 downto 0);
signal	gmixdat	:std_logic_vector(15 downto 0);
signal	tmixdat	:std_logic_vector(15 downto 0);

signal	inter		:std_logic;
signal	grskel	:std_logic;
signal	rastnum	:std_logic_vector(9 downto 0);
signal	vaddrm	:std_logic_vector(9 downto 0);
signal	vaddrs	:std_logic_vector(9 downto 0);
signal	xinter	:std_logic;
signal	intfil	:std_logic;
signal  mix_ibit:std_logic;
signal  sprio   :std_logic;
signal  gpal0noi:std_logic_vector(7 downto 0);
signal  gpal1noi:std_logic_vector(7 downto 0);
signal  addrpr0 :std_logic;
signal  addrpr1 :std_logic;
signal  txt_solid:std_logic;
signal  spr_solid:std_logic;
signal  grp_solid:std_logic;
signal tx_pal_0:std_logic;
signal sp_pal_0:std_logic;
signal gr_pal_0:std_logic;
signal semitrans:std_logic;
signal gpriobit:std_logic;
signal tpriobit:std_logic;

constant azero	:std_logic_vector(arange-1 downto 0)	:=(others=>'0');
begin
	-- g_ddaten<=	'1' when g4_ddat/=x"0" and gmode="00" else
	-- 				'1' when g8_ddat(3 downto 0)/=x"0" and gmode="01" else
	-- 				'1' when g16_ddat/=x"0000" and gmode(1)='1' else
	-- 				'0';

	process(vidclk)begin
		if rising_edge(vidclk) then
			if (vid_ce = '1') then
				hadly2<=hadly1;
				hadly1<=haddr;
				thodly1<=thaddr_offset(3 downto 0);
				g0hodly1<=g0haddr_offset(3 downto 0);
				g1hodly1<=g1haddr_offset(3 downto 0);
				g2hodly1<=g2haddr_offset(3 downto 0);
				g3hodly1<=g3haddr_offset(3 downto 0);
				datseld<=datsel;
				lhviden<=hviden;
				exbitd<=exbit;
				sprite_ind<=sprite_in;
				--t_ddatd<=t_ddat;
				--g_ddatend<=g_ddaten;
			end if;
		end if;
	end process;

	-- 256 height in high freqency will doublescan the image
	vaddrmod<= '0' & vaddr(9 downto 1)	when vres='0' and hfreq='1' else vaddr; -- and hfreq='1'
	haddrmod<= haddr;

	thaddr_offset<=t_hoffset+haddrmod;
	tvaddr_offset<=t_voffset+vaddrmod;
	nxt_taddr<=t_base(arange-1 downto 2)+(azero(arange-1 downto 19) & tvaddr_offset & "000000");
	cur_taddr<=cur_taddrh & thaddr_offset(9 downto 4);
	
	t_ddat<=	t_rdat3(15) & t_rdat2(15) & t_rdat1(15) & t_rdat0(15) when thodly1(3 downto 0)=x"0" else
				t_rdat3(14) & t_rdat2(14) & t_rdat1(14) & t_rdat0(14) when thodly1(3 downto 0)=x"1" else
				t_rdat3(13) & t_rdat2(13) & t_rdat1(13) & t_rdat0(13) when thodly1(3 downto 0)=x"2" else
				t_rdat3(12) & t_rdat2(12) & t_rdat1(12) & t_rdat0(12) when thodly1(3 downto 0)=x"3" else
				t_rdat3(11) & t_rdat2(11) & t_rdat1(11) & t_rdat0(11) when thodly1(3 downto 0)=x"4" else
				t_rdat3(10) & t_rdat2(10) & t_rdat1(10) & t_rdat0(10) when thodly1(3 downto 0)=x"5" else
				t_rdat3( 9) & t_rdat2( 9) & t_rdat1( 9) & t_rdat0( 9) when thodly1(3 downto 0)=x"6" else
				t_rdat3( 8) & t_rdat2( 8) & t_rdat1( 8) & t_rdat0( 8) when thodly1(3 downto 0)=x"7" else
				t_rdat3( 7) & t_rdat2( 7) & t_rdat1( 7) & t_rdat0( 7) when thodly1(3 downto 0)=x"8" else
				t_rdat3( 6) & t_rdat2( 6) & t_rdat1( 6) & t_rdat0( 6) when thodly1(3 downto 0)=x"9" else
				t_rdat3( 5) & t_rdat2( 5) & t_rdat1( 5) & t_rdat0( 5) when thodly1(3 downto 0)=x"a" else
				t_rdat3( 4) & t_rdat2( 4) & t_rdat1( 4) & t_rdat0( 4) when thodly1(3 downto 0)=x"b" else
				t_rdat3( 3) & t_rdat2( 3) & t_rdat1( 3) & t_rdat0( 3) when thodly1(3 downto 0)=x"c" else
				t_rdat3( 2) & t_rdat2( 2) & t_rdat1( 2) & t_rdat0( 2) when thodly1(3 downto 0)=x"d" else
				t_rdat3( 1) & t_rdat2( 1) & t_rdat1( 1) & t_rdat0( 1) when thodly1(3 downto 0)=x"e" else
				t_rdat3( 0) & t_rdat2( 0) & t_rdat1( 0) & t_rdat0( 0) when thodly1(3 downto 0)=x"f" else
				x"0";
	
	g0haddr_offset<=	g0_hoffset+haddrmod when memres='1' else
							'0' & (g0_hoffset(8 downto 0)+haddrmod(8 downto 0));
	g0vaddr_offset<=	g0_voffset+vaddrmod when memres='1' else
							'0' & (g0_voffset(8 downto 0)+vaddrmod(8 downto 0));
	g1haddr_offset<='0' & (g1_hoffset+haddrmod(8 downto 0));
	g1vaddr_offset<='0' & (g1_voffset+vaddrmod(8 downto 0));
	g2haddr_offset<='0' & (g2_hoffset+haddrmod(8 downto 0));
	g2vaddr_offset<='0' & (g2_voffset+vaddrmod(8 downto 0));
	g3haddr_offset<='0' & (g3_hoffset+haddrmod(8 downto 0));
	g3vaddr_offset<='0' & (g3_voffset+vaddrmod(8 downto 0));
	
	nxt_g0r0c4addrh<=g0vaddr_offset(8 downto 0) & "00";
	cur_g0r0c4addrl<=g0haddr_offset(8 downto 2);
	nxt_g1r0c4addrh<=g1vaddr_offset(8 downto 0) & "01";
	cur_g1r0c4addrl<=g1haddr_offset(8 downto 2);
	nxt_g2r0c4addrh<=g2vaddr_offset(8 downto 0) & "10";
	cur_g2r0c4addrl<=g2haddr_offset(8 downto 2);
	nxt_g3r0c4addrh<=g3vaddr_offset(8 downto 0) & "11";
	cur_g3r0c4addrl<=g3haddr_offset(8 downto 2);

	nxt_g0r0c8addrh<=g0vaddr_offset(8 downto 0) & '0';
	cur_g0r0c8addrl<=g0haddr_offset(8 downto 1);
	nxt_g1r0c8addrh<=g2vaddr_offset(8 downto 0) & '1';
	cur_g1r0c8addrl<=g2haddr_offset(8 downto 1);

	nxt_g0r0c16addrh<=g0vaddr_offset(8 downto 0);
	cur_g0r0c16addrl<=g0haddr_offset(8 downto 0);

	nxt_g0r1c4addrh<=g0vaddr_offset(9 downto 0);
	cur_g0r1c4addrl<=g0haddr_offset(9 downto 2);
	
	nxt_g0addr<=	nxt_g0r0c4addrh & "0000000"		when memres='0' and gmode="00" else
						nxt_g0r0c8addrh & "00000000"	when memres='0' and gmode="01" else
						nxt_g0r0c16addrh & "000000000"	when memres='0' and gmode(1)='1' else
						nxt_g0r1c4addrh & "00000000"	when memres='1' else
						(others=>'0'); 
	nxt_g1addr<=	nxt_g1r0c4addrh & "0000000"		when memres='0' and gmode="00" else
						nxt_g0r0c8addrh & "10000000"	when memres='0' and gmode="01" else
						nxt_g0r0c16addrh & "010000000"	when memres='0' and gmode(1)='1' else
						nxt_g0r1c4addrh & "10000000"	when memres='1' else
						(others=>'0');
	nxt_g2addr<=	nxt_g2r0c4addrh & "0000000"		when memres='0' and gmode="00" else
						nxt_g1r0c8addrh & "00000000"	when memres='0' and gmode="01" else
						nxt_g0r0c16addrh & "100000000"	when memres='0' and gmode(1)='1' else
						(others=>'0');
	nxt_g3addr<=	nxt_g3r0c4addrh & "0000000"		when memres='0' and gmode="00" else
						nxt_g1r0c8addrh & "10000000"	when memres='0' and gmode="01" else
						nxt_g0r0c16addrh & "110000000"	when memres='0' and gmode(1)='1' else
						(others=>'0');
					
	cur_g0addr<=	cur_g0r0c4addrh & cur_g0r0c4addrl 						when memres='0' and gmode="00" else
						cur_g0r0c8addrh & '0' & cur_g0r0c8addrl(6 downto 0) 	when memres='0' and gmode="01" else
						cur_g0r0c16addrh & "00" & cur_g0r0c16addrl(6 downto 0)	when memres='0' and gmode(1)='1' else
						cur_g0r1c4addrh & '0' & cur_g0r1c4addrl(6 downto 0)		when memres='1' else
						(others=>'0');
	cur_g1addr<=	cur_g1r0c4addrh & cur_g1r0c4addrl 						when memres='0' and gmode="00" else
						cur_g0r0c8addrh & '1' & cur_g0r0c8addrl(6 downto 0) 	when memres='0' and gmode="01" else
						cur_g0r0c16addrh & "01" & cur_g0r0c16addrl(6 downto 0)	when memres='0' and gmode(1)='1' else
						cur_g0r1c4addrh & '1' & cur_g0r1c4addrl(6 downto 0)		when memres='1' else
						(others=>'0');
	cur_g2addr<=	cur_g2r0c4addrh & cur_g2r0c4addrl 						when memres='0' and gmode="00" else
						cur_g1r0c8addrh & '0' & cur_g1r0c8addrl(6 downto 0) 	when memres='0' and gmode="01" else
						cur_g0r0c16addrh & "10" & cur_g0r0c16addrl(6 downto 0)	when memres='0' and gmode(1)='1' else
						(others=>'0');
	cur_g3addr<=	cur_g3r0c4addrh & cur_g3r0c4addrl 						when memres='0' and gmode="00" else
						cur_g1r0c8addrh & '1' & cur_g1r0c8addrl(6 downto 0) 	when memres='0' and gmode="01" else
						cur_g0r0c16addrh & "11" & cur_g0r0c16addrl(6 downto 0)	when memres='0' and gmode(1)='1' else
						(others=>'0');

	datsel<=			cur_g1r0c8addrl(7) & cur_g0r0c8addrl(7) when memres='0' and gmode="01" else
						cur_g0r0c16addrl(8 downto 7) when memres='0' and gmode(1)='1' else
						'0' & cur_g0r1c4addrl(7) when memres='1' else
						(others=>'0');
	
	g40_ddat<=	g1_rdat(15 downto 12) when g0hodly1(1 downto 0)="00" and memres='1' and datseld(0)='1' else
					g1_rdat(11 downto  8) when g0hodly1(1 downto 0)="01" and memres='1' and datseld(0)='1' else
					g1_rdat( 7 downto  4) when g0hodly1(1 downto 0)="10" and memres='1' and datseld(0)='1' else
					g1_rdat( 3 downto  0) when g0hodly1(1 downto 0)="11" and memres='1' and datseld(0)='1' else
					g0_rdat(15 downto 12) when g0hodly1(1 downto 0)="00" else
					g0_rdat(11 downto  8) when g0hodly1(1 downto 0)="01" else
					g0_rdat( 7 downto  4) when g0hodly1(1 downto 0)="10" else
					g0_rdat( 3 downto  0) when g0hodly1(1 downto 0)="11" else
					x"0";
	g41_ddat<=	g1_rdat(15 downto 12) when g1hodly1(1 downto 0)="00" else
					g1_rdat(11 downto  8) when g1hodly1(1 downto 0)="01" else
					g1_rdat( 7 downto  4) when g1hodly1(1 downto 0)="10" else
					g1_rdat( 3 downto  0) when g1hodly1(1 downto 0)="11" else
					x"0";
	g42_ddat<=	g2_rdat(15 downto 12) when g2hodly1(1 downto 0)="00" else
					g2_rdat(11 downto  8) when g2hodly1(1 downto 0)="01" else
					g2_rdat( 7 downto  4) when g2hodly1(1 downto 0)="10" else
					g2_rdat( 3 downto  0) when g2hodly1(1 downto 0)="11" else
					x"0";
	g43_ddat<=	g3_rdat(15 downto 12) when g3hodly1(1 downto 0)="00" else
					g3_rdat(11 downto  8) when g3hodly1(1 downto 0)="01" else
					g3_rdat( 7 downto  4) when g3hodly1(1 downto 0)="10" else
					g3_rdat( 3 downto  0) when g3hodly1(1 downto 0)="11" else
					x"0";
	
	g80_ddat<=	g0_rdat(15 downto 8) when g0hodly1(0)='0' and datseld(0)='0' else
					g0_rdat( 7 downto 0) when g0hodly1(0)='1' and datseld(0)='0' else
					g1_rdat(15 downto 8) when g0hodly1(0)='0' and datseld(0)='1' else
					g1_rdat( 7 downto 0) when g0hodly1(0)='1' and datseld(0)='1' else
					x"00";
	g81_ddat<=	g2_rdat(15 downto 8) when g2hodly1(0)='0' and datseld(1)='0' else
					g2_rdat( 7 downto 0) when g2hodly1(0)='1' and datseld(1)='0' else
					g3_rdat(15 downto 8) when g2hodly1(0)='0' and datseld(1)='1' else
					g3_rdat( 7 downto 0) when g2hodly1(0)='1' and datseld(1)='1' else
					x"00";
	
	g16_ddat<=	g0_rdat when datseld="00" else
					g1_rdat when datseld="01" else
					g2_rdat when datseld="10" else
					g3_rdat when datseld="11" else
					x"0000";
	
	g4p1_ddat<=	g40_ddat when grpri(1 downto 0)="00" else
					g41_ddat when grpri(1 downto 0)="01" else
					g42_ddat when grpri(1 downto 0)="10" else
					g43_ddat when grpri(1 downto 0)="11" else
					x"0";
	g4p2_ddat<=	g40_ddat when grpri(3 downto 2)="00" else
					g41_ddat when grpri(3 downto 2)="01" else
					g42_ddat when grpri(3 downto 2)="10" else
					g43_ddat when grpri(3 downto 2)="11" else
					x"0";
	g4p3_ddat<=	g40_ddat when grpri(5 downto 4)="00" else
					g41_ddat when grpri(5 downto 4)="01" else
					g42_ddat when grpri(5 downto 4)="10" else
					g43_ddat when grpri(5 downto 4)="11" else
					x"0";
	g4p4_ddat<=	g40_ddat when grpri(7 downto 6)="00" else
					g41_ddat when grpri(7 downto 6)="01" else
					g42_ddat when grpri(7 downto 6)="10" else
					g43_ddat when grpri(7 downto 6)="11" else
					x"0";
	
	g4_ddat<=	g4p1_ddat when memres='0' and  g4p1_ddat/=x"0" and graphen(0)='1' else
					g4p2_ddat when memres='0' and  g4p2_ddat/=x"0" and graphen(1)='1' else
					g4p3_ddat when memres='0' and  g4p3_ddat/=x"0" and graphen(2)='1' else
					g4p4_ddat when memres='0' and g4p4_ddat/=x"0" and graphen(3)='1' else
					g40_ddat when memres='1' and graphen(4)='1' else
					x"0";
	
	g8p1_ddat<=	g80_ddat	when grpri(1)='0' else
					g81_ddat	when grpri(1)='1' else
					x"00";
	g8p2_ddat<=	g80_ddat	when grpri(5)='0' else
					g81_ddat	when grpri(5)='1' else
					x"00";

	g8_ddat<=	g8p1_ddat when g8p1_ddat/=x"00" and graphen(0)='1' else
					g8p2_ddat when g8p2_ddat/=x"00" and graphen(3)='1' else
					x"00";
	
	grskel<='1' when exon='1' and hp='1' and gg='1' else '0';
	
	gpal0noi<=	
				x"0" & g4p1_ddat when gmode="00" and grskel='1' and g4p1_ddat(0)='1' else
				x"0" & g4_ddat when gmode="00" else
				g8p1_ddat when gmode="01" and grskel='1' and g8p1_ddat(0)='1' else
				g8_ddat when gmode="01" else
				g16_ddat(7 downto 0);
				
	gpal1noi<=
				x"0" & g4p2_ddat when gmode="00" and grskel='1' and g4p1_ddat(0)='1' else
				x"0" & g4_ddat when gmode="00" else
				g8p2_ddat when gmode="01" and grskel='1' and g8p1_ddat(0)='1' else
				g8_ddat when gmode="01" else
				g16_ddat(15 downto 8);
	
	gpal0no<=gpal0noi;
	gpal1no<=gpal1noi;
	exbit<=	'0' when bp='0' else
				g4p1_ddat(0) when gmode="00" else
				g8p1_ddat(0) when gmode="01" else
				g16_ddat(0);
	-- texbit<= '0' when bp='0' else
		

	process(vidclk)
	variable hvwidth	:std_logic_vector(10 downto 0);
	begin
		if rising_edge(vidclk) then
			if(rstn='0')then
				haddr<=(others=>'0');
				vaddr<=(others=>'0');
				raster<=(others=>'0');
				lbwr<='0';
				nxt_trd<='0';
				nxt_g0rd<='0';
				nxt_g1rd<='0';
				nxt_g2rd<='0';
				nxt_g3rd<='0';
				cur_trd<='0';
				cur_g0rd<='0';
				cur_g1rd<='0';
				cur_g2rd<='0';
				cur_g3rd<='0';
				ramsel<='0';
				cur_taddrh<=(others=>'0');
				cur_g0r0c4addrh<=(others=>'0');
				cur_g1r0c4addrh<=(others=>'0');
				cur_g2r0c4addrh<=(others=>'0');
				cur_g3r0c4addrh<=(others=>'0');
				cur_g0r1c4addrh<=(others=>'0');
				cur_g0r0c8addrh<=(others=>'0');
				cur_g1r0c8addrh<=(others=>'0');
				cur_g0r0c16addrh<=(others=>'0');
				vviden<='0';
				lvviden<='0';
				hviden<='0';
				gclrbusyb<='0';
				gclrrast<=(others=>'0');
				gclrbgnrq<='0';
				gclrendrq<='0';
			elsif (vid_ce = '1') then
				lbwr<='0';
				if(gclrbgn='1' and gclrbusyb='0')then
					gclrbusyb<='1';
					gclrbgnrq<='1';
				elsif(gclrend='1')then
					gclrendrq<='1';
				end if;
				if(hcomp='1')then
					if(gclrbgnrq='1')then
						gclrrast<=vaddr;
						gclrbgnrq<='0';
					elsif(gclrendrq='1' or gclrrast=vaddr)then
						gclrendrq<='0';
						gclrbusyb<='0';
					end if;
				end if;
				if(vpstart='1')then
					haddr<=(others=>'0');
					vaddr<=(others=>'0');
					raster<=(others=>'0');
					--h3count<=0;
					g0_clear<=	gclrpage(0) and gclrbusyb;
					g1_clear<=	gclrpage(1) and gclrbusyb;
					g2_clear<=	gclrpage(2) and gclrbusyb;
					g3_clear<=	gclrpage(3) and gclrbusyb;
					nxt_trd<=	ten;
					nxt_g0rd<=	g0en and (not (gclrpage(0) and gclrbusyb));
					nxt_g1rd<=	g1en and (not (gclrpage(1) and gclrbusyb));
					nxt_g2rd<=	g2en and (not (gclrpage(2) and gclrbusyb));
					nxt_g3rd<=	g3en and (not (gclrpage(3) and gclrbusyb));
					cur_trd<=	'0';
					cur_g0rd<=	'0';
					cur_g1rd<=	'0';
					cur_g2rd<=	'0';
					cur_g3rd<=	'0';
					ramsel<=lsel; --not ramsel;
					vviden<='1';
					hviden<= '1';--not hblank;
				elsif(hcomp='1')then
					cur_taddrh<=nxt_taddr(arange-3 downto 6);
					cur_g0r0c4addrh<=nxt_g0r0c4addrh;
					cur_g1r0c4addrh<=nxt_g1r0c4addrh;
					cur_g2r0c4addrh<=nxt_g2r0c4addrh;
					cur_g3r0c4addrh<=nxt_g3r0c4addrh;
					cur_g0r1c4addrh<=nxt_g0r1c4addrh;
					cur_g0r0c8addrh<=nxt_g0r0c8addrh;
					cur_g1r0c8addrh<=nxt_g1r0c8addrh;
					cur_g0r0c16addrh<=nxt_g0r0c16addrh;
					haddr<=(others=>'0');
					lvviden<=vviden;
					raster<=raster+"0000000001";
					hviden<='1';

					if (raster = vvend-"0000000001") then
						vviden<='0';
					end if;
					if (vblank = '0') then
						vaddr<=vaddr+"0000000001";
						g0_clear<=	gclrpage(0) and gclrbusyb;
						g1_clear<=	gclrpage(1) and gclrbusyb;
						g2_clear<=	gclrpage(2) and gclrbusyb;
						g3_clear<=	gclrpage(3) and gclrbusyb;
						nxt_trd<=	ten;
						nxt_g0rd<=	g0en and (not (gclrpage(0) and gclrbusyb));
						nxt_g1rd<=	g1en and (not (gclrpage(1) and gclrbusyb));
						nxt_g2rd<=	g2en and (not (gclrpage(2) and gclrbusyb));
						nxt_g3rd<=	g3en and (not (gclrpage(3) and gclrbusyb));
					else
						g0_clear<=	'0';
						g1_clear<=	'0';
						g2_clear<=	'0';
						g3_clear<=	'0';
						nxt_trd<=	'0';
						nxt_g0rd<=	'0';
						nxt_g1rd<=	'0';
						nxt_g2rd<=	'0';
						nxt_g3rd<=	'0';
					end if;
					cur_trd<=nxt_trd;
					cur_g0rd<=nxt_g0rd;
					cur_g1rd<=nxt_g1rd;
					cur_g2rd<=nxt_g2rd;
					cur_g3rd<=nxt_g3rd;
					ramsel<=lsel; --not ramsel;
				else
					if(haddr<"1111111111")then
						hvwidth:=(hvend-hvbgn) & "111";
						haddr<=haddr+"0000000001";
						lbwr<='1';
						if(haddr=hvwidth)then -- hres(1)='1' and
							hviden<='0';
						end if;
					else
						cur_trd<=	'0';
						cur_g0rd<=	'0';
						cur_g1rd<=	'0';
						cur_g2rd<=	'0';
						cur_g3rd<=	'0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	vlineno<=vaddr;

	rastnum<=raster;
	rint<='1' when rintline=rastnum else '0';
	
	addrx<=haddrmod(9 downto 0);
	addry<=vaddrmod(9 downto 0);

	sprio<= '1' when bp='1' and hp='0' else '0';
	-- if the address of the next highest palette is 0, then the next lowest data will be valid.
	tdoten<='0' when (txten='0' or tpalin=x"0000") else '1';--or (txt_solid='0' and t_ddatd="0000")   
	sdoten<='0' when (spren='0' or sprite_ind(3 downto 0)=x"0" or spalin=x"0000") else '1';--or (spr_solid='0' and sprite_ind=x"00")  -- sprite_ind(3 downto 0)=x"0" or
	gdoten<='0' when (grpen='0' or gpalin=x"0000") else '1';--or (grp_solid='0' and g_ddatend='0')    
	tpalno<="0000" & t_ddat;
	spalno<=sprite_in;
	
	mixg<=	('0' & mixsrc(15 downto 11)) + ('0' & gpalin(15 downto 11));
	mixr<=	('0' & mixsrc(10 downto  6)) + ('0' & gpalin(10 downto  6));
	mixb<=	('0' & mixsrc( 5 downto  1)) + ('0' & gpalin( 5 downto  1));
	mixdst<=	mixg(5 downto 1) & mixr(5 downto 1) & mixb(5 downto 1) & mixsrc(0);
	gmixdat<=mixdst	when ah='1' and exbitd='1' else
				mixdst	when exon='1' and hp='1' and exbitd='1' else
				mixdst	when exon='1' and sprio='1' and gpal0in/=x"0000" else
				gpalin;

	wdatpr0<=
		tpalin	when pri_tx="00" and txten='1' and tdoten = '1' else
		spalin	when pri_sp="00" and spren='1' and sdoten = '1' else
		gmixdat	when pri_gr="00" and grpen='1' and gdoten = '1' else
		tpal0in;
	wdatpr1<=
		tpalin	when pri_tx="01" and txten='1' and tdoten = '1' else
		spalin	when pri_sp="01" and spren='1' and sdoten = '1' else
		gmixdat	when pri_gr="01" and grpen='1' and gdoten = '1' else
		tpal0in;
	wdatpr2<=
		tpalin	when (pri_tx="10" or pri_tx="11") and txten='1' and tdoten = '1' else
		spalin	when (pri_sp="10" or pri_sp="11") and spren='1' and sdoten = '1' else
		gmixdat	when (pri_gr="10" or pri_gr="11") and grpen='1' and gdoten = '1' else
		tpal0in;
	msrcpr1<=	tpalin	when pri_tx="01" and txten='1' else
					spalin	when pri_sp="01" and spren='1' else
					(others=>'0');
	msrcpr2<=	tpalin	when pri_tx="10" and txten='1' else
					spalin	when pri_sp="10" and spren='1' else
					(others=>'0');
	msenpr1<=	tdoten when pri_tx="01" else
					sdoten when pri_sp="01" else
					'0';
	msenpr2<=	tdoten when pri_tx="10" else
					sdoten when pri_sp="10" else
					'0';
	mixsrc<=	tpal0in when ah='1' else
				msrcpr1	when (msrcpr1/=x"0000" and msenpr1='1' and pri_gr="00") else
				msrcpr2	when (msrcpr2/=x"0000" and msenpr2='1') else
				tpal0in;
	-- tx_pal_0 <= '1' when t_ddatd="0000" else '0';
	-- sp_pal_0 <= '1' when sprite_ind=x"00" else '0';
	-- gr_pal_0 <= '1' when g_ddatend='0' else '0';

	-- addrpr0<= '1' when
	-- 	(tx_pal_0='1' and pri_tx="00") or
	-- 	(sp_pal_0='1' and pri_sp="00") or
	-- 	(gr_pal_0='1' and pri_gr="00") else
	-- 	'0';

	-- addrpr1<='1' when
	-- 	(tx_pal_0='1' and pri_tx="01") or
	-- 	(sp_pal_0='1' and pri_sp="01") or
	-- 	(gr_pal_0='1' and pri_gr="01") else
	-- 	'0';

	wenpr0<= '1' when
		(tdoten='1' and pri_tx="00") or
		(sdoten='1' and pri_sp="00") or
		(gdoten='1'	and pri_gr="00") else
		'0';

	wenpr1<='1' when
		(tdoten='1' and pri_tx="01") or
		(sdoten='1' and pri_sp="01") or
		(gdoten='1'	and pri_gr="01") else
		'0';

	wenpr2<='1' when
		(tdoten='1' and (pri_tx="10" or pri_tx="11")) or
		(sdoten='1' and (pri_sp="10" or pri_sp="11")) or
		(gdoten='1'	and (pri_gr="10" or pri_gr="11")) else
		'0';

	gpriobit<='0' when bp='0' or hp='1' or exon='0' or gpalin=x"0000" else --or gpal0in/=x"0000"
		exbitd;

	tpriobit<='0';
	
	lbwdat<=(others=>'0') when lvviden='0' or lhviden='0' else
		gpalin when gpriobit='1' else
		tpalin when tpriobit='1' else
		wdatpr0	when wenpr0='1' else
		wdatpr1	when wenpr1='1' else
		wdatpr2	when wenpr2='1' else
		-- "Air Control" will show wrong colors unless this is 0000
		(others=>'0'); --when (spren='0' and txten='0' and grpen='0') else
		--tpal0in;

	lbaddr<=hadly2;
	
	g00_addr<=	g_base(arange-1 downto 18) & nxt_g0addr	when ramsel='0' else
					g_base(arange-1 downto 18) & cur_g0addr;
	g10_addr<=	g_base(arange-1 downto 18) & nxt_g0addr	when ramsel='1' else
					g_base(arange-1 downto 18) & cur_g0addr;
	g01_addr<=	g_base(arange-1 downto 18) & nxt_g1addr	when ramsel='0' else
					g_base(arange-1 downto 18) & cur_g1addr;
	g11_addr<=	g_base(arange-1 downto 18) & nxt_g1addr	when ramsel='1' else
					g_base(arange-1 downto 18) & cur_g1addr;
	g02_addr<=	g_base(arange-1 downto 18) & nxt_g2addr	when ramsel='0' else
					g_base(arange-1 downto 18) & cur_g2addr;
	g12_addr<=	g_base(arange-1 downto 18) & nxt_g2addr	when ramsel='1' else
					g_base(arange-1 downto 18) & cur_g2addr;
	g03_addr<=	g_base(arange-1 downto 18) & nxt_g3addr	when ramsel='0' else
					g_base(arange-1 downto 18) & cur_g3addr;
	g13_addr<=	g_base(arange-1 downto 18) & nxt_g3addr	when ramsel='1' else
					g_base(arange-1 downto 18) & cur_g3addr;
	t0_addr<=	nxt_taddr	when ramsel='0' else
					cur_taddr;
	t1_addr<=	nxt_taddr	when ramsel='1' else
					cur_taddr;
	g0_caddr<=	g_base(arange-1 downto 18) & nxt_g0addr(17 downto 7);
	g1_caddr<=	g_base(arange-1 downto 18) & nxt_g1addr(17 downto 7);
	g2_caddr<=	g_base(arange-1 downto 18) & nxt_g2addr(17 downto 7);
	g3_caddr<=	g_base(arange-1 downto 18) & nxt_g3addr(17 downto 7);
	g0_rdat<=	(others=>'0') when cur_g0rd='0' else
					g10_rdat	when ramsel='0' else
					g00_rdat;
	g1_rdat<=	(others=>'0') when cur_g1rd='0' else
					g11_rdat	when ramsel='0' else
					g01_rdat;
	g2_rdat<=	(others=>'0') when cur_g2rd='0' else
					g12_rdat	when ramsel='0' else
					g02_rdat;
	g3_rdat<=	(others=>'0') when cur_g3rd='0' else
					g13_rdat	when ramsel='0' else
					g03_rdat;
	t_rdat0<=	t1_rdat0	when ramsel='0' else
					t0_rdat0;
	t_rdat1<=	t1_rdat1	when ramsel='0' else
					t0_rdat1;
	t_rdat2<=	t1_rdat2	when ramsel='0' else
					t0_rdat2;
	t_rdat3<=	t1_rdat3	when ramsel='0' else
					t0_rdat3;
	g00_rd<=		nxt_g0rd	when ramsel='0' else
					cur_g0rd;
	g10_rd<=		nxt_g0rd	when ramsel='1' else
					cur_g0rd;
	g01_rd<=		nxt_g1rd	when ramsel='0' else
					cur_g1rd;
	g11_rd<=		nxt_g1rd	when ramsel='1' else
					cur_g1rd;
	g02_rd<=		nxt_g2rd	when ramsel='0' else
					cur_g2rd;
	g12_rd<=		nxt_g2rd	when ramsel='1' else
					cur_g2rd;
	g03_rd<=		nxt_g3rd	when ramsel='0' else
					cur_g3rd;
	g13_rd<=		nxt_g3rd	when ramsel='1' else
					cur_g3rd;
	t0_rd<=		nxt_trd	when ramsel='0' else
					cur_trd;
	t1_rd<=		nxt_trd	when ramsel='1' else
					cur_trd;
	
	g0en<='0' when grpen='0' else
			'1';
	g1en<='0' when grpen='0' else
			'1';
	g2en<='0' when grpen='0' else
			'0' when memres='1' else
			'1';
	g3en<='0' when grpen='0' else
			'0' when memres='1' else
			'1';
	ten<=	'0' when txten='0' else
			'1';
	
	gclrbusy<=gclrbusyb;
	vvideoen<=vviden;
	
end rtl;
