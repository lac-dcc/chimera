-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020-2021
--
-- MC6800 CPU
--	Running MIKBUG from back in the day (SmithBug ACIA version)
--	25 MHz
--	4K (internal) RAM version
-- MC6850 ACIA UART
-- VDU
--		XGA 80x25 ANSI character display
--		PS/2 keyboard
--	SD Card
--		Not used
--		Included in pin list with inactive levels (in case a card is installed)
--
-- The Memory Map is:
--	$0000-$0DFF - 3.5KB SRAM (internal RAM in the EPCE15)
--	$7E00-$7FFF - 512B SRAM (internal RAM in the EPCE15)
--		$7F00-$7FFF are used as scratchpad RAM by MIKBUG
--		$7E00-$7EFF can be used by application program
--	$8018-$8019 - VDU
--	$8028-$8029 - ACIA
--		i_SerSelect (Pin_60 of the FPGA) swaps addresses of VDU and ACIA port (requires pullup in FPGA)
--		Installed (Pin_60 to Ground) uses Serial port
--	$C000-$FFFF - MIKBUG ROM (repeats 4 times from $C000-$FFFF)
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

		-- Video
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
		
		-- Serial (USB referenced)
		i_USB_txd			: in	std_logic := '1';
		o_USB_rxd			: out std_logic;
		i_USB_cts			: out std_logic;
		i_SerSelect			: in	std_logic := '1';

		-- J6 I/O connector
		Pin25					: out std_logic := '0';
		Pin31					: out std_logic := '0';
		Pin41					: out std_logic := '0';
		Pin40					: out std_logic := '0';
		Pin43					: out std_logic := '0';
		Pin42					: out std_logic := '0';
		Pin45					: out std_logic := '0';
		Pin44					: out std_logic := '0';
		
		-- SD card not used but making sure that it's not active
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '1';
		i_sdMISO				: in std_logic;
		o_sdSCLK				: out std_logic := '1';
		o_driveLED			: out std_logic :='1';
		
		-- SRAM not used but making sure that it's not active
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		io_extSRamAddress	: out std_logic_vector(16 downto 0);
		io_n_extSRamWE		: out std_logic := '1';
		io_n_extSRamCS		: out std_logic := '1';
		io_n_extSRamOE		: out std_logic := '1'
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';
	signal w_resetCPUHi	: std_logic := '1';

	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;
	signal w_memWR			: std_logic;

	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_ramData1		: std_logic_vector(7 downto 0);
	signal w_ramData2		: std_logic_vector(7 downto 0);
	signal w_ramData3		: std_logic_vector(7 downto 0);
	signal w_SPRamData	: std_logic_vector(7 downto 0);
	signal w_if1DataOut	: std_logic_vector(7 downto 0);
	signal w_if2DataOut	: std_logic_vector(7 downto 0);
	
	signal w_RAM_CS_1		: std_logic;
	signal w_RAM_CS_2		: std_logic;
	signal w_RAM_CS_3		: std_logic;
	signal w_SP_RAM_CS	: std_logic;

--	signal n_int1			: std_logic :='1';	
	signal w_n_if1CS		: std_logic :='1';
--	signal n_int2			: std_logic :='1';	
	signal w_n_if2CS		: std_logic :='1';

	signal w_cpuClkCt		: std_logic_vector(5 downto 0); 
	signal w_cpuClk		: std_logic;

   -- signal serialCount   : std_logic_vector(15 downto 0) := x"0000";
   -- signal serialCount_d	: std_logic_vector(15 downto 0);
   signal serialEn      : std_logic;
	
begin
	
	-- Debug
--	Pin25 <= w_cpuClk;
--	Pin31 <= w_RAM_CS_1;
--	Pin41 <= w_memWR;
--	Pin40 <= i_SerSelect;
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk			=> w_cpuClk,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_resetLow
	);
	
	-- Need CPU reset to be later and later than peripherals
	process (w_cpuClk)
		begin
			if rising_edge(w_cpuClk) then
				w_resetCPUHi <= not w_resetLow;
			end if;
		end process;
	
	w_memWR <= (not w_R1W0) and w_vma and not w_cpuClk;
--	w_memRD <=      w_R1W0  and w_vma;
	
	-- SRAM Chip Selects
	w_RAM_CS_1	<= '1' when ((w_cpuAddress(15 downto 11)	=x"0"&"0"))		else '0';	-- 0x0000-0x07FF = 2KB
	w_RAM_CS_2	<= '1' when ((w_cpuAddress(15 downto 10)	=x"0"&"10"))	else '0';	-- 0x0800-0x0BFF = 1KB
	w_RAM_CS_3	<= '1' when ((w_cpuAddress(15 downto 9)	=x"0"&"110"))	else '0';	-- 0x0C00-0x0DFF = 512B
	w_SP_RAM_CS	<= '1' when ((w_cpuAddress(15 downto 9)	=x"7"&"111"))	else '0';	-- 0x7E00-0x7FFF = 512B (Scratchpad)
	
	-- ____________________________________________________________________________________
	-- I/O Chip Selects
	w_n_if1CS	<= '0' 	when (i_SerSelect = '1' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
						'0'	when (i_SerSelect = '0' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
						'1';
	w_n_if2CS	<= '0' 	when (i_SerSelect = '1' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
						'0'	when (i_SerSelect = '0' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
						'1';
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		w_romData		when w_cpuAddress(15 downto 14) = "11"		else
		w_ramData1		when w_RAM_CS_1	= '1'							else
		w_ramData2		when w_RAM_CS_2	= '1'							else
		w_ramData3		when w_RAM_CS_3	= '1'							else
		w_SPRamData		when w_SP_RAM_CS	= '1'							else
		w_if1DataOut	when w_n_if1CS 	= '0'							else
		w_if2DataOut	when w_n_if2CS		= '0'							else
		x"FF";
	
	-- ____________________________________________________________________________________
	-- 6800 CPU
	cpu1 : entity work.cpu68
		port map(
			clk		=> w_cpuClk,
			rst		=> w_resetCPUHi,
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
	-- 2KB RAM
	sram1 : entity work.InternalRam2K
		PORT map  (
			address	=> w_cpuAddress(10 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> w_RAM_CS_1 and w_memWR,
			q			=> w_ramData1
		);
	
	-- ____________________________________________________________________________________
	-- 1KB RAM
	sram2 : entity work.InternalRam1K
		PORT map  (
			address	=> w_cpuAddress(9 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> w_RAM_CS_2 and w_memWR,
			q			=> w_ramData2
		);
	
	-- ____________________________________________________________________________________
	-- 512B RAM
	sram3 : entity work.InternalRam512B
		PORT map  (
			address	=> w_cpuAddress(8 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> w_RAM_CS_3 and w_memWR,
			q			=> w_ramData3
		);
	
	-- ____________________________________________________________________________________
	-- 512B Scratchpad RAM
	scatchPadRam : entity work.InternalRam512b
		PORT map  (
			address	=> w_cpuAddress(8 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> w_SP_RAM_CS and w_memWR,
			q			=> w_SPRamData
		);
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA and PS/2 driver
	vdu : entity work.SBCTextDisplayRGB
		generic map ( 
--			COLOUR_ATTS_ENABLED => 0,
			SANS_SERIF_FONT => 1,
			COLOUR_ATTS_ENABLED => 1,
			EXTENDED_CHARSET => 0
		)
		port map (
			clk		=> i_CLOCK_50,
			n_reset	=> w_resetLow,
			-- CPU
			n_wr		=> w_n_if1CS or      w_R1W0  or (not w_vma) or (not w_cpuClk),
			n_rd		=> w_n_if1CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			-- VGA
			videoR0	=> o_videoR0,
			videoR1	=> o_videoR1,
			videoG0	=> o_videoG0,
			videoG1	=> o_videoG1,
			videoB0	=> o_videoB0,
			videoB1	=> o_videoB1,
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			-- PS/2
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
	);
	
	-- ACIA UART serial interface
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			-- CPU
			n_wr		=> w_n_if2CS or      w_R1W0  or (not w_vma) or (not w_cpuClk),
			n_rd		=> w_n_if2CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
--			CPU
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> i_USB_txd,
			txd		=> o_USB_rxd,
			n_rts		=> i_USB_cts
		);
	
	-- ____________________________________________________________________________________
	-- CPU Clock
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
				if w_cpuClkCt < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
					w_cpuClkCt <= w_cpuClkCt + 1;
				else
					w_cpuClkCt <= (others=>'0');
				end if;
				if w_cpuClkCt < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
					w_cpuClk <= '0';
				else
					w_cpuClk <= '1';
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
