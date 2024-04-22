------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
                         
package mem_function_pack is
  function Ceil_Log ( x: natural; base: natural) return natural;
  function Ceil_Log2 ( x: natural) return natural;
  function Ceiling (constant x, y : integer) return integer;
  function IsGreaterThan(x, y: std_logic_vector) return boolean;
  function IncrementSLV(constant x : std_logic_vector) return std_logic_vector;
  function Bank_Match(BANK: natural;
                      log2_number_of_banks: natural;
                      addr_in: std_logic_vector)   return boolean;
  function To_Integer(x: std_logic_vector) return natural;
  function Digit_To_Char(val: integer) return character;
  function Minimum(x: integer; y: integer) return integer;
  function Maximum(x: integer; y: integer) return integer;
  function Natural_To_SLV (constant val, size : natural) return std_logic_vector;

  function Convert_To_String(val : natural) return STRING; -- convert val to string.
  function Convert_Integer_To_String(val : integer) return STRING; -- convert val to string.
  function Convert_To_String(val : std_logic_vector) return STRING; -- convert signed to string.

end mem_function_pack;

package body mem_function_pack is
  function Ceil_Log ( x: natural; base: natural ) return natural is
    variable ret_var : integer := 0;
    variable tvar : natural;
  begin
    ret_var := 0;
    if(x > 0) then
      tvar := x;
      while(tvar > 1)loop
        tvar := tvar/base;
        ret_var := ret_var + 1;
      end loop;
      if(base**ret_var < x) then ret_var := ret_var + 1; end if;
    end if;
    return(ret_var);
  end function Ceil_Log;

  function Ceil_Log2 ( x: natural) return natural is
  begin
    return(Ceil_Log(x,2));
  end function Ceil_Log2;
    
  -- purpose: ceiling of x/y
  function Ceiling (
    constant x, y : integer)
    return integer is
    variable ratio : integer;
  begin  -- Ceiling
    ratio := x/y;
    if(y*ratio < x) then
      ratio := ratio + 1;
    end if;
    return ratio;
  end Ceiling;

    -- return true if x > y false otherwise
  function IsGreaterThan(x, y: std_logic_vector) return boolean is
    alias lx : std_logic_vector(1 to x'length) is x;
    alias ly : std_logic_vector(1 to x'length) is y;
    variable ret_val, still_equal : boolean;
  begin
    assert lx'length = ly'length report "mismatched lengths in IsGreaterThan" severity error;
    assert lx'length > 2 report "time-stamp length must be > 2 in IsGreaterThan" severity error;

    ret_val := false;
    
    if((lx(1 to 2) = "00" and ly(1 to 2) = "11") or
       (lx(1 to 2) = "01" and ly(1 to 2) = "00") or
       (lx(1 to 2) = "10" and ly(1 to 2) = "01") or
       (lx(1 to 2) = "11" and ly(1 to 2) = "10")) then
      ret_val := true;
    elsif(lx(1 to 2) = ly(1 to 2)) then
      still_equal := true;
      for I in 3 to lx'length loop
        if(still_equal and (lx(I) = '1') and (ly(I) = '0')) then
          ret_val := true;
          still_equal := false;
        elsif(still_equal and (lx(I) = '0' and ly(I) = '1')) then
          still_equal := false;
        end if;
      end loop;  -- I
    end if;
    return(ret_val);
  end function IsGreaterThan;

  function IncrementSLV(constant x : std_logic_vector) return std_logic_vector
  is
    alias lx : std_logic_vector(1 to x'length) is x;
    variable ret_var : std_logic_vector(1 to x'length);
    variable carry_bit, sum_bit : std_logic;
  begin
    carry_bit := '1';
    for I in x'length downto 1 loop
      sum_bit    := carry_bit xor lx(I);
      carry_bit  := carry_bit and lx(I);
      ret_var(I) := sum_bit;
    end loop;
    return(ret_var);
  end function  IncrementSLV;

  function Bank_Match(BANK: natural;
                      log2_number_of_banks: natural;
                      addr_in: std_logic_vector)
    return boolean is
    alias la : std_logic_vector(1 to addr_in'length) is addr_in;
    variable v : unsigned(1 to log2_number_of_banks);
    variable ret_val : boolean;
  begin
    assert addr_in'length > log2_number_of_banks report "inadequate address length in Bank_Match" severity error;
    ret_val := true;
    if(log2_number_of_banks > 0) then
      for I  in 1 to log2_number_of_banks loop
        v(I) := la((addr_in'length - log2_number_of_banks) + I);
      end loop;  -- I
      if(To_Integer(v) = BANK) then
        ret_val := true;
      else
        ret_val := false;
      end if;
    end if;
    return(ret_val);
  end Bank_Match;

  function To_Integer(x: std_logic_vector) return natural is
	alias lx: std_logic_vector(1 to x'length) is x;
	variable ret_var,two_power: natural;
  begin
        two_power := 1; 
        ret_var := 0;
	for I in x'length downto 1 loop
		if(lx(I) = '1') then
			ret_var := ret_var  + two_power;
		end if;
		two_power := 2*two_power;
	end loop;
	return(ret_var);
  end To_Integer;
  
  function Minimum(x: integer; y: integer) return integer is
       variable ret_var: integer;
    begin
       if(x < y) then ret_var := x; else ret_var := y; end if;
       return(ret_var);
  end Minimum; 

  function Maximum(x: integer; y: integer) return integer is
       variable ret_var: integer;
    begin
       if(x > y) then ret_var := x; else ret_var := y; end if;
       return(ret_var);
  end Maximum; 

  function Natural_To_SLV (constant val, size : natural) return std_logic_vector is
    variable ret_var  : std_logic_vector(size-1 downto 0);
    variable uret_var : unsigned(size-1 downto 0);
    variable scale_val : natural;
  begin
    scale_val := val mod (2**size);
    uret_var := TO_UNSIGNED(scale_val,size);
    for I in 0 to size-1 loop
      ret_var(I) := uret_var(I);
    end loop;  -- I
    return(ret_var);
  end Natural_To_SLV;

  function Convert_To_String(val : NATURAL) return STRING is
	variable result : STRING(10 downto 1) := (others => '0'); -- smallest natural, longest string
	variable pos    : NATURAL := 1;
	variable tmp, digit  : NATURAL;
  begin
    -- synopsys translate_off
	tmp := val;
	loop
		digit := abs(tmp MOD 10);
	    	tmp := tmp / 10;
	    	result(pos) := character'val(character'pos('0') + digit);
	    	pos := pos + 1;
	    	exit when tmp = 0;
	end loop;
    -- synopsys translate_on
	return result((pos-1) downto 1);
  end Convert_To_String;

  function Digit_To_Char(val: integer) return character is
	variable ret_val : character;
  begin
	case val is
		when 0 => ret_val := '0';
		when 1 => ret_val := '1';
		when 2 => ret_val := '2';
		when 3 => ret_val := '3';
		when 4 => ret_val := '4';
		when 5 => ret_val := '5';
		when 6 => ret_val := '6';
		when 7 => ret_val := '7';
		when 8 => ret_val := '8';
		when 9 => ret_val := '9';
		when others => ret_val := 'X';
	end case;
	return(ret_val);
  end Digit_To_Char;


    -- Thanks to: D. Calvet calvet@hep.saclay.cea.fr
    -- modified to support negative values
  function Convert_Integer_To_String(val : integer) return STRING is
	variable result : STRING(12 downto 1) := (others => '0'); -- smallest natural, longest string
	variable pos    : NATURAL := 1;
	variable tmp : integer;
	variable digit  : NATURAL;
	variable is_negative : boolean;
  begin
	tmp := val;
	if val < 0 then
	  tmp := -val;
	end if;
	is_negative := val < 0;
	
	loop
		digit := abs(tmp MOD 10);
	    	tmp := tmp / 10;
	    	result(pos) := Digit_To_Char(digit);
	    	pos := pos + 1;
	    	exit when ((tmp = 0) or (pos = (result'high-1)));
	end loop;
	
	if is_negative then
	  result(pos) := '-';
	  pos := pos + 1;
	end if;
	
	return result((pos-1) downto 1);
  end Convert_Integer_To_String;
  

  function Convert_To_String(val : std_logic_vector) return STRING is
        alias lval: std_logic_vector(1 to val'length) is val;
	variable result : STRING(1 to val'length) := (others => '0'); -- smallest natural, longest string
  begin
        for I in 1 to val'length loop
          if(lval(I) = '0') then result(I) := '0'; else result(I) := '1'; end if;
	end loop;
	return result;
  end Convert_To_String;

end mem_function_pack;
