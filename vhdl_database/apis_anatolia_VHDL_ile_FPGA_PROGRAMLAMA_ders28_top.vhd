----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Mehmet Burak AYKENAR
-- 
-- Create Date: 07/03/2019 09:03:50 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY TOP IS
GENERIC (
CLKFREQ		: INTEGER := 100_000_000;
I2C_BUS_CLK	: INTEGER := 400_000;
DEVICE_ADDR	: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001011"
);
PORT ( 
CLK 	: IN STD_LOGIC;
RST_N 	: IN STD_LOGIC;
SDA 	: INOUT STD_LOGIC;
SCL 	: INOUT STD_LOGIC;
TX 		: OUT STD_LOGIC;
LED 	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
);
END TOP;

architecture Behavioral of top is

COMPONENT ADT7420 IS
GENERIC (
	CLKFREQ			: INTEGER := 100_000_000;
	I2C_BUS_CLK		: INTEGER := 400_000;
	DEVICE_ADDR		: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001011"
);
PORT ( 
	CLK 			: IN STD_LOGIC;
	RST_N 			: IN STD_LOGIC;
	SCL 			: INOUT STD_LOGIC;
	SDA 			: INOUT STD_LOGIC;
	INTERRUPT 		: OUT STD_LOGIC;
	TEMP 			: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
);
END COMPONENT;

COMPONENT UART_TX IS
GENERIC (
CLK_FREQ			: INTEGER := 100_000_000;
BAUD				: INTEGER := 115_200;
DBIT				: INTEGER := 8;
SB_TICK				: INTEGER := 2
);
PORT (
CLK					: IN STD_LOGIC;
TX_START			: IN STD_LOGIC;
DIN					: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
TX_DONE_TICK		: OUT STD_LOGIC;
TX					: OUT STD_LOGIC
);
END COMPONENT;

-- UART_TX signals
signal TX_START 	: std_logic := '0';
signal TX_DONE_TICK : std_logic := '0';
signal DIN 			: std_logic_vector (7 downto 0) := (others => '0');

-- ADT7420 signals
signal INTERRUPT 	: std_logic := '0';
signal TEMP		 	: std_logic_vector (12 downto 0) := (others => '0');
signal sign		 	: std_logic_vector (2 downto 0) := (others => '0');

-- signal cntr 		: integer range 0 to 255 := 0;

begin
-----------------------------------------------------------------------------------------------

ADT7420_i : ADT7420
GENERIC MAP(
	CLKFREQ		=> CLKFREQ		,
	I2C_BUS_CLK	=> I2C_BUS_CLK	,
	DEVICE_ADDR	=> DEVICE_ADDR	
)
PORT MAP( 
	CLK 		=> CLK 		    ,
	RST_N 		=> RST_N 		,
	SCL 		=> SCL 		    ,
	SDA 		=> SDA 		    ,
	INTERRUPT 	=> INTERRUPT 	,
	TEMP 		=> TEMP 		
);

UART_TX_i : UART_TX
GENERIC MAP(
CLK_FREQ		=> CLKFREQ,
BAUD			=> 115_200,
DBIT			=> 8,
SB_TICK			=> 1
)
PORT MAP(
CLK				=> CLK			 ,
TX_START		=> TX_START	     ,
DIN				=> DIN			 ,
TX_DONE_TICK	=> TX_DONE_TICK  ,
TX				=> TX			
);

sign 	<= TEMP(12) & TEMP(12) & TEMP(12);


process (CLK) begin
if (rising_edge(CLK)) then

	DIN	<= TEMP(7 downto 0);

	if (INTERRUPT = '1') then
		DIN			<= sign & TEMP(12 downto 8);
		TX_START	<= '1';
	end if;		
	
	if (TX_DONE_TICK = '1') then
		TX_START	<= '0';
	end if;
	
end if;
end process;

LED(12 downto 0)	<= TEMP;
LED(15)				<= '1';
LED(14 downto 13)	<= "00";

end Behavioral;
