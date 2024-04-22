----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:31:34 05/25/2012 
-- Design Name: 
-- Module Name:    reset_generator - Behavioral 
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

entity reset_generator is
generic(HOLD_0	:	natural	:= 100);
port(clk, resetn : in std_logic ;
     resetn_0: out std_logic
	  );
end reset_generator;

architecture Behavioral of reset_generator is
signal counter0 : natural := HOLD_0 ;
signal resetn_0_t : std_logic ;
begin

	process(clk, resetn) -- reset process
	begin
		if resetn = '0' then
			counter0 <= HOLD_0 ;
		elsif clk'event and clk = '1' then
			if counter0 > 0 then
				counter0 <= counter0 - 1 ;
			else
				counter0 <= 0 ;
			end if ;
		end if;
	end process;


resetn_0_t <= '1' when counter0 = 0 else
				 '0' ;
				 
				 
process(clk, resetn) -- reset process
	begin
		if resetn = '0' then
			resetn_0 <= '0' ;
		elsif clk'event and clk = '1' then
			resetn_0 <= resetn_0_t ;
		end if ;
end process ;

end Behavioral;

