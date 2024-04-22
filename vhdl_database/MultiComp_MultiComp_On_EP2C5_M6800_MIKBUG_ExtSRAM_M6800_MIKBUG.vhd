-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page was at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020-2021
--
-- MC6800 CPU running MIKBUG from back in the day
--		https://hackaday.io/project/170126-mikbug-on-multicomp
--		25 MHz (everthing other than External SRAM)
--		16.7 MHz External SRAM accesses
-- Smithbug version
--		http://www.retrotechnology.com/restore/smithbug.html
--	32K (external) SRAM version
-- MC6850 ACIA UART
-- VDU
--		XGA 80x25 character display
--		PS/2 keyboard
--	Jumper selectable for UART/VDU
--
-- The Memory Map is:
--	$0000-$7FFF - SRAM (External RAM in the EPCE15)
--		$7f00-$7F7F - Used as MIKBUG scratchpad (I.E., RESERVED)
--	$8018-$8019 - ACIA J8-10 to J8-12 installed (or VDU J8-10 to J8-12 not installed)
-- $8028-$8029 - VDU J8-10 to J8-12 installed (or ACIA J8-10 to J8-12 not installed)
--	$8030 - J8 I/O
--		D0-D7
--	$8031 - J6 I/O
--		D0-D5
--	$8032 - LEDS
--		D0 = DS1 LED on EP2C5-DB card (1 = ON)
--	$C000-$CFFF - MIKBUG ROM (repeats 4 times from 0xC000-0xFFFF)
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

		o_videoR0			: out std_logic := '1';
		o_videoR1			: out std_logic := '1';
		o_videoG0			: out std_logic := '1';
		o_videoG1			: out std_logic := '1';
		o_videoB0			: out std_logic := '1';
		o_videoB1			: out std_logic := '1';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';

		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		i_rxd1				: in	std_logic := '1';
		o_txd1				: out std_logic;
		o_rts1				: out std_logic;
		
		-- 128KB SRAM (32KB used)
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		o_extSRamAddress	: out std_logic_vector(16 downto 0);
		o_n_extSRamWE		: out std_logic := '1';
		o_n_extSRamCS		: out std_logic := '1';
		o_n_extSRamOE		: out std_logic := '1';
		ledDS1				: inout std_logic;
		ledD2					: inout std_logic;
		ledD4					: inout std_logic;
		ledD5					: inout std_logic;
		J6IO8					: inout std_logic_vector(7 downto 0);
		J8IO8					: inout std_logic_vector(7 downto 0)
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';
	signal wCPUResetHi	: std_logic := '1';

	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;
	signal w_memWR			: std_logic;
	signal w_memRD			: std_logic;
	
	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_if1DataOut	: std_logic_vector(7 downto 0);
	signal w_if2DataOut	: std_logic_vector(7 downto 0);
	
	signal n_int1			: std_logic :='1';	
	signal n_int2			: std_logic :='1';	
	
	-- Chip Selects
	signal n_vduCSN		: std_logic :='1';
	signal n_aciaCSN		: std_logic :='1';
	signal n_J6IOCS		: std_logic :='1';
	signal n_J8IOCS		: std_logic :='1';
	signal n_LEDCS			: std_logic :='1';
	signal ledDS18 		: std_logic_vector(7 downto 0);

		-- CPU clock generation
	signal q_cpuClkCount	: std_logic_vector(5 downto 0); 
	signal w_cpuClock		: std_logic;
	
   signal serialEn      : std_logic;
	signal w_serSelect   : std_logic;
	signal w_J8IO8			: std_logic_vector(7 downto 0);
	
begin
	
	J8IO8(6 DOWNTO 0) <= w_J8IO8(6 downto 0);
--	J8IO8(0)	<= w_cpuClock;								-- Pin 48
--	J8IO8(1)	<= w_memWR;									-- Pin 47
--	J8IO8(2)	<= w_memRD;									-- Pin 52
--	J8IO8(3)	<= w_vma;									-- Pin 51
--	J8IO8(4)	<= w_cpuAddress(15) or (not w_vma);	-- Pin 58
--	J8IO8(5)	<= w_resetLow;								-- Pin 55
--	J8IO8(6)	<= '0';
	
	w_serSelect <= J8IO8(7);
	
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk			=> w_cpuClock,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_resetLow
	);
		
	-- Need CPU reset to be later and later than peripherals
	process (w_cpuClock)
		begin
			if rising_edge(w_cpuClock) then
				wCPUResetHi <= not w_resetLow;
			end if;
		end process;
	
	w_memWR <= (not w_R1W0) and w_vma and (w_cpuClock);
	w_memRD <=      w_R1W0  and w_vma and (w_cpuClock);
	-- ____________________________________________________________________________________
	-- RAM GOES HERE
	o_extSRamAddress	<= "00"&w_cpuAddress(14 downto 0);
	io_extSRamData		<= w_cpuDataOut when (w_R1W0='0' and (w_cpuAddress(15)='0')) else (others => 'Z');
	o_n_extSRamWE		<= not ((not w_cpuAddress(15)) and (w_memWR));
	o_n_extSRamOE		<= not ((not w_cpuAddress(15)) and (w_memRD));
	o_n_extSRamCS		<= w_cpuAddress(15) or (not w_vma);
	
	-- Debounce the reset line
	-- I/O CHIP SELECTS
	n_vduCSN	<= '0' 	when (w_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
					'0'	when (w_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
					'1';
	n_aciaCSN <= '0' 	when (w_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
					'0'	when (w_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
					'1';
	n_J8IOCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress(15 downto 0) = x"8030")				else	-- J8 I/O $8030
					'1';
	n_J6IOCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress(15 downto 0) = x"8031")				else	-- J6 I/O $8031
					'1';
	n_LEDCS	<= '0' 	when (w_vma = '1') and (w_cpuAddress(15 downto 0) = x"8032")				else	-- LEDS $8032
					'1';
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		io_extSRamData	when w_cpuAddress(15) = '0'					else
		w_if1DataOut	when n_vduCSN = '0'								else
		w_if2DataOut	when n_aciaCSN = '0'								else
		w_romData		when w_cpuAddress(15 downto 12) = x"F"		else
		ledDS18			when n_LEDCS = '0'								else
		J6IO8				when n_J6IOCS = '0'								else
		w_J8IO8			when n_J8IOCS = '0'								else
		x"FF";
	
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
	-- 4KB MIKBUG ROM - repeats in memory 4 times
	rom1 : entity work.M6800_MIKBUG_32KB 		
		port map (
			address	=> w_cpuAddress(11 downto 0),
			clock 	=> i_CLOCK_50,
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
			n_wr		=> n_vduCSN or (not w_memWR),
			n_rd		=> n_vduCSN or (not w_memRD),
			n_int		=> n_int1,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	-- ACIA UART serial interface
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_wr		=> n_aciaCSN or (not w_memWR),
			n_rd		=> n_aciaCSN or (not w_memRD),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			n_int		=> n_int2,
						 -- these clock enables are asserted for one period of input clk,
						 -- at 16x the baud rate.
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> i_rxd1,
			txd		=> o_txd1,
--			n_cts		=> i_cts1,
			n_rts		=> o_rts1
		);
	
	latchIO0 : entity work.OutLatch	--Output LatchIO
	port map(
		clear		=> w_resetLow,
		clock		=> i_CLOCK_50,
		load		=> not ((not n_J6IOCS) and (not w_R1W0) and (w_cpuClock)),
		dataIn	=> w_cpuDataOut,
		latchOut	=> J6IO8
	);

	latchIO1 : entity work.OutLatch	--Output LatchIO
	port map(
		clear		=> w_resetLow,
		clock		=> i_CLOCK_50,
		load		=> not ((not n_J8IOCS) and (not w_R1W0) and (w_cpuClock)),
		dataIn	=> w_cpuDataOut,
		latchOut	=> w_J8IO8
	);


ledDS1	<= ledDS18(0);
ledD2		<= not ledDS18(1);
ledD4		<= not ledDS18(2);
ledD5		<= not ledDS18(3);

latchLED : entity work.OutLatch	--Output LatchIO
port map(
	clear		=> w_resetLow,
	clock		=> i_CLOCK_50,
	load		=> not ((not n_LEDCS) and (not w_R1W0) and (w_cpuClock)),
	dataIn	=> w_cpuDataOut,
	latchOut => ledDS18
);

	-- CPU Clock
	process (i_CLOCK_50, w_cpuAddress(15))
		begin
			if rising_edge(i_CLOCK_50) then
				if (w_cpuAddress(15) = '0') then
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
				if q_cpuClkCount < 1 then						-- 2 clocks high, one low
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;
			end if;
		end process;

	
-- Pass Baud Rate in BAUD_RATE generic as integer value (300, 9600, 115,200)
-- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300	BaudRateGen : entity work.BaudRate6850
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_CLOCK_50,
		o_serialEn	=> serialEn
	);

end;
