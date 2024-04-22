-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;
------------------------------------------------------------------------------------------------- }}}
package FGPU_simulation_pkg is
  type kernel_type is ( copy, max_half_atomic, bitonic,  fadd,  median, floydwarshall, fir_char4, add_float, parallelSelection,  mat_mul,  fir,  xcorr,  sum_atomic,  fft_hard,   mul_float,  sobel);
  --                    0     1                 2        3       4       5             6          7           8                   9         10    11      12            13        14          15
  CONSTANT kernel_name        : kernel_type := copy;
  -- byte(0), half word(1), word(2)
  CONSTANT COMP_TYPE          : natural := 2;

  -- slli(0), sll(1), srli(2), srl(3), srai(4), sra(5), andi(6), and(7), ori(8), or(9), xori(10), xor(11), nor(12), sllb(13), srlb(14), srab(15)
  CONSTANT LOGIC_OP           : natural := 15;
  CONSTANT REDUCE_FACTOR      : natural := 1;
  
  function get_kernel_index (name: in kernel_type) return integer;

end FGPU_simulation_pkg;

package body FGPU_simulation_pkg is
  function get_kernel_index (name: in kernel_type) return integer is
  begin
    case name is
      when copy =>
        return 0;
      when max_half_atomic =>
        return 1;
      when bitonic =>
        return 2;
      when fadd =>
        return 3;
      when median =>
        return 4;
      when floydwarshall =>
        return 5;
      when fir_char4 =>
        return 6;
      when add_float =>
        return 7;
      when parallelSelection =>
        return 8;
      when mat_mul =>
        return 9;
      when fir =>
        return 10;
      when xcorr =>
        return 11;
      when sum_atomic =>
        return 12;
      when fft_hard =>
        return 13;
      when mul_float =>
        return 14;
      when sobel =>
        return 15;
      when others=>
        assert(false) severity failure;
        return 0;
    end case;
  end; -- function reverse_any_vector
end FGPU_simulation_pkg;
