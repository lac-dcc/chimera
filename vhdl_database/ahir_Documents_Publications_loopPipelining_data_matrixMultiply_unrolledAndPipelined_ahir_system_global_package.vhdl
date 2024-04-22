-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ahir_system_global_package is -- 
  constant ADDOP : std_logic_vector(7 downto 0) := "00000000";
  constant MULOP : std_logic_vector(7 downto 0) := "00000010";
  constant SUBOP : std_logic_vector(7 downto 0) := "00000001";
  constant a_matrix_base_address : std_logic_vector(8 downto 0) := "000000000";
  constant b_matrix_base_address : std_logic_vector(8 downto 0) := "000000000";
  constant c_matrix_base_address : std_logic_vector(8 downto 0) := "000000000";
  -- 
end package ahir_system_global_package;
