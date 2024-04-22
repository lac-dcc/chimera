--	---------------------------------------------------------------------------------------------------------
-- Front Panel
-- I2C to Front Panel
--	Test code that loops back the pushbuttons to the LEDs
--	
-- http://land-boards.com/blwiki/index.php?title=Front_Panel_For_8_Bit_Computers
-- Small controller for a Front Panel
-- 32 LEDs, 32 pushbuttons
--		16 - Address LEDS/pushbuttons
--		8  - Data LEDS/pushbuttons
--		8  - Status LEDs
--		8  - Control pusbuttons
--
--	IOP16 code
--		https://github.com/douggilliland/MultiComp/tree/ANSI_Terminal_Working/MultiComp%20(VHDL%20Template)/Components/CPU/IOP16
--
-- R32V2020 assembly code example works with this same I2C controller
--		https://github.com/douggilliland/R32V2020/blob/master/Programs/Common/mcp23008.asm
--		https://github.com/douggilliland/R32V2020/blob/master/Programs/Common/i2c.asm
-- 
-- C code example I wrote for my 3 chip Z80 design (functionally similar, different i2c controller chips)
--		https://github.com/douggilliland/Retro-Computers/blob/master/Z80/PSOC/PSOC_Design_Files/Z80-PSoC-3-Chips_002/Z80_3Chip.cydsn/FrontPanel.c
--		https://github.com/douggilliland/Retro-Computers/blob/master/Z80/PSOC/PSOC_Design_Files/Z80-PSoC-3-Chips_002/Z80_3Chip.cydsn/FrontPanel.h
--	---------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity FrontPanel01_test is
	port
	(
		-- Clock and reset
		i_CLOCK_50					: in std_logic := '1';		-- Clock (50 MHz)
		i_n_reset					: in std_logic := '1';		-- Reset from Pushbutton on FPGA card
		-- The key and LED on the FPGA card
		i_key1						: in std_logic := '1';		-- KEY1 on the FPGA card
		o_UsrLed						: out std_logic := '1';		-- USR LED on the FPGA card
		--
--		o_testPts					: out std_logic_vector(5 downto 0);
		-- External I2C connections
		io_I2C_SCL					: inout std_logic := '0';	-- I2C clock to Front Panel card
		io_I2C_SDA					: inout std_logic := '1';	-- I2C data to/from Front Panel card
		i_I2C_INTn					: in std_logic := '1'		-- Interrupt input - active low
	);
	end FrontPanel01_test;

architecture struct of FrontPanel01_test is
	-- 
	signal w_resetClean_n		:	std_logic;								-- De-bounced reset button
	
	-- Pushbutton signals
	signal w_LEDsOut			:	std_logic_vector(31 downto 0);	-- Pushbutton loopback to LEDs
	signal w_PBsRaw			:	std_logic_vector(31 downto 0);	-- Pushbuttons raw input
	signal w_PBLatched		:	std_logic_vector(31 downto 0);	-- Pushbuttons latched input (de-bounced)
	signal w_PBsToggled		:	std_logic_vector(31 downto 0);	-- Pushbuttons toggled input

	-- RAM_Test
	signal w_RAMaddress_a	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	signal w_RAMaddress_b	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	signal w_RAMDataIn_a		:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal w_RAMDataIn_b		:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal w_RAMWE_a			:	std_logic;
	signal w_RAMWE_b			:	std_logic;
	signal w_RAMDataOut_a	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal w_RAMDataOut_b	:	STD_LOGIC_VECTOR (7 DOWNTO 0);

	-- Address Counter
	signal w_AddrCounter		:	std_logic_vector(15 downto 0);	-- Pushbuttons toggled input
	signal incCounter			:	std_logic;
	signal incCtrD1			:	std_logic;
	signal incCtrD2			:	std_logic;
	
begin

--	o_testPts(5) <= w_PBDelay(0);
--	o_testPts(4) <= w_debouncedPBs(0);
--	o_testPts(3) <= w_togglePinValues(0);
--	o_testPts(2) <= w_ldStrobe2;
--	o_testPts(1) <= w_loadStrobe;
--	o_testPts(0) <= '0';
	
	-- Loopback values
	debounceReset : entity work.Debouncer
		port map
		(
			i_clk				=> i_CLOCK_50,
			i_PinIn			=> i_n_reset,
			o_PinOut			=> w_resetClean_n
		);
	
	-- -------------------------------------------------------------------------------------------------------
	-- CPU Emulation starts here
	--	
	-- Pushbuttons
	-- PB31 = Run/Halt
		--		Toggle bit
	--	PB30-PB27 = Unused
	--	PB26 = INCADR - Increment address
	--		Debounced bit
	--		Stores data then increments address when in SETDAT mode
	--		Increments address when not in SETDAT mode
	--	PB25 = SETDAT
	--		Toggle bit
	--		When pressed/lit allows Data pushbuttons to change memory data
	--	PB24 = SETADR
	--		Toggle bit
	--		When pressed/lit allows Address pushbuttons to change memory address
	-- PB23-PB8 = Address
	--		Active when in SETADR mode
	--	PB7-PB0 = Data
	--		Active when in SETDAT mode
	--	
	--	LEDs
	--	LED31 = Run/Halt (on for RUN)
	--	LED26 = Off
	-- LED25 = SETDAT - On when in set data mode
	--	LED24 = SETADR - On when in set address mode
	--	LEDs23-LED8
	--		Address pushbuttons value when in SETADR mode
	--		Memory address when not in SETADR mode
	--	LEDs7-LED0
	--		Data pushbuttons value when in SETDAT mode
	--		Memory when not in SETDAT mode
	-- 
	w_LEDsOut(31)				<= w_PBsToggled(31);					-- Run/Halt LED
	w_LEDsOut(30 downto 26) <= "00000";								-- Not  used
	w_LEDsOut(25)				<= w_PBsToggled(25);					-- SETDAT
	w_LEDsOut(24)				<= w_PBsToggled(24);					-- SETADR
	
	-- PB23-PB8 - Address Lines
	w_LEDsOut(23 downto 8)	<= w_PBsToggled(23 downto 8) when w_PBsToggled(24) = '1' else
										w_AddrCounter;
	
	-- PB7-PB0 - Data Lines
	w_LEDsOut(7 downto 0)	<= w_PBsToggled(7 downto 0) when w_PBsToggled(25) = '1' else
										w_RAMDataOut_b;		

	-- 
	w_RAMaddress_a		<= '0'&x"000";
	w_RAMaddress_b		<= w_AddrCounter(12 downto 0);
	w_RAMDataIn_a		<= x"00";
	w_RAMDataIn_b		<= w_PBsToggled(7 downto 0);
	w_RAMWE_a			<= '0';
	w_RAMWE_b			<= incCounter when w_PBsToggled(25) = '1' else
								'0';
	
  progCounter : PROCESS (i_CLOCK_50)
  BEGIN
    IF rising_edge(i_CLOCK_50) THEN
      IF (w_resetClean_n = '0') THEN
        w_AddrCounter <= (OTHERS =>'0');
		ELSIF w_PBsToggled(24) = '1' then 
			w_AddrCounter <= w_PBsToggled(23 downto 8);
      ELSIF (incCounter = '1') THEN
        w_AddrCounter <= w_AddrCounter+1;
      END IF;
		incCtrD1 <= w_PBLatched(26);							-- PB26
		incCtrD2 <= incCtrD1;
		incCounter <= incCtrD1 and (not incCtrD2);		-- Edge detect
    END IF;
  END PROCESS;
  
	
	-- Front Panel RAM
	RAM_Test : work.RAM_8KB_DP
		PORT MAP
		(
			clock			=> i_CLOCK_50,
			address_a	=> w_RAMaddress_a,
			address_b	=> w_RAMaddress_b,
			data_a		=> w_RAMDataIn_a,
			data_b		=> w_RAMDataIn_b,
			wren_a		=> '0',
			wren_b		=> w_RAMWE_b,
			q_a			=> w_RAMDataOut_a,
			q_b			=> w_RAMDataOut_b
		);
		
	-- CPU Emulation ends here
	-- -------------------------------------------------------------------------------------------------------

	-- -------------------------------------------------------------------------------------------------------
	-- Front Panel starts here
	
	fp01 : work.FrontPanel01
		generic	map ( 
			INST_SRAM_SIZE_IN	=> 1024,
			STACK_DEPTH_IN		=> 4
		)
		port map
		(
			-- Clock and reset
			i_CLOCK_50			=> i_CLOCK_50,				-- Clock (50 MHz)
			i_n_reset			=> w_resetClean_n,			-- Reset
			-- 32 outs, 32 ins
			i_FPLEDs				=> w_LEDsOut,				-- Out to LEDs (32)
			o_PBRaw				=> w_PBsRaw,				-- Raw version of the  Pushbuttons (32)
			o_PBLatched			=> w_PBLatched,			-- Latched version of the  Pushbuttons (32)
			o_PBToggled			=> w_PBsToggled,			-- Toggle version of the  Pushbuttons (32)
			-- Key (pushbutton) and LED on FPGA card
			i_key1				=> i_key1,
			o_UsrLed				=> o_UsrLed,
			-- I2C interface
			io_I2C_SCL			=> io_I2C_SCL,				-- I2C clock to Front Panel card
			io_I2C_SDA			=> io_I2C_SDA,				-- I2C data to/from Front Panel card
			i_I2C_INTn			=> i_I2C_INTn				-- Interrupt input - active low
		);

	-- Front Panel ends here
	-- -------------------------------------------------------------------------------------------------------

end;
