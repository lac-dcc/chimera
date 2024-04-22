----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    18:43:10 03/05/2012 
-- Design Name: 
-- Module Name:    MAC16 - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC16 is
port(clk, sraz : in std_logic;
	  add_subb, reset_acc	:	in std_logic;
	  A, B	:	in signed(15 downto 0);
	  RES	:	out signed(31 downto 0)  
);
end MAC16;

architecture Behavioral of MAC16 is
 signal mult, accum: signed(31 downto 0);
begin
    process (clk)
    begin
        if (clk'event and clk='1') then
            if (sraz  = '1') then
                accum <= (others => '0');
                mult <= (others => '0');
            else
					 if reset_acc = '1' then
						accum <= (others => '0');
					 elsif add_subb = '1' then
						accum <= accum + mult;
					 else
						accum <= accum - mult;
					 end if;
                mult <= A * B;
            end if;
        end if;
    end process;
	 
    RES <= accum ;
			  
			  
end Behavioral;

