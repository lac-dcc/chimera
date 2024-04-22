------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
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
--------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.mem_function_pack.all;
use ahir.memory_subsystem_package.all;
--use ahir.Utilities.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;

package MemCutsPackage is

	-- For a requirement of a memory with MxN (M-rows, N-columns) aspect
	-- ratio, we will first determine uniform columns to implement the
	-- memory.  For each available memory cut, we will find the number
	-- of column-replications that will be filled by it.  For example,
	-- if we have a requirement of 64x24, we could have the following
	-- solutions
	--       column of 16x4 replicated 6 times 
	--       column of 16x4 replicated 2 times, column of 32x16 replicated once
	--  etc.
	--
	
	-- Using the procedure 'opt_find' for a given MxN array, the cut that
	-- maximally covers the N with minimum number of column-replications 
	-- subject to cut utilization of atleast 50% is found out. This procedure
	-- also outputs the number of columns left after filling the N with optimal 
	-- column-replications.
	
	-- To fill the N completely, 'opt_find' is called recursively in the 
	-- function 'find_n_cols', each time passing the number of columns 
	-- yet to be filled. 'find_n_cols' returns an array containg the number
	-- of columns of each available cut required, index-wise.
	
	-- A column memory of size (Mxcut_data_width) for a given cut is build 
	-- using the entity 'mem_column'. This entity is instantiated for
	-- the number of column-replications of each cut. Thus, forming the 
	-- complete MxN array.

	-- functions developed and their description are given in the package body.

	procedure Min_array(x: in IntegerArray;
		    y: in IntegerArray; 
		    min: out integer;
		    index: out integer );
	
	procedure opt_find (constant cut_address_widths: IntegerArray;
		constant cut_data_widths: IntegerArray;
		constant cut_row_heights: IntegerArray;
		addr_width: in natural;  
		data_width: in natural;
		index: out integer; 
		n_cols: out natural;
		extra_cols: out integer);

	-- return the cut that fills the maximum percentage of the
	-- area (with tie break advantage to row filling).
	-- returns a vector of length 3.
	--       index of cut (-1 if not found)
	--       addr_width of cut
        --       data_width of cut
	--       number of rows of cut
	--       number of columns of cut.
        function find_best_cut 
		(constant cut_address_widths: IntegerArray;
		    constant cut_data_widths: IntegerArray;
		    constant cut_row_heights: IntegerArray;
		    addr_width: in natural;  
		    data_width: in natural) return IntegerArray;

	function find_n_cols (constant cut_address_widths: IntegerArray;
		constant cut_data_widths: IntegerArray;
		constant cut_row_heights: IntegerArray;
		addr_width: natural;
		data_width: natural) return IntegerArray;

	--function Ceil_Log2(constant x : integer) return integer;
	function find_data_width (constant cut_data_widths: IntegerArray; 
		constant n_cols: Integerarray) return integer;
	function col_index (constant cut_data_widths: IntegerArray; 
		constant x: IntegerArray; index: integer) return integer;
	function MemDecoder(x: std_logic_vector) return std_logic_vector;
end package;

package body MemCutsPackage is

  -- Procedure: Min_array
  -- Description: Finds the minimum element (min) and it's position(index)
  -- 	in the given input array x, provided the element at the corresponding 
  -- 	position in the input array y is greater than 50.
  -- Inputs:
  -- 	x: array containing the number of replications of each cut
  --	y: array containing the utilization of each cut
  -- Outputs:
  -- 	min: minimum number of cuts having the cut utilization > 50%
  --	index: index of the minimum element in the input array x

  procedure Min_array(x: in IntegerArray;
		    y: in IntegerArray; 
		    min: out integer;
		    index: out integer ) is 
	alias lx:IntegerArray(1 to x'length) is x;
	alias ly:IntegerArray(1 to y'length) is y;
	variable min_var: integer;
	variable loc: integer;
  begin
	min_var := lx(1);
	loc := 1;
	for i in lx'length to 1 loop
		if (ly(i) > 50) then
			min_var := lx(i);
			loc := i;
		end if;
	end loop;
	
	for i in 1 to lx'length loop
		if (lx(i) < min_var) then
			if (ly(i) > 50) then
				min_var := lx(i);
				loc := i;
			end if;
		end if;
	end loop;

	min := min_var;
	index := loc;
  end Min_array; 
	    
  -- Procedure: opt_find
  -- Description: Covers the required MxN array with the smallest number 
  -- 	of column-replications subject to column utilization being at least 50%.
  -- Inputs:
  --	cut_address_widths: array of number of address lines of available cuts
  --	cut_data_widths: array of number of data lines of available cuts
  --	cut_row_heights: array of row heights of available cuts 
  -- 	addr_width: address width of the required MxN array
  -- 	data_width: data width of the required MxN array  
  -- Outputs:
  -- 	index: index of cut in 'cut_data_widths' using which minimum 
  -- 		column-replications are required to maximally cover N 
  -- 	n_cols: required number of column-replications of the optimal cut
  -- 	extra_cols: number of columns left after filling the N with optimal
  -- 		column-replications
	
  procedure opt_find (constant cut_address_widths: IntegerArray;
		constant cut_data_widths: IntegerArray;
		constant cut_row_heights: IntegerArray;
		addr_width: in natural;  
		data_width: in natural;
		index: out integer; 
		n_cols: out natural;
		extra_cols: out integer) is
	
	variable n_row_array, n_col_array, extra_col_array, n_cuts_array: IntegerArray(1 to cut_address_widths'length):= (others => 0);
	variable location, n_col: integer;
	variable Util_array: IntegerArray(1 to cut_address_widths'length);
  begin 
	for i in 1 to cut_address_widths'length loop

		if (data_width/cut_data_widths(i) = 0) then -- when data width is 
							    -- less than the cut width
			n_col_array(i) := 1;	
		-- when data width is integer multiples of cut width
		elsif (data_width/cut_data_widths(i) = 
			Ceiling (data_width, cut_data_widths(i))) then
			n_col_array(i) := data_width/cut_data_widths(i);		
		else
			n_col_array(i) := Ceiling(data_width, cut_data_widths(i))-1;
			extra_col_array(i) := data_width-n_col_array(i)*cut_data_widths(i);
		end if;

		n_row_array(i) := 2**(Maximum(0, addr_width-cut_address_widths(i)));
		Util_array(i) := 2**(addr_width)*data_width*100/
		(n_row_array(i)*cut_row_heights(i)*n_col_array(i)*cut_data_widths(i));	
		n_cuts_array(i) := n_row_array(i)*n_col_array(i);
	end loop;
	
	Min_array(n_cuts_array, Util_array, n_col, location);
	n_cols := n_col_array(location);
	index := location;	
	extra_cols := extra_col_array(location);
	
  end opt_find;
	
	-- return the cut that fills the maximum percentage of the
	-- area (with tie break advantage to row filling).
	-- returns a vector of length 3.
	--       index of cut (-1 if not found)
	--       addr_width of cut
        --       data_width of cut
	--       number of rows of cut
   function find_best_cut 
		(constant cut_address_widths: IntegerArray;
		    constant cut_data_widths: IntegerArray;
		    constant cut_row_heights: IntegerArray;
		    addr_width: in natural;  
		    data_width: in natural) return IntegerArray is
	variable a, r, s: natural;
	variable best_area, best_data_width, best_addr_width: natural;
	variable best_index: integer;
	variable ret_var: IntegerArray(1 to 5);
  begin

	s := ((2**addr_width) * data_width);
	ret_var := (others => 0);

	best_area := 0;
	best_data_width := 0;
 	best_addr_width := 0;
        best_index := -1;

        for  I in 1 to cut_address_widths'length loop
                a := (cut_row_heights(I) * cut_data_widths(I));
		if (a <= s) and  (cut_data_widths(I) <= data_width) and (cut_address_widths(I) <= addr_width)
			and ((a > best_area) or ((a = best_area) and (cut_data_widths(I) > best_data_width))) then
		   best_index := I;
		   best_area  := a;
                   best_data_width  := cut_data_widths(I);
		   best_addr_width := cut_address_widths(I);
		end if;
	end loop;

	ret_var(1) := best_index;
	if(best_index > 0) then
	   ret_var(2) := best_addr_width;
           ret_var(3) := best_data_width;
	   ret_var(4) := (2 ** (addr_width - best_addr_width));
	   ret_var(5) := (data_width/best_data_width);
        end if;

	return ret_var;
  end find_best_cut;

  -- function: find_n_cols
  -- Description: Finds the number of columns of each cut required to completely
  -- 		fill the data_width of the required MxN array
  -- Inputs:
  --	cut_address_widths: array of number of address lines of available cuts
  --	cut_data_widths: array of number of data lines of available cuts
  --	cut_row_heights: array of row heights of available cuts 
  -- 	addr_width: address width of the array to be build
  -- 	data_width: data width of the array to be build
  -- Output: 
  -- 	Array containing the required number of columns of availble cuts 
  
  function find_n_cols (constant cut_address_widths: IntegerArray;
		constant cut_data_widths: IntegerArray;
		constant cut_row_heights: IntegerArray;
		addr_width: natural;
		data_width: natural) return IntegerArray is

	variable n_col, additional_col: integer := 1;
	variable n_cols_array : IntegerArray(1 to cut_address_widths'length) := (others => 0);
	variable  empty_cols, index : integer := 1;
  begin
	empty_cols := data_width;
	while (additional_col /= 0) loop
		opt_find(cut_address_widths, cut_data_widths, cut_row_heights, 
		addr_width, empty_cols, index, n_col, additional_col);

		empty_cols := additional_col;
		n_cols_array(index) := n_cols_array(index) + n_col;
	end loop;
	
	return n_cols_array;
  end find_n_cols;

  -- function: Ceil_Log2
  -- Description: Calculates the ceiling of log to the base 2 of given integer x

  --function Ceil_Log2( constant x : integer) return integer is
	--variable ret_var : integer;
  --begin
    --ret_var := 0;
    --if(x > 1) then
      --while((2**ret_var) < x) loop
        --ret_var := ret_var + 1;
      --end loop;
    --end if;
    --return(ret_var);
  --end Ceil_Log2;


  -- function: find_data_width
  -- Description: Finds the resized data width of required memory cut
  -- Input:
  --	cut_data_widths: array of number of data lines of available cuts
  --	n_cols: array containing the number of columns of a available cuts
  --	   used to form the required MxN array
  -- Output:
  --	Sum of product of number of columns and cut data width of the
  -- 	available cuts

  function find_data_width (constant cut_data_widths: IntegerArray; 
	constant n_cols: Integerarray) return integer is 
	
	variable partial_prod: integer := 0;
  begin
	for i in 1 to cut_data_widths'length loop
		partial_prod := partial_prod + n_cols(i) * cut_data_widths(i);
	end loop;
	
	return(partial_prod);
  end function;


  -- function: col_index
  -- Description: Parts of N of MxN array are mapped to different cuts.
  -- 	To find out which part of N is mapped to a particular cut, index
  --	offset occured to due instantation of previous columns is to be known.
  -- 	This function returns the offset to be added to the resized_data's index 
  -- 	when generating a new column. 
  -- Inputs: 
  --	cut_data_widths: array of number of data lines of available cuts
  -- 	x: array containing the required number of columns of a available cuts  
  --	index: present index in the mem_gen instantiation loop

  function col_index (constant cut_data_widths: IntegerArray; 
	constant x: IntegerArray; index: integer) return integer is
	
	variable output: integer:=0;
  begin
		for i in 1 to index loop
			output := output + x(i)*cut_data_widths(i);
		end loop;
	
	return (output);		
  end function;
	
  -- function: MemDecoder
  -- Description: An n:2^n decoder  
  -- Input: n-bit vector x
  -- Output: 2^n-bit vector whose one of the bit = 0 that represents the given 
  -- input x, other output bits = 1

  function MemDecoder(x: std_logic_vector) return std_logic_vector is
	alias lx: std_logic_vector(x'length-1 downto 0) is x;
	variable ret_var: std_logic_vector((2**x'length)-1 downto 0);
	variable I : integer range 0 to (2**x'length)-1;
  begin
	ret_var := (others => '1');
	I := to_integer(to_unsigned(lx));
	ret_var(I) := '0';
	return(ret_var);
  end MemDecoder;

end package body;

