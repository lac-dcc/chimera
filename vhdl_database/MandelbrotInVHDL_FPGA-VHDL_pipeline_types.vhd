--------------------------------------------------------------------------------
-- Pipelined point - nicely arranged types for easy re-use.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.custom_fixed_point_types.all;

package pipeline_types is

  constant depth : integer := 7;

  type coord_array_type is array (integer range <>) of custom_fixed_point_type;

  subtype offst is unsigned(31 downto 0);
  type offst_array_type is array (integer range <>) of offst;

  subtype iterations is unsigned(7 downto 0);
  type iterations_array is array (integer range <>) of iterations;

end package pipeline_types;
