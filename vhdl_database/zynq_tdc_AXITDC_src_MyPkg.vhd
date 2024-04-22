----------------------------------------------------------------------------------
-- TDC Encoder Package File
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 29.4.2019
-- Modified: 29.4.2019
--
-- Useful functions employed in the TDC.
-- Copied from CslStdRtlPkg + added own functions.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;

package MyPkg is

   -- Typing std_logic(_vector) is annoying
   subtype sl is std_logic;
   subtype slv is std_logic_vector;
   
   -- Not supported for simulation! (VHDL 2008)
   --type SlvArray is array (natural range <>) of slv;
   
   --type SlArray is array(natural range <>) of std_logic; -- for entities with variable number of inout pins
   
   -- Very useful functions
   function isPowerOf2 (number       : natural) return boolean;
   function isPowerOf2 (vector       : slv) return boolean;
   function log2 (constant number    : integer) return natural;
   function bitSize (constant number : natural) return positive;
   
   -- conv_std_logic_vector functions
   function toSlv(ARG : integer; SIZE : integer) return slv;
   
   -- ADDED FUNCTIONS
   function isodd (n: positive) return natural;
   
end MyPkg;

package body MyPkg is

   function isPowerOf2 (number : natural) return boolean is
   begin
      return isPowerOf2(toSlv(number, 32));
   end function isPowerOf2;
   
   function isPowerOf2 (vector : slv) return boolean is
   begin
      return (unsigned(vector) /= 0) and
         (unsigned(unsigned(vector) and (unsigned(vector)-1)) = 0);
   end function isPowerOf2;
   
   ---------------------------------------------------------------------------------------------------------------------
   -- Function: log2
   -- Purpose: Finds the log base 2 of an integer
   -- Input is rounded up to nearest power of two.
   -- Therefore log2(5) = log2(8) = 3.
   -- Arg: number - integer to find log2 of
   -- Returns: Integer containing log base two of input.
   ---------------------------------------------------------------------------------------------------------------------
   function log2(constant number : integer) return natural is
   begin
      if (number < 2) then
         return 1;
      end if;
      return integer(ceil(ieee.math_real.log2(real(number))));
   end function;
   
   -- Find number of bits needed to store a number
   function bitSize (constant number : natural ) return positive is
   begin
      if (number = 0 or number = 1) then
         return 1;
      else
         if (isPowerOf2(number)) then
            return log2(number) + 1;
         else
            return log2(number);
         end if;
      end if;
   end function;
   
   -- convert an integer to a STD_LOGIC_VECTOR
   function toSlv(ARG : integer; SIZE : integer) return slv is
   begin
      if (arg < 0) then
         return slv(to_unsigned(0, SIZE));
      end if;
      return slv(to_unsigned(ARG, SIZE));
   end;
   
   -- is n odd? (yes=1 or no=0)
   function isodd (n: positive) return natural is
   begin
      if (n/2 * 2 < n) then
         return 1;
      else 
         return 0;
      end if;
   end function;
   
end package body MyPkg;
   