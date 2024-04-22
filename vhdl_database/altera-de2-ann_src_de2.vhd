LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;
USE work.float_types.all;
USE work.float_components.all;
USE work.float_constants.all;
USE work.sram_types.all;
USE work.sram_components.all;
USE work.lfsr_components.all;
USE work.ann_types.all;
USE work.ann_components.all;
USE work.pr_types.all;
USE work.pr_components.all;
USE work.display_types.all;
USE work.display_components.all;
USE work.lcd_types.all;
USE work.lcd_components.all;
USE work.pattern_constants.all;

ENTITY de2 IS
	PORT (
		--------------------	Clock Input	 	--------------------	 
		CLOCK_27 : IN STD_LOGIC;						--	On Board 27 MHz
		CLOCK_50 : IN STD_LOGIC;						--	On Board 50 MHz
		EXT_CLOCK : IN STD_LOGIC;						--	External Clock
		--------------------	Push Button		--------------------
		KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);			--	Pushbutton[3:0]
		--------------------	DPDT Switch		--------------------
		SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);			--	Toggle Switch[17:0]
		--------------------	7-SEG Dispaly	--------------------
		HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 0
		HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 1
		HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 2
		HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 3
		HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 4
		HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 5
		HEX6 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 6
		HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);		--	Seven Segment Digit 7
		------------------------	LED		------------------------
		LEDG : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);		--	LED Green[8:0]
		LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);		--	LED Red[17:0]
		------------------------	UART	------------------------
		UART_TXD : OUT STD_LOGIC;						--	UART Transmitter
		UART_RXD : IN STD_LOGIC;						--	UART Receiver
		------------------------	IRDA	------------------------
		IRDA_TXD : OUT STD_LOGIC;						--	IRDA Transmitter
		IRDA_RXD : IN STD_LOGIC;						--	IRDA Receiver
		--------------------/	SDRAM Interface		----------------
		DRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);	--	SDRAM Data bus 16 Bits
		DRAM_ADDR : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);	--	SDRAM Address bus 12 Bits
		DRAM_LDQM : OUT STD_LOGIC;						--	SDRAM Low-byte Data Mask 
		DRAM_UDQM : OUT STD_LOGIC;						--	SDRAM High-byte Data Mask
		DRAM_WE_N : OUT STD_LOGIC;						--	SDRAM Write Enable
		DRAM_CAS_N : OUT STD_LOGIC;						--	SDRAM Column Address Strobe
		DRAM_RAS_N : OUT STD_LOGIC;						--	SDRAM Row Address Strobe
		DRAM_CS_N : OUT STD_LOGIC;						--	SDRAM Chip Select
		DRAM_BA_0 : OUT STD_LOGIC;						--	SDRAM Bank Address 0
		DRAM_BA_1 : OUT STD_LOGIC;						--	SDRAM Bank Address 1
		DRAM_CLK : OUT STD_LOGIC;						--	SDRAM Clock
		DRAM_CKE : OUT STD_LOGIC;						--	SDRAM Clock Enable
		--------------------	Flash Interface		----------------
		FL_DQ : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);		--	FLASH Data bus 8 Bits
		FL_ADDR : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);	--	FLASH Address bus 20 Bits
		FL_WE_N : OUT STD_LOGIC;						--	FLASH Write Enable
		FL_RST_N : OUT STD_LOGIC;						--	FLASH Reset
		FL_OE_N : OUT STD_LOGIC;						--	FLASH Output Enable
		FL_CE_N : OUT STD_LOGIC;						--	FLASH Chip Enable
		--------------------	SRAM Interface		----------------
		SRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);	--	SRAM Data bus 16 Bits
		SRAM_ADDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);	--	SRAM Address bus 18 Bits
		SRAM_UB_N : OUT STD_LOGIC;						--	SRAM High-byte Data Mask
		SRAM_LB_N : OUT STD_LOGIC;						--	SRAM Low-byte Data Mask  
		SRAM_WE_N : OUT STD_LOGIC;						--	SRAM Write Enable
		SRAM_CE_N : OUT STD_LOGIC;						--	SRAM Chip Enable
		SRAM_OE_N : OUT STD_LOGIC;						--	SRAM Output Enable
		--------------------	ISP1362 Interface	----------------
		OTG_DATA : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);	--	ISP1362 Data bus 16 Bits
		OTG_ADDR : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);	--	ISP1362 Address 2 Bits
		OTG_CS_N : OUT STD_LOGIC;						--	ISP1362 Chip Select
		OTG_RD_N : OUT STD_LOGIC;						--	ISP1362 Write
		OTG_WR_N : OUT STD_LOGIC;						--	ISP1362 Read
		OTG_RST_N : OUT STD_LOGIC;						--	ISP1362 Reset
		OTG_FSPEED : OUT STD_LOGIC;						--	USB Full Speed;	0 = Enable; Z = Disable
		OTG_LSPEED : OUT STD_LOGIC;						--	USB Low Speed; 	0 = Enable; Z = Disable
		OTG_INT0 : IN STD_LOGIC;						--	ISP1362 Interrupt 0
		OTG_INT1 : IN STD_LOGIC;						--	ISP1362 Interrupt 1
		OTG_DREQ0 : IN STD_LOGIC;						--	ISP1362 DMA Request 0
		OTG_DREQ1 : IN STD_LOGIC;						--	ISP1362 DMA Request 1
		OTG_DACK0_N : OUT STD_LOGIC;					--	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N : OUT STD_LOGIC;					--	ISP1362 DMA Acknowledge 1
		--------------------	LCD Module 16X2		----------------
		LCD_ON : OUT STD_LOGIC;							--	LCD Power ON/OFF
		LCD_BLON : OUT STD_LOGIC;						--	LCD Back Light ON/OFF
		LCD_RW : OUT STD_LOGIC;							--	LCD Read/Write Select; 0 = Write; 1 = Read
		LCD_EN : OUT STD_LOGIC;							--	LCD Enable
		LCD_RS : OUT STD_LOGIC;							--	LCD Command/Data Select; 0 = Command; 1 = Data
		LCD_DATA : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);	--	LCD Data bus 8 bits
		--------------------	SD_Card Interface	----------------
		SD_DAT : INOUT STD_LOGIC;						--	SD Card Data
		SD_DAT3 : INOUT STD_LOGIC;						--	SD Card Data 3
		SD_CMD : INOUT STD_LOGIC;						--	SD Card Command Signal
		SD_CLK : OUT STD_LOGIC;							--	SD Card Clock
		--------------------	USB JTAG link	--------------------
		TDI : IN STD_LOGIC;  							--	CPLD -> FPGA (Data in)
		TCK : IN STD_LOGIC;  							--	CPLD -> FPGA (Clock)
		TCS : IN STD_LOGIC;  							--	CPLD -> FPGA (CS)
		TDO : OUT STD_LOGIC;  							--	FPGA -> CPLD (Data out)
		--------------------	I2C		----------------------------
		I2C_SDAT : INOUT STD_LOGIC;						--	I2C Data
		I2C_SCLK : OUT STD_LOGIC;						--	I2C Clock
		--------------------	PS2		----------------------------
		PS2_DAT : IN STD_LOGIC;							--	PS2 Data
		PS2_CLK : IN STD_LOGIC;							--	PS2 Clock
		--------------------	VGA		----------------------------
		VGA_CLK : OUT STD_LOGIC;   						--	VGA Clock
		VGA_HS : OUT STD_LOGIC;							--	VGA H_SYNC
		VGA_VS : OUT STD_LOGIC;							--	VGA V_SYNC
		VGA_BLANK : OUT STD_LOGIC;						--	VGA BLANK
		VGA_SYNC : OUT STD_LOGIC;						--	VGA SYNC
		VGA_R : OUT STD_LOGIC_VECTOR(9 downto 0);		--	VGA Red[9:0]
		VGA_G : OUT STD_LOGIC_VECTOR(9 downto 0);		--	VGA Green[9:0]
		VGA_B : OUT STD_LOGIC_VECTOR(9 downto 0);		--	VGA Blue[9:0]
		------------	Ethernet Interface	------------------------
		ENET_DATA : INOUT STD_LOGIC_VECTOR(15 downto 0);--	DM9000A DATA bus 16Bits
		ENET_CMD : OUT STD_LOGIC;						--	DM9000A Command/Data Select; 0 = Command; 1 = Data
		ENET_CS_N : OUT STD_LOGIC;						--	DM9000A Chip Select
		ENET_WR_N : OUT STD_LOGIC;						--	DM9000A Write
		ENET_RD_N : OUT STD_LOGIC;						--	DM9000A Read
		ENET_RST_N : OUT STD_LOGIC;						--	DM9000A Reset
		ENET_INT : IN STD_LOGIC;						--	DM9000A Interrupt
		ENET_CLK : OUT STD_LOGIC;						--	DM9000A Clock 25 MHz
		----------------	Audio CODEC		------------------------
		AUD_ADCLRCK : INOUT STD_LOGIC;					--	Audio CODEC ADC LR Clock
		AUD_ADCDAT : IN STD_LOGIC;						--	Audio CODEC ADC Data
		AUD_DACLRCK : INOUT STD_LOGIC;					--	Audio CODEC DAC LR Clock
		AUD_DACDAT : OUT STD_LOGIC;						--	Audio CODEC DAC Data
		AUD_BCLK : INOUT STD_LOGIC;						--	Audio CODEC Bit-Stream Clock
		AUD_XCK : OUT STD_LOGIC;						--	Audio CODEC Chip Clock
		----------------	TV Decoder		------------------------
		TD_DATA : IN STD_LOGIC_VECTOR(7 downto 0); 		--	TV Decoder Data bus 8 bits
		TD_HS : IN STD_LOGIC;							--	TV Decoder H_SYNC
		TD_VS : IN STD_LOGIC;							--	TV Decoder V_SYNC
		TD_RESET : OUT STD_LOGIC;						--	TV Decoder Reset
		--------------------	GPIO	----------------------------
		GPIO_0 : INOUT STD_LOGIC_VECTOR(35 downto 0);	--	GPIO Connection 0
		GPIO_1 : INOUT STD_LOGIC_VECTOR(35 downto 0)	--	GPIO Connection 1
	);
END ENTITY de2;

ARCHITECTURE de2 OF de2 IS

constant PATTERN_SIZE : integer := PATTERN_SIZE;
constant PATTERN_CLASS_COUNT : integer := PATTERN_CLASS_COUNT;
constant PATTERN_TRAINING_COUNT : integer := PATTERN_TRAINING_COUNT;

-- pattern recognizer
signal pr_ready : std_logic := '0';
signal pr_inputs : std_logic_vector(PATTERN_SIZE - 1 downto 0) := (others => '0');
signal pr_output : integer := 0;
signal pr_training_mse : float := float_half;
signal pr_training_mse_sel : std_logic_vector(1 downto 0) := "00";

-- ann
signal ann_alpha : float := float_one;
signal ann_inputs : float_vector(PATTERN_SIZE - 1 downto 0) := (others => float_zero);
signal ann_outputs : float_vector(PATTERN_CLASS_COUNT - 1 downto 0) := (others => float_zero);
signal ann_targets : float_vector(PATTERN_CLASS_COUNT - 1 downto 0) := (others => float_zero);
signal ann_ready : std_logic := '0';
signal ann_mse : float := float_zero;
signal ann_mode : ann_mode := idle;

-- alu
SIGNAL float_alu_ready : STD_LOGIC := '0';
SIGNAL float_alu_a, float_alu_b, float_alu_c : float := float_zero;
SIGNAL float_alu_mode : float_alu_mode := idle;

-- sram
signal sram_address : sram_address := (others=>'0');
signal sram_input : sram_data := (others=>'0');
signal sram_output : sram_data := (others=>'0');
signal sram_mode : sram_mode := read;
signal sram_ready : std_logic := '0';

-- lfsr
signal lfsr_output : std_logic_vector(15 downto 0) := (others=>'0');

-- lcd
signal lcd_dd : CHAR_VECTOR(0 to 31) := (others => x"00");
signal lcd_cg : CHAR_GRAPHICS_VECTOR(0 to 7) := (others => (others => '0'));

-- display
signal display_mode : display_mode := training;
signal display_mode_sel : STD_LOGIC_VECTOR(2 downto 0) := "000";

BEGIN

-- alu
float_alu0 : float_alu
	port map (
		NOT KEY(0),
		CLOCK_50,
		float_alu_a,
		float_alu_b,
		float_alu_c,
		float_alu_mode,
		float_alu_ready
	);

-- SRAM
sram0 : sram
	port map (
		NOT KEY(0),
		CLOCK_50,
		sram_address,
		sram_input,
		sram_output,
		sram_mode,
		sram_ready,
		SRAM_DQ,
		SRAM_ADDR,
		SRAM_UB_N,
		SRAM_LB_N,
		SRAM_WE_N,
		SRAM_CE_N,
		SRAM_OE_N
	);

-- LFSR
lfsr0 : lfsr
	port map(
		NOT KEY(0),
		CLOCK_50,
		lfsr_output
	);

-- ann
ann0 : ann
	generic map (
		PATTERN_SIZE,
		PATTERN_SIZE + PATTERN_CLASS_COUNT,
		PATTERN_CLASS_COUNT
	)
	port map (
		NOT KEY(0) OR NOT KEY(1),
		CLOCK_50,
		ann_mode,
		ann_alpha,
		ann_inputs,
		ann_targets,
		ann_outputs,
		ann_mse,
		ann_ready,
		float_alu_a,
		float_alu_b,
		float_alu_c,
		float_alu_mode,
		float_alu_ready,
		sram_address,
		sram_input,
		sram_output,
		sram_mode,
		sram_ready,
		lfsr_output
	);

-- pr
pr0 : pr
	generic map (
		PATTERN_SIZE,
		PATTERN_CLASS_COUNT,
		PATTERN_TRAINING_COUNT
	)
	port map (
		NOT KEY(0) OR NOT KEY(1),
		CLOCK_50,
		NOT KEY(3),
		PATTERN_TRAINING_DATA,
		PATTERN_TRAINING_CLASS,
		pr_training_mse,
		pr_inputs,
		pr_output,
		pr_ready,
		ann_mode,
		ann_alpha,
		ann_inputs,
		ann_targets,
		ann_outputs,
		ann_mse,
		ann_ready,
		lfsr_output
	);

-- lcd
lcd0 : lcd
	port map (
		NOT KEY(0),
		CLOCK_50,
		lcd_dd,
		lcd_cg,
		LCD_ON,
		LCD_BLON,
		LCD_RW,
		LCD_EN,
		LCD_RS,
		LCD_DATA
	);

-- display
display0 : display
	port map (
		NOT KEY(0),
		CLOCK_50,
		display_mode,
		pr_inputs,
		PATTERN_DISPLAY(pr_output),
		lcd_dd,
		lcd_cg
	);


-- display mode select
display_mode_sel <= pr_ready & ann_ready & not KEY(3);
with display_mode_sel select
display_mode <=
	training when "000"|"001"|"010"|"011",
	running when "100"|"101"|"111",
	idle when "110";
	
-- pattern input
pr_inputs <= SW(17 downto 2);

-- bist indicator
LEDG(8) <= pr_ready;

-- mean squared error display
LEDR <= ann_mse(31 downto 14);

-- training accuracy select
pr_training_mse_sel <= SW(1 downto 0);
with pr_training_mse_sel select
pr_training_mse <=
	float_half when "00",
	float_1_10 when "01",
	float_1_20 when "10",
	float_1_100 when "11";

-- output class display
LEDG(7 downto 0) <= std_logic_vector(to_unsigned(pr_output, 8));

-- power off the 7 segment displays
HEX0 <= (others => '1');
HEX1 <= (others => '1');
HEX2 <= (others => '1');
HEX3 <= (others => '1');
HEX4 <= (others => '1');
HEX5 <= (others => '1');
HEX6 <= (others => '1');
HEX7 <= (others => '1');

END ARCHITECTURE de2;

