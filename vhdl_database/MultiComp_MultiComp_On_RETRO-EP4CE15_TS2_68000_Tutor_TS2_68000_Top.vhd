-- Jeff Tranter's TS2 in an FPGA
-- 68K CU Core Copyright (c) 2009-2013 Tobias Gubener        
--
-- Doug Gilliland 2020
--
-- Documented on Hackaday at:
--		https://hackaday.io/project/173678-retro-68000-cpu-in-an-fpga
--
-- Baseboard is
--		http://land-boards.com/blwiki/index.php?title=RETRO-EP4CE15
-- FPGA board is
--		http://land-boards.com/blwiki/index.php?title=QMTECH_EP4CE15_FPGA_Card
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
--			64KB Internal SRAM 0x200000-0x20FFFF
--			32KB Internal SRAM 0x210000-0x217FFF
-- 	1 MB External SRAM 0x300000-0x3FFFFF (byte addressible only)
--		ANSI Video Display Unit (VDU)
--			VGA and PS/2
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
		n_reset		: in std_logic;				-- SW2 (back corner of FPGA)
		i_CLOCK_50	: in std_logic;
		
		rxd1			: in std_logic := '1';
		txd1			: out std_logic;
		cts1			: in std_logic := '0';		-- Does not work with TUTOR and LOad S record command
		rts1			: out std_logic;
		serSelect	: in std_logic := '1';		-- J3-1 - pull to adjacent ground pin with A shunt or remove
		
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
		
		IO_PIN		: out std_logic_vector(48 downto 3);		-- Used for debugging
		
		-- External SRAM Not used but assigning pins so it's not active
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
		sdRamData	: in std_logic_vector(15 downto 0)
	);
end TS2_68000_Top;

architecture struct of TS2_68000_Top is

	-- CPU Control signals
	signal w_cpuAddress				: std_logic_vector(31 downto 0);
	signal w_cpuDataOut				: std_logic_vector(15 downto 0);
	signal w_cpuDataIn				: std_logic_vector(15 downto 0);
	signal n_WR							: std_logic;
	signal w_nUDS      				: std_logic;
	signal w_nLDS      				: std_logic;
	signal w_busstate      			: std_logic_vector(1 downto 0);
	signal w_nResetOut      		: std_logic;
	signal w_FC      					: std_logic_vector(2 downto 0);
	signal w_IPL     					: std_logic_vector(2 downto 0) := "111";
	signal w_iack	      			: std_logic := '0';
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

	-- Data sources into CPU
	signal w_MonROMData				: std_logic_vector(15 downto 0);
	signal w_sramData					: std_logic_vector(15 downto 0);
	signal w_VDUDataOut				: std_logic_vector(7 downto 0);
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
	
   signal w_rXd	            	: std_logic;
   signal w_txd	            	: std_logic;
   signal w_n_cts	            	: std_logic;
   signal w_n_rts	            	: std_logic;
	
begin

	txd1 <= w_txd;
	rts1 <= w_n_rts;
	
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
	IO_PIN(44) <= w_n_RomCS;
	IO_PIN(43) <= w_n_RamCS;
	IO_PIN(42) <= w_n_VDUCS;
	IO_PIN(41) <= w_n_ACIACS;
	IO_PIN(40) <= w_txd;
	IO_PIN(39) <= rXd1;
	IO_PIN(38) <= w_n_rts;
	IO_PIN(37) <= cts1;
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
	
	CPU68K : entity work.TG68KdotC_Kernel
		port map (
			clk				=> w_cpuClock,
			nReset			=> w_resetLow,
			clkena_in		=> '1',
			data_in			=> w_cpuDataIn,
			IPL				=> w_IPL,
			IPL_autovector => w_iack,
			berr				=> '0',
			CPU				=> "00",				-- 68000 CPU
			addr				=> w_cpuAddress,
			data_write		=> w_cpuDataOut,
			nWr				=> n_WR,
			nUDS				=> w_nUDS,			-- D8..15 select
			nLDS				=> w_nLDS,			-- D0..7 - select
			busstate			=> w_busstate,		-- 
			nResetOut		=> w_nResetOut,
			FC					=> w_FC,
			clr_berr			=> w_clr_berr
		);
		
		-- Interrupt Priority encoder
		w_IPL <= "010" when w_n_IRQ5 = '0' else
					"011" when w_n_IRQ6 = '0' else
					"111";
					
		-- Interrupt Acknowledge decoder
		w_iack <= '1' when ((w_FC = "111") and (w_cpuAddress(3 downto 1) = "101") and ((w_nUDS = '0') or (w_nLDS = '0'))) else		-- IRQ = 5
					 '1' when ((w_FC = "111") and (w_cpuAddress(3 downto 1) = "110") and ((w_nUDS = '0') or (w_nLDS = '0'))) else		-- IRQ = 6
					 '0';
							
	-- ____________________________________________________________________________________
	-- BUS ISOLATION

	w_cpuDataIn <=
		w_VDUDataOut & w_VDUDataOut	when w_n_VDUCS 	= '0' else
		w_ACIADataOut & w_ACIADataOut	when w_n_ACIACS	= '0' else
		w_MonROMData						when w_n_RomCS		= '0' else
		w_sramData							when w_n_RamCS		= '0' else
		x"FFFF";
	
	-- ____________________________________________________________________________________
	-- TS2Bug Monitor ROM 4KB (uses less than 4KB)
	-- Tutor Monitpr ROM needs 16KB
	
	w_n_RomCS <=	'0' when (w_cpuAddress(23 downto 14) = x"00"&"10")	else 		-- x008000-x00BFFF (MAIN EPROM)
						'0' when (w_cpuAddress(23 downto 3) =  x"00000"&'0')	else		-- X000000-X000007 (VECTORS)
						'1';
	
	rom1 : entity work.Monitor_68K_ROM -- Monitor
		port map (
			address 	=> w_cpuAddress(13 downto 1),
			clock		=> i_CLOCK_50,
			q			=> w_MonROMData
		);
	
	-- ____________________________________________________________________________________
	-- 32KB SRAM
	-- The RAM address input is delayed due to being registered so the gate is the true of the clock not the low level
	
	w_n_RamCS 			<= '0' when ((w_n_RomCS = '1') and (w_cpuAddress(23 downto 15) = x"00"&'0'))	else	-- x000008-x007fff
								'1';
	w_wrRamStrobe		<= (not n_WR) and (not w_n_RamCS) and (w_cpuClock);
	w_WrRamByteEn(1)	<= (not n_WR) and (not w_nUDS) and (not w_n_RamCS);
	w_WrRamByteEn(0)	<= (not n_WR) and (not w_nLDS) and (not w_n_RamCS);
	
	ram1 : ENTITY work.RAM_16Kx16
		PORT map	(
			address		=> w_cpuAddress(14 downto 1),
			clock			=> i_CLOCK_50,
			data			=> w_cpuDataOut,
			byteena		=> w_WrRamByteEn,
			wren			=> w_wrRamStrobe,
			q				=> w_sramData
		);
	
	-- Route the data to the peripherals
	w_PeriphData <= 	w_cpuDataOut(15 downto 8)	when (w_nUDS = '0') else
							w_cpuDataOut(7 downto 0)  when (w_nLDS = '0') else
							x"00";
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant Searle's VGA driver
	
	w_n_VDUCS <= '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (serSelect = '1'))	 else -- x01004X - Based on monitor.lst file ACIA address
					 '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (serSelect = '0'))	 else 
					 '1';
	
	U29 : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> w_resetLow,
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
			regSel	=> w_cpuAddress(1),
			dataIn	=> w_PeriphData(7 downto 0),
			dataOut	=> w_VDUDataOut,
			ps2clk	=> ps2Clk,
			ps2Data	=> ps2Data
		);
	
	-- Neal Crook's bufferedUART - uses clock enables
	
	w_n_ACIACS <= '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nLDS = '0') and (serSelect = '1')) else -- x01004X - Based on monitor.lst file ACIA address
					  '0' when ((w_cpuAddress(23 downto 4) = x"01004") and (w_nUDS = '0') and (serSelect = '0')) else
					  '1';
							
	U30 : entity work.bufferedUART
		port map(
			clk		=> i_CLOCK_50, 
			n_wr		=> w_n_ACIACS or      n_WR  or w_cpuClock,
			n_rd		=> w_n_ACIACS or (not n_WR),
			n_int		=> w_n_IRQ6,
			regSel	=> w_cpuAddress(1),
			dataIn	=> w_PeriphData(7 downto 0),
			dataOut	=> w_ACIADataOut,
			rxClkEn	=> w_serialEn,
			txClkEn	=> w_serialEn,			
			rxd		=> rxd1,
			txd		=> w_txd,
			n_cts		=> cts1,
			n_rts		=> w_n_rts
		);
	

	-- ____________________________________________________________________________________
	-- SYSTEM CLOCKS
	
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
				if w_cpuCount < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
					w_cpuCount <= w_cpuCount + 1;
				else
					w_cpuCount <= (others=>'0');
				end if;
				if w_cpuCount < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;
			end if;
		end process;
	
	
	-- Baud Rate CLOCK SIGNALS
    -- Baud   Increment
    -- 115200 2416
    -- 38400  805
    -- 19200  403
    -- 9600   201
    -- 4800   101
    -- 2400   50
	
	baud_div: process (w_serialCount_d, w_serialCount)
		 begin
			  w_serialCount_d <= w_serialCount + 2416;
		 end process;

	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
			  w_serialCount <= w_serialCount_d;
			  -- Enable for baud rate generator
			  if w_serialCount(15) = '0' and w_serialCount_d(15) = '1' then
					w_serialEn <= '1';
			  else
					w_serialEn <= '0';
			  end if;
			end if;
		end process;

end;
