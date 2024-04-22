-- ----------------------------------------------------------------------------------------
-- OSI C1P (UK101) - Original work was by Grant Searle
--		http://searle.x10host.com/uk101FPGA/index.html
--		Differences from Grant's build
--			CEGMON compiled and moved to ROM
--			Added SD Controller
--			Added Grant's fast CPU via F1 key
--			40KB SRAM - Additional RAM sections opened although not contiguous
--			1MB Bank selected SRAM (256 banks of 4KB)
--
--	Running on hardware
--		http://land-boards.com/blwiki/index.php?title=Multicomp_in_a_Box
--
-- 6502 CPU
-- 	Runs at 1 or 12.5 MHz (F1 key selects speed, default = 12.5 MHz)
--	8KB Microsoft BASIC
--	XGA
--		Memory Mapped
--		64x32 characters
--		Blue background, white characters
-- PS/2 Keyboard
--		F1 toggles Turbo mode (default = fast)
--		UK kayboard mapping (could be nice to change to US layout as option)
--		Emulates key matrix of the original unit
--		Keyboard mapping not standard US, see: 
--			http://land-boards.com/blwiki/index.php?title=RetroComputers#Keyboard_Layout
-- Internal SRAM
--		40KB
-- External SRAM
--		1MB maps into (2) 4KB windows
--	Memory Mapper
--		Maps 512KB of external SRAM into first 4KB window
--		Maps 512KB of external SRAM into second 4KB window
-- 	Two bank select registers
--			Each register Selects a 4KB window from SRAM
--			4KB window at xc000-xcFFF (128 banks = 512KB)
--			4KB window at xE000-xEFFF (128 banks = 512KB)
--	USB-Serial 
--		FT230XS FTDI
--		Hardware Handshake
--	I/O connections
--		N/A
--	SD Card
--	SDRAM - Not used, pins reserved
-- 
-- Memory Map
--		$0000-$9FFF - SRAM (40KB)
-- 	$A000-$BFFF - Microsoft BASIC-in-ROM (8KB)
--		$D000-$D3FF - 1KB Display RAM
--		$DC00 - PS/2 Keyboard
--		$E000-$EFFF - Bank Selectable SRAM (not detectable as BASIC RAM)
--		$F000-$F001 - ACIA (UART) 61440-61441 dec
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
-- ----------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101_41kRAM is
	port(
		i_clk				: in std_logic;
		i_n_reset		: in std_logic := '1';
		
		-- External SRAM
		io_sramData 	: inout	std_logic_vector(7 downto 0);
		o_sramAddress	: out		std_logic_vector(19 downto 0) := x"00000";
		o_n_sRamWE		: out		std_logic := '1';
		o_n_sRamCS		: out		std_logic := '1';
		o_n_sRamOE 		: out		std_logic := '1';
		
		-- USB-Serial port
		i_fpgaRx			: in		std_logic := '1';
		o_fpgaTx			: out		std_logic;
		i_fpgaCts		: in		std_logic := '1';
		o_fpgaRts		: out 	std_logic;
		
		-- VGA
		o_vgaRedHi		: out		std_logic := '0';
		o_vgaRedLo		: out		std_logic := '0';
		o_vgaGrnHi		: out		std_logic := '0';
		o_vgaGrnLo		: out		std_logic := '0';
		o_vgaBluHi		: out		std_logic := '0';
		o_vgaBluLo		: out		std_logic := '0';
		o_vgaHsync		: out		std_logic := '0';
		o_vgaVsync		: out		std_logic := '0';
		
		-- SDRAM
		-- Not using the SD RAM but reserving pins and making inactive
		n_sdRamCas	: out		std_logic := '1';		-- CAS on schematic
		n_sdRamRas	: out		std_logic := '1';		-- RAS
		n_sdRamWe	: out		std_logic := '1';		-- SDWE
		n_sdRamCe	: out		std_logic := '1';		-- SD_NCS0
		sdRamClk		: out		std_logic := '1';		-- SDCLK0
		sdRamClkEn	: out		std_logic := '1';		-- SDCKE0
		sdRamAddr	: out		std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData	: in		std_logic_vector(15 downto 0);
		
		IO_PIN		: inout std_logic_vector(44 downto 3) := x"000000000"&"00";
	
		-- SD card
		o_sdCS		: out		std_logic :='1';
		o_sdMOSI		: out		std_logic :='0';
		i_sdMISO		: in		std_logic;
		o_sdSCLK		: out		std_logic :='0';
		o_driveLED	: out		std_logic;

		-- PS/2 Keyboard
		ps2Clk		: in		std_logic := '1';
		ps2Data		: in		std_logic := '1'
	);
end uk101_41kRAM;

architecture struct of uk101_41kRAM is

	signal w_n_WR					: std_logic := '0';
	signal w_cpuAddress			: std_logic_vector(15 downto 0);
	signal w_cpuDataOut			: std_logic_vector(7 downto 0);
	signal w_cpuDataIn			: std_logic_vector(7 downto 0);
	
	signal w_mmapAddrLatch1		: std_logic_vector(7 downto 0);
	signal w_mmapAddrLatch2		: std_logic_vector(7 downto 0);

	signal w_basRomData			: std_logic_vector(7 downto 0);
	signal w_intSRAM1				: std_logic_vector(7 downto 0);
	signal w_intSRAM2				: std_logic_vector(7 downto 0);
	signal w_ramDataOut			: std_logic_vector(7 downto 0);
	signal w_monitorRomData 	: std_logic_vector(7 downto 0);
	signal w_aciaData				: std_logic_vector(7 downto 0);
	signal w_SDData				: std_logic_vector(7 downto 0);

	signal w_n_memWR				: std_logic := '1';
	signal w_n_memRD 				: std_logic := '1';

	signal w_n_dispRamCS			: std_logic :='1';
	signal w_n_ramCS				: std_logic :='1';
	signal w_n_sram1CS			: std_logic :='1';
	signal w_n_sram2CS			: std_logic :='1';
	signal w_n_basRomCS			: std_logic :='1';
	signal w_n_monRomCS 			: std_logic :='1';
	signal w_n_aciaCS				: std_logic :='1';
	signal w_n_kbCS				: std_logic :='1';
	signal w_n_mmap1CS			: std_logic :='1';
	signal w_n_mmap2CS			: std_logic :='1';
	signal w_n_SDCS				: std_logic :='1';
		
	signal w_Video_Clk_25p6		: std_ulogic;
	signal w_VoutVect				: std_logic_vector(2 downto 0);
	signal w_resetClean_n		:	std_logic;					-- De-bounced reset button

	signal w_dispAddrB 			: std_logic_vector(9 downto 0);
	signal w_dispRamDataOutA 	: std_logic_vector(7 downto 0);
	signal w_charAddr 			: std_logic_vector(10 downto 0);
	signal w_charData 			: std_logic_vector(7 downto 0);

	signal w_serialClkEn			: std_logic; 
	signal w_cpuClkCount			: std_logic_vector(5 downto 0); 
	signal w_cpuClock				: std_logic;

	signal w_kbReadData 			: std_logic_vector(7 downto 0);
	signal w_kbRowSel 			: std_logic_vector(7 downto 0);
	signal fastMode 				: std_logic;
	signal f1Latch 				: std_logic;

	-- Signal Tap Logic Analyzer signals
	attribute syn_keep	: boolean;
	attribute syn_keep of w_cpuAddress			: signal is true;
	attribute syn_keep of w_resetClean_n		: signal is true;
	attribute syn_keep of w_cpuClock				: signal is true;
	attribute syn_keep of w_n_WR					: signal is true;

begin

	-- Debounce/sync reset FPGA front Panel reset pushbutton to CPU clock
	debounceReset : entity work.Debouncer
		port map
		(
			i_clk				=> w_cpuClock,
			i_PinIn			=> i_n_reset,
			o_PinOut			=> w_resetClean_n
		);

	-- External SRAM
	o_sramAddress(11 downto 0)	<= w_cpuAddress(11 downto 0);		-- 4KB
	o_sramAddress(19 downto 12)	<= "1" & w_mmapAddrLatch1(6 downto 0) when (w_cpuAddress(15 downto 12)	= x"c") else	-- xc000-xcFFF (4KB) 512KB
											"0" & w_mmapAddrLatch2(6 downto 0) when (w_cpuAddress(15 downto 12)	= x"e");			-- xe000-xeFFF (4KB) 512KB
	io_sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
	o_n_sRamWE <= w_n_memWR;
	o_n_sRamOE <= w_n_memRD;
	o_n_sRamCS <= w_n_ramCS;
	w_n_memRD  <= w_cpuClock or (not w_n_WR);
	w_n_memWR  <= w_cpuClock or w_n_WR;

	-- Data buffer	-- Chip Selects
	w_n_sram1CS		<= '0' when   w_cpuAddress(15)				= '0'				else '1';	-- x0000-x7fff (32KB)	- Internal SRAM
	w_n_sram2CS		<= '0' when   w_cpuAddress(15 downto 13)	= "100"			else '1';	-- x8000-x9fff (8KB)		- Internal SRAM
	w_n_basRomCS 	<= '0' when   w_cpuAddress(15 downto 13) 	= "101" 			else '1';	-- xa000-xbFFF (8k)		- BASIC ROM
	w_n_ramCS 		<= '0' when ((w_cpuAddress(15 downto 12) 	= x"c") or						-- xc000-xcFFF (4KB)		- External SRAM
									    (w_cpuAddress(15 downto 12) 	= x"e")) 		else '1';  	-- xe000-xeFFF (4KB)		- External SRAM
	w_n_dispRamCS	<= '0' when   w_cpuAddress(15 downto 11) 	= x"d"&"0"		else '1';	-- xd000-xd7ff (2KB)		- Display RAM
	w_n_kbCS 		<= '0' when   w_cpuAddress(15 downto 10) 	= x"d"&"11"		else '1';	-- xdc00-xdfff (1KB)		- Keyboard
	w_n_aciaCS 		<= '0' when   w_cpuAddress(15 downto 1) 	= x"f00"&"000"	else '1';	-- xf000-f001 (2B)		- Serial Port
	w_n_monRomCS	<= '0' when   w_cpuAddress(15 downto 11) 	= x"f"&'1' 		else '1';	-- xf800-xffff (2K)		- Monitor in ROM
	w_n_mmap1CS		<= '0' when   w_cpuAddress					 	= x"f002"		else '1';	-- xf002 (1B) 61442 dec	- Memory Mapper 1
	w_n_mmap2CS		<= '0' when   w_cpuAddress					 	= x"f005"		else '1';	-- xf005 (1B) 61445 dec	- Memory Mapper 2
	w_n_SDCS			<= '0' when   w_cpuAddress(15 downto 3) 	= x"f01"&"0"	else '1';	-- xf010-xf017 (8B) 61464 dec	- SD Card
	
	w_cpuDataIn <=
		w_basRomData 			when w_n_basRomCS 	= '0' else
		w_aciaData				when w_n_aciaCS		= '0' else
		w_dispRamDataOutA		when w_n_dispRamCS	= '0' else
		w_kbReadData			when w_n_kbCS			= '0' else
		io_sramData				when w_n_ramCS			= '0' else
		w_intSRAM1				when w_n_sram1CS		= '0' else
		w_intSRAM2				when w_n_sram2CS		= '0' else
		w_mmapAddrLatch1		when w_n_mmap1CS		= '0' else
		w_mmapAddrLatch2		when w_n_mmap2CS		= '0' else
		w_SDData					when w_n_SDCS			= '0' else
		x"F0" 					when (w_cpuAddress & fastMode)= x"FCE0"&'1'	else -- Address = $FCE0 and fastMode = 1 : CHANGE REPEAT RATE LOOP VALUE (was $10)
		w_monitorRomData 		when w_n_monRomCS 	= '0' else
		x"FF";

	-- 6502 CPU
	CPU_6502 : entity work.T65
	port map(
		Enable			=> '1',
		Mode				=> "00",
		Res_n				=> w_resetClean_n,
		Clk				=> w_cpuClock,		-- Clock low = do transfers Ph1 clock on datasheet
		Rdy				=> '1',
		Abort_n			=> '1',
		IRQ_n				=> '1',
		NMI_n				=> '1',
		SO_n				=> '1',
		R_W_n				=> w_n_WR,
		A(15 downto 0)	=> w_cpuAddress,
		DI					=> w_cpuDataIn,
		DO					=> w_cpuDataOut);

	-- 8KB BASIC ROM
	BASIC_ROM : entity work.BasicRom
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk,
		q			=> w_basRomData
	);
	
	-- CEGMON ROM with display patches
	u4: entity work.CegmonRom_Patched_64x32
	port map
	(
		address	=> w_cpuAddress(10 downto 0),
		q			=> w_monitorRomData
	);

	-- MMU Register 1
	mmu1 : entity work.OutLatch
	port map(
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk,
		load		=> w_n_mmap1CS or w_n_WR or w_cpuClock,
		clear		=> w_resetClean_n,
		latchOut	=> w_mmapAddrLatch1
	);
	
	-- MMU Register 2
	mmu2 : entity work.OutLatch
	port map(
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk,
		load		=> w_n_mmap2CS or w_n_WR or w_cpuClock,
		clear		=> w_resetClean_n,
		latchOut	=> w_mmapAddrLatch2
	);
	
	sram1 : entity work.InternalRam32K
	port map(
		address	=> w_cpuAddress(14 downto 0),
		clock		=> i_clk,
		data		=> w_cpuDataOut,
		wren		=> (not w_n_sram1CS) and (not w_n_WR) and (not w_cpuClock),
		q			=> w_intSRAM1
	);
	
	sram2 : entity work.InternalRam8K
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk,
		data		=> w_cpuDataOut,
		wren		=> (not w_n_sram2CS) and (not w_n_WR) and (not w_cpuClock),
		q			=> w_intSRAM2
	);

	SDCtrlr : entity work.sd_controller
	port map (
		-- CPU
		n_reset 	=> w_resetClean_n,
		n_wr		=> w_n_SDCS or w_cpuClock or w_n_WR,
		n_rd		=> w_n_SDCS or w_cpuClock or (not w_n_WR) or w_cpuAddress(1) or w_cpuAddress(2),
		dataIn	=> w_cpuDataOut,
		dataOut	=> w_SDData,
		regAddr	=> w_cpuAddress(2 downto 0),
		clk 		=> i_clk,
		-- SD Card SPI connections
		sdCS 		=> o_sdCS,
		sdMOSI	=> o_sdMOSI,
		sdMISO	=> i_sdMISO,
		sdSCLK	=> o_sdSCLK
		-- LEDs
--		driveLED	=> o_driveLED
	);

	pll : work.VideoClk_XVGA_1024x768 PORT MAP (
		inclk0	 => i_clk,
		c0	 => w_Video_Clk_25p6		-- 25.600000
	);
	
	-- VGA has blue background and white characters
	o_vgaRedHi	<= w_VoutVect(2);	-- red upper bit
	o_vgaRedLo	<= w_VoutVect(2);
	o_vgaGrnHi	<= w_VoutVect(1);
	o_vgaGrnLo	<= w_VoutVect(1);
	o_vgaBluHi	<= w_VoutVect(0);
	o_vgaBluLo	<= w_VoutVect(0);
		
	vga : entity work.Mem_Mapped_XVGA
	port map (
		n_reset		=> w_resetClean_n,
		Video_Clk 	=> w_Video_Clk_25p6,
		CLK_50		=> i_clk,
		n_dispRamCS	=> w_n_dispRamCS,
		n_memWR		=> w_n_memWR or w_cpuClock,
		cpuAddress	=> w_cpuAddress(10 downto 0),
		cpuDataOut	=> w_cpuDataOut,
		dataOut		=> w_dispRamDataOutA,
		VoutVect		=> w_VoutVect,
		hSync			=> o_vgaHsync,
		vSync			=> o_vgaVsync
	);

	fastMode <= not f1Latch;
	
	-- UK101 keyboard
	PS2Keyboard : entity work.UK101keyboard
	port map(
		CLK					=> i_clk,
		nRESET				=> w_resetClean_n,
		PS2_CLK				=> ps2Clk,
		PS2_DATA				=> ps2Data,
		FNtoggledKeys(1)	=> f1Latch,
		A						=> w_kbRowSel,
		KEYB					=> w_kbReadData
	);
	
	process (w_n_kbCS,w_n_memWR)
	begin
		if	w_n_kbCS='0' and w_n_memWR = '0' then
			w_kbRowSel <= w_cpuDataOut;
		end if;
	end process;
	
	-- 6850 style UART 
	UART : entity work.bufferedUART
		port map(
			clk => i_clk,
			n_wr => w_n_aciaCS or w_cpuClock or w_n_WR,
			n_rd => w_n_aciaCS or w_cpuClock or (not w_n_WR),
			regSel => w_cpuAddress(0),
			dataIn => w_cpuDataOut,
			dataOut => w_aciaData,
			rxClkEn => w_serialClkEn,
			txClkEn => w_serialClkEn,
			rxd => i_fpgaRx,
			txd => o_fpgaTx,
			n_cts => i_fpgaCts,
			n_dcd => '0',
			n_rts => o_fpgaRts
		);

	-- Baud rate generator
	BAUDRATE : entity work.BaudRate6850
	GENERIC map
	(
		BAUD_RATE	=> 115200
	)
	PORT map
	(
		i_CLOCK_50	=> i_clk,
		o_serialEn	=> w_serialClkEn
	);

	-- CPU clock = 1 MHz
	process (i_clk)
	begin
		if rising_edge(i_clk) then
			if fastMode = '0' then -- 1MHz CPU clock
				if w_cpuClkCount < 50 then
					w_cpuClkCount <= w_cpuClkCount + 1;
				else
					w_cpuClkCount <= (others=>'0');
				end if;
				if w_cpuClkCount < 25 then
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;	
		 else
				if w_cpuClkCount < 3 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
					 w_cpuClkCount <= w_cpuClkCount + 1;
				else
					 w_cpuClkCount <= (others=>'0');
				end if;
				if w_cpuClkCount < 2 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
					 w_cpuClock <= '0';
				else
					 w_cpuClock <= '1';
				end if;
			end if;
		end if;
	end process;

end;
