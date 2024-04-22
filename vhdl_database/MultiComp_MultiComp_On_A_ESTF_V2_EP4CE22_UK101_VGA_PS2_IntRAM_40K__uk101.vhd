-- UK101 or Superboard II Implementation
--		6502 CPU
--		40KB internal SRAM
--		XVGA output - 64 chars/row, 32 rows
--		PS/2 keyboard
--		Serial port (USB-Serial)
--		Off-the-shelf FPGA card (Cyclone IV EP4CE10)
-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101 is
	port(
		i_n_reset	: in std_logic;
		i_clk			: in std_logic;
		
		i_rxd			: in std_logic;
		o_txd			: out std_logic;
		rts			: out std_logic;

		o_Vid_Red	: out	std_logic_vector(4 downto 0) := "00000";
		o_Vid_Grn	: out	std_logic_vector(5 downto 0) := "000000";
		o_Vid_Blu	: out	std_logic_vector(4 downto 0) := "00000";
		o_Vid_hSync	: out	std_logic := '1';
		o_Vid_vSync	: out	std_logic := '1';
		
		i_DipSw		: in std_logic_vector(7 downto 0) := x"FF";

		o_LED					: out std_logic_vector(7 downto 0) := x"00";

		o_BUZZER				: out std_logic := '1';

		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'
		);
end uk101;


architecture struct of uk101 is

	signal n_WR						: std_logic;
	signal n_RD						: std_logic;
	signal w_cpuAddress				: std_logic_vector(15 downto 0);
	signal w_cpuDataOut				: std_logic_vector(7 downto 0);
	signal w_cpuDataIn				: std_logic_vector(7 downto 0);

	signal w_basRomData				: std_logic_vector(7 downto 0);
	signal w_monitorRomData		: std_logic_vector(7 downto 0);
	signal w_aciaData				: std_logic_vector(7 downto 0);
	signal w_ramDataOut				: std_logic_vector(7 downto 0);
	signal w_ramDataOut2			: std_logic_vector(7 downto 0);
	signal w_displayRamData		: std_logic_vector(7 downto 0);

	signal n_memWR					: std_logic;
	signal w_n_memRD 				: std_logic :='1';
	
	signal n_basRomCS				: std_logic;
	signal n_dispRamCS			: std_logic;
	signal n_aciaCS				: std_logic;
	signal w_n_ramCS					: std_logic;
	signal w_n_ramCS2				: std_logic;
	signal n_monRomCS 		: std_logic;
	signal n_kbCS					: std_logic;
	signal w_rLEDCS1				: std_logic;
	signal w_pbuttonCS			: std_logic;
	signal w_DIPSwCS				: std_logic;
	
	signal w_serialClkCount		: std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d    : std_logic_vector(15 downto 0);
	signal w_serialClkEn         : std_logic;
	signal w_serialClock			: std_logic;
	
	signal CLOCK_100				: std_ulogic;
	signal w_CLOCK_50				: std_ulogic;
	signal w_Video_Clk			: std_ulogic;
	signal w_VoutVect				: std_logic_vector(2 downto 0);

	signal w_cpuClkCount			: std_logic_vector(5 downto 0); 
	signal w_cpuClock				: std_logic;

	signal w_kbReadData 			: std_logic_vector(7 downto 0);
	signal w_kbRowSel 			: std_logic_vector(7 downto 0);

	signal w_txdBuff				: std_logic;
	
	signal w_ringLEDs				: std_logic_vector(15 downto 0);
	
begin

	o_LED <= w_ringLEDs(7 downto 0);

	n_memWR <= not(w_cpuClock) nand (not n_WR);

	o_Vid_Red <= w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2) & w_VoutVect(2);
	o_Vid_Grn <= w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1) & w_VoutVect(1);
	o_Vid_Blu <= w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0) & w_VoutVect(0);

	-- Chip Selects
	w_n_ramCS 			<= '0' when w_cpuAddress(15) 					= '0'		else '1';  				-- x0000-x7fff (32KB)
	w_n_ramCS2			<= '0' when w_cpuAddress(15 downto 13) 	= "100" 	else '1';  				-- x8000-x90ff (8KB)
	n_basRomCS 		<= '0' when w_cpuAddress(15 downto 13) 	= "101" 		else '1'; 				-- xA000-xBFFF (8KB)
	n_kbCS 			<= '0' when w_cpuAddress(15 downto 10) 	= "110111" 	else '1';				-- xDC00-xDFFF (1KB)
	n_dispRamCS 	<= '0' when w_cpuAddress(15 downto 11) 	= "11010" 	else '1';				-- xD000-xD7FF (2KB)
	n_aciaCS 		<= '0' when w_cpuAddress(15 downto 1)  	= "111100000000000"  else '1';	-- xF000-xF001 (2B) = 61440 dec
	w_rLEDCS1 		<= '1' when w_cpuAddress  						= x"F002"  	else '0';				-- xF002 (1B) = 61442 dec
	w_DIPSwCS		<= '1' when w_cpuAddress  						= x"F003"  	else '0';				-- xF003 (1B) = 61443 dec
	n_monRomCS 		<= '0' when w_cpuAddress(15 downto 11) 	= "11111"	else '1'; 				-- xF800-xFFFF (2KB)
 
	w_cpuDataIn <=
		w_aciaData 									when n_aciaCS 		= '0'	else
		w_ramDataOut 								when w_n_ramCS 		= '0' else
		w_ramDataOut2 								when w_n_ramCS2 		= '0' else
		w_displayRamData 							when n_dispRamCS	= '0' else
		w_basRomData 									when n_basRomCS	= '0' else
		w_kbReadData 								when n_kbCS			= '0' else
		w_ringLEDs(7 downto 0)					when w_rLEDCS1 	= '1' else
--		"00000"&i_pbutton							when w_pbuttonCS	= '1' else
		i_DipSw										when w_DIPSwCS		= '1' else
		w_monitorRomData 							when n_monRomCS 	= '0' else		-- has to be after any I/O
		x"FF";
		
	CPU : entity work.T65
	port map(
		Enable => '1',
		Mode => "00",
		Res_n => i_n_reset,
		Clk => w_cpuClock,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => '1',
		SO_n => '1',
		R_W_n => n_WR,
		A(15 downto 0) => w_cpuAddress,
		DI => w_cpuDataIn,
		DO => w_cpuDataOut);
			

	MemMappedXVGA : entity work.Mem_Mapped_XVGA
		port map (
			n_reset 			=> i_n_reset,
			Video_Clk 		=> w_Video_Clk,
			CLK_50			=> w_CLOCK_50,
			n_dispRamCS		=> n_dispRamCS,
			n_memWR			=> n_memWR,
			cpuAddress 		=> w_cpuAddress(10 downto 0),
			cpuDataOut		=> w_cpuDataOut,
			dataOut			=> w_displayRamData,
			VoutVect			=> w_VoutVect, -- rgb
			hSync				=> o_Vid_hSync,
			vSync				=> o_Vid_vSync

		);
		
	-- ____________________________________________________________________________________
	-- Clocks
pll : work.VideoClk_XVGA_1024x768 PORT MAP (
		inclk0	 => i_clk,
		c0	 => w_Video_Clk,	-- 65 MHz Video Clock
		c1	 => w_cpuClock,	-- 1 MHz CPU clock
		c2	 => w_CLOCK_50		-- 50 Mhz Logic Clock
--		c3 => baudRate_1p432		-- 1.8432 MHz baud rate i_clk
	);
	

	BASIC_IN_ROM : entity work.BasicRom -- 8KB
	port map(
		address => w_cpuAddress(12 downto 0),
		clock => w_CLOCK_50,
		q => w_basRomData
	);

	SRAM_32K : entity work.InternalRam32K
	port map
	(
		address => w_cpuAddress(14 downto 0),
		clock => w_CLOCK_50,
		data => w_cpuDataOut,
		wren => not(n_memWR or w_n_ramCS),
		q => w_ramDataOut
	);

	
	SRAM_8K : entity work.InternalRam8K
	port map
	(
		address => w_cpuAddress(12 downto 0),
		clock => w_CLOCK_50,
		data => w_cpuDataOut,
		wren => not(n_memWR or w_n_ramCS2),
		q => w_ramDataOut2
	);

	
	MONITOR : entity work.CegmonRom_Patched_64x32
	port map
	(
		address => w_cpuAddress(10 downto 0),
		q => w_monitorRomData
	);


	RingLeds1	:	entity work.OutLatch
	port map (
		dataIn8	=> w_cpuDataOut,
		clock		=> w_CLOCK_50,
		load		=> not (w_rLEDCS1 and (not n_WR)),
		clear		=> i_n_reset,
		latchOut	=> w_ringLEDs(7 downto 0)
	);

	UART : entity work.bufferedUART
		port map(
			clk => w_CLOCK_50,
			n_wr => n_aciaCS or w_cpuClock or n_WR,
			n_rd => n_aciaCS or w_cpuClock or (not n_WR),
			regSel => w_cpuAddress(0),
			dataIn => w_cpuDataOut,
			dataOut => w_aciaData,
			rxClkEn => w_serialClkEn,
			txClkEn => w_serialClkEn,
			rxd => i_rxd,
			txd => w_txdBuff,
			n_cts => '0',
			n_dcd => '0',
			n_rts => rts
		);
		
	u9 : entity work.UK101keyboard
	port map(
		clk => w_CLOCK_50,
		nRESET => i_n_reset,
		PS2_CLK	=> i_ps2Clk,
		PS2_DATA	=> i_ps2Data,
		A	=> w_kbRowSel,
		KEYB	=> w_kbReadData
	);
	
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			w_kbRowSel <= w_cpuDataOut;
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
			w_serialClkCount_d <= w_serialClkCount + 6;		-- 300 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(w_CLOCK_50)
		begin
			if rising_edge(w_CLOCK_50) then
					w_serialClkCount <= w_serialClkCount_d;
				if w_serialClkCount(15) = '0' and w_serialClkCount_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
        end if;
    end process;

end;
