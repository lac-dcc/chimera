library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;


entity Virtual_Toplevel is
	generic
	(
		colAddrBits : integer := 8;
		rowAddrBits : integer := 12
	);
	port(
		reset : in std_logic;
		CLK : in std_logic;
		SDR_CLK : in std_logic;

		DRAM_ADDR	: out std_logic_vector(rowAddrBits-1 downto 0);
		DRAM_BA_0	: out std_logic;
		DRAM_BA_1	: out std_logic;
		DRAM_CAS_N	: out std_logic;
		DRAM_CKE	: out std_logic;
		DRAM_CS_N	: out std_logic;
		DRAM_DQ		: inout std_logic_vector(15 downto 0);
		DRAM_LDQM	: out std_logic;
		DRAM_RAS_N	: out std_logic;
		DRAM_UDQM	: out std_logic;
		DRAM_WE_N	: out std_logic;
		
		DAC_LDATA : out std_logic_vector(15 downto 0);
		DAC_RDATA : out std_logic_vector(15 downto 0);
		
		VGA_R		: out std_logic_vector(7 downto 0);
		VGA_G		: out std_logic_vector(7 downto 0);
		VGA_B		: out std_logic_vector(7 downto 0);
		VGA_VS		: out std_logic;
		VGA_HS		: out std_logic;

		RS232_RXD : in std_logic;
		RS232_TXD : out std_logic;

		ps2k_clk_out : out std_logic;
		ps2k_dat_out : out std_logic;
		ps2k_clk_in : in std_logic;
		ps2k_dat_in : in std_logic;
		
		joya : in std_logic_vector(7 downto 0) := (others =>'1');
		joyb : in std_logic_vector(7 downto 0) := (others =>'1');
		joyc : in std_logic_vector(7 downto 0) := (others =>'1');
		joyd : in std_logic_vector(7 downto 0) := (others =>'1');
		joye : in std_logic_vector(7 downto 0) := (others =>'1');

		spi_miso		: in std_logic := '1';
		spi_mosi		: out std_logic;
		spi_clk		: out std_logic;
		spi_cs 		: out std_logic
	);
end entity;

architecture rtl of Virtual_Toplevel is

constant addrwidth : integer := rowAddrBits+colAddrBits+2;

-- signal GPIO_CLKCNT	: std_logic_vector(15 downto 0);
signal GPIO_CLKCNT	: unsigned(15 downto 0);

signal GPIO_SEL		: std_logic;

signal HEXVALUE		: std_logic_vector(15 downto 0);

signal PRE_RESET_N	: std_logic;
signal RSTCNT		: std_logic_vector(15 downto 0);
signal ROM_RESET_N	: std_logic := '0';
signal RESET_N		: std_logic := '0';

-- CPU signals
signal CPU_NMI_N	: std_logic;
signal CPU_IRQ1_N	: std_logic;
signal CPU_IRQ2_N	: std_logic;
signal CPU_RD_N		: std_logic;
signal CPU_WR_N		: std_logic;
signal CPU_DI		: std_logic_vector(7 downto 0);
signal CPU_DO		: std_logic_vector(7 downto 0);
signal CPU_A		: std_logic_vector(20 downto 0);
signal CPU_HSM		: std_logic;

signal CPU_CLKOUT	: std_logic;
signal CPU_CLKEN	: std_logic;
signal CPU_CLKRST	: std_logic;
signal CPU_RDY		: std_logic;

signal CPU_VCE_SEL_N	: std_logic;
signal CPU_VDC_SEL_N	: std_logic;
signal CPU_RAM_SEL_N	: std_logic;

signal CPU_IO_DI		: std_logic_vector(7 downto 0);  -- bit 6: country, bits 3-0: joypad data
signal CPU_IO_DO		: std_logic_vector(7 downto 0);  -- bit 1: clr, bit 0: sel

-- RAM signals
signal RAM_A		: std_logic_vector(12 downto 0);
signal RAM_DI		: std_logic_vector(7 downto 0);
signal RAM_WE		: std_logic;
signal RAM_DO		: std_logic_vector(7 downto 0);

-- ROM signals
signal HEADER		: std_logic;
signal SPLIT		: std_logic;
signal BITFLIP		: std_logic;

signal FL_RST_N_FF	: std_logic := '1';

-- VCE signals
signal VCE_DO		: std_logic_vector(7 downto 0);

-- VDC signals
signal VDC_DO		: std_logic_vector(7 downto 0);
signal VDC_BUSY_N	: std_logic;
signal VDC_IRQ_N	: std_logic;

-- NTSC/RGB Video Output
signal RED			: std_logic_vector(7 downto 0);
signal GREEN			: std_logic_vector(7 downto 0);
signal BLUE			: std_logic_vector(7 downto 0);		
signal VS_N			: std_logic;
signal HS_N			: std_logic;

-- VGA Video Output
signal VGA_RED			: std_logic_vector(7 downto 0);
signal VGA_GREEN			: std_logic_vector(7 downto 0);
signal VGA_BLUE			: std_logic_vector(7 downto 0);		
signal VGA_VS_N			: std_logic;
signal VGA_HS_N			: std_logic;

-- current video signal (switchable between TV and VGA)
signal vga_red_i : std_logic_vector(7 downto 0);
signal vga_green_i : std_logic_vector(7 downto 0);
signal vga_blue_i	: std_logic_vector(7 downto 0);		
signal vga_vsync_i : std_logic;
signal vga_hsync_i : std_logic;

-- VDC signals
signal VDC_COLNO	: std_logic_vector(8 downto 0);
signal VDC_CLKEN	: std_logic;


signal VDCBG_RAM_A	: std_logic_vector(15 downto 0);		
signal VDCBG_RAM_DO	: std_logic_vector(15 downto 0);
signal VDCBG_RAM_REQ	: std_logic;
signal VDCBG_RAM_ACK	: std_logic;
		
signal VDCSP_RAM_A	: std_logic_vector(15 downto 0);
signal VDCSP_RAM_DO	: std_logic_vector(15 downto 0);
signal VDCSP_RAM_REQ	: std_logic;
signal VDCSP_RAM_ACK	: std_logic;

signal VDCCPU_RAM_REQ	: std_logic;
signal VDCCPU_RAM_A	: std_logic_vector(15 downto 0);
signal VDCCPU_RAM_DO	: std_logic_vector(15 downto 0); -- Output from RAM
signal VDCCPU_RAM_DI	: std_logic_vector(15 downto 0);
signal VDCCPU_RAM_WE	: std_logic;
signal VDCCPU_RAM_ACK	: std_logic;

signal VDCDMA_RAM_REQ	: std_logic;
signal VDCDMA_RAM_A	: std_logic_vector(15 downto 0);
signal VDCDMA_RAM_DO	: std_logic_vector(15 downto 0); -- Output from RAM
signal VDCDMA_RAM_DI	: std_logic_vector(15 downto 0);
signal VDCDMA_RAM_WE	: std_logic;
signal VDCDMA_RAM_ACK	: std_logic;

signal VDCDMAS_RAM_REQ	: std_logic;
signal VDCDMAS_RAM_A		: std_logic_vector(15 downto 0);
signal VDCDMAS_RAM_DO		: std_logic_vector(15 downto 0); -- Output from RAM
signal VDCDMAS_RAM_ACK	: std_logic;


signal SDR_INIT_DONE	: std_logic;

type bootStates is (BOOT_READ_1, BOOT_READ_2, BOOT_WRITE_1, BOOT_WRITE_2, BOOT_WRITE_3, BOOT_WRITE_4, BOOT_REL, BOOT_DONE);
signal bootState : bootStates := BOOT_READ_1;
signal bootTimer : integer range 0 to 32767;

signal boot_a		: std_logic_vector(21 downto 0);
signal boot_oe_n	: std_logic;

signal romwr_req : std_logic := '0';
signal romwr_ack : std_logic;
signal romwr_a : unsigned(addrwidth downto 1);
signal romwr_d : std_logic_vector(15 downto 0);

signal romrd_req : std_logic := '0';
signal romrd_ack : std_logic;
signal romrd_a : std_logic_vector(addrwidth downto 3);
signal romrd_q : std_logic_vector(63 downto 0);
signal romrd_a_cached : std_logic_vector(addrwidth downto 3);
signal romrd_q_cached : std_logic_vector(63 downto 0);

signal host_reset_n : std_logic;
signal host_bootdone : std_logic;
signal rommap : std_logic_vector(1 downto 0);

signal boot_req : std_logic;
signal boot_ack : std_logic;
signal boot_data : std_logic_vector(15 downto 0);
signal FL_DQ : std_logic_vector(15 downto 0);

signal osd_window : std_logic;
signal osd_pixel : std_logic;

type romStates is (ROM_IDLE, ROM_READ);
signal romState : romStates := ROM_IDLE;

signal CPU_A_PREV : std_logic_vector(20 downto 0);
signal ROM_RDY	: std_logic;
signal ROM_DO	: std_logic_vector(7 downto 0);

signal SW : std_logic_vector(11 downto 0);
signal KEY : std_logic_vector(3 downto 0);

signal gp1emu : std_logic_vector(7 downto 0);
signal gp2emu : std_logic_vector(7 downto 0);

signal joya_merged : std_logic_vector(7 downto 0);
signal joyb_merged : std_logic_vector(7 downto 0);

signal gamepad_port : unsigned(2 downto 0);
signal multitap : std_logic :='1';
signal prev_sel : std_logic;

begin

-- Reset
PRE_RESET_N <= reset and SDR_INIT_DONE and host_reset_n;

-- Bit flipping switch
BITFLIP <= SW(2);
-- ROM splitting switch
SPLIT <= rommap(1);
multitap <= SW(4);

-- I/O
-- GPIO_1 <= (others => 'Z');


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- CPU
CPU : entity work.huc6280 port map(
	CLK 	=> CLK,
	RESET_N	=> RESET_N,
	
	NMI_N	=> CPU_NMI_N,
	IRQ1_N	=> CPU_IRQ1_N,
	IRQ2_N	=> CPU_IRQ2_N,

	DI		=> CPU_DI,
	DO 		=> CPU_DO,
	
	HSM		=> CPU_HSM,
	
	A 		=> CPU_A,
	WR_N 	=> CPU_WR_N,
	RD_N	=> CPU_RD_N,
	
	CLKOUT	=> CPU_CLKOUT,
	CLKRST	=> CPU_CLKRST,
	RDY		=> CPU_RDY,
	ROM_RDY	=> ROM_RDY,
	
	CEK_N	=> CPU_VCE_SEL_N,
	CE7_N	=> CPU_VDC_SEL_N,
	CER_N	=> CPU_RAM_SEL_N,
	
	K		=> CPU_IO_DI,
	O		=> CPU_IO_DO,
	
	DAC_LDATA => DAC_LDATA,
	DAC_RDATA => DAC_RDATA
);

-- RAM
RAM : entity work.ram port map(
	address	=> RAM_A,
	clock	=> CLK,
	data	=> RAM_DI,
	wren	=> RAM_WE,
	q		=> RAM_DO
);

VCE : entity work.huc6260 port map(
	CLK 		=> CLK,
	RESET_N		=> RESET_N,  -- Allow 6260 to emit sync signals even during reset.

	-- CPU Interface
	A			=> CPU_A(2 downto 0),
	CE_N		=> CPU_VCE_SEL_N,
	WR_N		=> CPU_WR_N,
	RD_N		=> CPU_RD_N,
	DI			=> CPU_DO,
	DO 			=> VCE_DO,
		
	-- VDC Interface
	COLNO		=> VDC_COLNO,
	CLKEN		=> VDC_CLKEN,
		
	-- NTSC/RGB Video Output
	R			=> RED,
	G			=> GREEN,
	B			=> BLUE,
	VS_N		=> VS_N,
	HS_N		=> HS_N,
		
	-- VGA Video Output (Scandoubler)
	VGA_R		=> VGA_RED,
	VGA_G		=> VGA_GREEN,
	VGA_B		=> VGA_BLUE,
	VGA_VS_N	=> VGA_VS_N,
	VGA_HS_N	=> VGA_HS_N
);


VDC : entity work.huc6270 port map(
	CLK 		=> CLK,
--	SDR_CLK		=> SDR_CLK,
	RESET_N		=> RESET_N,

	-- CPU Interface
	A			=> CPU_A(1 downto 0),
	CE_N		=> CPU_VDC_SEL_N,
	WR_N		=> CPU_WR_N,
	RD_N		=> CPU_RD_N,
	DI			=> CPU_DO,
	DO 			=> VDC_DO,
	BUSY_N		=> VDC_BUSY_N,
	IRQ_N		=> VDC_IRQ_N,
	
	BG_RAM_A	=> VDCBG_RAM_A,
	BG_RAM_DO	=> VDCBG_RAM_DO,
	BG_RAM_REQ	=> VDCBG_RAM_REQ,
	BG_RAM_ACK	=> VDCBG_RAM_ACK,
	
	SP_RAM_A	=> VDCSP_RAM_A,
	SP_RAM_DO	=> VDCSP_RAM_DO,
	SP_RAM_REQ	=> VDCSP_RAM_REQ,
	SP_RAM_ACK	=> VDCSP_RAM_ACK,
	
	CPU_RAM_REQ	=> VDCCPU_RAM_REQ,
	CPU_RAM_A	=> VDCCPU_RAM_A,
	CPU_RAM_DO	=> VDCCPU_RAM_DO,
	CPU_RAM_DI	=> VDCCPU_RAM_DI,
	CPU_RAM_WE	=> VDCCPU_RAM_WE,
	CPU_RAM_ACK	=> VDCCPU_RAM_ACK,
	
	DMA_RAM_REQ => VDCDMA_RAM_REQ,
	DMA_RAM_A	=> VDCDMA_RAM_A,
	DMA_RAM_DO	=> VDCDMA_RAM_DO,
	DMA_RAM_DI	=> VDCDMA_RAM_DI,
	DMA_RAM_WE	=> VDCDMA_RAM_WE,
	DMA_RAM_ACK	=> VDCDMA_RAM_ACK,
	
	DMAS_RAM_REQ	=> VDCDMAS_RAM_REQ,
	DMAS_RAM_A		=> VDCDMAS_RAM_A,
	DMAS_RAM_DO		=> VDCDMAS_RAM_DO,
	DMAS_RAM_ACK	=> VDCDMAS_RAM_ACK,
	
	-- VCE Interface
	COLNO		=> VDC_COLNO,
	CLKEN		=> VDC_CLKEN,
	HS_N		=> HS_N,
	VS_N		=> VS_N

);
-- VDC_RAM_A_FULL <= "00" & "1000" & VDC_RAM_A;


SDRC : entity work.sdram_controller
	generic map(
		colAddrBits => colAddrBits,
		rowAddrBits => rowAddrBits
	)
	port map(
	clk			=> SDR_CLK,
	
	std_logic_vector(sd_data) => DRAM_DQ,
	std_logic_vector(sd_addr) => DRAM_ADDR,
	sd_we_n		=> DRAM_WE_N,
	sd_ras_n	=> DRAM_RAS_N,
	sd_cas_n	=> DRAM_CAS_N,
	sd_ba_0		=> DRAM_BA_0,
	sd_ba_1		=> DRAM_BA_1,
	sd_ldqm		=> DRAM_LDQM,
	sd_udqm		=> DRAM_UDQM,
	
	vdccpu_req		=> VDCCPU_RAM_REQ,
	vdccpu_ack		=> VDCCPU_RAM_ACK,
	vdccpu_we		=> VDCCPU_RAM_WE,
	vdccpu_a		=> VDCCPU_RAM_A,
	vdccpu_d		=> VDCCPU_RAM_DI,
	vdccpu_q		=> VDCCPU_RAM_DO,

	vdcbg_a	=> VDCBG_RAM_A,
	vdcbg_q	=> VDCBG_RAM_DO,
	vdcbg_req	=> VDCBG_RAM_REQ,
	vdcbg_ack	=> VDCBG_RAM_ACK,
	
	vdcsp_a	=> VDCSP_RAM_A,
	vdcsp_q	=> VDCSP_RAM_DO,
	vdcsp_req	=> VDCSP_RAM_REQ,
	vdcsp_ack	=> VDCSP_RAM_ACK,
	
	vdcdma_req => VDCDMA_RAM_REQ,
	vdcdma_a	=> VDCDMA_RAM_A,
	vdcdma_q	=> VDCDMA_RAM_DO,
	vdcdma_d	=> VDCDMA_RAM_DI,
	vdcdma_we	=> VDCDMA_RAM_WE,
	vdcdma_ack	=> VDCDMA_RAM_ACK,
	
	vdcdmas_req	=> VDCDMAS_RAM_REQ,
	vdcdmas_a		=> VDCDMAS_RAM_A,
	vdcdmas_q		=> VDCDMAS_RAM_DO,
	vdcdmas_ack	=> VDCDMAS_RAM_ACK,
	
	romwr_req	=> romwr_req,
	romwr_ack	=> romwr_ack,
	romwr_a		=> romwr_a,
	romwr_d		=> romwr_d,
	
	romrd_req	=> romrd_req,
	romrd_ack	=> romrd_ack,
	romrd_a		=> romrd_a,
	romrd_q		=> romrd_q,
	
	initDone 	=> SDR_INIT_DONE
);
DRAM_CKE <= '1';
DRAM_CS_N <= '0';

-- Interrupt signals
CPU_NMI_N <= '1';
CPU_IRQ1_N <= VDC_IRQ_N;
CPU_IRQ2_N <= '1';
CPU_RDY <= VDC_BUSY_N and ROM_RDY;

-- CPU data bus
CPU_DI <= RAM_DO when CPU_RD_N = '0' and CPU_RAM_SEL_N = '0' 
	else ROM_DO when CPU_RD_N = '0' and CPU_A(20) = '0'
	else VCE_DO when CPU_RD_N = '0' and CPU_VCE_SEL_N = '0'
	else VDC_DO when CPU_RD_N = '0' and CPU_VDC_SEL_N = '0'
	else "ZZZZZZZZ";


	
	
-- ROM_RDY <= '1' when romrd_req = romrd_ack else '0';


process( CLK )
begin
	if rising_edge( CLK ) then
		if ROM_RESET_N = '0' then
			RESET_N <= '0';
			romrd_req <= '0';
			romrd_a_cached <= (others => '0');
			romrd_q_cached <= (others => '0');
			ROM_RDY <= '0';
			CPU_A_PREV <= (others => '0');
		elsif ROM_RESET_N = '1' and RESET_N = '0' then
			if CPU_CLKRST = '1' then
				romrd_req <= not romrd_req;
				romrd_a<=(others=>'0');
				romrd_a(19 downto 3) <= CPU_A(19 downto 3);
				romrd_a_cached<=(others=>'0');
				romrd_a_cached(19 downto 3) <= CPU_A(19 downto 3);
				ROM_RDY <= '0';
				romState <= ROM_READ;				
				RESET_N <= '1';
			end if;
		else
			case romState is
			when ROM_IDLE =>
				if CPU_CLKOUT = '1' then
					if CPU_RD_N = '0' or CPU_WR_N = '0' then
						CPU_A_PREV <= CPU_A;
					else 
						CPU_A_PREV <= (others => '1');
					end if;
					if CPU_A(20) = '0' and CPU_RD_N = '0' and CPU_A /= CPU_A_PREV then
						if CPU_A(19 downto 3) = romrd_a_cached(19 downto 3) then
							case CPU_A(2 downto 0) is
								when "000" =>
									ROM_DO <= romrd_q_cached(7 downto 0);
								when "001" =>
									ROM_DO <= romrd_q_cached(15 downto 8);
								when "010" =>
									ROM_DO <= romrd_q_cached(23 downto 16);
								when "011" =>
									ROM_DO <= romrd_q_cached(31 downto 24);
								when "100" =>
									ROM_DO <= romrd_q_cached(39 downto 32);
								when "101" =>
									ROM_DO <= romrd_q_cached(47 downto 40);
								when "110" =>
									ROM_DO <= romrd_q_cached(55 downto 48);
								when "111" =>
									ROM_DO <= romrd_q_cached(63 downto 56);
								when others => null;
							end case;						
						else
							romrd_req <= not romrd_req;
							romrd_a<=(others=>'0');
							romrd_a(19 downto 3) <= CPU_A(19 downto 3);
							-- Perform address mangling to mimic HuCard chip mapping.
							-- rommap => 00  -  Straight mapping
							-- rommap => 01  -  384K ROM, split in 3, mapped ABABCCCC
							-- rommap => 10  -  768K ROM, straight mapping for now
							-- rommap => 11  -  not yet defined.
							
							if rommap="01" then                       -- bits 19 downto 16
								-- 00000 -> 20000  => 00000 -> 20000		0000 -> 0000
								-- 20000 -> 40000  => 20000 -> 40000		0010 -> 0010
								-- 40000 -> 60000  => 00000 -> 20000		0100 -> 0000
								-- 60000 -> 80000  => 20000 -> 40000		0110 -> 0010
								-- 80000 -> A0000  => 40000 -> 60000		1000 -> 0100
								-- A0000 -> C0000  => 40000 -> 60000		1010 -> 0100
								-- C0000 -> E0000  => 40000 -> 60000		1100 -> 0100
								-- E0000 ->100000  => 40000 -> 60000		1110 -> 0100
								romrd_a(19)<='0';
								romrd_a(18)<=CPU_A(19);
								romrd_a(17)<=CPU_A(17) and not CPU_A(19);
							end if;
								

							romrd_a_cached<=(others=>'0');
							romrd_a_cached(19 downto 3) <= CPU_A(19 downto 3);
							ROM_RDY <= '0';
							romState <= ROM_READ;
						end if;
					end if;
				end if;
			when ROM_READ =>
				if romrd_req = romrd_ack then
					ROM_RDY <= '1';
					romrd_q_cached <= romrd_q;
					case CPU_A(2 downto 0) is
						when "000" =>
							ROM_DO <= romrd_q(7 downto 0);
						when "001" =>
							ROM_DO <= romrd_q(15 downto 8);
						when "010" =>
							ROM_DO <= romrd_q(23 downto 16);
						when "011" =>
							ROM_DO <= romrd_q(31 downto 24);
						when "100" =>
							ROM_DO <= romrd_q(39 downto 32);
						when "101" =>
							ROM_DO <= romrd_q(47 downto 40);
						when "110" =>
							ROM_DO <= romrd_q(55 downto 48);
						when "111" =>
							ROM_DO <= romrd_q(63 downto 56);
						when others => null;
					end case;
					romState <= ROM_IDLE;
				end if;
			when others => null;
			end case;
		end if;
	end if;
end process;


-- Boot process

FL_DQ<=boot_data;

ROM_RESET_N <= host_bootdone and host_reset_n;

process( SDR_CLK )
begin
	if rising_edge( SDR_CLK ) then
		if PRE_RESET_N = '0' then
				
			boot_req <='0';
			
			romwr_req <= '0';
			romwr_a <= to_unsigned(0, addrwidth);
			bootState<=BOOT_READ_1;
			
		else
			case bootState is 
				when BOOT_READ_1 =>
					boot_req<='1';
					if boot_ack='1' then
						boot_req<='0';
						bootState <= BOOT_WRITE_1;
					end if;
					if host_bootdone='1' then
						boot_req<='0';
						bootState <= BOOT_DONE;
					end if;
				when BOOT_WRITE_1 =>
					if BITFLIP = '1' then
						romwr_d <=
							FL_DQ(8)
							& FL_DQ(9)
							& FL_DQ(10)
							& FL_DQ(11)
							& FL_DQ(12)
							& FL_DQ(13)
							& FL_DQ(14)
							& FL_DQ(15)
							& FL_DQ(0)
							& FL_DQ(1)
							& FL_DQ(2)
							& FL_DQ(3)
							& FL_DQ(4)
							& FL_DQ(5)
							& FL_DQ(6)
							& FL_DQ(7);
					else
						romwr_d <= FL_DQ;
					end if;
					
					romwr_req <= not romwr_req;
					bootState <= BOOT_WRITE_2;
				when BOOT_WRITE_2 =>
					if romwr_req = romwr_ack then
						romwr_a <= romwr_a + 1;
						bootState <= BOOT_READ_1;
					end if;
				when BOOT_REL =>
					if CPU_CLKRST = '1' then
						bootState <= BOOT_DONE;
					end if;
				when others => null;
			end case;	
		end if;
	end if;
end process;



-- Block RAM
RAM_A <= CPU_A(12 downto 0);
RAM_DI <= CPU_DO;
process( CLK )
begin
	if rising_edge( CLK ) then
		RAM_WE <= '0';
		if CPU_CLKOUT = '1' and CPU_RAM_SEL_N = '0' and CPU_WR_N = '0' then
			RAM_WE <= '1';
		end if;
	end if;
end process;

joya_merged <= joya and gp1emu;
joyb_merged <= joyb and gp2emu;



-- I/O Port
CPU_IO_DI(7 downto 4) <= "1011"; -- No CD-Rom unit, TGFX-16
CPU_IO_DI(3 downto 0) <=
	joya_merged(7) & joya_merged(6) & joya_merged(4) & joya_merged(5)
		when CPU_IO_DO(1 downto 0) = "00" and gamepad_port = "000"
	else joya_merged(2) & joya_merged(1) & joya_merged(3) & joya_merged(0)
		when CPU_IO_DO(1 downto 0) = "01" and gamepad_port = "000"
		
	else joyb_merged(7) & joyb_merged(6) & joyb_merged(4) & joyb_merged(5)
		when CPU_IO_DO(1 downto 0) = "00" and gamepad_port = "001"
	else joyb_merged(2) & joyb_merged(1) & joyb_merged(3) & joyb_merged(0)
		when CPU_IO_DO(1 downto 0) = "01" and gamepad_port = "001"
		
	else joyc(7) & joyc(6) & joyc(4) & joyc(5)
		when CPU_IO_DO(1 downto 0) = "00" and gamepad_port = "010"
	else joyc(2) & joyc(1) & joyc(3) & joyc(0)
		when CPU_IO_DO(1 downto 0) = "01" and gamepad_port = "010"
		
	else joyd(7) & joyd(6) & joyd(4) & joyd(5)
		when CPU_IO_DO(1 downto 0) = "00" and gamepad_port = "011"
	else joyd(2) & joyd(1) & joyd(3) & joyd(0)
		when CPU_IO_DO(1 downto 0) = "01" and gamepad_port = "011"

	else joye(7) & joye(6) & joye(4) & joye(5)
		when CPU_IO_DO(1 downto 0) = "00" and gamepad_port = "100"
	else joye(2) & joye(1) & joye(3) & joye(0)
		when CPU_IO_DO(1 downto 0) = "01" and gamepad_port = "100"
		
	else "1111";

process(clk)
begin
	if rising_edge(clk) then
		if CPU_IO_DO(1)='1' then -- reset pad
			gamepad_port<=(others => '0');
		elsif prev_sel='0' and CPU_IO_DO(0)='1' and multitap='1' then -- Rising edge of select bit
			gamepad_port<=gamepad_port+1;
		end if;
		prev_sel<=CPU_IO_DO(0);
	end if;

end process;
	
-- Control module:

mycontrolmodule : entity work.CtrlModule
	generic map (
		sysclk_frequency => 1270 -- Sysclk frequency * 10
	)
	port map (
		clk => SDR_CLK,
		reset_n => reset,

		-- SPI signals
		spi_miso	=> spi_miso,
		spi_mosi => spi_mosi,
		spi_clk => spi_clk,
		spi_cs => spi_cs,
		
		-- UART
		rxd => RS232_RXD,
		txd => RS232_TXD,
		
		-- DIP switches
		dipswitches => SW,

		-- PS2 keyboard
		ps2k_clk_in => ps2k_clk_in,
		ps2k_dat_in => ps2k_dat_in,
		ps2k_clk_out => ps2k_clk_out,
		ps2k_dat_out => ps2k_dat_out,
		
		-- Host control
		host_reset_n => host_reset_n,
		host_bootdone => host_bootdone,
		
		-- Host boot data
		host_bootdata => boot_data,
		host_bootdata_req => boot_req,
		host_bootdata_ack => boot_ack,
		rommap => rommap,
		
		-- Video signals for OSD
		vga_hsync => vga_hsync_i,
		vga_vsync => vga_vsync_i,
		osd_window => osd_window,
		osd_pixel => osd_pixel,
		
		-- Gamepad emulation
		gp1emu => gp1emu,
		gp2emu => gp2emu
);


overlay : entity work.OSD_Overlay
	port map
	(
		clk => SDR_CLK,
		red_in => vga_red_i,
		green_in => vga_green_i,
		blue_in => vga_blue_i,
		window_in => '1',
		osd_window_in => osd_window,
		osd_pixel_in => osd_pixel,
		hsync_in => vga_hsync_i,
		red_out => VGA_R,
		green_out => VGA_G,
		blue_out => VGA_B,
		window_out => open,
		scanline_ena => SW(1)
	);

-- Select between VGA and TV output	
vga_red_i <= RED when SW(0)='1' else VGA_RED;
vga_green_i <= GREEN when SW(0)='1' else VGA_GREEN;
vga_blue_i <= BLUE when SW(0)='1' else VGA_BLUE;
vga_hsync_i <= HS_N when SW(0)='1' else VGA_HS_N;
vga_vsync_i <= VS_N when SW(0)='1' else VGA_VS_N;

VGA_HS <= not (vga_hsync_i xor vga_vsync_i) when SW(0)='1' else vga_hsync_i;
VGA_VS <= '1' when SW(0)='1' else vga_vsync_i;


end rtl;
