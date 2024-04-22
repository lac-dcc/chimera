--	---------------------------------------------------------------------------------------------------------
-- Front Panel
-- http://land-boards.com/blwiki/index.php?title=Front_Panel_For_8_Bit_Computers
-- Small controller for a Front Panel
-- 32 LEDs, 32 pushbuttons
--		16 - Address LEDS/pushbuttons
--		8  - Data LEDS/pushbuttons
--		8  - Status LEDs
--		8  - Control pusbuttons

-- I2C to Front Panel
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
use ieee.numeric_std.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity FrPanelI2C is
	port
	(
		i_n_reset		: in std_logic := '1';									-- Reset pushbutton switch
		i_clk				: in std_logic := '0';									-- 50 MHz
		-- 16 bts of address, 8 bits of data, 8 status LEDs
		i_addr			: in std_logic_vector(15 downto 0) := x"0000";	
		i_data			: in std_logic_vector(7 downto 0) := x"00";
		i_status			: in std_logic_vector(7 downto 0) := x"00";
		-- 16 bts of address, 8 bits of data, 8 control pushbuttons
		-- Pushbuttons are one-shot active high signals one i_clk wide 
		o_addr			: out std_logic_vector(15 downto 0) := x"baab";
		o_data			: out std_logic_vector(7 downto 0) := x"ba";
		o_control		: out std_logic_vector(7 downto 0) := x"ab";
		-- I2C interface
		io_I2C_SCL		: inout std_logic;
		io_I2C_SDA		: inout std_logic;
		i_N_I2C_INT		: in  std_logic
	);
end FrPanelI2C;

architecture struct of FrPanelI2C is

	signal w_resetLow		: std_logic := '1';
	-- 
	signal w_i_DATA_IN	: std_logic_vector(7 downto 0) := x"5a";
	signal w_o_DATA_OUT	: std_logic_vector(7 downto 0);
	-- Latched data from panel - 32 buttons, 32 LEDs
	signal w_o_LAT_32		: std_logic_vector(31 downto 0) := x"deadbaba";
	-- Front Panel interrupt present
	signal w_fpIntD1		: std_logic;
	signal w_fpIntD2		: std_logic;
	signal w_fpIntAct		: std_logic;
	signal w_fpIntLat		: std_logic;
	signal w_fpIntClr		: std_logic := '0';
	-- I2C Counter = 400 KHz
	signal w_i2cCount		: std_logic_vector(6 downto 0);
	signal w_i2c_400KHz	: std_logic;
	-- I2C Control lines
	signal w_i2cCS1D0		: std_logic := '0';		-- Command/Data address select line
	signal w_i2cWr1Rd0	: std_logic := '0';		-- Read/Write line
	signal w_ctlDatInSel	: std_logic_vector(3 downto 0);

begin

	FrontPanelI2C : entity work.I2C
		port map(
		i_RESET		=> not i_n_reset,		-- Reset pushbutton switch
		CPU_CLK		=> i_clk,				-- 50 MHz
		i_ENA			=> w_i2c_400KHz,		-- One clock wide every 400 Khz
		i_ADRSEL		=> w_i2cCS1D0,			-- Command/Data address select line
		i_WR			=> w_i2cWr1Rd0,			-- Write strobe
		i_DATA_IN	=> w_i_DATA_IN,		-- Data to I2C interface
		o_DATA_OUT	=> w_o_DATA_OUT,		-- Data from I2C interface
		io_I2C_SCL	=> io_I2C_SCL,			-- Clock to external I2C interface
		io_I2C_SDA	=> io_I2C_SDA			-- Data to/from external I2C interface
		);

	w_i_DATA_IN <= i_data					when w_ctlDatInSel = "0000" else
						i_addr(15 downto 8)	when w_ctlDatInSel = "0001" else
						i_addr(8 downto 0)	when w_ctlDatInSel = "0010" else
						x"12"						when w_ctlDatInSel = "1000";
	
	-- 400 KHz I2C clock
	-- 50.0 MHz / 400 KHz = 125 clocks
	process (i_clk)
	begin
		if rising_edge(i_clk) then
			if w_i2cCount = "1111101" then
				w_i2cCount <= "0000000";
				w_i2c_400KHz <= '1';
			else
				w_i2cCount <= w_i2cCount + 1;
				w_i2c_400KHz <= '0';
			end if;
		end if;
	end process;

	-- Latch up interrupt from I2C card
	-- Hold until w_fpIntClr
	process (i_clk, i_N_I2C_INT)
	begin
		if rising_edge(i_clk) then
			w_fpIntD1 <= not i_N_I2C_INT;
			w_fpIntD2 <= w_fpIntD1;
		end if;
	end process;
	w_fpIntAct <= (not w_fpIntD2) and w_fpIntD2;
	process (i_clk)
	begin
		if rising_edge(i_clk) then
			w_fpIntLat <= w_fpIntAct or (w_fpIntLat and (not w_fpIntClr));
		end if;
	end process;
	
	
		
end;
