LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
	use work.FDC_timing.all;

entity X68K_top is
generic(
	RCFREQ		:integer	:=80;			--SDRAM clock MHz
	SCFREQ		:integer	:=10000;		--kHz
	FCFREQ		:integer	:=40000;		--FDC clock
	ACFREQ		:integer	:=40000;		--Audio clock
	DACFREQ		:integer	:=16000;		--Audio DAC freq
	DEBUG			:std_logic_vector(7 downto 0)	:="00110010"	--nop,SPRBGONOFF,OPMCH_ONOFF,PAUSE_ONOFF,GRP_ONOFF,SCR_ONOFF,ADPCM_ONOFF,CYCLERESET
);
port(
	ramclk	:in std_logic;
	sysclk	:in std_logic;
	vidclk	:in std_logic;
	fdcclk	:in std_logic;
	sndclk	:in std_logic;

	ram_ce  :in std_logic := '1';
	sys_ce  :in std_logic;
	mpu_cep :in std_logic;
	mpu_cen :in std_logic;
	fd_ce   :in std_logic := '1';
	snd_ce  :in std_logic;
	opm_ce  :in std_logic_vector(1 downto 0);
	
	cm_out  :out std_logic;
	vid_hz  :in std_logic;

	plllock	:in std_logic;
	CPUS    :in std_logic := '0';
	
	sysrtc	:in std_logic_vector(64 downto 0);
	
   -- SD-RAM ports
   -- pMemClk     : out std_logic;                        -- SD-RAM Clock
   pMemCke     : out std_logic;                        -- SD-RAM Clock enable
   pMemCs_n    : out std_logic;                        -- SD-RAM Chip select
   pMemRas_n   : out std_logic;                        -- SD-RAM Row/RAS
   pMemCas_n   : out std_logic;                        -- SD-RAM /CAS
   pMemWe_n    : out std_logic;                        -- SD-RAM /WE
   pMemUdq     : out std_logic;                        -- SD-RAM UDQM
   pMemLdq     : out std_logic;                        -- SD-RAM LDQM
   pMemBa1     : out std_logic;                        -- SD-RAM Bank select address 1
   pMemBa0     : out std_logic;                        -- SD-RAM Bank select address 0
   pMemAdr     : out std_logic_vector(12 downto 0);    -- SD-RAM Address
   pMemDat     : inout std_logic_vector(15 downto 0);  -- SD-RAM Data

	-- ROM image loader
	ldr_addr		:in std_logic_vector(19 downto 0);
	ldr_aen		:in std_logic;
	ldr_wdat		:in std_logic_vector(7 downto 0);
	ldr_wr		:in std_logic;
	ldr_ack		:out std_logic;
	ldr_done		:in std_logic;

    -- PS/2 keyboard ports
   pPs2Clkin	: in std_logic;
   pPs2Clkout	: out std_logic;
   pPs2Datin	: in std_logic;
   pPs2Datout	: out std_logic;
   pPmsClkin	: in std_logic;
   pPmsClkout	: out std_logic;
   pPmsDatin	: in std_logic;
   pPmsDatout	: out std_logic;

    -- Joystick ports (Port_A, Port_B)
	pJoyA       : in std_logic_vector( 5 downto 0);
   pJoyB       : in std_logic_vector( 5 downto 0);
   pStrA			: out std_logic;
	pStrB			: out std_logic;

	pFDSYNC		:in std_logic_Vector(1 downto 0);
	pFDEJECT		:in std_logic_Vector(1 downto 0);
	pFDMOTOR		:out std_logic;
	
--MiSTer diskimage
	mist_mounted	:in std_logic_vector(3 downto 0);	--SRAM & HDD & FDD1 &FDD0
	mist_readonly	:in std_logic_vector(3 downto 0);
	mist_imgsize	:in std_logic_vector(63 downto 0);

	mist_lba		:out std_logic_vector(31 downto 0);
	mist_rd			:out std_logic_vector(3 downto 0);
	mist_wr			:out std_logic_vector(3 downto 0);
	mist_ack		:in std_logic_vector(3 downto 0);

	mist_buffaddr	:in std_logic_vector(8 downto 0);
	mist_buffdout	:in std_logic_vector(7 downto 0);
	mist_buffdin	:out std_logic_vector(7 downto 0);
	mist_buffwr		:in std_logic;

    -- DIP switch, Lamp ports
	pDip       : in std_logic_vector( 3 downto 0);     -- 0=ON,  1=OFF(default on shipment)
	pLed       : out std_logic;
	pPsw			: in std_logic_vector(1 downto 0);
	
	pSramld		:in std_logic;
	pSramst		:in std_logic;

	pMidi_in		:in std_logic;
	pMidi_out	:out std_logic;

	pVideoClk	:out std_logic;
	pVideoR		:out std_logic_vector(7 downto 0);
	pVideoG		:out std_logic_vector(7 downto 0);
	pVideoB		:out std_logic_vector(7 downto 0);
	pVideoHB        :out std_logic;
	pVideoVB        :out std_logic;
	pVideoEN		:out std_logic;
	pVideoHS		:out std_logic;
	pVideoVS		:out std_logic;
	pVideoF1        :buffer std_logic;
	
	pSndL		:out std_logic_vector(15 downto 0);
	pSndR		:out std_logic_vector(15 downto 0);
	
	pSndYML		:out std_logic_vector(15 downto 0);
	pSndYMR		:out std_logic_vector(15 downto 0);
	
	pSndPCML		:out std_logic_vector(15 downto 0);
	pSndPCMR		:out std_logic_vector(15 downto 0);
	
	rstn		:in std_logic;
	dHMode      :in std_logic_vector(1 downto 0) := "11";
	dVMode      :in std_logic := '1'
);
end X68K_top;

architecture rtl of X68K_top is

constant brsize		:integer	:=7;
constant RAMAWIDTH	:integer	:=25;	--per byte

constant DBIT_CYCLERESET	:integer	:=0;
constant DBIT_ADPCM_ONOFF	:integer	:=1;
constant DBIT_SCR_ONOFF		:integer	:=2;
constant DBIT_GRP_ONOFF		:integer	:=3;
constant DBIT_PAUSE_ONOFF	:integer	:=4;
constant DBIT_OPMCH_ONOFF	:integer	:=5;
constant DBIT_SPRBG_ONOFF	:integer	:=6;

signal	srstn	:std_logic;
signal	srst	:std_logic;
signal	pllrst	:std_logic;
signal	mem_rstn:std_logic;
signal	pwr_rstn:std_logic;
signal	pwrsw	:std_logic;
signal	vid_rstn	:std_logic;

signal	dbus	:std_logic_vector(15 downto 0);
signal	abus	:std_logic_vector(23 downto 0);
signal	b_as	:std_logic;
signal	b_udsn	:std_logic;
signal	b_ldsn	:std_logic;
signal	b_uds	:std_logic;
signal	b_lds	:std_logic;
signal	b_rwn	:std_logic;
signal	b_ack	:std_logic;
signal	b_rd,b_rdn	:std_logic;
signal	b_wr,b_wrn	:std_logic_vector(1 downto 0);
-- for mpu
signal	mpu_addr	:std_logic_vector(23 downto 0);
signal	mpu_od		:std_logic_vector(15 downto 0);
signal	mpu_oe		:std_logic;
signal	mpu_ipl			:std_logic_vector(2 downto 0);
signal	mpu_dtack		:std_logic;
signal	mpu_as			:std_logic;
signal	mpu_udsn			:std_logic;
signal	mpu_ldsn			:std_logic;
signal	mpu_rwn			:std_logic;
signal   mpu_clke        :std_logic;
signal   mpu_fc    :std_logic_vector(2 downto 0);
signal   mpu_vpan  :std_logic;
signal   i_rwn     :std_logic;
signal   i_ASn     :std_logic;

-- for memorymap
signal	m_addr	:std_logic_vector(31 downto 0);
signal	m_odat	:std_logic_vector(15 downto 0);
signal	m_doe	:std_logic;
signal	m_ack	:std_logic;
signal	ram_addr:std_logic_vector(22 downto 0);
signal	ram_addrw:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	ram_rdat:std_logic_vector(15 downto 0);
signal	ram_wdat:std_logic_vector(15 downto 0);
signal	ram_rd	:std_logic;
signal	ram_wr	:std_logic_vector(1 downto 0);
signal	ram_rmw	:std_logic_vector(1 downto 0);
signal	ram_rmwmask	:std_logic_vector(15 downto 0);
signal	ram_ack	:std_logic;
constant trambase	:std_logic_vector(RAMAWIDTH-1 downto 0)	:="0"& x"e00000";
signal	ram_cpys:std_logic_vector(RAMAWIDTH-brsize-2 downto 0);
signal	ram_cpyd:std_logic_vector(RAMAWIDTH-brsize-2 downto 0);
signal	ram_cplane	:std_logic_vector(3 downto 0);
signal	ram_cpy		:std_logic;
signal	ram_cpya:std_logic;
signal	ram_inidone:std_logic;
signal	buserr	:std_logic;
signal	iackbe	:std_logic;
signal	mmap_min	:std_logic;
signal	iowait	:std_logic;

--Interrupt
signal	INT7	:std_logic;
signal	INT6	:std_logic;
signal	IACK6	:std_logic;
signal	IVECT6	:std_logic_vector(7 downto 0);
signal	INT5	:std_logic;
signal	IACK5	:std_logic;
signal	IVECT5	:std_logic_vector(7 downto 0);
signal	INT4	:std_logic;
signal	IACK4	:std_logic;
signal	IVECT4	:std_logic_vector(7 downto 0);
signal	INT3	:std_logic;
signal	IACK3	:std_logic;
signal	IVECT3	:std_logic_vector(7 downto 0);
signal	INT2	:std_logic;
signal	IACK2	:std_logic;
signal	IVECT2	:std_logic_vector(7 downto 0);
signal	INT1	:std_logic;
signal	IACK1	:std_logic;
signal	IVECT1	:std_logic_vector(7 downto 0);
signal	int_addr	:std_logic_vector(23 downto 0);

--for DMA
signal	dma_bconte	:std_logic;
signal	dma_addr	:std_logic_vector(23 downto 0);
signal	dma_as		:std_logic;
signal	dma_rwn		:std_logic;
signal	dma_udsn		:std_logic;
signal	dma_ldsn		:std_logic;
signal	dma_odat	:std_logic_vector(15 downto 0);
signal	dma_doe		:std_logic;
signal	dma_drd		:std_logic;
signal	dma_dwr		:std_logic;

-- for graphics line buffer
signal	LRAMSEL	:std_logic;
signal	LBUFADR	:std_logic_vector(9 downto 0);
signal	LBUFRD0	:std_logic_vector(15 downto 0);
signal	LBUFRD1	:std_logic_vector(15 downto 0);
signal	LBUFRD	:std_logic_vector(15 downto 0);
signal	LBUFWD	:std_logic_vector(15 downto 0);
signal	LBUFWR	:std_logic;
signal	LVIDADR	:std_logic_vector(9 downto 0);
signal	LVIDRD0	:std_logic_vector(15 downto 0);
signal	LVIDRD1	:std_logic_vector(15 downto 0);
signal	LVIDRD	:std_logic_vector(15 downto 0);
signal	LBUFWR0,LBUFWR1	:std_logic;

signal	HCOMP	:std_logic;
signal	VPSTART	:std_logic;
--Video
signal	VID_HRTC	:std_logic;
signal	VID_HRTCd	:std_logic;
signal	VID_HRTCi	:std_logic;
signal	VID_VRTC	:std_logic;
signal	VID_RINT	:std_logic;
signal	VID_VVIDEN	:std_logic;
--sprite
signal	spr_x		:std_logic_vector(9 downto 0);
signal	spr_y		:std_logic_vector(9 downto 0);
signal	spr_dot		:std_logic_vector(7 downto 0);
 --registaer
signal	spreg_rdat		:std_logic_vector(15 downto 0);
signal	spreg_doe		:std_logic;
signal	spreg_sprno		:std_logic_vector(6 downto 0);
signal	spreg_xpos		:std_logic_Vector(9 downto 0);
signal	spreg_ypos		:std_logic_vector(9 downto 0);
signal	spreg_VR		:std_logic;
signal	spreg_HR		:std_logic;
signal	spreg_COLOR		:std_logic_vector(3 downto 0);
signal	spreg_PATNO		:std_logic_vector(7 downto 0);
signal	spreg_PRI		:std_logic_vector(1 downto 0);
signal	spreg_BG0Xpos	:std_logic_vector(9 downto 0);
signal	spreg_BG0Ypos	:std_logic_vector(9 downto 0);
signal	spreg_BG1Xpos	:std_logic_vector(9 downto 0);
signal	spreg_BG1Ypos	:std_logic_vector(9 downto 0);
signal	spreg_DISPEN	:std_logic;
signal	spreg_BG1TXSEL	:std_logic_vector(1 downto 0);
signal	spreg_BG0TXSEL	:std_logic_vector(1 downto 0);
signal	spreg_BGON		:std_logic_vector(1 downto 0);
signal	spreg_VRES		:std_logic_vector(1 downto 0);
signal	spreg_HRES		:std_logic_vector(1 downto 0);
 --ram
signal	spram_rdat	:std_logic_vector(15 downto 0);
signal	spram_doe	:std_logic;
signal	sp_patno	:std_logic_vector(9 downto 0);
signal	sp_dotx		:std_logic_vector(2 downto 0);
signal	sp_doty		:std_logic_vector(2 downto 0);
signal	sp_dot		:std_logic_vector(3 downto 0);
	
signal	bg_addr		:std_logic_vector(12 downto 0);
signal	bg_VR		:std_logic;
signal	bg_HR		:std_logic;
signal	bg_COLOR	:std_logic_vector(3 downto 0);
signal	bg_PAT		:std_logic_vector(7 downto 0);

--Disk emu
signal	dem_rstn	:std_logic;
signal	dem_initdone	:std_logic;
signal	dem_fderamaddr	:std_logic_vector(22 downto 0);
signal	dem_fderamrdat	:std_logic_vector(15 downto 0);
signal	dem_fderamwdat	:std_logic_vector(15 downto 0);
signal	dem_fderamwr	:std_logic;
signal	dem_fecramaddrh	:std_logic_vector(14 downto 0);
signal	dem_fecramaddrl	:std_logic_vector(7 downto 0);
signal	dem_fecramwe	:std_logic;
signal	dem_fecramrdat	:std_logic_vector(15 downto 0);
signal	dem_fecramwdat	:std_logic_vector(15 downto 0);
signal	dem_fecramrd	:std_logic;
signal	dem_fecramwr	:std_logic;
signal	dem_fdetracklen	:std_logic_vector(13 downto 0);
signal	dem_fecrambusy	:std_logic;
-- for FDC
signal	FDC_cs		:std_logic;
signal	FDC_csn		:std_logic;
signal	FDC_WD		:std_logic_vector(7 downto 0);
signal	FDC_OE		:std_logic;
signal	FDC_DACK	:std_logic;
signal	FDC_DACKn	:std_logic;
signal	FDC_DRQ		:std_logic;
signal	FDC_TC		:std_logic;
signal	FDC_INTn	:std_logic;
signal	FDC_INT		:std_logic;
signal	FDC_WAIT	:std_logic;
signal	FD_hmssft	:std_logic;
signal	FD_int0		:integer range 0 to (BR_300_D*FCFREQ/1000000);
signal	FD_int1		:integer range 0 to (BR_300_D*FCFREQ/1000000);
signal	FDC_READYn	:std_logic;
signal	FDC_READYm	:std_logic;
signal	FDSREG		:std_logic_vector(15 downto 0);
signal	FD_DE		:std_logic_vector(1 downto 0);
signal	FDC_BUSY	:std_logic;
signal	FDCPY_BUSY	:std_logic;
signal	FDC_indisk	:std_logic_vector(1 downto 0);
signal	FDC_wrenn	:std_logic;
signal	FDC_wrbitn	:std_logic;
signal	FDC_rdbitn	:std_logic;
signal	FDC_stepn	:std_logic;
signal	FDC_sdirn	:std_logic;
signal	FDC_track0n	:std_logic;
signal	FDC_indexn	:std_logic;
signal	FDC_siden	:std_logic;
signal	FDC_wprotn	:std_logic;
signal	FDC_USELn	:std_logic_vector(3 downto 0);
signal	FDC_MOTORn	:std_logic_vector(3 downto 0);
signal	FDC_MFM		:std_logic;
signal	FDC_eject	:std_logic_vector(3 downto 0);
signal	FDD_eject	:std_logic_vector(1 downto 0);
signal	FDD_indisk	:std_logic_vector(1 downto 0);
signal	FDD_USELn	:std_logic_vector(1 downto 0);
signal	FD_USELn	:std_logic_vector(1 downto 0);
signal	FD_MOTORn	:std_logic_vector(1 downto 0);

--for SASI
signal	SASI_CS		:std_logic;
signal	SASI_RDAT	:std_logic_vector(7 downto 0);
signal	SASI_DOE	:std_logic;
signal	SASI_INT	:std_logic;
signal	SASI_IACK	:std_logic;
signal	SASI_DRQ	:std_logic;
signal	SASI_DACK	:std_logic;
signal	SASI_BUSY	:std_logic;
signal	iowait_sasi	:std_logic;

signal	SASI_H2C	:std_logic_vector(7 downto 0);
signal	SASI_C2H	:std_logic_vector(7 downto 0);
signal	SASI_SEL	:std_logic;
signal	SASI_BSY	:std_logic;
signal	SASI_REQ	:std_logic;
signal	SASI_ACK	:std_logic;
signal	SASI_IO		:std_logic;
signal	SASI_CD		:std_logic;
signal	SASI_MSG	:std_logic;
signal	SASI_RST	:std_logic;

signal	SASI_SELf	:std_logic;
signal	SASI_BSYf	:std_logic;
signal	SASI_REQf	:std_logic;
signal	SASI_ACKf	:std_logic;
signal	SASI_IOf	:std_logic;
signal	SASI_CDf	:std_logic;
signal	SASI_MSGf	:std_logic;
signal	SASI_RSTf	:std_logic;

-- IO unit
signal	IOU_rdat	:std_logic_vector(7 downto 0);
signal	IOU_doe		:std_logic;
signal	IOU_INT		:std_logic;
signal	IOU_IVECT	:std_logic_vector(7 downto 0);
signal	IOU_ivack	:std_logic_vector(7 downto 0);
signal	FD_HD,FD_HDn		:std_logic;
signal	FD_MOTOR	:std_logic;
signal	FD_USEL		:std_logic_vector(1 downto 0);
signal	FD_DIRn		:std_logic;
signal	FD_STEPn	:std_logic;
signal	FDD_MOTORn	:std_logic_vector(1 downto 0);

-- nvram(SRAM)
signal	nvwp		:std_logic_vector(7 downto 0);
signal	nv_rdat		:std_logic_vector(15 downto 0);
signal	nv_wr		:std_logic_vector(1 downto 0);
signal	nv_ce		:std_logic;
signal	nv_doe		:std_logic;
signal	nv_wren		:std_logic;
--signal	I2Csclin	:std_logic;
--signal	I2Csclout	:std_logic;
--signal	I2CSDAin	:std_logic;
--signal	I2CSDAout	:std_logic;

--video controller
signal	g00_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g00_rd		:std_logic;
signal	g00_rdat	:std_logic_vector(15 downto 0);
signal	g00_ack		:std_logic;
signal	g01_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g01_rd		:std_logic;
signal	g01_rdat	:std_logic_vector(15 downto 0);
signal	g01_ack		:std_logic;
signal	g02_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g02_rd		:std_logic;
signal	g02_rdat	:std_logic_vector(15 downto 0);
signal	g02_ack		:std_logic;
signal	g03_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g03_rd		:std_logic;
signal	g03_rdat	:std_logic_vector(15 downto 0);
signal	g03_ack		:std_logic;

signal	t0_addr		:std_logic_vector(RAMAWIDTH-4 downto 0);
signal	t0_rd		:std_logic;
signal	t0_rdat0	:std_logic_vector(15 downto 0);
signal	t0_rdat1	:std_logic_vector(15 downto 0);
signal	t0_rdat2	:std_logic_vector(15 downto 0);
signal	t0_rdat3	:std_logic_vector(15 downto 0);
signal	t0_ack		:std_logic;

signal	g10_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g10_rd		:std_logic;
signal	g10_rdat	:std_logic_vector(15 downto 0);
signal	g10_ack		:std_logic;
signal	g11_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g11_rd		:std_logic;
signal	g11_rdat	:std_logic_vector(15 downto 0);
signal	g11_ack		:std_logic;
signal	g12_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g12_rd		:std_logic;
signal	g12_rdat	:std_logic_vector(15 downto 0);
signal	g12_ack		:std_logic;
signal	g13_addr	:std_logic_vector(RAMAWIDTH-2 downto 0);
signal	g13_rd		:std_logic;
signal	g13_rdat	:std_logic_vector(15 downto 0);
signal	g13_ack		:std_logic;

signal	t1_addr		:std_logic_vector(RAMAWIDTH-4 downto 0);
signal	t1_rd		:std_logic;
signal	t1_rdat0	:std_logic_vector(15 downto 0);
signal	t1_rdat1	:std_logic_vector(15 downto 0);
signal	t1_rdat2	:std_logic_vector(15 downto 0);
signal	t1_rdat3	:std_logic_vector(15 downto 0);
signal	t1_ack		:std_logic;

signal	g0_caddr	:std_logic_vector(RAMAWIDTH-2 downto 7);
signal	g0_clear	:std_logic;
signal	g1_caddr	:std_logic_vector(RAMAWIDTH-2 downto 7);
signal	g1_clear	:std_logic;
signal	g2_caddr	:std_logic_vector(RAMAWIDTH-2 downto 7);
signal	g2_clear	:std_logic;
signal	g3_caddr	:std_logic_vector(RAMAWIDTH-2 downto 7);
signal	g3_clear	:std_logic;
signal	vlineno		:std_logic_vector(9 downto 0);

--video registers
signal	vr_hfreq	:std_logic;
signal	vr_htotal	:std_logic_vector(7 downto 0);
signal	vr_hsync	:std_logic_vector(7 downto 0);
signal	vr_hvbgn	:std_logic_vector(7 downto 0);
signal	vr_hvend	:std_logic_vector(7 downto 0);
signal	vr_vtotal	:std_logic_vector(9 downto 0);
signal	vr_vsync	:std_logic_vector(9 downto 0);
signal	vr_vvbgn	:std_logic_vector(9 downto 0);
signal	vr_vvend	:std_logic_vector(9 downto 0);
signal	vr_hadj		:std_logic_vector(7 downto 0);
signal	vr_rdat	:std_logic_vector(15 downto 0);
signal	vr_doe	:std_logic;
signal	txt_offsetx	:std_logic_vector(9 downto 0);
signal	txt_offsety	:std_logic_vector(9 downto 0);
signal	gr0_offsetx	:std_logic_vector(9 downto 0);
signal	gr0_offsety	:std_logic_vector(9 downto 0);
signal	gr1_offsetx	:std_logic_vector(8 downto 0);
signal	gr1_offsety	:std_logic_vector(8 downto 0);
signal	gr2_offsetx	:std_logic_vector(8 downto 0);
signal	gr2_offsety	:std_logic_vector(8 downto 0);
signal	gr3_offsetx	:std_logic_vector(8 downto 0);
signal	gr3_offsety	:std_logic_vector(8 downto 0);
signal	vr_rintline	:std_logic_vector(9 downto 0);
signal	vr_MEN		:std_logic;
signal	vr_SA		:std_logic;
signal	vr_AP		:std_logic_vector(3 downto 0);
signal	vr_txtmask	:std_logic_vector(15 downto 0);
signal	vr_rcpysrc	:std_logic_vector(7 downto 0);
signal	vr_rcpydst	:std_logic_vector(7 downto 0);
signal	vr_rcpyplane:std_logic_vector(3 downto 0);
signal	vr_rcpybgn	:std_logic;
signal	vr_rcpyend	:std_logic;
signal	vr_rcpybusy	:std_logic;
signal	vr_fcbgn	:std_logic;
signal	vr_fcend	:std_logic;
signal	vr_fcbusy	:std_logic;
signal	vr_size		:std_logic;
signal	vr_col		:std_logic_vector(1 downto 0);
signal	vr_VD		:std_logic_vector(1 downto 0);
signal	vr_HD		:std_logic_vector(1 downto 0);
signal	vr_GR_SIZE	:std_logic;
signal	vr_GR_CMODE	:std_logic_vector(1 downto 0);
signal	vr_PRI_SP	:std_logic_vector(1 downto 0);
signal	vr_PRI_TX	:std_logic_vector(1 downto 0);
signal	vr_PRI_GR	:std_logic_vector(1 downto 0);
signal	vr_GR_PRI	:std_logic_vector(7 downto 0);
signal	vr_GRPEN	:std_logic_vector(4 downto 0);
signal	vr_GREN		:std_logic;
signal	vr_TXTEN	:std_logic;
signal	vr_SPREN	:std_logic;
signal	vr_GT		:std_logic;
signal	vr_GG		:std_logic;
signal	vr_BP		:std_logic;
signal	vr_HP		:std_logic;
signal	vr_EXON		:std_logic;
signal	vr_VHT		:std_logic;
signal	vr_AH		:std_logic;
signal	vr_YS		:std_logic;
signal	iowait_rcpy	:std_logic;

--text & sprite palette
signal	tpal_cs		:std_logic;
signal	tpal_rdat	:std_logic_vector(15 downto 0);
signal	tpal_doe	:std_logic;
signal	tpal_pno	:std_logic_vector(7 downto 0);
signal	tpal_pdat	:std_logic_vector(15 downto 0);
signal	spal_pno	:std_logic_vector(7 downto 0);
signal	spal_pdat	:std_logic_vector(15 downto 0);
signal	tpal0_pdat	:std_logic_vector(15 downto 0);
signal	gpal0_pdat	:std_logic_vector(15 downto 0);
--graphics palette
signal	gpal_cs		:std_logic;
signal	gpal_rdat	:std_logic_vector(15 downto 0);
signal	gpal_doe	:std_logic;
signal	gpal_skel	:std_logic;
signal	gpal_pnoh	:std_logic_vector(7 downto 0);
signal	gpal_pnol	:std_logic_vector(7 downto 0);
signal	gpal_pdat	:std_logic_vector(15 downto 0);

signal	dclk	:std_logic;
signal	vidR	:std_logic_vector(3 downto 0);
signal	vidG	:std_logic_vector(3 downto 0);
signal	vidB	:std_logic_vector(3 downto 0);
signal	vidRF	:std_logic_vector(5 downto 0);
signal	vidGF	:std_logic_vector(5 downto 0);
signal	vidBF	:std_logic_vector(5 downto 0);
signal	vidRC	:std_logic_vector(7 downto 0);
signal	vidGC	:std_logic_vector(7 downto 0);
signal	vidBC	:std_logic_vector(7 downto 0);
signal	vidHS	:std_logic;
signal	vidVS	:std_logic;
signal	vidEN	:std_logic;

--for OPM
signal	opm_csn		:std_logic;
signal	opm_odat	:std_logic_vector(7 downto 0);
signal	opm_doe		:std_logic;
signal	opm_intn	:std_logic;
signal	opm_ct2		:std_logic;
signal	opm_sft		:std_logic;
signal	opm_sndl		:std_logic_vector(15 downto 0);
signal	opm_sndr		:std_logic_vector(15 downto 0);
signal	iowait_opm		:std_logic;
signal	opm_wstate	:integer range 0 to 3;

--for adpcm
signal	pcm_ce	:std_logic;
signal	pcm_odat	:std_logic_vector(7 downto 0);
signal	pcm_wr	:std_logic;
signal	pcm_doe	:std_logic;
signal	pcm_drq	:std_logic;
signal	pcm_sft	:std_logic;
signal	pcm_snd	:std_logic_vector(11 downto 0);
signal	pcm_sndL	:std_logic_vector(15 downto 0);
signal	pcm_sndR	:std_logic_vector(15 downto 0);
signal	pcm_enL,pcm_enR	:std_logic;
signal	pcm_clkmode	:std_logic;
signal	pcm_clkdiv	:std_logic_vector(1 downto 0);

--Sound DAC
signal	mix_sndL,mix_sndR	:std_logic_vector(15 downto 0);
signal	sndL,sndR	:std_logic_vector(15 downto 0);
signal	dacsft		:std_logic;

--for I2C I/F
signal	SDAIN,SDAOUT	:std_logic;
signal	SCLIN,SCLOUT	:std_logic;
signal	I2CCLKEN	:std_logic;
signal	I2C_TXDAT	:std_logic_vector(7 downto 0);		--tx data in
signal	I2C_RXDAT	:std_logic_vector(7 downto 0);	--rx data out
signal	I2C_WRn		:std_logic;						--write
signal	I2C_RDn		:std_logic;						--read
signal	I2C_TXEMP	:std_logic;							--tx buffer empty
signal	I2C_RXED	:std_logic;							--rx buffered
signal	I2C_NOACK	:std_logic;							--no ack
signal	I2C_COLL	:std_logic;							--collision detect
signal	I2C_NX_READ	:std_logic;							--next data is read
signal	I2C_RESTART	:std_logic;							--make re-start condition
signal	I2C_START	:std_logic;							--make start condition
signal	I2C_FINISH	:std_logic;							--next data is final(make stop condition)
signal	I2C_F_FINISH :std_logic;							--next data is final(make stop condition)
signal	I2C_INIT	:std_logic;

--RTC
signal	rtc_odat	:std_logic_Vector(3 downto 0);
signal	rtc_doe		:std_logic;
signal	rtc_cs		:std_logic;
signal	rtc_wr		:std_logic;
signal	rtc_alarm	:std_logic;

--PPI(i8255)
signal	ppi_odat	:std_logic_vector(7 downto 0);
signal	ppi_doe		:std_logic;
signal	ppi_csn		:std_logic;
signal	ppi_pai		:std_logic_vector(7 downto 0);
signal	ppi_pao		:std_logic_vector(7 downto 0);
signal	ppi_paoe	:std_logic;
signal	ppi_pbi		:std_logic_vector(7 downto 0);
signal	ppi_pbo		:std_logic_vector(7 downto 0);
signal	ppi_pboe	:std_logic;
signal	ppi_pchi	:std_logic_vector(3 downto 0);
signal	ppi_pcho	:std_logic_vector(3 downto 0);
signal	ppi_pchoe	:std_logic;
signal	ppi_pcli	:std_logic_vector(3 downto 0);
signal	ppi_pclo	:std_logic_vector(3 downto 0);
signal	ppi_pcloe	:std_logic;

--MFP
signal	mfp_odat	:std_logic_vector(7 downto 0);
signal	mfp_doe		:std_logic;
signal	mfp_gpip7	:std_logic;
signal	mfp_gpip6	:std_logic;
signal	mfp_gpip5	:std_logic;
signal	mfp_gpip4	:std_logic;
signal	mfp_gpip3	:std_logic;
signal	mfp_gpip2	:std_logic;
signal	mfp_gpip1	:std_logic;
signal	mfp_gpip0	:std_logic;
signal	mfp_tai		:std_logic;
signal	mfp_ivack	:std_logic_vector(7 downto 0);
 --KB
signal	kb_clkin	:std_logic;
signal	kb_clkout	:std_logic;
signal	kb_datin	:std_logic;
signal	kb_datout	:std_logic;

--SCC
signal	scc_odat	:std_logic_vector(7 downto 0);
signal	scc_doe		:std_logic;
--mouse
signal	ms_clkin	:std_logic;
signal	ms_clkout	:std_logic;
signal	ms_datin	:std_logic;
signal	ms_datout	:std_logic;

--MIDI I/F
signal	midi_odat	:std_logic_vector(7 downto 0);
signal	midi_doe		:std_logic;
signal	midi_cs		:std_logic;
signal	midi_rd		:std_logic;
signal	midi_wr		:std_logic;
signal	midi_int		:std_logic;
signal	midi_ivect	:std_logic_vector(7 downto 0);

--Contrast controller
constant	context	:integer	:=2;
signal	contval	:std_logic_vector(3+context downto 0);
signal	contvalm	:std_logic_vector(3+context downto 0);
signal	contc_rdat	:std_logic_vector(7 downto 0);
signal	contc_doe	:std_logic;

--for debug
signal	dwait		:std_logic;
signal	dsprbgen	:std_logic_vector(1 downto 0);

signal  ce          :std_logic := '1';
signal out_HMODE		:std_logic_vector(1 downto 0);
signal out_VMODE		:std_logic_vector(1 downto 0);
signal out_hfreq        :std_logic;
signal out_htotal		:std_logic_vector(7 downto 0);
signal out_hsynl		:std_logic_vector(7 downto 0);
signal out_hvbgn		:std_logic_vector(7 downto 0);
signal out_hvend		:std_logic_vector(7 downto 0);
signal out_vtotal		:std_logic_vector(9 downto 0);
signal out_vsynl		:std_logic_vector(9 downto 0);
signal out_vvbgn		:std_logic_vector(9 downto 0);
signal out_vvend		:std_logic_vector(9 downto 0);
signal out_rintl	    :std_logic_vector(9 downto 0);
signal vid_ce           :std_logic;
signal vr_DC            :std_logic;

component TG68
	port(
		clk           : in std_logic;
		reset         : in std_logic;
		clkena_in     : in std_logic:='1';
		data_in       : in std_logic_vector(15 downto 0);
		IPL           : in std_logic_vector(2 downto 0):="111";
		dtack         : in std_logic;
		addr          : out std_logic_vector(31 downto 0);
		data_out      : out std_logic_vector(15 downto 0);
		as            : out std_logic;
		uds           : out std_logic;
		lds           : out std_logic;
		rw            : out std_logic;
		drive_data    : out std_logic				--enable for data_out driver
	);
end component;

component cpu_wrapper
	port(
		clk          :in  std_logic;
		clk10m       :in  std_logic;
		phi1_ce      :in  std_logic;
		phi2_ce      :in  std_logic;
		cpu_select   :in  std_logic;
		reset_n      :in  std_logic;
		din          :in  std_logic_vector(15 downto 0);
		dTACK_n      :in  std_logic;
		dma_active_n :in  std_logic;
		IPL          :in  std_logic_vector(2 downto 0);
		dout         :out std_logic_vector(15 downto 0);
		FC           :out std_logic_vector(2 downto 0);
		rw_n         :out std_logic;
		address      :out std_logic_vector(23 downto 0);
		AS_n         :out std_logic;
		UDS_n        :out std_logic;
		LDS_n        :out std_logic;
		OE           :out std_logic
	);
end component;

component fx68k
	port(
		clk      : in  std_logic;
		HALTn    : in  std_logic;
		extReset : in  std_logic;
		pwrUp    : in  std_logic;
		enPhi1   : in  std_logic;
		enPhi2   : in  std_logic;
		DTACKn   : in  std_logic;
		VPAn     : in  std_logic;
		BERRn    : in  std_logic;
		BRn      : in  std_logic;
		BGACKn   : in  std_logic;
		IPL0n    : in  std_logic;
		IPL1n    : in  std_logic;
		IPL2n    : in  std_logic;
		iEdb     : in  std_logic_vector(15 downto 0);
		eRWn     : out std_logic;
		ASn      : out std_logic;
		LDSn     : out std_logic;
		UDSn     : out std_logic;
		E        : out std_logic;
		VMAn     : out std_logic;	
		FC0      : out std_logic;
		FC1      : out std_logic;
		FC2      : out std_logic;
		BGn      : out std_logic;
		oRESETn  : out std_logic;
		oHALTEDn : out std_logic;
		oEdb     : out std_logic_vector(15 downto 0);
		eab      : out std_logic_vector(23 downto 1)
	);
end component;


component  memcont
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
end component;

component INTcont
port(
	int7	:in std_logic	:='0';
	vect7	:in std_logic_vector(7 downto 0)	:=x"1f";
	iack7	:out std_logic;
	e_ln7	:in std_logic	:='1';
	ivack7	:out std_logic_vector(7 downto 0);

	int6	:in std_logic	:='0';
	vect6	:in std_logic_vector(7 downto 0)	:=x"1e";
	iack6	:out std_logic;
	e_ln6	:in std_logic	:='1';
	ivack6	:out std_logic_vector(7 downto 0);

	int5	:in std_logic	:='0';
	vect5	:in std_logic_vector(7 downto 0)	:=x"1d";
	iack5	:out std_logic;
	e_ln5	:in std_logic	:='1';
	ivack5	:out std_logic_vector(7 downto 0);

	int4	:in std_logic	:='0';
	vect4	:in std_logic_vector(7 downto 0)	:=x"1c";
	iack4	:out std_logic;
	e_ln4	:in std_logic	:='1';
	ivack4	:out std_logic_vector(7 downto 0);

	int3	:in std_logic	:='0';
	vect3	:in std_logic_vector(7 downto 0)	:=x"1b";
	iack3	:out std_logic;
	e_ln3	:in std_logic	:='1';
	ivack3	:out std_logic_vector(7 downto 0);

	int2	:in std_logic	:='0';
	vect2	:in std_logic_vector(7 downto 0)	:=x"1a";
	iack2	:out std_logic;
	e_ln2	:in std_logic	:='1';
	ivack2	:out std_logic_vector(7 downto 0);

	int1	:in std_logic	:='0';
	vect1	:in std_logic_vector(7 downto 0)	:=x"19";
	iack1	:out std_logic;
	e_ln1	:in std_logic	:='1';
	ivack1	:out std_logic_vector(7 downto 0);

	IPL		:out std_logic_vector(2 downto 0);
	addrin	:in std_logic_vector(23 downto 0);
	addrout	:out std_logic_vector(23 downto 0);
	rw		:in std_logic;
	dtack	:in std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component DMA63450
generic(
	BASEADDR	:std_logic_vector(23 downto 8)	:=x"e840"
);
port(
	addrin	:in std_logic_vector(23 downto 0);
	m_as	:in std_logic;
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	b_addr	:out std_logic_vector(23 downto 0);
	b_as	:out std_logic;
	b_rwn	:out std_logic;
	b_uds	:out std_logic;
	b_lds	:out std_logic;
	b_dout	:out std_logic_vector(15 downto 0);
	b_doe	:out std_logic;
	b_din	:in std_logic_vector(15 downto 0);
	b_ack	:in std_logic;
	b_conte	:out std_logic;

	drq0		:in std_logic;
	dack0		:out std_logic;
	pcli0		:in std_logic;
	pclo0		:out std_logic;
	doneo0		:out std_logic;

	drq1		:in std_logic;
	dack1		:out std_logic;
	pcli1		:in std_logic;
	pclo1		:out std_logic;
	doneo1		:out std_logic;

	drq2		:in std_logic;
	dack2		:out std_logic;
	pcli2		:in std_logic;
	pclo2		:out std_logic;
	doneo2		:out std_logic;

	drq3		:in std_logic;
	dack3		:out std_logic;
	pcli3		:in std_logic;
	pclo3		:out std_logic;
	doneo3		:out std_logic;

	d_rd		:out std_logic;
	d_wr		:out std_logic;

	donei		:in std_logic;

	dtc			:out std_logic;

	int			:out std_logic;
	ivect		:out std_logic_vector(7 downto 0);
	iack		:in std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);

end component;

component X68mmapCV
generic(
	t_base	:std_logic_vector(22 downto 0)	:="11100000000000000000000";
	g_base	:std_logic_vector(22 downto 0)	:="11101000000000000000000";
	rom_base:std_logic_vector(22 downto 0)	:="11110000000000000000000"
	);
port(
	m_addr	:in std_logic_vector(23 downto 0);
	m_rdat	:out std_logic_vector(15 downto 0);
	m_wdat	:in std_logic_vector(15 downto 0);
	m_doe	:out std_logic;
	m_uds	:in std_logic;
	m_lds	:in std_logic;
	m_as	:in std_logic;
	m_rw	:in std_logic;
	m_ack	:out std_logic;
	
	b_rd	:out std_logic;
	b_wr	:out std_logic_vector(1 downto 0);
	
	buserr	:out std_logic;
	iackbe	:in std_logic	:='0';
	
	MEN		:in std_logic;
	SA		:in std_logic;
	AP		:in std_logic_vector(3 downto 0);
	txtmask	:in std_logic_vector(15 downto 0)	:=(others=>'0');
	gmode	:in std_logic_vector(1 downto 0);
	vmode	:in std_logic_vector(1 downto 0);
	gsize	:in std_logic;
	rcpybusy:in std_logic  :='0';

	ram_addr	:out std_logic_vector(22 downto 0);
	ram_rdat	:in std_logic_vector(15 downto 0);
	ram_wdat	:out std_logic_vector(15 downto 0);
	ram_rd		:out std_logic;
	ram_wr		:out std_logic_vector(1 downto 0);
	ram_rmw		:out std_logic_vector(1 downto 0);
	ram_rmwmask	:out std_logic_vector(15 downto 0);
	ram_ack		:in std_logic;
	
	ldr_addr	:in std_logic_vector(19 downto 0);
	ldr_wdat	:in std_logic_vector(7 downto 0);
	ldr_aen		:in std_logic;
	ldr_wr		:in std_logic;
	ldr_ack		:out std_logic;
	
	iowait		:in std_logic	:='0';
	
	gpcen		:in std_logic;
	
	min			:in std_logic;
	mon			:out std_logic;
	sclk		:in std_logic;
	sys_ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component CRTCX68TXT
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
end component;

component mister_sync
port(
	LRAMSEL		:out std_logic;
	LRAMADR		:out std_logic_vector(9 downto 0);
	LRAMDAT		:in std_logic_vector(15 downto 0);

	RFOUT		:out std_logic_vector(5 downto 0);
	GFOUT		:out std_logic_vector(5 downto 0);
	BFOUT		:out std_logic_vector(5 downto 0);

	HSYNC		:out std_logic;
	VSYNC		:out std_logic;
	
	HMODE		:in std_logic_vector(1 downto 0);		-- "00":256 "01":512 "10":768 "11":768
	VMODE		:in std_logic_vector(1 downto 0);		-- 1:512 0:256

	HRL         :in std_logic;
	hfreq       :in std_logic;
	htotal		:in std_logic_vector(7 downto 0);
	hsynl		:in std_logic_vector(7 downto 0);
	hvbgn		:in std_logic_vector(7 downto 0);
	hvend		:in std_logic_vector(7 downto 0);
	vtotal		:in std_logic_vector(9 downto 0);
	vsynl		:in std_logic_vector(9 downto 0);
	vvbgn		:in std_logic_vector(9 downto 0);
	vvend		:in std_logic_vector(9 downto 0);
	hadj		:in std_logic_vector(7 downto 0);
	rintl		:in std_logic_vector(9 downto 0);
	
	out_HMODE		:out std_logic_vector(1 downto 0);		-- "00":256 "01":512 "10":768 "11":768
	out_VMODE		:out std_logic_vector(1 downto 0);		-- 1:512 0:256
	out_hfreq       :out std_logic;
	out_htotal		:out std_logic_vector(7 downto 0);
	out_hsynl		:out std_logic_vector(7 downto 0);
	out_hvbgn		:out std_logic_vector(7 downto 0);
	out_hvend		:out std_logic_vector(7 downto 0);
	out_vtotal		:out std_logic_vector(9 downto 0);
	out_vsynl		:out std_logic_vector(9 downto 0);
	out_vvbgn		:out std_logic_vector(9 downto 0);
	out_vvend		:out std_logic_vector(9 downto 0);
	out_rintl		:out std_logic_vector(9 downto 0);

	VRTC		:out std_logic;
	HRTC		:out std_logic;
	VIDEN		:out std_logic;
	
	HCOMP		:out std_logic;
	VCOMP		:out std_logic;
	VPSTART		:out std_logic;
	
	pix_ce		:out std_logic;
	v60hz       :in std_logic;
	f1          :out std_logic;

	gclk		:in std_logic;
	rstn		:in std_logic
);
end component;

component rastercopy
generic(
	arange	:integer	:=14;
	brsize	:integer	:=8
);
port(
	src		:in std_logic_vector(7 downto 0);
	dst		:in std_logic_vector(7 downto 0);
	plane	:in std_logic_vector(3 downto 0);
	start	:in std_logic;
	stop	:in std_logic;
	busy	:out std_logic;

	t_base	:in std_logic_vector(arange-1 downto 0);	
	srcaddr	:out std_logic_vector(arange-1 downto 0);
	dstaddr	:out std_logic_vector(arange-1 downto 0);
	cplane	:out std_logic_vector(3 downto 0);
	cpy		:out std_logic;
	ack		:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component VLINEBUF
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component  FDCs is
generic(
	maxtrack	:integer	:=85;
	maxbwidth	:integer	:=88;
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
end component;

component FDtiming
generic(
	sysclk	:integer	:=21477		--in kHz
);
port(
	drv0sel		:in std_logic;		--0:300rpm 1:360rpm
	drv1sel		:in std_logic;
	drv0sele	:in std_logic;		--1:speed selectable
	drv1sele	:in std_logic;

	drv0hd		:in std_logic;
	drv0hdi		:in std_logic;		--IBM 1.44MB format
	drv1hd		:in std_logic;
	drv1hdi		:in std_logic;		--IBM 1.44MB format

	drv0hds		:out std_logic;
	drv1hds		:out std_logic;

	drv0int		:out integer range 0 to (BR_300_D*sysclk/1000000);
	drv1int		:out integer range 0 to (BR_300_D*sysclk/1000000);

	hmssft		:out std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component dskchk2d
generic(
	sysclk	:integer	:=20000;	--system clock(kHz)	20000
	chkint	:integer	:=300;		--check interval(msec)
	signwait:integer	:=1;		--signal wait length(usec)
	datwait	:integer	:=10;		--data wait length(usec)
	motordly:integer	:=500		--motor rotate delay(msec)	
);
port(
	FDC_USELn	:in std_logic_vector(1 downto 0);
	FDC_BUSY	:in std_logic;
	FDC_MOTORn	:in std_logic_vector(1 downto 0);
	FDC_DIRn	:in std_logic;
	FDC_STEPn	:in std_logic;
	FDC_READYn	:out std_logic;
	FDC_WAIT	:out std_logic;

	FDD_USELn	:out std_logic_vector(1 downto 0);
	FDD_MOTORn	:out std_logic_vector(1 downto 0);
	FDD_DATAn	:in std_logic;
	FDD_INDEXn	:in std_logic;
	FDD_DSKCHGn	:in std_logic;
	FDD_DIRn	:out std_logic;
	FDD_STEPn	:out std_logic;

	driveen		:in std_logic_vector(1 downto 0)	:=(others=>'1');
	f_eject		:in std_logic_vector(1 downto 0)	:=(others=>'0');

	indisk		:out std_logic_vector(1 downto 0);

	hmssft		:in std_logic;

	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);	
end component;	

component sasiif
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(1 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	wdat	:in std_logic_vector(7 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	doe		:out std_logic;
	int		:out std_logic;
	iack	:in std_logic;
	drq		:out std_logic;
	dack	:in std_logic;
	iowait	:out std_logic;
	
	IDAT	:in std_logic_vector(7 downto 0);
	ODAT	:out std_logic_vector(7 downto 0);
	ODEN	:out std_logic;
	SEL		:out std_logic;
	BSY		:in std_logic;
	REQ		:in std_logic;
	ACK		:out std_logic;
	IO		:in std_logic;
	CD		:in std_logic;
	MSG		:in std_logic;
	RST		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component diskemu
generic(
	fclkfreq		:integer	:=10000;
	sclkfreq		:integer	:=10000;
	fdwait	:integer	:=10
);
port(

--SASI
	sasi_din	:in std_logic_vector(7 downto 0)	:=(others=>'0');
	sasi_dout:out std_logic_vector(7 downto 0);
	sasi_sel	:in std_logic						:='0';
	sasi_bsy	:out std_logic;
	sasi_req	:out std_logic;
	sasi_ack	:in std_logic						:='0';
	sasi_io	:out std_logic;
	sasi_cd	:out std_logic;
	sasi_msg	:out std_logic;
	sasi_rst	:in std_logic						:='0';

--FDD
	fdc_useln	:in std_logic_vector(1 downto 0)	:=(others=>'1');
	fdc_motorn	:in std_logic_vector(1 downto 0)	:=(others=>'1');
	fdc_readyn	:out std_logic;
	fdc_wrenn	:in std_logic						:='1';
	fdc_wrbitn	:in std_logic						:='1';
	fdc_rdbitn	:out std_logic;
	fdc_stepn	:in std_logic						:='1';
	fdc_sdirn	:in std_logic						:='1';
	fdc_track0n	:out std_logic;
	fdc_indexn	:out std_logic;
	fdc_siden	:in std_logic						:='1';
	fdc_wprotn	:out std_logic;
	fdc_eject	:in std_logic_vector(1 downto 0)	:=(others=>'0');
	fdc_indisk	:out std_logic_vector(1 downto 0)	:=(others=>'0');
	fdc_trackwid:in std_logic						:='1';	--1:2HD/2DD 0:2D
	fdc_dencity	:in std_logic						:='1';	--1:2HD 0:2DD/2D
	fdc_rpm		:in std_logic						:='0';	--1:360rpm 0:300rpm
	fdc_mfm		:in std_logic						:='1';

--FD emulator
	fde_tracklen:out std_logic_vector(13 downto 0);
	fde_ramaddr	:out std_logic_vector(22 downto 0);
	fde_ramrdat	:in std_logic_vector(15 downto 0);
	fde_ramwdat	:out std_logic_vector(15 downto 0);
	fde_ramwr	:out std_logic;
	fde_ramwait	:in std_logic;
	fec_ramaddrh :out std_logic_vector(14 downto 0);
	fec_ramaddrl :in std_logic_vector(7 downto 0);
	fec_ramwe	:in std_logic;
	fec_ramrdat	:out std_logic_vector(15 downto 0);
	fec_ramwdat	:in std_logic_vector(15 downto 0);
	fec_ramrd	:out std_logic;
	fec_ramwr	:out std_logic;
	fec_rambusy	:in std_logic;

	fec_fdsync	:in std_logic_Vector(1 downto 0);
--SRAM
	sram_cs		:in std_logic						:='0';
	sram_addr	:in std_logic_vector(12 downto 0)	:=(others=>'0');
	sram_rdat	:out std_logic_vector(15 downto 0);
	sram_wdat	:in std_logic_vector(15 downto 0)	:=(others=>'0');
	sram_rd		:in std_logic						:='0';
	sram_wr		:in std_logic_vector(1 downto 0)	:="00";
	sram_wp		:in std_logic						:='0';

	sram_ld		:in std_logic;
	sram_st		:in std_logic;

--MiSTer diskimage
	mist_mounted	:in std_logic_vector(3 downto 0);	--SRAM & HDD & FDD1 &FDD0
	mist_readonly	:in std_logic_vector(3 downto 0);
	mist_imgsize	:in std_logic_vector(63 downto 0);

	mist_lba		:out std_logic_vector(31 downto 0);
	mist_rd		:out std_logic_vector(3 downto 0);
	mist_wr		:out std_logic_vector(3 downto 0);
	mist_ack		:in std_logic_vector(3 downto 0);

	mist_buffaddr	:in std_logic_vector(8 downto 0);
	mist_buffdout	:in std_logic_vector(7 downto 0);
	mist_buffdin	:out std_logic_vector(7 downto 0);
	mist_buffwr		:in std_logic;

--common
	initdone	:out std_logic;
	busy		:out std_logic;
	fclk		:in std_logic;
	fd_ce       :in std_logic := '1';
	sclk		:in std_logic;
	sys_ce      :in std_logic := '1';
	rclk		:in std_logic;
	ram_ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component bwlatch
generic(
	awidth	:integer	:=24;
	dwidth	:integer	:=16
);
port(
	addr	:in std_logic_vector(awidth-1 downto 0);
	ce      :in std_logic := '1';
	wr		:in std_logic;
	din		:in std_logic_vector(dwidth-1 downto 0);
	
	myaddr	:in std_logic_vector(awidth-1 downto 0);
	pout	:out std_logic_vector(dwidth-1 downto 0);
	clk		:in std_logic;
	rstn	:in std_logic
);
end component;

component nvram
port(
	addr	:in std_logic_vector(12 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	doe		:out std_logic;
	wp		:in std_logic_vector(7 downto 0);
	
	SCLin	:in std_logic;
	SCLout	:out std_logic;
	SDAin	:in std_logic;
	SDAout	:out std_logic;
	
	I2Csft	:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component vidcont
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
	lsel        :in std_logic;

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
end component;

component spritec
port(
	hres	:in std_logic;
	bgen	:in std_logic_vector(1 downto 0);
	bg0asel	:in std_logic;
	bg1asel	:in std_logic;
	spren	:in std_logic;

	hcomp	:in std_logic;
	linenum	:in std_logic_vector(8 downto 0);
	bg0hoff	:in std_logic_vector(9 downto 0);
	bg0voff	:in std_logic_vector(9 downto 0);
	bg1hoff	:in std_logic_vector(9 downto 0);
	bg1voff	:in std_logic_vector(9 downto 0);

	sprno	:out std_logic_vector(6 downto 0);
	sprxpos	:in std_logic_vector(9 downto 0);
	sprypos	:in std_logic_vector(9 downto 0);
	sprVR	:in std_logic;
	sprHR	:in std_logic;
	sprCOLOR:in std_logic_vector(3 downto 0);
	sprPAT	:in std_logic_vector(7 downto 0);
	sprPRI	:in std_logic_vector(1 downto 0);

	bgaddr	:out std_logic_vector(12 downto 0);
	bgVR	:in std_logic;
	bgHR	:in std_logic;
	bgCOLOR	:in std_logic_vector(3 downto 0);
	bgPAT	:in std_logic_vector(7 downto 0);

	patno	:out std_logic_vector(9 downto 0);
	dotx	:out std_logic_vector(2 downto 0);
	doty	:out std_logic_vector(2 downto 0);
	dotin	:in std_logic_vector(3 downto 0);

	rdaddr	:in std_logic_vector(8 downto 0);
	dotout	:out std_logic_vector(7 downto 0);

	debugsel	:in std_logic_vector(1 downto 0)	:="11";

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component vcreg
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	doe		:out std_logic;
	
	htotal		:out std_logic_vector(7 downto 0);
	hsync		:out std_logic_vector(7 downto 0);
	hvbgn		:out std_logic_vector(7 downto 0);
	hvend		:out std_logic_vector(7 downto 0);
	vtotal		:out std_logic_vector(9 downto 0);
	vsync		:out std_logic_vector(9 downto 0);
	vvbgn		:out std_logic_vector(9 downto 0);
	vvend		:out std_logic_vector(9 downto 0);
	hadj		:out std_logic_vector(7 downto 0);
	intraster	:out std_logic_vector(9 downto 0);
	txtoffsetx	:out std_logic_vector(9 downto 0);
	txtoffsety	:out std_logic_vector(9 downto 0);
	g0offsetx	:out std_logic_vector(9 downto 0);
	g0offsety	:out std_logic_vector(9 downto 0);
	g1offsetx	:out std_logic_vector(8 downto 0);
	g1offsety	:out std_logic_vector(8 downto 0);
	g2offsetx	:out std_logic_vector(8 downto 0);
	g2offsety	:out std_logic_vector(8 downto 0);
	g3offsetx	:out std_logic_vector(8 downto 0);
	g3offsety	:out std_logic_vector(8 downto 0);
	siz			:out std_logic;
	col			:out std_logic_vector(1 downto 0);
	HF			:out std_logic;
	VD			:out std_logic_vector(1 downto 0);
	HD			:out std_logic_vector(1 downto 0);
	MEN			:out std_logic;
	SA			:out std_logic;
	AP			:out std_logic_vector(3 downto 0);
	CP			:out std_logic_vector(3 downto 0);
	DC          :out std_logic;
	csrc		:out std_logic_vector(7 downto 0);
	cdst		:out std_logic_vector(7 downto 0);
	tmask		:out std_logic_vector(15 downto 0);
	RCbgn		:out std_logic;
	RCend		:out std_logic;
	FCbgn		:out std_logic;
	FCend		:out std_logic;
	VIbgn		:out std_logic;
	VIend		:out std_logic;
	RCbusy		:in std_logic;
	FCbusy		:in std_logic;
	VIbusy		:in std_logic;
	GR_SIZE		:out std_logic;
	GR_CMODE	:out std_logic_vector(1 downto 0);
	PRI_SP		:out std_logic_vector(1 downto 0);
	PRI_TX		:out std_logic_vector(1 downto 0);
	PRI_GR		:out std_logic_vector(1 downto 0);
	GR_PRI		:out std_logic_vector(7 downto 0);
	GRPEN		:out std_logic_vector(4 downto 0);
	TXTEN		:out std_logic;
	SPREN		:out std_logic;
	GT			:out std_logic;
	GG			:out std_logic;
	BP			:out std_logic;
	HP			:out std_logic;
	EXON		:out std_logic;
	VHT			:out std_logic;
	AH			:out std_logic;
	YS			:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sprram
port(
	addr	:in std_logic_vector(23 downto 0);
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	wrdat	:in std_logic_Vector(15 downto 0);
	rddat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;

	patno	:in std_logic_vector(9 downto 0);
	dotx	:in std_logic_vector(2 downto 0);
	doty	:in std_logic_vector(2 downto 0);
	dot		:out std_logic_vector(3 downto 0);

	bg_addr	:in std_logic_vector(12 downto 0);
	bg_VR	:out std_logic;
	bg_HR	:out std_logic;
	bg_COLOR:out std_logic_vector(3 downto 0);
	bg_PAT	:out std_logic_vector(7 downto 0);

	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sprregs
port(
	addr	:in std_logic_vector(23 downto 0);
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	wrdat	:in std_logic_Vector(15 downto 0);
	rddat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;

	sprno	:in std_logic_vector(6 downto 0);
	xpos	:out std_logic_Vector(9 downto 0);
	ypos	:out std_logic_vector(9 downto 0);
	VR		:out std_logic;
	HR		:out std_logic;
	COLOR	:out std_logic_vector(3 downto 0);
	PATNO	:out std_logic_vector(7 downto 0);
	PRI		:out std_logic_vector(1 downto 0);
	
	BG0Xpos	:out std_logic_vector(9 downto 0);
	BG0Ypos	:out std_logic_vector(9 downto 0);
	BG1Xpos	:out std_logic_vector(9 downto 0);
	BG1Ypos	:out std_logic_vector(9 downto 0);
	DISPEN	:out std_logic;
	BG1TXSEL	:out std_logic_vector(1 downto 0);
	BG0TXSEL	:out std_logic_vector(1 downto 0);
	BGON	:out std_logic_vector(1 downto 0);
	HTOTAL	:out std_logic_vector(7 downto 0);
	HDISP	:out std_logic_vector(5 downto 0);
	VDISP	:out std_logic_vector(7 downto 0);
	LH		:out std_logic;
	VRES	:out std_logic_vector(1 downto 0);
	HRES	:out std_logic_vector(1 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component  MFP
generic(
	SCFREQ		:integer	:=20000		--kHz
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	datoe	:out std_logic;
	
	KBCLKIN	:in std_logic;
	KBCLKOUT:out std_logic;
	KBDATIN	:in std_logic;
	KBDATOUT:out std_logic;

	KBWAIT	:in std_logic;
	KBen	:out std_logic;
	KBLED	:out std_logic_vector(6 downto 0);

	kbsel	:in std_logic	:='0';
	kbout	:out std_logic_vector(7 downto 0);
	kbrx	:out std_logic;

	GPIPI7	:in std_logic;
	GPIPI6	:in std_logic;
	GPIPI5	:in std_logic;
	GPIPI4	:in std_logic;
	GPIPI3	:in std_logic;
	GPIPI2	:in std_logic;
	GPIPI1	:in std_logic;
	GPIPI0	:in std_logic;

	GPIPO7	:out std_logic;
	GPIPO6	:out std_logic;
	GPIPO5	:out std_logic;
	GPIPO4	:out std_logic;
	GPIPO3	:out std_logic;
	GPIPO2	:out std_logic;
	GPIPO1	:out std_logic;
	GPIPO0	:out std_logic;

	GPIPD7	:out std_logic;
	GPIPD6	:out std_logic;
	GPIPD5	:out std_logic;
	GPIPD4	:out std_logic;
	GPIPD3	:out std_logic;
	GPIPD2	:out std_logic;
	GPIPD1	:out std_logic;
	GPIPD0	:out std_logic;

	TAI		:in std_logic;
	TAO		:out std_logic;

	TBI		:in std_logic;
	TBO		:out std_logic;

	TCO		:out std_logic;

	TDO		:out std_logic;

	INT		:out std_logic;
	IVECT	:out std_logic_vector(7 downto 0);
	INTack	:in std_logic;
	IVack	:in std_logic_vector(7 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component scc
generic(
	CLKCYC	:integer	:=20000
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rd		:in std_logic;
	wr		:in std_logic;
	wdat	:in std_logic_vector(7 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	doe		:out std_logic;
	int		:out std_logic;
	ivect	:out std_logic_vector(7 downto 0);
	iack	:in std_logic;

	mclkin	:in std_logic;
	mclkout	:out std_logic;
	mdatin	:in std_logic;
	mdatout	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component IOcont
port(
	addr		:in std_logic_vector(23 downto 0);
	rdat		:out std_logic_vector(7 downto 0);
	wdat		:in std_logic_vector(7 downto 0);
	rd			:in std_logic;
	wr			:in std_logic;
	datoe		:out std_logic;
	int			:out std_logic;
	ivect		:out std_logic_vector(7 downto 0);
	iack		:in std_logic;
	iackvect	:in std_logic_vector(7 downto 0);
	
	fd_dcontsel	:out std_logic_vector(3 downto 0);
	fd_drvled	:out std_logic_vector(3 downto 0);
	fd_drveject	:out std_logic_vector(3 downto 0);
	fd_drvejen	:out std_logic_vector(3 downto 0);
	fd_diskin	:in std_logic_vector(3 downto 0);
	fd_diskerr	:in std_logic_vector(3 downto 0);
	
	fd_drvsel	:out std_logic_vector(3 downto 0);
	fd_usel		:out std_logic_vector(1 downto 0);
	fd_drvhd	:out std_logic;
	fd_drvmt	:out std_logic;
	
	fd_feject	:out std_logic_vector(3 downto 0);
	fd_LED		:out std_logic_vector(3 downto 0);
	fd_lock		:out std_logic_vector(3 downto 0);
	
	fdc_cs		:out std_logic;
	fdc_int		:in std_logic;

	hdd_int		:in std_logic;
	prn_int		:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component wrreg
generic(
	address	:std_logic_vector(23 downto 0)	:=x"000000"
);
port(
	addr	:in std_logic_vector(23 downto 0);
	wrdat	:in std_logic_vector(15 downto 0);
	wr		:in std_logic_vector(1 downto 0);
	
	do		:out std_logic_vector(15 downto 0);
	wrote	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component rp5c15
generic(
	clkfreq	:integer	:=21477270;
	YEAROFF	:std_logic_vector(7 downto 0)	:=x"00"
);
port(
	addr	:in std_logic_vector(3 downto 0);
	wdat	:in std_logic_vector(3 downto 0);
	rdat	:out std_logic_vector(3 downto 0);
	wr		:in std_logic;

	clkout	:out std_logic;
	alarm	:out std_logic;

	RTCIN	:in std_logic_vector(64 downto 0);

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component e8255
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
end component;

component OPM
generic(
	res		:integer	:=9
);
port(
	DIN		:in std_logic_vector(7 downto 0);
	DOUT	:out std_logic_vector(7 downto 0);
	DOE		:out std_logic;
	CSn		:in std_logic;
	ADR0	:in std_logic;
	RDn		:in std_logic;
	WRn		:in std_logic;
	INTn	:out std_logic;
	
	sndL	:out std_logic_vector(res-1 downto 0);
	sndR	:out std_logic_vector(res-1 downto 0);
	
	CT1		:out std_logic;
	CT2		:out std_logic;
--	monout	:out std_logic_vector(15 downto 0);

	chenable:in std_logic_vector(7 downto 0)	:=(others=>'1');

	fmclk	:in std_logic;
	pclk	:in std_logic;
	rstn	:in std_logic
);
end component;

component jt51
port(
	rst      :in  std_logic;
	clk      :in  std_logic;
	cen      :in  std_logic;
	cen_p1   :in  std_logic;
	cs_n     :in  std_logic;
	wr_n     :in  std_logic;
	a0       :in  std_logic;
	din      :in  std_logic_vector(7 downto 0);
	dout     :out std_logic_vector(7 downto 0);
	ct1      :out std_logic;
	ct2      :out std_logic;
	irq_n    :out std_logic;
	sample   :out std_logic;
	left     :out std_logic_vector(15 downto 0);
	right    :out std_logic_vector(15 downto 0);
	xleft    :out std_logic_vector(15 downto 0);
	xright   :out std_logic_vector(15 downto 0);
	dacleft  :out std_logic_vector(15 downto 0);
	dacright :out std_logic_vector(15 downto 0)
);
end component;

component e6258
port(
	addr	:in std_logic;
	datin	:in std_logic_vector(7 downto 0);
	datout	:out std_logic_vector(7 downto 0);
	datwr	:in std_logic;
	drq		:out std_logic;

	clkdiv	:in std_logic_vector(1 downto 0);
	sft		:in std_logic;

	sndout	:out std_logic_vector(11 downto 0);

	sysclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	sndclk		:in std_logic;
	snd_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component deltasigmadac
generic(
	width	:integer	:=8
);
port(
	data	:in	std_logic_vector(width-1 downto 0);
	datum	:out std_logic;
	
	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component addsat
generic(
	datwidth	:integer	:=16
);
port(
	INA		:in std_logic_vector(datwidth-1 downto 0);
	INB		:in std_logic_vector(datwidth-1 downto 0);
	
	OUTQ	:out std_logic_vector(datwidth-1 downto 0);
	OFLOW	:out std_logic;
	UFLOW	:out std_logic
);
end component;

component txtpal
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	
	palno	:in std_logic_vector(7 downto 0);
	palout	:out std_logic_vector(15 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component grpal
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	
	gmode	:in std_logic;
	skel	:in std_logic	:='0';
	palnoh	:in std_logic_vector(7 downto 0);
	palnol	:in std_logic_vector(7 downto 0);
	palout	:out std_logic_vector(15 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component pwrcont
port(
	addrin	:in std_logic_vector(23 downto 0);
	wr		:in std_logic;
	wrdat	:in std_logic_vector(7 downto 0);
	
	psw		:in std_logic;
	
	power	:out std_logic;
	pint	:out std_logic;
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	srstn	:in std_logic;
	pclk	:in std_logic;
	mpu_ce  :in std_logic := '1';
	prstn	:in std_logic
);
end component;

component contcont
generic(
	extwid	:integer	:=3
);
port(
	addrin	:in std_logic_vector(23 downto 0);
	wr		:in std_logic;
	rd		:in std_logic;
	wrdat	:in std_logic_vector(7 downto 0);
	rddat	:out std_logic_vector(7 downto 0);
	doe	:out std_logic;
	
	vviden	:in std_logic;
	contrast:out std_logic_vector(3+extwid downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	srstn	:in std_logic
);
end component;

component em3802
generic(
	sysclk	:integer	:=10000;
	oscm		:integer	:=1000;
	oscf		:integer	:=614
);
port(
	ADDR	:in std_logic_vector(2 downto 0);
	DATIN	:in std_logic_vector(7 downto 0);
	DATOUT:out std_logic_vector(7 downto 0);
	DATWR	:in std_logic;
	DATRD	:in std_logic;
	INT	:out std_logic;
	IVECT	:out std_logic_vector(7 downto 0);

	RxD	:in std_logic;
	TxD	:out std_logic;
	RxF	:in std_logic;
	TxF	:out std_logic;
	SYNC	:out std_logic;
	CLICK	:out std_logic;
	GPOUT	:out std_logic_vector(7 downto 0);
	GPIN	:in std_logic_vector(7 downto 0);
	GPOE	:out std_logic_vector(7 downto 0);
	
	clk	:in std_logic;
	ce  :in std_logic := '1';
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

component pcmclk
port(
	clkmode	:in std_logic;
	pcmsft	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component HEX2SEGn
port(
	HEX	:in std_logic_vector(3 downto 0);
	DOT	:in std_logic;
	SEG	:out std_logic_vector(7 downto 0)
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

component fontrom
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

component contrast
generic(
	datwidth		:integer	:=5;
	contwidth	:integer	:=4;
	outwidth		:integer	:=8
);
port(
	indat	:in std_logic_vector(datwidth-1 downto 0);
	contrast:in std_logic_vector(contwidth-1  downto 0);
	
	outdat	:out std_logic_vector(outwidth-1 downto 0)
);
end component;

component datlatch
generic(
	datwidth	:integer	:=8
);
port(
	datin		:in std_logic_vector(datwidth-1 downto 0);
	wr			:in std_logic;
	datout	:out std_logic_vector(datwidth-1 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

--component intlen
--generic(
--	len	:integer	:=10
--);
--port(
--	IPL	:in std_logic_vector(2 downto 0);
--	ack	:in std_logic;
--	
--	count	:out std_logic_vector(len-1 downto 0);
--	
--	clk	:in std_logic;
--	rstn	:in std_logic
--);
--end component;
--
--component hangmon
--generic(
--	num	:integer	:=3
--);
--port(
--	addr	:in std_logic_vector(23 downto 0);
--	data	:in std_logic_vector(15 downto 0);
--	rd		:in std_logic;
--	wr		:in std_logic_vector(1 downto 0);
--	ack	:in std_logic;
--	drq	:in std_logic_vector(3 downto 0);
--	irq	:in std_logic_vector(2 downto 0);
--	
--	evnum	:out std_logic_vector(7 downto 0);
--	eaddr	:out std_logic_vector(23 downto 0);
--	edata	:out std_logic_vector(15 downto 0);
--	erd	:out std_logic;
--	ewr	:out std_logic_vector(1 downto 0);
--	edrq	:out std_logic_vector(3 downto 0);
--	eirq	:out std_logic_vector(2 downto 0);
--	
--	hang	:out std_logic;
--	
--	sclk	:in std_logic;
--	mclk	:in std_logic;
--	rstn	:in std_logic
--);
--end component;

begin
	-- pllrst<=not pwr_rstn;
--	pMemClk<=not ramclk;

	--sr	:sftclk    generic map(100000000,1,1) port map("1",srst,sysclk,sys_ce,rstn);

	mem_rstn<=	plllock;

--	fdcclk<=pClk50M;
	dem_rstn<=plllock and pwr_rstn;
	srstn<=plllock and rstn and pwr_rstn and ldr_done and dem_initdone;
	vid_rstn<=plllock and pwr_rstn and ram_inidone;

	pwr	:pwrcont  port map(
		addrin	=>abus,
		wr		=>b_wr(0),
		wrdat	=>dbus(7 downto 0),
		
		psw		=>not pPsw(0),
		
		power	=>pwr_rstn,
		pint	=>pwrsw,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		srstn	=>srstn,
		pclk	=>sysclk,
		mpu_ce  =>mpu_cep,
		prstn	=>rstn
	);
	
	MPU : fx68k port map(
		clk      => sysclk,
		HALTn    => '1',
		extReset => not srstn,
		pwrUp    => not srstn,
		enPhi1   => not dma_bconte and mpu_cep,
		enPhi2   => not dma_bconte and mpu_cen,
		eRWn     => i_rwn,
		ASn      => i_ASn,
		LDSn     => mpu_ldsn,
		UDSn     => mpu_udsn,
		FC0      => mpu_fc(0),
		FC1      => mpu_fc(1),
		FC2      => mpu_fc(2),
		DTACKn   => mpu_dtack,
		VPAn     => not (mpu_fc(0) and mpu_fc(1) and mpu_fc(2)),
		BERRn    => '1',
		BRn      => '1',
		BGACKn   => '1',
		IPL0n    => mpu_ipl(0),
		IPL1n    => mpu_ipl(1),
		IPL2n    => mpu_ipl(2),
		iEdb     => dbus,
		oEdb     => mpu_od,
		eab      => mpu_addr(23 downto 1)
	);
	
	-- simulate odd byte access of TG68. Real CPU has no A0!
	mpu_addr(0) <= not mpu_ldsn and mpu_udsn;

	-- simulate write access of TG68 (Write, byte select, and address select activated at the same time)
	mpu_rwn <= i_ASn or i_rwn or (mpu_ldsn and mpu_udsn);
	mpu_as  <= i_ASn when i_rwn = '1' else mpu_rwn;
	mpu_oe  <= not i_rwn;

	-- CPU_W : cpu_wrapper
	-- port map(
	-- 	clk           =>mpuclk,
	-- 	clk10m        =>sysclk,
	-- 	buserr        =>buserr,
	-- 	phi1_ce       =>mpu_ce,
	-- 	phi2_ce       =>not mpu_ce,
	-- 	cpu_select    =>CPUS,
	-- 	reset_n       =>srstn,
	-- 	din           =>dbus,
	-- 	dTACK_n       =>mpu_dtack,
	-- 	dma_active_n  =>dma_bconte,
	-- 	IPL           =>mpu_ipl,
	-- 	dout          =>mpu_od,
	-- 	FC            =>open,
	-- 	rw_n          =>mpu_rwn,
	-- 	address       =>mpu_addr(23 downto 0),
	-- 	AS_n          =>mpu_as,
	-- 	UDS_n         =>mpu_udsn,
	-- 	LDS_n         =>mpu_ldsn,
	-- 	OE            =>mpu_oe
	-- );
	
	--MPU : TG68 port map(
	--	clk           =>sysclk,
	--	reset         =>srstn,
	--	clkena_in     =>(not dma_bconte) and sys_ce,
	--	data_in       =>dbus,
	--	IPL           =>mpu_ipl,
	--	dtack         =>mpu_dtack,
	--	addr(23 downto 0)  =>mpu_addr,
	--	addr(31 downto 24) =>open,
	--	data_out      =>mpu_od,
	--	as            =>mpu_as,
	--	uds           =>mpu_udsn,
	--	lds           =>mpu_ldsn,
	--	rw            =>mpu_rwn,
	--	drive_data    =>mpu_oe
	--);

--	intcount	:intlen generic map(12)port map(
--		IPL	=>mpu_ipl,
--		ack	=>mpu_dtack,
--		
--		count	=>open,
--		
--		clk	=>sysclk,
--		rstn	=>srstn
--	);

	INTC	:INTcont port map(
		int7	=>INT7,
		vect7	=>x"1f",
		iack7	=>open,
		e_ln7	=>'1',
				
		int6	=>INT6,
		vect6	=>IVECT6,
		iack6	=>IACK6,
		e_ln6	=>'0',
		ivack6	=>mfp_ivack,
		
		int5	=>INT5,
		vect5	=>IVECT5,
		iack5	=>IACK5,
		e_ln5	=>'0',
		
		int4	=>INT4,
		vect4	=>IVECT4,
		--iack4	=>IACK4,
		e_ln4	=>'1',
		
		int3	=>INT3,
		vect3	=>IVECT3,
		iack3	=>IACK3,
		e_ln3	=>'0',
		
		int2	=>INT2,
		vect2	=>IVECT2,
		--iack2	=>IACK2,
		e_ln2	=>'1',
		
		int1	=>INT1,
		vect1	=>IVECT1,
		iack1	=>IACK1,
		e_ln1	=>'1',
		ivack1	=>IOU_ivack,

		IPL		=>mpu_ipl,
		addrin	=>mpu_addr,
		addrout	=>int_addr,
		rw		=>mpu_rwn,
        dtack	=>mpu_dtack,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);
	
	DMA	:DMA63450 port map(
		addrin	=>abus,
		m_as	=>mpu_as,
		b_rd	=>b_rd,
		b_wr	=>b_wr,
		b_addr	=>dma_addr,
		b_as	=>dma_as,
		b_rwn	=>dma_rwn,
		b_uds	=>dma_udsn,
		b_lds	=>dma_ldsn,
		b_dout	=>dma_odat,
		b_doe	=>dma_doe,
		b_din	=>dbus,
		b_ack	=>b_ack,
		b_conte	=>dma_bconte,
		
		drq0	=>FDC_DRQ,
		dack0	=>FDC_DACK,
		pcli0	=>'0',
		pclo0	=>open,
		doneo0	=>FDC_TC,
		
		drq1	=>SASI_DRQ,
		dack1	=>SASI_DACK,
		pcli1	=>'1',
		pclo1	=>open,
		doneo1	=>open,

		drq2	=>'0',
		dack2	=>open,
		pcli2	=>'0',
		pclo2	=>open,
		doneo2	=>open,

		drq3	=>pcm_drq,
		dack3	=>open,
		pcli3	=>pcm_drq,
		pclo3	=>open,
		doneo3	=>open,
		
		--d_rd	=>dma_drd,
		--d_wr	=>dma_dwr,
		
		donei	=>'0',

		dtc		=>open,
		
		int		=>INT3,
		ivect	=>IVECT3,
		iack	=>IACK3,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);

--	INT3<='0';

	abus<=	dma_addr when dma_bconte='1' else int_addr;

	dbus<=	dma_odat			when dma_doe='1' else
			mpu_od				when mpu_oe='1' and dma_bconte='0' else
			m_odat				when m_doe='1' else
			nv_rdat				when nv_doe='1' else
			vr_rdat				when vr_doe='1' else
			mfp_odat & mfp_odat	when mfp_doe='1' else
			spreg_rdat			when spreg_doe='1' else
			spram_rdat			when spram_doe='1' else
			x"00" & scc_odat	when scc_doe='1' else
			x"00" & FDC_WD		when FDC_OE='1' else
			x"00" & SASI_RDAT	when SASI_DOE='1' else
			x"00" & IOU_rdat	when IOU_doe='1' else
			x"000" & rtc_odat	when rtc_doe='1' else
			x"00" & ppi_odat	when ppi_doe='1' else
			opm_odat & opm_odat when opm_doe='1' else
			x"00" & pcm_odat	when pcm_doe='1' else
			tpal_rdat			when tpal_doe='1' else
			gpal_rdat			when gpal_doe='1' else
			x"00" & contc_rdat when contc_doe='1' else
			x"00" & midi_odat	when midi_doe='1' else
			(others=>'0');

	b_ack<=	'0' when m_ack='1' else
			'1';
	
	b_as<=dma_as when dma_bconte='1' else mpu_as;
	b_udsn<=dma_udsn when dma_bconte='1' else mpu_udsn;
	b_ldsn<=dma_ldsn when dma_bconte='1' else mpu_ldsn;
	b_rwn<=dma_rwn when dma_bconte='1' else mpu_rwn;
	b_lds<=not b_ldsn;
	--b_uds<=not b_udsn;
	
	iowait<=iowait_rcpy or iowait_sasi or iowait_opm;
	-- process(sysclk, sys_ce)begin
	-- 	if(sysclk' event and sysclk='1' and sys_ce = '1') then
	-- 		dwait<=pDip(3);
	-- 	end if;
	-- end process;
			
	--mpu_dtack<='1' when (dwait='1' and DEBUG(DBIT_PAUSE_ONOFF)='1') else b_ack when dma_bconte='0' else '1';
	mpu_dtack<=b_ack when dma_bconte='0' else '1';
	mmap_min<='0';
	MMP	:X68mmapCV port map(
		m_addr	=>abus(23 downto 0),
		m_rdat	=>m_odat,
		m_wdat	=>dbus,
		m_doe	=>m_doe,
		m_uds	=>b_udsn,
		m_lds	=>b_ldsn,
		m_as	=>b_as,
		m_rw	=>b_rwn,
		m_ack	=>m_ack,
		
		b_rd	=>b_rd,
		b_wr	=>b_wr,
		
		--buserr	=>buserr,
		--iackbe	=>iackbe,
		
		MEN		=>vr_MEN,
		SA		=>vr_SA,
		AP		=>vr_AP,
		txtmask	=>vr_txtmask,
		gmode	=>vr_col,
		vmode	=>vr_GR_CMODE,
		gsize	=>vr_size,
		rcpybusy=>vr_rcpybusy,
		
		ram_addr	=>ram_addr,
		ram_rdat	=>ram_rdat,
		ram_wdat	=>ram_wdat,
		ram_rd		=>ram_rd,
		ram_wr		=>ram_wr,
		ram_rmw		=>ram_rmw,
		ram_rmwmask	=>ram_rmwmask,
		ram_ack		=>ram_ack,
		
		ldr_addr	=>ldr_addr,
		ldr_wdat	=>ldr_wdat,
		ldr_aen		=>ldr_aen,
		ldr_wr		=>ldr_wr,
		ldr_ack		=>ldr_ack,
	
		iowait		=>iowait,
		
		gpcen			=>'1',
		
		min			=>mmap_min,
		sclk		=>sysclk,
		sys_ce      =>sys_ce,
		rstn		=>srstn
);
	b_rdn<=not b_rd;
	b_wrn<=not b_wr;

	
	ram_addrw<="0" & ram_addr;
	
	RAM	:memcont generic map(
		AWIDTH		=>24,
		CAWIDTH		=>9,
		BRSIZE		=>brsize,
		BRBLOCKS		=>16,
		CLKMHZ		=>RCFREQ,
		REFINT		=>3,
		REFCNT		=>64
	) port map(
		PMEMCKE		=>pMemCke,
		PMEMCS_N	=>pMemCs_n,
		PMEMRAS_N	=>pMemRas_n,
		PMEMCAS_N	=>pMemCas_n,
		PMEMWE_N	=>pMemWe_n,
		PMemUdq     =>PMemUdq,
		PMemLdq     =>PMemLdq,
		PMEMBA1		=>pMemBa1,
		PMEMBA0		=>pMemBa0,
		PMEMADR		=>pMemAdr,
		PMEMDAT		=>pMemDat,

		b_addr		=>ram_addrw,
		b_wdat		=>ram_wdat,
		b_rdat		=>ram_rdat,
		b_rd		=>ram_rd,
		b_wr		=>ram_wr,
		b_rmw		=>ram_rmw,
		b_rmwmsk	=>ram_rmwmask,
		b_ack		=>ram_ack,
		
		b_csaddr	=>ram_cpys,
		b_cdaddr	=>ram_cpyd,
		b_cplane	=>ram_cplane,
		b_cpy		=>ram_cpy,
		b_cack		=>ram_cpya,
	
		g00_addr	=>g00_addr,
		g00_rd		=>g00_rd,
		g00_rdat	=>g00_rdat,
		--g00_ack		=>g00_ack,

		g01_addr	=>g01_addr,
		g01_rd		=>g01_rd,
		g01_rdat	=>g01_rdat,
		--g01_ack		=>g01_ack,

		g02_addr	=>g02_addr,
		g02_rd		=>g02_rd,
		g02_rdat	=>g02_rdat,
		--g02_ack		=>g02_ack,

		g03_addr	=>g03_addr,
		g03_rd		=>g03_rd,
		g03_rdat	=>g03_rdat,
		--g03_ack		=>g03_ack,

		g10_addr	=>g10_addr,
		g10_rd		=>g10_rd,
		g10_rdat	=>g10_rdat,
		--g10_ack		=>g10_ack,

		g11_addr	=>g11_addr,
		g11_rd		=>g11_rd,
		g11_rdat	=>g11_rdat,
		--g11_ack		=>g11_ack,

		g12_addr	=>g12_addr,
		g12_rd		=>g12_rd,
		g12_rdat	=>g12_rdat,
		--g12_ack		=>g12_ack,

		g13_addr	=>g13_addr,
		g13_rd		=>g13_rd,
		g13_rdat	=>g13_rdat,
		--g13_ack		=>g13_ack,

		t0_addr		=>t0_addr,
		t0_rd		=>t0_rd,
		t0_rdat0	=>t0_rdat0,
		t0_rdat1	=>t0_rdat1,
		t0_rdat2	=>t0_rdat2,
		t0_rdat3	=>t0_rdat3,
		--t0_ack		=>t0_ack,
		
		t1_addr		=>t1_addr,
		t1_rd		=>t1_rd,
		t1_rdat0	=>t1_rdat0,
		t1_rdat1	=>t1_rdat1,
		t1_rdat2	=>t1_rdat2,
		t1_rdat3	=>t1_rdat3,
		--t1_ack		=>t1_ack,
		
		g0_caddr	=>g0_caddr,
		g0_clear	=>g0_clear,
		
		g1_caddr	=>g1_caddr,
		g1_clear	=>g1_clear,

		g2_caddr	=>g2_caddr,
		g2_clear	=>g2_clear,

		g3_caddr	=>g3_caddr,
		g3_clear	=>g3_clear,

		fde_addr	=>'1' & dem_fderamaddr(22 downto 0),
		fde_rdat	=>dem_fderamrdat,
		fde_wdat	=>dem_fderamwdat,
		fde_wr		=>dem_fderamwr,
		fde_tlen	=>dem_fdetracklen,
		
		fec_addr	=>dem_fecramaddrl,
		fec_rdat	=>dem_fecramrdat,
		fec_wdat	=>dem_fecramwdat,
		fec_we	=>dem_fecramwe,
		fec_addrh	=>'1' & dem_fecramaddrh(14 downto 0),
		fec_rd		=>dem_fecramrd,
		fec_wr		=>dem_fecramwr,
		fec_busy	=>dem_fecrambusy,

		initdone	=>ram_inidone,
		sclk		=>sysclk,
		vclk		=>vidclk,
		fclk		=>fdcclk,
		rclk		=>ramclk,
		rstn		=>mem_rstn
	);
	
	nvwpl	:bwlatch generic map(24,8) port map(abus(23 downto 0),b_lds and sys_ce,b_wr(0),dbus(7 downto 0),x"e8e00d",nvwp,sysclk,srstn);
	nv_ce<='1' when abus(23 downto 14)="1110110100" else '0';

	-- CRTC	:CRTCX68TXT generic map(4) port map(
	-- 	LRAMSEL		=>LRAMSEL,
	-- 	LRAMADR		=>LVIDADR,
	-- 	LRAMDAT		=>LVIDRD,
		
	-- 	TRAM_ADR	=>open,
	-- 	TRAM_DAT	=>(others=>'0'),
		
	-- 	FRAM_ADR	=>open,
	-- 	FRAM_DAT	=>(others=>'0'),
		
	-- 	CURL		=>(others=>'0'),
	-- 	CURC		=>(others=>'0'),
	-- 	CURE		=>'0',

	-- 	TXTMODE		=>'0',
	
	-- 	ROUT		=>vidR,
	-- 	GOUT		=>vidG,
	-- 	BOUT		=>vidB,

	-- 	RFOUT		=>vidRF,
	-- 	GFOUT		=>vidGF,
	-- 	BFOUT		=>vidBF,
		
	-- 	HSYNC		=>vidHS,
	-- 	VSYNC		=>vidVS,
		
	-- 	HMODE		=>"11",
	-- 	VMODE		=>'1',

	-- 	VRTC		=>VID_VRTC,
	-- 	HRTC		=>VID_HRTC,
	-- 	VIDEN		=>vidEN,

	-- 	HCOMP		=>HCOMP,
	-- 	VCOMP		=>open,
	-- 	VPSTART		=>VPSTART,
		
	-- 	dclk		=>dclk,
		
	-- 	gclk		=>vidclk,
	-- 	rstn		=>vid_rstn
	-- );

	-- out_HMODE  <= vr_HD;
	-- out_VMODE  <= vr_VD;
	-- out_hfreq  <= vr_hfreq;
	-- out_htotal <= vr_htotal;
	-- out_hsynl  <= vr_hsync;
	-- out_hvbgn  <= vr_hvbgn;
	-- out_hvend  <= vr_hvend;
	-- out_vtotal <= vr_vtotal;
	-- out_vsynl  <= vr_vsync;
	-- out_vvbgn  <= vr_vvbgn;
	-- out_vvend  <= vr_vvend;
	-- out_rintl  <= vr_rintline;

	CRTC	:mister_sync 
	port map(
		LRAMSEL     =>LRAMSEL,
		LRAMADR     =>LVIDADR,
		LRAMDAT     =>LVIDRD,

		RFOUT       =>vidRF,
		GFOUT       =>vidGF,
		BFOUT       =>vidBF,
		
		HSYNC       =>vidHS,
		VSYNC       =>vidVS,
		
		HMODE       =>vr_HD,
		VMODE       =>vr_VD,
	
		hrl         =>vr_DC,
		hfreq       =>vr_hfreq,
		htotal      =>vr_htotal,
		hsynl       =>vr_hsync,
		hvbgn       =>vr_hvbgn,
		hvend       =>vr_hvend,
		vtotal      =>vr_vtotal,
		vsynl       =>vr_vsync,
		vvbgn       =>vr_vvbgn,
		vvend       =>vr_vvend,
		rintl       =>vr_rintline,
		hadj        =>vr_hadj,
		
		out_HMODE   =>out_HMODE,
		out_VMODE   =>out_VMODE,
		out_hfreq   =>out_hfreq,
		out_htotal  =>out_htotal,
		--out_hsynl   =>out_hsynl,
		out_hvbgn   =>out_hvbgn,
		out_hvend   =>out_hvend,
		out_vtotal  =>out_vtotal,
		--out_vsynl   =>out_vsynl,
		out_vvbgn   =>out_vvbgn,
		out_vvend   =>out_vvend,
		out_rintl   =>out_rintl,

		VRTC        =>VID_VRTC,
		HRTC        =>VID_HRTC,
		VIDEN       =>vidEN,

		HCOMP       =>HCOMP,
		VCOMP       =>open,
		VPSTART     =>VPSTART,
		
		pix_ce      =>dclk,
		v60hz       =>vid_hz,
		f1          =>pVideoF1,
		
		gclk        =>vidclk,
		rstn        =>vid_rstn
	);

	vid_ce <= '1';
	cont	:contcont generic map(context) port map(
		addrin	=>abus,
		wr		=>b_wr(0),
		rd		=>b_rd,
		wrdat	=>dbus(7 downto 0),
		rddat	=>contc_rdat,
		doe	=>contc_doe,
		
		vviden	=>VID_VVIDEN,
		contrast=>contval,

		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		srstn	=>vid_rstn
	);
	contvalm<=	contval;
	contR	:contrast  generic map(6,4+context,8) port map(vidRF,contvalm,vidRC);
	contG	:contrast  generic map(6,4+context,8) port map(vidGF,contvalm,vidGC);
	contB	:contrast  generic map(6,4+context,8) port map(vidBF,contvalm,vidBC);
	
	pVideoclk<=dclk;
	
	pVideoR<=vidRC;
	pVideoG<=vidGC;
	pVideoB<=vidBC;
	
	pVideoEN<=vidEN;
	pVideoHS<=vidHS;
	pVideoVS<=vidVS;
	

	pVideoHB<= VID_HRTC;
	pVideoVB<= VID_VRTC;


	LBUFWR0<=LBUFWR and LRAMSEL;
	LBUFWR1<=LBUFWR and (not LRAMSEL);
	VLBUF0	:VLINEBUF port map(
		address_a	=>LBUFADR,
		address_b	=>LVIDADR,
		clock		=>vidclk,
		data_a		=>LBUFWD,
		data_b		=>(others=>'0'),
		wren_a		=>LBUFWR0,
		wren_b		=>'0',
		--q_a			=>LBUFRD0,
		q_b			=>LVIDRD0
	);
	VLBUF1	:VLINEBUF port map(
		address_a	=>LBUFADR,
		address_b	=>LVIDADR,
		clock		=>vidclk,
		data_a		=>LBUFWD,
		data_b		=>(others=>'0'),
		wren_a		=>LBUFWR1,
		wren_b		=>'0',
		--q_a			=>LBUFRD1,
		q_b			=>LVIDRD1
	);
	--LBUFRD<=LBUFRD0 when LRAMSEL='0' else LBUFRD1;
	LVIDRD<=LVIDRD0 when LRAMSEL='1' else LVIDRD1;

	vreg	:vcreg port map(
		addr	=>abus(23 downto 0),
		rdat	=>vr_rdat,
		wdat	=>dbus,
		rd		=>b_rd,
		wr		=>b_wr,
		doe		=>vr_doe,
		
		htotal		=>vr_htotal,
		hsync		=>vr_hsync,
		hvbgn		=>vr_hvbgn,
		hvend		=>vr_hvend,
		vtotal		=>vr_vtotal,
		vsync		=>vr_vsync,
		vvbgn		=>vr_vvbgn,
		vvend		=>vr_vvend,
		hadj		=>vr_hadj,
		intraster	=>vr_rintline,
		txtoffsetx	=>txt_offsetx,
		txtoffsety	=>txt_offsety,
		g0offsetx	=>gr0_offsetx,
		g0offsety	=>gr0_offsety,
		g1offsetx	=>gr1_offsetx,
		g1offsety	=>gr1_offsety,
		g2offsetx	=>gr2_offsetx,
		g2offsety	=>gr2_offsety,
		g3offsetx	=>gr3_offsetx,
		g3offsety	=>gr3_offsety,
		siz			=>vr_size,
		col			=>vr_col,
		HF			=>vr_hfreq,
		VD			=>vr_VD,
		HD			=>vr_HD,
		MEN			=>vr_MEN,
		SA			=>vr_SA,
		AP			=>vr_AP,
		CP			=>vr_rcpyplane,
		DC          =>vr_DC,
		csrc		=>vr_rcpysrc,
		cdst		=>vr_rcpydst,
		RCbgn		=>vr_rcpybgn,
		RCend		=>vr_rcpyend,
		FCbgn		=>vr_fcbgn,
		FCend		=>vr_fcend,
		VIbgn		=>open,
		VIend		=>open,
		tmask		=>vr_txtmask,
		RCbusy		=>vr_rcpybusy,
		FCbusy		=>vr_fcbusy,
		VIbusy		=>'0',
		GR_SIZE		=>vr_GR_SIZE,
		GR_CMODE	=>vr_GR_CMODE,
		PRI_SP		=>vr_PRI_SP,
		PRI_TX		=>vr_PRI_TX,
		PRI_GR		=>vr_PRI_GR,
		GR_PRI		=>vr_GR_PRI,
		GRPEN		=>vr_GRPEN,
		TXTEN		=>vr_TXTEN,
		SPREN		=>VR_SPREN,
		GT			=>vr_GT,
		GG			=>vr_GG,
		BP			=>vr_BP,
		HP			=>vr_HP,
		EXON		=>vr_EXON,
		VHT			=>vr_VHT,
		AH			=>vr_AH,
		YS			=>vr_YS,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);

	vr_GREN<=	vr_GRPEN(4) when vr_GR_SIZE='1' else
					'0' when vr_GRPEN(3 downto 0)="0000" else
					'1';
	vc	:vidcont generic map(RAMAWIDTH-1) port map(
		t_base	=>"011100000000000000000000",
		g_base	=>"011101000000000000000000",
		g00_addr	=>g00_addr,
		g00_rd		=>g00_rd,
		g00_rdat	=>g00_rdat,
		g01_addr	=>g01_addr,
		g01_rd		=>g01_rd,
		g01_rdat	=>g01_rdat,
		g02_addr	=>g02_addr,
		g02_rd		=>g02_rd,
		g02_rdat	=>g02_rdat,
		g03_addr	=>g03_addr,
		g03_rd		=>g03_rd,
		g03_rdat	=>g03_rdat,

		t0_addr		=>t0_addr,
		t0_rd		=>t0_rd,
		t0_rdat0	=>t0_rdat0,
		t0_rdat1	=>t0_rdat1,
		t0_rdat2	=>t0_rdat2,
		t0_rdat3	=>t0_rdat3,

		g10_addr	=>g10_addr,
		g10_rd		=>g10_rd,
		g10_rdat	=>g10_rdat,
		g11_addr	=>g11_addr,
		g11_rd		=>g11_rd,
		g11_rdat	=>g11_rdat,
		g12_addr	=>g12_addr,
		g12_rd		=>g12_rd,
		g12_rdat	=>g12_rdat,
		g13_addr	=>g13_addr,
		g13_rd		=>g13_rd,
		g13_rdat	=>g13_rdat,

		t1_addr		=>t1_addr,
		t1_rd		=>t1_rd,
		t1_rdat0	=>t1_rdat0,
		t1_rdat1	=>t1_rdat1,
		t1_rdat2	=>t1_rdat2,
		t1_rdat3	=>t1_rdat3,

		t_hoffset	=>txt_offsetx,
		t_voffset	=>txt_offsety,

		g0_caddr	=>g0_caddr,
		g0_clear	=>g0_clear,
		
		g1_caddr	=>g1_caddr,
		g1_clear	=>g1_clear,

		g2_caddr	=>g2_caddr,
		g2_clear	=>g2_clear,

		g3_caddr	=>g3_caddr,
		g3_clear	=>g3_clear,

		g0_hoffset	=>gr0_offsetx,
		g0_voffset	=>gr0_offsety,
		g1_hoffset	=>gr1_offsetx,
		g1_voffset	=>gr1_offsety,
		g2_hoffset	=>gr2_offsetx,
		g2_voffset	=>gr2_offsety,
		g3_hoffset	=>gr3_offsetx,
		g3_voffset	=>gr3_offsety,

		gmode		=>vr_GR_CMODE,		--00:4bit color 01:8bit color 11/10:16bit color
		memres		=>vr_GR_SIZE,		--0:512x512 1:1024x1024
		hres	=>out_HMODE,
		vres	=>out_VMODE(0),
		txten	=>vr_TXTEN,
		grpen	=>vr_GREN,
		spren	=>vr_SPREN,
--		txten	=>'1',
--		grpen	=>'1',
--		spren	=>'1',
		graphen	=>vr_GRPEN,
		pri_sp	=>vr_PRI_SP,
		pri_tx	=>vr_PRI_TX,
		pri_gr	=>vr_PRI_GR,
		grpri	=>vr_GR_PRI,
		exon		=>vr_exon,
		hp			=>vr_HP,
		bp			=>vr_BP,
		gg			=>vr_GG,
		gt			=>vr_GT,
		ah			=>vr_AH,
		ys          =>vr_YS,
		vht         =>vr_VHT,
		lsel        =>LRAMSEL,

		lbaddr	=>LBUFADR,
		lbwdat	=>LBUFWD,
		lbwr	=>LBUFWR,
		
		hcomp	=>HCOMP,
		vpstart	=>VPSTART,
		hfreq	=>out_hfreq,
		htotal	=>out_htotal,
		hvbgn	=>out_hvbgn,
		hvend	=>out_hvend,
		vtotal	=>out_vtotal,
		vvbgn	=>out_vvbgn,
		vvend	=>out_vvend,
		
		addrx	=>spr_x,
		addry	=>spr_y,
		sprite_in=>spr_dot,
		
		tpalno	=>tpal_pno,
		tpalin	=>tpal_pdat,
		tpal0in	=>tpal0_pdat,
		gpal0in =>gpal0_pdat,
		spalno	=>spal_pno,
		spalin	=>spal_pdat,

		gpal0no	=>gpal_pnol,
		gpal1no	=>gpal_pnoh,
		gpalin	=>gpal_pdat,
	
		vvideoen	=>VID_VVIDEN,
		rintline=>out_rintl,
		rint	=>VID_RINT,
		
--		vlineno	=>vlineno,
	
		gclrbgn	=>vr_fcbgn,
		gclrend	=>vr_fcend,
		gclrpage=>vr_rcpyplane,
		gclrbusy=>vr_fcbusy,
		
		hblank  =>VID_HRTC,
		vblank  =>VID_VRTC,
		
		vidclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>vid_rstn
	);
	
	rcpy	:rastercopy generic map(
		arange	=>RAMAWIDTH-brsize-1,
		brsize	=>BRSIZE
	) port map(
		src		=>vr_rcpysrc,
		dst		=>vr_rcpydst,
		plane	=>vr_rcpyplane,
		start	=>vr_rcpybgn,
		stop	=>vr_rcpyend,
--		stop	=>'0',
		busy	=>vr_rcpybusy,
		
		t_base	=>trambase(RAMAWIDTH-1 downto brsize+1),	
		srcaddr	=>ram_cpys,
		dstaddr	=>ram_cpyd,
		cplane	=>ram_cplane,
		cpy		=>ram_cpy,
		ack		=>ram_cpya,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn		=>srstn
	);
	
	iowait_rcpy	<=vr_rcpybgn and vr_rcpybusy;
	dsprbgen<=	"11";
	sprite	:spritec port map(
		hres	=>spreg_HRES(0),
		bgen	=>spreg_BGON,
		bg0asel	=>spreg_BG0TXSEL(0),
		bg1asel	=>spreg_BG1TXSEL(0),
		spren	=>spreg_DISPEN,

		
		hcomp	=>HCOMP,
		linenum	=>spr_y(8 downto 0),
		bg0hoff	=>spreg_BG0Xpos,
		bg0voff	=>spreg_BG0Ypos,
		bg1hoff	=>spreg_BG1Xpos,
		bg1voff	=>spreg_BG1Ypos,
		
		sprno	=>spreg_sprno,
		sprxpos	=>spreg_xpos,
		sprypos	=>spreg_ypos,
		sprVR	=>spreg_VR,
		sprHR	=>spreg_HR,
		sprCOLOR=>spreg_COLOR,
		sprPAT	=>spreg_PATNO,
		sprPRI	=>spreg_PRI,
		
		bgaddr	=>bg_addr,
		bgVR	=>bg_VR,
		bgHR	=>bg_HR,
		bgCOLOR	=>bg_COLOR,
		bgPAT	=>bg_PAT,
		
		patno	=>sp_patno,
		dotx	=>sp_dotx,
		doty	=>sp_doty,
		dotin	=>sp_dot,
		
		rdaddr	=>spr_x(8 downto 0),
		dotout	=>spr_dot,
	
		debugsel	=>dsprbgen,
		
		clk		=>vidclk,
		ce      =>vid_ce,
		rstn	=>srstn
	);

	spreg	:sprregs port map(
		addr	=>abus(23 downto 0),
		b_rd	=>b_rd,
		b_wr	=>b_wr,
		wrdat	=>dbus,
		rddat	=>spreg_rdat,
		datoe	=>spreg_doe,

		sprno	=>spreg_sprno,
		xpos	=>spreg_xpos,
		ypos	=>spreg_ypos,
		VR		=>spreg_VR,
		HR		=>spreg_HR,
		COLOR	=>spreg_COLOR,
		PATNO	=>spreg_PATNO,
		PRI		=>spreg_PRI,
		
		BG0Xpos	=>spreg_BG0Xpos,
		BG0Ypos	=>spreg_BG0Ypos,
		BG1Xpos	=>spreg_BG1Xpos,
		BG1Ypos	=>spreg_BG1Ypos,
		DISPEN	=>spreg_DISPEN,
		BG1TXSEL=>spreg_BG1TXSEL,
		BG0TXSEL=>spreg_BG0TXSEL,
		BGON	=>spreg_BGON,
		HTOTAL	=>open,
		HDISP	=>open,
		VDISP	=>open,
		LH		=>open,
		--VRES	=>spreg_VRES,
		HRES	=>spreg_HRES,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		vclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>srstn
	);
	
	spmem	:sprram port map(
		addr	=>abus(23 downto 0),
		b_rd	=>b_rd,
		b_wr	=>b_wr,
		wrdat	=>dbus,
		rddat	=>spram_rdat,
		datoe	=>spram_doe,
		
		patno	=>sp_patno,
		dotx	=>sp_dotx,
		doty	=>sp_doty,
		dot		=>sp_dot,
		
		bg_addr	=>bg_addr,
		bg_VR	=>bg_VR,
		bg_HR	=>bg_HR,
		bg_COLOR=>bg_COLOR,
		bg_PAT	=>bg_PAT,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		vclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>srstn
	);

	tpal_cs<='1' when abus(23 downto  9)="111010000010001" else '0';
	
	tpal	:txtpal port map(
		cs		=>tpal_cs,
		addr	=>abus(8 downto 1),
		wdat	=>dbus,
		rdat	=>tpal_rdat,
		datoe	=>tpal_doe,
		rd		=>b_rd,
		wr		=>b_wr,
		
		palno	=>tpal_pno,
		palout	=>tpal_pdat,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		vclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>srstn
	);
	
	process(sysclk,rstn,sys_ce)begin
		if(rstn='0')then
			tpal0_pdat<=(others=>'0');
			gpal0_pdat<=(others=>'0');
		elsif(sysclk' event and sysclk='1' and sys_ce = '1')then
			if(tpal_cs='1' and abus(8 downto 1)="00000000")then
				if(b_wr(1)='1')then
					tpal0_pdat(15 downto 8)<=dbus(15 downto 8);
				end if;
				if(b_wr(0)='1')then
					tpal0_pdat( 7 downto 0)<=dbus( 7 downto 0);
				end if;
			end if;
			if(gpal_cs='1' and abus(8 downto 1)="00000000")then
				if(b_wr(1)='1')then
					gpal0_pdat(15 downto 8)<=dbus(15 downto 8);
				end if;
				if(b_wr(0)='1')then
					gpal0_pdat( 7 downto 0)<=dbus( 7 downto 0);
				end if;
			end if;
		end if;
	end process;

	spal	:txtpal port map(
		cs		=>tpal_cs,
		addr	=>abus(8 downto 1),
		wdat	=>dbus,
		rdat	=>open,
		datoe	=>open,
		rd		=>'0',
		wr		=>b_wr,
		
		palno	=>spal_pno,
		palout	=>spal_pdat,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		vclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>srstn
	);
	
	gpal_cs<='1' when abus(23 downto  9)="111010000010000" else '0';
	
	gpal_skel<='1' when vr_EXON='1' and vr_HP='1' and vr_GG='1' else '0';
	
	gpal	:grpal port map(
		cs		=>gpal_cs,
		addr	=>abus(8 downto 1),
		wdat	=>dbus,
		rdat	=>gpal_rdat,
		datoe	=>gpal_doe,
		rd		=>b_rd,
		wr		=>b_wr,
		
		gmode	=>vr_GR_CMODE(1),
		skel	=>gpal_skel,
		palnoh	=>gpal_pnoh,
		palnol	=>gpal_pnol,
		palout	=>gpal_pdat,
		
		sclk	=>sysclk,
		sys_ce  =>sys_ce,
		vclk	=>vidclk,
		vid_ce  =>vid_ce,
		rstn	=>srstn
	);

	FD_HDn<=not FD_HD;
	FDT	:FDtiming generic map(FCFREQ) port map(
		drv0sel		=>'0',	--0:300rpm 1:360rpm
		drv1sel		=>'0',
		drv0sele	=>'0',
		drv1sele	=>'0',
	
		drv0hd		=>FD_HDn,
		drv0hdi		=>'1',		--IBM 1.44MB format
		drv1hd		=>FD_HDn,
		drv1hdi		=>'1',		--IBM 1.44MB format
		
		drv0hds		=>open,
		drv1hds		=>open,
		
		drv0int		=>FD_int0,
		drv1int		=>FD_int1,
		
		hmssft		=>FD_hmssft,
		
		clk			=>fdcclk,
		ce          =>fd_ce,
		rstn		=>rstn
	);
	
	FDC_DACKn<=not FDC_DACK;
	FDC_CSn<=not FDC_CS;
	fd	:fdcs generic map(
		maxtrack	=>85,
		maxbwidth	=>(BR_300_D*FCFREQ/1000000),
		sysclk		=>FCFREQ/1000
	)
	port map(
		RDn		=>b_rdn,
		WRn		=>b_wrn(0),
		CSn		=>FDC_CSn,
		A0		=>abus(1),
		WDAT	=>dbus(7 downto 0),
		RDAT	=>FDC_WD,
		DATOE	=>FDC_OE,
		DACKn	=>FDC_DACKn,
		DRQ		=>FDC_DRQ,
		TC		=>FDC_TC,
		INTn	=>FDC_INTn,
		--WAITIN	=>FDC_WAIT,

		WREN	=>FDC_wrenn,
		WRBIT	=>FDC_wrbitn,
		RDBIT	=>FDC_rdbitn,
		STEP	=>FDC_stepn,
		SDIR	=>FDC_sdirn,
		WPRT	=>FDC_wprotn,
		track0	=>FDC_track0n,
		index	=>FDC_indexn,
		side	=>FDC_siden,
		usel	=>open,
		READY	=>FDC_READYm,
		
		int0	=>FD_int0,
		int1	=>FD_int1,
		int2	=>FD_int0,
		int3	=>FD_int1,
	
		td0		=>'1',
		td1		=>'1',
		td2		=>'1',
		td3		=>'1',
		
		hmssft	=>FD_hmssft,
		
		--busy	=>FDC_BUSY,
		mfm		=>FDC_MFM,
		
		ismode	=>'0',
		
		sclk		=>sysclk,
		sys_ce      =>sys_ce,
		fclk		=>fdcclk,
		fd_ce       =>fd_ce,
		rstn	=>srstn
	);

	FDC_INT<=not FDC_INTn;
	
	FDC_USELn<=	--"1111" when FD_MOTOR='0' else
				"1110" when FD_USEL="00" else
				"1101" when FD_USEL="01" else
				"1011" when FD_USEL="10" else
				"0111" when FD_USEL="11" else
				"1111";
	FDC_MOTORn<=not FD_MOTOR & not FD_MOTOR & not FD_MOTOR & not FD_MOTOR;
	
	FDC_READYm<=FDC_READYn and (not opm_ct2);

	IOU	:IOcont port map(
		addr		=>abus(23 downto 0),
		rdat		=>IOU_rdat,
		wdat		=>dbus(7 downto 0),
		rd			=>b_rd,
		wr			=>b_wr(0),
		datoe		=>IOU_doe,
		int			=>INT1,
		ivect		=>IVECT1,
		iack		=>IACK1,
		iackvect	=>IOU_ivack,
		
		fd_dcontsel	=>open,
		fd_drvled	=>open,
		fd_drveject	=>open,
		fd_drvejen	=>open,
		fd_diskin	=>"00" & FDC_indisk,
		fd_diskerr	=>(others=>'0'),
		
		fd_drvsel	=>open,
		fd_usel		=>FD_USEL,
		fd_drvhd	=>FD_HD,
		fd_drvmt	=>FD_MOTOR,
		
		fd_feject	=>FDC_eject,
		fd_LED		=>open,
		fd_lock		=>open,

		fdc_cs		=>FDC_cs,
		fdc_int		=>FDC_INT,

		hdd_int		=>SASI_INT,
		prn_int		=>'0',
		
		clk			=>sysclk,
		ce          =>sys_ce,
		rstn		=>srstn
	);
	SASI_IACK<='0';
	
	ppi_csn<='0' when abus(23 downto 3)=(x"e9a00" & '0') else '1';
	ppi_pchi <= (others=>'0');
	ppi_pcli <= (others=>'0');

	PPI	: e8255 port map(
		CSn		=>ppi_csn,
		RDn		=>b_rdn,
		WRn		=>b_wrn(0),
		ADR		=>abus(2 downto 1),
		DATIN	=>dbus(7 downto 0),
		DATOUT	=>ppi_odat,
		DATOE	=>ppi_doe,
		
		PAi		=>ppi_pai,
		--PAo		=>ppi_pao,
		--PAoe	=>ppi_paoe,
		PBi		=>ppi_pbi,
		--PBo		=>ppi_pbo,
		--PBoe	=>ppi_pboe,
		PCHi	=>ppi_pchi,
		PCHo	=>ppi_pcho,
		PCHoe	=>ppi_pchoe,
		PCLi	=>ppi_pcli,
		PCLo	=>ppi_pclo,
		PCLoe	=>ppi_pcloe,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);

	ppi_pai<='1' & pJoyA(5 downto 4) & '1' & pJoyA(3 downto 0);
	ppi_pbi<='1' & pJoyB(5 downto 4) & '1' & pJoyB(3 downto 0);
	pStrA<=ppi_pcho(0) when ppi_pchoe='1' else 'Z';
	pStrB<=ppi_pcho(1) when ppi_pchoe='1' else 'Z';
--	pJoyA(4)<='Z' when ppi_pcho(2)='0' else '0';
--	pJoyA(5)<='Z' when ppi_pcho(3)='0' else '0';
	pcm_clkdiv<=ppi_pclo(3 downto 2);
	pcm_enL<=not ppi_pclo(1);
	pcm_enR<=not ppi_pclo(0);
	
	process(vidclk) begin
		if rising_edge(vidclk) then
			if(srstn='0')then
				VID_HRTCd<='0';
			elsif(vid_ce = '1')then
				VID_HRTCd<=VID_HRTC;
			end if;
		end if;
	end process;
	
	VID_HRTCi<=VID_HRTCd;-- and (vr_hfreq or not vr_VD(0) or (pVideoF1 and vlineno(0)) or (not pVideoF1 and not vlineno(0)));
	
	mfp_gpip7<=VID_HRTCi;
	mfp_gpip6<=not VID_RINT;
	mfp_gpip5<='1';
	mfp_gpip4<=VID_VVIDEN;
	mfp_gpip3<=opm_intn;
	mfp_gpip2<=pwrsw;
	mfp_gpip1<='1';
	mfp_gpip0<=not rtc_alarm;
	mfp_tai<=not VID_VVIDEN;

	UMFP	:MFP generic map(SCFREQ) port map(
		addr	=>abus(23 downto 0),
		rdat	=>mfp_odat,
		wdat	=>dbus(7 downto 0),
		rd		=>b_rd,
		wr		=>b_wr(0),
		datoe	=>mfp_doe,
		
		KBCLKIN	=>kb_clkin,
		KBCLKOUT=>kb_clkout,
		KBDATIN	=>kb_datin,
		KBDATOUT=>kb_datout,
		KBWAIT	=>'0',
		KBen	=>open,
		KBLED	=>open,

		kbsel	=>'0',
		kbout	=>open,
		kbrx	=>open,

	
		GPIPI7	=>mfp_gpip7,
		GPIPI6	=>mfp_gpip6,
		GPIPI5	=>mfp_gpip5,
		GPIPI4	=>mfp_gpip4,
		GPIPI3	=>mfp_gpip3,
		GPIPI2	=>mfp_gpip2,
		GPIPI1	=>mfp_gpip1,
		GPIPI0	=>mfp_gpip0,

		GPIPO7	=>open,
		GPIPO6	=>open,
		GPIPO5	=>open,
		GPIPO4	=>open,
		GPIPO3	=>open,
		GPIPO2	=>open,
		GPIPO1	=>open,
		GPIPO0	=>open,

		GPIPD7	=>open,
		GPIPD6	=>open,
		GPIPD5	=>open,
		GPIPD4	=>open,
		GPIPD3	=>open,
		GPIPD2	=>open,
		GPIPD1	=>open,
		GPIPD0	=>open,

		TAI		=>mfp_tai,
		TAO		=>open,

		TBI		=>'0',
		TBO		=>open,

		TCO		=>open,

		TDO		=>open,

		INT		=>INT6,
		IVECT	=>IVECT6,
		INTack	=>IACK6,
		IVack	=>mfp_ivack,
			
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);
	
	scc_u	:scc generic map(
		CLKCYC	=>SCFREQ
	)port map(
		addr	=>abus(23 downto 0),
		rd		=>b_rd,
		wr		=>b_wr(0),
		wdat	=>dbus(7 downto 0),
		rdat	=>scc_odat,
		doe		=>scc_doe,
		int		=>INT5,
		ivect	=>IVECT5,
		iack	=>IACK5,

		mclkin	=>ms_clkin,
		mclkout	=>ms_clkout,
		mdatin	=>ms_datin,
		mdatout	=>ms_datout,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);

	
	opm_csn<='0' when abus(23 downto 2)="1110100100000000000000" else '1';
	
--	process(sysclk,rstn)begin
--		if(rstn='0')then
--			opm_sft<='0';
--		elsif(sysclk' event and sysclk='1')then
--			opm_sft<=not opm_sft;
--		end if;
--	end process;
	
	
	-- FM:OPM generic map(16) port map(
	-- 	DIN		=>dbus(7 downto 0),
	-- 	DOUT	=>opm_odat,
	-- 	DOE		=>opm_doe,
	-- 	CSn		=>opm_csn,
	-- 	ADR0	=>abus(1),
	-- 	RDn		=>b_rdn,
	-- 	WRn		=>b_wrn(0),
	-- 	INTn	=>opm_intn,
		
	-- 	sndL	=>opm_sndl,
	-- 	sndR	=>opm_sndr,
		
	-- 	CT1		=>pcm_clkmode,
	-- 	CT2		=>opm_ct2,
		
	-- --	monout	:out std_logic_vector(15 downto 0);
	-- 	chenable	=>dopmonoff,

	-- 	fmclk		=>sndclk,
	-- 	pclk		=>sysclk,
	-- 	rstn	=>srstn
	-- );

	opm_doe <= b_rd and not opm_csn;
	FM:jt51 port map(
		rst      => not srstn,
		clk      => sysclk,
		cen      => opm_ce(0),
		cen_p1   => opm_ce(1),
		cs_n     => opm_csn,
		wr_n     => b_wrn(0),
		a0       => abus(1),
		din      => dbus(7 downto 0),
		dout     => opm_odat,
		ct1      => pcm_clkmode,
		ct2      => opm_ct2,
		irq_n    => opm_intn,
		sample   => open,
		left     => opm_sndl,
		right    => opm_sndr,
		xleft    => open,
		xright   => open,
		dacleft  => open,
		dacright => open
	);

	pcm_ce<='1' when abus(23 downto 2)="1110100100100000000000" else '0';
	pcm_wr<=b_wr(0) when pcm_ce='1' else '0';
	pcm_doe<=b_rd when pcm_ce='1' else '0';
	
	cm_out <= pcm_clkmode;
		
	-- pcmc	:pcmclk port map(
	-- 	clkmode	=>pcm_clkmode,
	-- 	pcmsft	=>pcm_sft,
		
	-- 	clk		=>sndclk,
	-- 	ce      =>snd_ce,
	-- 	rstn		=>srstn
	-- );
	
	pcm	:e6258 port map(
		addr		=>abus(1),
		datin		=>dbus(7 downto 0),
		datout	=>pcm_odat,
		datwr		=>pcm_wr,
		drq		=>pcm_drq,
		
		clkdiv	=>pcm_clkdiv,
		sft		=>snd_ce,
		
		sndout	=>pcm_snd,
		
		sysclk	=>sysclk,
		sys_ce  =>sys_ce,
		sndclk	=>sndclk,
		snd_ce  =>'1',
		rstn		=>srstn
	);
	
	-- pcm_sndL<= (others=>'0') when (pcm_enL='0' and ppi_pcloe='1') else (pcm_snd(11) & pcm_snd & "000");
	-- pcm_sndR<= (others=>'0') when (pcm_enR='0' and ppi_pcloe='1') else (pcm_snd(11) & pcm_snd & "000");
	
	process(sndclk, snd_ce) begin
		if rising_edge(sndclk) then
			if (srstn = '0') then
				pcm_sndL <= (others=>'0');
				pcm_sndR <= (others=>'0');
			elsif (snd_ce = '1') then
				if (pcm_enL='1' or ppi_pcloe='0') then
					pcm_sndL<=(pcm_snd(11) & pcm_snd & "000");
				end if;
				if (pcm_enR='1' or ppi_pcloe='0') then
					pcm_sndR<=(pcm_snd(11) & pcm_snd & "000");
				end if;
			end if;
		end if;
	end process;

	process(sndclk,srstn,snd_ce)
	begin
		if(srstn='0')then
			opm_wstate<=0;
		elsif(sndclk' event and sndclk='1' and snd_ce = '1')then
			case opm_wstate is
			when 0 =>
				if(opm_csn='0' and (b_wrn(0)='0' or b_rdn='0'))then
					opm_wstate<=1;
				end if;
			when 1 =>
				opm_wstate<=2;
			when 2 =>
				if(opm_csn='1')then
					opm_wstate<=0;
				end if;
			when others =>
				opm_wstate<=0;
			end case;
		end if;
	end process;
	
	iowait_opm<='1' when (opm_csn='0' and (b_wrn(0)='0' or b_rdn='0') and opm_wstate/=2) else '0';

	mixL	:addsat generic map(16) port map(opm_sndL(15) & opm_sndL(15 downto 1),pcm_sndL,mix_sndL,open,open);
	mixR	:addsat generic map(16) port map(opm_sndR(15) & opm_sndR(15 downto 1),pcm_sndR,mix_sndR,open,open);

	--dacs	:sftclk generic map(ACFREQ,DACFREQ,1) port map("1",dacsft,sndclk,snd_ce,srstn);
	
	pSndPCML <= pcm_sndL;
	pSndPCMR <= pcm_sndR;
	pSndYML  <= opm_sndL;
	pSndYMR  <= opm_sndR;

	sndL<=mix_sndL;

	sndR<=mix_sndR;
	
	pSndL<=sndL;
	pSndR<=sndR;
	
	-- DacL	:deltasigmadac generic map(16) port map(
	-- 	data	=>(not sndL(15)) & sndL(14 downto 0),
	-- 	datum	=>open,
		
	-- 	sft	=>dacsft,
	-- 	clk	=>sndclk,
	-- 	rstn	=>srstn
	-- );
	-- DacR	:deltasigmadac generic map(16) port map(
	-- 	data	=>(not sndR(15)) & sndR(14 downto 0),
	-- 	datum	=>open,
		
	-- 	sft	=>dacsft,
	-- 	clk	=>sndclk,
	-- 	rstn	=>srstn
	-- );

--opm_doe<='1' when opm_csn='0' and b_rdn='1' else '0';
	
	pPs2Clkout<=kb_clkout;
	pPs2Datout<=kb_datout;
	pPmsClkout<=ms_clkout;
	pPmsDatout<=ms_datout;
	process(sysclk,srstn,sys_ce)begin
		if(srstn='0')then
			kb_clkin<='1';
			kb_datin<='1';
			ms_clkin<='1';
			ms_datin<='1';
		elsif(sysclk' event and sysclk='1' and sys_ce = '1')then
			kb_clkin<=pPs2Clkin;
			kb_datin<=pPs2Datin;
			ms_clkin<=pPmsClkin;
			ms_datin<=pPmsDatin;
		end if;
	end process;

	rtc_cs<='1' when abus(23 downto 5)=(x"e8a0" & "000") else '0';
	rtc_doe<=b_rd when rtc_cs='1' else '0';
	rtc_wr<=b_wr(0) when rtc_cs='1' else '0';

	rtc	:rp5c15 generic map(SCFREQ*1000,x"20") port map(
		addr		=>abus(4 downto 1),
		wdat		=>dbus(3 downto 0),
		rdat		=>rtc_odat,
		wr			=>rtc_wr,
		
		clkout	=>open,
		alarm		=>rtc_alarm,
		
		RTCIN		=>sysrtc,

		clk		=>sysclk,
		ce      =>sys_ce,
		rstn		=>'1'
	);

	INT2<='0';
	INT4<='0';
	IVECT2<=(others=>'0');
	IVECT4<=(others=>'0');

	INT7<=not pPsw(1);

	midi_cs<='1' when abus(23 downto 4)=x"eafa0" else '0';
	midi_rd<=b_rd when midi_cs='1' else '0';
	midi_wr<=b_wr(0) when midi_cs='1' else '0';
	midi_doe<=midi_rd;
	
	midi	:em3802 generic map(
		sysclk	=>SCFREQ,
		oscm		=>1000,
		oscf		=>614
	)port map(
		ADDR	=>abus(3 downto 1),
		DATIN	=>dbus(7 downto 0),
		DATOUT=>midi_odat,
		DATWR	=>midi_wr,
		DATRD	=>midi_rd,
		--INT	=>midi_int,
		--IVECT	=>midi_ivect,

		RxD	=>pMidi_in,
		TxD	=>pMidi_out,
		RxF	=>'1',
		TxF	=>open,
		SYNC	=>open,
		CLICK	=>open,
		GPOUT	=>open,
		GPIN	=>(others=>'1'),
		GPOE	=>open,
		
		clk	=>sysclk,
		ce  =>sys_ce,
		rstn	=>srstn
	);

	SASI_CS<='1' when abus(23 downto 3)=(x"e9600" & '0') else '0';
	
	SASI	:sasiif port map(
		cs		=>SASI_CS,
		addr	=>abus(2 downto 1),
		rd		=>b_rd,
		wr		=>b_wr(0),
		wdat	=>dbus(7 downto 0),
		rdat	=>SASI_RDAT,
		doe		=>SASI_DOE,
		int		=>SASI_INT,
		iack	=>SASI_IACK,
		drq		=>SASI_DRQ,
		dack	=>SASI_DACK,
		iowait	=>iowait_sasi,
		
		IDAT	=>SASI_C2H,
		ODAT	=>SASI_H2C,
		ODEN	=>open,
		SEL		=>SASI_SEL,
		BSY		=>SASI_BSYf,
		REQ		=>SASI_REQf,
		ACK		=>SASI_ACK,
		IO		=>SASI_IOf,
		CD		=>SASI_CDf,
		MSG		=>SASI_MSGf,
		RST		=>SASI_RST,
		
		clk		=>sysclk,
		ce      =>sys_ce,
		rstn	=>srstn
	);
	-- SELf	:digifilter generic map(2,'0') port map(SASI_SEL,SASI_SELf,emuclk,emu_ce,srstn);
	-- BSYf	:digifilter generic map(2,'0') port map(SASI_BSY,SASI_BSYf,sysclk,sys_ce,srstn);
	-- REQf	:digifilter generic map(2,'0') port map(SASI_REQ,SASI_REQf,sysclk,sys_ce,srstn);
	-- ACKf	:digifilter generic map(2,'0') port map(SASI_ACK,SASI_ACKf,emuclk,emu_ce,srstn);
	-- IOf		:digifilter generic map(2,'0') port map(SASI_IO,SASI_IOf,sysclk,sys_ce,srstn);
	-- CDf		:digifilter generic map(2,'0') port map(SASI_CD,SASI_CDf,sysclk,sys_ce,srstn);
	-- MSGf	:digifilter generic map(2,'0') port map(SASI_MSG,SASI_MSGf,sysclk,sys_ce,srstn);
	-- RSTf	:digifilter generic map(2,'0') port map(SASI_RST,SASI_RSTf,emuclk,emu_ce,srstn);
	
	SASI_SELf <= SASI_SEL;
	SASI_BSYf <= SASI_BSY;
	SASI_REQf <= SASI_REQ;
	SASI_ACKf <= SASI_ACK;
	SASI_IOf <= SASI_IO;
	SASI_CDf <= SASI_CD;
	SASI_MSGf <= SASI_MSG;
	SASI_RSTf <= SASI_RST;
	
	DISKE	:diskemu generic map(FCFREQ,SCFREQ,10) port map(

	--SASI
		sasi_din	=>SASI_H2C,
		sasi_dout	=>SASI_C2H,
		sasi_sel	=>SASI_SELf,
		sasi_bsy	=>SASI_BSY,
		sasi_req	=>SASI_REQ,
		sasi_ack	=>SASI_ACKf,
		sasi_io		=>SASI_IO,
		sasi_cd		=>SASI_CD,
		sasi_msg	=>SASI_MSG,
		sasi_rst	=>SASI_RSTf,

	--FDD
		fdc_useln	=>FDC_USELn(1 downto 0),
		fdc_motorn	=>FDC_MOTORn(1 downto 0),
		fdc_readyn	=>FDC_READYn,
		fdc_wrenn	=>FDC_wrenn,
		fdc_wrbitn	=>FDC_wrbitn,
		fdc_rdbitn	=>FDC_rdbitn,
		fdc_stepn	=>FDC_stepn,
		fdc_sdirn	=>FDC_sdirn,
		fdc_track0n	=>FDC_track0n,
		fdc_indexn	=>FDC_indexn,
		fdc_siden	=>FDC_siden,
		fdc_wprotn	=>FDC_wprotn,
		fdc_eject	=>FDC_eject(1 downto 0) or pFDEJECT,
		fdc_indisk	=>FDC_indisk,
		fdc_trackwid=>'1',
		fdc_dencity	=>FD_HDn,
		fdc_rpm		=>'1',
		fdc_mfm		=>FDC_MFM,
		
	--FD emulator
		fde_tracklen=>dem_fdetracklen,
		fde_ramaddr	=>dem_fderamaddr,
		fde_ramrdat	=>dem_fderamrdat,
		fde_ramwdat	=>dem_fderamwdat,
		fde_ramwr	=>dem_fderamwr,
		fde_ramwait	=>'0',
		fec_ramaddrh =>dem_fecramaddrh,
		fec_ramaddrl =>dem_fecramaddrl,
		fec_ramwe	=>dem_fecramwe,
		fec_ramrdat	=>dem_fecramwdat,
		fec_ramwdat	=>dem_fecramrdat,
		fec_ramrd	=>dem_fecramrd,
		fec_ramwr	=>dem_fecramwr,
		fec_rambusy	=>dem_fecrambusy,

		fec_fdsync	=>pFDSYNC,

	--SRAM
		sram_cs		=>nv_ce,
		sram_addr	=>abus(13 downto 1),
		sram_rdat	=>nv_rdat,
		sram_wdat	=>dbus,
		sram_rd		=>b_rd,
		sram_wr		=>b_wr,
		sram_wp		=>nv_wren,
		
		sram_ld		=>pSramld,
		sram_st		=>pSramst,
		
	--MiSTer diskimage
		mist_mounted	=>mist_mounted,
		mist_readonly	=>mist_readonly,
		mist_imgsize	=>mist_imgsize,

		mist_lba		=>mist_lba,
		mist_rd		=>mist_rd,
		mist_wr		=>mist_wr,
		mist_ack		=>mist_ack,

		mist_buffaddr	=>mist_buffaddr,
		mist_buffdout	=>mist_buffdout,
		mist_buffdin	=>mist_buffdin,
		mist_buffwr		=>mist_buffwr,
		
	--common
		initdone	=>dem_initdone,
		busy		=>pLed,
		fclk		=>fdcclk,
		fd_ce       =>fd_ce,
		sclk		=>sysclk,
		sys_ce      =>sys_ce,
		rclk		=>ramclk,
		ram_ce      =>ram_ce,
		rstn		=>dem_rstn
);

	pFDMOTOR<=	not FDC_MOTORn(0) when FDC_USELn(0)='0' else
					not FDC_MOTORn(1) when FDC_USELn(1)='0' else
					'0';
	
	nv_wren<=	'0' when nvwp/=x"31" else
				'0' when nv_ce='0' else
				'1' when b_wr/="00" else
				'0';
				
	nv_doe<=b_rd when nv_ce='1' else '0';
	
	--SASI_BUSY<=SASI_BSY;
	
end rtl;
