
library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101 is
	port(
		sramData 	: inout std_logic_vector(7 downto 0);
		sramAddress : out std_logic_vector(18 downto 0);
		n_sRamWE 	: out std_logic;
		n_sRamCS 	: out std_logic;
		n_sRamOE 	: out std_logic;
		
		clk			: in std_logic;
		n_reset		: in std_logic;
		fpgaRx		: in std_logic;
		fpgaTx		: out std_logic;
		fpgaRts		: out std_logic;
		fpgaCts		: in std_logic;
		
		vgaRedHi		: out std_logic;
		vgaRedLo		: out std_logic;
		vgaGrnHi		: out std_logic;
		vgaGrnLo		: out std_logic;
		vgaBluHi		: out std_logic;
		vgaBluLo		: out std_logic;
		vgaHsync		: out std_logic;
		vgaVsync		: out std_logic;
		
		reset_LED	: out std_logic;
		
		ps2Clk		: in std_logic;
		ps2Data		: in std_logic
		
--		ledOut8		: out std_logic_vector(7 downto 0);
--		J6IO8			: out std_logic_vector(7 downto 0);
--		J8IO8			: out std_logic_vector(7 downto 0)
	);
end uk101;

architecture struct of uk101 is

	signal n_WR					: std_logic;
	signal cpuAddress			: std_logic_vector(15 downto 0);
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);

	signal basRomData			: std_logic_vector(7 downto 0);
	signal ramDataOut			: std_logic_vector(7 downto 0);
	signal monitorRomData 	: std_logic_vector(7 downto 0);
	signal aciaData			: std_logic_vector(7 downto 0);

	signal n_memWR				: std_logic;
	signal n_memRD 			: std_logic;
--	signal sramData			: std_logic_vector(7 downto 0);

	signal n_dispRamCS		: std_logic;
	signal n_ramCS				: std_logic;
	signal n_basRomCS			: std_logic;
	signal n_monitorRomCS 	: std_logic;
	signal n_aciaCS			: std_logic;
	signal n_kbCS				: std_logic;
	signal n_J6IOCS			: std_logic :='1';
	signal n_J8IOCS			: std_logic :='1';
	signal n_LEDCS				: std_logic :='1';
		
--	signal CLOCK_100		: std_ulogic;
--	signal CLOCK_50		: std_ulogic;
	signal Video_Clk_25p6		: std_ulogic;
	signal VoutVect		: std_logic_vector(2 downto 0);

	signal dispAddrB 			: std_logic_vector(9 downto 0);
	signal dispRamDataOutA 	: std_logic_vector(7 downto 0);
	signal dispRamDataOutB 	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(10 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);

	signal serialClkCount	: std_logic_vector(14 downto 0); 
	signal cpuClkCount		: std_logic_vector(5 downto 0); 
	signal cpuClock			: std_logic;
	signal serialClock		: std_logic;

	signal kbReadData 		: std_logic_vector(7 downto 0);
	signal kbRowSel 			: std_logic_vector(7 downto 0);

begin

	-- External SRAM
	sramAddress(15 downto 0) <= cpuAddress(15 downto 0);
	sramAddress(16) <= '0';
	sramAddress(17) <= '0';
	sramAddress(18) <= '0';
	sramData <= cpuDataOut when n_WR='0' else (others => 'Z');
	n_sRamWE <= n_memWR;
	n_sRamOE <= n_memRD;
	n_sRamCS <= n_ramCS;
	n_memRD <= not(cpuClock) nand n_WR;
	n_memWR <= not(cpuClock) nand (not n_WR);
	
	reset_LED <= n_reset;

	n_dispRamCS <= '0' when cpuAddress(15 downto 11) = "11010" else '1';
	n_basRomCS <= '0' when cpuAddress(15 downto 13) = "101" else '1'; --8k
	n_monitorRomCS <= '0' when cpuAddress(15 downto 11) = "11111" else '1'; --2K
	n_aciaCS <= '0' when cpuAddress(15 downto 1) = "111100000000000" else '1';
	n_kbCS <= '0' when cpuAddress(15 downto 10) = "110111" else '1';
	n_ramCS <= '0' when ((cpuAddress(15) = '0') or (cpuAddress(15 downto 13) = "100")) else '1';  			-- x0000-x7fff (32KB)
	
	cpuDataIn <=
		basRomData when n_basRomCS = '0' else
		monitorRomData when n_monitorRomCS = '0' else
		aciaData when n_aciaCS = '0' else
		dispRamDataOutA when n_dispRamCS = '0' else
		kbReadData when n_kbCS='0' else
		sramData when n_ramCS = '0' else 
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
	
--	SRAM_4K : entity work.InternalRam4K
--	port map
--	(
--		address => cpuAddress(11 downto 0),
--		clock =>  clk,
--		data => cpuDataOut,
--		wren => not(n_memWR or n_ramCS),
--		q => sramData
--	);

	u4: entity work.CegmonRom_Patched_64x32
	port map
	(
		address => cpuAddress(10 downto 0),
		q => monitorRomData
	);

	u5: entity work.bufferedUART
	port map(
		n_wr => n_aciaCS or cpuClock or n_WR,
		n_rd => n_aciaCS or cpuClock or (not n_WR),
		regSel => cpuAddress(0),
		dataIn => cpuDataOut,
		dataOut => aciaData,
		rxClock => serialClock,
		txClock => serialClock,
		rxd => fpgaRx,
		txd => fpgaTx,
		n_cts => fpgaCts,
		n_dcd => '0',
		n_rts => fpgaRts
	);

	process (clk)
	begin
		if rising_edge(clk) then
			if cpuClkCount < 50 then
				cpuClkCount <= cpuClkCount + 1;
			else
				cpuClkCount <= (others=>'0');
			end if;
			if cpuClkCount < 25 then
				cpuClock <= '0';
			else
				cpuClock <= '1';
			end if;	
			
--			if serialClkCount < 10416 then -- 300 baud
			if serialClkCount < 325 then -- 9600 baud
				serialClkCount <= serialClkCount + 1;
			else
				serialClkCount <= (others => '0');
			end if;
--			if serialClkCount < 5208 then -- 300 baud
			if serialClkCount < 162 then -- 9600 baud
				serialClock <= '0';
			else
				serialClock <= '1';
			end if;	
		end if;
	end process;

	pll : work.VideoClk_XVGA_1024x768 PORT MAP (
		inclk0	 => clk,
		c0	 => Video_Clk_25p6		-- 25.600000
--		c1	 => cpuClock,			-- 1 MHz CPU clock
--		c2	 => CLOCK_50			-- Logic Clock
	);
	
	vgaRedHi	<= VoutVect(2);	-- red upper
	vgaRedLo	<= VoutVect(2);
	vgaGrnHi	<= VoutVect(1);
	vgaGrnLo	<= VoutVect(1);
	vgaBluHi	<= VoutVect(0);
	vgaBluLo	<= VoutVect(0);
		
	vga : entity work.Mem_Mapped_XVGA
	port map (
		n_reset		=> n_reset,
		Video_Clk 	=> Video_Clk_25p6,
		CLK_50		=> clk,
		n_dispRamCS	=> n_dispRamCS,
		n_memWR		=> n_memWR,
		cpuAddress	=> cpuAddress(10 downto 0),
		cpuDataOut	=> cpuDataOut,
		dataOut		=> dispRamDataOutA,
		VoutVect		=> VoutVect,
		hSync			=> vgaHsync,
		vSync			=> vgaVsync
	);
	
--latchIO0 : entity work.OUT_LATCH	--Output LatchIO
--port map(
--	clear => n_reset,
--	clock => clk,
--	load => n_J6IOCS,
--	dataIn8 => cpuDataOut,
--	latchOut => J6IO8
--);
--
--latchIO1 : entity work.OUT_LATCH	--Output LatchIO
--port map(
--	clear => n_reset,
--	clock => clk,
--	load => n_J8IOCS,
--	dataIn8 => cpuDataOut,
--	latchOut => J8IO8
--);
--
--latchLED : entity work.OUT_LATCH	--Output LatchIO
--port map(
--	clear => n_reset,
--	clock => clk,
--	load => n_LEDCS,
--	dataIn8 => cpuDataOut,
--	latchOut => ledOut8
--);

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
	
end;
