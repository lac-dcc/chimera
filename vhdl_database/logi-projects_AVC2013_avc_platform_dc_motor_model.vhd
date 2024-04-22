----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:44 05/12/2013 
-- Design Name: 
-- Module Name:    dc_motor_model - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dc_motor_model is
	port(
		pwm_duty : in std_logic_vector(7 downto 0) ;
		encoder_output : out std_logic 
	);
end dc_motor_model;

architecture Behavioral of dc_motor_model is
constant inertia : real := 0.1 ;
constant func_trans : real := 2.5 ;
constant friction : real := 0.0 ;
signal count : integer := 0 ;
signal cmd_inc : integer := 0 ;
constant time_base : time := 1 ms ;
begin




process
variable speed : real := 0.0 ;
variable low : real := 0.0 ;
variable high : real := 0.0 ;
variable level : std_logic := '0' ;
begin
encoder_output <= '0' ;
speed := real(conv_integer(pwm_duty))*func_trans + (speed * inertia) - friction  ;
if speed > 0.0 then
	low := 1.0/speed ;
	high := low/10.0;
	level := '1' ;
else
	low := 1.0 ;
	high := 0.0 ;
	level := '0' ;
end if ;
wait for low*time_base ;
encoder_output <= level ;
wait for high*time_base;
encoder_output <= '0' ;
end process ;


end Behavioral;

