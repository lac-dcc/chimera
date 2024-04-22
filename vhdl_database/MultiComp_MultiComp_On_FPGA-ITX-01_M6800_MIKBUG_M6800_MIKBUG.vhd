-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2020
--
-- MC6800 CPU
--	16.7 MHz CPU cloxk
-- MIKBUG ROM from back in the day
--	16K (internal) RAM version
-- MC6850 ACIA UART
--		Rework to remove two LEDs and use the FPGA pins as RTS/CTS
-- VDU
--		XGA 80x25 character display
--		2/2/2 RGB for 64 colors
--		PS/2 keyboard
--	Default port selection via DIP Switch 1
--		On = USB-Serial port
--		Off = VDU screen
--	Memory Map
--		0x0000-0x3FFF - 16KB SRAM
--		0xfc18 - uart
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

		o_Vid_RedHi			: out std_logic := '1';
		o_Vid_RedMid		: out std_logic := '1';
		o_Vid_RedLo			: out std_logic := '1';
		o_Vid_GrnHi			: out std_logic := '1';
		o_Vid_GrnMid		: out std_logic := '1';
		o_Vid_GrnLo			: out std_logic := '1';
		o_Vid_BluHi			: out std_logic := '1';
		o_Vid_BluLo			: out std_logic := '1';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';

		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		o_txd					: out	std_logic;
		i_rxd					: in std_logic := '1';
		o_rts					: out	std_logic;
		i_cts					: in std_logic := '0';
		serSelect			: in	std_logic := '1'
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';

	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;

	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_ramData		: std_logic_vector(7 downto 0);
	signal w_if1DataOut	: std_logic_vector(7 downto 0);
	signal w_if2DataOut	: std_logic_vector(7 downto 0);

	signal n_int1			: std_logic :='1';	
	signal n_if1CS			: std_logic :='1';
	signal n_int2			: std_logic :='1';	
	signal n_if2CS			: std_logic :='1';
	
	signal w_videoR0		: std_logic :='0';
	signal w_videoR1		: std_logic :='0';
	signal w_videoG0		: std_logic :='0';
	signal w_videoG1		: std_logic :='0';
	signal w_videoB0		: std_logic :='0';
	signal w_videoB1		: std_logic :='0';

	signal q_cpuClkCount	: std_logic_vector(5 downto 0); 
	signal w_cpuClock		: std_logic;

   signal serialCount   : std_logic_vector(15 downto 0) := x"0000";
   signal serialCount_d	: std_logic_vector(15 downto 0);
   signal serialEn      : std_logic;
	
begin
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk			=> w_cpuClock,
		i_PinIn		=> i_n_reset,
		o_PinOut		=> w_resetLow
	);
	
	o_Vid_RedHi 	<= w_videoR1;
	o_Vid_RedMid	<= w_videoR0;
	o_Vid_RedLo		<= w_videoR0;
	o_Vid_GrnHi		<= w_videoG1;
	o_Vid_GrnMid	<= w_videoG0;
	o_Vid_GrnLo		<= w_videoG0;
	o_Vid_BluHi		<= w_videoB1;
	o_Vid_BluLo	 	<= w_videoB0;
		
	-- ____________________________________________________________________________________
	-- I/O CHIP SELECTS
	n_if1CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  $FC18-$FC19
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA $FC28-$FC29
							'1';
	n_if2CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"FC2"&"100")) else	-- ACIA $FC28-$FC29
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"FC1"&"100")) else	-- VDU  $FC18-$FC19
							'1';
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		w_ramData		when w_cpuAddress(15 downto 14) = "00"	else
		w_if1DataOut	when (n_if1CS = '0')							else
		w_if2DataOut	when (n_if2CS = '0')							else
		w_romData		when w_cpuAddress(15 downto 14) = "11"	else
		x"FF";
	
	-- ____________________________________________________________________________________
	-- 6800 CPU
	cpu1 : entity work.cpu68
		port map(
			clk		=> w_cpuClock,
			rst		=> not w_resetLow,
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
	rom1 : entity work.MIKBUG 		
		port map (
			address	=> w_cpuAddress(11 downto 0),
			clock 	=> i_CLOCK_50,
			q			=> w_romData
		);
		
	-- ____________________________________________________________________________________
	-- 16KB RAM	
	sram : entity work.InternalRam16K
		PORT map  (
			address	=> w_cpuAddress(13 downto 0),
			clock 	=> i_CLOCK_50,
			data 		=> w_cpuDataOut,
			wren		=> (not w_R1W0) and (not w_cpuAddress(15)) and (not w_cpuAddress(14)) and w_vma and (not w_cpuClock),
			q			=> w_ramData
		);
	
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	vdu : entity work.SBCTextDisplayRGB
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			-- RGB Compo_video signals
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			videoR0	=> w_videoR0,
			videoR1	=> w_videoR1,
			videoG0	=> w_videoG0,
			videoG1	=> w_videoG1,
			videoB0	=> w_videoB0,
			videoB1	=> w_videoB1,
			n_WR		=> n_if1CS or      w_R1W0  or (not w_vma) or ((not w_cpuClock)),
			n_rd		=> n_if1CS or (not w_R1W0) or (not w_vma),
			n_int		=> n_int1,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	-- ACIA UART serial interface
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_WR		=> n_if2CS or      w_R1W0  or (not w_vma) or ((not w_cpuClock)),
			n_rd		=> n_if2CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			n_int		=> n_int2,
						 -- these clock enables are asserted for one period of input clk,
						 -- at 16x the baud rate.
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> i_rxd,
			txd		=> o_txd,
			n_cts		=> i_cts,
			n_rts		=> o_rts
		);
	
	-- ____________________________________________________________________________________
	-- CPU Clock
process (i_CLOCK_50)
	begin
		if rising_edge(i_CLOCK_50) then
			if q_cpuClkCount < 2 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				q_cpuClkCount <= q_cpuClkCount + 1;
			else
				q_cpuClkCount <= (others=>'0');
			end if;
			if q_cpuClkCount < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				w_cpuClock <= '0';
			else
				w_cpuClock <= '1';
			end if;
		end if;
	end process;
	
	-- ____________________________________________________________________________________
	-- Baud Rate CLOCK SIGNALS
    -- Serial clock DDS. With 50MHz master input clock:
    -- Baud   Increment
    -- 115200 2416
    -- 38400  805
    -- 19200  403
    -- 9600   201
    -- 4800   101
    -- 2400   50
baud_div: process (serialCount_d, serialCount)
    begin
        serialCount_d <= serialCount + 2416;
    end process;

process (i_CLOCK_50)
	begin
		if rising_edge(i_CLOCK_50) then
        -- Enable for baud rate generator
        serialCount <= serialCount_d;
        if serialCount(15) = '0' and serialCount_d(15) = '1' then
            serialEn <= '1';
        else
            serialEn <= '0';
        end if;
		end if;
	end process;

end;
