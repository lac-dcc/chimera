---------------------------------------------------------------------------
-- 6502 CPU
-- At 12.5 or 1 MHz (has an adjustment to keyboard scanner
-- 41K External SRAM
-- PS/2 Keyboard
--		F1 key selects fast/slow CPU (default = fast)
--			Used for slower games
--		UK101 layout
--			http://land-boards.com/blwiki/images/5/5c/Opkbd.jpg
-- CEGMON Monitor Patched for 64x32 display (2KB)
-- BASIC in ROM (8K)
-- SVGA Video
-- BufferedUART
--		115,200 baud
--		Hardware Handshake
--		Neal Crook's improved clock enable
--	Output latches for LED, J6/J8 I/O header pins 
---------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY UK101 IS
	port(
		clk				: in std_logic;	-- 50 MHz clock on FPGA card
		i_n_reset		: in std_logic;	-- Switch to the left of the JTAG connector
		o_reset_LED		: out std_logic;	-- LED near the reset switch
		
		io_sramData 	: inout std_logic_vector(7 downto 0);
		o_sramAddress	: out std_logic_vector(16 downto 0);
		o_n_sRamWE 		: out std_logic := '1';
		o_n_sRamCS		: out std_logic := '1';
		o_n_sRamOE		: out std_logic := '1';
		
		i_rxd				: in std_logic := '1';
		o_txd				: out std_logic;
		o_rts				: out std_logic;
		
		o_Vid_Red		: out	std_logic_vector(1 downto 0) := "00";
		o_Vid_Grn		: out	std_logic_vector(1 downto 0) := "00";
		o_Vid_Blu		: out	std_logic_vector(1 downto 0) := "00";
		o_Vid_hSync		: out	std_logic := '1';
		o_Vid_vSync		: out	std_logic := '1';
		
		i_ps2Clk			: in std_logic := '1';
		i_ps2Data		: in std_logic := '1';
		
		o_ledOut			: out std_logic;
		o_J6IO8			: out std_logic_vector(7 downto 0);
		o_J8IO8			: out std_logic_vector(7 downto 0)
	);
end uk101;

architecture struct of uk101 is

	signal w_n_WR				: std_logic;
	signal w_cpuAddress		: std_logic_vector(15 downto 0);
	signal w_cpuDataOut		: std_logic_vector(7 downto 0);
	signal w_cpuDataIn		: std_logic_vector(7 downto 0);

	signal w_basRomData		: std_logic_vector(7 downto 0);
	signal w_ramDataOut		: std_logic_vector(7 downto 0);
	signal w_monitorRomData : std_logic_vector(7 downto 0);
	signal w_aciaData			: std_logic_vector(7 downto 0);

	signal n_memWR				: std_logic;
	signal n_memRD 			: std_logic;

	signal n_dispRamCS		: std_logic :='1';
	signal n_ramCS				: std_logic :='1';
	signal n_basRomCS			: std_logic :='1';
	signal n_monitorRomCS 	: std_logic :='1';
	signal n_aciaCS			: std_logic :='1';
	signal n_kbCS				: std_logic :='1';
	signal n_J6IOCS			: std_logic :='1';
	signal n_J8IOCS			: std_logic :='1';
	signal n_LEDCS				: std_logic :='1';
		
	signal w_charAddr 			: std_logic_vector(10 downto 0);
	signal w_charData 			: std_logic_vector(7 downto 0);
	signal w_displayRamData		: std_logic_vector(7 downto 0);

	signal w_serialClkCount		: std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d  : std_logic_vector(15 downto 0);
	signal w_serialClkEn       : std_logic;
	signal w_serialClock			: std_logic;
	
	signal w_CLOCK_50				: std_ulogic;
	signal w_Video_Clk			: std_ulogic;
	signal w_VoutVect				: std_logic_vector(17 downto 0);

	signal w_cpuClock				: std_logic;
	signal w_cpuClkCount		: std_logic_vector(5 downto 0);

	signal w_kbReadData 		: std_logic_vector(7 downto 0);
	signal w_kbRowSel 			: std_logic_vector(7 downto 0);
	signal w_slowMode			: std_logic;
	signal w_ledOut8 			: std_logic_vector(7 downto 0);

begin

	-- rrrrr,gggggg,bbbbb,hsync,vsync
	o_Vid_hSync <= w_VoutVect(1);
	o_Vid_vSync <= w_VoutVect(0);
	o_Vid_Red <= w_VoutVect(17 downto 16);
	o_Vid_Grn <= w_VoutVect(12 downto 11);
	o_Vid_Blu <= w_VoutVect(6 downto 5);
	
	o_sramAddress <= '0' & w_cpuAddress(15 downto 0);
	io_sramData <= w_cpuDataOut when w_n_WR='0' else (others => 'Z');
	o_n_sRamWE <= n_memWR;
	o_n_sRamOE <= n_memRD;
	o_n_sRamCS <= n_ramCS;
	n_memRD <= not(w_cpuClock) nand w_n_WR;
	n_memWR <= not(w_cpuClock) nand (not w_n_WR);
	
	o_reset_LED <= i_n_reset;

	n_basRomCS 		<= '0' when w_cpuAddress(15 downto 13) = "101" 				else '1';	-- 8k
	n_dispRamCS 	<= '0' when w_cpuAddress(15 downto 11) = x"d"&"0" 			else '1';
	n_kbCS 			<= '0' when w_cpuAddress(15 downto 10) = x"d"&"11" 			else '1';
	n_monitorRomCS <= '0' when w_cpuAddress(15 downto 11) = x"f"&'1' 			else '1';	-- 2K
	n_aciaCS 		<= '0' when w_cpuAddress(15 downto 1)  = x"f00"&"000" 		else '1';	-- 61440-61441
	n_J6IOCS			<= '0' when w_cpuAddress(15 downto 0)  = x"f002"				else '1';	-- 61442
	n_J8IOCS			<= '0' when w_cpuAddress(15 downto 0)  = x"f003"				else '1';	-- 61443
	n_LEDCS			<= '0' when w_cpuAddress(15 downto 0)  = x"f004"				else '1';	-- 61444
	n_ramCS 			<= not(n_dispRamCS and n_basRomCS and n_monitorRomCS and n_aciaCS and n_kbCS and n_J6IOCS and n_J8IOCS and n_LEDCS);
	
	-- Multiplexer for data into the CPU
	w_cpuDataIn <=
		w_basRomData 			when n_basRomCS = '0' 										else
		x"F0" 				when (w_cpuAddress = x"FCE0" and (w_slowMode = '0'))	else -- Address = FCE0 key repeat speed
		w_monitorRomData 	when n_monitorRomCS = '0'									else
		w_aciaData 			when n_aciaCS = '0' 											else
		io_sramData 			when n_ramCS = '0' 											else
		w_displayRamData 	when n_dispRamCS = '0' 										else
		w_kbReadData 			when n_kbCS='0'												else 
		x"FF";
		
	-- Daniel Wallner's 6502 CPU core
	u1 : entity work.T65
	port map(
		Enable => '1',
		Mode => "00",	-- 6502 mode
		Res_n => i_n_reset,
		Clk => w_cpuClock,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => '1',
		SO_n => '1',
		R_W_n => w_n_WR,
		A(15 downto 0) => w_cpuAddress,
		DI => w_cpuDataIn,
		DO => w_cpuDataOut);

	-- Microsoft BASIC in ROM (8KB)
	u2 : entity work.BasicRom -- 8KB
	port map(
		address => w_cpuAddress(12 downto 0),
		clock => clk,
		q => w_basRomData
	);

	-- CEGMON modified for 64 column 32 row video
	u4: entity work.CegmonRom_Patched_64x32
	port map
	(
		address => w_cpuAddress(10 downto 0),
		q => w_monitorRomData
	);

	-- Neil Crook's version of the UART which improves the clock enables
	UART : entity work.bufferedUART
		port map(
			clk => clk,
			n_WR => n_aciaCS or w_cpuClock or w_n_WR,
			n_rd => n_aciaCS or w_cpuClock or (not w_n_WR),
			regSel => w_cpuAddress(0),
			dataIn => w_cpuDataOut,
			dataOut => w_aciaData,
			rxClkEn => w_serialClkEn,
			txClkEn => w_serialClkEn,
			rxd => i_rxd,
			txd => o_txd,
--			n_cts => i_cts,
			n_dcd => '0',
			n_rts => o_rts
		);

	-- Encapsulated SVGA output
	MemMappedSVGA : entity work.Mem_Mapped_SVGA
		port map (
			n_reset 			=> i_n_reset,
			Video_Clk 		=> w_Video_Clk,
			CLK_50			=> w_CLOCK_50,
			n_dispRamCS		=> n_dispRamCS,
			n_memWR			=> n_memWR,
			cpuAddress 		=> w_cpuAddress(10 downto 0),
			cpuDataOut		=> w_cpuDataOut,
			dataOut			=> w_displayRamData,
			VoutVect			=> w_VoutVect -- rrrrr,gggggg,bbbbb,hsync,vsync
			);

	-- This version of the UK101 keyboard latches the function keys
	-- F1 = fast / slow CPU
	KBD : entity work.UK101keyboard
	port map(
		CLK => clk,
		nRESET => i_n_reset,
		PS2_CLK	=> i_ps2Clk,
		PS2_DATA	=> i_ps2Data,
		A	=> w_kbRowSel,
		KEYB	=> w_kbReadData,
		FNtoggledKeys(1) => w_slowMode		-- F1 is slow/fast select (default fast)
	);
	
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			w_kbRowSel <= w_cpuDataOut;
		end if;
	end process;

	-- ____________________________________________________________________________________
	-- Clocks
	PLL : work.VideoClk_SVGA_800x600 PORT MAP (
		inclk0	 => clk,
		c0	 => w_Video_Clk,	-- 65 MHz Video Clock
--		c1	 => w_cpuClock,	-- 1 MHz CPU clock
		c2	 => w_CLOCK_50		-- 50 Mhz Logic Clock
	);

	-- CPU clock has speed selected by the F1 key - default = fast
	process (clk)
	begin
		 if rising_edge(clk) then
			  if w_slowMode = '1' then -- 1MHz CPU clock
					if w_cpuClkCount < 49 then
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

	latchIO0 : entity work.OutLatch	--Output LatchIO
	port map(
		clear => i_n_reset,
		clock => clk,
		load => n_J6IOCS or w_n_WR,
		dataIn => w_cpuDataOut,
		latchOut => o_J6IO8
	);

	latchIO1 : entity work.OutLatch	--Output LatchIO
	port map(
		clear => i_n_reset,
		clock => clk,
		load => n_J8IOCS or w_n_WR,
		dataIn => w_cpuDataOut,
		latchOut => o_J8IO8
	);

	o_ledOut <= w_ledOut8(0);

	latchLED : entity work.OutLatch	--Output LatchIO
	port map(
		clear => i_n_reset,
		clock => clk,
		load => n_LEDCS or w_n_WR,
		dataIn => w_cpuDataOut,
		latchOut => w_ledOut8
	);

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
	baud_clk: process(clk)
		begin
			if rising_edge(clk) then
					w_serialClkCount <= w_serialClkCount_d;
				if w_serialClkCount(15) = '0' and w_serialClkCount_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
        end if;
    end process;

end;
