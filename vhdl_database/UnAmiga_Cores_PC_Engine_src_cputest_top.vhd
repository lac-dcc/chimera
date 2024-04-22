library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;

entity cputest_top is
	port(
		RESET		: in std_logic;				
		CLOCK		: in std_logic;

		NMI_N		: in std_logic;
		IRQ1_N		: in std_logic;
		IRQ2_N		: in std_logic;		
		
		-- FLASH
		FL_ADDR		: out std_logic_vector(21 downto 0);
		FL_DQ		: inout std_logic_vector(7 downto 0);
		FL_OE_N		: out std_logic;
		FL_RST_N	: out std_logic;
		FL_WE_N		: out std_logic;
		
		-- SRAM
		SRAM_ADDR	: out std_logic_vector(17 downto 0);
		SRAM_CE_N	: out std_logic;
		SRAM_DQ		: inout std_logic_vector(15 downto 0);
		SRAM_LB_N	: out std_logic;
		SRAM_OE_N	: out std_logic;
		SRAM_UB_N	: out std_logic;
		SRAM_WE_N	: out std_logic
	);
end cputest_top;

architecture rtl of cputest_top is

-- CPU signals
signal CPU_CLK		: std_logic;
signal CPU_RESET_N	: std_logic;
signal CPU_NMI_N	: std_logic;
signal CPU_IRQ1_N	: std_logic;
signal CPU_IRQ2_N	: std_logic;
signal CPU_RD_N		: std_logic;
signal CPU_WR_N		: std_logic;
signal CPU_DI		: std_logic_vector(7 downto 0);
signal CPU_DO		: std_logic_vector(7 downto 0);
signal CPU_A		: std_logic_vector(20 downto 0);
signal CPU_HSM		: std_logic;

signal CPU_REQ		: std_logic;
signal CPU_RDY		: std_logic;

signal CPU_VCE_SEL_N	: std_logic;
signal CPU_VDC_SEL_N	: std_logic;
signal CPU_RAM_SEL_N	: std_logic;

begin 

-- CPU
CPU : entity work.huc6280 port map(
	CLK 	=> CPU_CLK,
	RESET_N	=> CPU_RESET_N,
	
	NMI_N	=> CPU_NMI_N,
	IRQ1_N	=> CPU_IRQ1_N,
	IRQ2_N	=> CPU_IRQ2_N,

	DI		=> CPU_DI,
	DO 		=> CPU_DO,
	
	HSM		=> CPU_HSM,
	
	A 		=> CPU_A,
	WR_N 	=> CPU_WR_N,
	RD_N	=> CPU_RD_N,
	
	REQ		=> CPU_REQ,
	RDY		=> CPU_RDY,
	
	CEK_N	=> CPU_VCE_SEL_N,
	CE7_N	=> CPU_VDC_SEL_N,
	CER_N	=> CPU_RAM_SEL_N
);

CPU_RESET_N <= not RESET;
CPU_CLK <= CLOCK;
CPU_NMI_N <= NMI_N;
CPU_IRQ1_N <= IRQ1_N;
CPU_IRQ2_N <= IRQ2_N;

CPU_RDY <= '1';

-- Memory map
-- ===============
-- 1F0000 - 1F7FFF 		Work RAM (8KB, mirrored 4 times)
-- 000000 - 0FFFFF		ROM
-- ===============
-- 000000 - 1FFFFF		Total

CPU_DI <= SRAM_DQ(7 downto 0) when CPU_RD_N = '0' and CPU_RAM_SEL_N = '0' 
	else FL_DQ when CPU_RD_N = '0' and CPU_A(20) = '0'
	else "ZZZZZZZZ";

SRAM_ADDR <= "00000" & CPU_A(12 downto 0);
SRAM_CE_N <= CPU_RAM_SEL_N;
SRAM_DQ <= "00000000" & CPU_DO when CPU_RAM_SEL_N = '0' and CPU_WR_N = '0'
	else "ZZZZZZZZZZZZZZZZ";
SRAM_LB_N <= '0';
SRAM_UB_N <= '1';
SRAM_OE_N <= CPU_RD_N;
SRAM_WE_N <= CPU_WR_N;

FL_ADDR <= "00" & CPU_A(19 downto 0);
FL_DQ <= "ZZZZZZZZ";
FL_OE_N <= '0';
FL_RST_N <= '1';
FL_WE_N	<= '1';

end rtl;
