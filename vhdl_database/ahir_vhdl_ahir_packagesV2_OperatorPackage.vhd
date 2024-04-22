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
	
library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.Utilities.all;
	
package OperatorPackage is

  procedure ApConcat_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApBitsel_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntNot_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntToApIntSigned_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntToApIntUnsigned_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntAdd_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSub_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntAnd_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntNand_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntOr_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntNor_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntXor_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntXnor_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntMul_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSHL_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntLSHR_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntASHR_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntROL_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntROR_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntEq_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntNe_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUgt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUge_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUlt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUle_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSgt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSge_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSlt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSle_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);

  -- TODO
  -- procedures ApFloatToApIntSigned_Proc, ApFloatToApIntUnsigned_Proc,
  --            ApIntSignedToApFloat_Proc, ApIntUnsignedToApFloat_Proc

  procedure TwoInputOperation(constant id    : in string; x, y : in std_logic_vector; result : out std_logic_vector);
  procedure SingleInputOperation(constant id : in string; x : in std_logic_vector; result : out std_logic_vector);

  function isTrue(l: in std_logic_vector) return boolean;
  function areEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function uGreaterThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function uGreaterEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function uLessThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function uLessEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function sGreaterThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function sGreaterEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function sLessThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function sLessEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector;
  function Mux2to1 (sel: std_logic_vector; x, y : std_logic_vector) return
		std_logic_vector;

end package OperatorPackage;

package body OperatorPackage is

  -----------------------------------------------------------------------------
  procedure ApConcat_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is
  begin
      result := l & r;
  end procedure;
  -----------------------------------------------------------------------------
  procedure ApBitsel_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is
    variable temp_int: integer;
    alias ll : std_logic_vector (l'length-1 downto 0) is l; 
  begin

      temp_int := To_Integer(To_Unsigned(Ceil_Log2(l'length),r));
      result(result'low) := '0';

      for I in ll'low to ll'high loop
           if (I = temp_int) then
              result(result'low) := ll (I);
           end if;
      end loop;

  end procedure;
  -----------------------------------------------------------------------------
  procedure ApIntNot_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = result'length)						     
      report "Length Mismatch inApIntNot_proc" severity error;
    result := To_SLV(not to_signed(l));
  end ApIntNot_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntSigned_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(RESIZE(to_signed(l), result'length));
  end ApIntToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntUnsigned_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(RESIZE(to_unsigned(l), result'length));
  end ApIntToApIntUnsigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAdd_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAdd_proc" severity error;
    result := To_SLV(to_signed(l)  + to_signed(r));
  end ApIntAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSub_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntSub_proc" severity error;
    result := To_SLV(to_signed(l)  - to_signed(r));
  end ApIntSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAnd_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAnd_proc" severity error;
    result := l and r;
  end ApIntAnd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntNand_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntNand_proc" severity error;
    result := not ( l and r );
  end ApIntNand_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntOr_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntOr_proc" severity error;
    result := l or r;
  end ApIntOr_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntNor_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntNor_proc" severity error;
    result := not (l or r);
  end ApIntNor_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntXor_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntXor_proc" severity error;
    result := l xor r;
  end ApIntXor_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntXnor_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntXnor_proc" severity error;
    result := not (l xor r);
  end ApIntXnor_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntMul_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntMul_proc" severity error;
     result := To_SLV(resize((to_unsigned(l)  * to_unsigned(r)),result'length));
  end ApIntMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSHL_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(to_unsigned(l) sll to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntSHL_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntLSHR_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_unsigned(l)  srl to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntLSHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntASHR_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(shift_right(to_signed(l), to_integer(to_unsigned(Ceil_Log2(l'length)+1,r)))); 
  end ApIntASHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntROL_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(to_unsigned(l) rol to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntROL_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntROR_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(to_unsigned(l) ror to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntROR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntEq_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if l = r then
      result(result'low) := '1';
    else
      result(result'low) := '0';
    end if;
  end ApIntEq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntNe_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if l = r then
      result(result'low) := '0';
    else
      result(result'low) := '1';
    end if;
  end ApIntNe_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUgt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  > to_unsigned(r) then
      result(result'low) := '1';
    else
      result(result'low) := '0';
    end if;
  end ApIntUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUge_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin

    if to_unsigned(l)  >= to_unsigned(r) then
      result(result'low) := '1';      
    else
      result(result'low) := '0';
    end if;    

  end ApIntUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUlt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  < to_unsigned(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';      
    end if;        

  end ApIntUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUle_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  <= to_unsigned(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';            
    end if;        
  end ApIntUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSgt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l)  > to_signed(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';                  
    end if;        
  end ApIntSgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSge_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l)  >= to_signed(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';                  
    end if;        

  end ApIntSge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSlt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l) < to_signed(r) then
      result(result'low) := '1';                        
    else
      result(result'low) := '0';                              
    end if;        

  end ApIntSlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSle_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l) <= to_signed(r) then
      result(result'low) := '1';                              
    else
      result(result'low) := '0';                              
    end if;        
    
  end ApIntSle_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure TwoInputOperation(constant id : in string; x, y : in std_logic_vector; result : out std_logic_vector) is	
    variable result_var : std_logic_vector(result'high downto result'low);	
  begin
    if id = "ApConcat" then
      ApConcat_proc(x,y,result_var);
    elsif id = "ApBitsel" then
      ApBitsel_proc(x,y,result_var);
    elsif id = "ApIntAdd" then					
      ApIntAdd_proc(x,y, result_var);
    elsif id = "ApIntSub" then					
      ApIntSub_proc(x, y, result_var);
    elsif id = "ApIntAnd" then					
      ApIntAnd_proc(x, y, result_var);
    elsif id = "ApIntNand" then					
      ApIntNand_proc(x, y, result_var);
    elsif id = "ApIntOr" then					
      ApIntOr_proc(x, y, result_var);
    elsif id = "ApIntNor" then					
      ApIntNor_proc(x, y, result_var);
    elsif id = "ApIntXor" then					
      ApIntXor_proc(x, y, result_var);
    elsif id = "ApIntXnor" then					
      ApIntXnor_proc(x, y, result_var);
    elsif id = "ApIntMul" then					
      ApIntMul_proc(x, y, result_var);
    elsif id = "ApIntSHL" then					
      ApIntSHL_proc(x, y, result_var);
    elsif id = "ApIntLSHR" then					
      ApIntLSHR_proc(x, y, result_var);
    elsif id = "ApIntASHR" then					
      ApIntASHR_proc(x, y, result_var);
    elsif id = "ApIntROL" then					
      ApIntROL_proc(x, y, result_var);
    elsif id = "ApIntROR" then					
      ApIntROR_proc(x, y, result_var);
    elsif id = "ApIntEq" then					
      ApIntEq_proc(x, y, result_var);
    elsif id = "ApIntNe" then					
      ApIntNe_proc(x, y, result_var);
    elsif id = "ApIntUgt" then					
      ApIntUgt_proc(x, y, result_var);
    elsif id = "ApIntUge" then					
      ApIntUge_proc(x, y, result_var);
    elsif id = "ApIntUlt" then					
      ApIntUlt_proc(x, y, result_var);
    elsif id = "ApIntUle" then					
      ApIntUle_proc(x, y, result_var);
    elsif id = "ApIntSgt" then					
      ApIntSgt_proc(x, y, result_var);
    elsif id = "ApIntSge" then					
      ApIntSge_proc(x, y, result_var);
    elsif id = "ApIntSlt" then					
      ApIntSlt_proc(x, y, result_var);
    elsif id = "ApIntSle" then					
      ApIntSle_proc(x, y, result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end TwoInputOperation;			
  -----------------------------------------------------------------------------
	
  -----------------------------------------------------------------------------	
  procedure SingleInputOperation(constant id : in string; x : in std_logic_vector; result : out std_logic_vector) is	
    variable result_var : std_logic_vector(result'high downto result'low);	
  begin
    if id = "ApIntNot" then					
      ApIntNot_proc(x, result_var);
    elsif id = "ApIntToApIntSigned" then					
      ApIntToApIntSigned_proc(x, result_var);
    elsif id = "ApIntToApIntUnsigned" then					
      ApIntToApIntUnsigned_proc(x, result_var);
-- synopsys translate_off
    elsif id = "ApIntDecode" then					
      result_var := GenericDecode(x);
-- synopsys translate_on
    elsif id = "ApIntEncode" then					
      result_var := GenericEncode(x);
    elsif id = "ApIntPriorityEncode" then					
      result_var := PriorityEncode(x);
    elsif id = "ApIntBitreduceOr" then					
      result_var(result_var'low) := OrReduce(x);
    elsif id = "ApIntBitreduceAnd" then					
      result_var(result_var'low) := AndReduce(x);
    elsif id = "ApIntBitreduceXor" then					
      result_var(result_var'low) := XorReduce(x);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end SingleInputOperation;	
	
  -----------------------------------------------------------------------------
   -- useful function forms.	
  -----------------------------------------------------------------------------	
  function isTrue(l: in std_logic_vector) return boolean is
	variable ret_val: boolean;
        variable r_or : std_logic;
	alias ll : std_logic_vector(1 to l'length) is l;
  begin
	
	r_or := '0';
	for I in 1 to l'length loop
		r_or := (r_or or ll(I));
	end loop;

	if(r_or /= '0')  then
		ret_val := true;
	else
		ret_val := false;
	end if;
	return(ret_val);
  end function;

  function areEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if (l = r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
	
  function uGreaterThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_unsigned(l)  > to_unsigned(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;

  function uGreaterEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_unsigned(l)  >= to_unsigned(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function uLessThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_unsigned(l)  < to_unsigned(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function uLessEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_unsigned(l)  <= to_unsigned(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function sGreaterThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_signed(l)  > to_signed(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function sGreaterEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_signed(l)  >= to_signed(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function sLessThan(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_signed(l)  < to_signed(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;
  function sLessEqual(l: in std_logic_vector; r : in std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(0 downto 0);
  begin
    if to_signed(l)  <= to_signed(r) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end function;

  function Mux2to1 (sel: std_logic_vector; x, y : std_logic_vector) return std_logic_vector is
	variable ret_var : std_logic_vector(1 to x'length);
	alias lsel: std_logic_vector(sel'length downto 1) is sel;
  begin
	assert(x'length = y'length) report "inputs to mux not of same width" severity error;
	if(lsel(1) = '1') then
		ret_var := x;
	else
		ret_var := y;
	end if;
	return(ret_var);
  end Mux2to1;

end package body OperatorPackage;	
