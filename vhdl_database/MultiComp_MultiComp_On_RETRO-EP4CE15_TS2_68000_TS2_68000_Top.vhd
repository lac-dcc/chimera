-- Jeff Tranter's TS2 in an FPGA
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
--			16.7 MHz
--			24-bit address space
--		ROM Monitors
--			ROM Space reserved 0x008000-0x00FFFF
--			Teeside TS2BUG 3KB 0x008000-0x00BFFF (16KB used), or
--			MECB TUTOR 16KB Monitor ROMs 0x008000-0x00BFFF (16KB used)
--		Internal SRAM
--			32KB Internal SRAM 0x000000-0x007FFF
-- 	1 MB External SRAM 0x300000-0x3FFFFF (byte addressible only)
--		ANSI Video Display Unit (VDU)
--			VGA and PS/2
--			Appears as a 6850 ACIA interface
--			VDUSTAT	= 0x010041
--			VDUDATA	= 0x010043
--		6850 ACIA UART - USB to Serial
--			ACIASTAT	= 0x010041
--			ACIADATA	= 0x010043
--		DC power options
--			USB
---		DC Jack on FPGA board
--
-- Doug Gilliland 2020
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity TS2_68000_Top is
	port(
		i_CLOCK_50	: in std_logic;
		n_reset		: in std_logic;
		
		rxd1			: in std_logic := '1';
		txd1			: out std_logic;
		cts1			: in std_logic := '1';
		rts1			: out std_logic;
		serSelect	: in std_logic := '1';
		
		videoR0		: out std_logic := '1';
		videoG0		: out std_logic := '1';
		videoB0		: out std_logic := '1';
		videoR1		: out std_logic := '1';
		videoG1		: out std_logic := '1';
		videoB1		: out std_logic := '1';
		hSync			: out std_logic := '1';
		vSync			: out std_logic := '1';

		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic;
		
		IO_PIN		: out std_logic_vector(48 downto 3);
		
		-- External SRAM
		extSramData		: inout std_logic_vector(7 downto 0);
		extSramAddress	: out std_logic_vector(19 downto 0);
		n_extsRamWE		: out std_logic := '1';
		n_extsRamCS		: out std_logic := '1';
		n_extsRamOE		: out std_logic := '1';
		
		-- Not using the SD RAM but making sure that it's not active
		n_sdRamCas	: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas	: out std_logic := '1';		-- RAS
		n_sdRamWe	: out std_logic := '1';		-- SDWE
		n_sdRamCe	: out std_logic := '1';		-- SD_NCS0
		sdRamClk		: out std_logic := '1';		-- SDCLK0
		sdRamClkEn	: out std_logic := '1';		-- SDCKE0
		sdRamAddr	: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData	: in std_logic_vector(15 downto 0);
		
		-- SD Card not used but making sure that it's not active
		sdCS			: out std_logic	:= '1';
		sdMOSI		: out std_logic	:= '1';
		sdMISO		: in std_logic		:= '1';
		sdSCLK		: out std_logic	:= '1';
		driveLED		: out std_logic	:='1'		-- D5 LED
	);
end TS2_68000_Top;

architecture struct of TS2_68000_Top is

	-- CPU Control signals
	signal cpuAddress					: std_logic_vector(31 downto 0);
	signal cpuDataOut					: std_logic_vector(15 downto 0);
	signal cpuDataIn					: std_logic_vector(15 downto 0);
	signal n_WR							: std_logic;
	signal w_nUDS      				: std_logic;
	signal w_nLDS      				: std_logic;
	signal w_buserr     				: std_logic;
	signal w_busstate      			: std_logic_vector(1 downto 0);
	signal w_nResetOut      		: std_logic;
	signal w_FC      					: std_logic_vector(2 downto 0);
	signal w_clr_berr      			: std_logic;

	-- Interrupts from peripherals
	signal w_n_IRQ5					: std_logic :='1';	
	signal w_n_IRQ6					: std_logic :='1';	
	
	-- Chip Selects
	signal w_n_RomCS					: std_logic :='1';
	signal w_n_RamCS					: std_logic :='1';
	signal w_WrRamByteEn				: std_logic_vector(1 downto 0) := "00";
	signal w_wrRamStrobe				: std_logic :='0';
	signal w_n_VDUCS					: std_logic :='1';
	signal w_n_ACIACS					: std_logic :='1';
	signal n_externalRam1CS			: std_logic :='1';
	signal w_grey_cnt					: std_logic_vector(3 downto 0) := "0000";
	signal w_cpuclken					: std_logic :='0';

	-- Data sources into CPU
	signal w_MonROMData				: std_logic_vector(15 downto 0);
	signal w_sramData					: std_logic_vector(15 downto 0);
	signal w_VDUDataOut				: std_logic_vector(7 downto 0);
	signal w_extSramDataOut			: std_logic_vector(15 downto 0);
	signal w_ACIADataOut				: std_logic_vector(7 downto 0);
	signal w_PeriphData				: std_logic_vector(7 downto 0);

	-- CPU clock counts
	signal w_cpuCount					: std_logic_vector(5 downto 0); 
	signal w_cpuClock					: std_logic;
	signal w_resetLow					: std_logic := '1';

   -- Serial clock enables
	signal w_serialCount         	: std_logic_vector(15 downto 0) := x"0000";
   signal w_serialCount_d       	: std_logic_vector(15 downto 0);
   signal w_serialEn            	: std_logic;
	
begin

	-- Debounce the reset line
	DebounceResetSwitch	: entity work.debounce
	port map (
		clk		=> i_CLOCK_50,
		button	=> n_reset,
		result	=> w_resetLow
	);
	
	IO_PIN(48) <= w_cpuClock;
	IO_PIN(47) <= n_WR;
	IO_PIN(46) <= w_nLDS;
	IO_PIN(45) <= w_nUDS;
	IO_PIN(44) <= w_resetLow;
	IO_PIN(43) <= w_n_RomCS;
	IO_PIN(42) <= cpuAddress(14);
	IO_PIN(41) <= cpuAddress(15);
	IO_PIN(40) <= w_grey_cnt(0);
	IO_PIN(39) <= w_grey_cnt(1);
	IO_PIN(38) <= w_grey_cnt(2);
	IO_PIN(37) <= w_grey_cnt(3);
	IO_PIN(36) <= '0';
	IO_PIN(35) <= '0';
	IO_PIN(34) <= '0';
	IO_PIN(33) <= '0';
	IO_PIN(32) <= '0';
	IO_PIN(31) <= '0';
	IO_PIN(30) <= '0';
	IO_PIN(29) <= '0';
	IO_PIN(28) <= '0';
	IO_PIN(27) <= '0';
	IO_PIN(26) <= '0';

	-- ____________________________________________________________________________________
	-- 68000 CPU
	
	-- Wait states for external SRAM
	w_cpuclken <= 	n_externalRam1CS or ((not n_externalRam1CS) and w_grey_cnt(3));
	
	waitCount : entity work.GrayCounter
		port map (
			Clk		=> i_CLOCK_50,
			Rst		=> n_externalRam1CS,
			En			=> not n_externalRam1CS,
			output	=> w_grey_cnt
		);
		
	w_buserr <= '0';
					--'1' when ((cpuAddress(23 downto 14) = x"00"&"11") and ((w_nUDS = '0') or (w_nLDS = '0'))) else
					--'0';
	
	CPU68K : entity work.TG68KdotC_Kernel
		port map (
			clk				=> w_cpuClock,
			nReset			=> n_reset,
			clkena_in		=> w_cpuclken,
			data_in			=> cpuDataIn,
			IPL				=> "111",
			IPL_autovector => '0',
			berr				=> w_buserr,
			CPU				=> "00",
			addr				=> cpuAddress,
			data_write		=> cpuDataOut,
			nWr				=> n_WR,
			nUDS				=> w_nUDS,			-- D8..15 select
			nLDS				=> w_nLDS,			-- D0..7 - select
			busstate			=> w_busstate,		-- 
			nResetOut		=> w_nResetOut,
			FC					=> w_FC,
			clr_berr			=> w_clr_berr
		); 
	
	-- ____________________________________________________________________________________
	-- BUS ISOLATION

	cpuDataIn <=
		w_VDUDataOut & w_VDUDataOut	when w_n_VDUCS 	= '0' else
		w_ACIADataOut & w_ACIADataOut	when w_n_ACIACS	= '0' else
		w_MonROMData						when w_n_RomCS		= '0' else
		w_sramData							when w_n_RamCS		= '0' else
		extSramData&extSramData	 		when n_externalRam1CS	= '0' else	-- External SRAM (byte access only)
		x"dead";
	
	-- ____________________________________________________________________________________
	-- TS2 Monitor ROM
	
	w_n_RomCS <=	'0' when ((cpuAddress(23 downto 14) = x"00"&"10")   and ((w_busstate(1) = '1') or (w_busstate(0) = '0')))	else	-- x008000-x00BFFF (MAIN EPROM)
						'0' when ((cpuAddress(23 downto 3) =  x"00000"&'0') and ((w_busstate(1) = '1') or (w_busstate(0) = '0')))	else	-- X000000-X000007 (VECTORS)
						'1';
	
	rom1 : entity work.Monitor_68K_ROM -- Monitor
		port map (
			address 	=> cpuAddress(13 downto 1),
			clock		=> i_CLOCK_50,
			q			=> w_MonROMData
		);
	
	-- ____________________________________________________________________________________
	-- 32KB SRAM
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_RamCS 			<= '0' when ((w_n_RomCS = '1') and (cpuAddress(23 downto 15) = x"00"&'0') and ((w_busstate(1) = '1') or (w_busstate(0) = '0')))	else	-- x000008-x007fff
								'1';
	w_wrRamStrobe		<= (not n_WR) and (not w_n_RamCS) and (w_cpuClock);
	w_WrRamByteEn(1)	<= (not n_WR) and (not w_nUDS) and (not w_n_RamCS);
	w_WrRamByteEn(0)	<= (not n_WR) and (not w_nLDS) and (not w_n_RamCS);
	
	ram1 : ENTITY work.RAM_16Kx16
		PORT map	(
			address		=> cpuAddress(14 downto 1),
			clock			=> i_CLOCK_50,
			data			=> cpuDataOut,
			byteena		=> w_WrRamByteEn,
			wren			=> w_wrRamStrobe,
			q				=> w_sramData
		);
	
	-- 1MB External SRAM (can only be accessed as bytes) - no dynamic bus sizin
	n_externalRam1CS <= '0' when ((cpuAddress(23 downto 20) = x"3") and (w_busstate(1) = '1'))	else	-- x30000-x3fffff
							  '1';
	extSramAddress(19 downto 1) <= cpuAddress(19 downto 1);
	extSramAddress(0) <= w_nLDS;
	extSramData <= cpuDataOut(7 downto 0) when ((n_externalRam1CS = '0') and (w_nUDS = '0') and (n_WR = '0')) else 
						cpuDataOut(7 downto 0) when ((n_externalRam1CS = '0') and (w_nLDS = '0') and (n_WR = '0')) else
						(others => 'Z');

	n_extsRamWE <= n_WR or n_externalRam1CS or (w_nLDS and w_nUDS) or (w_grey_cnt(3));
	n_extsRamOE <= (not n_WR) or n_externalRam1CS;
	n_extsRamCS <= n_externalRam1CS or ((not w_grey_cnt(1)) and (not w_grey_cnt(2)) and (not w_grey_cnt(3)));
	
	-- Route the data to the peripherals
	w_PeriphData <= 	cpuDataOut(15 downto 8)	when (w_nUDS = '0') else
							cpuDataOut(7 downto 0)  when (w_nLDS = '0') else
							x"00";
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant Searle's VGA driver
	
	w_n_VDUCS <= '0' when ((cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (serSelect = '1') and (w_busstate(1) = '1'))	 else -- x01004X - Based on monitor.lst file ACIA address
					 '0' when ((cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (serSelect = '0') and (w_busstate(1) = '1'))	 else 
					 '1';
	
	U29 : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> n_reset,
			clk		=> i_CLOCK_50,
			
			-- RGB CompVideo signals
			hSync		=> hSync,
			vSync		=> vSync,
			videoR0	=> videoR0,
			videoR1	=> videoR1,
			videoG0	=> videoG0,
			videoG1	=> videoG1,
			videoB0	=> videoB0,
			videoB1	=> videoB1,
			n_wr		=> w_n_VDUCS or      n_WR or w_cpuClock,
			n_rd		=> w_n_VDUCS or (not n_WR),
			n_int		=> w_n_IRQ5,
			regSel	=> cpuAddress(1),
			dataIn	=> w_PeriphData(7 downto 0),
			dataOut	=> w_VDUDataOut,
			ps2clk	=> ps2Clk,
			ps2Data	=> ps2Data
		);
	
	-- Neal Crook's bufferedUART - uses clock enables
	
	w_n_ACIACS <= '0' when ((cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (serSelect = '1') and (w_busstate(1) = '1')) else -- x01004X - Based on monitor.lst file ACIA address
					  '0' when ((cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (serSelect = '0') and (w_busstate(1) = '1')) else
					  '1';
							
	U30 : entity work.bufferedUART
		port map(
			clk		=> i_CLOCK_50, 
			n_wr		=> w_n_ACIACS or      n_WR  or w_cpuClock,
			n_rd		=> w_n_ACIACS or (not n_WR),
			n_int		=> w_n_IRQ6,
			regSel	=> cpuAddress(1),
			dataIn	=> w_PeriphData(7 downto 0),
			dataOut	=> w_ACIADataOut,
			rxClkEn	=> w_serialEn,
			txClkEn	=> w_serialEn,			
			rxd		=> rxd1,
			txd		=> txd1,
--			n_cts		=> cts1,
			n_rts		=> rts1
		);
	

	-- ____________________________________________________________________________________
	-- SYSTEM CLOCKS
	
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
				if w_cpuCount < 2 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
					w_cpuCount <= w_cpuCount + 1;
				else
					w_cpuCount <= (others=>'0');
				end if;
				if w_cpuCount < 2 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;
			end if;
		end process;
	
	
	-- Baud Rate CLOCK SIGNALS
	
	baud_div: process (w_serialCount_d, w_serialCount)
		 begin
			  w_serialCount_d <= w_serialCount + 2416;
		 end process;

	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
			  -- Enable for baud rate generator
			  w_serialCount <= w_serialCount_d;
			  if w_serialCount(15) = '0' and w_serialCount_d(15) = '1' then
					w_serialEn <= '1';
			  else
					w_serialEn <= '0';
			  end if;
			end if;
		end process;

end;
