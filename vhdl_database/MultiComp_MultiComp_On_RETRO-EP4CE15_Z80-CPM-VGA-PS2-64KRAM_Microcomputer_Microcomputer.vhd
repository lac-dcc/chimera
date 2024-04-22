-- Original file is copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
--
-- Changes by Doug Gilliland 2017-2020
--	Built with Quartus II 18.1 
--
-- EP4CE15 FPGA
-- Z80 CPU
--		25 MHz
--	USB-Serial Port
--		115,200 baud
--	Video Display Unit (VDU)
--    XVGA
--		2:2:2 RGB
--		PS/2 keyboard
--	External SRAM
--		1 MB (only 64KB are used by this implementation)
--	SD Card
--		25 MHz high speed (Neal Crook)
--		Supports SD, SDHC cards
--	Runs CP/M
--		Autodetects Serial port or VDU by waiting on space key to be pressed
-- Jumper(s)
--		Turbo J3 pins 3-4 (2nd jumper from the right)
--			Install for slow speed mode (10 MHz)
--			Remove for high speed mode (25 MHz)


library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port (
		n_reset		: in std_logic :='1';
		clk			: in std_logic;
		turboMode	: in std_logic;
		-- External SRAM
		sramData		: inout std_logic_vector(7 downto 0) := "ZZZZZZZZ";
		sramAddress	: out std_logic_vector(19 downto 0) := x"00000";
		n_sRamWE		: out std_logic :='1';
		n_sRamCS		: out std_logic :='1';
		n_sRamOE		: out std_logic :='1';
		-- Serial Port
		utxd1			: in std_logic := '1';
		urxd1			: out std_logic := '1';
		ucts1			: out std_logic := '0';
		urts1			: in std_logic := '0';
		-- Video RGB
		videoR0		: out std_logic :='0';
		videoG0		: out std_logic :='0';
		videoB0		: out std_logic :='0';
		videoR1		: out std_logic :='0';
		videoG1		: out std_logic :='0';
		videoB1		: out std_logic :='0';
		hSync			: out std_logic :='1';
		vSync			: out std_logic :='1';
		-- PS/2 Keyboard
		ps2Clk		: inout std_logic :='1';
		ps2Data		: inout std_logic :='1';
		-- SD Card
		sdCS			: out std_logic :='1';
		sdMOSI		: out std_logic :='1';
		sdMISO		: in std_logic;
		sdSCLK		: out std_logic :='1';
		driveLED		: out std_logic :='1';
		-- Output Latch
		latOut		: out std_logic_vector(7 downto 0) := x"00";
		-- Not using the SD RAM but making sure that it's not active
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

	signal n_WR						:	std_logic :='1';
	signal n_RD						:	std_logic :='1';
	signal cpuAddress				:	std_logic_vector(15 downto 0);
	signal cpuDataOut				:	std_logic_vector(7 downto 0);
	signal cpuDataIn				:	std_logic_vector(7 downto 0);

	signal basRomData				:	std_logic_vector(7 downto 0);
	signal interface1DataOut	:	std_logic_vector(7 downto 0);
	signal interface2DataOut	:	std_logic_vector(7 downto 0);
	signal sdCardDataOut			:	std_logic_vector(7 downto 0);

	signal n_memWR					:	std_logic :='1';
	signal n_memRD 				:	std_logic :='1';

	signal n_ioWR					:	std_logic :='1';
	signal n_ioRD 					:	std_logic :='1';
	
	signal n_MREQ					:	std_logic :='1';
	signal n_IORQ					:	std_logic :='1';	

	signal n_int1					:	std_logic :='1';	
	signal n_int2					:	std_logic :='1';	
	
	signal n_extRamCS				:	std_logic :='1';
	signal n_basRomCS				:	std_logic :='1';
	signal n_interface1CS		:	std_logic :='1';
	signal n_interface2CS		:	std_logic :='1';
	signal n_sdCardCS				:	std_logic :='1';
	signal wrLatch					:	std_logic :='0';

	signal cpuClkCount			:	std_logic_vector(5 downto 0);
	signal cpuClock				:	std_logic;
	
	signal serialClkCount     :	std_logic_vector(15 downto 0) := x"0000";
	signal serialClkCount_d   :	std_logic_vector(15 downto 0);
	Signal serialClkEn        :	std_logic;

	--CP/M
	signal n_RomActive			:	std_logic := '0';

begin

-- CP/M RAM space switch (hit space key to select at boot)
-- Disable ROM if out 38. Re-enable when (asynchronous) reset pressed
process (n_ioWR, n_reset) 
	begin
		if (n_reset = '0') then
			n_RomActive <= '0';
		elsif (rising_edge(n_ioWR)) then
			if cpuAddress(7 downto 0) = "00111000" then -- $38
				n_RomActive <= '1';
			end if;
		end if;
end process;

-- ____________________________________________________________________________________
-- Z80 CPU
cpu1 : entity work.t80s
generic map(mode => 1, t2write => 1, iowait => 0)
port map(
	reset_n	=> n_reset,
	clk_n		=> cpuClock,
	wait_n	=> '1',
	int_n		=> '1',
	nmi_n		=> '1',
	busrq_n	=> '1',
	mreq_n	=> n_MREQ,
	iorq_n	=> n_IORQ,
	rd_n		=> n_RD,
	wr_n		=> n_WR,
	a			=> cpuAddress,
	di			=> cpuDataIn,
	do			=> cpuDataOut
);

-- ____________________________________________________________________________________
-- BASIC ROM
rom1 : entity work.Z80_CPM_BASIC_ROM -- 8KB BASIC and CP/M boot
port map(
	address	=> cpuAddress(12 downto 0),
	clock		=> clk,
	q			=> basRomData
);

-- ____________________________________________________________________________________
-- External RAM
sramAddress(19 downto 16) 	<= "0000";
sramAddress(15 downto 0) 	<= cpuAddress(15 downto 0);
sramData <= cpuDataOut when n_memWR='0' else (others => 'Z');
n_sRamWE <= n_memWR or n_extRamCS;
n_sRamOE <= n_memRD or n_extRamCS;
n_sRamCS <= n_extRamCS;

-- ____________________________________________________________________________________
-- ACIA UART
io1 : entity work.bufferedUART
port map(
	clk		=> clk,
	n_wr		=> n_interface1CS or n_ioWR,
	n_rd		=> n_interface1CS or n_ioRD,
	n_int		=> n_int1,
	regSel	=> cpuAddress(0),
	dataIn	=> cpuDataOut,
	dataOut	=> interface1DataOut,
	rxClkEn	=> serialClkEn,
	txClkEn	=> serialClkEn,
	rxd		=> utxd1,
	txd		=> urxd1,
	n_cts		=> urts1,
	n_rts		=> ucts1
);

-- ____________________________________________________________________________________
-- VGA output
io2 : entity work.SBCTextDisplayRGB
generic map (
	EXTENDED_CHARSET 		=> 1,
	COLOUR_ATTS_ENABLED	=> 1
)
port map (
	n_reset	=> n_reset,
	clk		=> clk,
	
	-- RGB video signals
	hSync		=> hSync,
	vSync		=> vSync,
	videoR0	=> videoR0,
	videoR1	=> videoR1,
	videoG0	=> videoG0,
	videoG1	=> videoG1,
	videoB0	=> videoB0,
	videoB1	=> videoB1,
	
	n_wr		=> n_interface2CS or n_ioWR,
	n_rd		=> n_interface2CS or n_ioRD,
	n_int		=> n_int2,
	regSel	=> cpuAddress(0),
	dataIn	=> cpuDataOut,
	dataOut	=> interface2DataOut,
	ps2Clk	=> ps2Clk,
	ps2Data	=> ps2Data
);

sd1 : entity work.sd_controller
port map(
	sdCS		=> sdCS,
	sdMOSI	=> sdMOSI,
	sdMISO	=> sdMISO,
	sdSCLK	=> sdSCLK,
	n_wr		=> n_sdCardCS or n_ioWR,
	n_rd		=> n_sdCardCS or n_ioRD,
	n_reset	=> n_reset,
	dataIn	=> cpuDataOut,
	dataOut	=> sdCardDataOut,
	regAddr	=> cpuAddress(2 downto 0),
	driveLED	=> driveLED,
	clk		=> clk 
);

outLat8 : entity work.outLatch
	port map(	
		dataIn	=> cpuDataOut,
		clock		=> clk,
		load		=> wrLatch,
		clear		=> not n_reset,
		latchOut	=> latOut
	);


-- ____________________________________________________________________________________
-- MEMORY READ/WRITE LOGIC
n_ioWR	<= n_WR or n_IORQ;
n_memWR	<= n_WR or n_MREQ;
n_ioRD	<= n_RD or n_IORQ;
n_memRD	<= n_RD or n_MREQ;

-- ____________________________________________________________________________________
-- CHIP SELECTS
n_basRomCS 		<= '0' 	when cpuAddress(15 downto 13)	= "000"			and n_RomActive = '0' 				else '1'; --8K at bottom of memory
n_interface1CS <= '0' 	when cpuAddress(7 downto 1)	= x"8"&"000"	and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 2 Bytes $80-$81
n_interface2CS <= '0'	when cpuAddress(7 downto 1)	= x"8"&"001"	and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 2 Bytes $82-$83
n_sdCardCS 		<= '0'	when cpuAddress(7 downto 3)	= x"8"&'1'		and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 8 Bytes $88-$8F
wrLatch			<= '1'	when cpuAddress(7 downto 1)	= x"9"&"000"	and  n_ioWR='0'                  else '0'; -- 8 Bytes $90-$91
n_extRamCS		<= not n_basRomCS;

-- ____________________________________________________________________________________
-- BUS ISOLATION
cpuDataIn <=
	interface1DataOut	when n_interface1CS	= '0' else	-- UART 1
	interface2DataOut	when n_interface2CS	= '0' else	-- UART 2 (VGA Display)
	sdCardDataOut		when n_sdCardCS		= '0' else	-- SD Card
	basRomData			when n_basRomCS		= '0' else	-- ROM (until CP/M is booted)
	sramData				when n_extRamCS		= '0' else	-- SRAM
	x"FF";

-- ____________________________________________________________________________________
-- SYSTEM CLOCKS
    -- Serial clock DDS. With 50MHz master input clock:
    -- Baud   Increment
    -- 115200 2416
    -- 38400  805
    -- 19200  403
    -- 9600   201
    -- 4800   101
    -- 2400   50
    baud_div: process (serialClkCount_d, serialClkCount)
    begin
        serialClkCount_d <= serialClkCount + 2416;
    end process;


-- CPU CLOCK SIGNALS
clk_gen: process (clk) begin
	if rising_edge(clk) then
		if turboMode = '1' then	-- 25 MHz Z80
			if cpuClkCount < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				cpuClkCount <= cpuClkCount + 1;
			else
				cpuClkCount <= (others=>'0');
			end if;
			if cpuClkCount < 1 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				cpuClock <= '0';
			else
				cpuClock <= '1';
			end if;
		else		-- 10 MHz Z80
			if cpuClkCount < 4 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				cpuClkCount <= cpuClkCount + 1;
			else
				cpuClkCount <= (others=>'0');
			end if;
			if cpuClkCount < 2 then -- 2 when 10MHz, 2 when 12.5MHz, 2 when 16.6MHz, 1 when 25MHz
				cpuClock <= '0';
			else
				cpuClock <= '1';
			end if;
		end if;
	end if;
end process;

-- Serial Clock Signals
serialClkGen: process (clk) begin
	if rising_edge(clk) then
		serialClkCount <= serialClkCount_d;
		if serialClkCount(15) = '0' and serialClkCount_d(15) = '1' then
			serialClkEn <= '1';
		else
			serialClkEn <= '0';
		end if;
	end if;
end process;

end;
