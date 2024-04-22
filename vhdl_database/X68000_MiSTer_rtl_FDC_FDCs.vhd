LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.FDC_sectinfo.all;
use work.FDC_timing.all;

entity FDCs is
generic(
	maxtrack	:integer	:=85;
	maxbwidth	:integer	:=88;
	rdytout		:integer	:=800;
	preseek		:std_logic	:='0';
	sysclk		:integer	:=20
);
port(
	RDn		:in std_logic;
	WRn		:in std_logic;
	CSn		:in std_logic;
	A0		:in std_logic;
	WDAT	:in std_logic_vector(7 downto 0);
	RDAT	:out std_logic_vector(7 downto 0);
	DATOE	:out std_logic;
	DACKn	:in std_logic;
	DRQ		:out std_logic;
	TC		:in std_logic;
	INTn	:out std_logic;
	WAITIN	:in std_logic	:='0';

	WREN	:out std_logic;		--pin24
	WRBIT	:out std_logic;		--pin22
	RDBIT	:in std_logic;		--pin30
	STEP	:out std_logic;		--pin20
	SDIR	:out std_logic;		--pin18
	WPRT	:in std_logic;		--pin28
	track0	:in std_logic;		--pin26
	index	:in std_logic;		--pin8
	side	:out std_logic;		--pin32
	usel	:out std_logic_vector(1 downto 0);
	READY	:in std_logic;		--pin34
	
	int0	:in integer range 0 to maxbwidth;
	int1	:in integer range 0 to maxbwidth;
	int2	:in integer range 0 to maxbwidth;
	int3	:in integer range 0 to maxbwidth;
	
	td0		:in std_logic;
	td1		:in std_logic;
	td2		:in std_logic;
	td3		:in std_logic;
	
	hmssft	:in std_logic;		--0.5msec
	
	busy	:out std_logic;
	mfm		:out std_logic;
	
	ismode	:in std_logic	:='1';
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	fclk	:in std_logic;
	fd_ce   :in std_logic := '1';
	rstn	:in std_logic
);
end FDCs;

architecture rtl of FDCs is
signal	command	:std_logic_vector(4 downto 0);
signal	ecommand:std_logic_vector(4 downto 0);
signal	iC		:integer range 0 to maxtrack;
signal	C		:std_logic_vector(7 downto 0);
signal	D		:std_logic_vector(7 downto 0);
signal	DTL		:std_logic_vector(7 downto 0);
signal	EOT		:std_logic_vector(7 downto 0);
signal	GPL		:std_logic_vector(7 downto 0);
signal	HD		:std_logic;
signal	H		:std_logic_vector(7 downto 0);
signal	HLT		:std_logic_vector(6 downto 0);
signal	HUT		:std_logic_vector(3 downto 0);
signal	MF		:std_logic;
signal	MT		:std_logic;
signal	N		:std_logic_vector(7 downto 0);
signal	Nf		:std_logic_vector(7 downto 0);
signal	NCN		:integer range 0 to maxtrack;
signal	ND		:std_logic;
signal	PCN0	:std_logic_vector(7 downto 0);
signal	PCN1	:std_logic_vector(7 downto 0);
signal	PCN2	:std_logic_vector(7 downto 0);
signal	PCN3	:std_logic_vector(7 downto 0);
signal	cPCN	:std_logic_vector(7 downto 0);
signal	PCN		:std_logic_vector(7 downto 0);
signal	R		:std_logic_vector(7 downto 0);
signal	cntR	:std_logic_vector(7 downto 0);
signal	RW		:std_logic;
signal	SC		:std_logic_vector(7 downto 0);
signal	SK		:std_logic;
signal	SRT		:std_logic_vector(3 downto 0);
signal	SRTx	:std_logic_vector(3 downto 0);
signal	ST0		:std_logic_vector(7 downto 0);
signal	ST1		:std_logic_vector(7 downto 0);
signal	ST2		:std_logic_vector(7 downto 0);
signal	ST3		:std_logic_vector(7 downto 0);
signal	STP		:std_logic_vector(1 downto 0);
signal	US		:std_logic_vector(1 downto 0);

--status bit
signal	sIC		:std_logic_vector(1 downto 0);	--Interrupt Code
signal	sSE		:std_logic;						--Seek End
signal	sEC		:std_logic;						--Equipment Check
signal	sNR		:std_logic;						--Not Ready
signal	sHD		:std_logic;						--Head Address(when interrupt)
signal	sUS		:std_logic_vector(1 downto 0);	--Unit Select(when interrupt)
signal	sEN		:std_logic;						--End of Cylinder
signal	sDE		:std_logic;						--Data Error
signal	sOR		:std_logic;						--Over Run
signal	sND		:std_logic;						--No Data
signal	sNW		:std_logic;						--Not Writable
signal	sMA		:std_logic;						--Missing Address Mark
signal	sCM		:std_logic;						--Control Mark
signal	sDD		:std_logic;						--Data error in Data field(CRC)
signal	sWC		:std_logic;						--Wrong Cylinder
signal	sSH		:std_logic;						--Scan Equal Hit
signal	sSN		:std_logic;						--Scan Not Satisfied
signal	sBC		:std_logic;						--Bad Cylinder
signal	sMD		:std_logic;						--Missing Address Mark in Data Field

signal	sDxB	:std_logic_vector(3 downto 0);
signal	sCB		:std_logic;
signal	sEXM	:std_logic;
signal	sDIO	:std_logic;
signal	sRQM	:std_logic;
signal	MSR		:std_logic_vector(7 downto 0);

signal	sDIOc	:std_logic;
signal	sDIOd	:std_logic;

signal	sideb	:std_logic;
signal	uselb	:std_logic_vector(1 downto 0);
signal	DxBclr	:std_logic;
signal	SEclr	:std_logic;
signal	iSE		:std_logic;
signal	SISen	:std_logic;
signal	SISclr	:std_logic;

signal	IOWR_DAT	:std_logic;
signal	IORD_DAT	:std_logic;
signal	IORD_STA	:std_logic;
signal	lIOWR_DAT	:std_logic;
signal	lIORD_DAT	:std_logic;
signal	lIORD_STA	:std_logic;
signal	datnum		:integer range 0 to 20;
--signal	lWDAT		:std_logic_vector(7 downto 0);
signal	CPUWR_DAT	:std_logic;
signal	CPURD_DAT	:std_logic;
signal	CPURD_STA	:std_logic;
signal	CPUWR_DATf	:std_logic;
signal	lCPURD_DAT	:std_logic_vector(1 downto 0);
signal	lCPUWR_DAT	:std_logic_vector(1 downto 0);
signal	CPURD_DATf	:std_logic;
signal	DMARD		:std_logic;
signal	DMAWR		:std_logic;
signal	DMARDx		:std_logic;
signal	DMAWRx		:std_logic;
signal	DMARDxf		:std_logic;
signal	DMAWRxf		:std_logic;
signal	lDMARDx		:std_logic_vector(1 downto 0);
signal	lDMAWRx		:std_logic_vector(1 downto 0);
signal	lDMARD		:std_logic;
signal	lDMAWR		:std_logic;
signal	CPUWRDAT	:std_logic_vector(7 downto 0);

signal	EXEC			:std_logic;
signal	end_EXEC		:std_logic;
signal	end_EXECs	:std_logic;
signal	RD_CMD		:std_logic;
signal	RDDAT_CMD	:std_logic_vector(7 downto 0);
signal	DETSECT		:std_logic;
signal	COMPDAT		:std_logic_vector(7 downto 0);
signal	scancomp	:std_logic;

type execstate_t is (
		es_idle,

		es_seek,
		es_windex,
		es_GAP0,
		es_Syncp,
		es_IM0,
		es_IM1,
		es_IM2,
		es_IM3,
		es_GAP1,
		es_Synci,
		es_IAM0,
		es_IAM1,
		es_IAM2,
		es_IAM3,
		es_C,
		es_Cw,
		es_H,
		es_Hw,
		es_R,
		es_Rw,
		es_N,
		es_Nw,
		es_CRCi0,
		es_CRCi1,
		es_CRCic,
		es_GAP2,
		es_Syncd,
		es_DAM0,
		es_DAM1,
		es_DAM2,
		es_DAM3,
		es_DATA,
		es_DATAw,
		es_CRCd0,
		es_CRCd1,
		es_CRCdc,
		es_GAP3,
		es_GAP4);

signal	execstate	:execstate_t;

signal	rxC			:std_logic_vector(7 downto 0);
signal	rxH			:std_logic_vector(7 downto 0);
signal	rxR			:std_logic_vector(7 downto 0);
signal	rxN			:std_logic_vector(7 downto 0);

signal	bytecount	:integer range 0 to 16384;

signal	seek_bgn	:std_logic;
signal	seek_end	:std_logic;
signal	seek_busy	:std_logic;
signal	seek_init	:std_logic;
signal	seek_err	:std_logic;
signal	seek_sft	:std_logic;

signal	seek_bgn0	:std_logic;
signal	seek_end0	:std_logic;
signal	seek_busy0	:std_logic;
signal	seek_init0	:std_logic;
signal	seek_err0	:std_logic;
signal	seek_sft0	:std_logic;
signal	STEP0		:std_logic;
signal	SDIR0		:std_logic;
signal	seek_cyl0	:integer range 0 to maxtrack;
signal	seek_cur0	:integer range 0 to maxtrack;

signal	seek_bgn1	:std_logic;
signal	seek_end1	:std_logic;
signal	seek_busy1	:std_logic;
signal	seek_init1	:std_logic;
signal	seek_err1	:std_logic;
signal	seek_sft1	:std_logic;
signal	STEP1		:std_logic;
signal	SDIR1		:std_logic;
signal	seek_cyl1	:integer range 0 to maxtrack;
signal	seek_cur1	:integer range 0 to maxtrack;

signal	seek_bgn2	:std_logic;
signal	seek_end2	:std_logic;
signal	seek_busy2	:std_logic;
signal	seek_init2	:std_logic;
signal	seek_err2	:std_logic;
signal	seek_sft2	:std_logic;
signal	STEP2		:std_logic;
signal	SDIR2		:std_logic;
signal	seek_cyl2	:integer range 0 to maxtrack;
signal	seek_cur2	:integer range 0 to maxtrack;

signal	seek_bgn3	:std_logic;
signal	seek_end3	:std_logic;
signal	seek_busy3	:std_logic;
signal	seek_init3	:std_logic;
signal	seek_err3	:std_logic;
signal	seek_sft3	:std_logic;
signal	STEP3		:std_logic;
signal	SDIR3		:std_logic;
signal	seek_cyl3	:integer range 0 to maxtrack;
signal	seek_cur3	:integer range 0 to maxtrack;

signal	crcin		:std_logic_vector(7 downto 0);
signal	crcwr		:std_logic;
signal	crcclr		:std_logic;
signal	crczero		:std_logic;
signal	crcbusy		:std_logic;
signal	crcdone		:std_logic;
signal	crcdat		:std_logic_vector(15 downto 0);

signal	deminit		:std_logic;
signal	dembreak	:std_logic;
signal	fmrxdat		:std_logic_vector(7 downto 0);
signal	fmrxed		:std_logic;
signal	fmmf8det	:std_logic;
signal	fmmfbdet	:std_logic;
signal	fmmfcdet	:std_logic;
signal	fmmfedet	:std_logic;
signal	fmcurwid	:integer range 0 to maxbwidth*2;
signal	mfmrxdat	:std_logic_vector(7 downto 0);
signal	mfmrxed		:std_logic;
signal	mfmma1det	:std_logic;
signal	mfmmc2det	:std_logic;
signal	mfmcurwid	:integer range 0 to maxbwidth;

signal	txdat		:std_logic_vector(7 downto 0);
signal	fmtxwr		:std_logic;
signal	mfmtxwr		:std_logic;
signal	fmmf8wr		:std_logic;
signal	fmmfbwr		:std_logic;
signal	fmmfcwr		:std_logic;
signal	fmmfewr		:std_logic;
signal	mfmma1wr	:std_logic;
signal	mfmmc2wr	:std_logic;
signal	fmtxemp		:std_logic;
signal	mfmtxemp	:std_logic;
signal	fmwrbit		:std_logic;
signal	mfmwrbit	:std_logic;
signal	fmwren		:std_logic;
signal	mfmwren		:std_logic;
signal	fmtxend		:std_logic;
signal	mfmtxend	:std_logic;
signal	modsft		:std_logic;
signal	modbreak	:std_logic;
signal	wrbits		:std_logic;
signal	wrens		:std_logic;
signal	wrbitex		:std_logic;
signal	wrenex		:std_logic;

signal	RDDAT_DAT	:std_logic_vector(7 downto 0);
signal	nturns		:integer range 0 to 3;
signal	indexb		:std_logic;
signal	lindex		:std_logic;
signal	contdata	:std_logic;
signal	track0b		:std_logic;
signal	track0s		:std_logic;

signal	TCclr		:std_logic;
signal	sTC			:std_logic;
signal	TCen		:std_logic;

signal	INT		:std_logic;		--interrupt start
signal	INTs		:std_logic;		--interrput at seek/re-carib.
signal	sINT		:std_logic;		--interrupt start
signal	sINTs		:std_logic;		--interrput at seek/re-carib.
signal	DMARQ		:std_logic;		--DMA request start
signal	DMARQs	:std_logic;		--DMA request start
signal	setC		:std_logic;
signal	incC		:std_logic;
signal	resH		:std_logic;
signal	setH		:std_logic;
signal	setR		:std_logic;
signal	incR		:std_logic;
signal	resR		:std_logic;
signal	setN		:std_logic;
signal	setCs		:std_logic;
signal	incCs		:std_logic;
signal	resHs		:std_logic;
signal	setHs		:std_logic;
signal	setRs		:std_logic;
signal	incRs		:std_logic;
signal	resRs		:std_logic;
signal	setNs		:std_logic;
signal	bitwidth	:integer range 0 to maxbwidth*2;
signal	sftwidth	:integer range 0 to maxbwidth*2;
signal	setHD		:std_logic;
signal	resHD		:std_logic;
signal	setHDs	:std_logic;
signal	resHDs	:std_logic;

constant extcount	:integer	:=(sysclk*WR_WIDTH)/1000;

signal	NRDSTART		:std_logic;
signal	NOTRDY		:std_logic;

constant cmd_READDATA			:std_logic_vector(4 downto 0)	:="00110";
constant cmd_READDELETEDDATA	:std_logic_vector(4 downto 0)	:="01100";
constant cmd_WRITEDATA			:std_logic_vector(4 downto 0)	:="00101";
constant cmd_WRITEDELETEDDATA	:std_logic_vector(4 downto 0)	:="01001";
constant cmd_READATRACK			:std_logic_vector(4 downto 0)	:="00010";
constant cmd_READID				:std_logic_vector(4 downto 0)	:="01010";
constant cmd_FORMATATRACK		:std_logic_vector(4 downto 0)	:="01101";
constant cmd_SCANEQUAL			:std_logic_vector(4 downto 0)	:="10001";
constant cmd_SCANLOWEQUAL		:std_logic_vector(4 downto 0)	:="11001";
constant cmd_SCANHIGHEQUAL		:std_logic_vector(4 downto 0)	:="11101";
constant cmd_RECALIBRATE		:std_logic_vector(4 downto 0)	:="00111";
constant cmd_SENSEINTSTATUS		:std_logic_vector(4 downto 0)	:="01000";
constant cmd_SPECIFY			:std_logic_vector(4 downto 0)	:="00011";
constant cmd_SENSEDRIVESTATUS	:std_logic_vector(4 downto 0)	:="00100";
constant cmd_SEEK				:std_logic_vector(4 downto 0)	:="01111";

component fmmod
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txmf8	:in std_logic;
	txmfb	:in std_logic;
	txmfc	:in std_logic;
	txmfe	:in std_logic;
	break	:in std_logic;

	txemp	:out std_logic;
	txend	:out std_logic;

	bitout	:out std_logic;
	writeen	:out std_logic;

	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component mfmmod
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txma1	:in std_logic;
	txmc2	:in std_logic;
	break	:in std_logic;

	txemp	:out std_logic;
	txend	:out std_logic;

	bitout	:out std_logic;
	writeen	:out std_logic;

	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component fmdem
generic(
	bwidth	:integer	:=22
);
port(
	bitlen	:in integer range 0 to bwidth;

	datin	:in std_logic;

	init	:in std_logic;
	break	:in std_logic;

	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMF8	:out std_logic;
	DetMFB	:out std_logic;
	DetMFC	:out std_logic;
	DetMFE	:out std_logic;
	broken	:out std_logic;

	curlen	:out integer range 0 to bwidth*2;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component mfmdem
generic(
	bwidth	:integer	:=22
);
port(
	bitlen	:in integer range 0 to bwidth;

	datin	:in std_logic;

	init	:in std_logic;
	break	:in std_logic;

	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMA1	:out std_logic;
	DetMC2	:out std_logic;
	broken	:out std_logic;

	curlen	:out integer range 0 to bwidth*2;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component headseek
generic(
	maxtrack	:integer	:=79;
	maxset		:integer	:=10;
	initseek	:integer	:=0
);
port(
	desttrack	:in integer range 0 to maxtrack;
	destset		:in std_logic;
	setwait		:in integer range 0 to maxset;		--settling time
	
	curtrack	:out integer range 0 to maxtrack;
	
	reachtrack	:out std_logic;
	busy		:out std_logic;
	
	track0		:in std_logic;
	seek		:out std_logic;
	sdir		:out std_logic;
	
	init		:in std_logic;
	seekerr		:out std_logic;
	
	sft			:in std_logic;
	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component CRCGENN
	generic(
		DATWIDTH :integer	:=10;
		WIDTH	:integer	:=3
	);
	port(
		POLY	:in std_logic_vector(WIDTH downto 0);
		DATA	:in std_logic_vector(DATWIDTH-1 downto 0);
		DIR		:in std_logic;
		WRITE	:in std_logic;
		BITIN	:in std_logic;
		BITWR	:in std_logic;
		CLR		:in std_logic;
		CLRDAT	:in std_logic_vector(WIDTH-1 downto 0);
		CRC		:out std_logic_vector(WIDTH-1 downto 0);
		BUSY	:out std_logic;
		DONE	:out std_logic;
		CRCZERO	:out std_logic;

		clk		:in std_logic;
		ce      :in std_logic := '1';
		rstn	:in std_logic
	);
end component;

component NRDET
generic(
	TOms	:integer	:=800
);
port(
	start	:in std_logic;
	RDY		:in std_logic;

	NOTRDY	:out std_logic;

	mssft	:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sftgen
generic(
	maxlen	:integer	:=100
);
port(
	len		:in integer range 0 to maxlen;
	sft		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sftdiv
generic(
	width	:integer	:=8
);
port(
	sel		:in std_logic_vector(width-1 downto 0);
	sftin	:in std_logic;
	
	sftout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component signext
generic(
	extmax	:integer	:=10
);
port(
	len		:in integer range 0 to extmax;
	signin	:in std_logic;
	
	signout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component DIGIFILTER
	generic(
		TIME	:integer	:=2;
		DEF		:std_logic	:='0'
	);
	port(
		D	:in std_logic;
		Q	:out std_logic;

		clk	:in std_logic;
		ce  :in std_logic := '1';
		rstn :in std_logic
	);
end component;

component clktx is
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
	
	usel<=US;
	
	IOWR_DAT<='1' when CSn='0' and A0='1' and WRn='0' else '0';
	IORD_DAT<='1' when CSn='0' and A0='1' and RDn='0' else '0';
	IORD_STA<='1' when CSn='0' and A0='0' and RDn='0' else '0';
	DMAWR<='1' when DACKn='0' and WRn='0' else '0';
	DMARD<='1' when DACKn='0' and RDn='0' else '0';
	
	ixflt	:DIGIFILTER generic map(1,'1') port map(index,indexb,fclk,fd_ce,rstn);
	t0flt	:DIGIFILTER generic map(1,'1') port map(track0,track0b,fclk,fd_ce,rstn);
	t0flts:DIGIFILTER generic map(1,'1') port map(track0,track0s,sclk,sys_ce,rstn);
--	process(clk,rstn)begin
--		if(rstn='0')then
--			indexb<='0';
--		elsif(clk' event and clk='1')then
--			indexb<=index;
--		end if;
--	end process;
	
	DMARQtx	:clktx port map(DMARQ,DMARQs,fclk,fd_ce,sclk,sys_ce,rstn);

	process(sclk,rstn)
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				lIOWR_DAT<='0';
				lIORD_DAT<='0';
				--lIORD_STA<='0';
	--			lWDAT<=(others=>'0');
				CPUWRDAT<=(others=>'0');
				CPUWR_DAT<='0';
				CPURD_DAT<='0';
				--CPURD_STA<='0';
				DRQ<='0';
			elsif(sys_ce = '1')then
				CPUWR_DAT<='0';
				CPURD_DAT<='0';
				--CPURD_STA<='0';
				DMARDx<='0';
				DMAWRx<='0';
				if(IOWR_DAT='1')then
					CPUWRDAT<=WDAT;
				elsif(IOWR_DAT='0' and lIOWR_DAT='1')then
					CPUWR_DAT<='1';
				end if;
				if(IORD_DAT='0' and lIORD_DAT='1')then
					CPURD_DAT<='1';
				end if;
				--if(IORD_STA='0' and lIORD_STA='1')then
				--	CPURD_STA<='1';
				--end if;
				if(DMAWR='1')then
					CPUWRDAT<=WDAT;
				elsif(DMAWR='0' and lDMAWR='1')then
					DMAWRx<='1';
				end if;
				if(DMARD='0' and lDMARD='1')then
					DMARDx<='1';
				end if;
				if(DMARQs='1')then
					DRQ<='1';
				elsif(DACKn='0' or IORD_DAT='1' or IOWR_DAT='1')then
					DRQ<='0';
				end if;
				lIOWR_DAT<=IOWR_DAT;
				lIORD_DAT<=IORD_DAT;
				--lIORD_STA<=IORD_STA;
				lDMAWR<=DMAWR;
				lDMARD<=DMARD;
	--			lWDAT<=WDAT;
			end if;
		end if;
	end process;
	
	DATOE<='1' when IORD_DAT='1' or IORD_STA='1' or DMARD='1' else '0';
	
	setCtx	:clktx port map(setC,setCs,fclk,fd_ce,sclk,sys_ce,rstn);
	incCtx	:clktx port map(incC,incCs,fclk,fd_ce,sclk,sys_ce,rstn);
	resHtx	:clktx port map(resH,resHs,fclk,fd_ce,sclk,sys_ce,rstn);
	setHtx	:clktx port map(setH,setHs,fclk,fd_ce,sclk,sys_ce,rstn);
	setRtx	:clktx port map(setR,setRs,fclk,fd_ce,sclk,sys_ce,rstn);
	incRtx	:clktx port map(incR,incRs,fclk,fd_ce,sclk,sys_ce,rstn);
	resRtx	:clktx port map(resR,resRs,fclk,fd_ce,sclk,sys_ce,rstn);
	setNtx	:clktx port map(setN,setNs,fclk,fd_ce,sclk,sys_ce,rstn);
	setHDtx	:clktx port map(setHD,setHDs,fclk,fd_ce,sclk,sys_ce,rstn);
	resHDtx	:clktx port map(resHD,resHDs,fclk,fd_ce,sclk,sys_ce,rstn);
	endEXECtx	:clktx port map(end_EXEC,end_EXECs,fclk,fd_ce,sclk,sys_ce,rstn);
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				command	<=(others=>'0');
				C		<=(others=>'0');
				D		<=(others=>'0');
				DTL		<=(others=>'0');
				EOT		<=(others=>'0');
				GPL		<=(others=>'0');
				HD		<='0';
				--HLT		<=(others=>'0');
				--HUT		<=(others=>'0');
				MF		<='0';
				MT		<='0';
				N		<=(others=>'0');
				--NCN		<=0;
				ND		<='0';
				H		<=(others=>'0');
				R		<=(others=>'0');
				--RW		<='0';
				SC		<=(others=>'0');
				SK		<='0';
				SRT		<=(others=>'0');
				--STP		<=(others=>'0');
				US		<=(others=>'0');
				datnum	<=0;
				EXEC	<='0';
				RD_CMD	<='1';
				RDDAT_CMD<=(others=>'0');
				sDIOc	<='0';
				DxBclr	<='0';
				SEclr	<='0';
				SISclr	<='0';
			elsif(sys_ce = '1')then 
				EXEC<='0';
				DxBclr	<='0';
				SEclr	<='0';
				SISclr	<='0';
				if(setCs='1')then
					C<=rxC;
				elsif(incCs='1')then
					C<=C+x"01";
				end if;
				if(setHs='1')then
					H<=x"01";
				elsif(resHs='1')then
					H<=x"00";
				end if;
				if(setRs='1')then
					R<=rxR;
				elsif(incRs='1')then
					R<=R+x"01";
				elsif(resRs='1')then
					R<=x"01";
				end if;
				if(setNs='1')then
					N<=rxN;
				end if;
				if(setHDs='1')then
					HD<='1';
				elsif(resHDs='1')then
					HD<='0';
				end if;
				if(datnum=0)then
					RDDAT_CMD<=(others=>'0');
					RD_CMD<='1';
					sDIOc<='0';
					if(CPUWR_DAT='1')then
						command<=CPUWRDAT(4 downto 0);
						case CPUWRDAT(4 downto 0) is
						when cmd_READDATA =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when cmd_READDELETEDDATA =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when cmd_WRITEDATA =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
						when cmd_WRITEDELETEDDATA =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
						when cmd_READATRACK =>
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when cmd_READID =>
							MF<=CPUWRDAT(6);
						when cmd_FORMATATRACK =>
							MF<=CPUWRDAT(6);
							R<=x"00";
						when cmd_SCANEQUAL =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when cmd_SCANLOWEQUAL =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when cmd_SCANHIGHEQUAL =>
							MT<=CPUWRDAT(7);
							MF<=CPUWRDAT(6);
							SK<=CPUWRDAT(5);
						when others=>
						end case;
						datnum<=1;
					end if;
				else
					case command is
					when cmd_READDATA | cmd_READDELETEDDATA | cmd_WRITEDATA | cmd_WRITEDELETEDDATA | cmd_READATRACK |
						cmd_SCANEQUAL | cmd_SCANLOWEQUAL | cmd_SCANHIGHEQUAL =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(CPUWR_DAT='1')then
								C<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(CPUWR_DAT='1')then
								H<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 4 =>
							if(CPUWR_DAT='1')then
								R<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 5 =>
							if(CPUWR_DAT='1')then
								N<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 6 =>
							if(CPUWR_DAT='1')then
								EOT<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 7 =>
							if(CPUWR_DAT='1')then
								GPL<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 8 =>
							if(CPUWR_DAT='1')then
								DTL<=CPUWRDAT;
								RD_CMD<='0';
								sDIOc<='1';
								datnum<=datnum+1;
							end if;
						when 9 =>
							if(WAITIN='0')then
								EXEC<='1';
								datnum<=datnum+1;
							end if;
						when 10 =>
							if(end_EXECs='1')then
								RD_CMD<='1';
								RDDAT_CMD<=ST0;
								datnum<=datnum+1;
	--							SEclr<='1';
							end if;
						when 11=>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST1;
								datnum<=datnum+1;
							end if;
						when 12 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST2;
								datnum<=datnum+1;
							end if;
						when 13 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=C;
								datnum<=datnum+1;
							end if;
						when 14 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=H;
								datnum<=datnum+1;
							end if;
						when 15 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=R;
								datnum<=datnum+1;
							end if;
						when 16 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=N;
								datnum<=datnum+1;
							end if;
						when 17 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_READID =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
								sDIOc<='1';
								RD_CMD<='0';
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(WAITIN='0')then
								EXEC<='1';
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(end_EXECs='1')then
								RD_CMD<='1';
								RDDAT_CMD<=ST0;
	--							SEclr<='1';
								datnum<=datnum+1;
							end if;
						when 4=>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST1;
								datnum<=datnum+1;
							end if;
						when 5 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST2;
								datnum<=datnum+1;
							end if;
						when 6 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=C;
								datnum<=datnum+1;
							end if;
						when 7 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=H;
								datnum<=datnum+1;
							end if;
						when 8 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=R;
								datnum<=datnum+1;
							end if;
						when 9 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=N;
								datnum<=datnum+1;
							end if;
						when 10 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_FORMATATRACK =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(CPUWR_DAT='1')then
								N<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(CPUWR_DAT='1')then
								SC<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 4 =>
							if(CPUWR_DAT='1')then
								GPL<=CPUWRDAT;
								datnum<=datnum+1;
							end if;
						when 5 =>
							if(CPUWR_DAT='1')then
								D<=CPUWRDAT;
								R<=x"01";
								sDIOc<='1';
								RD_CMD<='0';
								datnum<=datnum+1;
							end if;
						when 6 =>
							if(WAITIN='0')then
								EXEC<='1';
								datnum<=datnum+1;
							end if;
						when 7 =>
							if(end_EXECs='1')then
								RD_CMD<='1';
								RDDAT_CMD<=ST0;
	--							SEclr<='1';
								datnum<=datnum+1;
							end if;
						when 8=>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST1;
								datnum<=datnum+1;
							end if;
						when 9 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=ST2;
								datnum<=datnum+1;
							end if;
						when 10 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=C;
								datnum<=datnum+1;
							end if;
						when 11 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=H;
								datnum<=datnum+1;
							end if;
						when 12 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=R;
								datnum<=datnum+1;
							end if;
						when 13 =>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=N;
								datnum<=datnum+1;
							end if;
						when 14 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_RECALIBRATE =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
	--							HD<='0';
								--NCN<=0;
								C<=x"00";
								RD_CMD<='0';
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(WAITIN='0')then
								EXEC<='1';
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(end_EXECs='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_SENSEINTSTATUS =>
						case datnum is
						when 1 =>
							RD_CMD<='1';
							sDIOc<='1';
							if(SISen='1')then
								RDDAT_CMD<=ST0;
								SEclr<='1';
								datnum<=datnum+1;
							else
								RDDAT_CMD<=x"80";
								datnum<=4;
							end if;
						when 2=>
							if(CPURD_DAT='1')then
								RDDAT_CMD<=PCN;
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								DxBclr<='1';
								SISclr<='1';
								datnum<=0;
							end if;
						when 4 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_SPECIFY =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								--HUT<=CPUWRDAT(3 downto 0);
								SRT<=CPUWRDAT(7 downto 4);
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(CPUWR_DAT='1')then
								--HLT<=CPUWRDAT(7 downto 1);
								ND<=CPUWRDAT(0);
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_SENSEDRIVESTATUS =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
								RD_CMD<='1';
								sDIOc<='1';
								datnum<=datnum+1;
							end if;
						when 2 =>
								RDDAT_CMD<=ST3;
								datnum<=datnum+1;
						when 3 =>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when cmd_SEEK =>
						case datnum is
						when 1 =>
							if(CPUWR_DAT='1')then
								US<=CPUWRDAT(1 downto 0);
								HD<=CPUWRDAT(2);
	--							HD<='0';
								datnum<=datnum+1;
							end if;
						when 2 =>
							if(CPUWR_DAT='1')then
								--NCN<=conv_integer(CPUWRDAT);
								C<=CPUWRDAT;
								RD_CMD<='0';
								datnum<=datnum+1;
							end if;
						when 3 =>
							if(WAITIN='0')then
								EXEC<='1';
								datnum<=datnum+1;
							end if;
						when 4 =>
							if(end_EXECs='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					when others =>		--Invalid
						case datnum is
						when 1 =>
							RD_CMD<='1';
							RDDAT_CMD<=x"80";
							sDIOc<='1';
							datnum<=datnum+1;
						when 2=>
							if(CPURD_DAT='1')then
								RD_CMD<='1';
								datnum<=0;
							end if;
						when others =>
							datnum<=0;
						end case;
					end case;
				end if;
			end if;
		end if;
	end process;
	
	sCB<=	'0'	when command=cmd_RECALIBRATE and datnum=2 else
			'0'	when command=cmd_SEEK and datnum=3 else
			'0'	when datnum=0 else
			'1';

--	sCB<=	'0' when command="00111" else
--			'0' when command="01111" else
--			'0' when execstate=es_idle else
--			'1';
	
	process(fclk,rstn)begin
		if rising_edge(fclk) then
			if(rstn='0')then
				lCPURD_DAT<=(others=>'0');
				lCPUWR_DAT<=(others=>'0');
				lDMARDx<=(others=>'0');
				lDMAWRx<=(others=>'0');
				CPURD_DATf<='0';
				CPUWR_DATf<='0';
				DMARDxf<='0';
				DMAWRxf<='0';
			elsif(fd_ce = '1')then
				CPURD_DATf<='0';
				CPUWR_DATf<='0';
				DMARDxf<='0';
				DMAWRxf<='0';
				lCPURD_DAT<=lCPURD_DAT(0) & CPURD_DAT;
				lCPUWR_DAT<=lCPUWR_DAT(0) & CPUWR_DAT;
				lDMARDx<=lDMARDx(0) & DMARDx;
				lDMAWRx<=lDMAWRx(0) & DMAWRx;
				if(lCPURD_DAT="01")then
					CPURD_DATf<='1';
				end if;
				if(lCPUWR_DAT="01")then
					CPUWR_DATf<='1';
				end if;
				if(lDMARDx="01")then
					DMARDxf<='1';
				end if;
				if(lDMAWRx="01")then
					DMAWRxf<='1';
				end if;
			end if;
		end if;
	end process;
	
	process(fclk,rstn)begin
		if rising_edge(fclk) then
			if(rstn='0')then
				execstate<=es_idle;
				end_EXEC<='0';
				seek_bgn<='0';
				seek_init<='0';
				crcclr<='0';
				crcin<=(others=>'0');
				crcwr<='0';
				deminit<='0';
				dembreak<='0';
				PCN<=(others=>'0');
				cntR<=(others=>'0');
				rxC<=(others=>'0');
				rxH<=(others=>'0');
				rxR<=(others=>'0');
				rxN<=(others=>'0');
				--contdata<='0';
				TCclr<='0';
				INT<='0';
				INTs<='0';
				DMARQ<='0';
				DETSECT<='0';
				setC<='0';
				incC<='0';
				resH<='0';
				setH<='0';
				setR<='0';
				incR<='0';
				resR<='0';
				setN<='0';
				setHD<='0';
				resHD<='0';
				sIC<="00";
				sOR<='0';
				sND<='0';
				sDE<='0';
				sEN<='0';
				sDIOd<='0';
				sNW<='0';
				sMA<='0';
				sRQM<='1';
				sCM<='0';
				sWC<='0';
				sDD<='0';
				sMD<='0';
				--iSE<='0';
				sSH<='0';
				txdat<=(others=>'0');
				fmtxwr<='0';
				mfmtxwr<='0';
				fmmf8wr<='0';
				fmmfbwr<='0';
				fmmfcwr<='0';
				fmmfewr<='0';
				mfmma1wr<='0';
				mfmmc2wr<='0';
				modbreak<='0';
				Nf<=(others=>'0');
				NRDSTART<='0';
				ecommand<=(others=>'0');
				COMPDAT<=(others=>'0');
				scancomp<='0';
			elsif(fd_ce = '1')then
				end_EXEC<='0';
				seek_bgn<='0';
				seek_init<='0';
				crcclr<='0';
				crcwr<='0';
				deminit<='0';
				dembreak<='0';
				fmtxwr<='0';
				mfmtxwr<='0';
				fmmf8wr<='0';
				fmmfbwr<='0';
				fmmfcwr<='0';
				fmmfewr<='0';
				mfmma1wr<='0';
				mfmmc2wr<='0';
				modbreak<='0';
				TCclr<='0';
				INT<='0';
				INTs<='0';
				DMARQ<='0';
				setC<='0';
				incC<='0';
				resH<='0';
				setH<='0';
				setR<='0';
				incR<='0';
				resR<='0';
				setN<='0';
				setHD<='0';
				resHD<='0';
				NRDSTART<='0';
				if(execstate=es_idle)then
					sRQM<='1';
					if(EXEC='1')then
						sIC<="00";
						sOR<='0';
						sND<='0';
						sDE<='0';
						sEN<='0';
						sNW<='0';
						sMA<='0';
						sWC<='0';
						sDD<='0';
						sEN<='0';
						sSH<='0';
						sMD<='0';
						--contdata<='0';
						sRQM<='0';
						sCM<='0';
						DETSECT<='0';
						NRDSTART<='1';
						ecommand<=command;
						case command is
						when cmd_READDATA =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								crcclr<='1';
								deminit<='1';
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_READDELETEDDATA =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								crcclr<='1';
								deminit<='1';
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_WRITEDATA =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								crcclr<='1';
								deminit<='1';
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_WRITEDELETEDDATA =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								crcclr<='1';
								deminit<='1';
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_READATRACK =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								crcclr<='1';
								deminit<='1';
								execstate<=es_windex;
							end if;
							nturns<=0;
						when cmd_READID =>
							crcclr<='1';
							deminit<='1';
							execstate<=es_IAM0;
							nturns<=0;
						when cmd_FORMATATRACK =>
							execstate<=es_windex;
							nturns<=0;
							cntR<=x"01";
						when cmd_SCANEQUAL =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_SCANLOWEQUAL =>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_SCANHIGHEQUAL	=>
							if(preseek='1')then
								seek_bgn<='1';
								execstate<=es_seek;
							else
								execstate<=es_IAM0;
							end if;
							nturns<=0;
						when cmd_RECALIBRATE =>
							seek_init<='1';
							execstate<=es_seek;
						when cmd_SEEK =>
							seek_bgn<='1';
							execstate<=es_seek;
						when others=>
							execstate<=es_idle;
							sRQM<='1';
						end case;
					end if;
				else
					case ecommand is
					when cmd_READDATA | cmd_READDELETEDDATA | cmd_READATRACK  =>
						if(execstate/=es_seek and lindex='1' and indexb='0')then
	--						if(contdata='1')then
	--							if(MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--								crcclr<='1';
	--								contdata<='0';
	--								deminit<='1';
	--								execstate<=es_IAM0;
	--							else
	--								sEN<='1';
	--								sHD<=HD;
	--								sUS<=US;
	--								PCN<=cPCN;
	--								sIC<="01";
	--								INT<='1';
	--								end_EXEC<='1';
	--								execstate<=es_IDLE;
	--							end if;
	--						end if;
							if(nturns<3)then
								nturns<=nturns+1;
	--							if(nturns=2 and MT='1' and H='0')then
	--								nturns<=0;
	--								setHD<='1';
	--							end if;
							else
								sHD<=HD;
								sUS<=US;
								sIC<="01";
								sND<='1';
								if(DETSECT='0')then
									sMA<='1';
								else
									sMD<='1';
								end if;
								PCN<=cPCN;
								INT<='1';
								--iSE<='0';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						elsif(NOTRDY='1')then
							sHD<=HD;
							sUS<=US;
							sIC<="11";
							sND<='0';
							sMA<='0';
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						end if;
						case execstate is
						when es_seek =>
							if(seek_end='1')then
								execstate<=es_IAM0;
								crcclr<='1';
								deminit<='1';
							elsif(seek_err='1')then
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='1';
								execstate<=es_idle;
							end if;
						when es_windex =>
							if(lindex='1' and indexb='0')then
								execstate<=es_IAM0;
							end if;
						when es_IAM0 =>
							if(MF='0')then
								if(fmmfedet='1')then
									crcin<=x"fe";
									crcwr<='1';
									execstate<=es_C;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_IAM1;
								end if;
							end if;
						when es_IAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM3 =>
							if(mfmrxed='1' and mfmrxdat=x"fe")then
								crcin<=x"fe";
								crcwr<='1';
								execstate<=es_C;
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_C =>
							if(MF='0')then
								if(fmrxed='1')then
									rxC<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxC<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_H =>
							if(MF='0')then
								if(fmrxed='1')then
									rxH<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxH<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_R =>
							if(MF='0')then
								if(fmrxed='1')then
									rxR<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxR<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_N =>
							if(MF='0')then
								if(fmrxed='1')then
									rxN<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxN<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi0 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCic =>
							if(crcdone='1')then
								if(crczero='1' and rxC=C and rxH=H and (rxR=R or ecommand=cmd_READATRACK) and rxN=N)then
									if(rxC=C)then
										sWC<='0';
										execstate<=es_DAM0;
										crcclr<='1';
										DETSECT<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="01";
										sWC<='1';
										INT<='1';
										--iSE<='0';
										end_EXEC<='1';
										execstate<=es_IDLE;
									end if;
								else
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_DAM0 =>
							if(MF='0')then
								if(fmmf8det='1')then
									sCM<='1';
								end if;
								if((((ecommand=cmd_READDATA or ecommand=cmd_READATRACK) or SK='0') and fmmfbdet='1') or ((ecommand=cmd_READDELETEDDATA or SK='0') and fmmf8det='1'))then
									if(fmmf8det='1')then
										crcin<=x"f8";
									else
										crcin<=x"fb";
									end if;
									crcwr<='1';
									TCclr<='1';
									execstate<=es_DATA;
								elsif(fmmf8det='1' or fmmfbdet='1'or fmmfcdet='1' or fmmfedet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_DAM1;
								elsif(mfmmc2det='1' or mfmrxed='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
							if(N=x"00" and (rxN/=x"00" or DTL<x"80"))then
								bytecount<=conv_integer(DTL);
							elsif(rxN=x"00")then
								bytecount<=128;
							elsif(rxN=x"01")then
								bytecount<=256;
							elsif(rxN=x"02")then
								bytecount<=512;
							elsif(rxN=x"03")then
								bytecount<=1024;
							elsif(rxN=x"04")then
								bytecount<=2048;
							elsif(rxN=x"05")then
								bytecount<=4096;
							elsif(rxN=x"06")then
								bytecount<=8192;
							else
								bytecount<=16384;
							end if;
						when es_DAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DAM3 =>
							if(mfmrxed='1')then
								if(mfmrxdat=x"f8")then
									sCM<='1';
								end if;
							end if;
							if(mfmrxed='1' and ((((ecommand=cmd_READDATA or ecommand=cmd_READATRACK) or SK='0') and mfmrxdat=x"fb") or ((ecommand=cmd_READDELETEDDATA or SK='0') and mfmrxdat=x"f8")))then
								crcin<=mfmrxdat;
								crcwr<='1';
								TCclr<='1';
								execstate<=es_DATA;
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DATA =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									RDDAT_DAT<=fmrxdat;
									sDIOd<='1';
									sRQM<='1';
									execstate<=es_DATAw;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									RDDAT_DAT<=mfmrxdat;
									sDIOd<='1';
									sRQM<='1';
									execstate<=es_DATAw;
								end if;
							end if;
						when es_DATAw =>
							if(CPURD_DATf='1' or DMARDxf='1')then
								sRQM<='0';
								if(bytecount>1)then
									bytecount<=bytecount-1;
									execstate<=es_DATA;
								else
									execstate<=es_CRCd0;
								end if;
							elsif((MF='0' and fmrxed='1') or (MF='1' and mfmrxed='1'))then
								sOR<='1';
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='0';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						when es_CRCd0 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCd1;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCd1;
								end if;
							end if;
						when es_CRCd1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCdc;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCdc;
								end if;
							end if;
						when es_CRCdc =>
							if(crcdone='1')then
								if(crczero='1')then
									if(R<EOT)then
										incR<='1';
									elsif(MT='1')then
										if(HD='0')then
											resR<='1';
											setH<='1';
											setHD<='1';
										else
											resR<='1';
											resH<='1';
											resHD<='1';
											incC<='1';
										end if;
									else
										resR<='1';
										incC<='1';
									end if;
									sDE<='0';
									if(TCen='1')then
										execstate<=es_IDLE;
										sIC<="00";
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										INT<='1';
										--iSE<='1';
										end_EXEC<='1';
									elsif(R>=EOT)then
										sEN<='1';
										execstate<=es_IDLE;
										sIC<="01";
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										INT<='1';
										--iSE<='1';
										end_EXEC<='1';
									else
										nturns<=0;
										crcclr<='1';
										--contdata<='1';
										DETSECT<='0';
										execstate<=es_IAM0;
									end if;
								else
									sDE<='1';
									sIC<="01";
									sHD<=HD;
									sUS<=US;
									sDD<='1';
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									execstate<=es_idle;
									end_EXEC<='1';
								end if;
							end if;
						when others =>
							execstate<=es_idle;
						end case;
					when cmd_WRITEDATA | cmd_WRITEDELETEDDATA =>
						if(WPRT='0')then
							sIC<="01";
							sNW<='1';
							sHD<=HD;
							sUS<=US;
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						elsif(execstate/=es_seek and lindex='1' and indexb='0')then
	--						if(contdata='1')then
	--							if(MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--								crcclr<='1';
	--								contdata<='0';
	--								execstate<=es_IAM0;
	--							else
	--								sEN<='1';
	--								sHD<=HD;
	--								sUS<=US;
	--								PCN<=cPCN;
	--								sIC<="00";
	--								INT<='1';
	--								end_EXEC<='1';
	--								execstate<=es_IDLE;
	--							end if;
	--						end if;
							if(nturns<3)then
	--							if(nturns=2 and MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--							end if;
								nturns<=nturns+1;
							else
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='0';
								sIC<="01";
								sND<='1';
								sMA<='1';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						elsif(NOTRDY='1')then
							sHD<=HD;
							sUS<=US;
							sIC<="11";
							sND<='0';
							sMA<='0';
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						end if;
						case execstate is
						when es_seek =>
							if(seek_end='1')then
								execstate<=es_IAM0;
								crcclr<='1';
								deminit<='1';
							elsif(seek_err='1')then
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='1';
								execstate<=es_idle;
							end if;
						when es_windex =>
							if(lindex='1' and indexb='0')then
								execstate<=es_IAM0;
							end if;
						when es_IAM0 =>
							if(MF='0')then
								if(fmmfedet='1')then
									crcin<=x"fe";
									crcwr<='1';
									execstate<=es_C;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_IAM1;
								end if;
							end if;
						when es_IAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM3 =>
							if(mfmrxed='1' and mfmrxdat=x"fe")then
								crcin<=x"fe";
								crcwr<='1';
								execstate<=es_C;
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_C =>
							if(MF='0')then
								if(fmrxed='1')then
									rxC<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxC<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_H =>
							if(MF='0')then
								if(fmrxed='1')then
									rxH<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxH<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_R =>
							if(MF='0')then
								if(fmrxed='1')then
									rxR<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxR<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_N =>
							if(MF='0')then
								if(fmrxed='1')then
									rxN<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxN<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi0 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCic =>
							if(crcdone='1')then
								if(crczero='1' and rxC=C and rxH=H and rxR=R and rxN=N)then
									if(rxC=C)then
										execstate<=es_Gap2;
										if(MF='0')then
											bytecount<=nfmGap2-1;
											txdat<=x"ff";
											fmtxwr<='1';
										else
											bytecount<=nmfmGap2-1;
											txdat<=x"4e";
											mfmtxwr<='1';
										end if;
										crcclr<='1';
										DETSECT<='1';
										sWC<='0';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="01";
										sWC<='1';
										INT<='1';
										--iSE<='0';
										end_EXEC<='1';
										execstate<=es_IDLE;
									end if;
								else
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_Gap2 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									bytecount<=bytecount-1;
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
								else
									txdat<=x"00";
									if(MF='0')then
										bytecount<=nfmSyncd-1;
										fmtxwr<='1';
									else
										bytecount<=nmfmSyncd-1;
										mfmtxwr<='1';
									end if;
									execstate<=es_Syncd;
									crcclr<='1';
								end if;
							end if;
						when es_Syncd =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									if(MF='0')then
										if(ecommand=cmd_WRITEDELETEDDATA)then	--Deleted
											fmmf8wr<='1';
											crcin<=x"f8";
										else
											fmmfbwr<='1';
											crcin<=x"fb";
										end if;
										crcwr<='1';
									else
										mfmma1wr<='1';
										crcin<=x"a1";
										crcwr<='1';
									end if;
									execstate<=es_DAM0;
								end if;
							end if;
						when es_DAM0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									sRQM<='1';
									sDIOd<='0';
									TCclr<='1';
									execstate<=es_DATA;
								else
									mfmma1wr<='1';
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_DAM1;
								end if;
								if(N=x"00" and (rxN/=x"00" or DTL<x"80"))then
									bytecount<=conv_integer(DTL);
								elsif(rxN=x"00")then
									bytecount<=128;
								elsif(rxN=x"01")then
									bytecount<=256;
								elsif(rxN=x"02")then
									bytecount<=512;
								elsif(rxN=x"03")then
									bytecount<=1024;
								elsif(rxN=x"04")then
									bytecount<=2048;
								elsif(rxN=x"05")then
									bytecount<=4096;
								elsif(rxN=x"06")then
									bytecount<=8192;
								else
									bytecount<=16384;
								end if;
							end if;
						when es_DAM1 =>
							if(mfmtxemp='1')then
								mfmma1wr<='1';
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM2;
							end if;
						when es_DAM2 =>
							if(mfmtxemp='1')then
								if(ecommand=cmd_WRITEDELETEDDATA)then
									txdat<=x"f8";
									crcin<=x"f8";
								else
									txdat<=x"fb";
									crcin<=x"fb";
								end if;
								mfmtxwr<='1';
								crcwr<='1';
								execstate<=es_DAM3;
							end if;
						when es_DAM3 =>
							if(mfmtxemp='1')then
								if(ND='0')then
									DMARQ<='1';
								else
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									sIC<="00";
									INT<='1';
									--iSE<='0';
								end if;
								sRQM<='1';
								sDIOd<='0';
								TCclr<='1';
								execstate<=es_DATA;
							end if;
						when es_DATA =>
							if(CPUWR_DATf='1' or DMAWRxf='1')then
								sRQM<='0';
								txdat<=CPUWRDAT;
								crcin<=CPUWRDAT;
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								crcwr<='1';
								if(bytecount>1)then
									bytecount<=bytecount-1;
									execstate<=es_DATAw;
								else
									execstate<=es_CRCd0;
								end if;
							elsif((MF='0' and fmtxend='1') or (MF='1' and mfmtxend='1'))then
								sOR<='1';
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								sIC<="01";
								INT<='1';
								--iSE<='0';
								execstate<=es_IDLE;
								end_EXEC<='1';
							end if;
						when es_DATAw =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(ND='0')then
									DMARQ<='1';
								else
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									sIC<="00";
									INT<='1';
									--iSE<='0';
								end if;
								sRQM<='1';
								sDIOd<='0';
								execstate<=es_DATA;
							end if;
						when es_CRCd0 =>
							if(((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1')) and crcbusy='0')then
								txdat<=crcdat(15 downto 8);
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								execstate<=es_CRCd1;
							end if;
						when es_CRCd1 =>
							if(((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1')) and crcbusy='0')then
								txdat<=crcdat(7 downto 0);
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								bytecount<=conv_integer(GPL)/2;
								execstate<=es_GAP3;
								if(R<EOT)then
									incR<='1';
								elsif(MT='1')then
									if(HD='0')then
										resR<='1';
										setH<='1';
										setHD<='1';
									else
										resR<='1';
										resH<='1';
										resHD<='1';
										incC<='1';
									end if;
								else
									resR<='1';
									incC<='1';
								end if;
							end if;
						when es_GAP3 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>1)then
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								elsif(TCen='1')then
									execstate<=es_IDLE;
									sIC<="00";
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									INT<='1';
									--iSE<='1';
									end_EXEC<='1';
								else
									nturns<=0;
									--contdata<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when others=>
							execstate<=es_IDLE;
							end_EXEC<='1';
						end case;
	--				when "00010" =>		--Read a Track
	--					if(execstate/=es_seek and lindex='1' and indexb='0')then
	--						if(contdata='1')then
	--							if(MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--								contdata<='0';
	--								crcclr<='1';
	--								execstate<=es_IAM0;
	--							else
	--								sEN<='1';
	--								sHD<=HD;
	--								sUS<=US;
	--								PCN<=cPCN;
	--								sIC<="00";
	--								INT<='1';
	--								end_EXEC<='1';
	--								execstate<=es_IDLE;
	--							end if;
	--						end if;
	--						if(nturns<3)then
	--							if(nturns=2 and MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--							end if;
	--							nturns<=nturns+1;
	--						else
	--							sHD<=HD;
	--							sUS<=US;
	--							PCN<=cPCN;
	--							sIC<="01";
	--							INT<='1';
	--							sND<='1';
	--							end_EXEC<='1';
	--							execstate<=es_IDLE;
	--						end if;
	--					end if;
	--					case execstate is
	--					when es_seek =>
	--						if(seek_end='1')then
	--							execstate<=es_windex;
	--							crcclr<='1';
	--							deminit<='1';
	--						elsif(seek_err='1')then
	--							sIC<="01";
	--							sHD<=HD;
	--							sUS<=US;
	--							PCN<=cPCN;
	--							INT<='1';
	--							execstate<=es_idle;
	--						end if;
	--					when es_windex =>
	--						if(lindex='1' and indexb='0')then
	--							execstate<=es_DAM0;
	--							deminit<='1';
	--						end if;
	--					when es_DAM0 =>
	--						if(MF='0')then
	--							if(fmmf8det='1')then
	--								sCM<='1';
	--							end if;
	--							if(fmmfbdet='1' or (SK='0' and fmmf8det='1'))then
	--								if(fmmf8det='1')then
	--									crcin<=x"f8";
	--								else
	--									crcin<=x"fb";
	--								end if;
	--								crcwr<='1';
	--								execstate<=es_DATA;
	--							elsif(fmmf8det='1' or fmmfbdet='1'or fmmfcdet='1' or fmmfedet='1' or fmrxed='1')then
	--								dembreak<='1';
	--								crcclr<='1';
	--							end if;
	--						else
	--							if(mfmma1det='1')then
	--								crcin<=x"a1";
	--								crcwr<='1';
	--								execstate<=es_DAM1;
	--							end if;
	--						end if;
	--						if(N=x"00" and (rxN/=x"00" or DTL<x"80"))then
	--							bytecount<=conv_integer(DTL);
	--						elsif(rxN=x"00")then
	--							bytecount<=128;
	--						elsif(rxN=x"01")then
	--							bytecount<=256;
	--						elsif(rxN=x"02")then
	--							bytecount<=512;
	--						elsif(rxN=x"03")then
	--							bytecount<=1024;
	--						elsif(rxN=x"04")then
	--							bytecount<=2048;
	--						elsif(rxN=x"05")then
	--							bytecount<=4096;
	--						elsif(rxN=x"06")then
	--							bytecount<=8192;
	--						else
	--							bytecount<=16384;
	--						end if;
	--					when es_DAM1 =>
	--						if(mfmma1det='1')then
	--							crcin<=x"a1";
	--							crcwr<='1';
	--							execstate<=es_DAM2;
	--						elsif(mfmmc2det='1' or mfmrxed='1')then
	--							dembreak<='1';
	--							crcclr<='1';
	--							execstate<=es_DAM0;
	--						end if;
	--					when es_DAM2 =>
	--						if(mfmma1det='1')then
	--							crcin<=x"a1";
	--							crcwr<='1';
	--							execstate<=es_DAM3;
	--						elsif(mfmmc2det='1' or mfmrxed='1')then
	--							dembreak<='1';
	--							crcclr<='1';
	--							execstate<=es_DAM0;
	--						end if;
	--					when es_DAM3 =>
	--						if(mfmrxed='1')then
	--							if(mfmrxdat=x"f8")then
	--								sCM<='1';
	--							end if;
	--						end if;
	--						if(mfmrxed='1' and (((ecommand="00110" or SK='0') and mfmrxdat=x"fb") or ((ecommand="01100" or SK='0') and mfmrxdat=x"f8")))then
	--							crcin<=mfmrxdat;
	--							crcwr<='1';
	--							execstate<=es_DATA;
	--						elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
	--							dembreak<='1';
	--							crcclr<='1';
	--							execstate<=es_DAM0;
	--						end if;
	--					when es_DATA =>
	--						if(MF='0')then
	--							if(fmrxed='1')then
	--								crcin<=fmrxdat;
	--								crcwr<='1';
	--								if(ND='0')then
	--									DMARQ<='1';
	--								else
	--									sHD<=HD;
	--									sUS<=US;
	--									PCN<=cPCN;
	--									sIC<="00";
	--									INT<='1';
	--								end if;
	--								RDDAT_DAT<=fmrxdat;
	--								sDIOd<='1';
	--								sRQM<='1';
	--								execstate<=es_DATAw;
	--							end if;
	--						else
	--							if(mfmrxed='1')then
	--								crcin<=mfmrxdat;
	--								crcwr<='1';
	--								if(ND='0')then
	--									DMARQ<='1';
	--								else
	--									sHD<=HD;
	--									sUS<=US;
	--									PCN<=cPCN;
	--									sIC<="00";
	--									INT<='1';
	--								end if;
	--								RDDAT_DAT<=mfmrxdat;
	--								sDIOd<='1';
	--								sRQM<='1';
	--								execstate<=es_DATAw;
	--							end if;
	--						end if;
	--					when es_DATAw =>
	--						if(CPURD_DATf='1' or DMARDx=f'1')then
	--							sRQM<='0';
	--							if(bytecount>1)then
	--								bytecount<=bytecount-1;
	--								execstate<=es_DATA;
	--							else
	--								execstate<=es_CRCd0;
	--							end if;
	--						elsif((MF='0' and fmrxed='1') or (MF='1' and mfmrxed='1'))then
	--							sOR<='1';
	--							sIC<="01";
	--							sHD<=HD;
	--							sUS<=US;
	--							PCN<=cPCN;
	--							INT<='1';
	--							end_EXEC<='1';
	--							execstate<=es_IDLE;
	--						end if;
	--					when es_CRCd0 =>
	--						if(MF='0')then
	--							if(fmrxed='1')then
	--								crcin<=fmrxdat;
	--								crcwr<='1';
	--								execstate<=es_CRCd1;
	--							end if;
	--						else
	--							if(mfmrxed='1')then
	--								crcin<=mfmrxdat;
	--								crcwr<='1';
	--								execstate<=es_CRCd1;
	--							end if;
	--						end if;
	--					when es_CRCd1 =>
	--						if(MF='0')then
	--							if(fmrxed='1')then
	--								crcin<=fmrxdat;
	--								crcwr<='0';
	--								execstate<=es_CRCdc;
	--							end if;
	--						else
	--							if(mfmrxed='1')then
	--								crcin<=mfmrxdat;
	--								crcwr<='1';
	--								execstate<=es_CRCdc;
	--							end if;
	--						end if;
	--					when es_CRCdc =>
	--						if(crcdone='1')then
	--							if(crczero='1')then
	--								sDE<='0';
	--								if(TCen='1')then
	--									execstate<=es_IDLE;
	--									sIC<="00";
	--									sHD<=HD;
	--									sUS<=US;
	--									PCN<=cPCN;
	--									INT<='1';
	--									end_EXEC<='1';
	--								else
	--									execstate<=es_DAM0;
	--								end if;
	--							else
	--								sDE<='1';
	--								sIC<="01";
	--								sHD<=HD;
	--								sUS<=US;
	--								PCN<=cPCN;
	--								INT<='1';
	--								execstate<=es_idle;
	--								end_EXEC<='1';
	--							end if;
	--						end if;
	--					when others =>
	--						execstate<=es_idle;
	--					end case;
					when cmd_READID =>
						if(execstate/=es_seek and lindex='1' and indexb='0')then
							if(nturns<3)then
	--							if(nturns=2 and MT='1' and HD='0')then
	--								nturns<=0;
	--								setH<='1';
	--							end if;
								nturns<=nturns+1;
							else
								if(MT='1' and HD='0')then
									setHD<='1';
								else
									sHD<=HD;
									sUS<=US;
									sIC<="01";
									sND<='1';
									sMA<='1';
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									end_EXEC<='1';
									execstate<=es_IDLE;
								end if;
							end if;
						elsif(NOTRDY='1')then
							sHD<=HD;
							sUS<=US;
							sIC<="11";
							sND<='0';
							sMA<='0';
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						end if;
						case execstate is
						when es_IAM0 =>
							if(MF='0')then
								if(fmmfedet='1')then
									crcin<=x"fe";
									crcwr<='1';
									execstate<=es_C;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_IAM1;
								end if;
							end if;
						when es_IAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM3 =>
							if(mfmrxed='1' and mfmrxdat=x"fe")then
								crcin<=x"fe";
								crcwr<='1';
								execstate<=es_C;
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_C =>
							if(MF='0')then
								if(fmrxed='1')then
									rxC<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxC<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_H =>
							if(MF='0')then
								if(fmrxed='1')then
									rxH<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxH<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_R =>
							if(MF='0')then
								if(fmrxed='1')then
									rxR<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxR<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_N =>
							if(MF='0')then
								if(fmrxed='1')then
									rxN<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxN<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi0 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCic =>
							if(crcdone='1')then
								if(crczero='1')then
									execstate<=es_IDLE;
									sIC<="00";
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									setC<='1';
									if(rxH=x"00")then
										resH<='1';
									else
										setH<='1';
									end if;
									setR<='1';
									setN<='1';
									end_EXEC<='1';
									crcclr<='1';
								else
									sHD<=HD;
									sUS<=US;
									sIC<="01";
									sND<='1';
									sMA<='0';
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									end_EXEC<='1';
									execstate<=es_IDLE;
									crcclr<='1';
								end if;
							end if;
						when others=>
							execstate<=es_idle;
							end_EXEC<='1';
						end case;
	
					when cmd_SCANEQUAL | cmd_SCANLOWEQUAL| cmd_SCANHIGHEQUAL =>
						if(execstate/=es_seek and lindex='1' and indexb='0')then
							if(nturns<3)then
								nturns<=nturns+1;
							else
								sHD<=HD;
								sUS<=US;
								sIC<="01";
								sND<='1';
								if(DETSECT='0')then
									sMA<='1';
								else
									sMD<='1';
								end if;
								PCN<=cPCN;
								INT<='1';
								--iSE<='0';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						elsif(NOTRDY='1')then
							sHD<=HD;
							sUS<=US;
							sIC<="11";
							sND<='0';
							sMA<='0';
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						end if;
						case execstate is
						when es_seek =>
							if(seek_end='1')then
								execstate<=es_IAM0;
								crcclr<='1';
								deminit<='1';
							elsif(seek_err='1')then
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='1';
								execstate<=es_idle;
							end if;
						when es_windex =>
							if(lindex='1' and indexb='0')then
								execstate<=es_IAM0;
							end if;
						when es_IAM0 =>
							if(MF='0')then
								if(fmmfedet='1')then
									crcin<=x"fe";
									crcwr<='1';
									execstate<=es_C;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_IAM1;
								end if;
							end if;
						when es_IAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_IAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_IAM3 =>
							if(mfmrxed='1' and mfmrxdat=x"fe")then
								crcin<=x"fe";
								crcwr<='1';
								execstate<=es_C;
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_C =>
							if(MF='0')then
								if(fmrxed='1')then
									rxC<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxC<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_H;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_H =>
							if(MF='0')then
								if(fmrxed='1')then
									rxH<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxH<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_R;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_R =>
							if(MF='0')then
								if(fmrxed='1')then
									rxR<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxR<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_N;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_N =>
							if(MF='0')then
								if(fmrxed='1')then
									rxN<=fmrxdat;
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									rxN<=mfmrxdat;
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi0;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi0 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCi1;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCi1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(fmmf8det='1' or fmmfbdet='1' or fmmfcdet='1' or fmmfedet='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									dembreak<='1';
									execstate<=es_CRCic;
								elsif(mfmma1det='1' or mfmmc2det='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_CRCic =>
							if(crcdone='1')then
								if(crczero='1' and rxC=C and rxH=H and rxR=R and rxN=N)then
									if(rxC=C)then
										sWC<='0';
										execstate<=es_DAM0;
										crcclr<='1';
										DETSECT<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="01";
										sWC<='1';
										INT<='1';
										--iSE<='0';
										end_EXEC<='1';
										execstate<=es_IDLE;
									end if;
								else
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_DAM0 =>
							if(MF='0')then
								if(fmmf8det='1')then
									sCM<='1';
								end if;
								if(fmmfbdet='1' or fmmf8det='1')then
									if(fmmf8det='1')then
										crcin<=x"f8";
									else
										crcin<=x"fb";
									end if;
									crcwr<='1';
									TCclr<='1';
									execstate<=es_DATA;
									scancomp<='0';
								elsif(fmmf8det='1' or fmmfbdet='1'or fmmfcdet='1' or fmmfedet='1' or fmrxed='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							else
								if(mfmma1det='1')then
									crcin<=x"a1";
									crcwr<='1';
									execstate<=es_DAM1;
								elsif(mfmmc2det='1' or mfmrxed='1')then
									dembreak<='1';
									crcclr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
							if(N=x"00" and (rxN/=x"00" or DTL<x"80"))then
								bytecount<=conv_integer(DTL);
							elsif(rxN=x"00")then
								bytecount<=128;
							elsif(rxN=x"01")then
								bytecount<=256;
							elsif(rxN=x"02")then
								bytecount<=512;
							elsif(rxN=x"03")then
								bytecount<=1024;
							elsif(rxN=x"04")then
								bytecount<=2048;
							elsif(rxN=x"05")then
								bytecount<=4096;
							elsif(rxN=x"06")then
								bytecount<=8192;
							else
								bytecount<=16384;
							end if;
						when es_DAM1 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM2;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DAM2 =>
							if(mfmma1det='1')then
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM3;
							elsif(mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DAM3 =>
							if(mfmrxed='1')then
								if(mfmrxdat=x"f8")then
									sCM<='1';
								end if;
							end if;
							if(mfmrxed='1' and (mfmrxdat=x"fb" or mfmrxdat=x"f8"))then
								crcin<=mfmrxdat;
								crcwr<='1';
								TCclr<='1';
								execstate<=es_DATA;
								scancomp<='0';
							elsif(mfmma1det='1' or mfmmc2det='1' or mfmrxed='1')then
								dembreak<='1';
								crcclr<='1';
								execstate<=es_IAM0;
							end if;
						when es_DATA =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									COMPDAT<=fmrxdat;
									sDIOd<='0';
									sRQM<='1';
									execstate<=es_DATAw;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									COMPDAT<=mfmrxdat;
									sDIOd<='0';
									sRQM<='1';
									execstate<=es_DATAw;
								end if;
							end if;
						when es_DATAw =>
							if(CPUWR_DATf='1' or DMAWRxf='1')then
								sRQM<='0';
								if(CPUWRDAT=x"ff" or CPUWRDAT=COMPDAT or scancomp='1')then
									if(bytecount>1)then
										bytecount<=bytecount-1;
										execstate<=es_DATA;
									else
										execstate<=es_CRCd0;
									end if;
								elsif(COMPDAT<CPUWRDAT and command=cmd_SCANLOWEQUAL)then
									scancomp<='1';
									if(bytecount>1)then
										bytecount<=bytecount-1;
										execstate<=es_DATA;
									else
										execstate<=es_CRCd0;
									end if;
								elsif(COMPDAT>CPUWRDAT and command=cmd_SCANHIGHEQUAL)then
									scancomp<='1';
									if(bytecount>1)then
										bytecount<=bytecount-1;
										execstate<=es_DATA;
									else
										execstate<=es_CRCd0;
									end if;
								else
									sOR<='0';
									sIC<="01";
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									end_EXEC<='1';
									execstate<=es_IDLE;
								end if;
							elsif((MF='0' and fmrxed='1') or (MF='1' and mfmrxed='1'))then
								sOR<='1';
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INT<='1';
								--iSE<='0';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						when es_CRCd0 =>
							if(scancomp='0')then
								sSH<='1';
							else
								sSH<='0';
							end if;
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCd1;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCd1;
								end if;
							end if;
						when es_CRCd1 =>
							if(MF='0')then
								if(fmrxed='1')then
									crcin<=fmrxdat;
									crcwr<='1';
									execstate<=es_CRCdc;
								end if;
							else
								if(mfmrxed='1')then
									crcin<=mfmrxdat;
									crcwr<='1';
									execstate<=es_CRCdc;
								end if;
							end if;
						when es_CRCdc =>
							if(crcdone='1')then
								if(crczero='1')then
									if(R<EOT)then
										incR<='1';
									elsif(MT='1')then
										if(HD='0')then
											resR<='1';
											setH<='1';
											setHD<='1';
										else
											resR<='1';
											resH<='1';
											resHD<='1';
											incC<='1';
										end if;
									else
										resR<='1';
										incC<='1';
									end if;
									sDE<='0';
									if(TCen='1')then
										execstate<=es_IDLE;
										sIC<="00";
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										INT<='1';
										--iSE<='1';
										end_EXEC<='1';
									elsif(R>=EOT)then
										sEN<='1';
										execstate<=es_IDLE;
										sIC<="01";
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										INT<='1';
										--iSE<='1';
										end_EXEC<='1';
									else
										nturns<=0;
										crcclr<='1';
										--contdata<='1';
										DETSECT<='0';
										execstate<=es_IAM0;
									end if;
								else
									sDE<='1';
									sIC<="01";
									sHD<=HD;
									sUS<=US;
									sDD<='1';
									PCN<=cPCN;
									INT<='1';
									--iSE<='0';
									execstate<=es_idle;
									end_EXEC<='1';
								end if;
							end if;
						when others =>
							execstate<=es_idle;
						end case;
	
					when cmd_FORMATATRACK =>		--Format a Track
						if(WPRT='0')then
							sIC<="01";
							sNW<='1';
							sHD<=HD;
							sUS<=US;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						elsif(lindex='1' and indexb='0')then
							if(execstate/=es_windex)then
								modbreak<='1';
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								sIC<="00";
								INT<='1';
								--iSE<='0';
								end_EXEC<='1';
								execstate<=es_IDLE;
							end if;
						elsif(NOTRDY='1')then
							sHD<=HD;
							sUS<=US;
							sIC<="11";
							sND<='0';
							sMA<='0';
							PCN<=cPCN;
							INT<='1';
							--iSE<='0';
							end_EXEC<='1';
							execstate<=es_IDLE;
						end if;
						case execstate is
						when es_windex =>
							if(lindex='1' and indexb='0')then
								if(MF='0')then
									bytecount<=nfmGap0-1;
									txdat<=x"ff";
									fmtxwr<='1';
								else
									bytecount<=nmfmGap0-1;
									txdat<=x"4e";
									mfmtxwr<='1';
								end if;
								execstate<=es_GAP0;
							end if;
						when es_GAP0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
										bytecount<=nfmSyncp;
									else
										mfmtxwr<='1';
										bytecount<=nmfmSyncp;
									end if;
									execstate<=es_syncp;
								end if;
							end if;
						when es_syncp =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									if(MF='0')then
										fmmfcwr<='1';
									else
										mfmmc2wr<='1';
									end if;
									execstate<=es_IM0;
								end if;
							end if;
						when es_IM0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									txdat<=x"ff";
									fmtxwr<='1';
									bytecount<=nfmGap1-1;
									execstate<=es_GAP1;
								else
									mfmmc2wr<='1';
									execstate<=es_IM1;
								end if;
							end if;
						when es_IM1 =>
							if(mfmtxemp='1')then
								mfmmc2wr<='1';
								execstate<=es_IM2;
							end if;
						when es_IM2 =>
							if(mfmtxemp='1')then
								txdat<=x"fc";
								mfmtxwr<='1';
								execstate<=es_IM3;
							end if;
						when es_IM3 =>
							if(mfmtxemp='1')then
								txdat<=x"4e";
								mfmtxwr<='1';
								bytecount<=nmfmGap1-1;
								execstate<=es_GAP1;
							end if;
						when es_GAP1 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
										bytecount<=nfmSynci-1;
									else
										mfmtxwr<='1';
										bytecount<=nmfmSynci-1;
									end if;
									execstate<=es_Synci;
									crcclr<='1';
								end if;
							end if;
						when es_Synci =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									if(MF='0')then
										fmmfewr<='1';
										crcin<=x"fe";
									else
										mfmma1wr<='1';
										crcin<=x"a1";
									end if;
									crcwr<='1';
									execstate<=es_IAM0;
								end if;
							end if;
						when es_iAM0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									if(ND='0')then
										DMARQ<='1';
									else
										sHD<=HD;
										sUS<=US;
										PCN<=cPCN;
										sIC<="00";
										INT<='1';
										--iSE<='0';
									end if;
									sRQM<='1';
									sDIOd<='0';
									execstate<=es_C;
								else
									mfmma1wr<='1';
									crcin<=x"a1";
									execstate<=es_iAM1;
								end if;
								crcwr<='1';
							end if;
						when es_iAM1 =>
							if(mfmtxemp='1')then
								mfmma1wr<='1';
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_iAM2;
							end if;
						when es_iAM2 =>
							if(mfmtxemp='1')then
								txdat<=x"fe";
								crcin<=x"fe";
								mfmtxwr<='1';
								crcwr<='1';
								execstate<=es_iAM3;
							end if;
						when es_iAM3 =>
							if(mfmtxemp='1')then
								if(ND='0')then
									DMARQ<='1';
								else
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									sIC<="00";
									INT<='1';
									--iSE<='0';
								end if;
								sRQM<='1';
								sDIOd<='0';
								execstate<=es_C;
							end if;
						when es_C | es_H | es_R | es_N =>
							if(CPUWR_DATf='1' or DMAWRxf='1')then
								sRQM<='0';
								txdat<=CPUWRDAT;
								crcin<=CPUWRDAT;
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								crcwr<='1';
								case execstate is
								when es_C =>
									execstate<=es_Cw;
								when es_H =>
									execstate<=es_Hw;
								when es_R =>
									execstate<=es_Rw;
								when es_N =>
									Nf<=CPUWRDAT;
									execstate<=es_Nw;
								when others =>
									execstate<=es_IDLE;
								end case;
							elsif((MF='0' and fmtxend='1') or (MF='1' and mfmtxend='1'))then
								sOR<='1';
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								sIC<="01";
								INT<='1';
								--iSE<='0';
								execstate<=es_IDLE;
								end_EXEC<='1';
							end if;
						when es_Cw | es_Hw | es_Rw =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(ND='0')then
									DMARQ<='1';
								else
									sHD<=HD;
									sUS<=US;
									PCN<=cPCN;
									sIC<="00";
									INT<='1';
									--iSE<='0';
								end if;
								sRQM<='1';
								sDIOd<='0';
								case execstate is
								when es_Cw =>
									execstate<=es_H;
								when es_Hw =>
									execstate<=es_R;
								when es_Rw =>
									execstate<=es_N;
								when others =>
									execstate<=es_IDLE;
								end case;
							end if;
						when es_Nw =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								txdat<=crcdat(15 downto 8);
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								execstate<=es_CRCi0;
							end if;
						when es_CRCi0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								txdat<=crcdat(7 downto 0);
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								execstate<=es_CRCi1;
							end if;
						when es_CRCi1 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									txdat<=x"ff";
									fmtxwr<='1';
									bytecount<=nfmGap2-1;
								else
									txdat<=x"4e";
									mfmtxwr<='1';
									bytecount<=nmfmGap2-1;
								end if;
								execstate<=es_GAP2;
							end if;
						when es_GAP2 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
										bytecount<=nfmSyncd-1;
									else
										mfmtxwr<='1';
										bytecount<=nmfmSyncd-1;
									end if;
									crcclr<='1';
									execstate<=es_Syncd;
								end if;
							end if;
						when es_Syncd =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>0)then
									txdat<=x"00";
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									if(MF='0')then
										fmmfbwr<='1';
										crcin<=x"fb";
									else
										mfmma1wr<='1';
										crcin<=x"a1";
									end if;
									crcwr<='1';
									execstate<=es_DAM0;
								end if;
							end if;
						when es_DAM0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									txdat<=D;
									crcin<=D;
									fmtxwr<='1';
									execstate<=es_DATA;
								else
									mfmma1wr<='1';
									crcin<=x"a1";
									execstate<=es_DAM1;
								end if;
								crcwr<='1';
								if(Nf=x"00")then
									bytecount<=conv_integer(DTL);
								elsif(Nf=x"00")then
									bytecount<=128;
								elsif(Nf=x"01")then
									bytecount<=256;
								elsif(Nf=x"02")then
									bytecount<=512;
								elsif(Nf=x"03")then
									bytecount<=1024;
								elsif(Nf=x"04")then
									bytecount<=2048;
								elsif(Nf=x"05")then
									bytecount<=4096;
								elsif(Nf=x"06")then
									bytecount<=8192;
								else
									bytecount<=16384;
								end if;
							end if;
						when es_DAM1 =>
							if(mfmtxemp='1')then
								mfmma1wr<='1';
								crcin<=x"a1";
								crcwr<='1';
								execstate<=es_DAM2;
							end if;
						when es_DAM2 =>
							if(mfmtxemp='1')then
								txdat<=x"fb";
								crcin<=x"fb";
								mfmtxwr<='1';
								crcwr<='1';
								execstate<=es_DAM3;
							end if;
						when es_DAM3 =>
							if(mfmtxemp='1')then
								txdat<=D;
								crcin<=D;
								mfmtxwr<='1';
								crcwr<='1';
								execstate<=es_DATA;
							end if;
						when es_DATA =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>1)then
									txdat<=D;
									crcin<=D;
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									crcwr<='1';
									bytecount<=bytecount-1;
								elsif(crcbusy='0')then
									txdat<=crcdat(15 downto 8);
									if(MF='0')then
										fmtxwr<='1';
									else
										mfmtxwr<='1';
									end if;
									execstate<=es_CRCd0;
								end if;
							end if;
						when es_CRCd0 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								txdat<=crcdat(7 downto 0);
								if(MF='0')then
									fmtxwr<='1';
								else
									mfmtxwr<='1';
								end if;
								execstate<=es_CRCd1;
								crcclr<='1';
							end if;
						when es_CRCd1 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									txdat<=x"ff";
									fmtxwr<='1';
								else
									txdat<=x"4e";
									mfmtxwr<='1';
								end if;
								bytecount<=conv_integer(GPL);
								execstate<=es_GAP3;
							end if;
						when es_GAP3 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(bytecount>1)then
									if(MF='0')then
										txdat<=x"ff";
										fmtxwr<='1';
									else
										txdat<=x"4e";
										mfmtxwr<='1';
									end if;
									bytecount<=bytecount-1;
								else
									if(cntR<SC)then
										txdat<=x"00";
										if(MF='0')then
											fmtxwr<='1';
											bytecount<=nfmSynci-1;
										else
											mfmtxwr<='1';
											bytecount<=nmfmSynci-1;
										end if;
										cntR<=cntR+x"01";
										execstate<=es_Synci;
									else
										if(MF='0')then
											txdat<=x"ff";
											fmtxwr<='1';
										else
											txdat<=x"4e";
											mfmtxwr<='1';
										end if;
										execstate<=es_GAP4;
									end if;
								end if;
							end if;
						when es_GAP4 =>
							if((MF='0' and fmtxemp='1') or (MF='1' and mfmtxemp='1'))then
								if(MF='0')then
									txdat<=x"ff";
									fmtxwr<='1';
								else
									txdat<=x"4e";
									mfmtxwr<='1';
								end if;
							end if;
						when others=>
							execstate<=es_idle;
							end_EXEC<='1';
						end case;
					when cmd_RECALIBRATE | cmd_SEEK =>		--re-calibrate  / seek
						case execstate is
						when es_seek =>
	--						end_EXEC<='1';
	--						sRQM<='1';
							if(seek_end='1')then
								execstate<=es_IDLE;
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								sIC<="00";
								INTs<='1';
								--iSE<='1';
								sRQM<='1';
								end_EXEC<='1';
							elsif(seek_err='1')then
								sIC<="01";
								sHD<=HD;
								sUS<=US;
								PCN<=cPCN;
								INTs<='1';
								--iSE<='1';
								sRQM<='1';
								end_EXEC<='1';
								execstate<=es_idle;
							end if;
						when others=>
							execstate<=es_IDLE;
						end case;
					when others=>
						execstate<=es_idle;
						end_EXEC<='1';
					end case;
				end if;
				lindex<=indexb;
			end if;
		end if;
	end process;
	
	inttx	:clktx port map(INT,sINT,fclk,fd_ce,sclk,sys_ce,rstn);
	intstx:clktx port map(INTs,sINTs,fclk,fd_ce,sclk,sys_ce,rstn);
	
	process(sclk,rstn)begin
		if rising_edge(sclk) then
			if(rstn='0')then
				INTn<='1';
				SISen<='0';
			elsif(sys_ce = '1')then
				if(sINTs='1')then
					INTn<='0';
					SISen<='1';
				elsif(sINT='1')then
					INTn<='0';
					if(ismode='1')then
						SISen<='1';
					end if;
				elsif(CPUWR_DAT='1' or CPURD_DAT='1')then	-- or CPURD_STA='1' or DMARDx='1' or DMAWRx='1'
					INTn<='1';
				end if;
				if(SISclr='1')then
					SISen<='0';
				end if;
			end if;
		end if;
	end process;
	
	sBC <= '0';
	sSN <= '0';

	sEXM<='1' when (execstate/=es_IDLE and ND='1') else '0';
	sNR<=READY;
	ST0<=sIC &sSE & sEC & sNR & sHD & sUS;
	ST1<=sEN & '0' & sDE & sOR & '0' & sND & sNW & sMA;
	ST2<='0' & sCM & sDD & sWC & sSH & sSN & sBC & sMD;
	ST3<='0' & not WPRT & not READY & not track0s & '1' & sideb & uselb;
	MSR<=sRQM & sDIO & sEXM & sCB & sDxB;
	
	RDAT<=	RDDAT_DAT when DACKn='0' else
			MSR when A0='0' else
			RDDAT_CMD	when RD_CMD='1' else
			RDDAT_DAT;
	
	sDIO<=sDIOc when RD_CMD='1' else sDIOd;
	
	sideb<=HD;
	side<=not sideb;
	uselb<=US;
	usel<=uselb;
	
	process(sclk,rstn)
	variable	ext	:std_logic_vector(3 downto 0);
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				sTC<='0';
			elsif(sys_ce = '1')then
				if(TC='1')then
					sTC<='1';
				elsif(TCen='1')then
					sTC<='0';
				end if;
			end if;
		end if;
	end process;
	
	process(fclk,rstn)begin
		if rising_edge(fclk) then
			if(rstn='0')then
				TCen<='0';
			elsif(fd_ce = '1')then
				if(TCclr='1')then
					TCen<='0';
				elsif(sTC='1')then
					TCen<='1';
				end if;
			end if;
		end if;
	end process;
	
	bitwidth<=
				int0	when US="00" else
				int1	when US="01" else
				int2	when US="10" else
				int3;


	process(fclk,rstn)begin
		if rising_edge(fclk) then
			if(rstn='0')then
				sDxB<=(others=>'0');
			elsif(fd_ce = '1')then
				if(seek_busy0='1')then
					sDxB(0)<='1';
				end if;
				if(seek_busy1='1')then
					sDxB(1)<='1';
				end if;
				if(seek_busy2='1')then
					sDxB(2)<='1';
				end if;
				if(seek_busy3='1')then
					sDxB(3)<='1';
				end if;
				if(DxBclr='1')then
					sDxB<=(others=>'0');
				end if;
			end if;
		end if;
	end process;
			
--	sDxB(0)<=seek_busy0;
--	sDxB(1)<=seek_busy1;
--	sDxB(2)<=seek_busy2;
--	sDxB(3)<=seek_busy3;

	sksft	:sftdiv generic map(4) port map(
		sel		=>not SRT,
		sftin	=>hmssft,
		
		sftout	=>seek_sft,
		
		clk		=>fclk,
		ce      =>fd_ce,
		rstn	=>rstn
	);

	seek_bgn0<=seek_bgn when US="00" else '0';
	seek_bgn1<=seek_bgn when US="01" else '0';
	seek_bgn2<=seek_bgn when US="10" else '0';
	seek_bgn3<=seek_bgn when US="11" else '0';

	seek_init0<=seek_init when US="00" else '0';
	seek_init1<=seek_init when US="01" else '0';
	seek_init2<=seek_init when US="10" else '0';
	seek_init3<=seek_init when US="11" else '0';
	
	iC<=conv_integer(C);
	seek_cyl0<=iC when td0='1' else iC*2 when (iC*2)<maxtrack else maxtrack;
	seek_cyl1<=iC when td1='1' else iC*2 when (iC*2)<maxtrack else maxtrack;
	seek_cyl2<=iC when td2='1' else iC*2 when (iC*2)<maxtrack else maxtrack;
	seek_cyl3<=iC when td3='1' else iC*2 when (iC*2)<maxtrack else maxtrack;
	
	seek_sft0	<=seek_sft when US="00" else '0';
	seek_sft1	<=seek_sft when US="01" else '0';
	seek_sft2	<=seek_sft when US="10" else '0';
	seek_sft3	<=seek_sft when US="11" else '0';
	
	hds0	:headseek generic map(maxtrack,30,0) port map(
		desttrack	=>seek_cyl0,
		destset		=>seek_bgn0,
		setwait		=>30,

		curtrack	=>seek_cur0,
	
		reachtrack	=>seek_end0,
		busy		=>seek_busy0,
	
		track0		=>track0b,
		seek		=>STEP0,
		sdir		=>SDIR0,
	
		init		=>seek_init0,
		seekerr		=>seek_err0,
		sft			=>seek_sft0,
		clk			=>fclk,
		ce          =>fd_ce,
		rstn		=>rstn
	);
	
	hds1	:headseek generic map(maxtrack,30,0) port map(
		desttrack	=>seek_cyl1,
		destset		=>seek_bgn1,
		setwait		=>30,
	
		curtrack	=>seek_cur1,
	
		reachtrack	=>seek_end1,
		busy		=>seek_busy1,
	
		track0		=>track0b,
		seek		=>STEP1,
		sdir		=>SDIR1,
	
		init		=>seek_init1,
		seekerr		=>seek_err1,
		sft			=>seek_sft1,
		clk			=>fclk,
		ce          =>fd_ce,
		rstn		=>rstn
	);
	
	hds2	:headseek generic map(maxtrack,30,0) port map(
		desttrack	=>seek_cyl2,
		destset		=>seek_bgn2,
		setwait		=>30,
	
		curtrack	=>seek_cur2,
	
		reachtrack	=>seek_end2,
		busy		=>seek_busy2,
	
		track0		=>track0b,
		seek		=>STEP2,
		sdir		=>SDIR2,
	
		init		=>seek_init2,
		seekerr		=>seek_err2,
		sft			=>seek_sft2,
		clk			=>fclk,
		ce          =>fd_ce,
		rstn		=>rstn
	);
	
	hds3	:headseek generic map(maxtrack,30,0) port map(
		desttrack	=>seek_cyl3,
		destset		=>seek_bgn3,
		setwait		=>30,
	
		curtrack	=>seek_cur3,
	
		reachtrack	=>seek_end3,
		busy		=>seek_busy3,
	
		track0		=>track0b,
		seek		=>STEP3,
		sdir		=>SDIR3,
	
		init		=>seek_init3,
		seekerr		=>seek_err3,
		sft			=>seek_sft3,
		clk			=>fclk,
		ce          =>fd_ce,
		rstn		=>rstn
	);
	
	seek_end<=	seek_end0 when US="00" else
				seek_end1 when US="01" else
				seek_end2 when US="10" else
				seek_end3 when US="11" else
				'0';
	seek_busy<=	seek_busy0 when US="00" else
				seek_busy1 when US="01" else
				seek_busy2 when US="10" else
				seek_busy3 when US="11" else
				'0';
	STEP<=		STEP0 when US="00" else
				STEP1 when US="01" else
				STEP2 when US="10" else
				STEP3 when US="11" else
				'1';
	SDIR<=		SDIR0 when US="00" else
				SDIR1 when US="01" else
				SDIR2 when US="10" else
				SDIR3 when US="11" else
				'1';
	seek_err<=	seek_err0  when US="00" else
				seek_err1  when US="01" else
				seek_err2  when US="10" else
				seek_err3  when US="11" else
				'0';
	PCN0<=conv_std_logic_vector(seek_cur0,8);
	PCN1<=conv_std_logic_vector(seek_cur1,8);
	PCN2<=conv_std_logic_vector(seek_cur2,8);
	PCN3<=conv_std_logic_vector(seek_cur3,8);
	cPCN<=		PCN0 when US="00" and td0='1' else '0' & PCN0(7 downto 1) when US="00" else
				PCN1 when US="01" and td1='1' else '0' & PCN1(7 downto 1) when US="01" else
				PCN2 when US="10" and td2='1' else '0' & PCN2(7 downto 1) when US="10" else
				PCN3 when US="11" and td3='1' else '0' & PCN3(7 downto 1) when US="11" else
				(others=>'0');

	sEC<=seek_err;
--	sSE<=not seek_busy;
--	sSE<=iSE;

	process(fclk,rstn)begin
		if rising_edge(fclk) then
			if(rstn='0')then
				sSE<='0';
			elsif(fd_ce = '1')then
				if(seek_end='1')then
					sSE<='1';
				elsif(SEclr='1')then
					sSE<='0';
				end if;
			end if;
		end if;
	end process;

	CRCG	:CRCGENN generic map(8,16) port map(
		POLY	=>"10000100000010001",
		DATA	=>crcin,
		DIR		=>'0',
		WRITE	=>crcwr,
		BITIN	=>'0',
		BITWR	=>'0',
		CLR		=>crcclr,
		CLRDAT	=>x"ffff",
		CRC		=>crcdat,
		BUSY	=>crcbusy,
		DONE	=>crcdone,
		CRCZERO	=>crczero,

		clk		=>fclk,
		ce      =>fd_ce,
		rstn	=>rstn
	);
	
	FMD	:fmdem generic map(
	bwidth	=>maxbwidth
)
port map(
	bitlen	=>bitwidth,
	
	datin	=>RDBIT,
	
	init	=>deminit,
	break	=>dembreak,
	
	RXDAT	=>fmrxdat,
	RXED	=>fmrxed,
	DetMF8	=>fmmf8det,
	DetMFB	=>fmmfbdet,
	DetMFC	=>fmmfcdet,
	DetMFE	=>fmmfedet,
	
	--curlen	=>fmcurwid,
	
	clk		=>fclk,
	ce      =>fd_ce,
	rstn	=>rstn
);

	MFMD:mfmdem generic map(
	bwidth	=>maxbwidth/2
)
port map(
	bitlen	=>bitwidth/2,
	
	datin	=>RDBIT,
	
	init	=>deminit,
	break	=>dembreak,
	
	RXDAT	=>mfmrxdat,
	RXED	=>mfmrxed,
	DetMA1	=>mfmma1det,
	DetMC2	=>mfmmc2det,
	
	--curlen	=>mfmcurwid,
	
	clk		=>fclk,
	ce      =>fd_ce,
	rstn	=>rstn
);

	sftwidth<= bitwidth when MF='0' else bitwidth/2;
	
	sgen:sftgen generic map(maxbwidth*2) port map(
		len		=>sftwidth,
		sft		=>modsft,
		
		clk		=>fclk,
		ce      =>fd_ce,
		rstn	=>rstn
	);

	FMM	:fmmod
port map(
	txdat	=>txdat,
	txwr	=>fmtxwr,
	txmf8	=>fmmf8wr,
	txmfb	=>fmmfbwr,
	txmfc	=>fmmfcwr,
	txmfe	=>fmmfewr,
	break	=>modbreak,
	
	txemp	=>fmtxemp,
	txend	=>fmtxend,
	
	bitout	=>fmwrbit,
	writeen	=>fmwren,
	
	sft		=>modsft,
	clk		=>fclk,
	ce      =>fd_ce,
	rstn	=>rstn
);

	MFMM :mfmmod
port map(
	txdat	=>txdat,
	txwr	=>mfmtxwr,
	txma1	=>mfmma1wr,
	txmc2	=>mfmmc2wr,
	break	=>modbreak,
	
	txemp	=>mfmtxemp,
	txend	=>mfmtxend,
	
	bitout	=>mfmwrbit,
	writeen	=>mfmwren,
	
	sft		=>modsft,
	clk		=>fclk,
	ce      =>fd_ce,
	rstn	=>rstn
);

	RDET	:NRDET generic map(rdytout*2) port map(
		start	=>NRDSTART,
		RDY		=>READY,
		
		NOTRDY	=>NOTRDY,
		
		mssft	=>hmssft,
		clk		=>fclk,
		ce      =>fd_ce,
		rstn	=>rstn
	);

	wrbits<=fmwrbit when MF='0' else mfmwrbit;
	wrens<=fmwren when MF='0' else mfmwren;
	
	wbext	:signext generic map(extcount) port map(extcount,wrbits,wrbitex,fclk,fd_ce,rstn);
	weext	:signext generic map(extcount) port map(extcount,wrens,wrenex,fclk,fd_ce,rstn);
	
	WREN<=not wrenex;
	WRBIT<=not wrbitex;
	
	busy<=	'1' when seek_busy='1' else
			'1' when datnum/=0 else
			'0';
		
	mfm<=mf;
	
end rtl;
