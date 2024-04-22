-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101_16K is
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

		ps2Clk		: in std_logic;
		ps2Data		: in std_logic
	);
end uk101_16K;

architecture struct of uk101_16K is

	signal n_WR				: std_logic;
	signal n_RD							: std_logic;
	signal cpuAddress		: std_logic_vector(15 downto 0);
	signal cpuDataOut		: std_logic_vector(7 downto 0);
	signal cpuDataIn		: std_logic_vector(7 downto 0);

	signal basRomData		: std_logic_vector(7 downto 0);
	signal monitorRomData : std_logic_vector(7 downto 0);
	signal aciaData		: std_logic_vector(7 downto 0);
	signal ramDataOut		: std_logic_vector(7 downto 0);
	signal ramDataOut2	: std_logic_vector(7 downto 0);
	signal ramDataOut3	: std_logic_vector(7 downto 0);

	signal n_memWR			: std_logic;
	signal n_memRD 					: std_logic :='1';
	
	signal n_basRomCS		: std_logic;
	signal n_dispRamCS	: std_logic;
	signal n_aciaCS		: std_logic;
	signal n_ramCS			: std_logic;
	signal n_ramCS2		: std_logic;
	signal n_ramCS3		: std_logic;
	signal n_monitorRomCS : std_logic;
	signal n_kbCS			: std_logic;
	
	signal dispAddrB 		: std_logic_vector(10 downto 0);
	signal dispRamDataOutA : std_logic_vector(7 downto 0);
	signal dispRamDataOutB : std_logic_vector(7 downto 0);
	signal charAddr 		: std_logic_vector(10 downto 0);
	signal charData 		: std_logic_vector(7 downto 0);

	signal serialClkCount: std_logic_vector(15 downto 0); 
	signal serialClkCount_d       : std_logic_vector(15 downto 0);
	signal serialClkEn            : std_logic;
	signal serialClock	: std_logic;
	
	signal videoClk	: std_logic;

	signal cpuClkCount	: std_logic_vector(5 downto 0); 
	signal cpuClock		: std_logic;

	signal kbReadData 	: std_logic_vector(7 downto 0);
	signal kbRowSel 		: std_logic_vector(7 downto 0);

	signal videoOut		: std_logic;
	signal hActive			: std_logic;

	signal txdBuff						: std_logic;

begin
	-- ____________________________________________________________________________________
	-- Card has 16 bits of RGB digital data
	-- Drive the least significant bits with 0's since Multi-Comp only has 6 bits of RGB digital data
	-- Drive a blue background with white text
	videoR0 <= videoOut;
	videoR1 <= videoOut;
	videoR2 <= videoOut;
	videoG0 <= videoOut;
	videoG1 <= videoOut;
	videoG2 <= videoOut;
	videoG3 <= videoOut; 
	videoB0 <= hActive;
	videoB1 <= hActive;
	videoB2 <= hActive;
	videoB3 <= hActive;
	videoB4 <= hActive;
	videoR3 <= videoOut;
	videoR4 <= videoOut;
	videoG4 <= videoOut;
	videoG5 <= videoOut;

	n_memWR <= not(cpuClock) nand (not n_WR);

	-- Chip Selects
	n_ramCS <= '0' when cpuAddress(15 downto 14)="00" else '1';					-- x0000-x3FFF (16KB)
	n_ramCS2 <= '0' when cpuAddress(15 downto 11)="01000" else '1';			-- x4000-x47FF (2KB)
	n_ramCS3 <= '0' when cpuAddress(15 downto 10)="010010" else '1';			-- x4800-x4BFF (1KB)
	n_basRomCS <= '0' when cpuAddress(15 downto 13) = "101" else '1'; 		-- xA000-xBFFF (8KB)
	n_kbCS <= '0' when cpuAddress(15 downto 10) = "110111" else '1';			-- xDC00-xDFFF (1KB)
	n_dispRamCS <= '0' when cpuAddress(15 downto 11) = "11010" else '1';		-- xD000-xD7FF (2KB)
	n_aciaCS <= '0' when cpuAddress(15 downto 1) = "111100000000000" else '1';	-- xF000-xF001 (2B)
	n_monitorRomCS <= '0' when cpuAddress(15 downto 11) = "11111" else '1'; 	-- xF800-xFFFF (2KB)
 
	cpuDataIn <=
		basRomData when n_basRomCS = '0' else
		monitorRomData when n_monitorRomCS = '0' else
		aciaData when n_aciaCS = '0' else
		ramDataOut when n_ramCS = '0' else
		ramDataOut2 when n_ramCS2 = '0' else
		ramDataOut3 when n_ramCS3 = '0' else
		dispRamDataOutA when n_dispRamCS = '0' else
		kbReadData when n_kbCS='0' else 
		x"FF";
		
	u1 : entity work.T65
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
			

	u2 : entity work.BasicRom -- 8KB
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
	
	u3a: entity work.InternalRam2K
	port map
	(
		address => cpuAddress(10 downto 0),
		clock => clk,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS2),
		q => ramDataOut2
	);
	
	u3b: entity work.InternalRam1K
	port map
	(
		address => cpuAddress(9 downto 0),
		clock => clk,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS3),
		q => ramDataOut3
	);
	
	u4: entity work.CegmonRom_Patched_64x32
	port map
	(
		address => cpuAddress(10 downto 0),
		q => monitorRomData
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

	PLL : entity work.VideoClk_SVGA_800x600
		port map (
			areset => not n_reset,
			inclk0 => clk,
			c0 => videoClk,	-- 25.6 MHz (video clock)
			c1	=> cpuClock		-- 1.0 MHz (CPU clock)
--			c2	=> ,				-- 50 MHz (logic clock)
--			c3 =>					-- 1.8432 MHz (baud rate clock)
		);

	
	u6 : entity work.UK101TextDisplay_svga_800x600
	port map (
		charAddr => charAddr,
		charData => charData,
		dispAddr => dispAddrB,
		dispData => dispRamDataOutB,
		clk => videoClk,
		vSync => vSync,
		hSync => hSync,
		video => videoOut,
		hAct => hActive
	);

	u7: entity work.CharRom
	port map
	(
		address => charAddr,
		q => charData
	);

	u8: entity work.DisplayRam2k
	port map
	(
		address_a => cpuAddress(10 downto 0),
		address_b => dispAddrB,
		clock	=> clk,
		data_a => cpuDataOut,
		data_b => (others => '0'),
		wren_a => not(n_memWR or n_dispRamCS),
		wren_b => '0',
		q_a => dispRamDataOutA,
		q_b => dispRamDataOutB
	);
	
	u9 : entity work.UK101keyboard
	port map(
		CLK => clk,
		nRESET => n_reset,
		PS2_CLK	=> ps2Clk,
		PS2_DATA	=> ps2Data,
		A	=> kbRowSel,
		KEYB	=> kbReadData
	);
	
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			kbRowSel <= cpuDataOut;
		end if;
	end process;

--	process (clk)
--	begin
--		if rising_edge(clk) then
--			if cpuClkCount < 49 then
--				cpuClkCount <= cpuClkCount + 1;
--			else
--				cpuClkCount <= (others=>'0');
--			end if;
--			if cpuClkCount < 25 then
--				cpuClock <= '0';
--			else
--				cpuClock <= '1';
--			end if;
--		end if;
--	end process;
--	
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

	baud_div: process (serialClkCount_d, serialClkCount)
		begin
			serialClkCount_d <= serialClkCount + 6;		-- 300 baud
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
