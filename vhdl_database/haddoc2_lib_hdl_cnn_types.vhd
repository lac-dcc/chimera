------------------------------------------------------------------------------
-- Title      : cnn_types
-- Project    : Haddoc2
------------------------------------------------------------------------------
-- File       : cnn_types.vhd
-- Author     : K. Abdelouahab
-- Company    : Institut Pascal
-- Last update: 2018-08-23
------------------------------------------------------------------------------
-- Description: A package defining the types, functions and constants used in
--              the Haddoc2 IP VHDL library
------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use work.bitwidths.all;

package cnn_types is
  ------------------------------------------------------------------------------
  -- Types
  type pixel_array is array (integer range <>) of std_logic_vector (GENERAL_BITWIDTH-1 downto 0);
  type sum_array is array (integer range <>) of std_logic_vector (SUM_WIDTH-1 downto 0);
  type prod_array is array (integer range <>) of std_logic_vector (2*GENERAL_BITWIDTH-1 downto 0);
  type pixel_matrix is array (integer range <>, integer range <>) of std_logic_vector (GENERAL_BITWIDTH-1 downto 0);
  ------------------------------------------------------------------------------
  -- Constants to implement piecewize TanH : cf DotProduct.vhd
  constant SCALE_FACTOR : integer := 2 **(GENERAL_BITWIDTH-1) - 1;
  constant A1           : integer := GENERAL_BITWIDTH - 1;
  constant A2           : integer := GENERAL_BITWIDTH;
  constant T1           : integer := SCALE_FACTOR * SCALE_FACTOR / 2;
  constant T2           : integer := SCALE_FACTOR * SCALE_FACTOR * 5/4;
  constant V1           : integer := SCALE_FACTOR / 4;
  constant V2           : integer := SCALE_FACTOR - 10;
  ------------------------------------------------------------------------------
  -- Functions:
  -- extractRow : Extracts a row of pixel_array data from a pixel_matrix.
  function extractRow(target_row : integer;
                      nb_row     : integer;
                      nb_col     : integer;
                      in_matrix  : pixel_matrix)
  return pixel_array;
------------------------------------------------------------------------------
end cnn_types;


package body cnn_types is
  function extractRow(target_row : integer;
                      nb_row     : integer;
                      nb_col     : integer;
                      in_matrix  : pixel_matrix)
  return pixel_array is
  variable out_vec : pixel_array (0 to nb_col - 1);
  begin
    for index_col in 0 to (nb_col - 1) loop
      out_vec(index_col) := in_matrix(target_row, index_col);
    end loop;
    return out_vec;
  end extractRow;
end cnn_types;
