-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
-- Grant did not have a complete 6800 design - this fills that gap
--
-- Changes to this code by Doug Gilliland 2020-2022
--
-- MC6800 CPU running MIKBUG from back in the day
--		25 MHz internal
--		16.7 MHz external SRAM
--	32K+16+4 = 52KB (internal) SRAM
--		48KB contiguous space
--		4KB scratchpad
--	128 banks of 8KB of external SRAM (1MB total)
-- 	Bank Select register (7 bits)
-- MIKBUG ROM
--		60 KB version relocates ROM and I/O to xF000-xF8FF address range
--		http://www.retrotechnology.com/restore/smithbug.html
--		https://github.com/douggilliland/Retro-Computers/tree/master/6800/A68%206800%20Assembler_SMITHBUG_AT__F000
-- MC6850 ACIA UART
--		USC-Serial
-- VDU
--		XGA 80x25 character display
--		PS/2 keyboard
-- Select Jumper (J3-1) switches between
--		VDU (Video Display Unit) VGA + PS/2 keyboard (J3-1 off)
--		External Serial Port (J3-1 on)
--	Memory Map
--		x0000-x7fff - 32KB Internal SRAM
--		x8000-xbfff - 16KB Internal SRAM
--		xc000-xdfff - 8 KB external SRAM, 64 banks, 1MB SRAM total
--		xe000-xefff - 4KB Internal SRAM (TOP IS SCRATCHPAD)
--		xf000-xffff - 4 KB ROM
--		xfc00-xfcff - I/O space
--			xfc18-xfc19 - VDU/UART (6850 Interface)
--			xfc28-xfc29 - UART.VDU (6850 Interface)
--			xfc30 - Bank Select register (r/w)
--			xfc31 - 8-bit output Latch IOPINs
--			xfc32 - 8-bit output Latch IOPINs
--			xfc40-xfc47 - SD Card
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

		-- PS/2 keyboard
		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		-- USB Serial with Handshake
		i_utxd1				: in	std_logic := '1';
		o_urxd1				: out std_logic;
		i_urts1				: in	std_logic := '1';
		o_ucts1				: out std_logic;
		i_serSelect			: in	std_logic := '1';		-- Switch J3-1 selects between VDU and ACIA
		
		IO_PIN		: inout std_logic_vector(44 downto 3) := x"000000000"&"00";
	
		-- Not using the SD Card but reserving pins and making inactive
		o_sdCS				: out		std_logic :='1';
		o_sdMOSI				: out		std_logic :='0';
		i_sdMISO				: in		std_logic;
		o_sdSCLK				: out		std_logic :='0';
		o_driveLED			: out		std_logic :='1';

		-- SRAM banked space
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		o_extSRamAddress	: out std_logic_vector(19 downto 0);
		o_n_extSRamWE		: out std_logic := '1';
		o_n_extSRamCS		: out std_logic := '1';
		o_n_extSRamOE		: out std_logic := '1';

		-- Not using the SD RAM but making sure that it's not active
		o_n_sdRamCas		: out std_logic := '1';		-- CAS
		o_n_sdRamRas		: out std_logic := '1';		-- RAS
		o_n_sdRamWe			: out std_logic := '1';		-- SDWE
		o_n_sdRamCe			: out std_logic := '1';		-- SD_NCS0
		o_sdRamClk			: out std_logic := '1';		-- SDCLK0
		o_sdRamClkEn		: out std_logic := '1';		-- SDCKE0
		o_sdRamAddr			: out std_logic_vector(14 downto 0) := "000"&x"000";
		io_sdRamData		: in std_logic_vector(15 downto 0) := (others=>'Z')
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';
	signal wCPUResetHi	: std_logic := '1';

	-- CPU Signals
	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;

	-- Memory and Peripheral Data
	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_ramData32K	: std_logic_vector(7 downto 0);
	signal w_ramData16K	: std_logic_vector(7 downto 0);
	signal w_ramData4K	: std_logic_vector(7 downto 0);
	signal w_if1DataOut	: std_logic_vector(7 downto 0);
	signal w_if2DataOut	: std_logic_vector(7 downto 0);
	signal w_SDData		: std_logic_vector(7 downto 0);
	signal latValA			: std_logic_vector(7 downto 0);
	signal latValB			: std_logic_vector(7 downto 0);

	-- Memory controls
	signal w_n_SRAMCE		: std_logic;
	signal w_bankAdr		: std_logic;
	signal w_n_ldAdrVal	: std_logic;
	signal adrLatVal		: std_logic_vector(6 downto 0);

	-- Interface control lines
	signal w_n_if1CS		: std_logic :='1';
	signal w_n_if2CS		: std_logic :='1';
	signal w_n_SDCS		: std_logic :='1';
	signal w_n_ldLatValA	: std_logic :='1';
	signal w_n_ldLatValB	: std_logic :='1';

	-- CPU Clock
	signal q_cpuClkCount	: std_logic_vector(5 downto 0); 
	signal w_cpuClock		: std_logic;

   -- External Serial Port Clock enable
   signal serialEn      : std_logic;
	
begin

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

	-- External SRAM
	w_n_SRAMCE	<= '0' 	when w_cpuAddress(15 downto 13) = "110" else		-- $C000-$DFFF 8KB External SRAM
						'1';
	w_bankAdr	<= '1'	when w_cpuAddress(15 downto 13) = "110" else 
						'0';
	o_n_extSRamCS <= w_n_SRAMCE or (not w_vma);
	o_n_extSRamWE <= w_n_SRAMCE or (not w_vma) or      w_R1W0  or (w_cpuClock);
	o_n_extSRamOE <= w_n_SRAMCE or (not w_vma) or (not w_R1W0) ;
	o_extSRamAddress(19 downto 13)	<= adrLatVal(6 downto 0);				-- 128 banks OF 8KB is 1MB
	o_extSRamAddress(12 downto 0) 	<= w_cpuAddress(12 downto 0);
	io_extSRamData <= w_cpuDataOut when ((w_n_SRAMCE = '0') and (w_R1W0 = '0')) else
							(others => 'Z');

	-- Address Latch - 6-bits, 64 banks, 16KB bank size, 1MB total
	addrLatch : entity work.OutLatch
		GENERIC map (
			n	=>  7
		)
		port map
		(
			dataIn	=> w_cpuDataOut(6 downto 0),
			clock		=> i_CLOCK_50,
			load		=> w_n_ldAdrVal or w_R1W0 or (not w_vma) or (not w_cpuClock),
			clear		=> w_resetLow,
			latchOut	=> adrLatVal
		);

	-- Output Latch - 8-bits
	addrLat1 : entity work.OutLatch
		GENERIC map (
			n	=>  8
		)
		port map
		(
			dataIn	=> w_cpuDataOut,
			clock		=> i_CLOCK_50,
			load		=> w_n_ldLatValA or w_R1W0 or (not w_vma) or (not w_cpuClock),
			clear		=> w_resetLow,
			latchOut	=> latValA
		);
	
	-- Output Latch - 8-bits
	addrLat2 : entity work.OutLatch
		GENERIC map (
			n	=>  8
		)
		port map
		(
			dataIn	=> w_cpuDataOut,
			clock		=> i_CLOCK_50,
			load		=> w_n_ldLatValB or w_R1W0 or (not w_vma) or (not w_cpuClock),
			clear		=> w_resetLow,
			latchOut	=> latValB
		);
	
	IO_PIN(18 downto 3) <= latValB & latValA;
		
	-- ____________________________________________________________________________________
	-- I/O CHIP SELECTS
	w_n_if1CS		<=	'0' 	when (i_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  xFC18-xFC19
							'0'	when (i_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA xFC28-xFC29
							'1';
	w_n_if2CS		<= '0' 	when (i_serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA xFC28-xFC29
							'0'	when (i_serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  xFC18-xFC19
							'1';
	w_n_ldAdrVal	<= '0'	when (w_cpuAddress = x"FC30") else '1';
	w_n_ldLatValA	<= '0' 	when (w_cpuAddress = x"FC31") else '1';
	w_n_ldLatValB	<= '0' 	when (w_cpuAddress = x"FC32") else '1';
	w_n_SDCS			<= '0' 	when (w_cpuAddress = x"FC40") else '1';
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		w_ramData32K	when w_cpuAddress(15) = '0'					else	-- x0000-x7FFF (32 KB) Internal 32KB SRAM
		w_ramData16K	when w_cpuAddress(15 downto 14) = "10"		else	-- x8000-xBFFF (16KB) Internal 16KB SRAM
		io_extSRamData	when w_n_SRAMCE = '0'							else	-- xC000-xDfff (8KB) External SRAM
		w_ramData4K		when w_cpuAddress(15 downto 12) = x"E"		else	-- xE000-xEFFF (4KB) Internal 4KB Scratchpad SRAM
		w_if1DataOut	when w_n_if1CS = '0'								else	-- xFC18-xFC19 or $FC28-$FC29
		w_if2DataOut	when w_n_if2CS = '0'								else	-- xFC28-xFC29 or $FC18-$FC19
		"0"&adrLatVal	when w_n_ldAdrVal = '0' 						else	-- xFC30
		w_SDData			when w_n_SDCS = '0' 								else	-- SD Card
		w_romData		when w_cpuAddress(15 downto 12) = x"F"		else	-- xF0000-xFFFF - Must be last
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
	-- MIKBUG ROM xF000-xFFFF
	-- 4KB MIKBUG ROM - repeats in memory 4 times
	rom1 : entity work.M6800_MIKBUG_6OKB
		port map (
			address	=> w_cpuAddress(11 downto 0),
			clock 	=> i_CLOCK_50,
			q			=> w_romData
		);
		
	-- ____________________________________________________________________________________
	-- 32KB RAM	x0000-x7fff
	sram32K : entity work.InternalRam32K
		PORT map  (
			address	=> w_cpuAddress(14 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> (not w_R1W0) and (not w_cpuAddress(15)) and w_vma and (not w_cpuClock),
			q			=> w_ramData32K
		);
	
	-- ____________________________________________________________________________________
	-- 16KB RAM x8000-xbfff
	sram16K : entity work.InternalRam16K
		PORT map  (
			address	=> w_cpuAddress(13 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> (not w_R1W0) and w_cpuAddress(15) and (not w_cpuAddress(14)) and w_vma and (not w_cpuClock),
			q			=> w_ramData16K
		);
	
	-- ____________________________________________________________________________________
	-- 4KB RAM xE000-xEFFF - Used as scratchpad RAM
	sram4K : entity work.InternalRam4K
		PORT map  (
			address	=> w_cpuAddress(11 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> (not w_R1W0) and w_cpuAddress(15) and w_cpuAddress(14) and w_cpuAddress(13) and (not w_cpuAddress(12)) and w_vma and (not w_cpuClock),
			q			=> w_ramData4K
		);
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	vdu : entity work.SBCTextDisplayRGB
		GENERIC map (
			EXTENDED_CHARSET	=>  1,
			COLOUR_ATTS_ENABLED => 1
		)
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			n_WR		=> w_n_if1CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> w_n_if1CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			-- VGA video signals
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			videoR0	=> o_videoR0,
			videoR1	=> o_videoR1,
			videoG0	=> o_videoG0,
			videoG1	=> o_videoG1,
			videoB0	=> o_videoB0,
			videoB1	=> o_videoB1,
			-- PS/2 keyboard
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	-- ACIA UART serial interface
	ACIA : entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_WR		=> w_n_if2CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> w_n_if2CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> i_utxd1,
			txd		=> o_urxd1,
			n_cts		=> i_urts1,
			n_rts		=> o_ucts1
		);
	
	SDCtrlr : entity work.sd_controller
	port map (
		-- CPU
		n_reset 	=> i_n_reset,
		n_rd		=> w_n_SDCS or w_cpuClock or (not w_R1W0),
		n_wr		=> w_n_SDCS or w_cpuClock or w_R1W0,
		dataIn	=> w_cpuDataOut,
		dataOut	=> w_SDData,
		regAddr	=> w_cpuAddress(2 downto 0),
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
	-- CPU Clock
	-- Need 2 clocks high for externl SRAM can get by with 1 clock low
	-- Produces a 40 nS wide write strobe - 45 nS SRAMs need a 35 nS write pulse, so this works
	process (i_CLOCK_50, w_n_SRAMCE)
		begin
			if rising_edge(i_CLOCK_50) then
				if w_n_SRAMCE = '0' then
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
				if q_cpuClkCount < 1 then							-- one clock low
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;
			end if;
		end process;
	
	-- Baud Rate Generator
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_CLOCK_50,
		o_serialEn	=> serialEn
	);

end;
