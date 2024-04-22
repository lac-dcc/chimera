LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cachecont is
generic(
	awidth	:integer	:=22;
	brsize	:integer	:=8;
	brblocks	:integer	:=4;
	refint	:integer	:=3;
	refcnt	:integer	:=64
);
port(
	b_addr	:in std_logic_vector(awidth-1 downto 0);
	b_wdat	:in std_logic_vector(15 downto 0);
	b_rdat	:out std_logic_vector(15 downto 0);
	b_rd		:in std_logic;
	b_wr		:in std_logic_vector(1 downto 0);
	b_rmw		:in std_logic_vector(1 downto 0);
	b_rmwmsk	:in std_logic_vector(15 downto 0);
	b_ack		:out std_logic;

	b_csaddr	:in std_logic_vector(awidth-brsize-1 downto 0)	:=(others=>'0');
	b_cdaddr	:in std_logic_vector(awidth-brsize-1 downto 0)	:=(others=>'0');
	b_cplane	:in std_logic_vector(3 downto 0)	:=(others=>'0');
	b_cpy		:in std_logic;
	b_cack	:out std_logic;

	g00_addr:in std_logic_vector(awidth-1 downto 0);
	g00_rd	:in std_logic;
	g00_rdat	:out std_logic_vector(15 downto 0);
	g00_ack	:out std_logic;

	g01_addr	:in std_logic_vector(awidth-1 downto 0);
	g01_rd	:in std_logic;
	g01_rdat	:out std_logic_vector(15 downto 0);
	g01_ack	:out std_logic;

	g02_addr	:in std_logic_vector(awidth-1 downto 0);
	g02_rd	:in std_logic;
	g02_rdat	:out std_logic_vector(15 downto 0);
	g02_ack	:out std_logic;

	g03_addr	:in std_logic_vector(awidth-1 downto 0);
	g03_rd	:in std_logic;
	g03_rdat	:out std_logic_vector(15 downto 0);
	g03_ack	:out std_logic;

	g10_addr	:in std_logic_vector(awidth-1 downto 0);
	g10_rd	:in std_logic;
	g10_rdat	:out std_logic_vector(15 downto 0);
	g10_ack	:out std_logic;

	g11_addr	:in std_logic_vector(awidth-1 downto 0);
	g11_rd	:in std_logic;
	g11_rdat	:out std_logic_vector(15 downto 0);
	g11_ack	:out std_logic;

	g12_addr	:in std_logic_vector(awidth-1 downto 0);
	g12_rd	:in std_logic;
	g12_rdat	:out std_logic_vector(15 downto 0);
	g12_ack	:out std_logic;

	g13_addr	:in std_logic_vector(awidth-1 downto 0);
	g13_rd	:in std_logic;
	g13_rdat	:out std_logic_vector(15 downto 0);
	g13_ack	:out std_logic;

	t0_addr	:in std_logic_vector(awidth-3 downto 0);
	t0_rd		:in std_logic;
	t0_rdat0	:out std_logic_vector(15 downto 0);
	t0_rdat1	:out std_logic_vector(15 downto 0);
	t0_rdat2	:out std_logic_vector(15 downto 0);
	t0_rdat3	:out std_logic_vector(15 downto 0);
	t0_ack	:out std_logic;
	
	t1_addr	:in std_logic_vector(awidth-3 downto 0);
	t1_rd		:in std_logic;
	t1_rdat0	:out std_logic_vector(15 downto 0);
	t1_rdat1	:out std_logic_vector(15 downto 0);
	t1_rdat2	:out std_logic_vector(15 downto 0);
	t1_rdat3	:out std_logic_vector(15 downto 0);
	t1_ack	:out std_logic;

	g0_caddr	:in std_logic_vector(awidth-1 downto 7);
	g0_clear	:in std_logic;
	
	g1_caddr	:in std_logic_vector(awidth-1 downto 7);
	g1_clear	:in std_logic;

	g2_caddr	:in std_logic_vector(awidth-1 downto 7);
	g2_clear	:in std_logic;

	g3_caddr	:in std_logic_vector(awidth-1 downto 7);
	g3_clear	:in std_logic;
	
	fde_addr	:in std_logic_vector(awidth-1 downto 0)	:=(others=>'0');
	fde_rdat	:out std_logic_vector(15 downto 0);
	fde_wdat	:in std_logic_vector(15 downto 0)	:=(others=>'0');
	fde_wr	:in std_logic	:='0';
	fde_tlen	:in std_logic_vector(13 downto 0)	:=(others=>'1');
	
	fec_addr		:out std_logic_vector(7 downto 0);
	fec_rdat		:out std_logic_vector(15 downto 0);
	fec_wdat		:in std_logic_vector(15 downto 0)	:=(others=>'0');
	fec_we		:out std_logic;
	fec_addrh	:in std_logic_vector(awidth-9 downto 0)	:=(others=>'0');
	fec_rd		:in std_logic	:='0';
	fec_wr		:in std_logic	:='0';
	fec_busy		:out std_logic;

	ramaddrh		:out std_logic_vector(awidth-9 downto 0);
	rambgnaddr	:out std_logic_vector(7 downto 0);
	ramendaddr	:out std_logic_vector(7 downto 0);
	rambwidth	:out integer range 1 to 8;
	ramaddrrc	:in std_logic_vector(7 downto 0);
	ramaddrwc	:in std_logic_vector(7 downto 0);
	ramrd			:out std_logic;
	ramwr			:out std_logic;
	ramrefrsh	:out std_logic;
	rambusy		:in std_logic;
	ramde			:in std_logic;
	ramrdat		:in std_logic_vector(15 downto 0);
	ramwdat		:out std_logic_vector(15 downto 0);
	ramwe			:out std_logic_vector(1 downto 0);
	ramabort		:out std_logic;
	
	ini_end	:out std_logic;
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	fclk	:in std_logic;
	fd_ce   :in std_logic := '1';
	rclk	:in std_logic;
	ram_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end cachecont;

architecture rtl of cachecont is
signal	lb_addr		:std_logic_vector(awidth-1 downto 0);
signal	lb_csaddr	:std_logic_vector(awidth-brsize-1 downto 0);
signal	lb_cdaddr	:std_logic_vector(awidth-brsize-1 downto 0);
signal	lb_rd		:std_logic;
signal	lb_wr		:std_logic_vector(1 downto 0);
signal	lb_rmw		:std_logic_vector(1 downto 0);
signal	sb_addr		:std_logic_vector(awidth-1 downto 0);
signal	sb_rd		:std_logic;
signal	sb_wr		:std_logic_vector(1 downto 0);
signal	sb_rmw		:std_logic_vector(1 downto 0);
signal	brcache_sel	:integer range 0 to brblocks-1;
signal	bwcache_sel	:std_logic;
type braddr_t is array(brblocks-1 downto 0) of std_logic_vector(awidth-brsize downto 0);
signal	braddr		:braddr_t;
signal	braddr_sel	:std_logic_vector(awidth-brsize downto 0);
signal	brwr		:std_logic_vector(brblocks-1 downto 0);
type brwrb_t is array(brblocks-1 downto 0) of std_logic_vector(1 downto 0);
signal	brwrb		:brwrb_t;
signal	bwaddr0		:std_logic_vector(awidth-brsize-1 downto 0);
signal	bwaddr1		:std_logic_vector(awidth-brsize-1 downto 0);
signal	bwaddr_sel	:std_logic_vector(awidth-brsize-1 downto 0);
signal	bwaddr_nsel	:std_logic_vector(awidth-brsize-1 downto 0);
signal	brcache_ext	:std_logic_vector(brblocks-1 downto 0);
signal	brcache_exts:std_logic;
signal	brcache_busyv:std_logic_vector(brblocks-1 downto 0);
signal	brcache_busy:std_logic;
signal	bwcache_ext0:std_logic_vector(1 downto 0);
signal	bwcache_ext1:std_logic_vector(1 downto 0);
signal	bwcache_busy0:std_logic;
signal	bwcache_busy1:std_logic;
signal	bwcache_busy:std_logic;
signal	brcache_clr	:std_logic_vector(brblocks-1 downto 0);
signal	bwcache_clr0:std_logic;
signal	bwcache_clr1:std_logic;
signal	brcache_rdath:std_logic_vector(7 downto 0);
signal	brcache_rdatl:std_logic_vector(7 downto 0);
signal	brcache_wdath:std_logic_vector(7 downto 0);
signal	brcache_wdatl:std_logic_vector(7 downto 0);
signal	ramaddr		:std_logic_vector(7 downto 0);
signal	brcache_extwr	:std_logic_vector(brblocks-1 downto 0);
signal	waddrmin	:std_logic_vector(brsize-1 downto 0);
signal	waddrmax	:std_logic_vector(brsize-1 downto 0);
signal	wminmaxclr	:std_logic;
signal	wminmaxall	:std_logic;
type	brdat_t	is array(brblocks-1 downto 0) of std_logic_vector(7 downto 0);
signal	brdath	:brdat_t;
signal	brdatl	:brdat_t;
signal	brack		:std_logic;
signal	backx		:std_logic;
signal	bwwdath		:std_logic_vector(7 downto 0);
signal	bwwdatl		:std_logic_vector(7 downto 0);
signal	bwack		:std_logic;
signal	bwwr0		:std_logic_vector(1 downto 0);
signal	bwwr1		:std_logic_vector(1 downto 0);
signal	bwwr0m		:std_logic_vector(1 downto 0);
signal	bwwr1m		:std_logic_vector(1 downto 0);
signal	bwwe0		:std_logic_vector(1 downto 0);
signal	bwwe1		:std_logic_vector(1 downto 0);
signal	bwwes		:std_logic_vector(1 downto 0);
signal	bwwens		:std_logic_vector(1 downto 0);
signal	bwwdat0h	:std_logic_vector(7 downto 0);
signal	bwwdat0l	:std_logic_vector(7 downto 0);
signal	bwwdat1h	:std_logic_vector(7 downto 0);
signal	bwwdat1l	:std_logic_vector(7 downto 0);
signal	bwwdat		:std_logic_vector(15 downto 0);
signal	brwdath		:std_logic_vector(7 downto 0);
signal	brwdatl		:std_logic_vector(7 downto 0);
signal	b_wdatm		:std_logic_vector(15 downto 0);
signal	b_rdatb		:std_logic_vector(15 downto 0);
signal	brmwack		:std_logic;
signal	BWewaddr	:std_logic_vector(7 downto 0);
signal	braddrnone	:std_logic;
signal	bcreadno	:integer range 0 to brblocks-1;
signal	bcread		:std_logic;
signal	bcnext		:integer range 0 to brblocks-1;
signal	bcget		:std_logic;
signal	rmw_rdat	:std_logic_vector(15 downto 0);

signal	sb_cpy,lsb_cpy	:std_logic;
signal	bcpend		:std_logic;
signal	b_cwr0		:std_logic;
signal	b_cwr1		:std_logic;
signal	ramaddrwcb	:std_logic_vector(7 downto 0);
signal	ramaddrwex	:std_logic_vector(7 downto 0);
signal	bcackx		:std_logic;
signal	cpbusy		:std_logic;
signal	bcmask		:std_logic_vector(3 downto 0);
signal	biwdata0	:std_logic_Vector(0 downto 0);
signal	biwdata1	:std_logic_Vector(0 downto 0);

signal	g0caddrh	:std_logic_vector(awidth-8 downto 0);
signal	g1caddrh	:std_logic_vector(awidth-8 downto 0);
signal	g2caddrh	:std_logic_vector(awidth-8 downto 0);
signal	g3caddrh	:std_logic_vector(awidth-8 downto 0);

signal	g00addrh	:std_logic_vector(awidth-8 downto 0);
signal	g00rwdath	:std_logic_vector(7 downto 0);
signal	g00rwdatl	:std_logic_vector(7 downto 0);
signal	g00rwr		:std_logic;

signal	g01addrh	:std_logic_vector(awidth-8 downto 0);
signal	g01rwdath	:std_logic_vector(7 downto 0);
signal	g01rwdatl	:std_logic_vector(7 downto 0);
signal	g01rwr		:std_logic;

signal	g02addrh	:std_logic_vector(awidth-8 downto 0);
signal	g02rwdath	:std_logic_vector(7 downto 0);
signal	g02rwdatl	:std_logic_vector(7 downto 0);
signal	g02rwr		:std_logic;

signal	g03addrh	:std_logic_vector(awidth-8 downto 0);
signal	g03rwdath	:std_logic_vector(7 downto 0);
signal	g03rwdatl	:std_logic_vector(7 downto 0);
signal	g03rwr		:std_logic;

signal	g10addrh	:std_logic_vector(awidth-8 downto 0);
signal	g10rwdath	:std_logic_vector(7 downto 0);
signal	g10rwdatl	:std_logic_vector(7 downto 0);
signal	g10rwr		:std_logic;

signal	g11addrh	:std_logic_vector(awidth-8 downto 0);
signal	g11rwdath	:std_logic_vector(7 downto 0);
signal	g11rwdatl	:std_logic_vector(7 downto 0);
signal	g11rwr		:std_logic;

signal	g12addrh	:std_logic_vector(awidth-8 downto 0);
signal	g12rwdath	:std_logic_vector(7 downto 0);
signal	g12rwdatl	:std_logic_vector(7 downto 0);
signal	g12rwr		:std_logic;

signal	g13addrh	:std_logic_vector(awidth-8 downto 0);
signal	g13rwdath	:std_logic_vector(7 downto 0);
signal	g13rwdatl	:std_logic_vector(7 downto 0);
signal	g13rwr		:std_logic;

signal	t0addrh		:std_logic_vector(awidth-9 downto 0);
signal	t0rwdath		:std_logic_vector(7 downto 0);
signal	t0rwdatl		:std_logic_vector(7 downto 0);
signal	t0rwr		:std_logic;
signal	t0rwrq		:std_logic_vector(3 downto 0);

signal	t1addrh		:std_logic_vector(awidth-9 downto 0);
signal	t1rwdath		:std_logic_vector(7 downto 0);
signal	t1rwdatl		:std_logic_vector(7 downto 0);
signal	t1rwr		:std_logic;
signal	t1rwrq		:std_logic_vector(3 downto 0);

signal	fde_caddr	:std_logic_vector(awidth-9 downto 0);
signal	fde_daddr	:std_logic_vector(awidth-9 downto 0);
signal	fde_addr0	:std_logic_vector(awidth-9 downto 0);
signal	fde_addr1	:std_logic_vector(awidth-9 downto 0);
signal	fde_addr0s	:std_logic_vector(awidth-9 downto 0);
signal	fde_addr1s	:std_logic_vector(awidth-9 downto 0);
signal	fde_sel		:std_logic;
signal	fde_rdat0	:std_logic_vector(15 downto 0);
signal	fde_rdat1	:std_logic_vector(15 downto 0);
signal	fde_wr0		:std_logic;
signal	fde_wr1		:std_logic;
signal	e0cwr,e1cwr	:std_logic;
signal	ewdat0		:std_logic_vector(15 downto 0);
signal	ewdat1		:std_logic_vector(15 downto 0);
signal	ewdat		:std_logic_vector(15 downto 0);
signal	ramaddrwcf	:std_logic_vector(7 downto 0);
constant bcazero	:std_logic_vector(brsize-1 downto 0)	:=(others=>'0');

signal	bfaddr		:std_logic_vector(brsize-1 downto 0);
signal	vrcawr		:std_logic;
signal	b_cdaddra	:std_logic_vector(awidth-1 downto 0);
signal	g00rwdat	:std_logic_vector(15 downto 0);
signal	g01rwdat	:std_logic_vector(15 downto 0);
signal	g02rwdat	:std_logic_vector(15 downto 0);
signal	g03rwdat	:std_logic_vector(15 downto 0);
signal	g10rwdat	:std_logic_vector(15 downto 0);
signal	g11rwdat	:std_logic_vector(15 downto 0);
signal	g12rwdat	:std_logic_vector(15 downto 0);
signal	g13rwdat	:std_logic_vector(15 downto 0);
signal	st_addr	:std_logic_vector(awidth-9 downto 0);
signal	lt_addr	:std_logic_vector(awidth-9 downto 0);
signal	fec_rdq,fec_wrq	:std_logic;
signal	t0rwdat		:std_logic_vector(15 downto 0);
signal	t1rwdat		:std_logic_vector(15 downto 0);
signal	sfec_addrh	:std_logic_vector(awidth-9 downto 0);
signal	lfec_addrh	:std_logic_vector(awidth-9 downto 0);
signal	t0_addra		:std_logic_vector(awidth-1 downto 0);
signal	t1_addra		:std_logic_vector(awidth-1 downto 0);
signal	aborted	:std_logic;
signal	wren		:std_logic;
signal	swren		:std_logic;
signal	lwren		:std_logic;

signal	sbwack	:std_logic;
signal	sbrmwack	:std_logic;

signal	refcount		:integer range 0 to refcnt-1;
signal	lastvid		:std_logic;
type state_t is (
	ST_IDLE,
	ST_BREAD,
	ST_BWRITE,
	ST_BCREAD,
	ST_G0CLR,
	ST_G1CLR,
	ST_G2CLR,
	ST_G3CLR,
	ST_G00READ,
	ST_G01READ,
	ST_G02READ,
	ST_G03READ,
	ST_T0READ,
	ST_G10READ,
	ST_G11READ,
	ST_G12READ,
	ST_G13READ,
	ST_T1READ,
	ST_FDEREAD,
	ST_FDEWRITE,
	ST_FECREAD,
	ST_FECWRITE,
	ST_REFRSH
);
signal	RAM_STATE	:state_t;

type rmwstate_t is(
	rmw_IDLE,
	rmw_READ,
	rmw_MOD,
	rmw_WRITE
);
signal	rmw_state	:rmwstate_t;

component cacheext
generic(
	awidth	:integer	:=8
);
port(
	wraddr	:in std_logic_vector(awidth-1 downto 0);
	wr		:in std_logic;
	clr		:in std_logic;
	busy	:out std_logic;
	
	rdaddr	:in std_logic_vector(awidth-1 downto 0);
	rd		:out std_logic;
	masken	:in std_logic;
	
	wclk	:in std_logic;
	ram_ce  :in std_logic := '1';
	rclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component CACHEMEMN
	generic(
		awidth	:integer	:=8;
		dwidth	:integer	:=8
	);
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (awidth-1 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (awidth-1 DOWNTO 0);
		clock_a		: IN STD_LOGIC  := '1';
		clock_b		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (dwidth-1 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (dwidth-1 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (dwidth-1 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (dwidth-1 DOWNTO 0)
	);
END component;

component CACHEMEMWN
	generic(
		awidth	:integer	:=8
	);
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (awidth-1 DOWNTO 0);
		rdclock		: IN STD_LOGIC ;
		wraddress		: IN STD_LOGIC_VECTOR (awidth-1 DOWNTO 0);
		wrclock		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component vrcack
generic(
	awidth	:integer	:=22;
	cwidth	:integer	:=8
);
port(
	rd		:in std_logic;
	rdaddr	:in std_logic_vector(awidth-1 downto 0);
	raddrh	:in std_logic_vector(awidth-cwidth-1 downto 0);
	rcaddr	:in std_logic_vector(cwidth-1 downto 0);
	de		:in std_logic;
	
	ack		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component cachesel
generic(
	blocks	:integer	:=4
);
port(
	useno	:in integer range 0 to blocks-1;
	used	:in std_logic;
	
	nextno	:out integer range 0 to blocks-1;
	currno	:in integer range 0 to blocks-1;
	get		:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component clktx
port(
	txin	:in std_logic;
	txout	:out std_logic;
	
	fclk	:in std_logic;
	fd_ce   :in std_logic := '1';
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin

	braddr_sel<=braddr(brcache_sel);
	--brcache_exts<=brcache_ext(brcache_sel);

	bwaddr_sel<=bwaddr0 when bwcache_sel='0' else bwaddr1;
	--bwaddr_nsel<=bwaddr1 when bwcache_sel='0' else bwaddr0;
	
	b_wdatm<=	b_wdat when b_wr/="00" else
				(rmw_rdat and (not b_rmwmsk)) or (b_wdat and b_rmwmsk) when b_rmw/="00" else
				(others=>'0');
--	b_wdatm<=	b_wdat;

	rambwidth<=	brsize	when RAM_STATE=ST_BREAD else
				brsize	when RAM_STATE=ST_BWRITE else
				brsize	when RAM_STATE=ST_BCREAD else
				8;
	
	process(rclk,rstn)begin
		if(rstn='0')then
			lb_addr<=(others=>'0');
			lb_rd<='0';
			lb_wr<=(others=>'0');
			lb_rmw<=(others=>'0');
			sb_addr<=(others=>'0');
			sb_rd<='0';
			sb_wr<=(others=>'0');
			sb_rmw<=(others=>'0');
			st_addr<=(others=>'0');
			lt_addr<=(others=>'0');
			sfec_addrh<=(others=>'0');
			lfec_addrh<=(others=>'0');
		elsif rising_edge(rclk) then
			if (ram_ce = '1') then
				lb_rd<=b_rd;
				lb_wr<=b_wr;
				lb_rmw<=b_rmw;
				lb_addr<=b_addr;
				lt_addr<=fde_addr(awidth-1 downto 8);
				lfec_addrh<=fec_addrh;
				if(lb_addr=b_addr)then
					sb_addr<=lb_addr;
				end if;
				if(lb_rd=b_rd)then
					sb_rd<=lb_rd;
				end if;
				if(lb_wr=b_wr)then
					sb_wr<=lb_wr;
				end if;
				if(lb_rmw=b_rmw)then
					sb_rmw<=lb_rmw;
				end if;
				if(lt_addr=fde_addr(awidth-1 downto 8))then
					st_addr<=lt_addr;
				end if;
				if(lfec_addrh=fec_addrh)then
					sfec_addrh<=lfec_addrh;
				end if;
			end if;
		end if;
	end process;
	
	process(sb_addr,braddr)begin
		braddrnone<='1';
		for i in 0 to brblocks-1 loop
			if(braddr(i)=('0' & sb_addr(awidth-1 downto brsize)))then
				braddrnone<='0';
			end if;
		end loop;
	end process;

	csel:cachesel generic map(brblocks) port map(
		useno	=>bcreadno,
		used	=>bcread,
		
		nextno	=>bcnext,
		currno	=>brcache_sel,
		get		=>bcget,
		
		clk		=>rclk,
		ce      =>ram_ce,
		rstn	=>rstn
	);
	
	fde_caddr<=fde_addr0 when fde_sel='0' else fde_addr1;
	fde_daddr<=fde_addr1 when fde_sel='0' else fde_addr0;
	
	process(fclk,rstn)
	variable addr0l	:std_logic_vector(awidth-9 downto 0);
	variable addr1l	:std_logic_vector(awidth-9 downto 0);
	variable addr0s	:std_logic_vector(awidth-9 downto 0);
	variable addr1s	:std_logic_vector(awidth-9 downto 0);
	begin
		if(rstn='0')then
			fde_addr0s<=(others=>'1');
			fde_addr1s<=(others=>'1');
			addr0l:=(others=>'0');
			addr1l:=(others=>'0');
			addr0s:=(others=>'0');
			addr1s:=(others=>'0');
		elsif rising_edge(fclk) then
				if (fd_ce = '1') then
				addr0s:=fde_addr0;
				addr1s:=fde_addr1;
				if(addr0s=addr0l)then
					fde_addr0s<=addr0l;
				end if;
				if(addr1s=addr1l)then
					fde_addr1s<=addr1l;
				end if;
				addr0l:=addr0s;
				addr1l:=addr1s;
			end if;
		end if;
	end process;
			
	fde_rdat<=	fde_rdat0 when fde_addr0s=fde_addr(awidth-1 downto 8) else
				fde_rdat1 when fde_addr1s=fde_addr(awidth-1 downto 8) else
				(others=>'0');
	fde_wr0<=fde_wr when fde_addr0s=fde_addr(awidth-1 downto 8) else '0';
	fde_wr1<=fde_wr when fde_addr1s=fde_addr(awidth-1 downto 8) else '0';
	
	--wren<='1' when b_wr/="00" or b_rmw/="00" else '0';
	
	process(rclk,rstn)
	variable nxtaddr	:std_logic_vector(awidth-9 downto 0);
	variable f0_wrote,f1_wrote	:std_logic;
	variable lfec_rd,lfec_wr	:std_logic_vector(2 downto 0);
	begin
		if(rstn='0')then
			brcache_sel<=0;
			bwcache_sel<='0';
			for i in 0 to brblocks-1 loop
				braddr(i)<=(others=>'1');
			end loop;
			bwaddr0<=(others=>'1');
			bwaddr1<=(others=>'1');
			rambgnaddr<=(others=>'0');
			ramendaddr<=(others=>'0');
			ramaddrh<=(others=>'0');
			g00addrh<=(others=>'0');
			g01addrh<=(others=>'0');
			g02addrh<=(others=>'0');
			g03addrh<=(others=>'0');
			g10addrh<=(others=>'0');
			g11addrh<=(others=>'0');
			g12addrh<=(others=>'0');
			g13addrh<=(others=>'0');
			g0caddrh<=(others=>'0');
			g1caddrh<=(others=>'0');
			g2caddrh<=(others=>'0');
			g3caddrh<=(others=>'0');
			t0addrh<=(others=>'0');
			t1addrh<=(others=>'0');
			fde_addr0<=(others=>'1');
			fde_addr1<=(others=>'1');
			RAM_STATE<=ST_IDLE;
			wminmaxclr<='0';
			wminmaxall<='0';
			cpbusy<='0';
			bcmask<=(others=>'0');
			brcache_clr<=(others=>'0');
			bwcache_clr0<='0';
			bwcache_clr1<='0';
			refcount<=refint-1;
			lastvid<='0';
			bcpend<='0';
			bcget<='0';
			fde_sel<='0';
			fec_busy<='0';
			fec_rdq<='0';
			fec_wrq<='0';
			f0_wrote:='0';
			f1_wrote:='0';
			lfec_rd:="000";
			lfec_wr:="000";
			ramabort<='0';
			aborted<='0';
			--swren<='0';
			--lwren<='0';
		elsif rising_edge(rclk) then
			if (ram_ce = '1') then
				brcache_clr<=(others=>'0');
				bwcache_clr0<='0';
				bwcache_clr1<='0';
				ramrd<='0';
				ramwr<='0';
				ramrefrsh<='0';
				ramabort<='0';
				wminmaxclr<='0';
				wminmaxall<='0';
				bcget<='0';
				--swren<=wren;
				--lwren<=swren;
				lsb_cpy<=sb_cpy;
				sb_cpy<=b_cpy;
				if(fde_wr0='1')then
					f0_wrote:='1';
				elsif(fde_wr1='1')then
					f1_wrote:='1';
				end if;
				if(lfec_rd="011")then
					fec_rdq<='1';
					fec_busy<='1';
				end if;
				if(lfec_wr="011")then
					fec_wrq<='1';
					fec_busy<='1';
				end if;
				if(lsb_cpy='1' and sb_cpy='0')then
					bcpend<='1';
				end if;
				lfec_rd:=lfec_rd(1 downto 0) & fec_rd;
				lfec_wr:=lfec_wr(1 downto 0) & fec_wr;
				case RAM_STATE is
				when ST_IDLE =>
					if(refcount=0)then
						ramrefrsh<='1';
						refcount<=refint-1;
						RAM_STATE<=ST_REFRSH;
						lastvid<='0';
					elsif(g00_addr(awidth-1 downto 7)/=g00addrh and g00_rd='1' and lastvid='0' and rambusy='0')then
						g00addrh<=g00_addr(awidth-1 downto 7);
						ramaddrh<=g00_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G00READ;
						rambgnaddr<=g00_addr(7) & "0000000";
						ramendaddr<=not g00_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g01_addr(awidth-1 downto 7)/=g01addrh and g01_rd='1' and lastvid='0' and rambusy='0')then
						g01addrh<=g01_addr(awidth-1 downto 7);
						ramaddrh<=g01_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G01READ;
						rambgnaddr<=g01_addr(7) & "0000000";
						ramendaddr<=not g01_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g02_addr(awidth-1 downto 7)/=g02addrh and g02_rd='1' and lastvid='0' and rambusy='0')then
						g02addrh<=g02_addr(awidth-1 downto 7);
						ramaddrh<=g02_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G02READ;
						rambgnaddr<=g02_addr(7) & "0000000";
						ramendaddr<=not g02_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g03_addr(awidth-1 downto 7)/=g03addrh and g03_rd='1' and lastvid='0' and rambusy='0')then
						g03addrh<=g03_addr(awidth-1 downto 7);
						ramaddrh<=g03_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G03READ;
						rambgnaddr<=g03_addr(7) & "0000000";
						ramendaddr<=not g03_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(t0_addr(awidth-3 downto 6)/=t0addrh and t0_rd='1' and lastvid='0' and rambusy='0')then
						t0addrh<=t0_addr(awidth-3 downto 6);
						ramaddrh<=t0_addr(awidth-3downto 6);
						RAM_STATE<=ST_T0READ;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'0');
						ramrd<='1';
						lastvid<='1';
					elsif(g10_addr(awidth-1 downto 7)/=g10addrh and g10_rd='1' and lastvid='0' and rambusy='0')then
						g10addrh<=g10_addr(awidth-1 downto 7);
						ramaddrh<=g10_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G10READ;
						rambgnaddr<=g10_addr(7) & "0000000";
						ramendaddr<=not g10_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g11_addr(awidth-1 downto 7)/=g11addrh and g11_rd='1' and lastvid='0' and rambusy='0')then
						g11addrh<=g11_addr(awidth-1 downto 7);
						ramaddrh<=g11_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G11READ;
						rambgnaddr<=g11_addr(7) & "0000000";
						ramendaddr<=not g11_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g12_addr(awidth-1 downto 7)/=g12addrh and g12_rd='1' and lastvid='0' and rambusy='0')then
						g12addrh<=g12_addr(awidth-1 downto 7);
						ramaddrh<=g12_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G12READ;
						rambgnaddr<=g12_addr(7) & "0000000";
						ramendaddr<=not g12_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(g13_addr(awidth-1 downto 7)/=g13addrh and g13_rd='1' and lastvid='0' and rambusy='0')then
						g13addrh<=g13_addr(awidth-1 downto 7);
						ramaddrh<=g13_addr(awidth-1 downto 8);
						RAM_STATE<=ST_G13READ;
						rambgnaddr<=g13_addr(7) & "0000000";
						ramendaddr<=not g13_addr(7) & "0000000";
						ramrd<='1';
						lastvid<='1';
					elsif(t1_addr(awidth-3 downto 6)/=t1addrh and t1_rd='1' and lastvid='0' and rambusy='0')then
						t1addrh<=t1_addr(awidth-3 downto 6);
						ramaddrh<=t1_addr(awidth-3downto 6);
						RAM_STATE<=ST_T1READ;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'0');
						ramrd<='1';
						lastvid<='1';
					elsif(g0_caddr/=g0caddrh and g0_clear='1' and lastvid='0' and rambusy='0')then
						g0caddrh<=g0_caddr;
						ramaddrh<=g0_caddr(awidth-1 downto 8);
						RAM_STATE<=ST_G0CLR;
						rambgnaddr<=g0_caddr(7) & "0000000";
						ramendaddr<=g0_caddr(7) & "1111111";
						ramwr<='1';
						lastvid<='1';
					elsif(g1_caddr/=g1caddrh and g1_clear='1' and lastvid='0' and rambusy='0')then
						g1caddrh<=g1_caddr;
						ramaddrh<=g1_caddr(awidth-1 downto 8);
						RAM_STATE<=ST_G1CLR;
						rambgnaddr<=g1_caddr(7) & "0000000";
						ramendaddr<=g1_caddr(7) & "1111111";
						ramwr<='1';
						lastvid<='1';
					elsif(g2_caddr/=g2caddrh and g2_clear='1' and lastvid='0' and rambusy='0')then
						g2caddrh<=g2_caddr;
						ramaddrh<=g2_caddr(awidth-1 downto 8);
						RAM_STATE<=ST_G2CLR;
						rambgnaddr<=g2_caddr(7) & "0000000";
						ramendaddr<=g2_caddr(7) & "1111111";
						ramwr<='1';
						lastvid<='1';
					elsif(g3_caddr/=g3caddrh and g3_clear='1' and lastvid='0' and rambusy='0')then
						g3caddrh<=g3_caddr;
						ramaddrh<=g3_caddr(awidth-1 downto 8);
						RAM_STATE<=ST_G3CLR;
						rambgnaddr<=g3_caddr(7) & "0000000";
						ramendaddr<=g3_caddr(7) & "1111111";
						ramwr<='1';
						lastvid<='1';
					elsif(st_addr/=fde_caddr and rambusy='0')then
						ramaddrh<=fde_caddr;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'1');
						if(fde_sel='0')then
							if(f0_wrote='1')then
								ramwr<='1';
							end if;
							f0_wrote:='0';
						else
							if(f1_wrote='1')then
								ramwr<='1';
							end if;
							f1_wrote:='0';
						end if;
						RAM_STATE<=ST_FDEWRITE;
					elsif(bcpend='1' and rambusy='0' and bwcache_busy='0')then
						if(cpbusy='0')then
							if(bwcache_sel='0')then
								bwaddr1<=(others=>'1');		--ROM area
	--							bwaddr1<=b_cdaddr;
	--							bwcache_clr1<='1';
							else
								bwaddr0<=(others=>'1');		--ROM area
	--							bwaddr0<=b_cdaddr;
	--							bwcache_clr0<='1';
							end if;
							ramaddrh<=bwaddr_sel(awidth-brsize-1 downto 8-brsize);
							rambgnaddr(brsize-1 downto 0)<=waddrmin;
							ramendaddr(brsize-1 downto 0)<=waddrmax;
							if(brsize<8)then
								rambgnaddr(7 downto brsize)<=bwaddr_sel(7-brsize downto 0);
								ramendaddr(7 downto brsize)<=bwaddr_sel(7-brsize downto 0);
							end if;
							bwcache_sel<=not bwcache_sel;
							ramwr<='1';
							lastvid<='0';
							RAM_STATE<=ST_BWRITE;
	--						wminmaxclr<='1';
							cpbusy<='1';
						else
							bcmask<=b_cplane;
							if(bwcache_sel='0')then
								bwaddr0<=b_cdaddr;
								bwcache_clr0<='1';
							else
								bwaddr1<=b_cdaddr;
								bwcache_clr1<='1';
							end if;
							ramaddrh<=b_csaddr(awidth-brsize-1 downto 8-brsize);
							rambgnaddr(brsize-1 downto 0)<=(others=>'0');
							ramendaddr(brsize-1 downto 0)<=(others=>'0');
							if(brsize<8)then
								rambgnaddr(7 downto brsize)<=b_csaddr(7-brsize downto 0);
								ramendaddr(7 downto brsize)<=(b_csaddr(7-brsize downto 0)+1);
							end if;
							RAM_STATE<=ST_BCREAD;
							wminmaxall<='1';
							ramrd<='1';
							lastvid<='0';
							bcpend<='0';
							cpbusy<='0';
						end if;
					elsif(sb_addr(awidth-1 downto brsize)/=bwaddr_sel and (sb_wr/="00" or sb_rmw/="00") and rambusy='0' and bwcache_busy='0')then
						ramaddrh<=bwaddr_sel(awidth-brsize-1 downto 8-brsize);
						if(bwcache_sel='0')then
							bwaddr1<=sb_addr(awidth-1 downto brsize);
							bwcache_clr1<='1';
						else
							bwaddr0<=sb_addr(awidth-1 downto brsize);
							bwcache_clr0<='1';
						end if;
						rambgnaddr(brsize-1 downto 0)<=waddrmin;
						ramendaddr(brsize-1 downto 0)<=waddrmax;
						if(brsize<8)then
							rambgnaddr(7 downto brsize)<=bwaddr_sel(7-brsize downto 0);
							ramendaddr(7 downto brsize)<=bwaddr_sel(7-brsize downto 0);
						end if;
						bwcache_sel<=not bwcache_sel;
						wminmaxclr<='1';
						ramwr<='1';
						lastvid<='0';
						RAM_STATE<=ST_BWRITE;
					elsif(braddrnone='1' and (sb_rd='1' or sb_rmw/="00") and rambusy='0' and brcache_busy='0')then
						ramaddrh<=sb_addr(awidth-1 downto 8);
						rambgnaddr<=sb_addr(7 downto 0);
						ramendaddr<=sb_addr(7 downto 0);
						if(aborted='1')then
							aborted<='0';
							braddr(brcache_sel)<='0' & b_addr(awidth-1 downto brsize);
						else
							brcache_sel<=bcnext;
							braddr(bcnext)<='0' & b_addr(awidth-1 downto brsize);
							brcache_clr(bcnext)<='1';
							bcget<='1';
						end if;
						ramrd<='1';
						lastvid<='0';
						RAM_STATE<=ST_BREAD;
					elsif(fec_rdq='1' and rambusy='0')then
						fec_rdq<='0';
						ramaddrh<=sfec_addrh;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'0');
						ramrd<='1';
						RAM_STATE<=ST_FECREAD;
					elsif(fec_wrq='1' and rambusy='0')then
						fec_wrq<='0';
						ramaddrh<=sfec_addrh;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'1');
						ramwr<='1';
						RAM_STATE<=ST_FECWRITE;
					else
						ramrefrsh<='1';
						if(refcount<refcnt-1)then
							refcount<=refcount+1;
						end if;
						lastvid<='0';
						RAM_STATE<=ST_REFRSH;
					end if;
				when ST_G00READ | ST_G01READ | ST_G02READ | ST_G03READ | ST_T0READ | ST_G10READ | ST_G11READ | ST_G12READ | ST_G13READ | ST_T1READ | 
						ST_G0CLR | ST_G1CLR | ST_G2CLR | ST_G3CLR | ST_FDEREAD | ST_FECREAD | ST_FECWRITE | ST_REFRSH =>
					if(rambusy='0')then
						if(RAM_STATE/=ST_REFRSH)then
							refcount<=refcount-1;
						end if;
						RAM_STATE<=ST_IDLE;
						if(RAM_STATE=ST_FECREAD or RAM_STATE=ST_FECWRITE)then
							fec_busy<='0';
						end if;
						if(RAM_STATE=ST_FDEREAD)then
							fde_sel<=not fde_sel;
						end if;
					end if;
				when ST_BREAD =>
					if(rambusy='0')then
						refcount<=refcount-1;
						RAM_STATE<=ST_IDLE;
					elsif(braddrnone='1' and (sb_rd='1' or sb_rmw/="00") and brcache_busy='0')then
						brcache_clr(brcache_sel)<='1';
						braddr(brcache_sel)<=(others=>'1');
						ramabort<='1';
						aborted<='1';
					end if;
				when st_FDEWRITE =>
					if(rambusy='0')then
						nxtaddr:=st_addr+1;
						if(nxtaddr(5 downto 0)>fde_tlen(13 downto 8))then
							nxtaddr(5 downto 0):=(others=>'0');
						end if;
						if(nxtaddr=fde_daddr)then
							nxtaddr:=st_addr;
						end if;
						if(fde_sel='0')then
							fde_addr0<=nxtaddr;
						else
							fde_addr1<=nxtaddr;
						end if;
						ramaddrh<=nxtaddr;
						rambgnaddr<=(others=>'0');
						ramendaddr<=(others=>'0');
						RAM_STATE<=ST_FDEREAD;
						ramrd<='1';
					end if;
				when ST_BWRITE =>
					if(rambusy='0')then
						refcount<=refcount-1;
						RAM_STATE<=ST_IDLE;
					end if;
				when ST_BCREAD =>
					if(rambusy='0')then
						refcount<=refcount-1;
						bcackx<=not bcackx;
						RAM_STATE<=ST_IDLE;
					end if;
				when others =>
					RAM_STATE<=ST_IDLE;
				end case;
			end if;
		end if;
	end process;
	
	gen0: for i in 0 to brblocks-1 generate
		brcache_extwr(i)<=	'0' when brcache_sel/=i else
							'1' when RAM_STATE=ST_BREAD and ramde='1' else
							'0';
		brwr(i)<=	'0' when brcache_sel/=i else
					'0' when RAM_STATE/=ST_BREAD else
					ramde;
		brwrb(i)<=	"00" when braddr(i)/=('0' & b_addr(awidth-1 downto brsize)) else
					b_rmw when brmwack='1' else
					b_wr when bwack='1' else
					"00";
	end generate;


	brwdath<=	bwwdat(15 downto 8) when braddr_sel=('0' & bwaddr_sel) and bwwes(1)='1' else
				ramrdat(15 downto 8);
				
	brwdatl<=	bwwdat(7 downto 0) when braddr_sel=('0' & bwaddr_sel) and bwwes(0)='1' else
				ramrdat(7 downto 0);
	
	
	ini_end<=rstn;
	
	bfaddr<=b_addr(brsize-1 downto 0);

	bcgen	:for i in 0 to brblocks-1 generate
	--FIXME: is ram clock supposed to be used as wclk, and sys clk as rclk?
		brcache_extF0	:cacheext generic map(brsize) port map(ramaddrrc(brsize-1 downto 0),brcache_extwr(i),brcache_clr(i),brcache_busyv(i),bfaddr,brcache_ext(i),'1',rclk, ram_ce, sclk, sys_ce, rstn);
		BRcache0h:CACHEMEMN generic map(brsize,8)port map(ramaddrrc(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,brwdath,b_wdatm(15 downto 8),brwr(i),brwrb(i)(1) and ram_ce,open,brdath(i));
		BRcache0l:CACHEMEMN generic map(brsize,8)port map(ramaddrrc(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,brwdatl,b_wdatm(7 downto 0),brwr(i),brwrb(i)(0) and ram_ce,open,brdatl(i));
	end generate;
	
	process(brcache_busyv)
	variable tmp	:std_logic;
	begin
		tmp:='0';
		for i in 0 to brblocks-1 loop
			tmp:=tmp or brcache_busyv(i);
		end loop;
		brcache_busy<=tmp;
	end process;
	
	process(brdath,brdatl,braddr,b_addr)begin
		b_rdatb<=(others=>'1');
		for i in brblocks-1 downto 0 loop
			if(braddr(i)=('0' & b_addr(awidth-1 downto brsize)))then
				b_rdatb<=brdath(i) & brdatl(i);
			end if;
		end loop;
	end process;

	b_rdat<=b_rdatb;
	
	process(braddr,b_addr)begin
		bcreadno<=0;
		for i in brblocks-1 downto 0 loop
			if(braddr(i)=('0' & b_addr(awidth-1 downto brsize)))then
				bcreadno<=i;
			end if;
		end loop;
	end process;
	
	process(b_rd,b_addr,braddr,brcache_ext)begin
		brack<='0';
		for i in brblocks-1 downto 0 loop
			if(b_rd='1' and braddr(i)=('0' & b_addr(awidth-1 downto brsize)) and brcache_ext(i)='1')then
				brack<='1';
			end if;
		end loop;
	end process;
	backx<=brack or	bwack or brmwack;
	bcread<=brack;
	process(sclk,rstn)begin
		if(rstn='0')then
			b_ack<='0';
--			b_cack<='0';
		elsif rising_edge(sclk) then
			if (sys_ce = '1') then
				b_ack<=backx;
	--			b_cack<=bcackx;
			end if;
		end if;
	end process;
	
	b_cack <= bcackx;

	process(sclk,rstn)begin
		if(rstn='0')then
			sbwack<='0';
			sbrmwack<='0';
		elsif rising_edge(sclk) then
			if (sys_ce = '1') then
				sbwack<=bwack;
				sbrmwack<=brmwack;
			end if;
		end if;
	end process;
	
	process(rclk,rstn)
	variable vmin,vmax	:std_logic_vector(brsize-1 downto 0);
	begin
		if(rstn='0')then
			waddrmin<=(others=>'1');
			waddrmax<=(others=>'0');
		elsif rising_edge(rclk) then
			if (ram_ce = '1') then
				vmin:=waddrmin;
				vmax:=waddrmax;
				if(wminmaxclr='1')then
					vmin:=(others=>'1');
					vmax:=(others=>'0');
				elsif(wminmaxall='1')then
					vmin:=(others=>'0');
					vmax:=(others=>'1');
				end if;
				if((sbwack='1' and b_wr/="00") or (sbrmwack='1' and b_rmw/="00"))then
					if(vmin>b_addr(brsize-1 downto 0))then
						vmin:=b_addr(brsize-1 downto 0);
					end if;
					if(vmax<b_addr(brsize-1 downto 0))then
						vmax:=b_addr(brsize-1 downto 0);
					end if;
				end if;
				waddrmin<=vmin;
				waddrmax<=vmax;
			end if;
		end if;
	end process;
	
	bwwr0<=(b_wr or b_rmw)	when bwcache_sel='0' and (bwack='1' or brmwack='1') else "00";
	bwwr1<=(b_wr or b_rmw)	when bwcache_sel='1' and (bwack='1' or brmwack='1') else "00";
	bwwes<=bwwe0 when bwcache_sel='0' else bwwe1;
	bwwens<=bwwe0 when bwcache_sel='1' else bwwe1;
	
	b_cwr0<='0' when bwcache_sel='1' or RAM_STATE/=ST_BCREAD else
			'1' when ramaddrrc(1 downto 0)="00" and bcmask(0)='1' else
			'1' when ramaddrrc(1 downto 0)="01" and bcmask(1)='1' else
			'1' when ramaddrrc(1 downto 0)="10" and bcmask(2)='1' else
			'1' when ramaddrrc(1 downto 0)="11" and bcmask(3)='1' else
			'0';
	b_cwr1<='0' when bwcache_sel='0' or RAM_STATE/=ST_BCREAD else
			'1' when ramaddrrc(1 downto 0)="00" and bcmask(0)='1' else
			'1' when ramaddrrc(1 downto 0)="01" and bcmask(1)='1' else
			'1' when ramaddrrc(1 downto 0)="10" and bcmask(2)='1' else
			'1' when ramaddrrc(1 downto 0)="11" and bcmask(3)='1' else
			'0';
	ramaddrwcb<=	ramaddrrc when RAM_STATE=ST_BCREAD else
					ramaddrwc;
	ramaddrwex<=	ramaddrrc when RAM_STATE=ST_BCREAD else b_addr(7 downto 0);
	
	--biwdata0<="1" when RAM_STATE=ST_BCREAD and bwcache_sel='0' else "0";
	--biwdata1<="1" when RAM_STATE=ST_BCREAD and bwcache_sel='1' else "0";
	
	bwwr0m<=bwwr0 or (b_cwr0 & b_cwr0);
	bwwr1m<=bwwr1 or (b_cwr1 & b_cwr1);
	--BWewaddr<= ramaddrrc when RAM_STATE=ST_BCREAD else b_addr(7 downto 0);
	BWext0h	:cacheext generic map(brsize) port map(ramaddrwex(brsize-1 downto 0),bwwr0m(1),bwcache_clr0,bwcache_busy0,ramaddrwc(brsize-1 downto 0),bwwe0(1),'0',rclk, ram_ce, rclk, ram_ce, rstn);
	BWext0l	:cacheext generic map(brsize) port map(ramaddrwex(brsize-1 downto 0),bwwr0m(0),bwcache_clr0,open,         ramaddrwc(brsize-1 downto 0),bwwe0(0),'0',rclk, ram_ce, rclk, ram_ce, rstn);
	BWext1h	:cacheext generic map(brsize) port map(ramaddrwex(brsize-1 downto 0),bwwr1m(1),bwcache_clr1,bwcache_busy1,ramaddrwc(brsize-1 downto 0),bwwe1(1),'0',rclk, ram_ce, rclk, ram_ce, rstn);
	BWext1l	:cacheext generic map(brsize) port map(ramaddrwex(brsize-1 downto 0),bwwr1m(0),bwcache_clr1,open,         ramaddrwc(brsize-1 downto 0),bwwe1(0),'0',rclk, ram_ce, rclk, ram_ce, rstn);
	bwcache_busy<=bwcache_busy0 or bwcache_busy1;
	
	BWcache0h	:CACHEMEMN generic map(brsize,8)port map(ramaddrwcb(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,ramrdat(15 downto 8),b_wdatm(15 downto 8),b_cwr0 and ram_ce,bwwr0(1) and sys_ce,bwwdat0h,open);
	BWcache0l	:CACHEMEMN generic map(brsize,8)port map(ramaddrwcb(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,ramrdat( 7 downto 0),b_wdatm( 7 downto 0),b_cwr0 and ram_ce,bwwr0(0) and sys_ce,bwwdat0l,open);
	BWcache1h	:CACHEMEMN generic map(brsize,8)port map(ramaddrwcb(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,ramrdat(15 downto 8),b_wdatm(15 downto 8),b_cwr1 and ram_ce,bwwr1(1) and sys_ce,bwwdat1h,open);
	BWcache1l	:CACHEMEMN generic map(brsize,8)port map(ramaddrwcb(brsize-1 downto 0),b_addr(brsize-1 downto 0),rclk,sclk,ramrdat( 7 downto 0),b_wdatm( 7 downto 0),b_cwr1 and ram_ce,bwwr1(0) and sys_ce,bwwdat1l,open);
	
	ramwe<=	bwwens when RAM_STATE=ST_BWRITE else
			"11" when RAM_STATE=ST_FDEWRITE else
			"11" when RAM_STATE=ST_FECWRITE else
			"11" when RAM_STATE=ST_G0CLR or RAM_STATE=ST_G1CLR or RAM_STATE=ST_G2CLR or RAM_STATE=ST_G3CLR else
			"00";
	ramwdat<=	(others=>'0') when (RAM_STATE=ST_G0CLR or RAM_STATE=ST_G1CLR or RAM_STATE=ST_G2CLR or RAM_STATE=ST_G3CLR) else
				ewdat		when RAM_STATE=ST_FDEWRITE else
				fec_wdat	when RAM_STATE=ST_FECWRITE else
				bwwdat0h & bwwdat0l when bwcache_sel='1' else
				bwwdat1h & bwwdat1l;
	bwwdat<=bwwdat0h & bwwdat0l when bwcache_sel='0' else bwwdat1h & bwwdat1l;
	
	process(b_addr,braddr,brcache_ext,bwaddr_sel,b_wr)
	variable tmp	:std_logic;
	begin
		tmp:='1';
		for i in 0 to brblocks-1 loop
			if(braddr(i)=('0' & b_addr(awidth-1 downto brsize)) and brcache_ext(i)='0')then
				tmp:='0';
			end if;
		end loop;
		if(tmp='1' and b_addr(awidth-1 downto brsize)=bwaddr_sel and b_wr/="00")then
			bwack<='1';
		else
			bwack<='0';
		end if;
	end process;

	process(sclk,rstn)
	variable tmp	:std_logic;
	begin
		if(rstn='0')then
			rmw_state<=rmw_IDLE;
		elsif rising_edge(sclk) then
			if (sys_ce = '1') then
				case rmw_state is
				when rmw_IDLE =>
					tmp:='0';
					for i in 0 to brblocks-1 loop
						if(braddr(i)=('0' & b_addr(awidth-1 downto brsize)) and brcache_ext(i)='1')then
							tmp:='1';
						end if;
					end loop;
					if(tmp='1' and b_rmw/="00")then
						rmw_state<=rmw_READ;
					end if;
				when rmw_READ =>
					rmw_rdat<=b_rdatb;
					rmw_state<=rmw_MOD;
				when rmw_MOD =>
					if(b_addr(awidth-1 downto brsize)=bwaddr_sel)then
						rmw_state<=rmw_WRITE;
					end if;
				when rmw_WRITE =>
					if(b_rmw="00")then
						rmw_state<=rmw_IDLE;
					end if;
				when others =>
				end case;
			end if;
		end if;
	end process;
	
	brmwack<='1' when rmw_state=rmw_WRITE else '0';
			
	--vrcawr<=b_cwr0 or b_cwr1;
	--b_cdaddra<=b_cdaddr & bcazero;

	g00rwdath<=	
				(others=>'0') when RAM_STATE=ST_G0CLR else
				bwwdat(15 downto 8) when g00_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g00rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G0CLR else
				bwwdat( 7 downto 0) when g00_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g00rwr<=	'1' when RAM_STATE=ST_G0CLR else
				'0' when RAM_STATE/=ST_G00READ else
				ramde;
	g00rwdat<=g00rwdath & g00rwdatl;
	g00Rcache	:CACHEMEMWN generic map(7)port map(g00rwdat,g00_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g00rwr and ram_ce,g00_rdat);

	g00ack	:vrcack generic map(awidth,7)port map(g00_rd,g00_addr,g00addrh,ramaddrrc(6 downto 0),g00rwr,g00_ack,vclk,vid_ce,rstn);


	g01rwdath<=	
				(others=>'0') when RAM_STATE=ST_G1CLR else
				bwwdat(15 downto 8) when g01_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g01rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G1CLR else
				bwwdat( 7 downto 0) when g01_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g01rwr<=	'1' when RAM_STATE=ST_G1CLR else
				'0' when RAM_STATE/=ST_G01READ else
				ramde;
	g01rwdat<=g01rwdath & g01rwdatl;
	g01Rcache	:CACHEMEMWN generic map(7)port map(g01rwdat,g01_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g01rwr and ram_ce,g01_rdat);

	g01ack	:vrcack generic map(awidth,7)port map(g01_rd,g01_addr,g01addrh,ramaddrrc(6 downto 0),g01rwr,g01_ack,vclk,vid_ce,rstn);


	g02rwdath<=	
				(others=>'0') when RAM_STATE=ST_G2CLR else
				bwwdat(15 downto 8) when g02_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g02rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G2CLR else
				bwwdat( 7 downto 0) when g02_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g02rwr<=	'1' when RAM_STATE=ST_G2CLR else
				'0' when RAM_STATE/=ST_G02READ else
				ramde;
	g02rwdat<=g02rwdath & g02rwdatl;
	g02Rcache	:CACHEMEMWN generic map(7)port map(g02rwdat,g02_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g02rwr and ram_ce,g02_rdat);

	g02ack	:vrcack generic map(awidth,7)port map(g02_rd,g02_addr,g02addrh,ramaddrrc(6 downto 0),g02rwr,g02_ack,vclk,vid_ce,rstn);


	g03rwdath<=	
				(others=>'0') when RAM_STATE=ST_G3CLR else
				bwwdat(15 downto 8) when g03_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g03rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G3CLR else
				bwwdat( 7 downto 0) when g03_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g03rwr<=	'1' when RAM_STATE=ST_G3CLR else
				'0' when RAM_STATE/=ST_g03READ else ramde;
	g03rwdat<=g03rwdath & g03rwdatl;
	g03Rcache	:CACHEMEMWN generic map(7)port map(g03rwdat,g03_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g03rwr and ram_ce,g03_rdat);

	g03ack	:vrcack generic map(awidth,7)port map(g03_rd,g03_addr,g03addrh,ramaddrrc(6 downto 0),g03rwr,g03_ack,vclk,vid_ce,rstn);


	t0rwdath<=	bwwdat(15 downto 8) when t0_addr(19 downto 6)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	t0rwdatl<=	bwwdat( 7 downto 0) when t0_addr(19 downto 6)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	t0rwr<=	'0' when RAM_STATE/=ST_T0READ else ramde;
	t0rwrq(0)<=t0rwr when ramaddrrc(1 downto 0)="00" else '0';
	t0rwrq(1)<=t0rwr when ramaddrrc(1 downto 0)="01" else '0';
	t0rwrq(2)<=t0rwr when ramaddrrc(1 downto 0)="10" else '0';
	t0rwrq(3)<=t0rwr when ramaddrrc(1 downto 0)="11" else '0';

	t0rwdat<=t0rwdath & t0rwdatl;
	T00Rcache	:CACHEMEMWN generic map(6)port map(t0rwdat,t0_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t0rwrq(0) and ram_ce,t0_rdat0);
	T01Rcache	:CACHEMEMWN generic map(6)port map(t0rwdat,t0_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t0rwrq(1) and ram_ce,t0_rdat1);
	T02Rcache	:CACHEMEMWN generic map(6)port map(t0rwdat,t0_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t0rwrq(2) and ram_ce,t0_rdat2);
	T03Rcache	:CACHEMEMWN generic map(6)port map(t0rwdat,t0_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t0rwrq(3) and ram_ce,t0_rdat3);

	t0_addra<=t0_addr & "11";
	t0ack	:vrcack generic map(awidth,8)port map(t0_rd,t0_addra,t0addrh,ramaddrrc,t0rwr,t0_ack,vclk,vid_ce,rstn);


	g10rwdath<=	
				(others=>'0') when RAM_STATE=ST_G0CLR else
				bwwdat(15 downto 8) when g10_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g10rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G0CLR else
				bwwdat( 7 downto 0) when g10_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g10rwr<=	'1' when RAM_STATE=ST_G0CLR else
				'0' when RAM_STATE/=ST_g10READ else
				ramde;
	g10rwdat<=g10rwdath & g10rwdatl;
	g10Rcache	:CACHEMEMWN generic map(7)port map(g10rwdat,g10_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g10rwr,g10_rdat);

	g10ack	:vrcack generic map(awidth,7)port map(g10_rd,g10_addr,g10addrh,ramaddrrc(6 downto 0),g10rwr,g10_ack,vclk,vid_ce,rstn);


	g11rwdath<=	
				(others=>'0') when RAM_STATE=ST_G1CLR else
				bwwdat(15 downto 8) when g11_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g11rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G1CLR else
				bwwdat( 7 downto 0) when g11_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g11rwr<=	'1' when RAM_STATE=ST_G1CLR else
				'0' when RAM_STATE/=ST_g11READ else
				ramde;
	g11rwdat<=g11rwdath & g11rwdatl;
	g11Rcache	:CACHEMEMWN generic map(7)port map(g11rwdat,g11_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g11rwr and ram_ce,g11_rdat);

	g11ack	:vrcack generic map(awidth,7)port map(g11_rd,g11_addr,g11addrh,ramaddrrc(6 downto 0),g11rwr,g11_ack,vclk,vid_ce,rstn);


	g12rwdath<=	
				(others=>'0') when RAM_STATE=ST_G2CLR else
				bwwdat(15 downto 8) when g12_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g12rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G2CLR else
				bwwdat( 7 downto 0) when g12_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g12rwr<=	'1' when RAM_STATE=ST_G2CLR else
				'0' when RAM_STATE/=ST_g12READ else
				ramde;
	g12rwdat<=g12rwdath & g12rwdatl;
	g12Rcache	:CACHEMEMWN generic map(7)port map(g12rwdat,g12_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g12rwr and ram_ce,g12_rdat);

	g12ack	:vrcack generic map(awidth,7)port map(g12_rd,g12_addr,g12addrh,ramaddrrc(6 downto 0),g12rwr,g12_ack,vclk,vid_ce,rstn);


	g13rwdath<=	
				(others=>'0') when RAM_STATE=ST_G3CLR else
				bwwdat(15 downto 8) when g13_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	g13rwdatl<=	
				(others=>'0') when RAM_STATE=ST_G3CLR else
				bwwdat( 7 downto 0) when g13_addr(awidth-1 downto 8)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	g13rwr<=	'1' when RAM_STATE=ST_G3CLR else
				'0' when RAM_STATE/=ST_g13READ else
				ramde;
	g13rwdat<=g13rwdath & g13rwdatl;
	g13Rcache	:CACHEMEMWN generic map(7)port map(g13rwdat,g13_addr(6 downto 0),vclk,ramaddrrc(6 downto 0),rclk,g13rwr and ram_ce,g13_rdat);

	g13ack	:vrcack generic map(awidth,7)port map(g13_rd,g13_addr,g13addrh,ramaddrrc(6 downto 0),g13rwr,g13_ack,vclk,vid_ce,rstn);


	t1rwdath<=	bwwdat(15 downto 8) when t1_addr(19 downto 6)=bwaddr_sel and bwwes(1)='1' else
				ramrdat(15 downto 8);
	t1rwdatl<=	bwwdat( 7 downto 0) when t1_addr(19 downto 6)=bwaddr_sel and bwwes(0)='1' else
				ramrdat( 7 downto 0);

	t1rwr<=	'0' when RAM_STATE/=ST_T1READ else ramde;
	t1rwrq(0)<=t1rwr when ramaddrrc(1 downto 0)="00" else '0';
	t1rwrq(1)<=t1rwr when ramaddrrc(1 downto 0)="01" else '0';
	t1rwrq(2)<=t1rwr when ramaddrrc(1 downto 0)="10" else '0';
	t1rwrq(3)<=t1rwr when ramaddrrc(1 downto 0)="11" else '0';

	t1rwdat<=t1rwdath & t1rwdatl;
	T10Rcache	:CACHEMEMWN generic map(6)port map(t1rwdat,t1_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t1rwrq(0) and ram_ce,t1_rdat0);
	T11Rcache	:CACHEMEMWN generic map(6)port map(t1rwdat,t1_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t1rwrq(1) and ram_ce,t1_rdat1);
	T12Rcache	:CACHEMEMWN generic map(6)port map(t1rwdat,t1_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t1rwrq(2) and ram_ce,t1_rdat2);
	T13Rcache	:CACHEMEMWN generic map(6)port map(t1rwdat,t1_addr(5 downto 0),vclk,ramaddrrc(7 downto 2),rclk,t1rwrq(3) and ram_ce,t1_rdat3);

	t1_addra<=t1_addr & "11";
	t1ack	:vrcack generic map(awidth,8)port map(t1_rd,t1_addra,t1addrh,ramaddrrc,t1rwr,t1_ack,vclk,vid_ce,rstn);

	e0cwr<='0' when RAM_STATE/=ST_FDEREAD else ramde and (not fde_sel);
	e1cwr<='0' when RAM_STATE/=ST_FDEREAD else ramde and fde_sel;
	
	ramaddrwcf<=	ramaddrrc when RAM_STATE=ST_FDEREAD else
						ramaddrwc;

	
	FEcache0h	:CACHEMEMN generic map(8,8)port map(ramaddrwcf,fde_addr(7 downto 0),rclk,fclk,ramrdat(15 downto 8),fde_wdat(15 downto 8),e0cwr and ram_ce,fde_wr0 and fd_ce,ewdat0(15 downto 8),fde_rdat0(15 downto 8));
	FEcache0l	:CACHEMEMN generic map(8,8)port map(ramaddrwcf,fde_addr(7 downto 0),rclk,fclk,ramrdat( 7 downto 0),fde_wdat( 7 downto 0),e0cwr and ram_ce,fde_wr0 and fd_ce,ewdat0( 7 downto 0),fde_rdat0( 7 downto 0));
	FEcache1h	:CACHEMEMN generic map(8,8)port map(ramaddrwcf,fde_addr(7 downto 0),rclk,fclk,ramrdat(15 downto 8),fde_wdat(15 downto 8),e1cwr and ram_ce,fde_wr1 and fd_ce,ewdat1(15 downto 8),fde_rdat1(15 downto 8));
	FEcache1l	:CACHEMEMN generic map(8,8)port map(ramaddrwcf,fde_addr(7 downto 0),rclk,fclk,ramrdat( 7 downto 0),fde_wdat( 7 downto 0),e1cwr and ram_ce,fde_wr1 and fd_ce,ewdat1( 7 downto 0),fde_rdat1( 7 downto 0));
	
	ewdat<=ewdat1 when fde_sel='1' else ewdat0;
	
	fec_we<='0' when RAM_STATE/=ST_FECREAD else ramde;
	fec_addr<=	ramaddrrc when RAM_STATE=ST_FECREAD else
					ramaddrwc;
	fec_rdat<=ramrdat;
	
end rtl;

	
