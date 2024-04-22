-- This file is copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/    
-- and to the UK101 page at http://searle.hostei.com/grant/uk101FPGA/index.html
--
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle"
-- on the internet to see if I have moved to another web hosting service.
--
-- Grant Searle
-- eMail address available on my main web page link above.
--
-- Emard modified original UK101 glue into Orao glue
-- video module not instantiated here
-- video bus used instead.
-- to avoid routing clock
-- thru this module and vendor specific modules

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity orao is
        generic (

          ram_kb: integer := 32; -- KB RAM this computer will have
          clk_mhz : integer := 25; -- clock freq in MHz
          serial_baud : integer := 9600 -- output serial baudrate
        );
	port(
		n_reset		: in std_logic;
		clk		: in std_logic;
		clkvid		: in std_logic;
		video		: out std_logic;
		hs		: out std_logic;
		vs		: out std_logic;
		cs		: out std_logic;
		rxd		: in std_logic;
		txd		: out std_logic;
		rts		: out std_logic;
		key_b           : in std_logic;
		key_c           : in std_logic;
		key_enter       : in std_logic;
		ps2clk		: in std_logic;
		ps2data		: in std_logic
	);
end orao;

architecture struct of orao is

	signal n_WR				: std_logic;
	signal cpuAddress		: std_logic_vector(15 downto 0);
	signal cpuDataOut		: std_logic_vector(7 downto 0);
	signal cpuDataIn		: std_logic_vector(7 downto 0);

	signal basRomData		: std_logic_vector(7 downto 0);
	signal ramDataOut		: std_logic_vector(7 downto 0);
	signal monitorRomData : std_logic_vector(7 downto 0);
	signal aciaData		: std_logic_vector(7 downto 0);

	signal n_memWR			: std_logic;
	
	signal n_dispRamCS              : std_logic;
	signal n_ramCS                  : std_logic;
	signal n_basRomCS               : std_logic;
	signal n_monitorRomCS           : std_logic;
	signal n_aciaCS                 : std_logic;
	signal n_kbCS			: std_logic;
	
	signal dispAddrB                : std_logic_vector(12 downto 0);
	signal dispRamDataOutA          : std_logic_vector(7 downto 0);
	signal dispRamDataOutB          : std_logic_vector(7 downto 0);
	signal dispData                 : std_logic_vector(7 downto 0);
	signal charAddr 		: std_logic_vector(10 downto 0);
	signal charData 		: std_logic_vector(7 downto 0);
	signal videoAddr       : std_logic_vector(12 downto 0);
	signal videoData       : std_logic_vector(7 downto 0);
	signal serialClkCount: std_logic_vector(14 downto 0); 
	signal cpuClkCount	: std_logic_vector(5 downto 0); 
	signal cpuClock		: std_logic;
	signal serialClock	: std_logic;

	signal kbReadData 	: std_logic_vector(7 downto 0);
	
	signal uart_n_wr        : std_logic;
	signal uart_n_rd        : std_logic;
	
	type matrix8x8 is array (7 downto 0) of std_logic_vector(7 downto 0);
	constant test_pattern : matrix8x8 := (x"82", x"44", x"28", x"10", x"28", x"44", x"82", x"01");
	
begin

	n_memWR <= not(cpuClock) nand (not n_WR);

	-- 0x0000, 0x03FF, '0th block',
	-- 0x0400, 0x5FFF, 'user RAM (23K)',
	-- 0x6000, 0x7FFF, 'video RAM',
	-- 0x8000, 0x9FFF, 'system locations (keyboard etc.)',
	-- 0xA000, 0xAFFF, 'extension (maybe ROM cartridge)',
	-- 0xB000, 0xBFFF, 'DOS',
	-- 0xC000, 0xDFFF, 'BASIC ROM',
	-- 0xE000, 0xFFFF, 'system ROM',

	n_dispRamCS <= '0' when cpuAddress(15 downto 13) = "011" else '1'; --8k @ 0x6000
	n_basRomCS <= '0' when cpuAddress(15 downto 13) = "110" else '1'; --8k @ 0xC000
	n_monitorRomCS <= '0' when cpuAddress(15 downto 13) = "111" else '1'; --8K @ 0xE000
	n_ramCS <= '0' when conv_integer(cpuAddress(15 downto 12)) < ram_kb/4 else '1';
	n_aciaCS <= '0' when cpuAddress(15 downto 1) = "100010000000000" else '1';
	n_kbCS <= '0' when cpuAddress(15 downto 11) = "10000" else '1';
 
	cpuDataIn <=
                basRomData when n_basRomCS = '0' else
		monitorRomData when n_monitorRomCS = '0' else
		aciaData when n_aciaCS = '0' else
		ramDataOut when n_ramCS = '0' else
		kbReadData when n_kbCS='0' else
		dispRamDataOutA when n_dispRamCS = '0'
		else x"FF";
		
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
		A(23 downto 16) => open,
		A(15 downto 0) => cpuAddress,
		DI => cpuDataIn,
		DO => cpuDataOut
		);
			
	u2 : entity work.rom_bas -- 8KB
	port map(
		clk => clk,
                addr(12 downto 0) => cpuAddress(12 downto 0),
		data => basRomData
	);

	u2b : entity work.rom_crt -- 8KB
	port map(
		clk => clk,
                addr(12 downto 0) => cpuAddress(12 downto 0),
		data => monitorRomData
	);

	u3: entity work.bram_1port
	generic map(
	  C_mem_size => ram_kb
	)
	port map
	(
		clock => clk,
		rw_port_addr(15) => '0',
		rw_port_addr(14 downto 0) => cpuAddress(14 downto 0),
		rw_port_write => not(n_memWR or n_ramCS),
		rw_port_data_in => cpuDataOut,
		rw_port_data_out => ramDataOut
	);
	

        uart_n_wr <= n_aciaCS or cpuClock or n_WR;
        uart_n_rd <= n_aciaCS or cpuClock or (not n_WR);
		  
	u5: entity work.bufferedUART
	port map(
		n_wr => uart_n_wr,
		n_rd => uart_n_rd,
		regSel => cpuAddress(0),
		dataIn => cpuDataOut,
		dataOut => aciaData,
		rxClock => serialClock,
		txClock => serialClock,
		rxd => rxd,
		txd => txd,
		n_cts => '0',
		n_dcd => '0',
		n_rts => rts
	);
	
	-- clock divider for CPU and serial port
	process (clk)
	begin
		if rising_edge(clk) then
			if cpuClkCount < clk_mhz-1 then
				cpuClkCount <= cpuClkCount + 1;
			else
				cpuClkCount <= (others=>'0');
			end if;
			if cpuClkCount < clk_mhz/2-1 then
				cpuClock <= '0';
			else
				cpuClock <= '1';
			end if;	
			
			if serialClkCount < 1000000*clk_mhz/(serial_baud*16)-1 then
				serialClkCount <= serialClkCount + 1;
			else
				serialClkCount <= (others => '0');
			end if;
			if serialClkCount < 1000000*clk_mhz/(serial_baud*32)-1 then
				serialClock <= '0';
			else
				serialClock <= '1';
			end if;	
		end if;
	end process;
	
	-- test grid on screen during the reset is pressed
	videoData <= dispRamDataOutB when n_reset = '1'
	        else test_pattern(conv_integer(videoAddr(7 downto 5)));
	
	u8_generic: entity work.bram_2port
	generic map(
	  C_mem_size => 8
	)
	port map
	(
		clock => clk,
		rw_port_addr(15 downto 13) => (others => '0'),
		rw_port_addr(12 downto 0) => cpuAddress(12 downto 0),
		rw_port_write => not(n_memWR or n_dispRamCS),
		rw_port_data_in => cpuDataOut,
		rw_port_data_out => dispRamDataOutA,
		ro_port_addr(15 downto 13) => (others => '0'),
		ro_port_addr(12 downto 0) => videoAddr,
		ro_port_data_out => dispRamDataOutB
	);

	u9 : entity work.orao_keyboard_buttons
	port map(
		CLK       => clk,
		nRESET    => n_reset,
		PS2_CLK	  => ps2clk,
		PS2_DATA  => ps2data,
		key_b     => key_b,
		key_c     => key_c,
		key_enter => key_enter,
		A	  => cpuAddress(10 downto 0),
		Q	  => kbReadData
	);
	
	vga : entity work.OraoGraphDisplay8K
	port map(
		dispAddr => videoAddr,
		dispData => videoData,
		clk     => clkvid,
		video => video,
		h_sync  => hs,
		v_sync  => vs,
		sync   => cs
   );

end;
