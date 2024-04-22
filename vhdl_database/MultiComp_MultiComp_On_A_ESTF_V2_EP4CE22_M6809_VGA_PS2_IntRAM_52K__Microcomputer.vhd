-- Original file is copyright by Grant Searle 2014
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2019
--	32K (internal) RAM version
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		i_n_reset			: in std_logic;
		i_clk_50				: in std_logic;

		o_vid_red			: out std_logic_vector(4 downto 0);
		o_vid_grn			: out std_logic_vector(5 downto 0);
		o_vid_blu			: out std_logic_vector(4 downto 0);
		o_vid_hSync			: out std_logic;
		o_vid_vSync			: out std_logic;
		
--		i_pbutton			: in std_logic_vector(2 downto 0) := "111";
		i_DipSw				: in std_logic_vector(7 downto 0) := x"FF";

		o_LED					: out std_logic_vector(7 downto 0) := x"00";

		o_BUZZER				: out std_logic := '1';

		i_ps2Clk				: inout std_logic;
		i_ps2Data			: inout std_logic;
		
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '1';
		i_sdMISO				: in 	std_logic := '1';
		o_sdSCLK				: out std_logic := '1';
		o_driveLED			: out std_logic := '1'
	);
end Microcomputer;

architecture struct of Microcomputer is

	signal w_n_WR							: std_logic;
	signal w_cpuAddress					: std_logic_vector(15 downto 0);
	signal w_cpuDataOut					: std_logic_vector(7 downto 0);
	signal w_cpuDataIn					: std_logic_vector(7 downto 0);

	signal w_basRomData					: std_logic_vector(7 downto 0);
	signal w_interface1DataOut			: std_logic_vector(7 downto 0);
	signal w_internalRam1DataOut		: std_logic_vector(7 downto 0);
	signal w_internalRam2DataOut		: std_logic_vector(7 downto 0);
	signal w_internalRam3DataOut		: std_logic_vector(7 downto 0);
	signal w_sdCardData					: std_logic_vector(7 downto 0);
	
	signal w_n_memWR						: std_logic :='1';
	signal w_n_basRomCS					: std_logic :='1';
	signal w_n_videoInterfaceCS		: std_logic :='1';
	signal w_n_internalRam1CS			: std_logic :='1';
	signal w_n_internalRam2CS			: std_logic :='1';
	signal w_n_internalRam3CS			: std_logic :='1';
	signal w_n_SDCardCS					: std_logic :='1';
	signal w_rLEDCS1						: std_logic;
	signal w_DIPSwCS						: std_logic;

	signal w_cpuClkCount				: std_logic_vector(5 downto 0); 
	signal w_cpuClock					: std_logic;
	
	signal w_videoR0					: std_logic := '0';
	signal w_videoR1					: std_logic := '0';
	signal w_videoG0					: std_logic := '0';
	signal w_videoG1					: std_logic := '0';
	signal w_videoB0					: std_logic := '0';
	signal w_videoB1					: std_logic := '0';

	signal w_ringLEDs					: std_logic_vector(15 downto 0);
	
	--
	
begin

	o_vid_red <= w_videoR1 & w_videoR1 & w_videoR0 & w_videoR0 & w_videoR0;
	o_vid_grn <= w_videoG1 & w_videoG1 & w_videoG0 & w_videoG0 & w_videoG0 & w_videoG0;
	o_vid_blu <= w_videoB1 & w_videoB1 & w_videoB0 & w_videoB0 & w_videoB0;
	
	-- ____________________________________________________________________________________
	-- CHIP SELECTS - Mapped to match Grant's software mapping
	w_n_basRomCS <= '0' when w_cpuAddress(15 downto 13) = "111" else '1'; 					-- 8K at top of memory
	w_n_videoInterfaceCS <= '0' when w_cpuAddress(15 downto 1) = x"FFD"&"000" else '1'; -- 2 bytes FFD0-FFD1
	w_n_internalRam1CS <= '0' when w_cpuAddress(15) = '0' else '1';								-- 32K at bottom of memory
	w_n_internalRam2CS <= '0' when w_cpuAddress(15 downto 14) = "10" else '1';				-- 16K SRAM
	w_n_internalRam3CS <= '0' when w_cpuAddress(15 downto 12) = "1100" else '1';			-- 4K SRAM
	w_n_SDCardCS	<= '1' when w_cpuAddress(15 downto 3)		= x"D00"&'1' else '0';		-- xF008 (8B) = 61448 dec

	w_rLEDCS1 		<= '1' when w_cpuAddress  						= x"D000"  	else '0';		-- xF000 (1B) = 53248 dec
	w_DIPSwCS		<= '1' when w_cpuAddress  						= x"D001"  	else '0';		-- xF001 (1B) = 53249 dec
	
	-- ____________________________________________________________________________________
	-- BUS ISOLATION
	-- Order matters since BASIC ROM overlaps I/O chip selects
	w_cpuDataIn <=
		w_interface1DataOut 						when w_n_videoInterfaceCS 	= '0' else
		w_basRomData 								when w_n_basRomCS				= '0' else
		w_internalRam1DataOut 					when w_n_internalRam1CS		= '0' else
		w_internalRam2DataOut 					when w_n_internalRam2CS		= '0' else
		w_internalRam3DataOut 					when w_n_internalRam3CS		= '0' else
		w_sdCardData								when w_n_SDCardCS 			= '0' else
		w_ringLEDs(7 downto 0)					when w_rLEDCS1 				= '1' else	-- read-back
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
			wren 		=> not(w_n_memWR or w_n_internalRam1CS),
			q 			=> w_internalRam1DataOut
		);
			
 	ram2: entity work.InternalRam16K
		port map
		(
			address 	=> w_cpuAddress(13 downto 0),
			clock 	=> i_clk_50,
			data 		=> w_cpuDataOut,
			wren 		=> not(w_n_memWR or w_n_internalRam2CS),
			q 			=> w_internalRam2DataOut
		);

 	ram3: entity work.InternalRam4K
		port map
		(
			address 	=> w_cpuAddress(11 downto 0),
			clock 	=> i_clk_50,
			data 		=> w_cpuDataOut,
			wren 		=> not(w_n_memWR or w_n_internalRam3CS),
			q 			=> w_internalRam3DataOut
		);

	-- ____________________________________________________________________________________
	-- Display GOES HERE

	io1 : entity work.SBCTextDisplayRGB
		port map (
			n_reset 	=> i_n_reset,
			clk 		=> i_clk_50,
			n_wr 		=> w_n_videoInterfaceCS or w_cpuClock or w_n_WR,
			n_rd 		=> w_n_videoInterfaceCS or w_cpuClock or (not w_n_WR),
			regSel 	=> w_cpuAddress(0),
			dataIn 	=> w_cpuDataOut,
			dataOut 	=> w_interface1DataOut,
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
	
	-- ____________________________________________________________________________________
	-- MEMORY READ/WRITE LOGIC GOES HERE
	w_n_memWR <= not(w_cpuClock) nand (not w_n_WR);
	
	RingLeds1	:	entity work.OutLatch
	port map (
		dataIn8	=> w_cpuDataOut,
		clock		=> i_clk_50,
		load		=> not (w_rLEDCS1 and (not w_n_WR)),
		clear		=> i_n_reset,
		latchOut	=> o_LED
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
end;
