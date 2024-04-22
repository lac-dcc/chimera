library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;

entity vdc_top is
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

		GPIO_1		: inout std_logic_vector(35 downto 0);
		
		VGA_R		: out std_logic_vector(3 downto 0);
		VGA_G		: out std_logic_vector(3 downto 0);
		VGA_B		: out std_logic_vector(3 downto 0);
		VGA_VS		: out std_logic;
		VGA_HS		: out std_logic				
	);
end vdc_top;

architecture rtl of vdc_top is

signal HEXVALUE		: std_logic_vector(15 downto 0);

signal RESET_N		: std_logic;
signal CLK			: std_logic;

-- NTSC/RGB Video Output
signal R			: std_logic_vector(2 downto 0);
signal G			: std_logic_vector(2 downto 0);
signal B			: std_logic_vector(2 downto 0);		
signal VS_N			: std_logic;
signal HS_N			: std_logic;

-- VDC signals
signal VDC_COLNO	: std_logic_vector(8 downto 0);
signal VDC_CLKEN	: std_logic;
signal VDC_RAM_A	: std_logic_vector(15 downto 0);
signal VDC_RAM_CE_N	: std_logic;
signal VDC_RAM_OE_N	: std_logic;
signal VDC_RAM_WE_N	: std_logic;
signal VDC_RAM_DI	: std_logic_vector(15 downto 0);
signal VDC_RAM_DO	: std_logic_vector(15 downto 0);

-- Init phase
signal INI_RESET_N		: std_logic;
signal INI_SRAM_ADDR	: std_logic_vector(17 downto 0);
signal INI_SRAM_CE_N	: std_logic;
signal INI_SRAM_DQ		: std_logic_vector(15 downto 0);
signal INI_SRAM_WE_N	: std_logic;

signal INI_FL_ADDR		: std_logic_vector(21 downto 0);
signal INI_FL_OE_N		: std_logic;

signal INI_CNT			: std_logic_vector(2 downto 0);
type ini_t is ( INI_FL_RD1, INI_FL_RD2, INI_FL_RD3, INI_FL_RD4,
				INI_WR1, INI_WR2,
				INI_END );
signal INI				: ini_t;

begin

-- Reset
INI_RESET_N <= not SW(0);

-- I/O
GPIO_1 <= (others => 'Z');

-- LEDs
LEDG <= (others => '0');
LEDR <= (others => '0');

-- Debug
HEXVALUE <= x"1337";

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
	inclk0	=> CLOCK_24(0),
	c0		=> CLK
);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

VCE : entity work.huc6260 port map(
	CLK 		=> CLK,
	RESET_N		=> RESET_N,

	-- CPU Interface
	A			=> "000",
	CE_N		=> '1',
	WR_N		=> '1',
	RD_N		=> '1',
	DI			=> "00000000",
	DO 			=> open,
		
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
	RESET_N		=> RESET_N,

	-- CPU Interface
	A			=> "00",
	CE_N		=> '1',
	WR_N		=> '1',
	RD_N		=> '1',
	DI			=> "00000000",
	DO 			=> open,
	BUSY_N		=> open,
	IRQ_N		=> open,
	
	-- VCE Interface
	COLNO		=> VDC_COLNO,
	CLKEN		=> VDC_CLKEN,
	HS_N		=> HS_N,
	VS_N		=> VS_N,

	-- SRAM Interface
	RAM_A		=> VDC_RAM_A,
	RAM_CE_N	=> VDC_RAM_CE_N,
	RAM_OE_N	=> VDC_RAM_OE_N,
	RAM_WE_N	=> VDC_RAM_WE_N,
	RAM_DI		=> VDC_RAM_DI,
	RAM_DO		=> VDC_RAM_DO
);
VDC_RAM_DO <= SRAM_DQ;


-- Init phase
process( CLK )
begin
	if rising_edge( CLK ) then
		if INI_RESET_N = '0' then
			RESET_N <= '0';
		
			INI_CNT <= (others => '0');
			INI <= INI_FL_RD1;
			
			INI_FL_ADDR <= (others => '0');
			INI_FL_OE_N <= '1';
			
			INI_SRAM_ADDR <= (others => '0');
			INI_SRAM_CE_N <= '1';
			INI_SRAM_WE_N <= '1';
		
		else
			INI_CNT <= INI_CNT + 1;
			if INI_CNT = "111" then
				case INI is
				
				when INI_FL_RD1 =>
					if INI_SRAM_ADDR(15) = '1' 
-- synthesis translate_off
					or INI_SRAM_ADDR(0) = '0'
-- synthesis translate_on					
					then
						RESET_N <= '1';
						INI <= INI_END;
					else
						INI_FL_OE_N <= '0';
						INI <= INI_FL_RD2;
					end if;
				when INI_FL_RD2 =>
					INI_SRAM_DQ(15 downto 8) <= FL_DQ;
					INI_FL_OE_N <= '1';
					INI_FL_ADDR <= INI_FL_ADDR + 1;
					INI <= INI_FL_RD3;
				when INI_FL_RD3 =>
					INI_FL_OE_N <= '0';
					INI <= INI_FL_RD4;
				when INI_FL_RD4 =>
					INI_SRAM_DQ(7 downto 0) <= FL_DQ;
					INI_FL_OE_N <= '1';
					INI_FL_ADDR <= INI_FL_ADDR + 1;
					INI <= INI_WR1;
					
				when INI_WR1 =>
					INI_SRAM_CE_N <= '0';
					INI_SRAM_WE_N <= '0';
					INI <= INI_WR2;
				when INI_WR2 =>
					INI_SRAM_CE_N <= '1';
					INI_SRAM_WE_N <= '1';
					INI_SRAM_ADDR <= INI_SRAM_ADDR + 1;
					INI <= INI_FL_RD1;
					
				when others => null;
				end case;
			end if;					
		end if;
	end if;
end process;


-- Flash
FL_ADDR <= INI_FL_ADDR;
FL_DQ <= "ZZZZZZZZ";
FL_OE_N <= INI_FL_OE_N;
FL_RST_N <= '1';
FL_WE_N	<= '1';

-- SRAM
SRAM_ADDR <= "00" & VDC_RAM_A when RESET_N = '1' else INI_SRAM_ADDR;
SRAM_CE_N <= VDC_RAM_CE_N when RESET_N = '1' else INI_SRAM_CE_N;
SRAM_DQ <= VDC_RAM_DI when VDC_RAM_CE_N = '0' and VDC_RAM_WE_N = '0' and RESET_N = '1'
	else INI_SRAM_DQ when INI_SRAM_CE_N = '0' and INI_SRAM_WE_N = '0'
	else "ZZZZZZZZZZZZZZZZ";
SRAM_LB_N <= '0';
SRAM_UB_N <= '0';
SRAM_OE_N <= VDC_RAM_OE_N when RESET_N = '1' else '1';
SRAM_WE_N <= VDC_RAM_WE_N when RESET_N = '1' else INI_SRAM_WE_N;

end rtl;
