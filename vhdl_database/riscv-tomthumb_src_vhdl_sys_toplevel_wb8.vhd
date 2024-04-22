library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;
use work.arbiter_types.all;

entity sys_toplevel_wb8 is
	Port(
		I_clk: in std_logic;
		I_reset: in std_logic := '0';
		I_serial_rx: in std_logic;
		I_interrupt: in std_logic;
		I_spi_miso: in std_logic;
		O_leds: out std_logic_vector(7 downto 0) := X"00";
		O_serial_tx: out std_logic;
		O_vga_vsync, O_vga_hsync, O_vga_r, O_vga_g, O_vga_b: out std_logic := '0';
		O_spi_sel, O_spi_clk, O_spi_mosi: out std_logic := '0'
	);
end sys_toplevel_wb8;


architecture Behavioral of sys_toplevel_wb8 is
	
	signal arb_ACK_O: std_logic := '0';
	signal arb_DAT_O: std_logic_vector(7 downto 0) := X"00";
	signal arb_ACK_I: arb_ACK_I_t;
	signal arb_DAT_I: arb_DAT_I_t;
	signal arb_STB_O: arb_STB_O_t;
	
	signal cpu_DAT_O: std_logic_vector(7 downto 0);
	signal cpu_ADR_O: std_logic_vector(XLEN-1 downto 0);
	signal cpu_STB_O, cpu_CYC_O, cpu_WE_O: std_logic := '0';

	signal interruptgen_interrupt: std_logic := '0';
	
	signal pll_clk, pll_vga_clk: std_logic;

	signal reset_ctrl_reset_O: std_logic;
	
	signal inv_reset: std_logic := '0';
	signal inv_interrupt: std_logic := '0';

begin

	-- interrupt button is inverted
	inv_interrupt <= not I_interrupt;
	

	arbiter_instance: entity work.arbiter_wb8 port map(
		ADR_I => cpu_ADR_O,
		ACK_I => arb_ACK_I,
		DAT_I => arb_DAT_I,
		STB_I => cpu_STB_O,
		ACK_O => arb_ACK_O,
		DAT_O => arb_DAT_O,
		STB_O => arb_STB_O
	);


	cpu_instance: entity work.cpu_toplevel_wb8 port map(
		CLK_I => pll_clk,
		ACK_I => arb_ACK_O,
		DAT_I => arb_DAT_O,
		RST_I => reset_ctrl_reset_O,
		ADR_O => cpu_ADR_O,
		DAT_O => cpu_DAT_O,
		CYC_O => cpu_CYC_O,
		STB_O => cpu_STB_O,
		WE_O => cpu_WE_O,
		I_interrupt => interruptgen_interrupt
	);
	
	interruptgen_instance: entity work.interruptgen port map(
		I_clk => pll_clk,
		I_interrupt => inv_interrupt,
		O_interrupt => interruptgen_interrupt
	);

	
	leds_instance: entity work.leds_wb8 port map(
		ADR_I => cpu_ADR_O,
		CLK_I => pll_clk,
		DAT_I => cpu_DAT_O,
		STB_I => arb_STB_O(1),
		WE_I => cpu_WE_O,
		ACK_O => arb_ACK_I(1),
		DAT_O => arb_DAT_I(1),
		-- control signal for onboard LEDs
		O_leds => O_leds
	);
	
	reset_ctrl_instance: entity work.reset_ctrl port map(
		I_clk => pll_clk,
		I_reset => '0',
		I_reset_inv => I_reset,
		O_reset => reset_ctrl_reset_O
	);
	
	
	serial_instance: entity work.serial_wb8
	generic map(
		CLOCKFREQ => 50000000,
		BAUDRATE => 115200
	)
	port map(
		ADR_I => cpu_ADR_O,
		CLK_I => pll_clk,
		DAT_I => cpu_DAT_O,
		STB_I => arb_STB_O(2),
		WE_I => cpu_WE_O,
		ACK_O => arb_ACK_I(2),
		DAT_O => arb_DAT_I(2),
		I_rx => I_serial_rx,
		O_tx => O_serial_tx
	);
	
	spiromram_instance: entity work.spiromram_wb8 port map(
		CLK_I => pll_clk,
		STB_I => arb_STB_O(4),
		WE_I => cpu_WE_O,
		ADR_I => cpu_ADR_O,
		DAT_I => cpu_DAT_O,
		RST_I => reset_ctrl_reset_O,
		DAT_O => arb_DAT_I(4),
		ACK_O => arb_ACK_I(4),
		
		-- SPI signal lines
		I_spi_miso => I_spi_miso,
		O_spi_sel => O_spi_sel,
		O_spi_clk => O_spi_clk,
		O_spi_mosi => O_spi_mosi
	);
	
	
	vga_instance: entity work.vga_wb8 port map(
		ADR_I => cpu_ADR_O,
		CLK_I => pll_clk,
		DAT_I => cpu_DAT_O,
		STB_I => arb_STB_O(3),
		WE_I => cpu_WE_O,
		ACK_O => arb_ACK_I(3),
		DAT_O => arb_DAT_I(3),
		I_vga_clk => pll_vga_clk,
		O_vga_vsync => O_vga_vsync,
		O_vga_hsync => O_vga_hsync,
		O_vga_r => O_vga_r,
		O_vga_g => O_vga_g,
		O_vga_b => O_vga_b
	);
	
	
	-- I/O device 0
	ram_instance: entity work.ram_wb8 port map(
		CLK_I => pll_clk,
		STB_I => arb_STB_O(0),
		WE_I => cpu_WE_O,
		ADR_I => cpu_ADR_O,
		DAT_I => cpu_DAT_O,
		DAT_O => arb_DAT_I(0),
		ACK_O => arb_ACK_I(0)
	);
	
	pll_instance: entity work.wizpll port map(
			inclk0 => I_clk,
			c0 => pll_clk
	);

	pll_vga_instance: entity work.wizpll_vga port map(
			inclk0 => I_clk,
			c0 => pll_vga_clk
	);
	

end Behavioral;