-- Original file is copyright by Grant Searle 2014
-- Grant Searle's "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Changes to this code by Doug Gilliland 2019
--	16K (internal) RAM version
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Microcomputer is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;
		
		videoR0		: out std_logic;
		videoR1		: out std_logic;
		videoR2		: out std_logic;
		videoR3		: out std_logic;
		videoR4		: out std_logic;
		videoG0		: out std_logic;
		videoG1		: out std_logic;
		videoG2		: out std_logic;
		videoG3		: out std_logic;
		videoG4		: out std_logic;
		videoG5		: out std_logic;
		videoB0		: out std_logic;
		videoB1		: out std_logic;
		videoB2		: out std_logic;
		videoB3		: out std_logic;
		videoB4		: out std_logic;
		hSync			: out std_logic;
		vSync			: out std_logic;

		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1			: out std_logic;
		LED2			: out std_logic;
		LED3			: out std_logic;
		LED4			: out std_logic;

		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic
	);
end Microcomputer;

architecture struct of Microcomputer is

	signal n_WR							: std_logic;
	signal n_RD							: std_logic;
	signal cpuAddress					: std_logic_vector(15 downto 0);
	signal cpuDataOut					: std_logic_vector(7 downto 0);
	signal cpuDataIn					: std_logic_vector(7 downto 0);

	signal basRomData					: std_logic_vector(7 downto 0);
	signal interface1DataOut		: std_logic_vector(7 downto 0);
	signal aciaData					: std_logic_vector(7 downto 0);
	signal internalRam1DataOut		: std_logic_vector(7 downto 0);

	signal n_memWR						: std_logic :='1';
	signal n_memRD 					: std_logic :='1';

	signal n_basRomCS					: std_logic :='1';
	signal n_videoInterfaceCS		: std_logic :='1';
	signal n_aciaCS					: std_logic :='1';
	signal n_internalRamCS			: std_logic :='1';
	signal n_IOCS						: std_logic :='1';
	signal n_IOCS_Write				: std_logic :='1';
	signal n_IOCS_Read 				: std_logic :='1';

	signal serialClkCount			: std_logic_vector(15 downto 0);
	signal serialClkCount_d       : std_logic_vector(15 downto 0);
	signal serialClkEn            : std_logic;
	signal serialClock				: std_logic;

	signal cpuClkCount				: std_logic_vector(5 downto 0); 
	signal cpuClock					: std_logic;
	signal sdClock						: std_logic;	
	signal sdClkCount					: std_logic_vector(5 downto 0); 	
	
	signal latchedBits				: std_logic_vector(7 downto 0);
	signal switchesRead			 	: std_logic_vector(7 downto 0);
	
	signal txdBuff						: std_logic;
	signal funKeys						: std_logic_vector(12 downto 0);
	signal fKey1						: std_logic;
	signal fKey2						: std_logic;
--	signal FNtoggledKeys				: std_logic_vector(12 downto 0);

begin
	-- ____________________________________________________________________________________
	-- Card has 16 bits of RGB digital data
	-- Drive the least significant bits with 0's since Multi-Comp only has 6 bits of RGB digital data
	videoR0 <= '0';
	videoR1 <= '0';
	videoR2 <= '0';
	videoG0 <= '0';
	videoG1 <= '0';
	videoG2 <= '0';
	videoG3 <= '0'; 
	videoB0 <= '0';
	videoB1 <= '0';
	videoB2 <= '0';
	
	LED1 <= latchedBits(0);
	LED2 <= fKey1;
	LED3 <= txdBuff;
	LED4 <= rxd;
	txd <= txdBuff;
	
	n_IOCS_Write <= n_memWR or n_IOCS;
	n_IOCS_Read <= not n_memWR or n_IOCS;
	switchesRead(0) <= switch0;
	switchesRead(1) <= switch1;
	switchesRead(2) <= switch2;
	switchesRead(3) <= '0';
	switchesRead(4) <= '0';
	switchesRead(5) <= '0';
	switchesRead(6) <= '0';
	switchesRead(7) <= '0';
	
	-- ____________________________________________________________________________________
	-- CPU CHOICE GOES HERE
	cpu1 : entity work.cpu09l
		port map(
			clk => not(cpuClock),
			rst => not n_reset,
			rw => n_WR,
			addr => cpuAddress,
			data_in => cpuDataIn,
			data_out => cpuDataOut,
			halt => '0',
			hold => '0',
			irq => '0',
			firq => '0',
			nmi => '0'
		); 
	
	-- ____________________________________________________________________________________
	-- ROM GOES HERE	
	rom1 : entity work.M6809_EXT_BASIC_ROM -- 8KB BASIC
		port map(
			address => cpuAddress(12 downto 0),
			clock => clk,
			q => basRomData
		);
	
	-- ____________________________________________________________________________________
	-- RAM GOES HERE
	
 	ram1: entity work.InternalRam16K
		port map
		(
			address => cpuAddress(13 downto 0),
			clock => clk,
			data => cpuDataOut,
			wren => not(n_memWR or n_internalRamCS),
			q => internalRam1DataOut
		);
	
	-- ____________________________________________________________________________________
	-- Display GOES HERE

	io1 : entity work.SBCTextDisplayRGB
		port map (
			n_reset => n_reset,
			clk => clk,
			
			-- RGB CompVideo signals
			hSync => hSync,
			vSync => vSync,
			videoR0 => videoR3,
			videoR1 => videoR4,
			videoG0 => videoG4,
			videoG1 => videoG5,
			videoB0 => videoB3,
			videoB1 => videoB4,
			
			n_wr => n_videoInterfaceCS or cpuClock or n_WR,
			n_rd => n_videoInterfaceCS or cpuClock or (not n_WR),
			regSel => cpuAddress(0),
			dataIn => cpuDataOut,
			dataOut => interface1DataOut,
			ps2Clk => ps2Clk,
			ps2Data => ps2Data,
			FNkeys => funKeys
		);
		
	FNKey1Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => funKeys(1),
			clock => clk,
			n_res => n_reset,
			latchFNKey => fKey1
		);	

	FNKey2Toggle: entity work.Toggle_On_FN_Key	
		port map (		
			FNKey => funKeys(2),
			clock => clk,
			n_res => n_reset,
			latchFNKey => fKey2
		);	

		
	UART : entity work.bufferedUART
		port map(
			clk => clk,
			n_wr => n_aciaCS or cpuClock or n_WR,
			n_rd => n_aciaCS or cpuClock or (not n_WR),
			regSel => cpuAddress(0),
			dataIn => cpuDataOut,
			dataOut => aciaData,
			rxClkEn => serialClkEn,
			txClkEn => serialClkEn,
			rxd => rxd,
			txd => txdBuff,
			n_cts => '0',
			n_dcd => '0',
			n_rts => rts
		);

	io3: entity work.OutLatch
		port map (
			dataIn8 => cpuDataOut,
			clock => clk,
			load => n_IOCS_Write,
			clear => n_reset,
			latchOut => latchedBits
			);
	
	-- ____________________________________________________________________________________
	-- MEMORY READ/WRITE LOGIC GOES HERE
	n_memWR <= not(cpuClock) nand (not n_WR);
	
	-- ____________________________________________________________________________________
	-- CHIP SELECTS GO HERE
	n_basRomCS <= '0' when cpuAddress(15 downto 13) = "111" else '1'; --8K at top of memory
	n_videoInterfaceCS <= '0' when ((cpuAddress(15 downto 1) = "111111111101000" and fKey1 = '0') or (cpuAddress(15 downto 1) = "111111111101001" and fKey1 = '1')) else '1';
	n_aciaCS           <= '0' when ((cpuAddress(15 downto 1) = "111111111101001" and fKey1 = '0') or (cpuAddress(15 downto 1) = "111111111101000" and fKey1 = '1')) else '1';
	n_IOCS <= '0' when cpuAddress(15 downto 0) = "1111111111010100" else '1'; -- 1 byte FFD4 (65492 dec)
	n_internalRamCS <= '0' when cpuAddress(15 downto 14) = "00" else '1';
	
	-- ____________________________________________________________________________________
	-- BUS ISOLATION GOES HERE
	-- Order matters since SRAM overlaps I/O chip selects
	cpuDataIn <=
	interface1DataOut when n_videoInterfaceCS = '0' else
	aciaData when n_aciaCS = '0' else
	switchesRead when n_IOCS_Read = '0' else
	basRomData when n_basRomCS = '0' else
	internalRam1DataOut when n_internalRamCS= '0' else
	x"FF";
	
	-- ____________________________________________________________________________________
	-- SYSTEM CLOCKS GO HERE

clk_gen: process (clk)
	begin
		if rising_edge(clk) then
			if cpuClkCount < 1 then -- 4 = 10MHz, 3 = 12.5MHz, 2=16.6MHz, 1=25MHz
				cpuClkCount <= cpuClkCount + 1;
			else
				cpuClkCount <= (others=>'0');
			end if;
			cpuClock <= cpuClkCount(0);
		end if;
end process;

sdclk_gen: process (clk)
	begin
		if rising_edge(clk) then
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

	baud_div: process (serialClkCount_d, serialClkCount)
		begin
			if fKey2 = '0' then
				serialClkCount_d <= serialClkCount + 2416;	-- 115,200 baud
			else
				serialClkCount_d <= serialClkCount + 6;		-- 300 baud
			end if;
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(clk)
		begin
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
