-- -------------------------------------------------------------------------------------------
-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020-2021
--
-- MC6800 CPU
--		25 NHz for internal SRAM and Peripherals
--	Running MIKBUG from back in the day
--		32K (internal) RAM version
-- Default I/O is jumper selectable
-- 	VDU - ANSI terminal (default)
--			XGA 80x25 character display
--			PS/2 keyboard
-- 	MC6850 ACIA UART
--	
--	Front Panel
--		http://land-boards.com/blwiki/index.php?title=Front_Panel_for_8_Bit_Computers_V2
--		Monitors Address/Data when in Run mode
--		Upper left pushbutton (PB31) - Run.Halt (Upper leftLED on for Run)
--		PB30 - Reset
--		PB29 - Step - Not yet implemented
--		PB27 - Clear - Clears address if in Set Address Mode control mode
--		PB26 - Increment address - Function depend on Enable Write Data and Set Address Mode controls
--			Ignored if Set Address is selected
--			If Enable Write Data is selected, Write data then Increment address
--			If Enable Write Data is not selectedrwise increment read address and read next location
--		PB25 - Enable Write Data control - Bottom row of pushbuttons controls write of data to memory
--		PB24 - Set Address Mode control - Middle two rows of pushbuttons control LEDs
--	
--	Memory Map
--		0x0000-0x7FFF - INTERBAL SRAM
--		0x8018-0x8019 - VDU (serSelect J3 JUMPER REMOCED)
--		0x8028-0x8019 - ACIA
--		0x8030-0x803F - Front Panel
--		0xC000-0xFFFF - MIKBUG ROM - Copied 4X
-- -------------------------------------------------------------------------------------------

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

		-- PS/2
		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		-- USB Serial (Referenced to the USB side)
		usbtxd1				: in	std_logic := '1';
		usbrxd1				: out std_logic;
		usbrts1				: in	std_logic := '1';
		usbcts1				: out std_logic;
		serSelect			: in	std_logic := '1';
		
		-- I2C to Front Panel
		io_I2C_SCL			: inout	std_logic := '1';
		io_I2C_SDA			: inout	std_logic := '1';
		i_I2C_INTn			: in	std_logic := '1';
		
		-- SRAM not used but making sure that it's not active
		io_extSRamData		: inout std_logic_vector(7 downto 0) := (others=>'Z');
		io_extSRamAddress	: out std_logic_vector(19 downto 0) := x"00000";
		io_n_extSRamWE		: out std_logic := '1';
		io_n_extSRamCS		: out std_logic := '1';
		io_n_extSRamOE		: out std_logic := '1';

		-- Not using the SD RAM but making sure that it's not active
		n_sdRamCas			: out std_logic := '1';		-- CAS
		n_sdRamRas			: out std_logic := '1';		-- RAS
		n_sdRamWe			: out std_logic := '1';		-- SDWE
		n_sdRamCe			: out std_logic := '1';		-- SD_NCS0
		sdRamClk				: out std_logic := '1';		-- SDCLK0
		sdRamClkEn			: out std_logic := '1';		-- SDCKE0
		sdRamAddr			: out std_logic_vector(14 downto 0) := "000"&x"000";
		w_sdRamData			: in std_logic_vector(15 downto 0) := (others=>'Z')
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic;
	signal w_CPUResetHi	: std_logic;
	signal w_FPReset		: std_logic;
	
	signal w_ExtRamAddr	: std_logic := '0';						-- There's not external SRAM in this build

	-- CPU signals
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);		-- Data into the CPU
	signal w_R1W0B			: std_logic;								-- Read / Write from the CPU
	signal w_R1W0			: std_logic;								-- ead / Write to the Memory
	signal w_vma			: std_logic;

	-- Front Panel intercepts
	signal w_cpuAddress	: std_logic_vector(15 downto 0);		-- Address from the Front Panel
	signal w_cpuAddressB	: std_logic_vector(15 downto 0);		-- Address out of the CPU
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);		-- DAta to Memory / Peripherals
	signal w_cpuDataOutB	: std_logic_vector(7 downto 0);		-- Data out of the CPU
	signal w_run0Halt1	:	std_logic;								-- Run / Halt from the Front Panel (PB31)
	signal w_wrRamStr		:	std_logic;								-- Write Strobe to SRAM 
		
	-- Data busses
	signal w_romData		: std_logic_vector(7 downto 0);		-- Data from the ROM
	signal w_ramData		: std_logic_vector(7 downto 0);		-- Data from the SRAM
	signal w_if1DataOut	: std_logic_vector(7 downto 0);		-- Data from the VDU
	signal w_if2DataOut	: std_logic_vector(7 downto 0);		-- Data from the ACIA

	-- Chip Selects
	signal n_if1CS			: std_logic :='1';						-- VDU Chip Select
	signal n_if2CS			: std_logic :='1';						-- ACIA Chip Select

	-- CPU Clock block
	signal q_cpuClkCount	: std_logic_vector(5 downto 0); 		-- CPU speed counter
	signal w_cpuClock		: std_logic;								-- CPU Clock

   signal serialEn      : std_logic;								-- 16x Serial Clock

begin
	
	-- Debounce the reset line
	DebounceFPGAResetPB	: entity work.Debouncer
	port map (
		i_clk		=> w_cpuClock,
		i_PinIn	=> i_n_reset,
		o_PinOut	=> w_resetLow
	);
	
	-- Need CPU reset to be later than peripherals
	process (w_cpuClock)
		begin
			if rising_edge(w_cpuClock) then
				w_CPUResetHi <= ((not w_resetLow) or (not w_FPReset));
			end if;
		end process;
		
	-- ____________________________________________________________________________________
	-- Front Panel
	MIKBUG_FRPNL : entity work.MIKBUG_FRPNL
		port map
		(
		-- Clock and reset
		i_CLOCK_50			=> i_CLOCK_50,
		i_cpuClock			=> w_cpuClock,
		i_n_reset			=> w_resetLow,
		o_FPReset			=> w_FPReset,
		-- CPU intercepts
		-- Front Panel loops back signals when in Front Panel switch is in Run Mode
		i_CPUAddress		=> w_cpuAddressB,
		o_CPUAddress		=> w_cpuAddress,
		i_cpuData			=> w_cpuDataOutB,
		o_cpuData			=> w_cpuDataOut,
		i_CPURdData			=> w_cpuDataIn,
		io_run0Halt1		=> w_run0Halt1,
		o_wrRamStr			=> w_wrRamStr,
		i_R1W0				=> w_R1W0B,
		o_R1W0				=> w_R1W0,
		-- External I2C connections
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		i_I2C_INTn			=> i_I2C_INTn
	);
	
	-- ____________________________________________________________________________________
	-- I/O CHIP SELECTS
	n_if1CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
					'1';
	n_if2CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU  $8018-$8019
					'1';
	
	-- ____________________________________________________________________________________
	-- 6800 CPU
	cpu1 : entity work.cpu68
		port map(
			clk		=> w_cpuClock,
			rst		=> w_CPUResetHi,	-- resetD1 and not resetD2,
			rw			=> w_R1W0B,
			vma		=> w_vma,
			address	=> w_cpuAddressB,
			data_in	=> w_cpuDataIn,
			data_out	=> w_cpuDataOutB,
			hold		=> '0',
			halt		=> w_run0Halt1,
			irq		=> '0',
			nmi		=> '0'
		); 
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		w_ramData		when w_cpuAddress(15) = '0'				else
		w_if1DataOut	when n_if1CS = '0'							else
		w_if2DataOut	when n_if2CS = '0'							else
		w_romData		when w_cpuAddress(15 downto 14) = "11"	else
		x"FF";
	
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
	-- 32KB RAM	
	sram : entity work.InternalRam32K
		PORT map  (
			address	=> w_cpuAddress(14 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> (((not w_R1W0) and (not w_cpuAddress(15)) and w_vma and (not w_cpuClock) and (not w_run0Halt1)) 
							or (w_wrRamStr and w_run0Halt1)),
			q			=> w_ramData
		);
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	vdu : entity work.SBCTextDisplayRGB
		port map (
			clk		=> i_CLOCK_50,
			n_reset	=> w_resetLow,
			-- CPU interface
			n_WR		=> n_if1CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> n_if1CS or (not w_R1W0) or (not w_vma),
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
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_WR		=> n_if2CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> n_if2CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> usbtxd1,
			txd		=> usbrxd1,
			n_cts		=> usbrts1,
			n_rts		=> usbcts1
		);
		
	-- ____________________________________________________________________________________
	-- CPU Clock - 25 MHz for internal accesses
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
					if w_ExtRamAddr = '1' then
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
	
	-- ____________________________________________________________________________________
	-- Baud Rate Generator
	-- Legal BAUD_RATE values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
	BaudRateGen : entity work.BaudRate6850
	GENERIC map (
		BAUD_RATE	=>  115200
	)
	PORT map (
		i_CLOCK_50	=> i_CLOCK_50,
		o_serialEn	=> serialEn
	);

end;
