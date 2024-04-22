--###############################
--# Project Name : 
--# File         : 
--# Project      : 
--# Engineer     : 
--# Modification History
--###############################

library IEEE;
use IEEE.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity I2C_SLAVE_TOP is
		port(
    clk_10MHz : in std_logic;
    rst : in std_logic; -- AB7 use CPU_RESET button        
    SCL        : inout    std_logic;
    SDA        : inout    std_logic;
       --debug IO              
    --leds_debug : out std_logic_vector(7 downto 0) := (others => '0') --debug
    eeprom_active : out std_logic;
    ov_active : out std_logic;
    start_activated_by_i2c  : out std_logic
    );
end I2C_SLAVE_TOP;

architecture Behavioral  of I2C_SLAVE_TOP is

-- COMPONENTS --
	component I2C_MUX
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			SCL		: inout	std_logic;
			SDA		: inout	std_logic;
			EEPROM_ACTIVE : out std_logic;
			OV_ACTIVE : out std_logic;
			start_activated_by_i2c  : out std_logic
		);
	end component;

---- SIGNALS --
	signal MCLK_sig		: std_logic;
	signal nRST_sig		: std_logic;
	signal EEPROM_ACTIVE_sig :  std_logic;
    signal OV_ACTIVE_sig : std_logic;
    

begin

MCLK_sig <= clk_10MHz;
nRST_sig <= not rst;

--leds_debug(0) <= master_clock_LED_reg;
--leds_debug(1) <= '1' when SCL /= i2c_clock_LED_reg else '0';
--leds_debug(2) <= '1' when SDA /= i2c_data_LED_reg  else '0';

--leds_debug(6) <= EEPROM_ACTIVE_sig;
--leds_debug(7) <= OV_ACTIVE_sig;

--leds_debug(0) <= MCLK_sig;
--leds_debug(1) <= SCL;
--leds_debug(2) <= SDA;

--leds_debug(5 downto 3) <= (others => '0');

eeprom_active <= EEPROM_ACTIVE_sig;
ov_active     <= OV_ACTIVE_sig;

-- PORT MAP --
	I_I2C_MUX : I2C_MUX
		port map (
			MCLK		=> MCLK_sig,
			nRST		=> nRST_sig,
			SCL		=> SCL,
			SDA		=> SDA,
			EEPROM_ACTIVE => EEPROM_ACTIVE_sig,
			OV_ACTIVE => OV_ACTIVE_sig,
			start_activated_by_i2c => start_activated_by_i2c
		);





end Behavioral;
