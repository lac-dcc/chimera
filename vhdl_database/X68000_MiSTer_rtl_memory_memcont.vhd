LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memcont is
generic(
	AWIDTH		:integer	:=25;
	CAWIDTH		:integer	:=10;
	BRSIZE		:integer	:=8;
	BRBLOCKS		:integer	:=4;
	CLKMHZ		:integer 	:=120;		--SDRAM clk MHz
	REFINT	:integer	:=3;
	REFCNT	:integer	:=64
);
port(
	-- SDRAM PORTS
	PMEMCKE		:OUT	STD_LOGIC;							-- SD-RAM CLOCK ENABLE
	PMEMCS_N	:OUT	STD_LOGIC;							-- SD-RAM CHIP SELECT
	PMEMRAS_N	:OUT	STD_LOGIC;							-- SD-RAM ROW/RAS
	PMEMCAS_N	:OUT	STD_LOGIC;							-- SD-RAM /CAS
	PMEMWE_N	:OUT	STD_LOGIC;							-- SD-RAM /WE
	PMEMUDQ		:OUT	STD_LOGIC;							-- SD-RAM UDQM
	PMEMLDQ		:OUT	STD_LOGIC;							-- SD-RAM LDQM
	PMEMBA1		:OUT	STD_LOGIC;							-- SD-RAM BANK SELECT ADDRESS 1
	PMEMBA0		:OUT	STD_LOGIC;							-- SD-RAM BANK SELECT ADDRESS 0
	PMEMADR		:OUT	STD_LOGIC_VECTOR( 12 DOWNTO 0 );	-- SD-RAM ADDRESS
	PMEMDAT		:INOUT	STD_LOGIC_VECTOR( 15 DOWNTO 0 );	-- SD-RAM DATA

	b_addr		:in std_logic_vector(awidth-1 downto 0);
	b_wdat		:in std_logic_vector(15 downto 0);
	b_rdat		:out std_logic_vector(15 downto 0);
	b_rd		:in std_logic;
	b_wr		:in std_logic_vector(1 downto 0);
	b_rmw		:in std_logic_vector(1 downto 0);
	b_rmwmsk	:in std_logic_vector(15 downto 0);
	b_ack		:out std_logic;

	b_csaddr	:in std_logic_vector(awidth-BRSIZE-1 downto 0)	:=(others=>'0');
	b_cdaddr	:in std_logic_vector(awidth-BRSIZE-1 downto 0)	:=(others=>'0');
	b_cplane	:in std_logic_vector(3 downto 0)	:=(others=>'0');
	b_cpy		:in std_logic;
	b_cack		:out std_logic;
	
	g00_addr	:in std_logic_vector(awidth-1 downto 0);
	g00_rd		:in std_logic;
	g00_rdat	:out std_logic_vector(15 downto 0);
	g00_ack		:out std_logic;

	g01_addr	:in std_logic_vector(awidth-1 downto 0);
	g01_rd		:in std_logic;
	g01_rdat	:out std_logic_vector(15 downto 0);
	g01_ack		:out std_logic;

	g02_addr	:in std_logic_vector(awidth-1 downto 0);
	g02_rd		:in std_logic;
	g02_rdat	:out std_logic_vector(15 downto 0);
	g02_ack		:out std_logic;

	g03_addr	:in std_logic_vector(awidth-1 downto 0);
	g03_rd		:in std_logic;
	g03_rdat	:out std_logic_vector(15 downto 0);
	g03_ack		:out std_logic;

	g10_addr	:in std_logic_vector(awidth-1 downto 0);
	g10_rd		:in std_logic;
	g10_rdat	:out std_logic_vector(15 downto 0);
	g10_ack		:out std_logic;

	g11_addr	:in std_logic_vector(awidth-1 downto 0);
	g11_rd		:in std_logic;
	g11_rdat	:out std_logic_vector(15 downto 0);
	g11_ack		:out std_logic;

	g12_addr	:in std_logic_vector(awidth-1 downto 0);
	g12_rd		:in std_logic;
	g12_rdat	:out std_logic_vector(15 downto 0);
	g12_ack		:out std_logic;

	g13_addr	:in std_logic_vector(awidth-1 downto 0);
	g13_rd		:in std_logic;
	g13_rdat	:out std_logic_vector(15 downto 0);
	g13_ack		:out std_logic;

	t0_addr		:in std_logic_vector(awidth-3 downto 0);
	t0_rd		:in std_logic;
	t0_rdat0	:out std_logic_vector(15 downto 0);
	t0_rdat1	:out std_logic_vector(15 downto 0);
	t0_rdat2	:out std_logic_vector(15 downto 0);
	t0_rdat3	:out std_logic_vector(15 downto 0);
	t0_ack		:out std_logic;
	
	t1_addr		:in std_logic_vector(awidth-3 downto 0);
	t1_rd		:in std_logic;
	t1_rdat0	:out std_logic_vector(15 downto 0);
	t1_rdat1	:out std_logic_vector(15 downto 0);
	t1_rdat2	:out std_logic_vector(15 downto 0);
	t1_rdat3	:out std_logic_vector(15 downto 0);
	t1_ack		:out std_logic;

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
	fde_wr		:in std_logic	:='0';
	fde_tlen	:in std_logic_vector(13 downto 0)	:=(others=>'1');
	
	fec_addr	:out std_logic_vector(7 downto 0);
	fec_rdat	:out std_logic_vector(15 downto 0);
	fec_wdat	:in std_logic_vector(15 downto 0)	:=(others=>'0');
	fec_we	:out std_logic;
	fec_addrh	:in std_logic_vector(awidth-9 downto 0)	:=(others=>'0');
	fec_rd		:in std_logic	:='0';
	fec_wr		:in std_logic	:='0';
	fec_busy	:out std_logic;

	initdone	:out std_logic;
	
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
end memcont;

architecture rtl of memcont is
signal	ram_inidone	:std_logic;
signal	cache_inidone:std_logic;
signal	b_rd_m		:std_logic;
signal	b_wr_m		:std_logic_vector(1 downto 0);
signal 	ramaddrh	:std_logic_vector(awidth-9 downto 0);
signal	rambgnaddr	:std_logic_vector(7 downto 0);
signal	ramendaddr	:std_logic_vector(7 downto 0);
signal 	rambwidth		:integer range 1 to 8;
signal	ramaddrrc	:std_logic_vector(7 downto 0);
signal	ramaddrwc	:std_logic_vector(7 downto 0);
signal	ramrd		:std_logic;
signal	ramwr		:std_logic;
signal	ramrefrsh	:std_logic;
signal	ramabort		:std_logic;
signal	rambusy		:std_logic;
signal	ramde		:std_logic;
signal	ramrdat		:std_logic_vector(15 downto 0);
signal	ramwdat		:std_logic_vector(15 downto 0);
signal	ramwe		:std_logic_vector(1 downto 0);

component SDRAMC
generic(
	AWIDTH		:integer	:=25;
	CAWIDTH		:integer	:=10;
	LAWIDTH		:integer	:=8;
	CLKMHZ		:integer	:=120		--MHz
);
port(
	-- SDRAM PORTS
	PMEMCKE		:OUT	STD_LOGIC;							-- SD-RAM CLOCK ENABLE
	PMEMCS_N	:OUT	STD_LOGIC;							-- SD-RAM CHIP SELECT
	PMEMRAS_N	:OUT	STD_LOGIC;							-- SD-RAM ROW/RAS
	PMEMCAS_N	:OUT	STD_LOGIC;							-- SD-RAM /CAS
	PMEMWE_N	:OUT	STD_LOGIC;							-- SD-RAM /WE
	PMemUdq     : out std_logic;                        -- SD-RAM UDQM
	PMemLdq     : out std_logic;                        -- SD-RAM LDQM
	PMEMBA1		:OUT	STD_LOGIC;							-- SD-RAM BANK SELECT ADDRESS 1
	PMEMBA0		:OUT	STD_LOGIC;							-- SD-RAM BANK SELECT ADDRESS 0
	PMEMADR		:OUT	STD_LOGIC_VECTOR( 12 DOWNTO 0 );	-- SD-RAM ADDRESS
	PMEMDAT		:INOUT	STD_LOGIC_VECTOR( 15 DOWNTO 0 );	-- SD-RAM DATA

	addr_high	:in std_logic_vector(AWIDTH-LAWIDTH-1 downto 0);
	bgnaddr		:in std_logic_vector(LAWIDTH-1 downto 0);
	endaddr		:in std_logic_vector(LAWIDTH-1 downto 0);
	bwidth		:integer range 1 to LAWIDTH	:=8;
	addr_rc		:out std_logic_vector(LAWIDTH-1 downto 0);
	addr_wc		:out std_logic_vector(LAWIDTH-1 downto 0);
	rddat		:out std_logic_vector(15 downto 0);
	wrdat		:in std_logic_vector(15 downto 0);
	de			:out std_logic;
	we			:in std_logic_vector(1 downto 0);
	rd			:in std_logic;
	wr			:in std_logic;
	refrsh		:in std_logic;
	abort		:in std_logic	:='0';
	busy		:out std_logic;

	initdone	:out std_logic;
	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component cachecont
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
end component;

begin
	RAMC	:SDRAMC generic map(
		AWIDTH		=>AWIDTH,
		CAWIDTH		=>CAWIDTH,
		LAWIDTH		=>8,
		CLKMHZ		=>CLKMHZ
	) port map(
		PMEMCKE		=>PMEMCKE,
		PMEMCS_N		=>PMEMCS_N,
		PMEMRAS_N	=>PMEMRAS_N,
		PMEMCAS_N	=>PMEMCAS_N,
		PMEMWE_N		=>PMEMWE_N,
		PMEMUDQ		=>PMEMUDQ,
		PMEMLDQ		=>PMEMLDQ,
		PMEMBA1		=>PMEMBA1,
		PMEMBA0		=>PMEMBA0,
		PMEMADR		=>PMEMADR,
		PMEMDAT		=>PMEMDAT,
		
		addr_high	=>ramaddrh,
		bgnaddr		=>rambgnaddr,
		endaddr		=>ramendaddr,
		bwidth		=>rambwidth,
		addr_rc		=>ramaddrrc,
		addr_wc		=>ramaddrwc,
		rddat		=>ramrdat,
		wrdat		=>ramwdat,
		de			=>ramde,
		we			=>ramwe,
		rd			=>ramrd,
		wr			=>ramwr,
		refrsh	=>ramrefrsh,
		abort		=>ramabort,
		busy		=>rambusy,
		
		initdone	=>ram_inidone,
		clk			=>rclk,
		ce          =>ram_ce,
		rstn		=>rstn
	);
	
	b_rd_m	<='0' when cache_inidone='0' else b_rd;
	b_wr_m	<="00" when cache_inidone='0' else b_wr;

	CACHEC	:cachecont generic map(AWIDTH,BRSIZE,BRBLOCKS,REFINT,REFCNT) port map(
		b_addr	=>b_addr,
		b_wdat	=>b_wdat,
		b_rdat	=>b_rdat,
		b_rd	=>b_rd_m,
		b_wr	=>b_wr_m,
		b_rmw	=>b_rmw,
		b_rmwmsk=>b_rmwmsk,
		b_ack	=>b_ack,

		b_csaddr=>b_csaddr,
		b_cdaddr=>b_cdaddr,
		b_cplane	=>b_cplane,
		b_cpy	=>b_cpy,
		b_cack	=>b_cack,
		
		g00_addr	=>g00_addr,
		g00_rd		=>g00_rd,
		g00_rdat	=>g00_rdat,
		g00_ack		=>g00_ack,

		g01_addr	=>g01_addr,
		g01_rd		=>g01_rd,
		g01_rdat	=>g01_rdat,
		g01_ack		=>g01_ack,

		g02_addr	=>g02_addr,
		g02_rd		=>g02_rd,
		g02_rdat	=>g02_rdat,
		g02_ack		=>g02_ack,

		g03_addr	=>g03_addr,
		g03_rd		=>g03_rd,
		g03_rdat	=>g03_rdat,
		g03_ack		=>g03_ack,

		g10_addr	=>g10_addr,
		g10_rd		=>g10_rd,
		g10_rdat	=>g10_rdat,
		g10_ack		=>g10_ack,

		g11_addr	=>g11_addr,
		g11_rd		=>g11_rd,
		g11_rdat	=>g11_rdat,
		g11_ack		=>g11_ack,

		g12_addr	=>g12_addr,
		g12_rd		=>g12_rd,
		g12_rdat	=>g12_rdat,
		g12_ack		=>g12_ack,

		g13_addr	=>g13_addr,
		g13_rd		=>g13_rd,
		g13_rdat	=>g13_rdat,
		g13_ack		=>g13_ack,

		t0_addr		=>t0_addr,
		t0_rd		=>t0_rd,
		t0_rdat0	=>t0_rdat0,
		t0_rdat1	=>t0_rdat1,
		t0_rdat2	=>t0_rdat2,
		t0_rdat3	=>t0_rdat3,
		t0_ack		=>t0_ack,
		
		t1_addr		=>t1_addr,
		t1_rd		=>t1_rd,
		t1_rdat0	=>t1_rdat0,
		t1_rdat1	=>t1_rdat1,
		t1_rdat2	=>t1_rdat2,
		t1_rdat3	=>t1_rdat3,
		t1_ack		=>t1_ack,

		g0_caddr	=>g0_caddr,
		g0_clear	=>g0_clear,
		
		g1_caddr	=>g1_caddr,
		g1_clear	=>g1_clear,

		g2_caddr	=>g2_caddr,
		g2_clear	=>g2_clear,

		g3_caddr	=>g3_caddr,
		g3_clear	=>g3_clear,
		
		fde_addr	=>fde_addr,
		fde_rdat	=>fde_rdat,
		fde_wdat	=>fde_wdat,
		fde_wr		=>fde_wr,
		fde_tlen	=>fde_tlen,
		
		fec_addr	=>fec_addr,
		fec_rdat	=>fec_rdat,
		fec_wdat	=>fec_wdat,
		fec_we	=>fec_we,
		fec_addrh	=>fec_addrh,
		fec_rd		=>fec_rd,
		fec_wr		=>fec_wr,
		fec_busy	=>fec_busy,

		ramaddrh	=>ramaddrh,
		rambgnaddr	=>rambgnaddr,
		ramendaddr	=>ramendaddr,
		rambwidth	=>rambwidth,

		ramaddrrc	=>ramaddrrc,
		ramaddrwc	=>ramaddrwc,
		ramrd		=>ramrd,
		ramwr		=>ramwr,
		ramrefrsh	=>ramrefrsh,
		ramabort		=>ramabort,
		rambusy		=>rambusy,
		ramde		=>ramde,
		ramrdat		=>ramrdat,
		ramwdat		=>ramwdat,
		ramwe		=>ramwe,
		
		ini_end	=>cache_inidone,
		sclk	=>sclk,
		sys_ce  =>sys_ce,
		vclk	=>vclk,
		vid_ce  =>vid_ce,
		fclk	=>fclk,
		fd_ce  =>fd_ce,
		rclk	=>rclk,
		ram_ce  =>ram_ce,
		rstn	=>rstn
	);
	
	initdone<=ram_inidone and cache_inidone;
	
end rtl;
