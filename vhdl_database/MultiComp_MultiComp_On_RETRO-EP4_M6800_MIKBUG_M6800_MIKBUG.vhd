-- Original file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- MC6800 CPU running MIKBUG from back in the day
-- Changes to this code by Doug Gilliland 2020
-- Hardware is RETRO-EP4 Card
--		http://land-boards.com/blwiki/index.php?title=RETRO-EP4
--	16KB (internal) RAM version
-- 1KB (Internal) scratchpad RAM (512B used by MIKBUG)
-- MIKBUG ROM
--		http://www.retrotechnology.com/restore/smithbug.html
-- Select Jumper (FPGA Pin 111 on P4) switches between
--		VDU (Video Display Unit) VGA + PS/2 keyboard
--		External Serial Port
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

		o_videoR0			: out std_logic := '1';
		o_videoR1			: out std_logic := '1';
		o_videoG0			: out std_logic := '1';
		o_videoG1			: out std_logic := '1';
		o_videoB0			: out std_logic := '1';
		o_videoB1			: out std_logic := '1';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';

		io_ps2Clk			: inout std_logic := '1';
		io_ps2Data			: inout std_logic := '1';
		
		rxd1			: in std_logic := '1';
		txd1			: out std_logic;
		cts1			: in std_logic := '1';
		rts1			: out std_logic;
		serSelect	: in std_logic := '1';
		
		-- SRAM not used but making sure that it's not active
		io_extSRamData		: inout std_logic_vector(7 downto 0) := "ZZZZZZZZ";
		io_extSRamAddress	: out std_logic_vector(18 downto 0) := "000"&x"0000";
		io_n_extSRamWE		: out std_logic := '1';
		io_n_extSRamCS		: out std_logic := '1';
		io_n_extSRamOE		: out std_logic := '1'
	);
end M6800_MIKBUG;

architecture struct of M6800_MIKBUG is

	signal w_resetLow		: std_logic := '1';

	-- CPU Signals
	signal w_cpuAddress	: std_logic_vector(15 downto 0);
	signal w_cpuDataOut	: std_logic_vector(7 downto 0);
	signal w_cpuDataIn	: std_logic_vector(7 downto 0);
	signal w_R1W0			: std_logic;
	signal w_vma			: std_logic;

	-- Memory and Peripheral Data
	signal w_romData		: std_logic_vector(7 downto 0);
	signal w_ramDataLo	: std_logic_vector(7 downto 0);
	signal w_ramDataHi	: std_logic_vector(7 downto 0);
	signal w_if1DataOut	: std_logic_vector(7 downto 0);
	signal w_if2DataOut	: std_logic_vector(7 downto 0);

	-- Interface control lines
	signal n_int1			: std_logic :='1';	
	signal n_if1CS			: std_logic :='1';
	signal n_int2			: std_logic :='1';	
	signal n_if2CS			: std_logic :='1';

	-- Memory Chip Selects
	signal ramCSLo			: std_logic :='0';
	signal ramCSHi			: std_logic :='0';

	-- CPU Clock
	signal q_cpuClkCount	: std_logic_vector(5 downto 0); 
	signal w_cpuClock		: std_logic;

   -- External Serial Port Cloc
	signal serialCount         	: std_logic_vector(15 downto 0) := x"0000";
   signal serialCount_d       	: std_logic_vector(15 downto 0);
   signal serialEn            	: std_logic;
	
begin
	
	-- Debounce the reset line
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_clk		=> w_cpuClock,
		i_PinIn	=> i_n_reset,
		o_PinOut	=> w_resetLow
	);
		
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
		port map(
			address	=> w_cpuAddress(11 downto 0),
			clock 	=> i_CLOCK_50,
			q			=> w_romData
		);
		
	-- ____________________________________________________________________________________
	-- 16KB RAM	Located at the bottom 16KB of the memory space
	sramLo : entity work.InternalRam16K
	PORT map  (
		address	=> w_cpuAddress(13 downto 0),
		clock 	=> i_CLOCK_50,
		data 		=> w_cpuDataOut,
		wren		=> (not w_R1W0) and ramCSLo and w_vma and (not w_cpuClock),
		q			=> w_ramDataLo
	);
	
	-- ____________________________________________________________________________________
	-- 1KB RAM Located at the top of the bottom 32KB of memory space
	sramHi : entity work.InternalRam1K
	PORT map  (
		address	=> w_cpuAddress(9 downto 0),
		clock 	=> i_CLOCK_50,
		data 		=> w_cpuDataOut,
		wren		=> (not w_R1W0) and ramCSHi and w_vma and (not w_cpuClock),
		q			=> w_ramDataHi
	);
	
	-- ____________________________________________________________________________________
	-- I/O CHIP SELECTS
	n_if1CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else	-- VDU $8018-$8019
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else
					'1';
	n_if2CS	<= '0' 	when (serSelect = '1' and (w_cpuAddress(15 downto 1) = x"802"&"100")) else	-- ACIA $8028-$8029
					'0'	when (serSelect = '0' and (w_cpuAddress(15 downto 1) = x"801"&"100")) else
					'1';
	ramCSLo	<= '1'   when w_cpuAddress(15 downto 14) = "00" else					-- 16KB SRAM $0000-$3FFF
					'0';
	ramCSHi	<= '1'   when w_cpuAddress(15 downto 10) = "011111" else			-- 1KB SRAM $7E00-$7FFF (Only 512B are used by MIKBUG)
					'0';
	
	-- ____________________________________________________________________________________
	-- INPUT/OUTPUT DEVICES
	-- Grant's VGA driver
	vdu : entity work.SBCTextDisplayRGB
	generic map ( 
		EXTENDED_CHARSET		=> 1,
		COLOUR_ATTS_ENABLED	=>	1
	)
		port map (
			n_reset	=> w_resetLow,
			clk		=> i_CLOCK_50,
			
			-- RGB Compo_video signals
			hSync		=> o_hSync,
			vSync		=> o_vSync,
			videoR0	=> o_videoR0,
			videoR1	=> o_videoR1,
			videoG0	=> o_videoG0,
			videoG1	=> o_videoG1,
			videoB0	=> o_videoB0,
			videoB1	=> o_videoB1,
			n_WR		=> n_if1CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> n_if1CS or (not w_R1W0) or (not w_vma),
			n_int		=> n_int1,
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if1DataOut,
			ps2Clk	=> io_ps2Clk,
			ps2Data	=> io_ps2Data
		);
	
	acia: entity work.bufferedUART
		port map (
			clk		=> i_CLOCK_50,     
			n_WR		=> n_if2CS or      w_R1W0  or (not w_vma) or (not w_cpuClock),
			n_rd		=> n_if2CS or (not w_R1W0) or (not w_vma),
			regSel	=> w_cpuAddress(0),
			dataIn	=> w_cpuDataOut,
			dataOut	=> w_if2DataOut,
			n_int		=> n_int2,
						 -- these clock enables are asserted for one period of input clk,
						 -- at 16x the baud rate.
			rxClkEn	=> serialEn,
			txClkEn	=> serialEn,
			rxd		=> rxd1,
			txd		=> txd1
		);
	
	-- ____________________________________________________________________________________
	-- CPU Read Data multiplexer
	w_cpuDataIn <=
		w_ramDataLo		when (ramCSLo = '1')	else
		w_ramDataHi		when (ramCSHi = '1')	else
		w_if1DataOut	when (n_if1CS = '0')	else
		w_if2DataOut	when (n_if2CS = '0')	else
		w_romData		when w_cpuAddress(15 downto 14) = "11"				else
		x"FF";
	
	-- ____________________________________________________________________________________
	-- CPU Clock
process (i_CLOCK_50)
	begin
		if rising_edge(i_CLOCK_50) then
			if q_cpuClkCount < 4 then
				q_cpuClkCount <= q_cpuClkCount + 1;
			else
				q_cpuClkCount <= (others=>'0');
			end if;
			if q_cpuClkCount < 2 then
				w_cpuClock <= '0';
			else
				w_cpuClock <= '1';
			end if;
		end if;
	end process;
	
	-- Baud Rate CLOCK SIGNALS
	
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
