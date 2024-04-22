-- Original design is copyright by Grant Searle 2014 - Grant's copyright statement is:
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
--
-- Changes by Doug Gilliland 2017-2019
-- Target hardware is A-ESTF V2 card which has EP4CE22 FPGA
-- Uses maximum internal SRAM in the FPGA as memory for the Z80
-- Set serial port baud rate to 300 baud since the card has no hardware handshake lines to the serial port
-- Uses mc-2g-1024 Neal Crook's version of the SD card controller since it supports SDHC cards\
-- z80 at 25 MHz
-- 8K BASIC in ROM
-- 48KB SRAM
-- Serial Port
-- VGA - 6-bits - 

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		n_reset		: in std_logic :='1';
		clk			: in std_logic;
		-- Serial Port
		rxd1			: in std_logic := '1';
		txd1			: out std_logic :='1';
		rts1			: out std_logic;
		-- Video RGB
		o_video_Red	: out	std_logic_vector(4 downto 0);
		o_video_Grn	: out	std_logic_vector(5 downto 0);
		o_video_Blu	: out	std_logic_vector(4 downto 0);
		hSync			: out std_logic :='1';
		vSync			: out std_logic :='1';
		-- PS/2 Keyboard
		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic;
		-- SD Card
		sdCS			: out std_logic :='1';
		sdMOSI		: out std_logic :='1';
		sdMISO		: in std_logic := '1';
		sdSCLK		: out std_logic :='1';
		
		driveLED		: out std_logic :='1';
		ledOut8		: out std_logic_vector(7 downto 0)
	);
end Microcomputer;

architecture struct of Microcomputer is

	signal n_WR							: std_logic :='1';
	signal n_RD							: std_logic :='1';
	signal cpuAddress					: std_logic_vector(15 downto 0);
	signal cpuDataOut					: std_logic_vector(7 downto 0);
	signal cpuDataIn					: std_logic_vector(7 downto 0);

	signal basRomData					: std_logic_vector(7 downto 0);
	signal internalRam1DataOut		: std_logic_vector(7 downto 0);
	signal internalRam2DataOut		: std_logic_vector(7 downto 0);
	signal internalRam3DataOut		: std_logic_vector(7 downto 0);
	signal internalRam4DataOut		: std_logic_vector(7 downto 0);
	signal internalRam5DataOut		: std_logic_vector(7 downto 0);
	signal internalRam6DataOut		: std_logic_vector(7 downto 0);
	signal interface1DataOut		: std_logic_vector(7 downto 0);
	signal interface2DataOut		: std_logic_vector(7 downto 0);
	signal sdCardDataOut				: std_logic_vector(7 downto 0);

	signal n_memWR						: std_logic :='1';
--	signal n_memRD 					: std_logic :='1';

	signal n_ioWR						: std_logic :='1';
	signal n_ioRD 						: std_logic :='1';
	
	signal n_MREQ						: std_logic :='1';
	signal n_IORQ						: std_logic :='1';	

	signal n_int1						: std_logic :='1';	
	signal n_int2						: std_logic :='1';	
	
	signal n_basRomCS					: std_logic :='1';
	signal n_interface1CS			: std_logic :='1';
	signal n_interface2CS			: std_logic :='1';
	signal n_sdCardCS					: std_logic :='1';
	signal n_LEDCS						: std_logic :='1';
	signal n_internalRAMCs1			: std_logic :='1';
	signal n_internalRAMCs2			: std_logic :='1';
	signal n_internalRAMCs3			: std_logic :='1';
	signal n_internalRAMCs4			: std_logic :='1';
	signal n_internalRAMCs5			: std_logic :='1';

	signal serialClkCount			: std_logic_vector(15 downto 0);
	signal cpuClkCount				: std_logic_vector(5 downto 0); 
	signal sdClkCount					: std_logic_vector(5 downto 0); 	
	signal cpuClock					: std_logic;
	signal serialClock				: std_logic;
	signal sdClock						: std_logic;	
--CP/M
	signal n_RomActive 				: std_logic := '0';

	signal videoR0						: std_logic :='0';
	signal videoG0						: std_logic :='0';
	signal videoB0						: std_logic :='0';
	signal videoR1						: std_logic :='0';
	signal videoG1						: std_logic :='0';
	signal videoB1						: std_logic :='0';

	
begin

	o_video_Red	<= videoR1&videoR1&videoR0&videoR0&videoR0;
	o_video_Grn	<= videoG1&videoG1&videoG0&videoG0&videoG0&videoG0;
	o_video_Blu	<= videoB1&videoB1&videoB0&videoB0&videoB0;

--CP/M
n_RomActive <= '0';
-- Disable ROM if out 38. Re-enable when (asynchronous) reset pressed
--process (n_ioWR, n_reset) 
--	begin
--		if (n_reset = '0') then
--			n_RomActive <= '0';
--		elsif (rising_edge(n_ioWR)) then
--			if cpuAddress(7 downto 0) = "00111000" then -- $38
--				n_RomActive <= '1';
--			end if;
--		end if;
--end process;

-- ____________________________________________________________________________________
-- Z80 CPU

cpu1 : entity work.t80s
generic map(mode => 1, t2write => 1, iowait => 0)
port map(
	reset_n => n_reset,
	clk_n => cpuClock,
	wait_n => '1',
	int_n => '1',
	nmi_n => '1',
	busrq_n => '1',
	mreq_n => n_MREQ,
	iorq_n => n_IORQ,
	rd_n => n_RD,
	wr_n => n_WR,
	a => cpuAddress,
	di => cpuDataIn,
	do => cpuDataOut
);

-- ____________________________________________________________________________________
-- BASIC and CP/M IN ROM

rom1 : entity work.Z80_BASIC_ROM
port map(
	address => cpuAddress(12 downto 0),
	clock => clk,
	q => basRomData
);

-- ____________________________________________________________________________________
-- INPUT/OUTPUT DEVICES

io1 : entity work.SBCTextDisplayRGB	-- VGA output
port map (
	n_reset => n_reset,
	clk => clk,
	
	-- RGB video signals
	hSync => hSync,
	vSync => vSync,
	videoR0 => videoR0,
	videoR1 => videoR1,
	videoG0 => videoG0,
	videoG1 => videoG1,
	videoB0 => videoB0,
	videoB1 => videoB1,
	n_wr => n_interface1CS or n_ioWR,
	n_rd => n_interface1CS or n_ioRD,
	n_int => n_int2,
	regSel => cpuAddress(0),
	dataIn => cpuDataOut,
	dataOut => interface1DataOut,
	ps2Clk => ps2Clk,
	ps2Data => ps2Data
);

io2 : entity work.bufferedUART	-- 2nd Serial port
port map(
	clk => clk,
	n_wr => n_interface2CS or n_ioWR,
	n_rd => n_interface2CS or n_ioRD,
	n_int => n_int1,
	regSel => cpuAddress(0),
	dataIn => cpuDataOut,
	dataOut => interface2DataOut,
	rxClock => serialClock,
	txClock => serialClock,
	rxd => rxd1,
	txd => txd1,
	n_cts => '0',
	n_dcd => '0',
	n_rts => rts1
);

InternalSRAM1 : ENTITY work.InternalRam8K
	PORT MAP
	(
		address	=> cpuAddress(12 downto 0),
		clock		=> clk,
		data		=> cpuDataOut,
		wren		=> not(n_memWR or n_internalRAMCs1),
		q			=> internalRam1DataOut
	);

InternalSRAM2 : ENTITY work.InternalRam16K
	PORT MAP
	(
		address	=> cpuAddress(13 downto 0),
		clock		=> clk,
		data		=> cpuDataOut,
		wren		=> not(n_memWR or n_internalRAMCs2),
		q			=> internalRam2DataOut
	);

InternalSRAM3 : ENTITY work.InternalRam8K
	PORT MAP
	(
		address	=> cpuAddress(12 downto 0),
		clock		=> clk,
		data		=> cpuDataOut,
		wren		=> not(n_memWR or n_internalRAMCs3),
		q			=> internalRam3DataOut
	);

InternalSRAM4 : ENTITY work.InternalRam8K
	PORT MAP
	(
		address	=> cpuAddress(12 downto 0),
		clock		=> clk,
		data		=> cpuDataOut,
		wren		=> not(n_memWR or n_internalRAMCs4),
		q			=> internalRam4DataOut
	);
	
InternalSRAM5 : ENTITY work.InternalRam8K
	PORT MAP
	(
		address	=> cpuAddress(12 downto 0),
		clock		=> clk,
		data		=> cpuDataOut,
		wren		=> not(n_memWR or n_internalRAMCs5),
		q			=> internalRam5DataOut
	);

atchLED : entity work.OutLatch	--Output LatchIO
port map(
	clear => n_reset,
	clock => clk,
	load => n_LEDCS,
	dataIn8 => not cpuDataOut,
	latchOut => ledOut8
);

sd1 : entity work.sd_controller
port map(
	sdCS => sdCS,
	sdMOSI => sdMOSI,
	sdMISO => sdMISO,
	sdSCLK => sdSCLK,
	n_wr => n_sdCardCS or n_ioWR,
	n_rd => n_sdCardCS or n_ioRD,
	n_reset => n_reset,
	dataIn => cpuDataOut,
	dataOut => sdCardDataOut,
	regAddr => cpuAddress(2 downto 0),
	driveLED => driveLED,
	clk => sdClock -- twice the spi clk
);

-- ____________________________________________________________________________________
-- MEMORY READ/WRITE LOGIC
n_ioRD	<= n_RD or n_IORQ;
n_ioWR	<= n_WR or n_IORQ;
--n_memRD	<= n_RD or n_MREQ;
n_memWR	<= n_WR or n_MREQ;

-- ____________________________________________________________________________________
-- CHIP SELECTS

-- I/O Mapped devices
n_interface1CS		<= '0' when cpuAddress(7 downto 1)	= "1000000" and (n_ioWR='0' or n_ioRD = '0')	else '1';	-- 2 Bytes $80-$81
n_interface2CS		<= '0' when cpuAddress(7 downto 1)	= "1000001" and (n_ioWR='0' or n_ioRD = '0') else '1';	-- 2 Bytes $82-$83
n_sdCardCS 			<= '0' when cpuAddress(7 downto 3)	= "10001"   and (n_ioWR='0' or n_ioRD = '0') else '1';	-- 8 Bytes $88-$8F
n_LEDCS 				<= '0' when cpuAddress(7 downto 1)	= "1000011" and (n_ioWR='0' or n_ioRD = '0') else '1';	-- 2 Bytes $86-$87

-- Memory Mapped devices
n_basRomCS			<= '0' when cpuAddress(15 downto 13)	= "000" and n_RomActive = '0' else '1';	-- 8K at bottom of memory
n_internalRAMCs1	<= '0' when cpuAddress(15 downto 13)	= "001" 								else '1';	-- x2000-x3fff - 8K
n_internalRAMCs2	<= '0' when cpuAddress(15 downto 14)	= "01"	 							else '1';	-- x4000-x7fff - 16K
n_internalRAMCs3	<= '0' when cpuAddress(15 downto 13)	= "100" 								else '1';	-- x8000-x9fff - 8K
n_internalRAMCs4	<= '0' when cpuAddress(15 downto 13)	= "000" and n_RomActive = '1'	else			-- x0000-x1fff - 8K (Swapped when CPM starts)
                     '0' when cpuAddress(15 downto 13)	= "101" and n_RomActive = '0'	else '1';	-- xa000-xbfff - 8K when BASIC
n_internalRAMCs5	<= '0' when cpuAddress(15 downto 13)	= "110" 								else '1';	-- xC000-xdfff - 8K

-- ____________________________________________________________________________________
-- Multiplexer for data into the CPU - in Priority order

cpuDataIn <=
	interface1DataOut		when n_interface1CS = '0'		else	-- UART 1
	interface2DataOut		when n_interface2CS = '0'		else	-- UART 2 (VGA Display)
	sdCardDataOut			when n_sdCardCS = '0'			else	-- SD Card
	basRomData				when n_basRomCS = '0'			else	-- BASIC + CP/M ROM
	internalRam1DataOut	when n_internalRAMCs1 = '0'	else	-- 
	internalRam2DataOut	when n_internalRAMCs2 = '0'	else	-- 
	internalRam3DataOut	when n_internalRAMCs3 = '0'	else	-- 
	internalRam4DataOut	when n_internalRAMCs4 = '0'	else	-- 
	internalRam5DataOut	when n_internalRAMCs5 = '0'	else	-- 
	x"FF";

-- ____________________________________________________________________________________
-- SYSTEM CLOCKS
-- SUB-CIRCUIT CLOCK SIGNALS
serialClock <= serialClkCount(15);
process (clk)
begin
if rising_edge(clk) then

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

if sdClkCount < 49 then -- 1MHz
	sdClkCount <= sdClkCount + 1;
else
	sdClkCount <= (others=>'0');
end if;
if sdClkCount < 25 then
	sdClock <= '0';
else
	sdClock <= '1';
end if;

-- Serial clock DDS
-- Basically, f = (increment x 50,000,000) / 65,536
-- Where f is the baud rate x 16, as required for the ACIA to run properly.
-- 50MHz master input clock:
-- OR INCREMENT = (BAUDRATE * 16 * 65526) / 50000000
-- Baud Increment
-- 115200 2416
-- 57600 1208
-- 38400 805
-- 19200 403
-- 9600 201
-- 4800 101
-- 2400 50
-- 1200 25
-- 300 6
serialClkCount <= serialClkCount + 6;		-- 300 baud serial port
end if;
end process;
end;
