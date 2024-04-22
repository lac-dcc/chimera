---------------------------------------------------------------------------
-- Derived from Grant Searle's UK101 design:
--		http://searle.x10host.com/uk101FPGA/index.html
--		Differences from Grant's build
--			CEGMON compiled and moved to ROM
--			Added SD Controller
--			Added Grant's fast CPU via F1 key
--			40KB SRAM - Additional RAM sections opened although not contiguous
--			Bank selected SRAM (16 banks of 4KB)
--
-- Running on Land Boards EP2C5-DB card
--		http://land-boards.com/blwiki/index.php?title=EP2C5-DB
-- 
-- Features
-- 6502 CPU
-- 	Runs at 1 or 12.5 MHz (F1 key selects)
--		Power-up default is 1 MHz
-- 40K External SRAM accessible to BASIC
-- 16 banks of 4KB from $E000-$EFFF with bank select register
-- PS/2 Keyboard
--		F1 toggles Turbo mode (default = fast)
--		UK kayboard mapping (could be nice to change to US layout as option)
--		Emulates key matrix of the original unit
--		Keyboard mapping not standard US, see: 
--			http://land-boards.com/blwiki/index.php?title=RetroComputers#Keyboard_Layout
-- CEGMON Monitor (2KB)
--		Custom build replaces "standard" UK101 CEGMON
--		Replaces D option with S for SD card OS
--	Disk Monitor Extension ROM (2KB)
--		Called from boot screen with 'S' option
-- BASIC in ROM (8K)
--		Can't be directly removed without replacing I/O functions used by CEGMON
-- Composite Video
-- 	48 chars/row
--		16 rows
--		Could be upgraded to 64 chars/row and 32 rows (RAM size impact)
--	Serial port at 115,200 baud
--		Works with BASIC LOAD/SAVE commands
--		To load copy BASIC code using an editor and drop into PuTTY window
-- SD High Speed Controller
--		SPI mode
-- I/O connections
--		2x 8-bit output ports
--		LED Output
--
-- Memory Map
--		$0000-$9FFF - SRAM (40KB)
-- 	$A000-$BFFF - Microsoft BASIC-in-ROM (8KB)
--		$D000-$D3FF - 1KB Display RAM
--		$DC00 - PS/2 Keyboard
--		$E000-$EFFF - Bank Selectable SRAM (not detectable as BASIC RAM)
--		$F000-$F001 - ACIA (UART) 61440-61441 dec
--		$F002 - J6 I/O Connector 61442 dec
--		$F003 - J8 I/O Connector 61443 dec
-- 	$F004 - LED 61444 dec
-- 	$F005 - Bank Select Register 61445 dec
--			d0..d3 used for 128KB SRAMs
--		%F010-$F017 - SD card
--	    	0    SDDATA        read/write data
-- 	   1    SDSTATUS      read
--    	1    SDCONTROL     write
--    	2    SDLBA0        write-only
--    	3    SDLBA1        write-only
--   		4    SDLBA2        write-only (only bits 6:0 are valid)
--		$F800-$FFFF - CEGMON Monitor ROM 4K
--
---------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101 is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		
		-- SRAM
		sramData 	: inout std_logic_vector(7 downto 0);
		sramAddress : out std_logic_vector(16 downto 0);
		n_sRamWE 	: out std_logic;
		n_sRamCS 	: out std_logic;
		n_sRamOE 	: out std_logic;
		
		-- Serial port with handshake
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;
		
		-- Composite video
		videoSync	: out std_logic;
		video			: out std_logic;
		
		-- PS/2 keyboard
		ps2Clk		: in std_logic;
		ps2Data		: in std_logic;

		-- SD Card
		sdCS			: out std_logic;
		sdMOSI		: out std_logic;
		sdMISO		: in std_logic;
		sdSCLK		: out std_logic;
		driveLED		: out std_logic :='1';
		
		-- I/O ports
		ledOut		: out std_logic_vector(1 downto 0);
		J6IO8			: out std_logic_vector(7 downto 0);
		J8IO8			: out std_logic_vector(7 downto 0)
	);
end uk101;

architecture struct of uk101 is

	signal cpuAddress			: std_logic_vector(15 downto 0);
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);
	signal n_WR					: std_logic;
	signal n_memWR				: std_logic;

	-- Chip Selects
	signal n_dispRamCS		: std_logic :='1';
	signal n_ramCS				: std_logic :='1';
	signal n_basRomCS			: std_logic :='1';
	signal n_monitorRomCS 	: std_logic :='1';
	signal n_aciaCS			: std_logic :='1';
	signal n_sdCardCS			: std_logic :='1';
	signal n_kbCS				: std_logic :='1';
	signal n_J6IOCS			: std_logic :='1';
	signal n_J8IOCS			: std_logic :='1';
	signal n_LEDCS				: std_logic :='1';
	signal n_RAMBANKCS		: std_logic :='1';
		
	-- Data from peripherals
	signal basRomData			: std_logic_vector(7 downto 0);
	signal ramDataOut			: std_logic_vector(7 downto 0);
	signal monitorRomData 	: std_logic_vector(7 downto 0);
	signal aciaData			: std_logic_vector(7 downto 0);
	signal sdCardDataOut		: std_logic_vector(7 downto 0);
	signal kbReadData 		: std_logic_vector(7 downto 0);
	signal J6Data				: std_logic_vector(7 downto 0);
	signal J8Data				: std_logic_vector(7 downto 0);

	-- Display RAM
	signal dispAddrB 			: std_logic_vector(9 downto 0);
	signal dispRamDataOutA 	: std_logic_vector(7 downto 0);
	signal dispRamDataOutB 	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(10 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);

	-- Clocks
	signal cpuClkCount		: std_logic_vector(5 downto 0); 
	signal cpuClock			: std_logic;
	signal serialClock		: std_logic;
	signal serialClkCount	: std_logic_vector(14 downto 0); 

	-- Keyboard latch and read buffer
	signal kbRowSel 			: std_logic_vector(7 downto 0);
	signal fastMode 			: std_logic;
	signal f1Latch 			: std_logic;
	signal ledOut8 			: std_logic_vector(7 downto 0);
	signal bankReg 			: std_logic_vector(7 downto 0);

	signal sdLed	 			: std_logic;
	
begin

	driveLED <=  not sdLed;
	J6IO8(0) <= cpuClock;
	J6IO8(1) <= n_sdCardCS;
	J6IO8(2) <= n_sdCardCS or cpuClock or n_WR;
	J6IO8(3) <= n_sdCardCS or cpuClock or (not n_WR) or cpuaddress(1) or cpuaddress(2);
	
	-- External SRAM
	-- Added potential for 16 blocks of SRAM from $E000 to $EFFF
	-- Needs bank select register
	sramAddress(16) <= '0' when (cpuAddress(15) = '0') else
							 '0' when (cpuAddress(15 downto 13) = "100") else
							 '1';
	sramAddress(15 downto 12) <= cpuAddress(15 downto 12) when (cpuAddress(15) = '0') else 					-- $0000-$7FFF - SRAM
										  cpuAddress(15 downto 12) when (cpuAddress(15 downto 13) = "100") else		-- $8000-$9FFF - SRAM
										  bankReg(3 downto 0);																		-- Bank select register
	sramAddress(11 downto 0) <= cpuAddress(11 downto 0);
	sramData <= cpuDataOut when n_WR='0' else (others => 'Z');
	n_sRamWE <= (not cpuClock) nand (not n_WR);
	n_sRamOE <= (not cpuClock) nand n_WR;
	n_sRamCS <= n_ramCS;
	n_memWR <= (not cpuClock) nand (not n_WR);
	
	-- Chip Selects
	n_ramCS 			<= '0' when ((cpuAddress(15) = '0') or 										-- $0000-$7FFF - SRAM
										 (cpuAddress(15 downto 13) = "100") or							-- $8000-$9FFF - SRAM
										 (cpuAddress(15 downto 12) = x"E"))  							-- $E000-$EFFF - SRAM (57344-61439 dec)
										 else '1';
	n_basRomCS 		<= '0' when cpuAddress(15 downto 13) = "101" 				else '1';	-- $A000-$BFFF - 8k BASIC-in-ROM
	n_dispRamCS 	<= '0' when cpuAddress(15 downto 10) = x"d"&"00" 			else '1';	-- $D000-$D3FF - 1KB Display RAM
	n_kbCS 			<= '0' when cpuAddress(15 downto 10) = x"d"&"11" 			else '1';	-- $DC00 - PS/2 Keyboard
	n_monitorRomCS <= '0' when cpuAddress(15 downto 12) = x"f"		 			else '1';	-- $F000-$FFFF - CEGMON Monitor ROM 4K
	n_aciaCS 		<= '0' when cpuAddress(15 downto 1)  = x"f00"&"000" 		else '1';	-- $F000-$F001 (61444-5 dec) - ACIA (UART)
	n_J6IOCS			<= '0' when cpuAddress(15 downto 0)  = x"f002"				else '1';	-- $F002 (61442 dec) - J6 I/O Connector
	n_J8IOCS			<= '0' when cpuAddress(15 downto 0)  = x"f003"				else '1';	-- $F003 (61443 dec) - J8 I/O Connector
	n_LEDCS			<= '0' when cpuAddress(15 downto 0)  = x"f004"				else '1';	-- $F004 (61444 dec) - LED
	n_RAMBANKCS		<= '0' when cpuAddress(15 downto 0)  = x"f005"				else '1';	-- $F005 (61445 dec) - Bank Select register
	n_sdCardCS		<= '0' when cpuAddress(15 downto 3)  = x"f01"&'0'	 		else '1';	-- %F010-$F017 - SD card
										 
	-- Data mux into CPU
	cpuDataIn <=
		sramData 			when n_ramCS = '0' 								else
		basRomData 			when n_basRomCS = '0' 							else
		dispRamDataOutA 	when n_dispRamCS = '0' 							else
		kbReadData 			when n_kbCS='0'									else
		aciaData 			when n_aciaCS = '0' 								else
		sdCardDataOut		when n_sdCardCS = '0'							else
		x"F0" 				when (cpuAddress & fastMode)= x"FCE0"&'1'	else -- Address = $FCE0 and fastMode = 1 : CHANGE REPEAT RATE LOOP VALUE (was $10)
		monitorRomData 	when n_monitorRomCS = '0'						else	-- has to be after the xF00_ I/O due to address overlap
		J6Data				when n_J6IOCS = '0'								else
		J8Data				when n_J8IOCS = '0'								else
		ledOut8				when n_LEDCS = '0'								else
		bankReg				when n_RAMBANKCS = '0'							else
		x"FF";
		
	-- 6502 CPU
	CPU : entity work.T65
	port map(
		Enable => '1',
		Mode => "00",
		Res_n => n_reset,
		Clk => cpuClock,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => '1',
		SO_n => '1',
		R_W_n => n_WR,
		A(15 downto 0) => cpuAddress,
		DI => cpuDataIn,
		DO => cpuDataOut);

	SD_CONTROLLER : entity work.sd_controller
	port map(
		-- CPU interface
		clk		=> clk,		-- twice the spi clk
		n_reset	=> n_reset,
		regAddr	=> cpuAddress(2 downto 0),
		n_wr		=> n_sdCardCS or cpuClock or n_WR,
		n_rd		=> n_sdCardCS or cpuClock or (not n_WR) or cpuaddress(1) or cpuaddress(2),
		dataIn	=> cpuDataOut,
		dataOut	=> sdCardDataOut,
		-- SD card pins - SPI
		sdCS		=> sdCS,
		sdMOSI	=> sdMOSI,
		sdMISO	=> sdMISO,
		sdSCLK	=> sdSCLK,
		-- LED
		driveLED	=> sdLed
	);

	-- Microsoft BASIC in ROM
	BASIC_ROM : entity work.BasicRom -- 8KB
	port map(
		address => cpuAddress(12 downto 0),
		clock => clk,
		q => basRomData
	);

	-- CEGHMON + Extended ROM
--	MONITOR_ROM: entity work.CegmonRom
--	port map
--	(
--		address => cpuAddress(10 downto 0),
--		q => monitorRomData
--	);

	-- CEGHMON + Extended ROM
	MONITOR_ROM: entity work.CegmonRom
	port map
	(
		address => cpuAddress(10 downto 0),
--		clock => clk,
		q => monitorRomData
	);

	-- 6850 ACIA
	UART: entity work.bufferedUART
	port map(
		n_wr => n_aciaCS or cpuClock or n_WR,
		n_rd => n_aciaCS or cpuClock or (not n_WR),
		regSel => cpuAddress(0),
		dataIn => cpuDataOut,
		dataOut => aciaData,
		rxClock => serialClock,
		txClock => serialClock,
		rxd => rxd,
		txd => txd,
		n_cts => '0',
		n_dcd => '0',
		n_rts => rts
	);

	-- Memory mapped Display
	VDU : entity work.UK101TextDisplay
	port map (
		charAddr => charAddr,
		charData => charData,
		dispAddr => dispAddrB,
		dispData => dispRamDataOutB,
		clk => clk,
		sync => videoSync,
		video => video
	);

	-- Character ROM
	CHAR_ROM: entity work.CharRom
	port map
	(
		address => charAddr,
		q => charData
	);

	-- Display RAM
	DISPLAY_RAM: entity work.DisplayRam 
	port map
	(
		address_a => cpuAddress(9 downto 0),
		address_b => dispAddrB,
		clock	=> clk,
		data_a => cpuDataOut,
		data_b => (others => '0'),
		wren_a => not(n_memWR or n_dispRamCS),
		wren_b => '0',
		q_a => dispRamDataOutA,
		q_b => dispRamDataOutB
	);
	
	-- Output LatchIO
	J6IO8(7 downto 4) <= J6Data(7 downto 4);
	J6IO : entity work.OutLatch
	port map(
		clear => n_reset,
		clock => clk,
		load => n_J6IOCS or n_wr,
		latchOut => J6Data,
		dataIn => cpuDataOut
	);

	-- Output LatchIO
	J8IO8 <= J8Data;
	J8IO : entity work.OutLatch
	port map(
		clear => n_reset,
		clock => clk,
		load => n_J8IOCS or n_wr,
		dataIn => cpuDataOut,
		latchOut => J8Data
	);

	-- LEDs on the FPGAboard
	ledOut(0) <= not ledOut8(0);
	ledOut(1) <= not ledOut8(1);

	-- Output Latch
	latchLED : entity work.OutLatch
	port map(
		clear 	=> n_reset,
		clock 	=> clk,
		load		=> n_LEDCS or n_wr,
		dataIn	=> cpuDataOut,
		latchOut => ledOut8
	);

	-- RAM Bank Select Register
	bankSelectReg : entity work.OutLatch
	port map(
		clear 	=> n_reset,
		clock 	=> clk,
		load		=> n_RAMBANKCS or n_wr,
		dataIn	=> cpuDataOut,
		latchOut => bankReg
	);

	-- Emulation of UK101 keyboard using PS/2 keyboard
	fastMode <= not f1Latch;
	u9 : entity work.UK101keyboard
	port map(
		CLK 					=> clk,
		nRESET 				=> n_reset,
		PS2_CLK				=> ps2Clk,
		PS2_DATA				=> ps2Data,
		FNtoggledKeys(1)	=> f1Latch,
		A						=> kbRowSel,
		KEYB					=> kbReadData
	);
	
	-- Keyboard latch
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			kbRowSel <= cpuDataOut;
		end if;
	end process;
	
	-- 1/12.5 MHz CPU
	-- F1 key toggles speed (default = fast)
	process (clk)
	begin
		if rising_edge(clk) then
        if fastMode = '0' then -- 1MHz CPU clock
            if cpuClkCount < 49 then
                cpuClkCount <= cpuClkCount + 1;
            else
                cpuClkCount <= (others=>'0');
            end if;
            if cpuClkCount < 25 then
                cpuClock <= '0';
            else
                cpuClock <= '1';
            end if; 
        else
            if cpuClkCount < 3 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
                cpuClkCount <= cpuClkCount + 1;
            else
                cpuClkCount <= (others=>'0');
            end if;
            if cpuClkCount < 2 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
                cpuClock <= '0';
            else
                cpuClock <= '1';
            end if; 
        end if;	
     end if;	
	end process;

	-- Serial Clock 9600 baud
	process (clk)
	begin
		if rising_edge(clk) then
			if serialClkCount < 27 then -- 11520000 baud
--			if serialClkCount < 325 then -- 9600 baud
				serialClkCount <= serialClkCount + 1;
			else
				serialClkCount <= (others => '0');
			end if;
			if serialClkCount < 13 then -- 115200 baud
--			if serialClkCount < 162 then -- 9600 baud
				serialClock <= '0';
			else
				serialClock <= '1';
			end if;	
		end if;
	end process;

end;
