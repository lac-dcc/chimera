-- This file is copyright by Grant Searle 2014
-- Grant Searle's web site http://searle.hostei.com/grant/    
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2017
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;

		sramData		: inout std_logic_vector(7 downto 0);
		sramAddress	: out std_logic_vector(15 downto 0);
		n_sRamWE		: out std_logic;
		n_sRamCS		: out std_logic;
		n_sRamOE		: out std_logic;
		
		rxd1			: in std_logic;
		txd1			: out std_logic;
		rts1			: out std_logic;

		rxd2			: in std_logic;
		txd2			: out std_logic;
		rts2			: out std_logic;
		
		videoSync	: out std_logic;
		video			: out std_logic;

		videoR0		: out std_logic;
		videoG0		: out std_logic;
		videoB0		: out std_logic;
		videoR1		: out std_logic;
		videoG1		: out std_logic;
		videoB1		: out std_logic;
		hSync			: out std_logic;
		vSync			: out std_logic;

		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic;
		
		n_ChipSS		: out std_logic;

		sdCS			: out std_logic;
		sdMOSI		: out std_logic;
		sdMISO		: in std_logic;
		sdSCLK		: out std_logic;
		driveLED		: out std_logic :='1';
		ioOut8		: out std_logic_vector(7 downto 0)
	);
end Microcomputer;

architecture struct of Microcomputer is

	signal n_WR							: std_logic;
	signal n_RD							: std_logic;
	signal cpuAddress					: std_logic_vector(15 downto 0);
	signal cpuDataOut					: std_logic_vector(7 downto 0);
	signal cpuDataIn					: std_logic_vector(7 downto 0);

	signal basRomData					: std_logic_vector(7 downto 0);
	signal internalRam1DataOut		: std_logic_vector(7 downto 0);
	signal internalRam2DataOut		: std_logic_vector(7 downto 0);
	signal interface1DataOut		: std_logic_vector(7 downto 0);
	signal interface2DataOut		: std_logic_vector(7 downto 0);
	signal sdCardDataOut				: std_logic_vector(7 downto 0);

	signal n_memWR						: std_logic :='1';
	signal n_memRD 					: std_logic :='1';

	signal n_ioWR						: std_logic :='1';
	signal n_ioRD 						: std_logic :='1';
	
	signal n_MREQ						: std_logic :='1';
	signal n_IORQ						: std_logic :='1';	

	signal n_int1						: std_logic :='1';	
	signal n_int2						: std_logic :='1';	
	
	signal n_externalRamCS			: std_logic :='1';
	signal n_internalRam1CS			: std_logic :='1';
	signal n_internalRam2CS			: std_logic :='1';
	signal n_basRomCS					: std_logic :='1';
	signal n_interface1CS			: std_logic :='1';
	signal n_interface2CS			: std_logic :='1';
	signal n_sdCardCS					: std_logic :='1';
	signal n_sdChipCS					: std_logic :='1';

	signal serialClkCount			: std_logic_vector(15 downto 0);
	signal cpuClkCount				: std_logic_vector(5 downto 0); 
	signal sdClkCount					: std_logic_vector(5 downto 0); 	
	signal cpuClock					: std_logic;
	signal serialClock				: std_logic;
	signal sdClock						: std_logic;	
--CPM
	signal n_RomActive : std_logic := '0';

begin

--CPM
-- Disable ROM if out 38. Re-enable when (asynchronous) reset pressed
process (n_ioWR, n_reset) begin
if (n_reset = '0') then
n_RomActive <= '0';
elsif (rising_edge(n_ioWR)) then
if cpuAddress(7 downto 0) = "00111000" then -- $38
n_RomActive <= '1';
end if;
end if;
end process;
-- ____________________________________________________________________________________
-- CPU CHOICE GOES HERE
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
do => cpuDataOut);

-- ____________________________________________________________________________________
-- ROM GOES HERE	

rom1 : entity work.Z80_CPM_BASIC_ROM -- 8KB BASIC and CP/M boot
port map(
address => cpuAddress(12 downto 0),
clock => clk,
q => basRomData
);

-- ____________________________________________________________________________________
-- RAM GOES HERE

sramAddress(15 downto 0) <= cpuAddress(15 downto 0);
sramData <= cpuDataOut when n_memWR='0' else (others => 'Z');
n_sRamWE <= n_memWR or n_externalRamCS;
n_sRamOE <= n_memRD or n_externalRamCS;
n_sRamCS <= n_externalRamCS;

-- ____________________________________________________________________________________
-- INPUT/OUTPUT DEVICES GO HERE	

io1 : entity work.bufferedUART	-- First Serial port
port map(
	clk => clk,
	n_wr => n_interface1CS or n_ioWR,
	n_rd => n_interface1CS or n_ioRD,
	n_int => n_int1,
	regSel => cpuAddress(0),
	dataIn => cpuDataOut,
	dataOut => interface1DataOut,
	rxClock => serialClock,
	txClock => serialClock,
	rxd => rxd1,
	txd => txd1,
	n_cts => '0',
	n_dcd => '0',
	n_rts => rts1
);

latchIO : entity work.OUT_LATCH	--Output LatchIO
port map(
	clear => n_reset,
	clock => clk,
	load => n_sdChipCS,
	dataIn8 => cpuDataOut,
	latchOut => ioOut8
);


--io2 : entity work.SBCTextDisplayRGB	-- VGA/Composite output
--
--port map (
--n_reset => n_reset,
--clk => clk,
--
---- RGB video signals
--hSync => hSync,
--vSync => vSync,
--videoR0 => videoR0,
--videoR1 => videoR1,
--videoG0 => videoG0,
--videoG1 => videoG1,
--videoB0 => videoB0,
--videoB1 => videoB1,
--
---- Monochrome video signals (when using TV timings only)
--sync => videoSync,
--video => video,
--
--n_wr => n_interface2CS or n_ioWR,
--n_rd => n_interface2CS or n_ioRD,
--n_int => n_int2,
--regSel => cpuAddress(0),
--dataIn => cpuDataOut,
--dataOut => interface2DataOut,
--ps2Clk => ps2Clk,
--ps2Data => ps2Data
--);


--io2 : entity work.bufferedUART	-- Second Serial port
--port map(
--clk => clk,
--n_wr => n_interface2CS or n_ioWR,
--n_rd => n_interface2CS or n_ioRD,
--n_int => n_int2,
--regSel => cpuAddress(0),
--dataIn => cpuDataOut,
--dataOut => interface2DataOut,
--rxClock => serialClock,
--txClock => serialClock,
--rxd => rxd2,
--txd => txd2,
--n_cts => '0',
--n_dcd => '0',
--n_rts => rts2
--);

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
-- MEMORY READ/WRITE LOGIC GOES HERE
n_ioWR <= n_WR or n_IORQ;
n_memWR <= n_WR or n_MREQ;
n_ioRD <= n_RD or n_IORQ;
n_memRD <= n_RD or n_MREQ;

-- ____________________________________________________________________________________
-- CHIP SELECTS GO HERE
n_basRomCS <= '0' when cpuAddress(15 downto 13) = "000" and n_RomActive = '0' else '1'; --8K at bottom of memory
n_interface1CS <= '0' when cpuAddress(7 downto 1) = "1000000" and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 2 Bytes $80-$81
n_interface2CS <= '0' when cpuAddress(7 downto 1) = "1000001" and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 2 Bytes $82-$83
n_sdChipCS  <= '0' when cpuAddress(7 downto 1)    = "1000010" and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 2 Bytes $84-$85
n_sdCardCS <= '0' when cpuAddress(7 downto 3)     = "10001"   and (n_ioWR='0' or n_ioRD = '0') else '1'; -- 8 Bytes $88-$8F
n_externalRamCS<= not n_basRomCS;

-- ____________________________________________________________________________________
-- BUS ISOLATION GOES HERE
cpuDataIn <=
interface1DataOut when n_interface1CS = '0' else	-- UART 1
interface2DataOut when n_interface2CS = '0' else	-- UART 2
sdCardDataOut when n_sdCardCS = '0' else				-- SD Card
basRomData when n_basRomCS = '0' else
internalRam1DataOut when n_internalRam1CS= '0' else
sramData when n_externalRamCS= '0' else
x"FF";

-- n_ChipSS <= n_sdChipCS;
n_ChipSS <= n_sdChipCS;

-- ____________________________________________________________________________________
-- SYSTEM CLOCKS GO HERE
-- SUB-CIRCUIT CLOCK SIGNALS
serialClock <= serialClkCount(15);
process (clk)
begin
if rising_edge(clk) then

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
-- 50MHz master input clock:
-- Baud Increment
-- 115200 2416
-- 38400 805
-- 19200 403
-- 9600 201
-- 4800 101
-- 2400 50
serialClkCount <= serialClkCount + 2416;
end if;
end process;
end;
