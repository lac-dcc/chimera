----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:40 09/04/2015 
-- Design Name: 
-- Module Name:    logipi_gpio - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logipi_gpio is
port(
	OSC_FPGA : in std_logic ;
	rpi_gpio : in std_logic ;
	led : out std_logic_vector(1 downto 0)
);
end logipi_gpio;

architecture Behavioral of logipi_gpio is
signal cnt : std_logic_vector(31 downto 0);
begin

process(OSC_FPGA)
begin
if OSC_FPGA'event and OSC_FPGA = '1' then
	cnt <= cnt + 1 ;
end if ;
end process ;


LED(0) <= not(cnt(22)) and not(cnt(20));
LED(1) <= cnt(25) when rpi_gpio = '0' else
			 cnt(25 - 4) ;
end Behavioral;

