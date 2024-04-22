-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page was at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020-2021
--
-- MC6800 CPU
--		25 MHz ROM and Peripherals
--		16.7 MHz External SRAM
--	MIKBUG ROM (from back in the day)
--		https://hackaday.io/project/170126-mikbug-on-multicomp
-- Smithbug version
--		http://www.retrotechnology.com/restore/smithbug.html
--	60KB (external) SRAM version
-- MC6850 ACIA UART
-- VDU
--		XGA 80x25 character display
--		PS/2 keyboard
--	Jumper selectable for UART/VDU
--		Install jumper from J8-14 TO -15 (FPGA PIN_60) to adjacent ground pin to select ACIA
--
-- The Memory Map is:
--		$0000-$EFFF - 60KB SRAM (external RAM on the EPCE-DB card)
--		$FC18-$FC19 - ACIA J8-18 to J8-20 installed (or VDU J8-18 to J8-20 not installed)
-- 	$FC28-$FC29 - VDU J8-18 to J8-20 installed (or ACIA J8-18 to J8-20 not installed)
--		$FC30 - J8 I/O
--			D0-D6
--		$FC31 - J6 I/O
--			D0-D5
--		$FC32 - LEDS
--			D0 = DS1 LED on EP2C5-DB card (1 = ON)
--		$F000-$FFFF - MIKBUG ROM (repeats 4 times from 0xC000-0xFFFF)
--			Hole for I/O at $FC00-$FCFF
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity M6800_MIKBUG is
	port(
		i_n_reset			: in std_logic := '1';
		i_CLOCK_50			: in std_logic;

		-- VGA
		o_videoR0			: out std_logic := '1';
		o_videoR1			: out std_logic := '1';
		o_videoG0			: out std_logic := '1';
		o_videoG1			: out std_logic := '1';
		o_videoB0			: out std_logic := '1';
		o_videoB1			: out std_logic := '1';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';

		-- PS/2
		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		-- Derial
		i_rxd1				: in	std_logic := '1';
		o_txd1				: out std_logic;
		o_rts1				: out std_logic;
--		w_serSelect			: in	std_logic := '1';
		
		-- 128KB SRAM (60KB used)
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		o_extSRamAddress	: out std_logic_vector(16 downto 0);
		o_n_extSRamWE		: out std_logic := '1';
		o_n_extSRamCS		: out std_logic := '1';
		o_n_extSRamOE		: out std_logic := '1';
		
		-- SD card not used but making sure that it's not active
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '1';
		i_sdMISO				: in std_logic;
		o_sdSCLK				: out std_logic := '1';
--		o_driveLED			: out std_logic :='1';
		
		-- I/O
		o_ledDS1				: inout std_logic;
		o_ledD2				: inout std_logic;
		o_ledD4				: inout std_logic;
		o_ledD5				: inout std_logic;
		o_J6IO8				: inout std_logic_vector(7 downto 0) := (others=>'0');
		J8IO8					: inout std_logic_vector(7 downto 0)
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';
	signal wCPUResetHi		: std_logic := '1';

	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;
	signal w_memWR			: std_logic;
	signal w_memRD			: std_logic;

	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_VDUDataOut	: std_logic_vector(7 downto 0);
	signal w_ACIADataOut	: std_logic_vector(7 downto 0);
	
	signal w_ExtRamAddr	: std_logic :='0';
--	signal w_IOSel			: std_logic :='0';
	signal w_n_VDUint		: std_logic :='1';
	signal n_vduCSN		: std_logic :='1';
	signal w_n_ACIAint	: std_logic :='1';	
	signal w_aciaCSN	: std_logic :='1';
	signal w_n_J6IOCS		: std_logic :='1';
	signal w_n_J8IOCS		: std_logic :='1';
	signal w_n_LEDCS		: std_logic :='1';
	signal w_ledDS18 		: std_logic_vector(7 downto 0);
	
	signal w_cpuClkCt		: std_logic_vector(3 downto 0); 
	signal w_cpuClock		: std_logic;
	
   signal w_serialEn    : std_logic;
	signal w_serSelect   : std_logic;
	
	signal w_J8IO8			: std_logic_vector(7 downto 0);
	
begin

-- Debug
--	J8IO8(0)	<= w_cpuClock;				-- Pin 48
--	J8IO8(1)	<= not (w_ExtRamAddr and w_cpuClock);			-- Pin 47
--	J8IO8(2)	<= w_memWR;					-- Pin 52
--	J8IO8(3)	<= w_memRD;					-- Pin 51
--	J8IO8(4)	<= w_vma;					-- Pin 58
--	J8IO8(5)	<= w_resetLow;				-- Pin 55
--	J8IO8(6)	<= '0';
	J8IO8(6 downto 0) <= "0000000";
	w_serSelect <= J8IO8(7);
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk		=> w_cpuClock,
		i_PinIn	=> i_n_reset,
		o_PinOut	=> w_resetLow
	);
	
	-- Need CPU reset to be later and later than peripherals
	process (w_cpuClock)
		begin
			if rising_edge(w_cpuClock) then
				wCPUResetHi <= not w_resetLow;
			end if;
		end process;

	-- ____________________________________________________________________________________
	-- External SRAM GOES HERE	
	w_ExtRamAddr <= 	'1' when w_cpuAddress(15) = '0' else										-- 0x0000 - 0x7FFF
							'1' when (w_cpuAddress(15 downto 14)="10") else 						-- 0x8000 - 0XBFFF
							'1' when ((w_cpuAddress(15)='1') and (w_cpuAddress(13)='0')) else	-- 0xC000 - 0xDFFF
							'1' when ((w_cpuAddress(15)='1') and (w_cpuAddress(12)='0')) else	-- 0xE000 - 0xEFFF
							'0';
	
	o_extSRamAddress	<= '0'&w_cpuAddress(15 downto 0);
	io_extSRamData		<= w_cpuDataOut when ((w_R1W0='0') and (w_ExtRamAddr = '1')) else
							  (others => 'Z');
	o_n_extSRamWE	<= not (w_ExtRamAddr and (not w_R1W0) and w_cpuClock and w_vma);
	o_n_extSRamOE	<= not (w_ExtRamAddr and      w_R1W0  and w_cpuClock and w_vma);
	o_n_extSRamCS	<= not (w_ExtRamAddr and                                 w_vma);
	
	w_memWR <= (not w_R1W0) and w_cpuClock and w_vma;
	w_memRD <=      w_R1W0  and w_cpuClock and w_vma;
	
	-- ____________________________________________________________________________________
	-- I/O CHIP SELECTS
	n_vduCSN	<= '0' 	when (w_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  $FC18-$FC19
					'0'	when (w_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA $FC28-$FC29
					'1';
	w_aciaCSN <= '0'	when (w_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA $FC28-$FC29
					 '0'	when (w_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  $FC18-$FC19
					 '1';
	w_n_J8IOCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress = x"FC30")	else	-- J8 I/O $8030
					'1';
	w_n_J6IOCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress = x"FC31")	else	-- J6 I/O $8031
					'1';
	w_n_LEDCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress = x"FC32")	else	-- LEDS $8032
					'1';
	
--	w_ioSel <= '1' when w_cpuAddress(15 downto 8)="FC" else '0';
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		io_extSRamData	when w_ExtRamAddr = '1'						else
		w_VDUDataOut	when n_vduCSN = '0'							else
		w_ACIADataOut	when w_aciaCSN = '0'							else
		w_ledDS18		when w_n_LEDCS = '0'							else
		o_J6IO8			when w_n_J6IOCS = '0'						else
		w_J8IO8			when w_n_J8IOCS = '0'						else
		w_romData;																		-- Always last to open hole for I/O
	
	-- ____________________________________________________________________________________
	-- 6800 CPU
	cpu1 : entity work.cpu68
		port map(
			clk		=> w_cpuClock,
			rst		=> wCPUResetHi,
			rw			=> w_R1W0,
			vma		=> w_vma,
			address	=> w_cpuAddress,
			data_in	=> w_cpuDataIn,
			data_out	=> w_cpuDataOut,
			hold		=> '0',
			halt		=> '0',
			irq		=> '0',
			nmi		=> '0'
		); 
	
	-- ____________________________________________________________________________________
	-- MIKBUG ROM
	-- 4KB MIKBUG ROM
	rom1 : entity work.M6800_MIKBUG_60KB
		port map (
			clock 	=> i_CLOCK_50,
			address	=> w_cpuAddress(11 downto 0),
			q			=> w_romData
		);
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	vdu : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			-- RGB Compo_video signals
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			videoR0	=> o_videoR0,
			videoR1	=> o_videoR1,
			videoG0	=> o_videoG0,
			videoG1	=> o_videoG1,
			videoB0	=> o_videoB0,
			videoB1	=> o_videoB1,
			n_wr		=> n_vduCSN or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> n_vduCSN or (not w_R1W0) or (not w_vma) or (not w_cpuClock),
--			n_int		=> w_n_VDUint,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_VDUDataOut,
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	-- ACIA UART serial interface
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_wr		=> w_aciaCSN or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> w_aciaCSN or (not w_R1W0) or (not w_vma) or (not w_cpuClock),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_ACIADataOut,
--			n_int		=> w_n_ACIAint,
			rxClkEn	=> w_serialEn,
			txClkEn	=> w_serialEn,
			rxd		=> i_rxd1,
			txd		=> o_txd1,
--			n_cts		=> o_cts1,
			n_rts		=> o_rts1
		);
	
	latchIO0 : entity work.OutLatch	--Output LatchIO
	port map(
		clear		=> w_resetLow,
		clock		=> i_CLOCK_50,
		load		=> not ((not w_n_J6IOCS) and w_memWR),
		dataIn	=> w_cpuDataOut,
		latchOut	=> o_J6IO8
	);

	latchIO1 : entity work.OutLatch	--Output LatchIO
	port map(
		clear		=> w_resetLow,
		clock		=> i_CLOCK_50,
		load		=> not ((not w_n_J8IOCS) and w_memWR),
		dataIn	=> w_cpuDataOut,
		latchOut	=> w_J8IO8
	);

	o_ledDS1		<= w_ledDS18(0);
	o_ledD2		<= not w_ledDS18(1);
	o_ledD4		<= not w_ledDS18(2);
	o_ledD5		<= not w_ledDS18(3);

	latchLED : entity work.OutLatch	--Output LatchIO
	port map(
		clear		=> w_resetLow,
		clock		=> i_CLOCK_50,
		load		=> not ((not w_n_LEDCS) and w_memWR),
		dataIn	=> w_cpuDataOut,
		latchOut => w_ledDS18
	);

	-- ____________________________________________________________________________________
	-- CPU Clock
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
					if w_ExtRamAddr = '1' then
						if w_cpuClkCt < 2 then						-- 50 MHz / 3 = 16.7 MHz 
							w_cpuClkCt <= w_cpuClkCt + 1;
						else
							w_cpuClkCt <= (others=>'0');
						end if;
					else
						if w_cpuClkCt < 1 then						-- 50 MHz / 2 = 25 MHz
							w_cpuClkCt <= w_cpuClkCt + 1;
						else
							w_cpuClkCt <= (others=>'0');
						end if;
					end if;
					if w_cpuClkCt < 1 then						-- 2 clocks high, one low
						w_cpuClock <= '0';
					else
						w_cpuClock <= '1';
					end if;
				end if;
		end process;
	
	-- Baud Rate Generator
-- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_CLOCK_50,
		o_serialEn	=> w_serialEn
	);

end;
