LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity diskemu is
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
end diskemu;

architecture rtl of diskemu is

type emustate_t is (
	es_IDLE,
	es_fload0,
	es_fload1,
	es_fsave0,
	es_fsave1,
	es_sasi,
	es_sload,
	es_ssave
);
signal	emustate	:emustate_t;

type fdstate_t is (
	fs_idle,
	fs_loadtbl0,
	fs_loadtbl1,
	fs_loadmode,
	fs_loadshead,
	fs_loadsheadw,
	fs_loadsectorsl,
	fs_loadsectorsh,
	fs_gap0,
	fs_synci,
	fs_iam0,
	fs_iam1,
	fs_iam2,
	fs_C,
	fs_H,
	fs_R,
	fs_N,
	fs_crci0,
	fs_crci1,
	fs_ssizel,
	fs_ssizeh,
	fs_gap1,
	fs_syncd,
	fs_dam0,
	fs_dam1,
	fs_dam2,
	fs_dat,
	fs_crcd0,
	fs_crcd1,
	fs_gap2,
	fs_gap3,
	fs_nxttrack,
	fs_scantrack,
	fs_scaniam,
	fs_crciam0,
	fs_crciam1,
	fs_crciam2,
	fs_stC,
	fs_stH,
	fs_stR,
	fs_stN,
	fs_chkicrch,
	fs_chkicrcl,
	fs_stmod,
	fs_stsectsizel,
	fs_stsectsizeh,
	fs_scandam,
	fs_crcdam0,
	fs_crcdam1,
	fs_crcdam2,
	fs_stdat,
	fs_chkdatcrc,
	fs_ststatus,
	fs_savenexttrack,
	fs_saveend
);
signal	fdstate	:fdstate_t;

constant allzero	:std_logic_vector(63 downto 0)	:=(others=>'0');

signal	storef0	:std_logic;
signal	storef1	:std_logic;
signal	fddone	:std_logic;
signal	sasidone :std_logic;
signal	sramdone :std_logic;
signal	proc_begin	:std_logic;

signal	lba_fdd	:std_logic_vector(31 downto 0);

signal	fec_curaddr	:std_logic_vector(31 downto 0);

constant bit_fd0	:integer	:=0;
constant bit_fd1	:integer	:=1;
constant bit_sasi	:integer	:=2;
constant bit_sram	:integer	:=3;

signal	wrprot	:std_logic_vector(1 downto 0);
signal	diskmode0	:std_logic_vector(1 downto 0);
signal	diskmode1	:std_logic_vector(1 downto 0);
signal	diskmode		:std_logic_vector(1 downto 0);
signal	fde_wrmode	:std_logic_vector(7 downto 0);
signal	fde_modeset	:std_logic_vector(1 downto 0);

signal	fde_wrote	:std_logic_vector(3 downto 0);

signal	tblramwr	:std_logic;
signal	tblramsel	:std_logic;

signal	tbladdr	:std_logic_vector(7 downto 0);
signal	haddr	:std_logic_vector(31 downto 0);

signal	sectwr		:std_logic;

signal	sbufaddr	:std_logic_vector(8 downto 0);
signal	sbufwr		:std_logic;

signal	trackno	:std_logic_vector(7 downto 0);
signal	track_curaddr	:std_logic_vector(13 downto 0);
signal	tracklen	:std_logic_vector(31 downto 0);
signal	tracks		:std_logic_Vector(7 downto 0);

signal	img_curaddr	:std_logic_vector(31 downto 0);
signal	img_unit	:std_logic;
signal	img_addr	:std_logic_vector(31 downto 0);
signal	img_rd		:std_logic;
signal	img_wr		:std_logic;
signal	img_sync		:std_logic;
signal	img_busy	:std_logic;
signal	img_rddat	:std_logic_vector(7 downto 0);
signal	img_wrdat	:std_logic_vector(7 downto 0);

signal	cur_lba		:std_logic_vector(31 downto 0);
signal	cur_unit	:std_logic;

signal	trackaddr	:std_logic_vector(22 downto 0);
signal	trackwrdat	:std_logic_vector(15 downto 0);
signal	trackrddat	:std_logic_vector(15 downto 0);
signal	trackwr		:std_logic;
signal	trackrd		:std_logic;
signal	tracksync	:std_logic;
signal	trackbusy	:std_logic;
signal	curfbhaddr	:std_logic_vector(14 downto 0);
signal	fdsectwr		:std_logic;

signal	bytecount	:integer range 0 to 2047;
signal	mfm		:std_logic;
signal	mfm0		:std_logic;
signal	mfm1		:std_logic;
signal	mfm0m		:std_logic;
signal	mfm1m		:std_logic;
signal	numsect	:std_logic_vector(15 downto 0);
signal	sectcount:std_logic_vector(15 downto 0);
signal	cursecthead	:std_logic_vector(31 downto 0);
signal	nxtsecthead	:std_logic_vector(31 downto 0);
signal	sectlen	:std_logic_vector(15 downto 0);
signal	deleted	:std_logic;
signal	crcwrdat	:std_logic_vector(7 downto 0);
signal	crcwr		:std_logic;
signal	crcclr		:std_logic;
signal	crcdat		:std_logic_vector(15 downto 0);
signal	crcbusy		:std_logic;
signal	sectrd		:std_logic;
signal	sectstatus	:std_logic_vector(7 downto 0);
signal	sbuf_odat	:std_logic_vector(7 downto 0);

signal	fbaddr		:std_logic_vector(7 downto 0);
signal	fbwr		:std_logic;

signal	fde_track0n	:std_logic;
signal	fde_indexn	:std_logic;
signal	fde_rdbitn	:std_logic;

signal	fde_ramaddrw	:std_logic_vector(23 downto 0);
signal	fdc_usel		:std_logic_vector(1 downto 0);
signal	fdc_indiskb	:std_logic_vector(1 downto 0);
signal	fdc_motoren	:std_logic;
signal	trackwrote	:std_logic;
signal	statusaddr	:std_logic_vector(13 downto 0);

signal	sramen		:std_logic;
signal	fstore		:std_logic_vector(1 downto 0);

type sbufstate_t is (
	ss_idle,
	ss_rwrite,
	ss_rwrite2,
	ss_read,
	ss_read2,
	ss_wread,
	ss_wread2,
	ss_write,
	ss_write2,
	ss_sync,
	ss_sync2
);
signal	sbufstate	:sbufstate_t;
signal	fbufstate	:sbufstate_t;
signal	sasibufstate:sbufstate_t;

--SASI
signal	sasien		:std_logic;
signal	sasi_idsel	:std_logic_vector(7 downto 0);
signal	sasi_cap		:std_logic_vector(63 downto 0);
signal	sasi_lba		:std_logic_vector(20 downto 0);
signal	sasi_sectaddr	:std_logic_vector(7 downto 0);
signal	sasisectwr	:std_logic;
signal	sasibufwr	:std_logic;
signal	sasi_rdreq	:std_logic;
signal	sasi_wrreq	:std_logic;
signal	sasi_syncreq:std_logic;
signal	sasi_bufbusy	:std_logic;
signal	sasi_sectwrdat	:std_logic_vector(7 downto 0);
signal	sasi_sectrddat	:std_logic_vector(7 downto 0);
signal	sasi_rdreq2	:std_logic;
signal	sasi_wrreq2	:std_logic;
signal	sasi_syreq2	:std_logic;
signal	sasi_bufodat	:std_logic_vector(7 downto 0);
signal	lba_sasi		:std_logic_vector(31 downto 0);
signal	cur_slba		:std_logic_vector(31 downto 0);

--SRAM
signal	lba_sram		:std_logic_vector(31 downto 0);
signal	sram_bufwr	:std_logic;
signal	sram_bufout	:std_logic_Vector(7 downto 0);
signal	sramwr	:std_logic_vector(1 downto 0);
signal	sram_ldreq	:std_logic;
signal	sram_streq	:std_logic;

component tracktable
port(
	wraddr	:in std_logic_vector(9 downto 0);
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;

	table	:in std_logic_vector(7 downto 0);
	haddr	:out std_logic_vector(31 downto 0);

	clk		:in std_logic;
	ce      :in std_logic := '1'
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

component sectram
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

component fecbuf
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock_a		: IN STD_LOGIC  := '1';
		clock_b		: IN STD_LOGIC ;
		data_a		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component FDemu
generic(
	sysclk		:integer	:=10000;
	fdwait		:integer	:=10
);
port(
	ramaddr	:out std_logic_vector(23 downto 0);
	ramrdat	:in std_logic_vector(15 downto 0);
	ramwdat	:out std_logic_vector(15 downto 0);
	ramwr	:out std_logic;
	ramwait	:in std_logic;

	rdfdmode	:in std_logic_vector(7 downto 0);
	curfdmode	:out std_logic_vector(7 downto 0);
	modeset		:in std_logic_vector(3 downto 0);
	wrote		:out std_logic_vector(3 downto 0);
	wprot		:in std_logic_vector(3 downto 0);
	tracklen	:out std_logic_vector(13 downto 0);

	USEL	:in std_logic_vector(1 downto 0);
	MOTOR	:in std_logic;
	WRENn	:in std_logic;		--pin24
	WRBITn	:in std_logic;		--pin22
	WRFDMODE:in std_logic_vector(1 downto 0);
	WRMFM	:in std_logic;
	RDBITn	:out std_logic;		--pin30
	STEPn	:in std_logic;		--pin20
	SDIRn	:in std_logic;		--pin18
	track0n	:out std_logic;		--pin26
	indexn	:out std_logic;		--pin8
	siden	:in std_logic;		--pin32

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sasidev
port(
	IDAT		:in std_logic_vector(7 downto 0);
	ODAT		:out std_logic_vector(7 downto 0);
	SEL		:in std_logic;
	BSY		:out std_logic;
	REQ		:out std_logic;
	ACK		:in std_logic;
	IO			:out std_logic;
	CD			:out std_logic;
	MSG		:out std_logic;
	RST		:in std_logic;

	idsel		:in std_logic_vector(7 downto 0);

	id			:out std_logic_vector(2 downto 0);
	unit		:out std_logic_vector(2 downto 0);
	capacity	:in std_logic_vector(63 downto 0);
	lba		:out std_logic_vector(20 downto 0);
	rdreq		:out std_logic;
	wrreq		:out std_logic;
	syncreq	:out std_logic;
	sectaddr	:out std_logic_vector(7 downto 0);
	rddat		:in std_logic_vector(7 downto 0);
	wrdat		:out std_logic_vector(7 downto 0);
	sectbusy	:in std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn		:in std_logic
);
end component;

component wrotecont
generic(
	sysfreq	:integer	:=20;	--kHz
	delay	:integer	:=3		--msec
);
port(
	wrgate	:in std_logic;
	usel	:in std_logic_vector(1 downto 0);

	busy	:out std_logic;
	save	:out std_logic_vector(1 downto 0);
	done	:in std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

component sramcont
port(
	addr	:in std_logic_vector(12 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	wdat	:in std_logic_vector(15 downto 0)	:=(others=>'0');
	wr		:in std_logic_vector(1 downto 0)	:="00";

	ldreq	:in std_logic;
	streq	:in std_logic;
	done	:out std_logic;

	mist_rd	:out std_logic;
	mist_wr	:out std_logic;
	mist_ack:in std_logic;

	mist_lba	:out std_logic_vector(31 downto 0);
	mist_addr	:in std_logic_vector(8 downto 0);
	mist_wdat	:in std_logic_vector(7 downto 0);
	mist_rdat	:out std_logic_vector(7 downto 0);
	mist_we		:in std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin

	initdone<=rstn;

	wc	:wrotecont generic map(sclkfreq,3000) port map(
		wrgate	=>not fdc_wrenn,
		usel	=>not fdc_useln,

		busy	=>busy,
		save	=>fstore,
		done	=>fddone,

		clk		=>sclk,
		ce      =>sys_ce,
		rstn	=>rstn
	);

	storef0<=fec_fdsync(0) or fstore(0);
	storef1<=fec_fdsync(1) or fstore(1);

	process(sclk,rstn)
	variable lmount	:std_logic_vector(3 downto 0);
	variable fdload	:std_logic_vector(1 downto 0);
	variable fdstore :std_logic_vector(1 downto 0);
	variable sstore	:std_logic;
	variable sload	:std_logic;
	variable sasiwpend	:std_logic;
	variable sasirpend	:std_logic;
	variable sasispend	:std_logic;
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				lmount:=(others=>'0');
				emustate<=es_IDLE;
				proc_begin<='0';
				fdload:=(others=>'0');
				fdstore:=(others=>'0');
				sstore:='0';
				sload:='0';
				fdc_indiskb<="00";
				sasiwpend:='0';
				sasirpend:='0';
				sasispend:='0';
				sasi_bufbusy<='0';
				sasi_rdreq2<='0';
				sasi_wrreq2<='0';
				sasi_syreq2<='0';
				sram_ldreq<='0';
				sram_streq<='0';
				sramen<='0';
				sasien<='0';
			elsif(sys_ce = '1')then
				proc_begin<='0';
				sasi_rdreq2<='0';
				sasi_wrreq2<='0';
				sasi_syreq2<='0';
				sram_ldreq<='0';
				sram_streq<='0';
				if(mist_mounted(bit_fd0)='1' and lmount(bit_fd0)='0')then
					if(mist_imgsize=x"00000000")then
						fdc_indiskb(0)<='0';
					else
						fdc_indiskb(0)<='0';
						fdload(0):='1';
					end if;
				end if;
				if(mist_mounted(bit_fd1)='1' and lmount(bit_fd1)='0')then
					if(mist_imgsize=x"00000000")then
						fdc_indiskb(1)<='0';
					else
						fdc_indiskb(1)<='0';
						fdload(1):='1';
					end if;
				end if;

				if(mist_mounted(bit_sasi)='1' and lmount(bit_sasi)='0')then
					if(mist_imgsize=x"00000000")then
						sasien<='0';
					else
						sasien<='1';
					end if;
					sasi_cap<=mist_imgsize;
				end if;

				if(mist_mounted(bit_sram)='1' and lmount(bit_sram)='0')then
					if(mist_imgsize=x"00000000")then
						sramen<='0';
					else
						sramen<='1';
					end if;
				end if;

				if(storef0='1')then
					fdstore(0):='1';
				end if;
				if(storef1='1')then
					fdstore(1):='1';
				end if;

				if(sram_ld='1' and sramen='1')then
					sload:='1';
				end if;
				if(sram_st='1' and sramen='1')then
					sstore:='1';
				end if;

				if(fdc_eject(0)='1' and fdc_indiskb(0)='1')then
					fdstore(0):='1';
					fdc_indiskb(0)<='0';
				end if;
				if(fdc_eject(1)='1' and fdc_indiskb(1)='1')then
					fdstore(1):='1';
					fdc_indiskb(1)<='0';
				end if;

				if(sasi_rdreq='1')then
					sasirpend:='1';
					sasi_bufbusy<='1';
				elsif(sasi_wrreq='1')then
					sasiwpend:='1';
					sasi_bufbusy<='1';
				--elsif(sasi_syncreq='1')then
				--	sasispend:='1';
				end if;

				lmount:=mist_mounted;
				case emustate is
				when es_IDLE =>
					if(sasirpend='1')then
						sasirpend:='0';
						emustate<=es_sasi;
						sasi_rdreq2<='1';
					elsif(sasiwpend='1')then
						sasiwpend:='0';
						emustate<=es_sasi;
						sasi_wrreq2<='1';
					elsif(sasispend='1')then
						sasispend:='0';
						emustate<=es_sasi;
						sasi_syreq2<='1';
					elsif(fdload(0)='1')then
						emustate<=es_fload0;
						proc_begin<='1';
						fdload(0):='0';
					elsif(fdload(1)='1')then
						emustate<=es_fload1;
						proc_begin<='1';
						fdload(1):='0';
					elsif(fdstore(0)='1' and fdc_indiskb(0)='1')then
						emustate<=es_fsave0;
						proc_begin<='1';
						fdstore(0):='0';
					elsif(fdstore(1)='1' and fdc_indiskb(1)='1')then
						emustate<=es_fsave1;
						proc_begin<='1';
						fdstore(1):='0';
					elsif(sload='1')then
						emustate<=es_sload;
						sram_ldreq<='1';
						sload:='0';
					elsif(sstore='1')then
						emustate<=es_ssave;
						sram_streq<='1';
						sstore:='0';
					end if;
				when es_fload0 | es_fload1 | es_fsave0 | es_fsave1 =>
					if(fddone='1')then
						emustate<=es_IDLE;
						case emustate is
						when es_fload0 =>
							fdc_indiskb(0)<='1';
						when es_fload1 =>
							fdc_indiskb(1)<='1';
						when others =>
						end case;
					end if;
				when es_sasi =>
					if(sasidone='1')then
						sasi_bufbusy<='0';
						emustate<=es_IDLE;
					end if;
				when es_sload | es_ssave =>
					if(sramdone='1')then
						emustate<=es_IDLE;
					end if;
				when others =>
					emustate<=es_IDLE;
				end case;
			end if;
		end if;
	end process;

	mist_lba<=	lba_fdd when emustate=es_fload0 else
				lba_fdd when emustate=es_fload1 else
				lba_fdd when emustate=es_fsave0 else
				lba_fdd when emustate=es_fsave1 else
				lba_sasi when emustate=es_sasi else
				lba_sram when emustate=es_sload else
				lba_sram when emustate=es_ssave else
				(others=>'0');

	tblramsel<=	'0' when fdstate=fs_loadtbl0 else
				'1' when fdstate=fs_loadtbl1 else
				'0';
	tblramwr<=	mist_buffwr when fdstate=fs_loadtbl0 else
				mist_buffwr when fdstate=fs_loadtbl1 else
				'0';

	tblram	:tracktable port map(
		wraddr	=>tblramsel & mist_buffaddr,
		wrdat	=>mist_buffdout,
		wr		=>tblramwr,

		table	=>tbladdr,
		haddr	=>haddr,

		clk		=>sclk
	);

	fdsectwr<=	mist_buffwr when emustate=es_fload0 else
					mist_buffwr when emustate=es_fload1 else
					mist_buffwr when emustate=es_fsave0 else
					mist_buffwr when emustate=es_fsave1 else
					'0';

	sectbuf	:sectram port map(
		address_a		=>mist_buffaddr,
		address_b		=>sbufaddr,
		clock				=>sclk,
		data_a			=>mist_buffdout,
		data_b			=>img_wrdat,
		wren_a			=>fdsectwr,
		wren_b			=>sbufwr and sys_ce,
		q_a				=>sbuf_odat,
		q_b				=>img_rddat
	);

	sbufaddr<=	img_addr(8 downto 0);

	process(sclk,rstn)
	variable wrote	:std_logic;
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				sbufstate<=ss_idle;
				lba_fdd<=(others=>'0');
				mist_rd(bit_fd1 downto bit_fd0)<=(others=>'0');
				mist_wr(bit_fd1 downto bit_fd0)<=(others=>'0');
				cur_lba<=(others=>'1');
				cur_unit<='0';
				sbufwr<='0';
				wrote:='0';
			elsif(sys_ce = '1')then
				sbufwr<='0';
				case sbufstate is
				when ss_idle =>
					if(img_rd='1')then
						if(img_addr(31 downto 9)/=cur_lba(22 downto 0) or img_unit/=cur_unit)then
							if(wrote='1')then
								if(img_unit='0')then
									mist_wr(bit_fd0)<='1';
								else
									mist_wr(bit_fd1)<='1';
								end if;
								sbufstate<=ss_rwrite;
							else
								cur_lba<="000000000" & img_addr(31 downto 9);
								cur_unit<=img_unit;
								lba_fdd<="000000000" & img_addr(31 downto 9);
								if(img_unit='0')then
									mist_rd(bit_fd0)<='1';
								else
									mist_rd(bit_fd1)<='1';
								end if;
								sbufstate<=ss_read;
							end if;
						end if;
					elsif(img_wr='1')then
						if(img_addr(31 downto 9)=cur_lba(22 downto 0) and img_unit=cur_unit)then
							sbufwr<='1';
							wrote:='1';
						else
							if(wrote='1')then
								if(cur_unit='0')then
									mist_wr(bit_fd0)<='1';
								else
									mist_wr(bit_fd1)<='1';
								end if;
								sbufstate<=ss_write;
							else
								cur_lba<="000000000" & img_addr(31 downto 9);
								cur_unit<=img_unit;
								lba_fdd<="000000000" & img_addr(31 downto 9);
								if(img_unit='0')then
									mist_rd(bit_fd0)<='1';
								else
									mist_rd(bit_fd1)<='1';
								end if;
								sbufstate<=ss_wread;
							end if;
						end if;
					elsif(img_sync='1')then
						if(wrote='1')then
							if(img_unit='0')then
								mist_wr(bit_fd0)<='1';
							else
								mist_wr(bit_fd1)<='1';
							end if;
							sbufstate<=ss_sync;
						end if;
					end if;
				when ss_rwrite =>
					if(mist_ack(bit_fd0)='1')then
						mist_wr(bit_fd1 downto bit_fd0)<="00";
						sbufstate<=ss_rwrite2;
					end if;
				when ss_rwrite2 =>
					if(mist_ack(bit_fd0)='0')then
						wrote:='0';
						cur_lba<="000000000" & img_addr(31 downto 9);
						cur_unit<=img_unit;
						lba_fdd<="000000000" & img_addr(31 downto 9);
						if(img_unit='0')then
							mist_rd(bit_fd0)<='1';
						else
							mist_rd(bit_fd1)<='1';
						end if;
						sbufstate<=ss_read;
					end if;
				when ss_read =>
					if(mist_ack(bit_fd0)='1')then
						mist_rd(bit_fd1 downto bit_fd0)<="00";
						sbufstate<=ss_read2;
					end if;
				when ss_read2 =>
					if(mist_ack(bit_fd0)='0')then
						sbufstate<=ss_idle;
					end if;
				when ss_write =>
					if(mist_ack(bit_fd0)='1')then
						mist_wr(bit_fd1 downto bit_fd0)<="00";
						sbufstate<=ss_write2;
					end if;
				when ss_write2 =>
					if(mist_ack(bit_fd0)='0')then
						lba_fdd<="000000000" & img_addr(31 downto 9);
						cur_lba<="000000000" & img_addr(31 downto 9);
						cur_unit<=img_unit;
						if(img_unit='0')then
							mist_rd(bit_fd0)<='1';
						else
							mist_rd(bit_fd1)<='1';
						end if;
						wrote:='0';
						sbufstate<=ss_wread;
					end if;
				when ss_wread =>
					if(mist_ack(bit_fd0)='1')then
						mist_rd(bit_fd1 downto bit_fd0)<="00";
						sbufstate<=ss_wread2;
					end if;
				when ss_wread2 =>
					if(mist_ack(bit_fd0)='0')then
						sbufwr<='1';
						wrote:='1';
						sbufstate<=ss_idle;
					end if;
				when ss_sync =>
					if(mist_ack(bit_fd0)='1')then
						mist_wr(bit_fd1 downto bit_fd0)<="00";
						sbufstate<=ss_sync2;
					end if;
				when ss_sync2 =>
					if(mist_ack(bit_fd0)='0')then
						wrote:='0';
						sbufstate<=ss_idle;
					end if;
				when others =>
					sbufstate<=ss_idle;
				end case;
			end if;
		end if;
	end process;

	img_busy<=	'1' when img_rd='1' else
				'1' when img_wr='1' else
				'0' when sbufstate=ss_idle else
				'1';


	process(sclk,rstn)
	variable swait	:integer range 0 to 3;
	variable ambuf0,ambuf1,ambuf2,ambuf3	:std_logic_vector(9 downto 0);
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				fdstate<=fs_idle;
				swait:=0;
				mfm<='0';
				--mfm0<='0';
				--mfm1<='0';
				trackno<=(others=>'0');
				track_curaddr<=(others=>'0');
				img_rd<='0';
				img_wr<='0';
				img_sync<='0';
				img_wrdat<=(others=>'0');
				trackrd<='0';
				trackwr<='0';
				tracksync<='0';
				crcclr<='0';
				crcwr<='0';
				crcwrdat<=(others=>'0');
				numsect<=(others=>'0');
				sectcount<=(others=>'0');
				fddone<='0';
				diskmode0<="00";
				diskmode1<="00";
				diskmode<="00";
				ambuf0:=(others=>'0');
				ambuf1:=(others=>'0');
				ambuf2:=(others=>'0');
				ambuf3:=(others=>'0');
				trackwrote<='0';
				fde_modeset<="00";
			elsif(sys_ce = '1')then
				img_rd<='0';
				img_wr<='0';
				img_sync<='0';
				trackrd<='0';
				trackwr<='0';
				tracksync<='0';
				crcclr<='0';
				crcwr<='0';
				fde_modeset<="00";
				fddone<='0';
				if(swait>0)then
					swait:=swait-1;
				else
					case fdstate is
					when fs_idle =>
						if(proc_begin='1')then
							case emustate is
							when es_fload0 | es_fsave0 =>
								img_addr<=x"00000000";
								img_unit<='0';
								img_rd<='1';
								fdstate<=fs_loadtbl0;
							when es_fload1 | es_fsave1 =>
								img_addr<=x"00000000";
								img_unit<='1';
								img_rd<='1';
								fdstate<=fs_loadtbl0;
							when others=>
							end case;
						end if;
					when fs_loadtbl0 =>
						if(img_busy='0')then
							img_addr<=x"00000200";
							trackno<=(others=>'0');
							img_rd<='1';
							fdstate<=fs_loadtbl1;
						end if;
					when fs_loadtbl1 =>
						if(img_busy='0')then
							swait:=2;
							case emustate is
							when es_fload0 | es_fload1 =>
								tbladdr<=x"06";
								fdstate<=fs_loadmode;
							when es_fsave0 | es_fsave1 =>
								tbladdr<=x"08";
								track_curaddr<=(others=>'0');
								trackrd<='1';
								ambuf0:=(others=>'0');
								ambuf1:=(others=>'0');
								ambuf2:=(others=>'0');
								ambuf3:=(others=>'0');
								trackwrote<='0';
								fdstate<=fs_scantrack;
							when others =>
								fdstate<=fs_idle;
							end case;
							trackno<=(others=>'0');
							sectcount<=(others=>'0');
						end if;
					when fs_loadmode =>
						diskmode<=haddr(29 downto 28);
						case emustate is
						when es_fload0 | es_fsave0 =>
							wrprot(0)<=haddr(20);
							diskmode0<=haddr(29 downto 28);
							fde_modeset(0)<='1';
						when es_fload1 | es_fsave1 =>
							wrprot(1)<=haddr(20);
							diskmode1<=haddr(29 downto 28);
							fde_modeset(1)<='1';
						when others =>
						end case;
						tbladdr<=trackno+x"08";
						swait:=2;
						fdstate<=fs_loadshead;
					when fs_loadshead =>
						cursecthead<=haddr;
						case emustate is
						when es_fload0 | es_fsave0 =>
							img_unit<='0';
						when es_fload1 | es_fsave1 =>
							img_unit<='1';
						when others=>
						end case;
						img_addr<=haddr+x"08";
						img_rd<='1';
						fdstate<=fs_loadsheadw;
					when fs_loadsheadw =>
						if(img_busy='0')then
							mfm<=not img_rddat(6);
							case emustate is
							--when es_fload0 =>
							--	mfm0<=not img_rddat(6);
							--when es_fload1 =>
							--	mfm1<=not img_rddat(6);
							when others =>
							end case;
							track_curaddr<=(others=>'0');
							if(img_rddat(6)='1')then
								bytecount<=80;
								trackwrdat<=x"024e";
							else
								bytecount<=40;
								trackwrdat<=x"00ff";
							end if;
							trackwr<='1';
							swait:=1;
							img_addr<=haddr+x"04";
							img_rd<='1';
							fdstate<=fs_loadsectorsl;
						end if;
					when fs_loadsectorsl =>
						if(img_busy='0')then
							numsect(7 downto 0)<=img_rddat;
							img_addr<=haddr+x"05";
							swait:=1;
							fdstate<=fs_loadsectorsh;
						end if;
					when fs_loadsectorsh =>
						if(img_busy='0')then
							numsect(15 downto 8)<=img_rddat;
							sectcount<=(others=>'0');
							fdstate<=fs_gap0;
						end if;
					when fs_gap0 =>
						if(trackbusy='0')then
							if(bytecount>0)then
								bytecount<=bytecount-1;
								track_curaddr<=track_curaddr+1;
								trackwr<='1';
								swait:=1;
							else
								if(mfm='1')then
									trackwrdat<=x"0200";
									bytecount<=12;
								else
									trackwrdat<=x"0000";
									bytecount<=6;
								end if;
								track_curaddr<=track_curaddr+1;
								trackwr<='1';
								swait:=1;
								fdstate<=fs_synci;
							end if;
						end if;
					when fs_synci =>
						if(trackbusy='0')then
							if(bytecount>0)then
								bytecount<=bytecount-1;
								track_curaddr<=track_curaddr+1;
								trackwr<='1';
								swait:=1;
							else
								track_curaddr<=track_curaddr+1;
								crcclr<='1';
								if(mfm='1')then
									trackwrdat<=x"03a1";
									crcwrdat<=x"a1";
									fdstate<=fs_iam0;
								else
									trackwrdat<=x"01fe";
									crcwrdat<=x"fe";
									fdstate<=fs_C;
								end if;
								trackwr<='1';
								crcwr<='1';
								img_addr<=cursecthead+x"00";
								img_rd<='1';
								swait:=1;
							end if;
						end if;
					when fs_iam0 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat<=x"03a1";
							trackwr<='1';
							crcwrdat<=x"a1";
							crcwr<='1';
							swait:=1;
							fdstate<=fs_iam1;
						end if;
					when fs_iam1 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat<=x"03a1";
							trackwr<='1';
							crcwrdat<=x"a1";
							crcwr<='1';
							swait:=1;
							fdstate<=fs_iam2;
						end if;
					when fs_iam2 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat<=x"02fe";
							trackwr<='1';
							crcwrdat<=x"fe";
							crcwr<='1';
							swait:=1;
							fdstate<=fs_C;
						end if;
					when fs_C =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							trackwrdat(7 downto 0)<=img_rddat;
							trackwr<='1';
							crcwrdat<=img_rddat;
							crcwr<='1';
							fdstate<=fs_H;
							img_addr<=cursecthead+x"01";
							swait:=1;
						end if;
					when fs_H =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							trackwrdat(7 downto 0)<=img_rddat;
							trackwr<='1';
							crcwrdat<=img_rddat;
							crcwr<='1';
							fdstate<=fs_R;
							img_addr<=cursecthead+x"02";
							swait:=1;
						end if;
					when fs_R =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							trackwrdat(7 downto 0)<=img_rddat;
							trackwr<='1';
							crcwrdat<=img_rddat;
							crcwr<='1';
							fdstate<=fs_N;
							img_addr<=cursecthead+x"03";
							swait:=1;
						end if;
					when fs_N =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							trackwrdat(7 downto 0)<=img_rddat;
							trackwr<='1';
							crcwrdat<=img_rddat;
							crcwr<='1';
							fdstate<=fs_crci0;
							img_addr<=cursecthead+x"08";
							img_rd<='1';
							swait:=1;
						end if;
					when fs_crci0 =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							sectstatus<=img_rddat;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							if(img_rddat=x"a0")then
								trackwrdat(7 downto 0)<=not crcdat(15 downto 8);
							else
								trackwrdat(7 downto 0)<=crcdat(15 downto 8);
							end if;
							trackwr<='1';
							img_addr<=cursecthead+x"07";
							fdstate<=fs_crci1;
							swait:=1;
						end if;
					when fs_crci1 =>
						if(trackbusy='0' and img_busy='0')then
							deleted<=img_rddat(4);
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							if(sectstatus=x"a0")then
								trackwrdat(7 downto 0)<=not crcdat(7 downto 0);
							else
								trackwrdat(7 downto 0)<=crcdat(7 downto 0);
							end if;
							trackwr<='1';
							img_addr<=cursecthead+x"0e";
							img_rd<='1';
							fdstate<=fs_ssizel;
							swait:=1;
						end if;
					when fs_ssizel =>
						if(img_busy='0')then
							sectlen(7 downto 0)<=img_rddat;
							img_addr<=cursecthead+x"0f";
							img_rd<='1';
							fdstate<=fs_ssizeh;
						end if;
					when fs_ssizeh =>
						if(img_busy='0')then
							sectlen(15 downto 8)<=img_rddat;
							img_addr<=cursecthead+x"10";
							img_rd<='1';
							nxtsecthead<=cursecthead+(img_rddat & sectlen(7 downto 0))+x"10";
							track_curaddr<=track_curaddr+1;
							if(mfm='1')then
								bytecount<=22;
								trackwrdat<=x"024e";
							else
								bytecount<=11;
								trackwrdat<=x"00ff";
							end if;
							trackwr<='1';
							swait:=1;
							fdstate<=fs_gap1;
						end if;
					when fs_gap1 =>
						if(trackbusy='0')then
							track_curaddr<=track_curaddr+1;
							if(bytecount>0)then
								bytecount<=bytecount-1;
							else
								if(mfm='1')then
									bytecount<=12;
									trackwrdat<=x"0200";
								else
									bytecount<=6;
									trackwrdat<=x"0000";
								end if;
								fdstate<=fs_syncd;
							end if;
							trackwr<='1';
							swait:=1;
						end if;
					when fs_syncd =>
						if(trackbusy='0')then
							track_curaddr<=track_curaddr+1;
							if(bytecount>0)then
								bytecount<=bytecount-1;
							else
								crcclr<='1';
								if(mfm='1')then
									trackwrdat<=x"03a1";
									crcwrdat<=x"a1";
									fdstate<=fs_dam0;
								else
									if(deleted='1')then
										trackwrdat<=x"01f8";
										crcwrdat<=x"f8";
									else
										trackwrdat<=x"01fb";
										crcwrdat<=x"fb";
									end if;
									fdstate<=fs_dat;
								end if;
								crcwr<='1';
							end if;
							trackwr<='1';
							swait:=1;
						end if;
					when fs_dam0 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat<=x"03a1";
							crcwrdat<=x"a1";
							trackwr<='1';
							crcwr<='1';
							fdstate<=fs_dam1;
							swait:=1;
						end if;
					when fs_dam1 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat<=x"03a1";
							crcwrdat<=x"a1";
							trackwr<='1';
							crcwr<='1';
							fdstate<=fs_dam2;
							swait:=1;
						end if;
					when fs_dam2 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							if(deleted='1')then
								trackwrdat<=x"02f8";
								crcwrdat<=x"f8";
							else
								trackwrdat<=x"02fb";
								crcwrdat<=x"fb";
							end if;
							trackwr<='1';
							crcwr<='1';
							fdstate<=fs_dat;
							swait:=1;
						end if;
					when fs_dat =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							trackwrdat(7 downto 0)<=img_rddat;
							crcwrdat<=img_rddat;
							trackwr<='1';
							crcwr<='1';
							if(sectlen>x"0001")then
								sectlen<=sectlen-1;
								img_addr<=img_addr+1;
								img_rd<='1';
							else
								fdstate<=fs_crcd0;
							end if;
							swait:=1;
						end if;
					when fs_crcd0 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							if(sectstatus=x"b0")then
								trackwrdat(7 downto 0)<=not crcdat(15 downto 8);
							else
								trackwrdat(7 downto 0)<=crcdat(15 downto 8);
							end if;
							trackwr<='1';
							fdstate<=fs_crcd1;
							swait:=1;
						end if;
					when fs_crcd1 =>
						if(trackbusy='0' and crcbusy='0')then
							track_curaddr<=track_curaddr+1;
							trackwrdat(15 downto 10)<=(others=>'0');
							trackwrdat(9 downto 8)<=mfm & '0';
							if(sectstatus=x"b0")then
								trackwrdat(7 downto 0)<=not crcdat(7 downto 0);
							else
								trackwrdat(7 downto 0)<=crcdat(7 downto 0);
							end if;
							trackwr<='1';
							fdstate<=fs_gap2;
							if(mfm='1')then
								bytecount<=10;
							else
								bytecount<=5;
							end if;
							swait:=1;
						end if;
					when fs_gap2 =>
						if(trackbusy='0')then
							track_curaddr<=track_curaddr+1;
							if(bytecount>0)then
								bytecount<=bytecount-1;
								if(mfm='1')then
									trackwrdat<=x"024e";
								else
									trackwrdat<=x"00ff";
								end if;
								trackwr<='1';
							else
								if(numsect=(sectcount+1))then
									if(mfm='1')then
										trackwrdat<=x"024e";
									else
										trackwrdat<=x"00ff";
									end if;
									trackwr<='1';
									fdstate<=fs_gap3;
								else
									sectcount<=sectcount+1;
									cursecthead<=nxtsecthead;
									if(mfm='1')then
										trackwrdat<=x"0200";
										bytecount<=12;
									else
										trackwrdat<=x"0000";
										bytecount<=6;
									end if;
									trackwr<='1';
									swait:=1;
									fdstate<=fs_synci;
								end if;
							end if;
						end if;
					when fs_gap3 =>
						if(trackbusy='0')then
							if(track_curaddr<tracklen)then
								track_curaddr<=track_curaddr+1;
								trackwr<='1';
							else
								if(trackno<tracks)then
									trackno<=trackno+1;
									tbladdr<=trackno+x"09";
									swait:=2;
									fdstate<=fs_nxttrack;
								else
									tracksync<='1';
									fddone<='1';
									fdstate<=fs_IDLE;
								end if;
							end if;
						end if;
					when fs_nxttrack =>
						if(haddr=x"00000000")then
							if(trackno<tracks)then
								trackno<=trackno+1;
								tbladdr<=trackno+x"09";
								swait:=2;
							else
								fddone<='1';
								fdstate<=fs_IDLE;
							end if;
						else
							fdstate<=fs_loadshead;
						end if;
					when fs_scantrack =>
						if(trackbusy='0')then
							if(haddr=x"00000000")then
								fdstate<=fs_savenexttrack;
							elsif(track_curaddr<tracklen)then
								ambuf3:=ambuf2;
								ambuf2:=ambuf1;
								ambuf1:=ambuf0;
								ambuf0:=trackrddat(9 downto 0);

								if(ambuf3=("11" & x"a1") and ambuf2=("11" & x"a1") and ambuf1=("11" & x"a1") and ambuf0=("10" & x"fe"))then
									sectcount<=sectcount+1;
								elsif(ambuf0=("01" & x"fe"))then
									sectcount<=sectcount+1;
								end if;
								trackwrote<=trackwrote or trackrddat(10);
								track_curaddr<=track_curaddr+1;
								trackrd<='1';
								swait:=2;
							else
								track_curaddr<=(others=>'0');
								numsect<=sectcount;
								sectcount<=(others=>'0');
								cursecthead<=haddr;
								if(trackwrote='1')then
									ambuf0:=(others=>'0');
									ambuf1:=(others=>'0');
									ambuf2:=(others=>'0');
									ambuf3:=(others=>'0');
									trackrd<='1';
									swait:=2;
									fdstate<=fs_scaniam;
								else
									fdstate<=fs_savenexttrack;
								end if;
							end if;
						end if;
					when fs_scaniam =>
						if(trackbusy='0' and crcbusy='0')then
							ambuf3:=ambuf2;
							ambuf2:=ambuf1;
							ambuf1:=ambuf0;
							ambuf0:=trackrddat(9 downto 0);
							crcclr<='1';
							if(ambuf3=("11" & x"a1") and ambuf2=("11" & x"a1") and ambuf1=("11" & x"a1") and ambuf0=("10" & x"fe"))then
								crcwrdat<=x"a1";
								crcwr<='1';
								fdstate<=fs_crciam0;
							elsif(ambuf0=("01" & x"fe"))then
								crcwrdat<=x"fe";
								crcwr<='1';
								fdstate<=fs_stC;
							end if;
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
						end if;
					when fs_crciam0 =>
						if(crcbusy='0')then
							crcwrdat<=x"a1";
							crcwr<='1';
							fdstate<=fs_crciam1;
						end if;
					when fs_crciam1 =>
						if(crcbusy='0')then
							crcwrdat<=x"a1";
							crcwr<='1';
							fdstate<=fs_crciam2;
						end if;
					when fs_crciam2 =>
						if(crcbusy='0')then
							crcwrdat<=x"fe";
							crcwr<='1';
							fdstate<=fs_stc;
						end if;
					when fs_stC =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							img_addr<=cursecthead+x"00";
							img_wrdat<=trackrddat(7 downto 0);
							img_wr<='1';
							crcwrdat<=trackrddat(7 downto 0);
							crcwr<='1';
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_stH;
						end if;
					when fs_stH =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							img_addr<=cursecthead+x"01";
							img_wrdat<=trackrddat(7 downto 0);
							img_wr<='1';
							crcwrdat<=trackrddat(7 downto 0);
							crcwr<='1';
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_stR;
						end if;
					when fs_stR =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							img_addr<=cursecthead+x"02";
							img_wrdat<=trackrddat(7 downto 0);
							img_wr<='1';
							crcwrdat<=trackrddat(7 downto 0);
							crcwr<='1';
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_stN;
						end if;
					when fs_stN =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							img_addr<=cursecthead+x"03";
							img_wrdat<=trackrddat(7 downto 0);
							img_wr<='1';
							crcwrdat<=trackrddat(7 downto 0);
							crcwr<='1';
							case trackrddat(7 downto 0) is
							when x"00" =>
								sectlen<=x"0080";
							when x"01" =>
								sectlen<=x"0100";
							when x"02" =>
								sectlen<=x"0200";
							when x"03" =>
								sectlen<=x"0400";
							when x"04" =>
								sectlen<=x"0800";
							when x"05" =>
								sectlen<=x"1000";
							when x"06" =>
								sectlen<=x"2000";
							when x"07" =>
								sectlen<=x"4000";
							when others =>
								sectlen<=x"0001";
							end case;
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_chkicrch;
						end if;
					when fs_chkicrch =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							if(trackrddat(7 downto 0)/=crcdat(15 downto 8))then
								sectstatus<=x"a0";
							else
								sectstatus<=x"00";
							end if;
							img_addr<=cursecthead+x"04";
							img_wrdat<=numsect(7 downto 0);
							img_wr<='1';
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_chkicrcl;
						end if;
					when fs_chkicrcl =>
						if(trackbusy='0' and img_busy='0')then
							if(trackrddat(7 downto 0)/=crcdat(7 downto 0))then
								sectstatus<=x"a0";
							end if;
							img_addr<=cursecthead+x"05";
							img_wrdat<=numsect(15 downto 8);
							img_wr<='1';
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
							fdstate<=fs_stmod;
						end if;
					when fs_stmod =>
						if(img_busy='0')then
							img_addr<=cursecthead+x"06";
							if(trackrddat(9)='1')then
								img_wrdat<=x"00";
							else
								img_wrdat<=x"40";
							end if;
							img_wr<='1';
							swait:=2;
							fdstate<=fs_stsectsizel;
						end if;
					when fs_stsectsizel =>
						if(img_busy='0')then
							img_addr<=cursecthead+x"0e";
							img_wrdat<=sectlen(7 downto 0);
							img_wr<='1';
							swait:=2;
							fdstate<=fs_stsectsizeh;
						end if;
					when fs_stsectsizeh =>
						if(img_busy='0')then
							img_addr<=cursecthead+x"0f";
							img_wrdat<=sectlen(15 downto 8);
							img_wr<='1';
							swait:=2;
							fdstate<=fs_scandam;
							ambuf0:=(others=>'0');
							ambuf1:=(others=>'0');
							ambuf2:=(others=>'0');
							ambuf3:=(others=>'0');
							crcclr<='1';
						end if;
					when fs_scandam =>
						if(trackbusy='0' and crcbusy='0')then
							ambuf3:=ambuf2;
							ambuf2:=ambuf1;
							ambuf1:=ambuf0;
							ambuf0:=trackrddat(9 downto 0);
							crcclr<='1';
							if(ambuf3=("11" & x"a1") and ambuf2=("11" & x"a1") and ambuf1=("11" & x"a1") and ambuf0=("10" & x"f8"))then
								deleted<='1';
								crcwrdat<=x"a1";
								crcwr<='1';
								fdstate<=fs_crcdam0;
							elsif(ambuf3=("11" & x"a1") and ambuf2=("11" & x"a1") and ambuf1=("11" & x"a1") and ambuf0=("10" & x"fb"))then
								deleted<='0';
								crcwrdat<=x"a1";
								crcwr<='1';
								fdstate<=fs_crcdam0;
							elsif(ambuf0=("01" & x"f8"))then
								deleted<='1';
								fdstate<=fs_stdat;
								crcwrdat<=x"f8";
								crcwr<='1';
							elsif(ambuf0=("01" & x"fb"))then
								deleted<='0';
								fdstate<=fs_stdat;
								crcwrdat<=x"fb";
								crcwr<='1';
							end if;
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
							swait:=2;
						end if;
					when fs_crcdam0 =>
						if(crcbusy='0')then
							crcwrdat<=x"a1";
							crcwr<='1';
							fdstate<=fs_crcdam1;
						end if;
					when fs_crcdam1 =>
						if(crcbusy='0')then
							crcwrdat<=x"a1";
							crcwr<='1';
							fdstate<=fs_crcdam2;
						end if;
					when fs_crcdam2 =>
						if(crcbusy='0')then
							if(deleted='1')then
								crcwrdat<=x"f8";
							else
								crcwrdat<=x"fb";
							end if;
							crcwr<='1';
							fdstate<=fs_stdat;
						end if;
					when fs_stdat =>
						if(trackbusy='0' and img_busy='0' and crcbusy='0')then
							if(sectlen>x"0000")then
								img_addr<=img_addr+1;
								img_wrdat<=trackrddat(7 downto 0);
								img_wr<='1';
								crcwrdat<=trackrddat(7 downto 0);
								crcwr<='1';
								sectlen<=sectlen-1;
							else
								nxtsecthead<=img_addr+1;
								if(deleted='1')then
									sectstatus<=x"10";
								elsif(trackrddat(7 downto 0)/=crcdat(15 downto 8))then
									sectstatus<=x"b0";
								end if;
								fdstate<=fs_chkdatcrc;
							end if;
							track_curaddr<=track_curaddr+1;
							trackrd<='1';
						end if;
					when fs_chkdatcrc =>
						if(trackbusy='0' and img_busy='0')then
							if(trackrddat(7 downto 0)/=crcdat(7 downto 0))then
								sectstatus<=x"b0";
							end if;
							img_addr<=cursecthead+x"07";
							if(deleted='1')then
								img_wrdat<=x"10";
							else
								img_wrdat<=x"00";
							end if;
							img_wr<='1';
							swait:=2;
							fdstate<=fs_ststatus;
						end if;
					when fs_ststatus =>
						if(img_busy='0')then
							img_addr<=cursecthead+x"08";
							img_wrdat<=sectstatus;
							img_wr<='1';

							if((sectcount+1)<numsect)then
								sectcount<=sectcount+1;
								cursecthead<=nxtsecthead;
								ambuf0:=(others=>'0');
								ambuf1:=(others=>'0');
								ambuf2:=(others=>'0');
								ambuf3:=(others=>'0');
								trackrd<='1';
								swait:=2;
								fdstate<=fs_scaniam;
							else
								fdstate<=fs_savenexttrack;
							end if;
						end if;
					when fs_savenexttrack =>
						if((trackno+1)<tracks)then
							trackno<=trackno+1;
							tbladdr<=trackno+x"09";
							ambuf0:=(others=>'0');
							ambuf1:=(others=>'0');
							ambuf2:=(others=>'0');
							ambuf3:=(others=>'0');
							trackwrote<='0';
							trackrd<='1';
							track_curaddr<=(others=>'0');
							sectcount<=(others=>'0');
							swait:=2;
							fdstate<=fs_scantrack;
						else
							img_sync<='1';
							swait:=2;
							fdstate<=fs_saveend;
						end if;
					when fs_saveend =>
						if(img_busy='0')then
							fddone<='1';
							fdstate<=fs_idle;
						end if;
					when others =>
					end case;
				end if;
			end if;
		end if;
	end process;

	tracklen<=	x"00000c35"	when diskmode="00" and mfm='0' else
					x"00000c35" when diskmode="01" and mfm='0' else
					x"0000186a" when diskmode="10" and mfm='0' else
					x"00001d4c" when diskmode="11" and mfm='0' else
					x"0000186a" when diskmode="00" and mfm='1' else
					x"0000186a" when diskmode="01" and mfm='1' else
					x"000030d4" when diskmode="10" and mfm='1' else
					x"00003a98" when diskmode="11" and mfm='1' else
					x"00000000";
	tracks<=	x"52" when diskmode="00" else
				x"a4" when diskmode="01" else
				x"a4" when diskmode="10" else
				x"a4" when diskmode="11" else
				x"00";

		CRCG	:CRCGENN generic map(8,16) port map(
		POLY	=>"10000100000010001",
		DATA	=>crcwrdat,
		DIR		=>'0',
		WRITE	=>crcwr,
		BITIN	=>'0',
		BITWR	=>'0',
		CLR		=>crcclr,
		CLRDAT	=>x"ffff",
		CRC		=>crcdat,
		BUSY	=>crcbusy,
		DONE	=>open,
		CRCZERO	=>open,

		clk		=>sclk,
		ce      =>sys_ce,
		rstn	=>rstn
	);


	fec	:fecbuf port map(
		address_a		=>fbaddr,
		address_b		=>fec_ramaddrl,
		clock_a			=>sclk,
		clock_b			=>rclk,
		data_a			=>trackwrdat,
		data_b			=>fec_ramwdat,
		wren_a			=>fbwr and sys_ce,
		wren_b			=>fec_ramwe and ram_ce,
		q_a				=>trackrddat,
		q_b				=>fec_ramrdat
	);

	trackaddr<=	cur_unit & trackno(6 downto 1) & '0' & trackno(0) & track_curaddr when diskmode="00" else
					cur_unit & trackno & track_curaddr;

	fbaddr<=trackaddr(7 downto 0);

	process(sclk,rstn)
	variable wrote	:std_logic;
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				curfbhaddr<=(others=>'1');
				fbufstate<=ss_idle;
				fec_ramrd<='0';
				fec_ramwr<='0';
				fec_ramaddrh<=(others=>'0');
				fbwr<='0';
				wrote:='0';
			elsif(sys_ce = '1')then
				fbwr<='0';
				case fbufstate is
				when ss_idle =>
					if(trackrd='1')then
						if(curfbhaddr/=trackaddr(22 downto 8))then
							if(wrote='1')then
								fec_ramwr<='1';
								fbufstate<=ss_rwrite;
							else
								fec_ramaddrh<=trackaddr(22 downto 8);
								curfbhaddr<=trackaddr(22 downto 8);
								fec_ramrd<='1';
								fbufstate<=ss_read;
							end if;
						end if;
					elsif(trackwr='1')then
						if(curfbhaddr=trackaddr(22 downto 8))then
							fbwr<='1';
							wrote:='1';
						else
							if(wrote='1')then
								fec_ramwr<='1';
								fbufstate<=ss_write;
							else
								fec_ramaddrh<=trackaddr(22 downto 8);
								curfbhaddr<=trackaddr(22 downto 8);
								fec_ramrd<='1';
								fbufstate<=ss_wread;
							end if;
						end if;
					elsif(tracksync='1')then
						if(wrote='1')then
							fec_ramwr<='1';
							fbufstate<=ss_sync;
						end if;
					end if;
				when ss_rwrite =>
					if(fec_rambusy='1')then
						fec_ramwr<='0';
						fbufstate<=ss_rwrite2;
					end if;
				when ss_rwrite2 =>
					if(fec_rambusy='0')then
						fec_ramaddrh<=trackaddr(22 downto 8);
						curfbhaddr<=trackaddr(22 downto 8);
						fec_ramrd<='1';
						fbufstate<=ss_read;
					end if;
				when ss_read =>
					if(fec_rambusy='1')then
						fec_ramrd<='0';
						fbufstate<=ss_read2;
					end if;
				when ss_read2 =>
					if(fec_rambusy='0')then
						fbufstate<=ss_idle;
						wrote:='0';
					end if;
				when ss_write =>
					if(fec_rambusy='1')then
						fec_ramwr<='0';
						fbufstate<=ss_write2;
					end if;
				when ss_write2 =>
					if(fec_rambusy='0')then
						fec_ramaddrh<=trackaddr(22 downto 8);
						curfbhaddr<=trackaddr(22 downto 8);
						fec_ramrd<='1';
						wrote:='0';
						fbufstate<=ss_wread;
					end if;
				when ss_wread =>
					if(fec_rambusy='1')then
						fec_ramrd<='0';
						fbufstate<=ss_wread2;
					end if;
				when ss_wread2 =>
					if(fec_rambusy='0')then
						fbwr<='1';
						wrote:='1';
						fbufstate<=ss_idle;
					end if;
				when ss_sync =>
					if(fec_rambusy='1')then
						fec_ramwr<='0';
						fbufstate<=ss_sync2;
					end if;
				when ss_sync2 =>
					if(fec_rambusy='0')then
						wrote:='0';
						fbufstate<=ss_idle;
					end if;
				when others =>
					fbufstate<=ss_idle;
				end case;
			end if;
		end if;
	end process;

	trackbusy<=	'1' when trackrd='1' else
				'1' when trackwr='1' else
				'1' when tracksync='1' else
				'0' when fbufstate=ss_idle else
				'1';

	--mfm0m<=	fdc_mfm when fdc_wrenn='0' else mfm0;
	--mfm1m<=	fdc_mfm when fdc_wrenn='0' else mfm1;

	fdc_usel<=	"00" when fdc_useln="10" else
					"01" when fdc_useln="01" else
					"10";
	fdc_wprotn<=not wrprot(0) when fdc_useln="10" else
					not wrprot(1) when fdc_useln="01" else
					'1';
	fdc_motoren<=	not fdc_motorn(0) when fdc_useln(0)='0' else
						not fdc_motorn(1) when fdc_useln(1)='0' else
						'0';

	fde_ramaddr<=fde_ramaddrw(22 downto 0);
	fde	:FDemu generic map(fclkfreq,fdwait) port map(
		ramaddr		=>fde_ramaddrw,
		ramrdat		=>fde_ramrdat,
		ramwdat		=>fde_ramwdat,
		ramwr			=>fde_ramwr,
		ramwait		=>fde_ramwait,

		rdfdmode		=>"0000" & diskmode1 & diskmode0,
		--curfdmode	=>fde_wrmode,
		modeset		=>"00" & fde_modeset,
		--wrote			=>fde_wrote,
		wprot			=>"00" & wrprot,
		tracklen		=>fde_tracklen,

		USEL			=>fdc_usel,
		MOTOR			=>fdc_motoren,
		WRENn			=>fdc_wrenn,
		WRBITn		=>fdc_wrbitn,
		WRFDMODE		=>fdc_dencity & fdc_trackwid,
		WRMFM			=>fdc_mfm,
		RDBITn		=>fde_rdbitn,
		STEPn			=>fdc_stepn,
		SDIRn			=>fdc_sdirn,
		track0n		=>fde_track0n,
		indexn		=>fde_indexn,
		siden			=>fdc_siden,

		clk			=>fclk,
		ce          =>fd_ce,
		rstn			=>rstn
	);
	fdc_track0n<=	fde_track0n when fdc_useln="10" else
						fde_track0n when fdc_useln="01" else
						'1';
	fdc_indexn<=	fde_indexn	when fdc_useln="10" else
						fde_indexn	when fdc_useln="01" else
						'1';
	fdc_rdbitn<=	fde_rdbitn	when fdc_useln="10" else
						fde_rdbitn	when fdc_useln="01" else
						'1';

	fdc_readyn<=fdc_motorn(0) when fdc_indiskb(0)='1' and fdc_useln(0)='0' else
					fdc_motorn(1) when fdc_indiskb(1)='1' and fdc_useln(1)='0' else
					'1';
	fdc_indisk<=fdc_indiskb;

	sasi_idsel<=	"00000001" when sasien='1' else
						"00000000";

	sasi	:sasidev port map(
		IDAT	=>sasi_din,
		ODAT	=>sasi_dout,
		SEL	=>sasi_sel,
		BSY	=>sasi_bsy,
		REQ	=>sasi_req,
		ACK	=>sasi_ack,
		IO		=>sasi_io,
		CD		=>sasi_cd,
		MSG	=>sasi_msg,
		RST	=>sasi_rst,

		idsel	=>sasi_idsel,

		id		=>open,
		unit	=>open,
		capacity	=>sasi_cap,
		lba		=>sasi_lba,
		rdreq		=>sasi_rdreq,
		wrreq		=>sasi_wrreq,
		sectaddr	=>sasi_sectaddr,
		rddat		=>sasi_sectrddat,
		wrdat		=>sasi_sectwrdat,
		sectbusy	=>sasi_bufbusy,

		clk		=>sclk,
		ce      =>sys_ce,
		rstn		=>rstn
	);

	sasisectwr<=	mist_buffwr when emustate=es_sasi else '0';

	sasibuf	:sectram port map(
		address_a		=>mist_buffaddr,
		address_b		=>sasi_lba(0) & sasi_sectaddr,
		clock				=>sclk,
		data_a			=>mist_buffdout,
		data_b			=>sasi_sectwrdat,
		wren_a			=>sasisectwr,
		wren_b			=>sasibufwr and sys_ce,
		q_a				=>sasi_bufodat,
		q_b				=>sasi_sectrddat
	);

	mist_buffdin<=	sbuf_odat		when emustate=es_fload0 else
						sbuf_odat		when emustate=es_fload1 else
						sbuf_odat		when emustate=es_fsave0 else
						sbuf_odat		when emustate=es_fsave1 else
						sasi_bufodat	when emustate=es_sasi else
						sram_bufout		when emustate=es_sload else
						sram_bufout		when emustate=es_ssave else
						(others=>'0');

	process(sclk,rstn)
	variable wrote	:std_logic;
	variable swait	:integer range 0 to 2;
	begin
		if rising_edge(sclk) then
			if(rstn='0')then
				sasibufstate<=ss_idle;
				lba_sasi<=(others=>'0');
				cur_slba<=(others=>'1');
				wrote:='0';
				mist_rd(bit_sasi)<='0';
				mist_wr(bit_sasi)<='0';
				sasibufwr<='0';
				sasidone<='0';
				swait:=0;
			elsif(sys_ce = '1')then
				sasibufwr<='0';
				sasidone<='0';
				if(swait>0)then
					swait:=swait-1;
				else
					case sasibufstate is
					when ss_idle =>
						if(sasi_rdreq2='1')then
							if(sasi_lba(20 downto 1)/=cur_slba(19 downto 0))then
								if(wrote='1')then
									mist_wr(bit_sasi)<='1';
									sasibufstate<=ss_rwrite;
								else
									cur_slba<=allzero(31 downto 20) & sasi_lba(20 downto 1);
									lba_sasi<=allzero(31 downto 20) & sasi_lba(20 downto 1);
									mist_rd(bit_sasi)<='1';
									sasibufstate<=ss_read;
								end if;
							else
								sasidone<='1';
							end if;
						elsif(sasi_wrreq2='1')then
							if(sasi_lba(20 downto 1)=cur_slba(19 downto 0))then
								sasibufwr<='1';
								sasidone<='1';
							else
								if(wrote='1')then
									mist_wr(bit_sasi)<='1';
									sasibufstate<=ss_write;
								else
									cur_slba<=allzero(31 downto 20) & sasi_lba(20 downto 1);
									lba_sasi<=allzero(31 downto 20) & sasi_lba(20 downto 1);
									mist_rd(bit_sasi)<='1';
									sasibufstate<=ss_wread;
								end if;
							end if;
						elsif(sasi_syreq2='1')then
							if(wrote='1')then
								mist_wr(bit_sasi)<='1';
								sasibufstate<=ss_sync;
							else
								sasidone<='1';
							end if;
						end if;
					when ss_rwrite =>
						if(mist_ack(bit_sasi)='1')then
							mist_wr(bit_sasi)<='0';
							sasibufstate<=ss_rwrite2;
						end if;
					when ss_rwrite2 =>
						if(mist_ack(bit_sasi)='0')then
							wrote:='0';
							cur_slba<=allzero(31 downto 20) & sasi_lba(20 downto 1);
							lba_sasi<=allzero(31 downto 20) & sasi_lba(20 downto 1);
							mist_rd(bit_sasi)<='1';
							sasibufstate<=ss_read;
						end if;
					when ss_read =>
						if(mist_ack(bit_sasi)='1')then
							mist_rd(bit_sasi)<='0';
							sasibufstate<=ss_read2;
						end if;
					when ss_read2 =>
						if(mist_ack(bit_sasi)='0')then
							sasidone<='1';
							sasibufstate<=ss_idle;
						end if;
					when ss_write =>
						if(mist_ack(bit_sasi)='1')then
							mist_wr(bit_sasi)<='0';
							sasibufstate<=ss_write2;
						end if;
					when ss_write2 =>
						if(mist_ack(bit_sasi)='0')then
							cur_slba<=allzero(31 downto 20) & sasi_lba(20 downto 1);
							lba_sasi<=allzero(31 downto 20) & sasi_lba(20 downto 1);
							mist_rd(bit_sasi)<='1';
							wrote:='0';
							sasibufstate<=ss_wread;
						end if;
					when ss_wread =>
						if(mist_ack(bit_sasi)='1')then
							mist_rd(bit_sasi)<='0';
							sasibufstate<=ss_wread2;
						end if;
					when ss_wread2 =>
						if(mist_ack(bit_sasi)='0')then
							sasibufwr<='1';
							wrote:='1';
							sasidone<='1';
							sasibufstate<=ss_idle;
						end if;
					when ss_sync =>
						if(mist_ack(bit_sasi)='1')then
							mist_wr(bit_sasi)<='0';
							sasibufstate<=ss_sync2;
						end if;
					when ss_sync2 =>
						if(mist_ack(bit_sasi)='0')then
							wrote:='0';
							sasidone<='1';
							sasibufstate<=ss_idle;
						end if;
					when others =>
						sasibufstate<=ss_idle;
					end case;
				end if;
			end if;
		end if;
	end process;

	sramwr<=	"00" when sram_wp='0' else
				"00" when sram_cs='0' else
				sram_wr;

	sram_bufwr<=	mist_buffwr when emustate=es_sload else
						mist_buffwr	when emustate=es_ssave else
						'0';

	sram	:sramcont port map(
		addr	=>sram_addr,
		rdat	=>sram_rdat,
		wdat	=>sram_wdat,
		wr		=>sramwr,

		ldreq		=>sram_ldreq,
		streq		=>sram_streq,
		done		=>sramdone,

		mist_rd	=>mist_rd(bit_sram),
		mist_wr	=>mist_wr(bit_sram),
		mist_ack	=>mist_ack(bit_sram),

		mist_lba		=>lba_sram,
		mist_addr	=>mist_buffaddr,
		mist_wdat	=>mist_buffdout,
		mist_rdat	=>sram_bufout,
		mist_we		=>sram_bufwr,

		clk		=>sclk,
		ce      =>sys_ce,
		rstn		=>rstn
	);

end rtl;


