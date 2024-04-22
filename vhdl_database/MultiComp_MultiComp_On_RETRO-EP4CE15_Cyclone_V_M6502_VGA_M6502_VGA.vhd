-- Grant Searle's Multicomp as described here:
-- http://searle.x10host.com/Multicomp/index.html
-- 
-- http://land-boards.com/blwiki/index.php?title=RETRO-EP4CE15
--
-- 6502 CPU
--	12.5 MHz (slowed down for external SRAM speed limits)
--	40KB Internal SRAM
-- 1MB External SRAM
--		Bank Select Register - selects between 128 of 8KB banks
--	Microsoft BASIC in ROM
--		40,447 bytes free
--	USB-Serial Interface
--		FTDI FT-230FX chip
--		Has RTS/CTS hardware handshake
-- ANSI Video Display Unit
--		256 character set
--		80x25 character display
--		2/2/2 - R/G/B output
-- PS/2 Keyboard
--		F1 key switches between VDU and Serial port
--			Default is VDU
--		F2 key switches serial port baud rate between 300 and 115,200 (not current)
--			Default is 115,200 baud
--	SD Card
-- Memory Map
--		x0000-x9FFF - 40KB SRAM
--		xC000-xDFFF - External SRAM 8KB window
--		xE000-xFFFF - 8KB BASIC in ROM
--	I/O Ports
--		xFFD0-xFFD1 VDU
--		xFFD2-xFFD3 ACIA
--		xFFD4 Bank Select register (7 bits used = 128 banks of 8KB each)
--		xFFD5 8-bit output latch
--		xFFD8-xFFDD SD card


library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity M6502_VGA is
	port(
		i_n_reset		: in std_logic;
		i_clk_50			: in std_logic;
		
		io_sramData		: inout	std_logic_vector(7 downto 0);
		o_sramAddress	: out		std_logic_vector(19 downto 0);
		o_n_sRamWE		: out		std_logic := '0';
		o_n_sRamCS		: inout	std_logic := '0';
		o_n_sRamOE		: out		std_logic := '0';
		
		i_rxd			: in std_logic;
		o_txd			: out std_logic;
		i_n_cts		: in std_logic;
		o_n_rts		: out std_logic;
		
		o_vid_red	: out std_logic_vector(1 downto 0);
		o_vid_grn	: out std_logic_vector(1 downto 0);
		o_vid_blu	: out std_logic_vector(1 downto 0);
		o_vid_hSync	: out std_logic;
		o_vid_vSync	: out std_logic;
		
		sdCS			: out std_logic := '1';
		sdMOSI		: out std_logic := '1';
		sdMISO		: in std_logic;
		sdClock		: out std_logic := '1';
		
		IO_PIN		: inout std_logic_vector(44 downto 3) := x"000000000"&"00";
	
		-- Not using the SD RAM but making sure that it's not active
		n_sdRamCas	: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas	: out std_logic := '1';		-- RAS
		n_sdRamWe	: out std_logic := '1';		-- SDWE
		n_sdRamCe	: out std_logic := '1';		-- SD_NCS0
		sdRamClk		: out std_logic := '1';		-- SDCLK0
		sdRamClkEn	: out std_logic := '1';		-- SDCKE0
		sdRamAddr	: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData	: in std_logic_vector(15 downto 0);
	
		io_ps2Clk	: inout std_logic;
		io_ps2Data	: inout std_logic
	);
end M6502_VGA;

architecture struct of M6502_VGA is

	signal w_reset_n			: std_logic;
	signal w_n_WR				: std_logic;
	signal w_n_RD				: std_logic;
	signal w_cpuAddress		: std_logic_vector(15 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);
	
	signal w_counterOut		: std_logic_vector(27 downto 0);

	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal w_aciaDataOut		: std_logic_vector(7 downto 0);
	signal w_ramDataOut1		: std_logic_vector(7 downto 0);
	signal w_ramDataOut2		: std_logic_vector(7 downto 0);
	signal sdCardDataOut		: std_logic_vector(7 downto 0);
	signal memMapReg			: std_logic_vector(7 downto 0);
	
--	signal w_n_memWR			: std_logic;
	
	signal w_n_basRomCS		: std_logic :='1';
	signal w_n_VDUCS			: std_logic :='1';
	signal w_n_ramCS1			: std_logic :='1';
	signal w_n_ramCS2			: std_logic :='1';
	signal w_n_aciaCS			: std_logic :='1';
	signal n_sdCardCS			: std_logic :='1';
	signal w_memMapCS			: std_logic :='1';
	signal w_latch1CS			: std_logic :='1';
	signal w_latch2CS			: std_logic :='1';
	signal w_latch3CS			: std_logic :='1';
	signal w_latch4CS			: std_logic :='1';
	signal w_latch5CS			: std_logic :='1';
	signal w_latch6CS			: std_logic :='1';
	
	signal w_serialClkCount	: std_logic_vector(15 downto 0);	-- DDS counter for baud rate
	signal w_serClkCt_d 		: std_logic_vector(15 downto 0);
	signal w_serClkEn		: std_logic;

	signal w_cpuClkCt			: std_logic_vector(5 downto 0);	-- 50 MHz oscillator counter
	signal w_cpuClk			: std_logic;							-- CPU clock rate selectable
	
	signal w_fKey1				: std_logic;	--	F1 key switches between VDU and Serial port
--														--		Default is VDU
	signal w_fKey2				: std_logic;	--	F2 key switches serial port baud rate between 300 and 115,200
														--		Default is 115,200 baud
	signal w_funKeys			: std_logic_vector(12 downto 0);

--	signal w_videoVec			: std_logic_vector(5 downto 0);

begin
	debounceReset : entity work.Debouncer
	port map (
		i_clk		 	=> w_cpuClk,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_reset_n
	);
	
	-- ____________________________________________________________________________________
	-- Chip Selects
	w_n_ramCS1		<= '0' when  w_cpuAddress(15) = '0' else 	'1';										-- x0000-x7FFF (32KB)
	w_n_ramCS2		<= '0' when  w_cpuAddress(15 downto 13) = "100" else '1';						-- x8000-x9FFF (8KB)
	
	o_n_sRamCS		<= '0' when w_cpuAddress(15 downto 13) = "110" else '1';							-- xC000-xDFFF (8KB)
	o_n_sRamWE		<= not ((not w_cpuClk) and (not w_n_WR) and w_cpuAddress(15) and w_cpuAddress(14) and (not w_cpuAddress(13)));
	o_n_sRamOE		<= not (                        w_n_WR  and w_cpuAddress(15) and w_cpuAddress(14) and (not w_cpuAddress(13)));
	o_sramAddress	<= memMapReg(6 downto 0) & w_cpuAddress(12 downto 0);
	
	w_n_basRomCS 	<= '0' when  w_cpuAddress(15 downto 13) = "111" else '1'; 						-- xE000-xFFFF (8KB)
	
	w_n_VDUCS 		<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000" and w_fKey1 = '0') 	-- XFFD0-FFD1 VDU
							or		    (w_cpuAddress(15 downto 1) = x"FFD"&"001" and w_fKey1 = '1')) 
							else '1';
	w_n_aciaCS 		<= '0' when ((w_cpuAddress(15 downto 1) = X"FFD"&"001" and w_fKey1 = '0') 		-- XFFD2-FFD3 ACIA
							or        (w_cpuAddress(15 downto 1) = X"FFD"&"000" and w_fKey1 = '1'))
							else '1';
							
	
-- Add new I/O starting at XFFD4 (65492 dec)
	w_memMapCS	<= '0'  when w_cpuAddress = X"FFD4" else '1';			-- XFFD4 BANK SELECT 65492
	w_latch1CS	<= '0'  when w_cpuAddress = X"FFD5"	else '1';			-- XFFD5 Data out latch 65493
	w_latch2CS	<= '0'  when w_cpuAddress = X"FFD6"	else '1';			-- XFFD6 Data out latch 65494
	w_latch3CS	<= '0'  when w_cpuAddress = X"FFD7"	else '1';			-- XFFD7 Data out latch 65495
--	w_latch4CS	<= '0'  when w_cpuAddress = X"FFD8"	else '1';			-- XFFD8 Data out latch 65496
--	w_latch5CS	<= '0'  when w_cpuAddress = X"FFD9"	else '1';			-- XFFD9 Data out latch 65497
--	w_latch6CS	<= '0'  when w_cpuAddress = X"FFDA"	else '1';			-- XFFDA Data out latch 65498
	
	n_sdCardCS	<= '0' when w_cpuAddress(15 downto 3) = x"FFD"&'1' else '1'; 			-- 8 bytes XFFD8-FFDF
	
--	w_n_memWR 			<= (not w_cpuClk) nand (not w_n_WR);
	
	w_cpuDataIn <=
		w_VDUDataOut	when w_n_VDUCS 	= '0'	else
		w_aciaDataOut	when w_n_aciaCS 	= '0'	else
		w_ramDataOut1 	when w_n_ramCS1 	= '0'	else
		w_ramDataOut2 	when w_n_ramCS2 	= '0'	else
		io_sramData		 	when o_n_sRamCS	 	= '0'	else
		memMapReg		when w_memMapCS 	= '0'	else
		sdCardDataOut	when n_sdCardCS	= '0' else
		w_basRomData	when w_n_basRomCS	= '0' else		-- HAS TO BE AFTER ANY I/O READS
		x"FF";
		
	io_sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
	
	CPU : entity work.T65
	port map(
		Enable			=> '1',
		Mode				=> "00",
		Res_n				=> w_reset_n,
		clk				=> w_cpuClk,
		Rdy				=> '1',
		Abort_n			=> '1',
		IRQ_n				=> '1',
		NMI_n				=> '1',
		SO_n				=> '1',
		R_w_n				=> w_n_WR,
		A(15 downto 0)	=> w_cpuAddress,
		DI 				=> w_cpuDataIn,
		DO 				=> w_cpuDataOut);
		
	ROM : entity work.M6502_BASIC_ROM -- 8KB
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		q			=> w_basRomData
	);

	SRAM1 : entity work.InternalRam32K 
	port map
	(
		address	=> w_cpuAddress(14 downto 0),
		clock		=> i_clk_50,
		data		=> w_cpuDataOut,
		wren		=> not w_n_ramCS1 and not w_n_WR and w_cpuClk,
		q			=> w_ramDataOut1
	);

	SRAM2 : entity work.InternalRam8K 
	port map
	(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		data		=> w_cpuDataOut,
		wren		=> not w_n_ramCS2 and not w_n_WR and w_cpuClk,
		q			=> w_ramDataOut2
	);

	UART : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_WR		=> w_n_aciaCS or w_cpuClk or w_n_WR,
			n_RD		=> w_n_aciaCS or w_cpuClk or (not w_n_WR),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_aciaDataOut,
			rxClkEn	=> w_serClkEn,
			txClkEn	=> w_serClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_n_cts,
			n_rts		=> o_n_rts,
			n_dcd		=> '0'
		);
	
	VDU : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET => 1
	)
		port map (
		n_reset	=> w_reset_n,
		clk 		=> i_clk_50,

		-- RGB video signals
		hSync => o_vid_hSync,
		vSync => o_vid_vSync,
		videoR1 => o_vid_red(1),
		videoR0 => o_vid_red(0),
		videoG1 => o_vid_grn(1),
		videoG0 => o_vid_grn(0),
		videoB1 => o_vid_blu(1),
		videoB0 => o_vid_blu(0),

		n_WR => w_n_VDUCS or w_cpuClk or w_n_WR,
		n_RD => w_n_VDUCS or w_cpuClk or (not w_n_WR),
--		n_int => n_int1,
		regSel => w_cpuAddress(0),
		dataIn => w_cpuDataOut,
		dataOut => w_VDUDataOut,
		ps2Clk => io_ps2Clk,
		ps2Data => io_ps2Data,
		FNkeys => w_funKeys
	);

	FNKey1Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(1),
			clock => i_clk_50,
			n_res => w_reset_n,
			latchFNKey => w_fKey1
		);	

--	FNKey2Toggle: entity work.Toggle_On_FN_Key	
--		port map (		
--			FNKey => w_funKeys(2),
--			clock => i_clk_50,
--			n_res => w_reset_n,
--			latchFNKey => w_fKey2
--		);
	
	sd1 : entity work.sd_controller
	port map(
		sdCS => sdCS,
		sdMOSI => sdMOSI,
		sdMISO => sdMISO,
		n_wr => n_sdCardCS or w_cpuClk or w_n_WR,
		n_rd => n_sdCardCS or w_cpuClk or (not w_n_WR),
		n_reset => w_reset_n,
		dataIn => w_cpuDataOut,
		dataOut => sdCardDataOut,
		regAddr => w_cpuAddress(2 downto 0),
--		driveLED => driveLED,
		clk => i_clk_50
	);

	memMapper : entity work.OutLatch
		port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> w_memMapCS or w_n_WR or w_cpuClk,
		clear		=> w_reset_n,
		latchOut	=> memMapReg
		);
		
	latch1 : entity work.OutLatch
		port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> w_latch1CS or w_n_WR or w_cpuClk,
		clear		=> w_reset_n,
		latchOut	=> IO_PIN(10 downto 3)
		);
		
	latch2 : entity work.OutLatch
		port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> w_latch2CS or w_n_WR or w_cpuClk,
		clear		=> w_reset_n,
		latchOut	=> IO_PIN(18 downto 11)
		);
		
	latch3 : entity work.OutLatch
		port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> w_latch3CS or w_n_WR or w_cpuClk,
		clear		=> w_reset_n,
		latchOut	=> IO_PIN(26 downto 19)
		);
		
--	latch4 : entity work.OutLatch
--		port map (
--		dataIn	=> w_cpuDataOut,
--		clock		=> i_clk_50,
--		load		=> w_latch4CS or w_n_WR or w_cpuClk,
--		clear		=> w_reset_n,
--		latchOut	=> IO_PIN(34 downto 27)
--		);
--		
--	latch5 : entity work.OutLatch
--		port map (
--		dataIn	=> w_cpuDataOut,
--		clock		=> i_clk_50,
--		load		=> w_latch5CS or w_n_WR or w_cpuClk,
--		clear		=> w_reset_n,
--		latchOut	=> IO_PIN(42 downto 35)
--		);
--		
--	latch6 : entity work.OutLatch
--		generic map
--		(
--			n => 2
--		)
--		port map (
--		dataIn	=> w_cpuDataOut(1 downto 0),
--		clock		=> i_clk_50,
--		load		=> w_latch6CS or w_n_WR or w_cpuClk,
--		clear		=> w_reset_n,
--		latchOut	=> IO_PIN(44 downto 43)
--		);
		
-- SUB-CIRCUIT CLOCK SIGNALS 
	process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then
			if w_cpuClkCt < 3 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				w_cpuClkCt <= w_cpuClkCt + 1;
			else
				w_cpuClkCt <= (others=>'0');
			end if;
			if w_cpuClkCt < 2 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				w_cpuClk <= '0';
			else
				w_cpuClk <= '1';
			end if; 
		end if;
    end process;
	 
-- Pass Baud Rate in BAUD_RATE generic as integer value
-- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
--
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_clk_50,
		o_serialEn	=> w_serClkEn
	);
	 
end;
