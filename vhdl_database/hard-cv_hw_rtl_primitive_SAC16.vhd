----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    18:43:10 03/05/2012 
-- Design Name: 
-- Module Name:    SAC16 - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: 
-- Shift and Accumulate operation, to be used when multiplication is fo power two and < 8
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

entity SAC16 is
port(clk, sraz : in std_logic;
	  A, B	:	in signed(15 downto 0);
	  RES	:	out signed(31 downto 0)  
);
end SAC16;

architecture Behavioral of SAC16 is
 signal shift, accum, lA: signed(31 downto 0) ;
 signal sel : std_logic_vector(1 downto 0) ;
 signal absB : signed(15 downto 0);
 signal add_subb : std_logic := '1';
begin
    process (clk)
    begin
        if (clk'event and clk='1') then
            if (sraz  = '1') then
                accum <= (others => '0');
                shift <= (others => '0');
					 add_subb <= '0' ;
            else
					 if add_subb = '1' then
						accum <= accum + shift;
					 else
						accum <= accum - shift;
					 end if;
					 if B /= 0 then
						 case sel is
								when "00" => shift <= lA ;
								when "01" => shift <= lA sll 1;
								when "10" => shift <= lA sll 2;
								when "11" => shift <= lA sll 3;
								when others =>  shift <= lA ;
						end case;
					else
						shift <= (others => '0') ; -- mult by zero is zero ...
					end if ;
					if B < 0 then
						add_subb <= '0' ; --next operation is a sub 
					else
						add_subb <= '1' ;
					end if ;
            end if;
        end if;
    end process;
			

	 absB <= abs(B);
				
	 sel	<= "00" when absB = 1 else -- selecting shift
				"01" when absB = 2 else
				"10" when absB = 4 else
				"11" when absB = 8 else
				"00" ;
	 
	 
    RES <= accum ;
			  
	 
	 lA <= X"FFFF" & A when A < 0 else
			 X"0000" & A  ;

	
end Behavioral;

