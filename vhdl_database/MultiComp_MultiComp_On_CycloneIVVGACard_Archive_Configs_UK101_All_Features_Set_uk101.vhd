-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity uk101 is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;

		VoutVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
		
		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1			: out std_logic;
		LED2			: out std_logic;
		LED3			: out std_logic;
		LED4			: out std_logic;

		BUZZER		: out std_logic;

		ps2Clk		: in std_logic;
		ps2Data		: in std_logic;
		
		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0)

		);
end uk101;


architecture struct of uk101 is

	signal n_WR				: std_logic;
	signal n_RD				: std_logic;
	signal cpuAddress		: std_logic_vector(15 downto 0);
	signal cpuDataOut		: std_logic_vector(7 downto 0);
	signal cpuDataIn		: std_logic_vector(7 downto 0);

	signal counterOut			: std_logic_vector(27 downto 0);
	signal buzz					: std_logic;

	signal basRomData		: std_logic_vector(7 downto 0);
	signal monitorRomData : std_logic_vector(7 downto 0);
	signal aciaData		: std_logic_vector(7 downto 0);
	signal ramDataOut		: std_logic_vector(7 downto 0);
	signal ramDataOut2	: std_logic_vector(7 downto 0);
	signal ramDataOut3	: std_logic_vector(7 downto 0);
	signal ramDataOut4	: std_logic_vector(7 downto 0);

	signal n_memWR			: std_logic;
	signal n_memRD 		: std_logic :='1';
	
	signal n_basRomCS		: std_logic;
	signal n_dispRamCS	: std_logic;
	signal n_aciaCS		: std_logic;
	signal n_ramCS			: std_logic;
	signal n_ramCS2		: std_logic;
	signal n_ramCS3		: std_logic;
	signal n_ramCS4		: std_logic;
	signal n_monitorRomCS : std_logic;
	signal n_kbCS			: std_logic;
	signal n_IOCS						: std_logic :='1';
	signal n_IOCS_Write				: std_logic :='1';
	signal n_IOCS_Read 				: std_logic :='1';
	
	signal latchedBits				: std_logic_vector(7 downto 0);
	signal switchesRead			 	: std_logic_vector(7 downto 0);

	signal dispAddrB 		: std_logic_vector(10 downto 0);
	signal dispRamDataOutA : std_logic_vector(7 downto 0);
	signal dispRamDataOutB : std_logic_vector(7 downto 0);
	signal charAddr 		: std_logic_vector(10 downto 0);
	signal charData 		: std_logic_vector(7 downto 0);
	signal video			: std_logic;
	signal hSync			: std_logic;
	signal vSync			: std_logic;

	signal serialClkCount: std_logic_vector(15 downto 0); 
	signal serialClkCount_d       : std_logic_vector(15 downto 0);
	signal serialClkEn            : std_logic;
	signal serialClock	: std_logic;
	
	signal CLOCK_100		: std_ulogic;
	signal CLOCK_50		: std_ulogic;
	signal Video_Clk_25p6		: std_ulogic;

	signal cpuClkCount	: std_logic_vector(5 downto 0); 
	signal cpuClock		: std_logic;

	signal kbReadData 	: std_logic_vector(7 downto 0);
	signal kbRowSel 		: std_logic_vector(7 downto 0);

	signal videoOut		: std_logic;

	signal txdBuff			: std_logic;


begin

	n_memWR <= not(cpuClock) nand (not n_WR);

	-- Chip Selects (Full decode for non power of two assignments)
	n_ramCS <= '0'  when cpuAddress >= "0000000000000000" and cpuAddress < "0010010000000000" else '1';  -- x0000-x23FF (9KB)
	n_ramCS2 <= '0' when cpuAddress >= "0010010000000000" and cpuAddress < "0100100000000000" else '1';  -- x2400-x47FF (9KB)
	n_ramCS3 <= '0' when cpuAddress >= "0100100000000000" and cpuAddress < "0101000000000000" else '1';  -- x4800-x4FFF (2KB)
	n_ramCS4 <= '0' when cpuAddress >= "0101000000000000" and cpuAddress < "0101010000000000" else '1';  -- x5000-x53FF (1KB)
	n_basRomCS <= '0' when cpuAddress(15 downto 13) = "101" else '1'; 		-- xA000-xBFFF (8KB)
	n_kbCS <= '0' when cpuAddress(15 downto 10) = "110111" else '1';			-- xDC00-xDFFF (1KB)
	n_dispRamCS <= '0' when cpuAddress(15 downto 11) = "11010" else '1';		-- xD000-xD7FF (2KB)
	n_aciaCS <= '0' when cpuAddress(15 downto 1) = "111100000000000"  else '1';	-- xF000-xF001 (2B)
	n_IOCS   <= '0' when cpuAddress(15 downto 0) = "1111111111010100" else '1'; -- 1 byte FFD4 (65492 dec)
	n_IOCS_Write <= n_memWR or n_IOCS;
	n_IOCS_Read <= not n_memWR or n_IOCS;
	n_monitorRomCS <= '0' when cpuAddress(15 downto 11) = "11111" else '1'; 	-- xF800-xFFFF (2KB)
 
 	switchesRead(7 downto 0) <= "00000"&switch2&switch1&switch0;

	cpuDataIn <=
		aciaData when n_aciaCS = '0' else
		ramDataOut when n_ramCS = '0' else
		ramDataOut2 when n_ramCS2 = '0' else
		ramDataOut3 when n_ramCS3 = '0' else
		ramDataOut4 when n_ramCS4 = '0' else
		switchesRead when n_IOCS_Read = '0' else
		dispRamDataOutA when n_dispRamCS = '0' else
		basRomData when n_basRomCS = '0' else
		kbReadData when n_kbCS='0' else 
		monitorRomData when n_monitorRomCS = '0' else		-- has to be after any I/O
		x"FF";
		
	SevenSeg : entity work.Loadable_7S4D_LED
    port map(
		clock_50Mhz => CLOCK_50,
      reset => not n_reset,
		displayed_number => "1101111010101101",
		Anode_Activate => Anode_Activate,
      LED_out => LED_out
		);
				
	io3: entity work.OutLatch
		port map (
			dataIn8 => cpuDataOut,
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

--	buzz <= latchedBits(4) and counterOut(16);	-- Single buzz sound
	BUZZER <= (												-- 4+ tones
		(latchedBits(4) and counterOut(13)) or 
		(latchedBits(5) and counterOut(14)) or 
		(latchedBits(6) and counterOut(15)) or 
		(latchedBits(7) and counterOut(16)));
	
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
		clock => CLOCK_50,
		q => basRomData
	);


--	u3: entity work.InternalRam16K 
--	port map
--	(
--		address => cpuAddress(13 downto 0),
--		clock => clk,
--		data => cpuDataOut,
--		wren => not(n_memWR or n_ramCS),
--		q => ramDataOut
--	);

	u3a: entity work.InternalRam2K
	port map
	(
		address => cpuAddress(10 downto 0),
		clock => CLOCK_50,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS3),
		q => ramDataOut3
	);

	
	u3d: entity work.InternalRam1K
	port map
	(
		address => cpuAddress(9 downto 0),
		clock => CLOCK_50,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS4),
		q => ramDataOut4
	);


	u3b: entity work.R9
	port map
	(
		address => cpuAddress(13 downto 0),
		clock => CLOCK_50,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS),
		q => ramDataOut
	);


	u3c: entity work.R9b
	port map
	(
		address => cpuAddress(14 downto 0),
		clock => CLOCK_50,
		data => cpuDataOut,
		wren => not(n_memWR or n_ramCS2),
		q => ramDataOut2
	);


	u4: entity work.CegmonRom_Patched_64x32
	port map
	(
		address => cpuAddress(10 downto 0),
		q => monitorRomData
	);


	UART : entity work.bufferedUART
		port map(
			clk => CLOCK_50,
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

	-- ____________________________________________________________________________________
	-- Clocks
pll : work.VideoClk_SVGA_800x600 PORT MAP (
		inclk0	 => clk,
		c0	 => Video_Clk_25p6,	-- 25.6 MHz Video Clock
		c1	 => cpuClock,			-- 1 MHz CPU clock
		c2	 => CLOCK_50			-- Logic Clock
--		c3 => baudRate_1p432		-- 1.8432 MHz baud rate clk
	);
	

	u6 : entity work.UK101TextDisplay_svga_800x600
	port map (
		charAddr => charAddr,
		charData => charData,
		dispAddr => dispAddrB,
		dispData => dispRamDataOutB,
		clk => Video_Clk_25p6,
		video => video,
		vSync => vSync,
		hSync => hSync
	);
	
	VoutVect <=	video&video&video&video&video&			-- Red
					video&video&video&video&video&video&	-- Grn
					"00000"&											-- Blu
					hSync&vSync;
	
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
		clock	=> CLOCK_50,
		data_a => cpuDataOut,
		data_b => (others => '0'),
		wren_a => not(n_memWR or n_dispRamCS),
		wren_b => '0',
		q_a => dispRamDataOutA,
		q_b => dispRamDataOutB
	);
	
	u9 : entity work.UK101keyboard
	port map(
		CLK => CLOCK_50,
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
	baud_clk: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
					serialClkCount <= serialClkCount_d;
				if serialClkCount(15) = '0' and serialClkCount_d(15) = '1' then
					serialClkEn <= '1';
				else
					serialClkEn <= '0';
				end if;
        end if;
    end process;

end;
