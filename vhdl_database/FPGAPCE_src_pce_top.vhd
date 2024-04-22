library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;


entity pce_top is
	port(
		SW			: in std_logic_vector(9 downto 0);
		
		HEX0		: out std_logic_vector(6 downto 0);
		HEX1		: out std_logic_vector(6 downto 0);
		HEX2		: out std_logic_vector(6 downto 0);
		HEX3		: out std_logic_vector(6 downto 0);
		
		KEY			: in std_logic_vector(3 downto 0);
				
		LEDR		: out std_logic_vector(9 downto 0);
		LEDG		: out std_logic_vector(7 downto 0);
		
		CLOCK_24	: in std_logic_vector(1 downto 0);
		CLOCK_27	: in std_logic_vector(1 downto 0);
		CLOCK_50	: in std_logic;
		
		FL_ADDR		: out std_logic_vector(21 downto 0);
		FL_DQ		: inout std_logic_vector(7 downto 0);
		FL_OE_N		: out std_logic;
		FL_RST_N	: out std_logic;
		FL_WE_N		: out std_logic;
		
		SRAM_ADDR	: out std_logic_vector(17 downto 0);
		SRAM_CE_N	: out std_logic;
		SRAM_DQ		: inout std_logic_vector(15 downto 0);
		SRAM_LB_N	: out std_logic;
		SRAM_OE_N	: out std_logic;
		SRAM_UB_N	: out std_logic;
		SRAM_WE_N	: out std_logic;

		DRAM_ADDR	: out unsigned(11 downto 0);
		DRAM_BA_0	: out std_logic;
		DRAM_BA_1	: out std_logic;
		DRAM_CAS_N	: out std_logic;
		DRAM_CKE	: out std_logic;
		DRAM_CLK	: out std_logic;
		DRAM_CS_N	: out std_logic;
		DRAM_DQ		: inout unsigned(15 downto 0);
		DRAM_LDQM	: out std_logic;
		DRAM_RAS_N	: out std_logic;
		DRAM_UDQM	: out std_logic;
		DRAM_WE_N	: out std_logic;
		
		AUD_XCK		: out std_logic;
		AUD_BCLK	: out std_logic;
		AUD_DACDAT	: out std_logic;
		AUD_DACLRCK	: out std_logic;
		I2C_SDAT	: out std_logic;
		I2C_SCLK	: out std_logic;

		GPIO_1		: inout std_logic_vector(35 downto 0);
		
		VGA_R		: out std_logic_vector(3 downto 0);
		VGA_G		: out std_logic_vector(3 downto 0);
		VGA_B		: out std_logic_vector(3 downto 0);
		VGA_VS		: out std_logic;
		VGA_HS		: out std_logic				
	);
end pce_top;

architecture rtl of pce_top is

signal P1_UP		: std_logic;
signal P1_DOWN		: std_logic;
signal P1_LEFT		: std_logic;
signal P1_RIGHT		: std_logic;
signal P1_SELECT	: std_logic;
signal P1_RUN		: std_logic;
signal P1_II		: std_logic;
signal P1_I			: std_logic;		

-- signal GPIO_CLKCNT	: std_logic_vector(15 downto 0);
signal GPIO_CLKCNT	: unsigned(15 downto 0);

signal GPIO_SEL		: std_logic;
signal GP1_UP		: std_logic;
signal GP1_DOWN		: std_logic;
signal GP1_LEFT		: std_logic;
signal GP1_RIGHT	: std_logic;
signal GP1_SELECT	: std_logic;
signal GP1_RUN		: std_logic;
signal GP1_II		: std_logic;
signal GP1_I		: std_logic;		

signal HEXVALUE		: std_logic_vector(15 downto 0);

signal PRE_RESET_N	: std_logic;
signal RSTCNT		: std_logic_vector(15 downto 0);
signal ROM_RESET_N	: std_logic := '0';
signal RESET_N		: std_logic := '0';

signal CLK			: std_logic;
signal SDR_CLK		: std_logic;

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

signal CPU_IO_DI		: std_logic_vector(7 downto 0);
signal CPU_IO_DO		: std_logic_vector(7 downto 0);

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
signal R			: std_logic_vector(2 downto 0);
signal G			: std_logic_vector(2 downto 0);
signal B			: std_logic_vector(2 downto 0);		
signal VS_N			: std_logic;
signal HS_N			: std_logic;

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

type bootStates is (BOOT_READ_1, BOOT_READ_2, BOOT_WRITE_1, BOOT_WRITE_2, BOOT_REL, BOOT_DONE);
signal bootState : bootStates := BOOT_READ_1;
signal bootTimer : integer range 0 to 32767;

signal boot_a		: std_logic_vector(21 downto 0);
signal boot_oe_n	: std_logic;

signal romwr_req : std_logic := '0';
signal romwr_ack : std_logic;
signal romwr_a : unsigned((12+8+2) downto 0);
signal romwr_d : std_logic_vector(7 downto 0);

signal romrd_req : std_logic := '0';
signal romrd_ack : std_logic;
signal romrd_a : std_logic_vector((12+8+2) downto 3);
signal romrd_q : std_logic_vector(63 downto 0);
signal romrd_a_cached : std_logic_vector((12+8+2) downto 3);
signal romrd_q_cached : std_logic_vector(63 downto 0);


type romStates is (ROM_IDLE, ROM_READ);
signal romState : romStates := ROM_IDLE;

signal CPU_A_PREV : std_logic_vector(20 downto 0);
signal ROM_RDY	: std_logic;
signal ROM_DO	: std_logic_vector(7 downto 0);

begin

-- Reset
PRE_RESET_N <= not SW(0);

-- Header present switch
HEADER <= SW(1);
-- ROM splitting switch
SPLIT <= SW(2);
-- Bit flipping switch
BITFLIP <= SW(3);

-- I/O
-- GPIO_1 <= (others => 'Z');

P1_UP		<= not SW(9);
P1_DOWN		<= not SW(8);
P1_LEFT		<= not SW(7);
P1_RIGHT	<= not SW(6);

P1_SELECT	<= KEY(3);
P1_RUN		<= KEY(2);
P1_II		<= KEY(1);
P1_I		<= KEY(0);

-- LEDs
LEDG <= P1_UP & P1_DOWN & P1_LEFT & P1_RIGHT & P1_SELECT & P1_RUN & P1_II & P1_I;
LEDR <= (others => '0');

-- Debug
-- HEXVALUE <= x"1234";
HEXVALUE <= CPU_A(15 downto 0);
-- HEXVALUE <= RSTCNT(15 downto 0) when RESET_N = '0' else ROM_A(15 downto 0);
-- HEXVALUE <= ROM_A(15 downto 0);


hexd3 : entity work.hex
port map(
	DIGIT	=> HEXVALUE(15 downto 12),
	SEG		=> HEX3
);
hexd2 : entity work.hex
port map(
	DIGIT	=> HEXVALUE(11 downto 8),
	SEG		=> HEX2
);
hexd1 : entity work.hex
port map(
	DIGIT	=> HEXVALUE(7 downto 4),
	SEG		=> HEX1
);
hexd0 : entity work.hex
port map(
	DIGIT	=> HEXVALUE(3 downto 0),
	SEG		=> HEX0
);

-- PLL
pll : entity work.pll
port map(
	inclk0	=> CLOCK_50,
	c0		=> CLK,
	c1		=> SDR_CLK,
	c2		=> DRAM_CLK
);

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
	
	AUD_XCK		=> AUD_XCK,
	AUD_BCLK	=> AUD_BCLK,
	AUD_DACDAT	=> AUD_DACDAT,
	AUD_DACLRCK	=> AUD_DACLRCK,
	I2C_SDAT	=> I2C_SDAT,
	I2C_SCLK	=> I2C_SCLK
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
	RESET_N		=> RESET_N,

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
	R			=> R,
	G			=> G,
	B			=> B,
	VS_N		=> VS_N,
	HS_N		=> HS_N,
		
	-- VGA Video Output (Scandoubler)
	VGA_R		=> VGA_R,
	VGA_G		=> VGA_G,
	VGA_B		=> VGA_B,
	VGA_VS_N	=> VGA_VS,
	VGA_HS_N	=> VGA_HS
);


VDC : entity work.huc6270 port map(
	CLK 		=> CLK,
	SDR_CLK		=> SDR_CLK,
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


SDRC : entity work.sdram_controller port map(
	clk			=> SDR_CLK,
	
	sd_data		=> DRAM_DQ,
	sd_addr		=> DRAM_ADDR,
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
				romrd_a <= "00" & "0" & CPU_A(19 downto 3);
				romrd_a_cached <= "00" & "0" & CPU_A(19 downto 3);
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
							romrd_a <= "00" & "0" & CPU_A(19 downto 3);
							romrd_a_cached <= "00" & "0" & CPU_A(19 downto 3);
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


-- Flash
-- FL_ADDR <= "00" & CPU_A(19 downto 0);
FL_ADDR <= boot_a;
FL_DQ <= "ZZZZZZZZ";
FL_OE_N <= boot_oe_n;
FL_RST_N <= '1';
FL_WE_N	<= '1';

process( CLK )
begin
	if rising_edge( CLK ) then
		if PRE_RESET_N = '0' then
			ROM_RESET_N <= '0';
			
			bootTimer <= 1000;
			bootState <= BOOT_READ_1;
			
			if HEADER = '1' then
				boot_a <= std_logic_vector(to_unsigned(512, boot_a'length));
			else
				boot_a <= std_logic_vector(to_unsigned(0, boot_a'length));
			end if;
			boot_oe_n <= '1';
						
			romwr_req <= '0';
			romwr_a <= to_unsigned(0, 23);
			
		else
			if bootTimer /= 0 then
				bootTimer <= bootTimer - 1;
			else
				case bootState is 
				when BOOT_READ_1 =>
					bootTimer <= 2;
					bootState <= BOOT_READ_2;
				when BOOT_READ_2 =>
					bootTimer <= 5;
					boot_oe_n <= '0';
					bootState <= BOOT_WRITE_1;
				when BOOT_WRITE_1 =>
					boot_oe_n <= '1';
					
					if BITFLIP = '1' then
						romwr_d <= FL_DQ(0)
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
						boot_a <= std_logic_vector(unsigned(boot_a) + 1);
						
						-- if SPLIT = '1' and romwr_a(19 downto 0) = x"7FFFF" then
							-- romwr_a <= romwr_a + (256*1024) + 1;
						-- else
							-- romwr_a <= romwr_a + 1;
						-- end if;

romwr_a <= romwr_a + 1;
if SPLIT = '1' and romwr_a(19 downto 0) = x"7FFFF" then
	boot_a <= std_logic_vector(unsigned(boot_a) - (256*1024) + 1);	
end if;
						
						if romwr_a(19 downto 0) = x"FFFFF"
-- synthesis translate_off
						or romwr_a(19 downto 0) = x"07FFF" 
-- synthesis translate_on
						then
							bootState <= BOOT_REL;
						else
							bootState <= BOOT_READ_1;
						end if;
					end if;
				when BOOT_REL =>
					if CPU_CLKRST = '1' then
						ROM_RESET_N <= '1';
						bootState <= BOOT_DONE;
					end if;
				when others => null;
				end case;	
			end if;
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

-- I/O Port
CPU_IO_DI(7 downto 4) <= "1011"; -- No CD-Rom unit, TGFX-16
CPU_IO_DI(3 downto 0) <= P1_RUN & P1_SELECT & P1_II & P1_I when CPU_IO_DO(1 downto 0) = "00" and SW(5) = '0'
	else P1_LEFT & P1_RIGHT & P1_DOWN & P1_UP when CPU_IO_DO(1 downto 0) = "01" and SW(5) = '0'
	else GP1_RUN & GP1_SELECT & GP1_II & GP1_I when CPU_IO_DO(1 downto 0) = "00" and SW(5) = '1'
	else GP1_LEFT & GP1_RIGHT & GP1_DOWN & GP1_UP when CPU_IO_DO(1 downto 0) = "01" and SW(5) = '1'
	else "0000";

GPIO_1(35 downto 6) <= (others => 'Z');
GPIO_1(4 downto 0) <= (others => 'Z');

GPIO_1(5) <= GPIO_SEL;
GPIO_SEL <= GPIO_CLKCNT(15);
process( CLK )
begin
	if rising_edge( CLK ) then
		if PRE_RESET_N = '0' then
			GPIO_CLKCNT <= (others => '0');
		else
			GPIO_CLKCNT <= GPIO_CLKCNT + 1;
		end if;
	
		if GPIO_SEL = '0' then
			GP1_RUN <= GPIO_1(6);
			GP1_SELECT <= GPIO_1(4);
			GP1_DOWN <= GPIO_1(1);
			GP1_UP <= GPIO_1(0);
		else
			GP1_II <= GPIO_1(6);
			GP1_I <= GPIO_1(4);
			GP1_RIGHT <= GPIO_1(2);
			GP1_LEFT <= GPIO_1(3);
			GP1_DOWN <= GPIO_1(1);
			GP1_UP <= GPIO_1(0);			
		end if;	
	end if;
end process;




	
-- SRAM
-- VDC_RAM_DO <= SRAM_DQ;
-- SRAM_ADDR <= "00" & VDC_RAM_A;
-- SRAM_CE_N <= VDC_RAM_CE_N;
-- SRAM_DQ <= VDC_RAM_DI when VDC_RAM_CE_N = '0' and VDC_RAM_WE_N = '0'
	-- else "ZZZZZZZZZZZZZZZZ";
-- SRAM_LB_N <= '0';
-- SRAM_UB_N <= '0';
-- SRAM_OE_N <= VDC_RAM_OE_N;
-- SRAM_WE_N <= VDC_RAM_WE_N;

end rtl;
