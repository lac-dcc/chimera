-- ----------------------------------------------------------------------------------------------
-- This file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020
-- 6809 CPU
-- 	16.7 MHz
--	56K (external) RAM version
-- 8K Extended BASIC (c) 1982 MICROSOFT
-- Serial interface or VGA VDU
--		Jumper in pin Pin_L17 to ground (adjacent pin) of the FPGA selects the VDU/Serial port
--		J3 SW1 at the bottom on the box connects to FPGA pin Pin_L17
--		Install to make serial port default
--		Remove jumper to make the VDU default
--		115,200 baud serial port
--		Hardware handshake RTS/CTS
--	MEMORY MAP
--		x0000-xdfff - 56KB External SRAM
--		xe000-xffff - 8KB ROM
--		xffd0-xffd1 - VDU
--		xffd2-xffd3 - Serial port
-- ----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		n_reset		: in std_logic;
		i_CLOCK_50	: in std_logic;
		
		-- 56KB external SRAM
		sramData		: inout std_logic_vector(7 downto 0);
		sramAddress	: out std_logic_vector(19 downto 0);
		n_sRamWE		: out std_logic;
		n_sRamCS		: out std_logic;
		n_sRamOE		: out std_logic;
		
		-- Serial port (USB-Serial interface)
		rxd1			: in std_logic := '1';
		txd1			: out std_logic;
		cts1			: in std_logic := '1';
		rts1			: out std_logic;
		serSelect	: in std_logic;			--		Install to make serial port default
		
		-- Video Display Unit (VGA)
		videoR0		: out std_logic := '1';
		videoG0		: out std_logic := '1';
		videoB0		: out std_logic := '1';
		videoR1		: out std_logic := '1';
		videoG1		: out std_logic := '1';
		videoB1		: out std_logic := '1';
		hSync			: out std_logic := '1';
		vSync			: out std_logic := '1';

		-- PS/2 keyboard
		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic;
		
		IO_PIN		: inout std_logic_vector(48 downto 3) := x"0000000000"&"00";
--	
--		testPt1		: out std_logic := '1';
--		testPt2		: out std_logic := '1';
		
		-- Not using the SD Card but reserving pins and making inactive
		sdCardCS		: out		std_logic :='1';
		sdCardMOSI	: out		std_logic :='0';
		sdCardMISO	: in		std_logic;
		sdCardSCLK	: out		std_logic :='0';
		
		-- Not using the SD RAM on the QMTECH FPGA card but making sure that it's not active
		n_sdRamCas	: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas	: out std_logic := '1';		-- RAS
		n_sdRamWe	: out std_logic := '1';		-- SDWE
		n_sdRamCe	: out std_logic := '1';		-- SD_NCS0
		sdRamClk		: out std_logic := '1';		-- SDCLK0
		sdRamClkEn	: out std_logic := '1';		-- SDCKE0
		sdRamAddr	: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData	: in std_logic_vector(15 downto 0)
	);
end Microcomputer;

architecture struct of Microcomputer is

	signal w_n_WR				: std_logic;
	signal w_n_RD				: std_logic;
	signal w_cpuAddress		: std_logic_vector(15 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);

	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_if1DataOut		: std_logic_vector(7 downto 0);
	signal w_if2DataOut		: std_logic_vector(7 downto 0);

	signal w_n_memWR			: std_logic :='1';
	signal w_n_memRD 			: std_logic :='1';

	signal w_n_int1			: std_logic :='1';	
	signal w_n_int2			: std_logic :='1';	
	
	signal w_n_extRamCS		: std_logic :='1';
	signal w_n_basRomCS		: std_logic :='1';
	signal w_n_IF1CS			: std_logic :='1';
	signal w_n_IF2CS			: std_logic :='1';

	signal q_cpuClkCount		: std_logic_vector(5 downto 0); 
	signal w_cpuClock			: std_logic;
	signal w_resetLow			: std_logic := '1';

   signal w_serialCount    : std_logic_vector(15 downto 0) := x"0000";
   signal w_serialCount_d  : std_logic_vector(15 downto 0);
   signal w_serialEn       : std_logic;
	
begin

--	testPt2 <= w_cpuClock;
--	testPt1 <= w_n_memWR;
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk			=> w_cpuClock,
		i_PinIn		=> n_reset,
		o_PinOut		=> w_resetLow
	);
	
	-- SRAM
	sramAddress(19 downto 16) <= "0000";
	sramAddress(15 downto 0) <= w_cpuAddress(15 downto 0);
	sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
	n_sRamWE <= w_n_memWR;
	n_sRamOE <= w_n_memRD;
	n_sRamCS <= w_n_extRamCS;
	
	-- ____________________________________________________________________________________
	-- 6809 CPU
	-- works with Version 1.26
	-- Does not work with Version 1.28 FPGA core
	cpu1 : entity work.cpu09
		port map(
			clk		=> not(w_cpuClock),
			rst		=> not w_resetLow,
			rw			=> w_n_WR,
			addr		=> w_cpuAddress,
			data_in	=> w_cpuDataIn,
			data_out	=> w_cpuDataOut,
			halt		=> '0',
			hold		=> '0',
			irq		=> '0',
			firq		=> '0',
			nmi		=> '0'
		); 
	
	-- ____________________________________________________________________________________
	-- BASIC ROM	
	rom1 : entity work.M6809_EXT_BASIC_ROM -- 8KB BASIC
		port map(
			address	=> w_cpuAddress(12 downto 0),
			clock		=> i_CLOCK_50,
			q			=> w_basRomData
		);
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	VDU : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			-- CPU I/F
			n_WR		=> w_n_IF1CS or w_cpuClock or w_n_WR,
			n_RD		=> w_n_IF1CS or w_cpuClock or (not w_n_WR),
			n_int		=> w_n_int1,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			-- VGA signals
			hSync		=> hSync,
			vSync		=> vSync,
			videoR0	=> videoR0,
			videoR1	=> videoR1,
			videoG0	=> videoG0,
			videoG1	=> videoG1,
			videoB0	=> videoB0,
			videoB1	=> videoB1,
			-- PS/2 keyboard
			ps2clk	=> ps2Clk,
			ps2Data	=> ps2Data
		);
	
	-- Replaced Grant's bufferedUART with Neal Crook's version which uses clock enables instead of clock
	ACIA : entity work.bufferedUART
		port map(
			clk		=> i_CLOCK_50,
			n_WR		=> w_n_IF2CS or w_cpuClock or w_n_WR,
			n_RD		=> w_n_IF2CS or w_cpuClock or (not w_n_WR),
			n_int		=> w_n_int2,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			rxClkEn	=> w_serialEn,
			txClkEn	=> w_serialEn,			
			rxd		=> rxd1,
			txd		=> txd1,
			n_cts		=> cts1,
			n_rts		=> rts1
		);
	
	-- ____________________________________________________________________________________
	-- MEMORY READ/WRITE LOGIC
	w_n_memRD <= not(w_cpuClock) nand w_n_WR;
	w_n_memWR <= not(w_cpuClock) nand (not w_n_WR);
	
	-- ____________________________________________________________________________________
	-- CHIP SELECTS
	-- Jumper in pin Pin_L17 to ground (adjacent pin) of the FPGA selects the VDU/Serial port
	w_n_basRomCS	<= '0' when w_cpuAddress(15 downto 13) = "111" else '1'; 										--8K at top of memory
	w_n_IF1CS		<= '0' when ((w_cpuAddress(15 downto 1) = x"ffd"&"000" and serSelect = '1') or 
								       (w_cpuAddress(15 downto 1) = x"ffd"&"001" and serSelect = '0')) else '1'; -- 2 bytes FFD0-FFD1
	w_n_IF2CS		<= '0' when ((w_cpuAddress(15 downto 1) = x"ffd"&"001" and serSelect = '1') or 
								       (w_cpuAddress(15 downto 1) = x"ffd"&"000" and serSelect = '0')) else '1'; -- 2 bytes FFD2-FFD3
	w_n_extRamCS	<=  w_cpuAddress(15) and w_cpuAddress(14) and w_cpuAddress(13);								-- active low
	
	-- ____________________________________________________________________________________
	-- BUS ISOLATION
	-- Order matters since SRAM overlaps I/O chip selects
	w_cpuDataIn <=
		w_if1DataOut	when w_n_IF1CS = '0' else
		w_if2DataOut	when w_n_IF2CS = '0' else
		sramData			when w_n_extRamCS= '0' else
		w_basRomData	when w_n_basRomCS = '0' else
		x"FF";
	
	-- ____________________________________________________________________________________
	-- SYSTEM CLOCKS
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
				if q_cpuClkCount < 2 then		-- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
					q_cpuClkCount <= q_cpuClkCount + 1;
				else
					q_cpuClkCount <= (others=>'0');
				end if;
				if q_cpuClkCount < 2 then		-- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
					w_cpuClock <= '0';
				else
					w_cpuClock <= '1';
				end if;
			end if;
		end process;

	-- Pass Baud Rate in BAUD_RATE generic as integer value (300, 9600, 115,200)
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
