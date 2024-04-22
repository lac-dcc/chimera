LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
--USE ieee.std_logic_unsigned.all; 
--use ieee.std_logic_arith.all;
USE ieee.numeric_std.all; 

library work;
use work.papiliochip_config.all;
use work.papiliochippkg.all;


ENTITY conv_signed IS 
PORT( 
	in_signed 		: IN signed (7 downto 0); 
	out_stdlogic 	: OUT std_logic_vector (7 downto 0) 
); 
END conv_signed; 

ARCHITECTURE struct OF conv_signed IS 
begin 

  convert: process (in_signed)
  begin
		out_stdlogic <= std_logic_vector(unsigned(in_signed + 128));
 end process convert;

END struct;
