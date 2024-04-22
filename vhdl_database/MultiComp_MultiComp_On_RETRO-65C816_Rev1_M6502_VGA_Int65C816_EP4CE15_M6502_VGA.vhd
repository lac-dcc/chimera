-- Grant Searle's Multicomp as described here:
-- http://searle.x10host.com/Multicomp/index.html
-- 
-- http://land-boards.com/blwiki/index.php?title=RETRO-65C816
--
-- External 65C816 disabled
-- 65C02 CPU
--	8 MHz
-- 1MB External SRAM
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
--		3.3V to 5V level translator
--		F1 key switches between VDU and Serial port
--			Default is VDU
--		F2 key switches serial port baud rate between 300 and 115,200
--			Default is 115,200 baud
--	SD Card
-- Memory Map
--		x0000-xDFFF - External SRAM
--		xE000-xFFFF - 8KB BASIC in ROM
--	I/O Ports
--		xFFD0-xFFD1 VDU
--		xFFD2-xFFD3 ACIA
--		xFFD7-xFFDD SD card


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
		
		sdCS			: out std_logic;
		sdMOSI		: out std_logic;
		sdMISO		: in std_logic;
		sdClock		: out std_logic;
		driveLED		: out std_logic;
		
		IO_PIN		: inout std_logic_vector(48 downto 21) := x"0000000";
	
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
		io_ps2Data	: inout std_logic;
		
		-- 65C816 pins
		CPU_BusEnable	: out std_logic := '0';		-- Bus Enable input signal allows external control of the Address and Data Buffers
																-- as well as the RWB signal.
		CPU_E				: in std_logic;				-- Emulation Status output reflects the state of the Emulation (E) mode flag 
																-- in the Processor Status (P) Register
		n_CPU_Res		: out std_logic := '0';		-- Reset active low input is used to initialize the microprocessor and start program execution
		CPU_MX			: in std_logic;				-- Memory/Index Select Status multiplexed output reflects the state of the Accumulator (M) 
																-- and Index (X) elect flags (bits 5 and 4 of the Processor Status (P) Register
		CPU_CLK			: out std_logic := '0';		-- Phase 2 In is the system clock input to the microprocessor. 
																-- PHI2 can be held in either state to preserve the contents of internal registers 
																-- and reduce power as a Standby mode.
		CPU_NMIB			: out std_logic := '1';		-- Non-Maskable Interrupt 
		CPU_RWB			: in std_logic;				-- Read/Write output signal is used to control whether the microprocessor is "Reading" 
																-- or "Writing" to  memory
		CPU_IRQB			: out std_logic := '1';		-- Interrupt Request negative level active input signal is used to request that an 
																-- interrupt sequence be initiated
		CPU_VDA			: in std_logic;				-- Valid Data Address
		CPU_VPA			: in std_logic;				-- Valid Peripheral Address
		CPU_ABORTB		: out std_logic := '1';		-- The Abort negative pulse active input is used to abort instructions 
																-- (usually due to an Address Bus condition).
		CPU_RDY			: inout std_logic;			-- The Ready is a bi-directional signal. 
																-- When it is an output it indicates that a Wait for Interrupt instruction has been executed 
																-- halting operation of the microprocessor.
		CPU_VPB			: in std_logic;				-- Vector Pull active low output indicates that a vector location is being addressed 
																-- during an interrupt sequence
		CPU_MLB			: in std_logic					-- Memory Lock active low output may be used to ensure the integrity of Read Modify Write 
																-- instructions in a multiprocessor system
	);
end M6502_VGA;

architecture struct of M6502_VGA is

	signal w_reset_n			: std_logic;
	signal w_n_WR				: std_logic;
	signal w_cpuAddress		: std_logic_vector(23 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);
	
	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal w_aciaDataOut		: std_logic_vector(7 downto 0);
	signal sdCardDataOut		: std_logic_vector(7 downto 0);
	
	signal w_n_basRomCS		: std_logic :='1';
	signal w_n_VDUCS			: std_logic :='1';
	signal w_n_aciaCS			: std_logic :='1';
	signal n_sdCardCS			: std_logic :='1';
	
	signal w_serialClkCount	: std_logic_vector(15 downto 0);	-- DDS counter for baud rate
	signal w_serClkCt_d 		: std_logic_vector(15 downto 0);
	signal w_w_serClkEn		: std_logic;

	signal w_cpuClkCt			: std_logic_vector(5 downto 0);	-- 50 MHz oscillator counter
	signal w_cpuClk			: std_logic;							-- CPU clock rate selectable
	
	signal w_fKey1				: std_logic;	--	F1 key switches between VDU and Serial port
														--		Default is VDU
	signal w_fKey2				: std_logic;	--	F2 key switches serial port baud rate between 300 and 115,200
														--		Default is 115,200 baud
	signal w_funKeys			: std_logic_vector(12 downto 0);

begin
	debounceReset : entity work.Debouncer
	port map (
		i_clk		 	=> w_cpuClk,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_reset_n
	);
	
	-- ____________________________________________________________________________________
	-- Chip Selects
	o_sramAddress <= w_cpuAddress(19 downto 0);
	o_n_sRamCS	<= w_cpuAddress(15) and w_cpuAddress(14) and w_cpuAddress(13); -- Low for x0000-xDFFF (48KB)	
	o_n_sRamWE <= not ((not w_cpuClk) and (not w_n_WR) and ((not w_cpuAddress(15)) or (not w_cpuAddress(14)) or(not w_cpuAddress(13))));
	o_n_sRamOE <= not (                        w_n_WR  and ((not w_cpuAddress(15)) or (not w_cpuAddress(14)) or(not w_cpuAddress(13))));
	io_sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
		
	w_n_basRomCS 	<= '0' when  w_cpuAddress(15 downto 13) = "111" else '1'; 						-- xE000-xFFFF (8KB)
	
	w_n_VDUCS 		<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000" and w_fKey1 = '0') 	-- XFFD0-FFD1 VDU
							or		 (w_cpuAddress(15 downto 1) = x"FFD"&"001" and w_fKey1 = '1')) 
							else '1';
	
	w_n_aciaCS 	<= '0' when ((w_cpuAddress(15 downto 1) = X"FFD"&"001" and w_fKey1 = '0') 		-- XFFD2-FFD3 ACIA
							or     (w_cpuAddress(15 downto 1) = X"FFD"&"000" and w_fKey1 = '1'))
							else '1';
							
-- Add new I/O startimg at XFFD4 (65492 dec)

	n_sdCardCS	<= '0' when w_cpuAddress(15 downto 3) = x"FFD"&'1' else '1'; 			-- 8 bytes XFFD8-FFDF
	
	w_cpuDataIn <=
		w_VDUDataOut	when w_n_VDUCS 	= '0'	else
		w_aciaDataOut	when w_n_aciaCS 	= '0'	else
		io_sramData		when o_n_sRamCS	= '0'	else
		sdCardDataOut	when n_sdCardCS	= '0' else
		w_basRomData	when w_n_basRomCS	= '0' else		-- HAS TO BE AFTER ANY I/O READS
		x"FF";
		
	CPU : entity work.T65
	port map(
		Enable			=> '1',
		Mode				=> "10",					-- 65C816
		Res_n				=> w_reset_n,
		clk				=> w_cpuClk,
		Rdy				=> '1',
		Abort_n			=> '1',
		IRQ_n				=> '1',
		NMI_n				=> '1',
		SO_n				=> '1',
		R_w_n				=> w_n_WR,
		A(23 downto 0)	=> w_cpuAddress,
		DI 				=> w_cpuDataIn,
		DO 				=> w_cpuDataOut);
		
	ROM : entity work.M6502_BASIC_ROM -- 8KB
	port map(
		address	=> w_cpuAddress(12 downto 0),
		clock		=> i_clk_50,
		q			=> w_basRomData
	);

	UART : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_WR		=> w_n_aciaCS or w_cpuClk or w_n_WR,
			n_RD		=> w_n_aciaCS or w_cpuClk or (not w_n_WR),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_aciaDataOut,
			rxClkEn	=> w_w_serClkEn,
			txClkEn	=> w_w_serClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_n_cts,
			n_rts		=> o_n_rts,
			n_dcd		=> '0'
		);
	
	VDU : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET => 1,
		COLOUR_ATTS_ENABLED => 1
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

	FNKey2Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => w_funKeys(2),
			clock => i_clk_50,
			n_res => w_reset_n,
			latchFNKey => w_fKey2
		);
	
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
		driveLED => driveLED,
		clk => i_clk_50
	);

-- SUB-CIRCUIT CLOCK SIGNALS 
	process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then
			if w_cpuClkCt < 5 then -- 5 = 8MHz, 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
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
	 
	 
	-- ____________________________________________________________________________________
	-- Baud Rate Clock Signals
	-- Serial clock DDS
	-- 50MHz master input clock:
	-- f = (increment x 50,000,000) / 65,536 = 16X baud rate
	-- Baud Increment
	-- 115200 2416
	-- 38400 805
	-- 19200 403
	-- 9600 201
	-- 4800 101
	-- 2400 50
	-- 300 6

	baud_div: process (w_serClkCt_d, w_serialClkCount, w_fKey2)
		begin
			if w_fKey2 = '0' then
				w_serClkCt_d <= w_serialClkCount + 2416;	-- 115,200 baud
			else
				w_serClkCt_d <= w_serialClkCount + 6;		-- 300 baud
				end if;
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(i_clk_50)
		begin
			if rising_edge(i_clk_50) then
					w_serialClkCount <= w_serClkCt_d;
				if w_serialClkCount(15) = '0' and w_serClkCt_d(15) = '1' then
					w_w_serClkEn <= '1';
				else
					w_w_serClkEn <= '0';
				end if;
       end if;
    end process;
	 
end;
