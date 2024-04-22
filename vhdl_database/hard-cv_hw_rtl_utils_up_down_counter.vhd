----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    19:21:07 04/14/2012 
-- Design Name: 
-- Module Name:    simple_counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_down_counter is
	 generic(NBIT : positive := 4);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en, load : in  STD_LOGIC;
			  up_downn : in  STD_LOGIC;
			  E : in  STD_LOGIC_VECTOR(NBIT - 1 downto 0);
           Q : out  STD_LOGIC_VECTOR(NBIT - 1 downto 0)
			  );
end up_down_counter;

architecture Behavioral of up_down_counter is
signal Qp : std_logic_vector(NBIT - 1 downto 0);
begin

 process(clk, resetn)
    begin
	if resetn = '0' then
 	    Qp <= (others => '0') ;
	elsif clk'event and clk = '1' then
	    if sraz = '1' then
			Qp <= (others => '0') ;
		 elsif load = '1' then
			Qp <= E ;
		 elsif en = '1' then
				if up_downn = '1' then
					Qp <= Qp + 1;
				else
					Qp <= Qp - 1;
				end if ;
	    end if;
	end if;
 end process;	
	
    -- concurrent assignment statement
    Q <=  Qp;
end Behavioral;