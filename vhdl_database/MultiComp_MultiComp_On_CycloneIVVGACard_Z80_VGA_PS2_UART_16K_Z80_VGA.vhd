-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Z80_VGA is
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
		hSync		: out std_logic;
		vSync		: out std_logic;
		
		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1			: out std_logic;
		LED2			: out std_logic;
		LED3			: out std_logic;
		LED4			: out std_logic;

		BUZZER		: out std_logic;

		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic
	);
end Z80_VGA;

architecture struct of Z80_VGA is

	signal n_WR					: std_logic;
	signal n_RD					: std_logic;
	signal cpuAddress			: std_logic_vector(15 downto 0);
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);
	
	signal counterOut			: std_logic_vector(27 downto 0);
	signal buzz					: std_logic;

	signal basRomData			: std_logic_vector(7 downto 0);
	signal interface1DataOut	: std_logic_vector(7 downto 0);
	signal interface2DataOut			: std_logic_vector(7 downto 0);
	signal ramDataOut			: std_logic_vector(7 downto 0);
	
	signal n_memWR				: std_logic;
	signal n_memRD 			: std_logic :='1';
	
	signal n_basRomCS					: std_logic :='1';
	signal n_interface1CS			: std_logic :='1';
	signal n_interface2CS			: std_logic :='1';
	signal n_internalRam1CS			: std_logic :='1';
	signal n_Latch_CS					: std_logic :='1';
	
	signal n_ioWR						: std_logic :='1';
	signal n_ioRD 						: std_logic :='1';

	signal n_MREQ						: std_logic :='1';
	signal n_IORQ						: std_logic :='1';	

	signal n_int1						: std_logic :='1';	
	signal n_int2						: std_logic :='1';	
	
	signal serialClkCount			: std_logic_vector(15 downto 0);
	signal serialClkCount_d       : std_logic_vector(15 downto 0);
	signal serialClkEn            : std_logic;

	signal cpuClkCount				: std_logic_vector(5 downto 0); 
	signal cpuClock					: std_logic;
	signal serialClock				: std_logic;
	
	signal n_LatchCS					: std_logic :='1';
	signal latchedBits				: std_logic_vector(7 downto 0);
	signal switchesDataout			 	: std_logic_vector(7 downto 0);

	signal txdBuff						: std_logic;
	signal funKeys						: std_logic_vector(12 downto 0);
	signal fKey1						: std_logic :='0';
	signal fKey2						: std_logic :='0';

	signal n_RomActive : std_logic := '0';

begin
	-- ____________________________________________________________________________________
	-- Card has 16 bits of RGB digital data
	-- Drive the least significant bits with 0's since Multi-Comp only has 6 bits of RGB digital data
	videoR0 <= '0';	-- pin 120 (CH 2)
	videoR1 <= '0';
	videoR2 <= '0';
	videoG0 <= '0';	-- pin 111 (CH 1)
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
	
	switchesDataout(0) <= switch0;
	switchesDataout(1) <= switch1;
	switchesDataout(2) <= switch2;
	switchesDataout(3) <= '0';
	switchesDataout(4) <= '0';
	switchesDataout(5) <= '0';
	switchesDataout(6) <= '0';
	switchesDataout(7) <= '0';

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
		do => cpuDataOut
	);

	rom : entity work.Z80_BASIC_ROM -- 8KB
	port map(
		address => cpuAddress(12 downto 0),
		clock => clk,
		q => basRomData
	);

	u3: entity work.InternalRam16K 
	port map
	(
		address => cpuAddress(13 downto 0),
		clock => clk,
		data => cpuDataOut,
		wren => not(n_memWR or n_internalRam1CS),
		q => ramDataOut
	);

	io1 : entity work.SBCTextDisplayRGB
generic map (
	EXTENDED_CHARSET 		=> 0,
	COLOUR_ATTS_ENABLED	=> 0
)
		port map (
		n_reset => n_reset,
		clk => clk,

		-- RGB video signals
		hSync => hSync,
		vSync => vSync,
		videoR0 => videoR3,		-- Most significant bits (different from Grant's)
		videoR1 => videoR4,
		videoG0 => videoG4,
		videoG1 => videoG5,
		videoB0 => videoB3,
		videoB1 => videoB4,

		n_wr => n_interface1CS or n_ioWR,
		n_rd => n_interface1CS or n_ioRD,
		n_int => n_int1,
		regSel => cpuAddress(0),
		dataIn => cpuDataOut,
		dataOut => interface1DataOut,
		ps2Clk => ps2Clk,
		ps2Data => ps2Data,
		FNkeys => funKeys			-- Brought out to use as port select/baud rate selects
	);

	UART : entity work.bufferedUART
		port map(
			clk => clk,
			n_wr => n_interface2CS or n_ioWR,
			n_rd => n_interface2CS or n_ioRD,
			n_int => n_int2,
			regSel => cpuAddress(0),
			dataIn => cpuDataOut,
			dataOut => interface2DataOut,
			rxClkEn => serialClkEn,		-- Improved UART clocking by Neal Crook
			txClkEn => serialClkEn,
			rxd => rxd,
			txd => txdBuff,
			n_cts => '0',
			n_dcd => '0',
			n_rts => rts
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
		
	io3: entity work.OutLatch
		port map (
			dataIn => cpuDataOut,
			clock => clk,
			load => n_Latch_CS or n_ioWR,
			clear => n_reset,
			latchOut => latchedBits
			);
	
	myCounter : entity work.counter
	port map(
		clock => clk,
		clear => '0',
		count => '1',
		Q => counterOut
		);

--	buzz <= latchedBits(4) and counterOut(16);
	BUZZER <= (
		(latchedBits(4) and counterOut(13)) or 
		(latchedBits(5) and counterOut(14)) or 
		(latchedBits(6) and counterOut(15)) or 
		(latchedBits(7) and counterOut(16)));

-- MEMORY READ/WRITE LOGIC GOES HERE
	n_ioWR <= n_WR or n_IORQ;
	n_memWR <= n_WR or n_MREQ;
	n_ioRD <= n_RD or n_IORQ;
	n_memRD <= n_RD or n_MREQ;
	
	-- Chip Selects
	n_basRomCS       <= '0' when   cpuAddress(15 downto 13) = "000" else '1'; --8K from $0000-1FFF
	n_internalRam1CS <= '0' when ((cpuAddress(15 downto 13) = "001") or (cpuAddress(15 downto 13) = "010"))  else '1';		-- x0002-x5FFF (16KB)
	-- I/O accesses are via IN/OUT in Z80 NASCOM BASIC
	-- The address decoders get swapped when the F1 key is pressed
	n_interface1CS <= '0' when 
		((fKey1 = '0' and cpuAddress(7 downto 1) = "1000000" and (n_ioWR='0' or n_ioRD = '0')) or	-- 2 Bytes $80-$81
		 (fKey1 = '1' and cpuAddress(7 downto 1) = "1000001" and (n_ioWR='0' or n_ioRD = '0')))	-- 2 Bytes $82-$83
		else '1';
	n_interface2CS <= '0' when   
		((fKey1 = '0' and cpuAddress(7 downto 1) = "1000001" and (n_ioWR='0' or n_ioRD = '0'))	or	-- 2 Bytes $82-$83
		 (fKey1 = '1' and cpuAddress(7 downto 1) = "1000000" and (n_ioWR='0' or n_ioRD = '0')))	-- 2 Bytes $80-$81
		else '1';
	n_Latch_CS <= '0' when cpuAddress(7 downto 1) = "1000010" and (n_ioWR='0' or n_ioRD = '0') else '1';  -- $84-$85 (132-133 dec)
	
	cpuDataIn <=
		interface1DataOut when n_interface1CS = '0' else	-- UART 1
		interface2DataOut when n_interface2CS = '0' else	-- UART 2
		switchesDataout when n_Latch_CS = '0' else
		basRomData when n_basRomCS = '0' else
		ramDataOut when n_internalRam1CS = '0' else
		x"FF";
		

-- SUB-CIRCUIT CLOCK SIGNALS 
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
