--   __   __     __  __     __         __
--  /\ "-.\ \   /\ \/\ \   /\ \       /\ \
--  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____
--   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\
--    \/_/ \/_/   \/_____/   \/_____/   \/_____/
--   ______     ______       __     ______     ______     ______
--  /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
--  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
--   \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
--    \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
--
-- https://joshbassett.info
-- https://twitter.com/nullobject
-- https://github.com/nullobject
--
-- Copyright (c) 2020 Josh Bassett
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package math is
  -- calculates the log2 of the given number
  function ilog2(n : natural) return natural;

  -- Masks the given range of bits for a vector.
  --
  -- Only the bits between the MSB and LSB (inclusive) will be kept, all other
  -- bits will be masked out.
  function mask_bits(data : std_logic_vector; msb : natural; lsb : natural) return std_logic_vector;
  function mask_bits(data : std_logic_vector; msb : natural; lsb : natural; size : natural) return std_logic_vector;
end package math;

package body math is
  function ilog2(n : natural) return natural is
  begin
    return natural(ceil(log2(real(n))));
  end ilog2;

  function mask_bits(data : std_logic_vector; msb : natural; lsb : natural) return std_logic_vector is
    variable n : natural;
    variable mask : std_logic_vector(data'length-1 downto 0);
  begin
    n := (2**(msb-lsb+1))-1;
    mask := std_logic_vector(shift_left(to_unsigned(n, mask'length), lsb));
    return std_logic_vector(shift_right(unsigned(data AND mask), lsb));
  end mask_bits;

  function mask_bits(data : std_logic_vector; msb : natural; lsb : natural; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(mask_bits(data, msb, lsb)), size));
  end mask_bits;
end package body math;
