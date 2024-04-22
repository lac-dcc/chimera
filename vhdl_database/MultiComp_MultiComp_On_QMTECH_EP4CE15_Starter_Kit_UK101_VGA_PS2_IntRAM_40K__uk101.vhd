-- ____________________________________________________________________________________
-- UK101 or Superboard II Implementation
--
--		6502 CPU
--		40KB internal SRAM
--		XVGA output - 64 chars/row, 32 rows
--		PS/2 keyboard
-- 		http://land-boards.com/blwiki/index.php?title=PS2X49
--		Serial port (USB-Serial)
--		Off-the-shelf FPGA card (Cyclone IV EP4CE15)
--		Two 8-bit input ports on J12
--		One 8-bit output port on J12
--
-- Implements Grant Searle's modifications for 64x32 screens as described here:
--		https://searle.x10host.com/uk101FPGA/index.html
--
-- Interfaces to LEDS-SWITCHES Card
--		http://land-boards.com/blwiki/index.php?title=LEDS-SWITCHES
--
-- Memory Map
-- 	0x0000-0x7fff - INTERNAL SRAM (32KB)
-- 	0x8000-0x90ff - INTERNAL SRAM (8KB)
--		0xA000-0xBFFF - BASIC ROM (8KB)
-- 	0xD000-0xD7FF - DISPLAY RAM (2KB)
-- 	0xDC00-0xDFFF - KEYBOARD (1KB)
-- 	0xF000-0xF001 - ACIA (2B) 61440-61441 dec
-- 	0xF002 (1B) - LEDs 61442 dec
-- 	0xF003 (1B) - SLIDE SWITCHES 61443 dec
-- 	0xF004 (1B) - PUSHBUTTONS 61444 dec
-- 	0xF800-xFFFF - CEGMON ROM (2KB)
-- ____________________________________________________________________________________

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101 is
	port(
		-- Reset, clock
		i_n_reset	: in std_logic;
		i_clk			: in std_logic;
		
		-- Serial port
		i_rxd			: in std_logic;
		o_txd			: out std_logic;
		i_cts			: in std_logic;
		o_rts			: out std_logic;

		-- VGA
		o_vga_r		: out	std_logic_vector(4 downto 0) := "00000";
		o_vga_g		: out	std_logic_vector(5 downto 0) := "000000";
		o_vga_b		: out	std_logic_vector(4 downto 0) := "00000";
		o_vga_hs		: out	std_logic := '1';
		o_vga_vs		: out	std_logic := '1';
		
		-- PS/2 keyboard/mouse is on J12
		-- J12-1 = GND
		-- J12-2 = +5V
		-- J12-40 = +3.3V
		-- http://land-boards.com/blwiki/index.php?title=PS2X49
		-- With 5V to 3.3V level shifter installed
		-- PS/2 keyboards
		i_ps2Clk		: in std_logic := '1';	-- J12-25 (PIN_A16)
		i_ps2Data	: in std_logic := '1';	-- J12-27 (PIN_A15)
		-- PS/2 mouse
		i_ps2_clk_m	: in std_logic := '1';	-- J12-26 (PIN_B16)
		i_ps2_dat_m	: in std_logic := '1';	-- J12-28 (PIN_B15)
		
		-- I/O connector
--		io_J12		: out	std_logic_vector(24 downto 3) := x"00000"&"00";
--		io_J12		: out	std_logic_vector(36 downto 29) := x"00";
--		i_slSws		: in std_logic_vector(7 downto 0);
--		i_pbSw		: in std_logic_vector(7 downto 0);
--		o_LEDs		: out std_logic_vector(7 downto 0);
		
		-- SD card interface on external card
		-- Not used but pulled to levels to endure is card is installed it won't be accessed
		sd_cs				: out std_logic := '1';
		sd_miso			: in std_logic;
		sd_mosi			: out std_logic := '0';
		sd_clk			: out std_logic := '0';
		
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
end uk101;


architecture struct of uk101 is

	-- ____________________________________________________________________________________
	-- Signals
	signal w_WRN					: std_logic;
--	signal n_RD						: std_logic;
	signal w_cpuAddress			: std_logic_vector(15 downto 0);
	signal w_cpuDataOut			: std_logic_vector(7 downto 0);
	signal w_cpuDataIn			: std_logic_vector(7 downto 0);

	signal w_basRomData			: std_logic_vector(7 downto 0);
	signal w_monitorRomData		: std_logic_vector(7 downto 0);
	signal w_aciaData				: std_logic_vector(7 downto 0);
	signal w_ramDataOut			: std_logic_vector(7 downto 0);
	signal w_ramDataOut2			: std_logic_vector(7 downto 0);
	signal w_displayRamData		: std_logic_vector(7 downto 0);
--	signal w_invPBs				: std_logic_vector(7 downto 0);

	signal w_memWRN				: std_logic;
--	signal w_n_memRD 				: std_logic :='1';
	
	signal w_basRomCSN			: std_logic;
	signal w_dispRamCSN			: std_logic;
	signal w_aciaCSN				: std_logic;
	signal w_n_ramCS				: std_logic;
	signal w_n_ramCS2				: std_logic;
	signal w_monRomCSN 			: std_logic;
	signal w_kbCSN					: std_logic;
	signal w_LEDCSN				: std_logic;
	signal w_slSwCS				: std_logic;
	signal w_pbSwCS				: std_logic;
	
	signal w_slSw_q				: std_logic_vector(7 downto 0) := x"00";	-- Register external devices for metastability
	signal w_pbSw_q				: std_logic_vector(7 downto 0) := x"00";
	signal w_LEDs					: std_logic_vector(7 downto 0) := x"00";
	
	signal w_serialClkCount		: std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d  : std_logic_vector(15 downto 0);
	signal w_serialClkEn       : std_logic;
	signal w_serialClock			: std_logic;
	
	signal CLOCK_100				: std_ulogic;
	signal w_CLOCK_50				: std_ulogic;
	signal w_Video_Clk			: std_ulogic;
	signal w_VoutVect				: std_logic_vector(2 downto 0);

	signal w_cpuClkCount			: std_logic_vector(5 downto 0); 
	signal w_cpuClock				: std_logic;

	signal w_kbReadData 			: std_logic_vector(7 downto 0);
	signal w_kbRowSel 			: std_logic_vector(7 downto 0);

begin

	-- ____________________________________________________________________________________
	-- 6502 CPU
	CPU : entity work.T65
	port map(
		Enable 				=> '1',
		Mode					=> "00",
		Res_n					=> i_n_reset,
		Clk					=> w_cpuClock,
		Rdy					=> '1',
		Abort_n				=> '1',
		IRQ_n					=> '1',
		NMI_n					=> '1',
		SO_n					=> '1',
		R_W_n					=> w_WRN,
		A(15 downto 0) 	=> w_cpuAddress,
		DI						=> w_cpuDataIn,
		DO						=> w_cpuDataOut);
			
	w_memWRN <= not(w_cpuClock) nand (not w_WRN);

	-- Read data multiplexer
	w_cpuDataIn <=
		w_aciaData 			when w_aciaCSN 	= '0'	else
		w_ramDataOut 		when w_n_ramCS 	= '0' else
		w_ramDataOut2 		when w_n_ramCS2 	= '0' else
		w_displayRamData 	when w_dispRamCSN	= '0' else
		w_basRomData 		when w_basRomCSN	= '0' else
		w_kbReadData 		when w_kbCSN		= '0' else
		w_LEDs				when w_LEDCSN		= '0' else
		w_slSw_q				when w_slSwCS		= '1' else
		w_pbSw_q				when w_pbSwCS		= '1' else
		w_monitorRomData	when w_monRomCSN	= '0' else
		x"FF";
		
	-- ____________________________________________________________________________________
	-- Chip Selects
	w_n_ramCS 		<= '0' when w_cpuAddress(15) 				= '0'				else '1';  	-- x0000-x7fff (32KB)
	w_n_ramCS2		<= '0' when w_cpuAddress(15 downto 13) = "100" 			else '1';  	-- x8000-x90ff (8KB)
	w_basRomCSN 	<= '0' when w_cpuAddress(15 downto 13) = "101" 			else '1'; 	-- xA000-xBFFF (8KB)
	w_dispRamCSN	<= '0' when w_cpuAddress(15 downto 11) = x"d"&"0" 		else '1';	-- xD000-xD7FF (2KB)
	w_kbCSN 			<= '0' when w_cpuAddress(15 downto 10) = x"d"&"11" 	else '1';	-- xDC00-xDFFF (1KB)
	w_aciaCSN 		<= '0' when w_cpuAddress(15 downto 1)  = x"f00"&"000" else '1';	-- xF000-xF001 (2B) = 61440-61441 dec
	w_LEDCSN 		<= '0' when w_cpuAddress					= x"f002"		else '1';	-- xF002 (1B) = 61442 dec
	w_slSwCS	 		<= '1' when w_cpuAddress					= x"f003"		else '0';	-- xF003 (1B) = 61443 dec
	w_pbSwCS	 		<= '1' when w_cpuAddress					= x"f004"		else '0';	-- xF004 (1B) = 61444 dec
	w_monRomCSN 	<= '0' when w_cpuAddress(15 downto 11) = x"f"&"1"		else '1';	-- xF800-xFFFF (2KB)
 
	-- ____________________________________________________________________________________
	-- Register up external inputs for metastability
--	process (w_cpuClock)
--	begin
--		if rising_edge(w_cpuClock) then
--			w_slSw_q <= i_slSws;
--			w_pbSw_q <= not i_pbSw;		-- Pushbuttons need to be inverted
--		end if;
--	end process;
	
	ledLatch : entity work.OutLatch
	generic map
		(
			n	=> 8
		)
		port map
		(	
			dataIn	=> w_cpuDataOut,
			clock		=> w_CLOCK_50,
			load		=> w_LEDCSN or w_memWRN,
			clear		=> i_n_reset,
			latchOut	=> w_LEDs
		);
	
	-- ____________________________________________________________________________________
	-- VGA
	MemMappedXVGA : entity work.Mem_Mapped_XVGA
		port map (
			n_reset 			=> i_n_reset,
			Video_Clk 		=> w_Video_Clk,
			CLK_50			=> w_CLOCK_50,
			n_dispRamCS		=> w_dispRamCSN,
			n_memWR			=> w_memWRN,
			cpuAddress 		=> w_cpuAddress(10 downto 0),
			cpuDataOut		=> w_cpuDataOut,
			dataOut			=> w_displayRamData,
			VoutVect			=> w_VoutVect, -- rgb
			hSync				=> o_vga_hs,
			vSync				=> o_vga_vs

		);

	-- 1:1:1 of UK101 maps to FPGA 5:6:5
	o_vga_r <= w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2);
	o_vga_g <= w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1);
	o_vga_b <= w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0);
	
	-- ____________________________________________________________________________________
	-- UK101 scanned keyboard
	u9 : entity work.UK101keyboard
	port map
	(
		clk		=> w_CLOCK_50,
		nRESET	=> i_n_reset,
		PS2_CLK	=> i_ps2Clk,
		PS2_DATA	=> i_ps2Data,
		A			=> w_kbRowSel,
		KEYB		=> w_kbReadData
	);
	
	process (w_kbCSN, w_memWRN)
	begin
		if	w_kbCSN='0' and w_memWRN = '0' then
			w_kbRowSel <= w_cpuDataOut;
		end if;
	end process;
	
	-- ____________________________________________________________________________________
	-- Clocks
	pll : work.VideoClk_XVGA_1024x768 PORT MAP 
	(
		inclk0	=> i_clk,
		c0			=> w_Video_Clk,	-- 65 MHz Video Clock
		c1			=> w_cpuClock,		-- 1 MHz CPU clock
		c2			=> w_CLOCK_50		-- 50 Mhz Logic Clock
	);
	

	-- ____________________________________________________________________________________
	-- 8KB BASIC in ROM
	BASIC_IN_ROM : entity work.BasicRom
	port map
	(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> w_CLOCK_50,
		q			=> w_basRomData
	);

	-- ____________________________________________________________________________________
	-- 40KB SRAM
	SRAM_32K : entity work.InternalRam32K
	port map
	(
		address	=> w_cpuAddress(14 downto 0),
		clock		=> w_CLOCK_50,
		data		=> w_cpuDataOut,
		wren		=> not(w_memWRN or w_n_ramCS),
		q			=> w_ramDataOut
	);

	
	SRAM_8K : entity work.InternalRam8K
	port map
	(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> w_CLOCK_50,
		data		=> w_cpuDataOut,
		wren		=> not(w_memWRN or w_n_ramCS2),
		q			=> w_ramDataOut2
	);

	-- ____________________________________________________________________________________
	-- CEGMON ROM
	MONITOR : entity work.CegmonRom_Patched_64x32
	port map
	(
		address	=> w_cpuAddress(10 downto 0),
		q			=> w_monitorRomData
	);

	-- ____________________________________________________________________________________
	-- UART
	UART : entity work.bufferedUART
		port map
		(
			clk		=> w_CLOCK_50,
			n_WR		=> w_aciaCSN or w_cpuClock or w_WRN,
			n_rd		=> w_aciaCSN or w_cpuClock or (not w_WRN),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_aciaData,
			rxClkEn	=> w_serialClkEn,
			txClkEn	=> w_serialClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_cts,
			n_rts		=> o_rts
--			n_dcd		=> '0'
		);
		
	baudRateGen : ENTITY work.BaudRate6850
		GENERIC MAP
		(
			BAUD_RATE	=> 115200
		)
		PORT map 
		(
			i_CLOCK_50	=> w_CLOCK_50,
			o_serialEn	=> w_serialClkEn
		);
		
end;
