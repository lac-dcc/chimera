-- Original file is copyright by Grant Searle 2014
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2019
-- Features
--		6809 CPU
--		32K (internal) RAM
--		PS/2 keyboard
--		ANSI VDU
--			VGA output
--			128 character set
--		ACIA
--			115,200 baud
--			Board mod for RTS/CTS
--		Reset switch - SW5 - Does warm start
--		8 position DIP switch
--			DIP switch 0 - Selects default (On = Serial, Off = VDU)
--		3 pushbuttons
--		10 Ring LEDs
--			2 positions Used for RTS/CTS mod
--		SD card interface

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		i_n_reset			: in std_logic;
		i_clk_50				: in std_logic;

		o_vid_red			: out std_logic;
		o_vid_grn			: out std_logic;
		o_vid_blu			: out std_logic;
		o_vid_hSync			: out std_logic;
		o_vid_vSync			: out std_logic;
		
		i_pbutton			: in std_logic_vector(2 downto 0) := "111";
		i_DipSw				: in std_logic_vector(7 downto 0) := x"FF";

		o_LED					: out std_logic_vector(9 downto 0) := x"00"&"00";

		o_BUZZER				: out std_logic := '1';

		i_ps2Clk				: inout std_logic;
		i_ps2Data			: inout std_logic;
		
		i_rxd					: in std_logic;
		o_txd					: out std_logic;
		o_rts					: out std_logic;
		i_cts					: in std_logic;
		
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '1';
		i_sdMISO				: in 	std_logic := '1';
		o_sdSCLK				: out std_logic := '1';
		o_driveLED			: out std_logic := '1';
		
		o_Anode_Activate	: out std_logic_vector(7 downto 0);
		o_LED7Seg_out		: out std_logic_vector(7 downto 0)

	);
end Microcomputer;

architecture struct of Microcomputer is

	signal w_n_WR						: std_logic;
	signal w_cpuAddress				: std_logic_vector(15 downto 0);
	signal w_cpuDataOut				: std_logic_vector(7 downto 0);
	signal w_cpuDataIn				: std_logic_vector(7 downto 0);

	signal w_basRomData				: std_logic_vector(7 downto 0);
	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal w_interface2DataOut		: std_logic_vector(7 downto 0);
	signal w_internalRam1DataOut	: std_logic_vector(7 downto 0);
	signal w_sdCardData				: std_logic_vector(7 downto 0);
	
	signal w_displayed_number		: std_logic_vector(31 downto 0);

	signal w_n_memWR					: std_logic :='1';
	signal w_n_basRomCS				: std_logic :='1';
	signal w_n_VDUCS	: std_logic :='1';
	signal w_n_ACIACS			: std_logic :='1';
	signal w_n_internalRamCS		: std_logic :='1';
	signal w_n_SDCardCS				: std_logic :='1';
	signal w_n_int2					: std_logic;
	signal w_LEDCS1					: std_logic;
	signal w_LEDCS2					: std_logic;
	signal w_LEDCS3					: std_logic;
	signal w_LEDCS4					: std_logic;
	signal w_rLEDCS1					: std_logic;
	signal w_rLEDCS2					: std_logic;
	signal w_pbuttonCS				: std_logic;
	signal w_DIPSwCS					: std_logic;

	signal w_cpuClkCount				: std_logic_vector(5 downto 0); 
	signal w_cpuClock					: std_logic;
	
	signal w_serialClkCount			: std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d  	: std_logic_vector(15 downto 0);
	signal w_serialClkEn       	: std_logic;
	signal w_serialClock				: std_logic;
	
	signal w_videoR0					: std_logic := '0';
	signal w_videoR1					: std_logic := '0';
	signal w_videoG0					: std_logic := '0';
	signal w_videoG1					: std_logic := '0';
	signal w_videoB0					: std_logic := '0';
	signal w_videoB1					: std_logic := '0';

	signal w_ringLEDs					: std_logic_vector(15 downto 0);
	
	--
	
begin

	o_LED <= w_ringLEDs(9 downto 0);
	o_vid_red <= w_videoR1 or w_videoR0;
	o_vid_grn <= w_videoG1 or w_videoG0;
	o_vid_blu <= w_videoB1 or w_videoB0;
	
	-- ____________________________________________________________________________________
	-- CHIP SELECTS - Mapped to match Grant's software mapping
	w_n_basRomCS 		<= '0' when w_cpuAddress(15 downto 13) = "111"	else '1';			-- 8K at top of memory
	w_n_internalRamCS <= '0' when w_cpuAddress(15) = '0' 					else '1';			-- 32K at bottom of memory
	w_n_SDCardCS		<= '1' when w_cpuAddress(15 downto 3)	= x"D00"&'1' else '0';		-- xF008 (8B) = 61448 dec
	w_n_VDUCS 			<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000") and (i_DipSw(0) = '1')) else '1'; 	-- 2 bytes FFD0-FFD1
	w_n_ACIACS 			<= '0' when ((w_cpuAddress(15 downto 1) = x"FFD"&"000") and (i_DipSw(0) = '0')) else '1'; 	-- 2 bytes FFD2-FFD3

	w_LEDCS1 		<= '1' when w_cpuAddress  						= x"D000"  	else '0';		-- xF000 (1B) = 53248 dec
	w_LEDCS2 		<= '1' when w_cpuAddress  						= x"D001"  	else '0';		-- xF001 (1B) = 53249 dec
	w_LEDCS3 		<= '1' when w_cpuAddress  						= x"D002"  	else '0';		-- xF002 (1B) = 53250 dec
	w_LEDCS4 		<= '1' when w_cpuAddress  						= x"D003"  	else '0';		-- xF003 (1B) = 53251 dec
	w_rLEDCS1 		<= '1' when w_cpuAddress  						= x"D004"  	else '0';		-- xF004 (1B) = 53252 dec
	w_rLEDCS2 		<= '1' when w_cpuAddress  						= x"D005"  	else '0';		-- xF005 (1B) = 53253 dec
	w_pbuttonCS		<= '1' when w_cpuAddress  						= x"D006"  	else '0';		-- xF006 (1B) = 53254 dec
	w_DIPSwCS		<= '1' when w_cpuAddress  						= x"D007"  	else '0';		-- xF007 (1B) = 53255 dec
	
	-- ____________________________________________________________________________________
	-- BUS ISOLATION
	-- Order matters since BASIC ROM overlaps I/O chip selects
	w_cpuDataIn <=
		w_VDUDataOut 								when w_n_VDUCS 				= '0' else
		w_interface2DataOut 						when w_n_ACIACS	 			= '0' else
		w_basRomData 								when w_n_basRomCS				= '0' else
		w_internalRam1DataOut 					when w_n_internalRamCS		= '0' else
		w_sdCardData								when w_n_SDCardCS 			= '0' else
		w_displayed_number(31 downto 24) 	when w_LEDCS1					= '1' else	-- read-back
		w_displayed_number(23 downto 16) 	when w_LEDCS2					= '1' else	-- read-back
		w_displayed_number(15 downto 8) 		when w_LEDCS3 					= '1' else	-- read-back
		w_displayed_number(7 downto 0) 		when w_LEDCS4 					= '1' else	-- read-back
		w_ringLEDs(15 downto 8)					when w_rLEDCS1 				= '1' else	-- read-back
		w_ringLEDs(7 downto 0)					when w_rLEDCS2 				= '1' else	-- read-back
		"00000"&i_pbutton							when w_pbuttonCS				= '1' else
		i_DipSw										when w_DIPSwCS					= '1' else
		x"FF";
	
	-- SD Card interface updates for SDHC by Neal Crook based on Grant Searle's design
	sdCard	: entity work.sd_controller
	port map (
		clk 		=> i_clk_50,
		n_reset	=> i_n_reset,
		n_wr 		=> w_n_SDCardCS or w_cpuClock or w_n_WR,
		n_rd 		=> w_n_SDCardCS or w_cpuClock or (not w_n_WR),
		dataIn	=> w_cpuDataOut,
		dataOut	=> w_sdCardData,
		regAddr	=> w_cpuAddress(2 downto 0),
		sdCS 		=> o_sdCS,
		sdMOSI	=> o_sdMOSI,
		sdMISO	=> i_sdMISO,
		sdSCLK	=> o_sdSCLK,
		driveLED	=> o_driveLED
	);

	-- ____________________________________________________________________________________
	-- CPU CHOICE GOES HERE
	cpu1 : entity work.cpu09
		port map(
			clk 		=> not(w_cpuClock),
			rst 		=> not i_n_reset,
			rw 		=> w_n_WR,
			addr 		=> w_cpuAddress,
			data_in 	=> w_cpuDataIn,
			data_out => w_cpuDataOut,
			halt 		=> '0',
			hold 		=> '0',
			irq 		=> '0',
			firq 		=> '0',
			nmi 		=> '0'
		); 
	
	-- ____________________________________________________________________________________
	-- ROM GOES HERE	
	rom1 : entity work.M6809_EXT_BASIC_ROM -- 8KB BASIC
		port map(
			address 	=> w_cpuAddress(12 downto 0),
			clock 	=> i_clk_50,
			q 			=> w_basRomData
		);
	
	-- ____________________________________________________________________________________
	-- RAM GOES HERE
	
 	ram1: entity work.InternalRam32K
		port map
		(
			address 	=> w_cpuAddress(14 downto 0),
			clock 	=> i_clk_50,
			data 		=> w_cpuDataOut,
			wren 		=> not(w_n_memWR or w_n_internalRamCS),
			q 			=> w_internalRam1DataOut
		);
			
	-- ____________________________________________________________________________________
	-- Display GOES HERE

	io1 : entity work.SBCTextDisplayRGB
	generic map (
		EXTENDED_CHARSET		=> 0,
		COLOUR_ATTS_ENABLED	=> 1
	)
		port map (
			n_reset 	=> i_n_reset,
			clk 		=> i_clk_50,
			n_wr 		=> w_n_VDUCS or w_cpuClock or w_n_WR,
			n_rd 		=> w_n_VDUCS or w_cpuClock or (not w_n_WR),
			regSel 	=> w_cpuAddress(0),
			dataIn 	=> w_cpuDataOut,
			dataOut 	=> w_VDUDataOut,
			-- VGA Video signals
			hSync 	=> o_vid_hSync,
			vSync 	=> o_vid_vSync,
			videoR0 	=> w_videoR0,
			videoR1 	=> w_videoR1,
			videoG0 	=> w_videoG0,
			videoG1 	=> w_videoG1,
			videoB0 	=> w_videoB0,
			videoB1 	=> w_videoB1,
			-- PS/2 Keyboard
			ps2Clk 	=> i_ps2Clk,
			ps2Data 	=> i_ps2Data
		);

	ACIA : entity work.bufferedUART
		port map(
			clk		=> i_clk_50,
			n_wr		=> w_n_ACIACS or w_cpuClock or w_n_WR,
			n_rd		=> w_n_ACIACS or w_cpuClock or (not w_n_WR),
			n_int		=> w_n_int2,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_interface2DataOut,
			rxClkEn	=> w_serialClkEn,
			txClkEn	=> w_serialClkEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_cts,
			n_rts		=> o_rts,
			n_dcd		=> '0'
			);	

	-- ____________________________________________________________________________________
	-- MEMORY READ/WRITE LOGIC GOES HERE
	w_n_memWR <= not(w_cpuClock) nand (not w_n_WR);
	
	SEVEN_SEG : entity work.Loadable_7S8D_LED
	port map (
		i_clock_50Mhz			=> i_clk_50,
		i_reset 					=> not i_n_reset,
		i_displayed_number	=> w_displayed_number,
		o_Anode_Activate 		=> o_Anode_Activate,
		o_LED7Seg_out 			=> o_LED7Seg_out
		);

	SevSeg1:	entity work.OutLatch
	port map (	
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_LEDCS1 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_displayed_number(31 downto 24)
	);

	SevSeg2:	entity work.OutLatch
	port map (	
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_LEDCS2 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_displayed_number(23 downto 16)
	);

	SevSeg3:	entity work.OutLatch
	port map (	
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_LEDCS3 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_displayed_number(15 downto 8)
	);

	SevSeg4:	entity work.OutLatch
	port map (	
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_LEDCS4 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_displayed_number(7 downto 0)
	);

	RingLeds1	:	entity work.OutLatch
	port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_rLEDCS1 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_ringLEDs(7 downto 0)
	);

	RingLeds2	:	entity work.OutLatch
	port map (
		dataIn	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_rLEDCS2 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_ringLEDs(15 downto 8)
	);

	-- ____________________________________________________________________________________
	-- SYSTEM CLOCKS GO HERE
	-- SUB-CIRCUIT CLOCK SIGNALS
process (i_clk_50)
	begin
		if rising_edge(i_clk_50) then
			if w_cpuClkCount < 4 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
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
	-- 1200 25
	-- 600 13
	-- 300 6

	baud_div: process (w_serialClkCount_d, w_serialClkCount)
		begin
			w_serialClkCount_d <= w_serialClkCount + 2416;		-- 115,200 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(i_clk_50)
		begin
			if rising_edge(i_clk_50) then
					w_serialClkCount <= w_serialClkCount_d;
				if w_serialClkCount(15) = '0' and w_serialClkCount_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
        end if;
    end process;

end;

