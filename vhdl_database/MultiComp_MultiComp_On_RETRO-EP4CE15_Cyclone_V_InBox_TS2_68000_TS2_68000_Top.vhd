-- ____________________________________________________________________________________
-- Jeff Tranter's TS2 implemented in an FPGA
--		https://jefftranter.blogspot.com/2017/01/building-68000-single-board-computer_14.html
--
-- 68K CPU Core Copyright (c) 2009-2013 Tobias Gubener
--
-- Documented on Hackaday at:
--		https://hackaday.io/project/173678-retro-68000-cpu-in-an-fpga
--
-- Baseboard is
--		http://land-boards.com/blwiki/index.php?title=RETRO-EP4CE15
-- FPGA board is
--		http://land-boards.com/blwiki/index.php?title=QM_Tech_Cyclone_V_FPGA_Board
--
-- The main features are:
--		M68000 CPU
--			25 MHz for Internal SRAM/Peripherals
--			16.7 MHz for External SRAM
--			24-bit address space
--		ROM Monitors supported
--			16KN ROM Space reserved
--			Teeside TS2BUG (3KB used)
--			MECB TUTOR 16KB Monitor ROM
--		144KB Internal SRAM
-- 	External SRAM
--			1 MB (byte addressible only)
--		ANSI Video Display Unit (VDU)
--			VGA, 80x25 display
--			PS/2 keyboard
--		6850 ACIA UART - USB to Serial
--			115,200 baud
--		DIGIO
--			3+8+8 I/O
--			16 bits routed to J1 connector and front panel DB-25
--		DC power options
--			USB powers the card
--			DC Jack on FPGA board is not used
--
--	Memory Map
--		0x000000-0x007FFF - Internal SRAM (32KB)
--		0x008000-0x00BFFF - ROM Monitor (16KB)
--		0x00C000-0x00FFFF - Internal SRAM (16KB)
--		0x010041,0x010043 - ACIA
--			ACIASTAT	= 0x010041
--			ACIADATA	= 0x010043
--		0x010040,0x010042 - VDU
--			VDUSTAT	= 0x010041
--			VDUDATA	= 0x010043
--		0x010050-0x010058F - SD Card
--			0x010051 - SDDATA		read/write data
--			0x010053 - SDSTATUS	read
--			0x010053 - SDCONTROL	write
--			0x010055 - SDLBA0		write-only
--			0x010057 - SDLBA1		write-only
--			0x010059 - SDLBA2		write-only (only bits 6:0 are valid)
--		0x010061,0x010063 - GPIO
--			0x010061 - Address register
--				Address register value
--					0 DAT0 bits [2:0]
--					1 DDR0 bits [2:0]
--					2 DAT2 bits [7:0]
--					3 DDR2 bits [7:0]
--					4 DAT3 bits [7:0]
--					5 DDR3 bits [7:0]
--			0x010063 - Data register
--		0x200000-0x217FFF - Internal SRAM (96KB)
--		0x300000-0x3FFFFF - External SRAM (1MB byte addressable)
--
-- Doug Gilliland 2020-2022
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity TS2_68000_Top is
	port(
		-- Clock and reset
		i_CLOCK_50		: in std_logic;
		i_n_reset		: in std_logic;				-- Reset fromt panel
		
		-- USB-Serial interface FT230X
		i_rxd1			: in std_logic := '1';		-- Hardware Handshake needed
		o_txd1			: out std_logic;
		i_cts1			: in std_logic := '1';
		o_rts1			: out std_logic;
		i_serSelect		: in std_logic := '1';		-- Jumper with pullup in FPGA for selecting serial between ACIA (installed) and VDU (removed)
		
		-- Video
		o_videoR0		: out std_logic := '1';
		o_videoG0		: out std_logic := '1';
		o_videoB0		: out std_logic := '1';
		o_videoR1		: out std_logic := '1';
		o_videoG1		: out std_logic := '1';
		o_videoB1		: out std_logic := '1';
		o_hSync			: out std_logic := '1';
		o_vSync			: out std_logic := '1';

		-- PS/2 keyboard
		io_ps2Clk		: inout std_logic;
		io_ps2Data		: inout std_logic;
		
		-- 3 GPIO
		-- assigned to bit 0..2 of gpio0.
		-- Intended for connection to DS1302 RTC as follows:
		-- bit 2: CE
		-- bit 1: SCLK
		-- bit 0: I/O (Data)
		io_gpio0				: inout std_logic_vector(2 downto 0);
		-- 8 GPIO
		io_gpio2				: inout std_logic_vector(7 downto 0);
		-- 8 GPIO
		io_gpio3				: inout std_logic_vector(7 downto 0);

		-- 1MBx8 External SRAM
		io_sramData		: inout std_logic_vector(7 downto 0);
		o_sramAddress	: out std_logic_vector(19 downto 0);
		o_n_sRamWE		: out std_logic := '1';
		o_n_sRamCS		: out std_logic := '1';
		o_n_sRamOE		: out std_logic := '1';
		
		-- SD Card not used but making sure that it's not active
		o_sdCS		: out std_logic := '1';
		o_sdMOSI		: out std_logic := '1';
		i_sdMISO		: in std_logic  := '1';
		o_sdSCLK		: out std_logic := '1';
		o_driveLED	: out std_logic := '1';
		
		-- 32MB SDRAM not used but making sure that it's not active
		n_sdRamCas	: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas	: out std_logic := '1';		-- RAS
		n_sdRamWe	: out std_logic := '1';		-- SDWE
		n_sdRamCe	: out std_logic := '1';		-- SD_NCS0
		sdRamClk		: out std_logic := '1';		-- SDCLK0
		sdRamClkEn	: out std_logic := '1';		-- SDCKE0
		sdRamAddr	: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData	: in std_logic_vector(15 downto 0)
		
	);
end TS2_68000_Top;

architecture struct of TS2_68000_Top is

	signal w_resetLow				: std_logic := '1';
	
	-- CPU Bus and Control signals
	signal w_cpuAddress			: std_logic_vector(31 downto 0);
	signal w_cpuDataOut			: std_logic_vector(15 downto 0);
	signal w_cpuDataIn			: std_logic_vector(15 downto 0);
--	signal w_periphDataIn		: std_logic_vector(15 downto 0);
	signal w_n_WR					: std_logic;
	signal w_nUDS      			: std_logic;								-- d8-d15
	signal w_nLDS      			: std_logic;								-- D0-D7
	signal w_busstate      		: std_logic_vector(1 downto 0);		-- 00-> fetch code, 10->read data, 11->write data, 01->no memaccess
	signal w_nResetOut      	: std_logic;
	signal w_FC      				: std_logic_vector(2 downto 0);
	signal w_clr_berr      		: std_logic;

	-- Interrupts from peripherals
	signal w_n_IRQ5				: std_logic :='1';	
	signal w_n_IRQ6				: std_logic :='1';	

	-- Memory Chip Selects
	signal w_n_RomCS				: std_logic :='1';
	signal w_n_RamCS				: std_logic :='1';
	signal w_WrRamByteEn			: std_logic_vector(1 downto 0) := "00";
	signal w_wrRamStrobe			: std_logic :='0';
	signal w_n_RamCCS				: std_logic :='1';
	signal w_WrRamCByteEn		: std_logic_vector(1 downto 0) := "00";
	signal w_wrRamCStrobe		: std_logic :='0';
	signal w_n_Ram2CS				: std_logic :='1';
	signal w_WrRam2ByteEn		: std_logic_vector(1 downto 0) := "00";
	signal w_wrRam2Strobe		: std_logic :='0';
	signal w_n_Ram3CS				: std_logic :='1';
	signal w_WrRam3ByteEn		: std_logic_vector(1 downto 0) := "00";
	signal w_wrRam3Strobe		: std_logic :='0';
	signal w_n_extSRamCS		: std_logic :='1';

	-- Peripheral Chip Selects
	signal w_n_VDUCS				: std_logic :='1';
	signal w_n_ACIACS				: std_logic :='1';
	signal w_n_SDCS				: std_logic :='1';
	signal w_n_gpioCS				: std_logic :='1';
	signal w_n_WR_gpio			: std_logic :='1';

	-- Data sources into CPU
	signal w_MonROMData			: std_logic_vector(15 downto 0);
	signal w_sramDataOut			: std_logic_vector(15 downto 0);
	signal w_sramCDataOut		: std_logic_vector(15 downto 0);
	signal w_sram2DataOut		: std_logic_vector(15 downto 0);
	signal w_sram3DataOut		: std_logic_vector(15 downto 0);
	signal w_VDUDataOut			: std_logic_vector(7 downto 0);
	signal w_ACIADataOut			: std_logic_vector(7 downto 0);
	signal w_PeriphData			: std_logic_vector(7 downto 0);
	signal w_SDData				: std_logic_vector(7 downto 0);
	signal w_gpioDataOut			: std_logic_vector(7 downto 0);

	-- GPIO data
	signal w_gpio_dat0_i			: std_logic_vector(2 downto 0);
	signal w_gpio_dat0_o			: std_logic_vector(2 downto 0);
	signal w_n_gpio_dat0_oe		: std_logic_vector(2 downto 0);

	signal w_gpio_dat2_i			: std_logic_vector(7 downto 0);
	signal w_gpio_dat2_o			: std_logic_vector(7 downto 0);
	signal w_n_gpio_dat2_oe		: std_logic_vector(7 downto 0);

	signal w_gpio_dat3_i			: std_logic_vector(7 downto 0);
	signal w_gpio_dat3_o			: std_logic_vector(7 downto 0);
	signal w_n_gpio_dat3_oe		: std_logic_vector(7 downto 0);

	-- CPU clock counts
	signal q_cpuClkCount			: std_logic_vector(2 downto 0); 
	signal w_cpuClock				: std_logic;

	signal w_serialEn				: std_logic;

begin

	-- ____________________________________________________________________________________
	-- Debounce the reset line

	DebounceResetSwitch	: entity work.debounce
	port map (
		clk		=> w_cpuClock,
		button	=> i_n_reset,
		result	=> w_resetLow
	);

	-- ____________________________________________________________________________________
	-- 68000 CPU
		
	CPU68K : entity work.TG68KdotC_Kernel
		port map (
			clk				=> w_cpuClock,
			nReset			=> w_resetLow,
			clkena_in		=> '1',
			data_in			=> w_cpuDataIn,
			IPL				=> "111",
			IPL_autovector => '0',
			berr				=> '0',
			CPU				=> "00",				-- 68000 CPU
			addr				=> w_cpuAddress,
			data_write		=> w_cpuDataOut,
			nWr				=> w_n_WR,
			nUDS				=> w_nUDS,			-- D8..15 select
			nLDS				=> w_nLDS,			-- D0..7  select
			busstate			=> w_busstate,		-- 00-> fetch code, 10->read data, 11->write data, 01->no memaccess
			nResetOut		=> w_nResetOut,
			FC					=> w_FC,
			clr_berr			=> w_clr_berr
		); 
	
	-- ____________________________________________________________________________________
	-- Copy 8-bit peripheral reads from both halves of the data bus
	
	-- READ DATA MULTIPLEXER - EQUIVALENT TO TRI-STATE OUTPUTS FROM MEMORY AND PERIPHERALS
	w_cpuDataIn <=
		w_MonROMData						when w_n_RomCS				= '0' 	else	-- ROM
		w_sramCDataOut						when w_n_RamCCS			= '0' 	else	-- Internal SRAM
		w_sramDataOut						when w_n_RamCS				= '0' 	else	-- Internal SRAM
		w_sram2DataOut						when w_n_Ram2CS			= '0' 	else	-- Internal SRAM
		w_sram3DataOut						when w_n_Ram3CS			= '0' 	else	-- Internal SRAM
		io_sramData & io_sramData		when w_n_extSRamCS	= '0'		else	-- External SRAM (byte access only)
		w_VDUDataOut  & w_VDUDataOut	when w_n_VDUCS 			= '0' 	else	-- Display and keyboard	
		w_ACIADataOut & w_ACIADataOut	when w_n_ACIACS			= '0' 	else	-- ACIA
		w_SDData	     & w_SDData		when w_n_SDCS 				= '0' 	else	-- SD Card
		w_gpioDataOut & w_gpioDataOut	when w_n_gpioCS			= '0'		else	-- GPIO
		x"dead";
	
	-- ____________________________________________________________________________________
	-- TS2 or TUTOR Monitor ROM
	
	w_n_RomCS <=	'0' when ((w_cpuAddress(23 downto 14) = x"00"&"10")   and (w_busstate(0) = '0'))	else	-- x008000-x00BFFF (MAIN EPROM)
						'0' when ((w_cpuAddress(23 downto 3) =  x"00000"&'0') and (w_busstate(0) = '0'))	else	-- X000000-X000007 (VECTORS)
						'1';
	
	rom1 : entity work.Monitor_68K_ROM -- Monitor 16KB (8Kx16)
		port map (
			address 	=> w_cpuAddress(13 downto 1),
			clock		=> i_CLOCK_50,
			q			=> w_MonROMData
		);

	-- ____________________________________________________________________________________
	-- 32KB Internal SRAM 0x000000-0x007FFF
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_RamCS 			<= '0' when ((w_cpuAddress(23 downto 15) = x"00"&'0') and ((w_busstate(1) = '1') or (w_busstate(0) = '0')))	else	-- x000008-x007fff
								'1';
	w_wrRamStrobe		<= (not w_n_WR) and (not w_n_RamCS) and (not w_cpuClock);
	w_WrRamByteEn(1)	<= (not w_n_WR) and (not w_n_RamCS) and (not w_nUDS);
	w_WrRamByteEn(0)	<= (not w_n_WR) and (not w_n_RamCS) and (not w_nLDS);
	
	ram1 : ENTITY work.RAM_16Kx16 -- 32KB (16Kx16)
		PORT map	(
			address		=> w_cpuAddress(14 downto 1),
			clock			=> i_CLOCK_50,
			data			=> w_cpuDataOut,
			byteena		=> w_WrRamByteEn,
			wren			=> w_wrRamStrobe,
			q				=> w_sramDataOut
		);
	
	-- ____________________________________________________________________________________
	-- 16KB Internal SRAM 0x00C000-0x00ffff
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_RamCCS 			<= '0' when ((w_cpuAddress(23 downto 14) = x"00"&"11")	and ((w_busstate(1) = '1') or (w_busstate(0) = '0'))) else	-- x00C000-x00ffff
								'1';
	w_wrRamCStrobe		<= (not w_n_WR) and (not w_n_RamCCS) and (not w_cpuClock);
	w_WrRamCByteEn(1)	<= (not w_n_WR) and (not w_n_RamCCS) and (not w_nUDS);
	w_WrRamCByteEn(0)	<= (not w_n_WR) and (not w_n_RamCCS) and (not w_nLDS);
	
	ramC000: ENTITY work.RAM_8Kx16
	PORT map (
		address		=> w_cpuAddress(13 downto 1),
		byteena		=> w_WrRamCByteEn,
		clock			=> i_CLOCK_50,
		data			=> w_cpuDataOut,
		wren			=> w_wrRamCStrobe,
		q				=> w_sramCDataOut
	);
	
	-- ____________________________________________________________________________________
	-- 64KB Internal SRAM 0x200000-0x20FFFF
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_Ram2CS 			<= '0' when ((w_cpuAddress(23 downto 16) = x"20")	and ((w_busstate(1) = '1') or (w_busstate(0) = '0'))) else	-- x200000-x20ffff
								'1';
	w_wrRam2Strobe		<= (not w_n_WR) and (not w_n_Ram2CS) and (not w_cpuClock);
	w_WrRam2ByteEn(1)	<= (not w_n_WR) and (not w_n_Ram2CS) and (not w_nUDS);
	w_WrRam2ByteEn(0)	<= (not w_n_WR) and (not w_n_Ram2CS) and (not w_nLDS);
	
	ram200000 : ENTITY work.RAM_32Kx16 -- 64KB (32Kx16)
		PORT map	(
			address		=> w_cpuAddress(15 downto 1),
			clock			=> i_CLOCK_50,
			data			=> w_cpuDataOut,
			byteena		=> w_WrRam2ByteEn,
			wren			=> w_wrRam2Strobe,
			q				=> w_sram2DataOut
		);
	
	-- ____________________________________________________________________________________
	-- 32KB Internal SRAM 0x210000-0x217FFF
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_Ram3CS 			<= '0' when ((w_cpuAddress(23 downto 15) = x"21"&'0') and ((w_busstate(1) = '1') or (w_busstate(0) = '0')))	else	-- x210008-x217fff
								'1';
	w_wrRam3Strobe		<= (not w_n_WR) and (not w_n_Ram3CS) and (not w_cpuClock);
	w_WrRam3ByteEn(1)	<= (not w_n_WR) and (not w_n_Ram3CS) and (not w_nUDS);
	w_WrRam3ByteEn(0)	<= (not w_n_WR) and (not w_n_Ram3CS) and (not w_nLDS);
	
	ram210000 : ENTITY work.RAM_16Kx16 -- 32KB (16Kx16)
		PORT map	(
			address		=> w_cpuAddress(14 downto 1),
			clock			=> i_CLOCK_50,
			data			=> w_cpuDataOut,
			byteena		=> w_WrRam3ByteEn,
			wren			=> w_wrRam3Strobe,
			q				=> w_sram3DataOut
		);
		
	-- 1MB External SRAM (can only be accessed as bytes) - no dynamic bus sizing
	w_n_extSRamCS <=	'0' when ((w_cpuAddress(23 downto 20) = x"3") and (w_busstate(1) = '1'))	else	-- x30000-x3fffff
							'1';
	o_sramAddress(19 downto 1) <= w_cpuAddress(19 downto 1);
	o_sramAddress(0) <= w_nLDS;
	io_sramData <= w_cpuDataOut(7 downto 0) when ((w_n_extSRamCS = '0') and (w_nUDS = '0') and (w_n_WR = '0')) else 
						w_cpuDataOut(7 downto 0) when ((w_n_extSRamCS = '0') and (w_nLDS = '0') and (w_n_WR = '0')) else
						(others => 'Z');

	o_n_sRamWE <=  w_n_extSRamCS or      w_n_WR or (w_nLDS and w_nUDS);
	o_n_sRamOE <=  w_n_extSRamCS or (not w_n_WR);
	o_n_sRamCS <=	w_n_extSRamCS;
	
	-- Route the data to the peripherals
	w_PeriphData <= 	w_cpuDataOut(15 downto 8)	when (w_nUDS = '0') else
							w_cpuDataOut(7 downto 0)	when (w_nLDS = '0') else
							x"00";
							
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant Searle's VGA driver
	-- For byte accesses UDS and LDS act as A0
	
	w_n_VDUCS <= '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (i_serSelect = '1') and (w_busstate(1) = '1'))	 else -- x01004X - Based on monitor.lst file ACIA address
					 '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (i_serSelect = '0') and (w_busstate(1) = '1'))	 else 
					 '1';
	
	VDU : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			
			-- RGB CompVideo signals
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			videoR0	=> o_videoR0,
			videoR1	=> o_videoR1,
			videoG0	=> o_videoG0,
			videoG1	=> o_videoG1,
			videoB0	=> o_videoB0,
			videoB1	=> o_videoB1,
			-- 
			n_WR		=> w_n_VDUCS or      w_n_WR or w_cpuClock,
			n_rd		=> w_n_VDUCS or (not w_n_WR),
			n_int		=> w_n_IRQ5,
			regSel	=> w_cpuAddress(1),
			dataIn	=> w_PeriphData,
			dataOut	=> w_VDUDataOut,
			ps2clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	-- Neal Crook's bufferedUART - uses clock enables
	
	-- ____________________________________________________________________________________
	-- ACIA
	
	w_n_ACIACS <= '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (i_serSelect = '1') and (w_busstate(1) = '1')) else -- x01004X - Based on monitor.lst file ACIA address
					  '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (i_serSelect = '0') and (w_busstate(1) = '1')) else
					  '1';
							
	ACIA : entity work.bufferedUART
		port map(
			clk		=> i_CLOCK_50, 
			n_WR		=> w_n_ACIACS or      w_n_WR  or w_cpuClock,
			n_rd		=> w_n_ACIACS or (not w_n_WR),
			n_int		=> w_n_IRQ6,
			regSel	=> w_cpuAddress(1),
			dataIn	=> w_PeriphData,
			dataOut	=> w_ACIADataOut,
			rxClkEn	=> w_serialEn,
			txClkEn	=> w_serialEn,			
			rxd		=> i_rxd1,
			txd		=> o_txd1,
			n_cts		=> i_cts1,
			n_rts		=> o_rts1
		);
	
	-- ____________________________________________________________________________________
	-- SD Card
	
	w_n_SDCS <= '0' when ((w_cpuAddress(23 downto 4) = x"01005") and (w_nLDS = '0') and (w_busstate(1) = '1')) else -- x0100X - Based on monitor.lst file ACIA address
					'0' when ((w_cpuAddress(23 downto 4) = x"01005") and (w_nUDS = '0') and (w_busstate(1) = '1')) else
					'1';
							
	SDCtrlr : entity work.sd_controller
	port map (
		-- CPU
		n_reset 	=> w_resetLow,
		n_rd		=> w_n_SDCS or w_cpuClock or (not w_n_WR),
		n_WR		=> w_n_SDCS or w_cpuClock or w_n_WR,
		dataIn	=> w_PeriphData,
		dataOut	=> w_SDData,
		regAddr	=> w_cpuAddress(3 downto 1),
		clk 		=> i_CLOCK_50,
		-- SD Card SPI connections
		sdCS 		=> o_sdCS,
		sdMOSI	=> o_sdMOSI,
		sdMISO	=> i_sdMISO,
		sdSCLK	=> o_sdSCLK,
		-- LEDs
		driveLED	=> o_driveLED
	);
	
	-- ____________________________________________________________________________________
	-- GPIO, 3+8+8 ROUTES TO J1

	w_n_gpioCS <=	'0' when ((w_cpuAddress(23 downto 4) = x"01006") and (w_nLDS = '0') and (w_busstate(1) = '1')) else -- x0100X - Based on monitor.lst file ACIA address
						'0' when ((w_cpuAddress(23 downto 4) = x"01006") and (w_nUDS = '0') and (w_busstate(1) = '1')) else
						'1';
	w_n_WR_gpio <= w_n_gpioCS or w_n_WR;

	gpio1 : entity work.gpio16
   port map(
		n_reset => w_resetLow,
		clk => i_CLOCK_50,
		hold => '0',
		n_WR => w_n_WR_gpio,

		dataIn => w_PeriphData,
		dataOut => w_gpioDataOut,
		regAddr => w_cpuAddress(1),

		dat0_i => w_gpio_dat0_i,
		dat0_o => w_gpio_dat0_o,
		n_dat0_oe => w_n_gpio_dat0_oe,

		dat2_i => w_gpio_dat2_i,
		dat2_o => w_gpio_dat2_o,
		n_dat2_oe => w_n_gpio_dat2_oe,

		dat3_i => w_gpio_dat3_i,
		dat3_o => w_gpio_dat3_o,
		n_dat3_oe => w_n_gpio_dat3_oe
	);

    -- pin control. There's probably an easier way of doing this??
    w_gpio_dat0_i <= io_gpio0;
    pad_ctl_gpio0: process(w_gpio_dat0_o, w_n_gpio_dat0_oe)
    begin
      for gpio_bit in 0 to 2 loop
        if w_n_gpio_dat0_oe(gpio_bit) = '0' then
          io_gpio0(gpio_bit) <= w_gpio_dat0_o(gpio_bit);
        else
          io_gpio0(gpio_bit) <= 'Z';
        end if;
      end loop;
    end process;

    w_gpio_dat2_i <= io_gpio2;
    pad_ctl_gpio2: process(w_gpio_dat2_o, w_n_gpio_dat2_oe)
    begin
      for gpio_bit in 0 to 7 loop
        if w_n_gpio_dat2_oe(gpio_bit) = '0' then
          io_gpio2(gpio_bit) <= w_gpio_dat2_o(gpio_bit);
        else
          io_gpio2(gpio_bit) <= 'Z';
        end if;
      end loop;
    end process;

    w_gpio_dat3_i <= io_gpio3;
    pad_ctl_gpio3: process(w_gpio_dat3_o, w_n_gpio_dat3_oe)
    begin
      for gpio_bitX in 0 to 7 loop
        if w_n_gpio_dat3_oe(gpio_bitX) = '0' then
          io_gpio3(gpio_bitX) <= w_gpio_dat3_o(gpio_bitX);
        else
          io_gpio3(gpio_bitX) <= 'Z';
        end if;
      end loop;
    end process;

	-- ____________________________________________________________________________________
	-- CPU CLOCK
	
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
				if w_n_extSRamCS = '0' then
					if q_cpuClkCount < 2 then						-- 50 MHz / 3 = 16.7 MHz 
						q_cpuClkCount <= q_cpuClkCount + 1;
					else
						q_cpuClkCount <= (others=>'0');
					end if;
				else
					if q_cpuClkCount < 1 then						-- 50 MHz / 2 = 25 MHz
						q_cpuClkCount <= q_cpuClkCount + 1;
					else
						q_cpuClkCount <= (others=>'0');
					end if;
				end if;
--				if q_cpuClkCount < 1 then						-- one clock low
--					w_cpuClock <= '0';
--				else
--					w_cpuClock <= '1';
--				end if;
				if w_n_extSRamCS = '0' then
					if q_cpuClkCount < 2 then						-- two clocks low
						w_cpuClock <= '0';
					else
						w_cpuClock <= '1';
					end if;
				else
					if q_cpuClkCount < 1 then						-- one clock low
						w_cpuClock <= '0';
					else
						w_cpuClock <= '1';
					end if;
				end if;
			end if;
		end process;
	
	-- ____________________________________________________________________________________
	-- Baud Rate CLOCK SIGNALS
	--- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
	
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_CLOCK_50,
		o_serialEn	=> w_serialEn
	);

end;
