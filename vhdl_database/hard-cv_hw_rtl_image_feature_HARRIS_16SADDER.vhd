----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    13:46:28 10/18/2012 
-- Design Name: 
-- Module Name:    HARRIS_ADDER - Behavioral 
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
library work;
use work.utils_pack.all ;
use work.primitive_pack.all ;
use work.feature_pack.all ;


entity HARRIS_16SADDER is
generic(NB_VAL : positive := 5);
port(
		clk, resetn : in std_logic ;
		val_array : in vec_16s(0 to (NB_VAL-1));
		result : out signed(15 downto 0)
);
end HARRIS_16SADDER;

architecture Behavioral of HARRIS_16SADDER is
type vec16s_array is array(0 to (NB_VAL - 2)) of vec_16s(0 to (NB_VAL-1)) ;

signal pipeline_registers : vec16s_array ;
signal res_latched : vec_16s(0 to (NB_VAL-1)) ;

begin

gen_stages : for i in 0 to (NB_VAL - 2) generate
	
	
	gen_0 : if i = 0 generate
		process(clk)
			begin
				if clk'event and clk = '1' then
					pipeline_registers(0)(i+1) <= val_array(0) + val_array(1) ;
				end if ;
			end process ;
		gen_regs : for j in (i+2) to (NB_VAL - 1) generate
			process(clk)
			begin
				if clk'event and clk = '1' then
					pipeline_registers(0)(j) <= val_array(j) ;
				end if ;
			end process ;
		end generate ;
	end generate ;
	
	
	gen_n : if i /= 0 and i < (NB_VAL - 2) generate
			process(clk)
			begin
				if clk'event and clk = '1' then
					pipeline_registers(i)(i+1) <= pipeline_registers(i-1)(i) + pipeline_registers(i-1)(i+1) ;
				end if ;
			end process ;
		gen_regs : for j in (i+2) to (NB_VAL - 1) generate
			process(clk)
			begin
				if clk'event and clk = '1' then
					pipeline_registers(i)(j) <= pipeline_registers(i-1)(j) ;
				end if ;
			end process ;
		end generate ;
	end generate ;
	
	
	gen_last : if i = (NB_VAL - 2) generate
			process(clk)
			begin
				if clk'event and clk = '1' then
					result <= pipeline_registers(i-1)(i) + pipeline_registers(i-1)(i+1) ;
				end if ;
			end process ;
	end generate ;

end generate ;

end Behavioral;

