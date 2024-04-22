----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:23 06/14/2015 
-- Design Name: 
-- Module Name:    Blank - Behavioral 
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


entity Blank is

    port(
        -- GODIL Switches
        sw1              : in    std_logic;

        -- GODIL LEDs
        led8             : out   std_logic
        
    );
end Blank;

architecture Behavioral of Blank is

begin

  led8 <= sw1;
  
end Behavioral;

