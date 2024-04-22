library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;

entity pce_top is
	generic (
		LITE : integer := 0
	);
	port(
		RESET			: in  std_logic;
		COLD_RESET	: in  std_logic;
		CLK 			: in  std_logic;

		ROM_RD		: out std_logic;
		ROM_RDY		: in  std_logic;
		ROM_A 		: out std_logic_vector(21 downto 0);
		ROM_DO 		: in  std_logic_vector(7 downto 0);
		ROM_SZ 		: in  std_logic_vector(11 downto 0);
		ROM_POP		: in  std_logic;
		ROM_CLKEN	: out std_logic;

		BRM_A 		: out std_logic_vector(10 downto 0);
		BRM_DI 		: out std_logic_vector(7 downto 0);
		BRM_DO 		: in  std_logic_vector(7 downto 0);
		BRM_WE 		: out std_logic;

		GG_EN			: in  std_logic;
		GG_CODE		: in  std_logic_vector(128 downto 0);
		GG_RESET		: in  std_logic;
		GG_AVAIL		: out std_logic;

		SP64			: in  std_logic;
		SGX			: in  std_logic;

		JOY_OUT     : out std_logic_vector(1 downto 0);
		JOY_IN      : in  std_logic_vector(3 downto 0);

		CD_EN			: in  std_logic;
		CD_RAM_A 	: out std_logic_vector(21 downto 0);
		CD_RAM_DO 	: out std_logic_vector(7 downto 0);
		CD_RAM_DI 	: in  std_logic_vector(7 downto 0);
		CD_RAM_RD	: out std_logic;
		CD_RAM_WR	: out std_logic;
		AC_EN			: in  std_logic;

		CD_STAT		: in  std_logic_vector(7 downto 0);
		CD_MSG		: in  std_logic_vector(7 downto 0);
		CD_STAT_GET	: in  std_logic;

		CD_COMM		: out std_logic_vector(95 downto 0);
		CD_COMM_SEND: out std_logic;

		CD_DOUT_REQ	: in  std_logic;
		CD_DOUT		: out std_logic_vector(79 downto 0);
		CD_DOUT_SEND: out std_logic;

		CD_REGION   : in  std_logic;
		CD_RESET		: out std_logic;

		CD_DATA		: in  std_logic_vector(7 downto 0);
		CD_WR			: in  std_logic;
		CD_DATA_END	: out std_logic;
		CD_DM			: in  std_logic;

		CDDA_SL		: out signed(15 downto 0);
		CDDA_SR		: out signed(15 downto 0);
		ADPCM_S		: out signed(15 downto 0);
		PSG_SL		: out signed(15 downto 0);
		PSG_SR		: out signed(15 downto 0);

		BG_EN			: in  std_logic;
		SPR_EN		: in  std_logic;
		GRID_EN		: in  std_logic_vector(1 downto 0);
		CPU_PAUSE_EN: in  std_logic;

		BORDER_EN	: in  std_logic;
		ReducedVBL	: in  std_logic;
		DOTCLOCK_DIVIDER  : out std_logic_vector(1 downto 0);
		VIDEO_R		: out std_logic_vector(2 downto 0);
		VIDEO_G		: out std_logic_vector(2 downto 0);
		VIDEO_B		: out std_logic_vector(2 downto 0);
		VIDEO_BW		: out std_logic;
		VIDEO_CE		: out std_logic;
		VIDEO_CE_FS	: out std_logic;
		VIDEO_VS		: out std_logic;
		VIDEO_HS		: out std_logic;
		VIDEO_HBL	: out std_logic;
		VIDEO_VBL	: out std_logic;

		BORDER_OUT : out std_logic
	);
end pce_top;

architecture rtl of pce_top is

signal RESET_N			: std_logic := '0';

-- CPU signals
signal CPU_CE			: std_logic;
signal CPU_CE2			: std_logic;
signal CPU_RD_N		: std_logic;
signal CPU_WR_N		: std_logic;
signal CPU_DI			: std_logic_vector(7 downto 0);
signal CPU_DO			: std_logic_vector(7 downto 0);
signal CPU_A			: std_logic_vector(20 downto 0);
signal CPU_CLKEN		: std_logic;
signal CPU_VCE_SEL_N	: std_logic;
signal CPU_VDC_SEL_N	: std_logic;
signal CPU_RAM_SEL_N	: std_logic;
signal CPU_BRM_SEL_N	: std_logic;
signal CPU_IO_DO		: std_logic_vector(7 downto 0);

signal CPU_VDC0_SEL_N: std_logic;
signal CPU_VDC1_SEL_N: std_logic;
signal CPU_VPC_SEL_N	: std_logic;

signal CPU_ROM_SEL_N	: std_logic;

-- RAM signals
signal RAM_DO			: std_logic_vector(7 downto 0);
signal RAM_A			: std_logic_vector(14 downto 0);

signal PRAM_DO			: std_logic_vector(7 downto 0);
signal CPU_PRAM_SEL_N: std_logic;

-- VCE signals
signal VCE_DO			: std_logic_vector(7 downto 0);

-- VDC signals
signal VDC0_DO			: std_logic_vector(7 downto 0);
signal VDC0_BUSY_N	: std_logic;
signal VDC0_IRQ_N		: std_logic;
signal VDC0_COLNO		: std_logic_vector(8 downto 0);
signal VDC1_DO			: std_logic_vector(7 downto 0);
signal VDC1_BUSY_N	: std_logic;
signal VDC1_IRQ_N		: std_logic;
signal VDC1_COLNO		: std_logic_vector(8 downto 0);
signal VDC_CLKEN		: std_logic;
signal VPC_DO			: std_logic_vector(7 downto 0);
signal VDCNUM    		: std_logic;
signal VDC_COLNO		: std_logic_vector(8 downto 0);

-- CD signals
signal CD_SEL_N		: std_logic;
signal CD_DO			: std_logic_vector(7 downto 0);
signal CD_IRQ_N    	: std_logic;

-- NTSC/RGB Video Output
signal VS_N				: std_logic;
signal HS_N				: std_logic;

signal PCE_SL			: std_logic_vector(23 downto 0);
signal PCE_SR			: std_logic_vector(23 downto 0);

signal rombank			: std_logic_vector(1 downto 0);

signal gamepad_out	: std_logic_vector(1 downto 0);
signal gamepad_port	: unsigned(2 downto 0);
signal gamepad_nibble: std_logic;

signal GENIE		: boolean;
signal GENIE_DO	: std_logic_vector(7 downto 0);
signal GENIE_DI   : std_logic_vector(7 downto 0);

component CODES is
	generic(
		ADDR_WIDTH  : in integer := 16;
		DATA_WIDTH  : in integer := 8
	);
	port(
		clk         : in  std_logic;
		reset       : in  std_logic;
		enable      : in  std_logic;
		addr_in     : in  std_logic_vector(20 downto 0);
		data_in     : in  std_logic_vector(7 downto 0);
		code        : in  std_logic_vector(128 downto 0);
		available   : out std_logic;
		genie_ovr   : out boolean;
		genie_data  : out std_logic_vector(7 downto 0)
	);
end component;

signal VCE_HS_F, VCE_HS_R, VCE_VS_F, VCE_VS_R: std_logic;
signal VRAM0_A	   : std_logic_vector(15 downto 0);
signal VRAM0_DI	: std_logic_vector(15 downto 0);
signal VRAM0_DO	: std_logic_vector(15 downto 0);
signal VRAM0_WE	: std_logic;
signal VRAM1_A	   : std_logic_vector(15 downto 0);
signal VRAM1_DI	: std_logic_vector(15 downto 0);
signal VRAM1_DO	: std_logic_vector(15 downto 0);
signal VRAM1_WE	: std_logic;
signal CLR_A	   : std_logic_vector(14 downto 0);
signal CLR_WE		: std_logic;
signal VCE_DCC		: std_logic_vector(1 downto 0);
signal VDC0_BORDER: std_logic;
signal VDC0_GRID	: std_logic_vector(1 downto 0);
signal CPU_PRE_RD	: std_logic;
signal CPU_PRE_WR	: std_logic;
signal CD_RAM_CS_N: std_logic;
signal CD_BRAM_EN	: std_logic;

signal BORDER		: std_logic;
signal GRID			: std_logic_vector(1 downto 0);

signal AC_SEL_N   : std_logic;
signal AC_RAM_CS_N: std_logic;
signal AC_RAM_A   : std_logic_vector(20 downto 0);
signal AC_DO      : std_logic_vector(7 downto 0);

component ARCADE_CARD is
	port(
		CLK     : in  std_logic;
		RST_N   : in  std_logic;

		EN      : in  std_logic;
		WR_N    : in  std_logic;
		RD_N    : in  std_logic;
		A       : in  std_logic_vector(20 downto 0);
		DI      : in  std_logic_vector(7 downto 0);
		DO      : out std_logic_vector(7 downto 0);

		SEL_N   : out std_logic;

		RAM_CS_N: out std_logic;
		RAM_A   : out std_logic_vector(20 downto 0)
	);
end component;

begin

	BORDER_OUT <= VDC0_BORDER;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

generate_CHEAT: if (LITE = 0) generate begin

-- Game Genie
GAMEGENIE : component CODES
generic map(
	ADDR_WIDTH => 21,
	DATA_WIDTH => 8
)
port map(
	clk => CLK,
	reset => GG_RESET,
	enable => not GG_EN,
	addr_in => CPU_A,
	data_in => CPU_DI,
	code => GG_CODE,
	available => GG_AVAIL,
	genie_ovr => GENIE,
	genie_data => GENIE_DO
);

GENIE_DI <= GENIE_DO when GENIE else CPU_DI;

end generate;

generate_NOCHEAT: if (LITE /= 0) generate begin
	GENIE_DI <= CPU_DI;
	GG_AVAIL <= '0';
end generate;

CPU : entity work.HUC6280
port map(
	CLK 		=> CLK,
	RST_N		=> RESET_N,
	WAIT_N	=> ROM_RDY and not CPU_PAUSE_EN,

	IRQ1_N	=> VDC0_IRQ_N and VDC1_IRQ_N,
	IRQ2_N	=> CD_IRQ_N,
	NMI_N		=> '1',

	DI			=> GENIE_DI,
	DO 		=> CPU_DO,

	A 			=> CPU_A,
	WR_N 		=> CPU_WR_N,
	RD_N		=> CPU_RD_N,

	RDY		=> VDC0_BUSY_N and VDC1_BUSY_N,

	CE			=> CPU_CE,
	CEK_N		=> CPU_VCE_SEL_N,
	CE7_N		=> CPU_VDC_SEL_N,
	CER_N		=> CPU_RAM_SEL_N,
	PRE_RD   => CPU_PRE_RD,
	PRE_WR   => CPU_PRE_WR,

	K			=> not CD_EN & "011" & JOY_IN,
	O			=> CPU_IO_DO,

	VDCNUM   => VDCNUM,

	AUD_LDATA=> PCE_SL,
	AUD_RDATA=> PCE_SR
);

JOY_OUT <= CPU_IO_DO(1 downto 0);

CPU_CLKEN <= CPU_CE when rising_edge( CLK );

VIDEO_CE <= VDC_CLKEN;
VIDEO_VS <= not VS_N;
VIDEO_HS <= not HS_N;

DOTCLOCK_DIVIDER <= VCE_DCC;

VCE : entity work.huc6260
port map(
	CLK 		=> CLK,
	RESET_N	=> RESET_N,

	-- CPU Interface
	A			=> CPU_A(2 downto 0),
	CE_N		=> CPU_VCE_SEL_N,
	WR_N		=> CPU_WR_N,
	RD_N		=> CPU_RD_N,
	DI			=> CPU_DO,
	DO 		=> VCE_DO,

	-- VDC Interface
	COLNO		=> VDC_COLNO,
	CLKEN		=> VDC_CLKEN,
	CLKEN_FS => VIDEO_CE_FS,
	RVBL		=> ReducedVBL,
	DCC		=> VCE_DCC,
	
	GRID_EN	=> GRID_EN,
	BORDER_EN=> BORDER_EN,
	BORDER	=> BORDER,
	GRID		=> GRID,
		
	-- NTSC/RGB Video Output
	R			=> VIDEO_R,
	G			=> VIDEO_G,
	B			=> VIDEO_B,
	BW			=> VIDEO_BW,
	VS_N		=> VS_N,
	HS_N		=> HS_N,
	HBL		=> VIDEO_HBL,
	VBL		=> VIDEO_VBL,
	
	HS_F		=> VCE_HS_F,
	HS_R		=> VCE_HS_R,
	VS_F		=> VCE_VS_F,
	VS_R		=> VCE_VS_R
);

VDC0 : entity work.HUC6270
port map(
	CLK 		=> CLK,
	RST_N		=> RESET_N,
	CLR_MEM  => COLD_RESET,

	-- CPU Interface
	CPU_CE	=> CPU_CE,
	A			=> CPU_A(1 downto 0),
	CS_N		=> CPU_VDC0_SEL_N,
	WR_N		=> CPU_WR_N,
	RD_N		=> CPU_RD_N,
	DI			=> CPU_DO,
	DO 		=> VDC0_DO,
	BUSY_N	=> VDC0_BUSY_N,
	IRQ_N		=> VDC0_IRQ_N,

	-- VCE Interface
	DCK_CE	=> VDC_CLKEN,
	DCC		=> VCE_DCC,
	HS_F		=> VCE_HS_F,
	HS_R		=> VCE_HS_R,
	VS_F		=> VCE_VS_F,
	VS_R		=> VCE_VS_R,
	VD			=> VDC0_COLNO,
	
	BORDER	=> VDC0_BORDER,
	GRID		=> VDC0_GRID,
	SP64     => SP64,

	RAM_A		=> VRAM0_A,
	RAM_DI	=> VRAM0_DI,
	RAM_DO	=> VRAM0_DO,
	RAM_WE	=> VRAM0_WE,
	
	BG_EN		=> BG_EN,
	SPR_EN	=> SPR_EN
);

VRAM0 : entity work.dpram generic map (addr_width => 15, data_width => 16, disable_value => '0')
port map (
	clock		=> CLK,
	address_a=> VRAM0_A(14 downto 0),
	data_a	=> VRAM0_DO,
	cs_a		=> not VRAM0_A(15),
	wren_a	=> VRAM0_WE,
	q_a		=> VRAM0_DI,

	address_b=> CLR_A,
	data_b	=> (others => '0'),
	wren_b	=> CLR_WE
);

CLR_A  <= CLR_A + 1  when rising_edge(CLK);
CLR_WE <= COLD_RESET when rising_edge(CLK);

generate_SGX: if (LITE = 0) generate begin

	VDC1 : entity work.HUC6270
	port map(
		CLK 		=> CLK,
		CLR_MEM  => COLD_RESET,
		RST_N		=> RESET_N,

		-- CPU Interface
		CPU_CE	=> CPU_CE,
		A			=> CPU_A(1 downto 0),
		CS_N		=> CPU_VDC1_SEL_N,
		WR_N		=> CPU_WR_N,
		RD_N		=> CPU_RD_N,
		DI			=> CPU_DO,
		DO 		=> VDC1_DO,
		BUSY_N	=> VDC1_BUSY_N,
		IRQ_N		=> VDC1_IRQ_N,

		-- VCE Interface
		DCK_CE	=> VDC_CLKEN,
		DCC		=> VCE_DCC,
		HS_F		=> VCE_HS_F,
		HS_R		=> VCE_HS_R,
		VS_F		=> VCE_VS_F,
		VS_R		=> VCE_VS_R,
		VD			=> VDC1_COLNO,
		--GRID		=> VDC1_GRID,
		
		SP64     => SP64,
		
		RAM_A		=> VRAM1_A,
		RAM_DI	=> VRAM1_DI,
		RAM_DO	=> VRAM1_DO,
		RAM_WE	=> VRAM1_WE,

		BG_EN		=> BG_EN,
		SPR_EN	=> SPR_EN
	);

	VRAM1 : entity work.dpram generic map (addr_width => 15, data_width => 16, disable_value => '0')
	port map (
		clock		=> CLK,
		address_a=> VRAM1_A(14 downto 0),
		data_a	=> VRAM1_DO,
		cs_a		=> not VRAM1_A(15),
		wren_a	=> VRAM1_WE and not VRAM1_A(15),
		q_a		=> VRAM1_DI,

		address_b=> CLR_A,
		data_b	=> (others => '0'),
		wren_b	=> CLR_WE
	);

	VPC : entity work.huc6202
	port map(
		CLK 		=> CLK,
		CLKEN		=> VDC_CLKEN,
		RESET_N	=> RESET_N,

		-- CPU Interface
		A			=> CPU_A(2 downto 0),
		WR_N		=> CPU_WR_N or CPU_VPC_SEL_N or not CPU_CE,
		DI			=> CPU_DO,
		DO 		=> VPC_DO,
		
		HS_F		=> VCE_HS_F,
		VDC0_IN  => VDC0_COLNO,
		VDC1_IN  => VDC1_COLNO,
		VDC_OUT  => VDC_COLNO,
		
		SGX		=> SGX,

		VDCNUM   => VDCNUM
	);

	CPU_VDC0_SEL_N <= CPU_VDC_SEL_N or     CPU_A(3) or     CPU_A(4) when SGX = '1' else CPU_VDC_SEL_N;
	CPU_VDC1_SEL_N <= CPU_VDC_SEL_N or     CPU_A(3) or not CPU_A(4) when SGX = '1' else '1';
	CPU_VPC_SEL_N  <= CPU_VDC_SEL_N or not CPU_A(3) or     CPU_A(4) when SGX = '1' else '1';
	
	process( CLK )
	begin
		if rising_edge( CLK ) then
			if VDC_CLKEN = '1' then
				BORDER <= VDC0_BORDER;
				GRID <= VDC0_GRID;
			end if;
		end if;
	end process;

end generate;

generate_NOSGX: if (LITE /= 0) generate begin

	CPU_VDC0_SEL_N <= CPU_VDC_SEL_N;
	CPU_VDC1_SEL_N <= '1';
	CPU_VPC_SEL_N  <= '1';
	VDC1_BUSY_N <= '1';
	VDC1_IRQ_N <= '1';

	VDCNUM <= '0';
	VDC1_DO <= (others => '1');
	VPC_DO <= (others => '1');
	VDC_COLNO <= VDC0_COLNO;
	
	BORDER <= VDC0_BORDER;
	GRID <= VDC0_GRID;

end generate;

--TODO: check address mirroring for HuCard games
CPU_BRM_SEL_N <= '0' when CPU_A(20 downto 11) = x"F7"&"00" and CD_BRAM_EN = '1' else '1'; -- BRM : Page $F7

CPU_ROM_SEL_N <= CPU_A(20);

-- CPU data bus
CPU_DI <= RAM_DO        when CPU_RAM_SEL_N  = '0'
			else CD_DO     when CD_SEL_N       = '0'
			else CD_RAM_DI when CD_RAM_CS_N    = '0' or AC_RAM_CS_N = '0'
			else AC_DO     when AC_SEL_N       = '0'
			else BRM_DO    when CPU_BRM_SEL_N  = '0'
			else PRAM_DO   when CPU_PRAM_SEL_N = '0'
			else ROM_DO    when CPU_ROM_SEL_N  = '0'
			else VCE_DO    when CPU_VCE_SEL_N  = '0'
			else VDC0_DO   when CPU_VDC0_SEL_N = '0'
			else VDC1_DO   when CPU_VDC1_SEL_N = '0'
			else VPC_DO    when CPU_VPC_SEL_N  = '0'
			else X"FF";

-- Perform address mangling to mimic HuCard chip mapping.
-- 384K ROM, split in 3, mapped ABABCCCC
	                                     -- bits 19 downto 16
	-- 00000 -> 20000  => 00000 -> 20000		0000 -> 0000
	-- 20000 -> 40000  => 20000 -> 40000		0010 -> 0010
	-- 40000 -> 60000  => 00000 -> 20000		0100 -> 0000
	-- 60000 -> 80000  => 20000 -> 40000		0110 -> 0010
	-- 80000 -> A0000  => 40000 -> 60000		1000 -> 0100
	-- A0000 -> C0000  => 40000 -> 60000		1010 -> 0100
	-- C0000 -> E0000  => 40000 -> 60000		1100 -> 0100
	-- E0000 ->100000  => 40000 -> 60000		1110 -> 0100

-- 768K ROM, split in 6, mapped ABCDEFEF
				                            -- bits 19 downto 16
	-- 00000 -> 20000  => 00000 -> 20000		0000 -> 0000
	-- 20000 -> 40000  => 20000 -> 40000		0010 -> 0010
	-- 40000 -> 60000  => 40000 -> 60000		0100 -> 0100
	-- 60000 -> 80000  => 60000 -> 80000		0110 -> 0110
	-- 80000 -> A0000  => 80000 -> A0000		1000 -> 1000
	-- A0000 -> C0000  => A0000 -> C0000		1010 -> 1010
	-- C0000 -> E0000  => 80000 -> A0000		1100 -> 1000
	-- E0000 ->100000  => A0000 -> C0000		1110 -> 1010

--2560K ROM, ABCDEFGH, ABCDIJKL, ABCDMNOP, ABCDQRST = SF2
                                      -- bits 21 downto 19 (bank)
	-- 00000 -> 80000 XX => 00000 -> 80000		0 XX -> 000
	-- 80000 ->100000 00 => 80000 ->100000		1 00 -> 001
	-- 80000 ->100000 01 =>100000 ->180000		1 01 -> 010
	-- 80000 ->100000 10 =>180000 ->200000		1 10 -> 011
	-- 80000 ->100000 11 =>200000 ->280000		1 11 -> 100

-- 128K ROM, mapped AAAAAAAA -> simple repeat
-- 256K ROM, mapped ABABABAB -> simple repeat
-- 512K ROM, mapped ABCDABCD -> simple repeat
-- 1MB and others            -> Straight mapping

ROM_A <=   "00000"&CPU_A(16 downto 0)                                       when rom_sz = X"020" -- 128K
      else "0000"&CPU_A(17 downto 0)                                        when rom_sz = X"040" -- 256K
      else "000"&CPU_A(19)&(CPU_A(17) and not CPU_A(19))&CPU_A(16 downto 0) when rom_sz = X"060" -- 384K
      else "000"&CPU_A(18 downto 0)                                         when rom_sz = X"080" -- 512K
      else "00" &CPU_A(19)&(CPU_A(18) and not CPU_A(19))&CPU_A(17 downto 0) when rom_sz = X"0C0" -- 768K
      else (CPU_A(19) and (rombank(0) and rombank(1)))
          &(CPU_A(19) and (rombank(0) xor rombank(1)))
          &(CPU_A(19) and not rombank(0))&CPU_A(18 downto 0)                when rom_sz = X"280" -- SF2
      else "00"&CPU_A(19 downto 0);                                                             -- 1MB and others

ROM_RD    <= CPU_PRE_RD and not CPU_ROM_SEL_N and CPU_PRAM_SEL_N and ((AC_RAM_CS_N and CD_RAM_CS_N) or not CD_EN);
ROM_CLKEN <= CPU_CLKEN;

process( CLK ) begin
	if rising_edge( CLK ) then
		if RESET = '1' then
			rombank <= "00";
		elsif CPU_CE = '1' then
			-- CPU_A(12 downto 2) = X"7FC" means CPU_A & 0x1FFC = 0x1FF0
			if CPU_A(20) = '0' and ('0' & CPU_A(12 downto 2)) = X"7FC" and CPU_WR_N = '0' then
				rombank <= CPU_A(1 downto 0);
			end if;
		end if;
		RESET_N <= not RESET;
	end if;
end process;

PRAM : entity work.dpram generic map (15,8)
port map (
	clock		=> CLK,
	address_a=> CPU_A(14 downto 0),
	data_a	=> CPU_DO,
	wren_a	=> CPU_CE and not CPU_PRAM_SEL_N and not CPU_WR_N,
	q_a		=> PRAM_DO,

	address_b=> CLR_A,
	data_b	=> (others => '0'),
	wren_b	=> CLR_WE
);

CPU_PRAM_SEL_N <= CPU_A(20) or not CPU_A(19) or not ROM_POP;


RAM : entity work.dpram generic map (15,8)
port map (
	clock		=> CLK,
	address_a=> RAM_A(14 downto 0),
	data_a	=> CPU_DO,
	wren_a	=> CPU_CE and not CPU_RAM_SEL_N and not CPU_WR_N,
	q_a		=> RAM_DO,

	address_b=> CLR_A,
	data_b	=> (others => '0'),
	wren_b	=> CLR_WE
);

RAM_A(12 downto 0)  <= CPU_A(12 downto 0);
RAM_A(14 downto 13) <= CPU_A(14 downto 13) when SGX = '1' else "00";

-- Backup RAM
BRM_A <= CPU_A(10 downto 0);
BRM_DI <= CPU_DO;
BRM_WE <= CPU_CE and not CPU_BRM_SEL_N and not CPU_WR_N;


CD : entity work.cd
port map(
	CLK 			=> CLK,
	RST_N			=> RESET_N,
	EN				=> '0',

	EXT_A			=> CPU_A,
	EXT_DI		=> CPU_DO,
	EXT_DO		=> CD_DO,
	EXT_WR_N		=> CPU_WR_N,
	EXT_RD_N		=> CPU_RD_N,
	CPU_CE		=> CPU_CE,
	
	RAM_CS_N		=> CD_RAM_CS_N,
	BRAM_EN		=> CD_BRAM_EN,
	
	SEL_N			=> CD_SEL_N,
	IRQ_N			=> CD_IRQ_N,
	
	CD_STAT		=> CD_STAT,
	CD_MSG		=> CD_MSG,
	CD_STAT_GET	=> CD_STAT_GET,
	CD_COMM		=> CD_COMM,
	CD_COMM_SEND=> CD_COMM_SEND,
	CD_DOUT_REQ	=> CD_DOUT_REQ,
	CD_DOUT		=> CD_DOUT,
	CD_DOUT_SEND=> CD_DOUT_SEND,
	
	CD_DATA		=> CD_DATA,
	CD_WR			=> CD_WR,
	CD_DATA_END	=> CD_DATA_END,
	
	CD_REGION   => CD_REGION,
	CD_RESET		=> CD_RESET,
	
	DM				=> CD_DM,
	
	CD_SL			=> CDDA_SL,
	CD_SR			=> CDDA_SR,
	AD_S			=> ADPCM_S
);

CD_RAM_A  <= '0' & AC_RAM_A when AC_RAM_CS_N = '0' else "1000" & CPU_A(17 downto 0);
CD_RAM_DO <= CPU_DO;
CD_RAM_RD <= CPU_PRE_RD and not (CD_RAM_CS_N and AC_RAM_CS_N);
CD_RAM_WR <= CPU_PRE_WR and not (CD_RAM_CS_N and AC_RAM_CS_N);

AC : ARCADE_CARD
port map(
	CLK     => CLK,
	RST_N   => RESET_N,

	EN      => CD_EN and AC_EN,
	WR_N    => CPU_WR_N,
	RD_N    => CPU_RD_N,
	A       => CPU_A,
	DI      => CPU_DO,
	DO      => AC_DO,
	SEL_N   => AC_SEL_N,

	RAM_CS_N=> AC_RAM_CS_N,
	RAM_A   => AC_RAM_A
);

PSG_SR <= signed(PCE_SR(23 downto 8));
PSG_SL <= signed(PCE_SL(23 downto 8));

end rtl;
