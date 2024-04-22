-------------------------------------------------------------------------------------------
-- UK101 (OSI C1P)
-- 4K internal SRAM
-- 8K BASIC in ROM
-- CEGMON ROM
-- Composite Video output
-- PS/2 Keyboard
-------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101_4K is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		rxd			: in std_logic;
		-- Serial port
		txd			: out std_logic;
		rts			: out std_logic;
		-- Composite Video
		videoSync	: out std_logic;
		video			: out std_logic;
		-- PS/2 Keyboard
		ps2Clk		: in std_logic;
		ps2Data		: in std_logic
	);
end uk101_4K;

architecture struct of uk101_4K is

	signal n_WR					: std_logic;
	signal cpuAddress			: std_logic_vector(15 downto 0);
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);

	signal basRomData			: std_logic_vector(7 downto 0);
	signal ramDataOut			: std_logic_vector(7 downto 0);
	signal monitorRomData	: std_logic_vector(7 downto 0);
	signal aciaData			: std_logic_vector(7 downto 0);

	signal n_memWR				: std_logic;
	
	signal n_dispRamCS		: std_logic;
	signal n_ramCS				: std_logic;
	signal n_basRomCS			: std_logic;
	signal n_monRomCS			: std_logic;
	signal n_aciaCS			: std_logic;
	signal n_kbCS				: std_logic;
	
	signal dispAddrB 			: std_logic_vector(9 downto 0);
	signal dispRamDataOutA	: std_logic_vector(7 downto 0);
	signal dispRamDataOutB	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(10 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);

	signal serialClkCount	: std_logic_vector(14 downto 0); 
	signal cpuClkCount		: std_logic_vector(5 downto 0); 
	signal cpuClock			: std_logic;
	signal serialClock		: std_logic;

	signal kbReadData 		: std_logic_vector(7 downto 0);
	signal kbRowSel 			: std_logic_vector(7 downto 0);

begin

	n_memWR <= not(cpuClock) nand (not n_WR);

	n_ramCS 		<= '0' when cpuAddress(15 downto 12) = x"0"	 			else '1';	-- x0000-x0fff	4KB	SRAM
	n_basRomCS 	<= '0' when cpuAddress(15 downto 13) = "101" 			else '1';	-- xa000-xbfff	8KB 	BASIC in ROM
	n_dispRamCS <= '0' when cpuAddress(15 downto 10) = x"d"&"00" 		else '1';	-- xd000-zd3ff	1kb	Display RAM
	n_kbCS 		<= '0' when cpuAddress(15 downto 10) = x"d"&"11" 		else '1';	-- xdc00-xdfff			Keyboard
	n_aciaCS 	<= '0' when cpuAddress(15 downto 1)  = x"f00"&"000"	else '1';	-- xf000-xf001			UART
	n_monRomCS 	<= '0' when cpuAddress(15 downto 11) = x"f"&'1'			else '1';	-- xf800-xfff	2K		Monitor ROM
 
	cpuDataIn <=
		basRomData 			when n_basRomCS = '0' 		else
		monitorRomData 	when n_monRomCS = '0' 		else
		aciaData 			when n_aciaCS = '0' 			else
		ramDataOut 			when n_ramCS = '0' 			else
		dispRamDataOutA 	when n_dispRamCS = '0' 		else
		kbReadData 			when n_kbCS='0'
		else x"FF";
		
	u1 : entity work.T65
	port map(
		Enable				=> '1',
		Mode 					=> "00",
		Res_n 				=> n_reset,
		Clk 					=> cpuClock,
		Rdy 					=> '1',
		Abort_n 				=> '1',
		IRQ_n 				=> '1',
		NMI_n 				=> '1',
		SO_n 					=> '1',
		R_W_n 				=> n_WR,
		A(15 downto 0) 	=> cpuAddress(15 downto 0),
		DI 					=> cpuDataIn,
		DO 					=> cpuDataOut);
			
	u2 : entity work.BasicRom -- 8KB
	port map(
		address	=> cpuAddress(12 downto 0),
		clock 	=> clk,
		q 			=> basRomData
	);

	u3: entity work.ProgRam 
	port map
	(
		address	=> cpuAddress(11 downto 0),
		clock 	=> clk,
		data 		=> cpuDataOut,
		wren 		=> not(n_memWR or n_ramCS),
		q 			=> ramDataOut
	);
	
	u4: entity work.CegmonRom
	port map
	(
		address	=> cpuAddress(10 downto 0),
		q 			=> monitorRomData
	);

	u5: entity work.bufferedUART
	port map(
		n_wr 		=> n_aciaCS or cpuClock or n_WR,
		n_rd 		=> n_aciaCS or cpuClock or (not n_WR),
		regSel 	=> cpuAddress(0),
		dataIn 	=> cpuDataOut,
		dataOut 	=> aciaData,
		rxClock 	=> serialClock,
		txClock 	=> serialClock,
		rxd 		=> rxd,
		txd 		=> txd,
		n_cts 	=> '0',
		n_dcd 	=> '0',
		n_rts 	=> rts
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

	u6 : entity work.UK101TextDisplay
	port map (
		charAddr 	=> charAddr,
		charData 	=> charData,
		dispAddr 	=> dispAddrB,
		dispData 	=> dispRamDataOutB,
		clk 			=> clk,
		sync 			=> videoSync,
		video 		=> video
	);

	u7: entity work.CharRom
	port map
	(
		address 	=> charAddr,
		q 			=> charData
	);

	u8: entity work.DisplayRam 
	port map
	(
		address_a	=> cpuAddress(9 downto 0),
		address_b	=> dispAddrB,
		clock			=> clk,
		data_a 		=> cpuDataOut,
		data_b 		=> (others => '0'),
		wren_a 		=> not(n_memWR or n_dispRamCS),
		wren_b 		=> '0',
		q_a 			=> dispRamDataOutA,
		q_b 			=> dispRamDataOutB
	);
	
	u9 : entity work.UK101keyboard
	port map(
		CLK 		=> clk,
		nRESET 	=> n_reset,
		PS2_CLK	=> ps2Clk,
		PS2_DATA	=> ps2Data,
		A			=> kbRowSel,
		KEYB		=> kbReadData
	);
	
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			kbRowSel <= cpuDataOut;
		end if;
	end process;
	
end;
