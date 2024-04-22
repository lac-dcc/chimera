-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ahir_system_global_package is -- 
  constant ADDOP : std_logic_vector(7 downto 0) := "00000000";
  constant A_base_address : std_logic_vector(6 downto 0) := "0000000";
  constant B_base_address : std_logic_vector(6 downto 0) := "0000000";
  constant C_base_address : std_logic_vector(6 downto 0) := "0000000";
  constant MULOP : std_logic_vector(7 downto 0) := "00000010";
  constant SUBOP : std_logic_vector(7 downto 0) := "00000001";
  -- 
end package ahir_system_global_package;
