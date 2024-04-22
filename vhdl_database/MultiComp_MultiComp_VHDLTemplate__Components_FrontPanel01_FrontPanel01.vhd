--	---------------------------------------------------------------------------------------------------------
-- Front Panel
-- I2C to Front Panel
-- 
-- http://land-boards.com/blwiki/index.php?title=Front_Panel_For_8_Bit_Computers
-- Small controller for a Front Panel
-- 32 LEDs, 32 pushbuttons
--		16 - Address LEDS/pushbuttons
--		8  - Data LEDS/pushbuttons
--		8  - Status LEDs
--		8  - Control pusbuttons

-- R32V2020 assembly code example works with this same I2C controller
--		https://github.com/douggilliland/R32V2020/blob/master/Programs/Common/mcp23008.asm
--		https://github.com/douggilliland/R32V2020/blob/master/Programs/Common/i2c.asm
-- 
-- C code example for my 3 chip Z80 design (functionally similar, different i2c controller chips)
--		https://github.com/douggilliland/Retro-Computers/blob/master/Z80/PSOC/PSOC_Design_Files/Z80-PSoC-3-Chips_002/Z80_3Chip.cydsn/FrontPanel.c
--		https://github.com/douggilliland/Retro-Computers/blob/master/Z80/PSOC/PSOC_Design_Files/Z80-PSoC-3-Chips_002/Z80_3Chip.cydsn/FrontPanel.h
--	---------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity FrontPanel01 is
	generic 
	(
		constant INST_ROM_SIZE_IN 	: integer;	-- Legal Values are 256, 512, 1024, 2048, 4096
		constant STACK_DEPTH_IN			: integer	-- Legal Values are 0 (none), 1 (single), > 1
	);
	port
	(
	-- Clock and reset
	i_CLOCK_50					: in std_logic := '1';
	i_n_reset					: in std_logic := '1';
	-- 32 LEDs(outs), 32 Pushbuttons (ins)
	i_FPLEDs						: in std_logic_vector(31 downto 0);
	o_PBRaw						: out std_logic_vector(31 downto 0);
	o_PBLatched					: out std_logic_vector(31 downto 0);
	o_PBToggled					: out std_logic_vector(31 downto 0);
--		o_scanStrobe				: out std_logic := '1';
	-- The key and LED on the FPGA card
	i_key1						: in std_logic := '1';
	o_UsrLed						: out std_logic := '1';
	-- External I2C connections
	io_I2C_SCL					: inout std_logic;
	io_I2C_SDA					: inout std_logic := '1';
	i_I2C_INTn					: in std_logic := '1'
);
end FrontPanel01;

architecture struct of FrontPanel01 is
	-- 
	signal w_PERIP_DATA_IN	 	:	std_logic_vector(7 downto 0);
	signal w_PERIP_DATA_OUT	 	:	std_logic_vector(7 downto 0);
	signal w_I2C_RD_DATA 		:	std_logic_vector(7 downto 0);
	signal w_periphAdr 			:	std_logic_vector(7 downto 0);
	signal w_I2CWR					:	std_logic := '0';
	signal w_periphWr				:	std_logic := '0';
	signal w_periphRd				:	std_logic := '0';
	-- I2C Counter = 400 KHz
	signal w_i2cCount				: std_logic_vector(4 downto 0);
	signal w_i2c_400KHz			: std_logic;
	-- Strobe Pushbuttons
	signal w_strPBDataUU			: std_logic;
	signal w_strPBDataUM			: std_logic;
	signal w_strPBDataLM			: std_logic;
	signal w_strPBDataLL			: std_logic;
	signal w_LED					: std_logic;
	signal w_LatLED				: std_logic;
	-- Front Panel Control lines
	signal w_scanStrobe			:	std_logic;		-- Signals that a pushbutton was pressed
	signal w_loadStrobe			:	std_logic;		-- Latch up pushbuttons
	signal w_ldStrobe2			:	std_logic;		-- Signals that a  new toggle data value is present
	-- Front Panel pushbutton latches
	signal w_rawPBs			 	:	std_logic_vector(31 downto 0);		-- Pushbuttons raw input
	signal w_latchedPBs		 	:	std_logic_vector(31 downto 0);		-- Pushbuttons latched every frame
	signal w_PBDelay			 	:	std_logic_vector(31 downto 0);		-- Pushbuttons
	signal w_debouncedPBs		:	std_logic_vector(31 downto 0);		-- Pushbuttons
	signal w_togglePinValues	:	std_logic_vector(31 downto 0);		-- Toggled pin values

	attribute syn_keep: boolean;
	attribute syn_keep of w_rawPBs		:	signal is true;
	attribute syn_keep of w_loadStrobe	:	signal is true;
	attribute syn_keep of w_latchedPBs	:	signal is true;

begin

	-- I/O Processor
	-- Memory Map
	-- Address, R/W, Descr
	-- x00, R, Pushbuttons(31..24)
	-- x01, R, Pushbuttons(23..16)
	-- x02, R, Pushbuttons(15..8)
	-- x03, R, Pushbuttons(7..0)
	-- x04-x5, R, I2C I/F
	-- 	x04 - I2C Read Data
	-- 	x05 - I2C Status
	--	0x06. R, I2C Interript
	-- x00, W, LEDs(31..24)
	-- x01, W, LEDs(23..16)
	-- x02, W, LEDs(15..8)
	-- x03, W, LEDs(7..0)
	-- x04-x5, W, I2C I/F
	-- 	x04 - I2C Write Data
	-- 	x05 - I2C Command
	cpu : ENTITY work.cpu_001
	generic map (
		INST_ROM_SIZE_PASS	=> INST_ROM_SIZE_IN,
		STACK_DEPTH_PASS		=> STACK_DEPTH_IN
	)
	PORT map (
		i_clock					=> i_CLOCK_50,			-- 50 MHz
		i_resetN					=> i_n_reset,			-- reset
		--
		o_peripAddr				=> w_periphAdr,
		i_peripDataToCPU		=> w_PERIP_DATA_IN,
		o_peripWr				=> w_periphWr,
		o_peripRd				=> w_periphRd,
		o_peripDataFromCPU	=> w_PERIP_DATA_OUT
	);

	-- External I2c Interface
	i2cIF	: entity work.i2c
	port map (
		i_RESET			=> not i_n_reset,		-- Reset pushbutton switch
		i_CLK				=> i_CLOCK_50,			-- 50 MHz
		i_ENA				=> w_i2c_400KHz,		-- One CPU clock wide every 400 Khz
		i_ADRSEL			=> w_periphAdr(0),	-- Command/Data address select line
		i_DATA_IN		=> w_PERIP_DATA_OUT,	-- Data to I2C interface
		o_DATA_OUT		=> w_I2C_RD_DATA,		-- Data from I2C interface
		i_WR				=> w_I2CWR,				-- Write str
		io_I2C_SCL		=> io_I2C_SCL,			-- Clock to external I2C interface
		io_I2C_SDA		=> io_I2C_SDA			-- Data to/from external I2C interface
	);
		
		
	o_PBRaw		<= w_rawPBs;
	o_PBLatched	<= w_latchedPBs;
	o_PBToggled	<= w_togglePinValues;
	
	-- Latch the pushbuttons when scanStrobe goes active
	w_latchedPBs <= w_rawPBs when w_scanStrobe = '1';

	-- Delay the debounced pushbuttons - needed for edge detect
	process (i_CLOCK_50, w_loadStrobe)
	begin
		if rising_edge(i_CLOCK_50) then
			if  w_loadStrobe = '1' then
				w_PBDelay <= w_debouncedPBs;
			elsif w_ldStrobe2 = '1' then
				w_PBDelay <= (others => '0');
			end if;
			w_ldStrobe2 <= w_loadStrobe;
		end if;
	end process;

	-- Latch the toggle value
	process (i_CLOCK_50, w_loadStrobe)
	begin
		if rising_edge(i_CLOCK_50) then
			if  w_loadStrobe = '1' then
				w_togglePinValues <= w_togglePinValues xor w_debouncedPBs xor w_PBDelay;
			end if;
		end if;
	end process;
	
	debouncePBS : entity work.Debouncer32
		port map
		(
			i_slowClk		=> w_scanStrobe,
			i_fastClk		=> i_CLOCK_50,
			i_PinsIn			=> w_latchedPBs,
			o_LdStrobe		=> w_loadStrobe,
			o_PinsOut		=> w_debouncedPBs
		);

	-- Write from the IOP16 to the LEDs
	process (i_CLOCK_50)
	begin
		if rising_edge(i_CLOCK_50) then
			if w_strPBDataUU = '1' then
				w_rawPBs(31 downto 24)<= w_PERIP_DATA_OUT;
			end if;
			if w_strPBDataUM = '1' then
				w_rawPBs(23 downto 16) <= w_PERIP_DATA_OUT;
			end if;
			if w_strPBDataLM = '1' then
				w_rawPBs(15 downto 8) <= w_PERIP_DATA_OUT;
			end if;
			if w_strPBDataLL = '1' then
				w_rawPBs(7 downto 00) <= w_PERIP_DATA_OUT;
			end if;
		end if;
	end process;
	
	-- Write data strobes
	w_strPBDataUU	<= '1' when ((w_periphWr = '1') and (w_periphAdr = x"00")) else '0';
	w_strPBDataUM	<= '1' when ((w_periphWr = '1') and (w_periphAdr = x"01")) else '0';
	w_strPBDataLM	<= '1' when ((w_periphWr = '1') and (w_periphAdr = x"02")) else '0';
	w_strPBDataLL 	<= '1' when ((w_periphWr = '1') and (w_periphAdr = x"03")) else '0';
	w_I2CWR 			<= '1' when  (w_periphWr = '1') and (w_periphAdr(7 downto 1) = x"0"&"010") else '0';
	w_scanStrobe	<= '1' when ((w_periphWr = '1') and (w_periphAdr = x"06")) else '0';

	w_LED <= '1' when ((w_periphWr = '1') and (w_periphAdr = x"07")) else '0';
	process (i_CLOCK_50, w_LED)
	begin
		if rising_edge(i_CLOCK_50) then
			if  w_LED = '1' then
				o_UsrLed <= w_PERIP_DATA_OUT(0);
			end if;
		end if;
	end process;

	-- Read data mux
	w_PERIP_DATA_IN <=	i_FPLEDs(31 downto 24)	when (w_periphAdr = x"00") else
								i_FPLEDs(23 downto 16)	when (w_periphAdr = x"01") else
								i_FPLEDs(15 downto 8)	when (w_periphAdr = x"02") else
								i_FPLEDs(7 downto 0)		when (w_periphAdr = x"03") else
								w_I2C_RD_DATA 						when (w_periphAdr(7 downto 1) = x"0"&"010") else
								"0000000"&(not i_I2C_INTn)		when (w_periphAdr = x"06") else
								"0000000"&i_key1					when (w_periphAdr = x"07") else
								x"00";
	
	-- 4x400 KHz I2C clock
	-- 50.0 MHz / 1.6 MHz = 32 clocks
	process (i_CLOCK_50)
	begin
		if rising_edge(i_CLOCK_50) then
			if w_i2cCount = "11111" then
				w_i2cCount <= "00000";
				w_i2c_400KHz <= '1';
			else
				w_i2cCount <= w_i2cCount + 1;
				w_i2c_400KHz <= '0';
			end if;
		end if;
	end process;

end;
