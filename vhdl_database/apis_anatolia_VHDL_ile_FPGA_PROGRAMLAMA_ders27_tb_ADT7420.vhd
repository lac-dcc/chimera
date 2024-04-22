----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2019 09:26:46 AM
-- Design Name: 
-- Module Name: tb_ADT7420 - Behavioral
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

entity tb_ADT7420 is
GENERIC (
	CLKFREQ		: INTEGER := 100_000_000;
	I2C_BUS_CLK	: INTEGER := 400_000;
	DEVICE_ADDR	: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001011"
);
end tb_ADT7420;

architecture Behavioral of tb_ADT7420 is

COMPONENT ADT7420 IS
GENERIC (
	CLKFREQ		: INTEGER := 100_000_000;
	I2C_BUS_CLK	: INTEGER := 400_000;
	DEVICE_ADDR	: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001011"
);
PORT ( 
	CLK 		: IN STD_LOGIC;
	RST_N 		: IN STD_LOGIC;
	SCL 		: INOUT STD_LOGIC;
	SDA 		: INOUT STD_LOGIC;
	INTERRUPT 	: OUT STD_LOGIC;
	TEMP 		: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
);
END COMPONENT;

signal CLK			: std_logic := '0';
signal RST_N		: std_logic := '1';
signal SCL			: std_logic := 'H';
signal SDA			: std_logic := 'H';
signal INTERRUPT	: std_logic;
signal TEMP			: STD_LOGIC_VECTOR(12 DOWNTO 0);

constant clkPeriod : time := 10 ns;

signal message : String(1 to 10) := "initial---";

begin

DUT : ADT7420
GENERIC MAP(
	CLKFREQ		=> CLKFREQ		 ,
	I2C_BUS_CLK	=> I2C_BUS_CLK	 ,
	DEVICE_ADDR	=> DEVICE_ADDR	
)
PORT MAP( 
	CLK 		=> CLK 		   ,
	RST_N 		=> RST_N 		,
	SCL 		=> SCL 		   ,
	SDA 		=> SDA 		   ,
	INTERRUPT 	=> INTERRUPT 	,
	TEMP 		=> TEMP 		
);

process begin
CLK	<= not CLK;
wait for clkPeriod/2;
end process;


process begin

SCL	<= 'H';

wait until (SCL = 'H') and (SDA'event and SDA='0');	-- start condition
message <= "startCond-";
wait until SCL = '0';
for i in 1 to 8 loop
	wait until (SCL'event and SCL='0');
	wait for 1 ps;
end loop;

-- give slave ack
SDA <= '0';
message <= "slaveAck--";
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait for 1 ps;

wait until (SCL = 'H') and (SDA'event and SDA='H');	-- stop condition
message <= "stopCond--";
wait for 1 ps;


----------------------------------------------------------------------
-- read part

wait until (SCL = 'H') and (SDA'event and SDA='0');	-- start condition
message <= "startCond-";
wait until SCL = '0';
for i in 1 to 8 loop
	wait until (SCL'event and SCL='0');
	wait for 1 ps;
end loop;


-- give slave ack
SDA <= '0';
message <= "slaveAck--";
wait until (SCL'event and SCL = '0');
message <= "tempMSB---";
-- sent slave data
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
message <= "masterAck-";
SDA <= 'H';
wait until (SCL'event and SCL = '0');
message <= "tempLSB---";
-- sent slave data
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= 'H';
wait until (SCL'event and SCL = '0');
SDA <= '0';
wait until (SCL'event and SCL = '0');
message <= "masterAck-";
SDA <= 'H';

wait until (SCL = 'H') and (SDA'event and SDA='H');	-- stop condition
message <= "stopCond--";


wait for 1.5 ms;

assert false
report "sim done"
severity failure;

end process;




end Behavioral;