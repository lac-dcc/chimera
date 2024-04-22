-- Grant Searle's Multicomp:
-- http://searle.hostei.com/grant/

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity M6502_VGA is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;
		
		videoRed		: out std_logic_vector(4 downto 0);
		videoGrn		: out std_logic_vector(5 downto 0);
		videoBlu		: out std_logic_vector(4 downto 0);
		hSync		: out std_logic;
		vSync		: out std_logic;
		
		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1		: out std_logic;
		LED2		: out std_logic;
		LED3		: out std_logic;
		LED4		: out std_logic;

		BUZZER		: out std_logic;

		ps2Clk		: inout std_logic;
		ps2Data		: inout std_logic
	);
end M6502_VGA;

architecture struct of M6502_VGA is

	signal n_WR					: std_logic;
	signal n_RD					: std_logic;
	signal cpuAddress			: std_logic_vector(15 downto 0);
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);
	
	signal counterOut			: std_logic_vector(27 downto 0);
	signal buzz					: std_logic;

	signal basRomData			: std_logic_vector(7 downto 0);
	signal interface1DataOut	: std_logic_vector(7 downto 0);
	signal aciaData			: std_logic_vector(7 downto 0);
	signal ramDataOut			: std_logic_vector(7 downto 0);
	
	signal n_memWR				: std_logic;
	
	signal n_basRomCS					: std_logic :='1';
	signal n_videoInterfaceCS		: std_logic :='1';
	signal n_ramCS						: std_logic :='1';
	signal n_aciaCS					: std_logic :='1';
	signal n_IOCS						: std_logic :='1';
	signal n_IOCS_Write				: std_logic :='1';
	signal n_IOCS_Read 				: std_logic :='1';
	
	signal serialClkCount			: std_logic_vector(15 downto 0);
	signal serialClkCount_d       : std_logic_vector(15 downto 0);
	signal serialClkEn            : std_logic;
	signal serialClock				: std_logic;

	signal cpuClkCount				: std_logic_vector(5 downto 0); 
	signal cpuClock					: std_logic;
	
	signal latchedBits				: std_logic_vector(7 downto 0);
	signal switchesRead			 	: std_logic_vector(7 downto 0);
	signal fKey1						: std_logic;
	signal fKey2						: std_logic;
	signal funKeys						: std_logic_vector(12 downto 0);

	signal txdBuff						: std_logic;
	
	signal videoVec					: std_logic_vector(5 downto 0);

begin
	-- ____________________________________________________________________________________
	-- Card has 16 bits of RGB digital data
	videoRed <= videoVec(5) & videoVec(5) & videoVec(4) & videoVec(4) & videoVec(4);
	videoGrn <= videoVec(3) & videoVec(3) & videoVec(2) & videoVec(2) & videoVec(2) & videoVec(2);
	videoBlu <= videoVec(1) & videoVec(1) & videoVec(0) & videoVec(0) & videoVec(0);

	LED1 <= latchedBits(0);
	LED2 <= fKey1;
	LED3 <= txdBuff;
	LED4 <= rxd;
	txd <= txdBuff;
	
	switchesRead(7 downto 0) <= "00000"&switch2&switch1&switch0;
	
	-- Chip Selects
	n_ramCS 					<= '0' when cpuAddress(15 downto 14)="00" else '1';					-- x0000-x3FFF (16KB)
	n_basRomCS 				<= '0' when cpuAddress(15 downto 13) = "111" else '1'; 		-- xA000-xBFFF (8KB)
	n_videoInterfaceCS 	<= '0' when ((cpuAddress(15 downto 1) = "111111111101000" and fKey1 = '0') or (cpuAddress(15 downto 1) = "111111111101001" and fKey1 = '1')) else '1';
	n_aciaCS 				<= '0' when ((cpuAddress(15 downto 1) = "111111111101001" and fKey1 = '0') or (cpuAddress(15 downto 1) = "111111111101000" and fKey1 = '1')) else '1';
	n_IOCS 					<= '0' when cpuAddress(15 downto 0) = "1111111111010100" else '1'; -- 1 byte FFD4 (65492 dec)
	n_IOCS_Write 			<= n_memWR or n_IOCS;
	n_IOCS_Read 			<= not n_memWR or n_IOCS;
	n_memWR 					<= not(cpuClock) nand (not n_WR);
 
	cpuDataIn <=
		interface1DataOut when n_videoInterfaceCS = '0'	else
		aciaData 			when n_aciaCS = '0' 				else
		switchesRead 		when n_IOCS_Read = '0' 			else
		basRomData 			when n_basRomCS = '0' 			else
		ramDataOut 			when n_ramCS = '0' 				else
		x"FF";
		
	cpu : entity work.T65
	port map(
		Enable => '1',
		Mode => "00",
		Res_n => n_reset,
		Clk => cpuClock,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => '1',
		SO_n => '1',
		R_W_n => n_WR,
		A(15 downto 0) => cpuAddress,
		DI => cpuDataIn,
		DO => cpuDataOut);
			

	rom : entity work.M6502_BASIC_ROM -- 8KB
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
		wren => not(n_memWR or n_ramCS),
		q => ramDataOut
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
		videoR1 => videoVec(5),
		videoR0 => videoVec(4),
		videoG1 => videoVec(3),
		videoG0 => videoVec(2),
		videoB1 => videoVec(1),
		videoB0 => videoVec(0),

		n_wr => n_videoInterfaceCS or cpuClock or n_WR,
		n_rd => n_videoInterfaceCS or cpuClock or (not n_WR),
--		n_int => n_int1,
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
		
	io3: entity work.OutLatch
		port map (
			dataIn => cpuDataOut,
			clock => clk,
			load => n_IOCS_Write,
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

	baud_div: process (serialClkCount_d, serialClkCount, fKey2)
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
