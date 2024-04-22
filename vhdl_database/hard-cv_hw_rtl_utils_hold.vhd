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
use IEEE.NUMERIC_STD.ALL;


library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hold is
	 generic(HOLD_TIME : positive := 4; HOLD_LEVEL : std_logic := '1');
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           input: in  STD_LOGIC;
			  output: out  STD_LOGIC;
			  holding : out std_logic 
			  );
end hold;

architecture Behavioral of hold is
signal Qp : unsigned(nbit(HOLD_TIME) - 1  downto 0) := (others => '0');
signal old_value : std_logic ;
begin

 process(clk, resetn)
    begin
	if resetn = '0' then
 	    Qp <= (others => '0') ;
	elsif clk'event and clk = '1' then
	    if sraz = '1' then
			Qp <= (others => '0') ;
		 elsif Qp = 0 then
				if old_value /= input and input = HOLD_LEVEL then
					Qp <=  to_unsigned(HOLD_TIME - 1, nbit(HOLD_TIME)) ;
				end if;
				old_value <= input ;
		 else
				Qp <= Qp - 1;
	    end if;
	end if;
 end process;	
	
 output <=  input when Qp = 0 else
				old_value ;
				
 holding <= '0' when Qp = 0 else
				'1' ;
end Behavioral;

