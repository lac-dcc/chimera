----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:58 06/08/2009 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
    Port ( sig_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sig_out : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is

signal Q1, Q2, Q3 : std_logic;
 
				
begin

--  Provides a one-shot pulse from a non-clock input, with reset
--**Insert the following between the 'architecture' and
---'begin' keywords**

 
--**Insert the following after the 'begin' keyword**
process(clk)
begin
   if (clk'event and clk = '1') then
         Q1 <= sig_in;
         Q2 <= Q1;
         Q3 <= Q2;
   end if;
end process;
 
sig_out <= Q1 and Q2 and (not Q3);

end Behavioral;

