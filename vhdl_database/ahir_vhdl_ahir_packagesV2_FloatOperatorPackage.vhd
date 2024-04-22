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
	
library aHiR_ieee_proposed;	
use aHiR_ieee_proposed.math_utility_pkg.all;	
use aHiR_ieee_proposed.fixed_pkg.all;	
use aHiR_ieee_proposed.float_pkg.all;	

package FloatOperatorPackage is

  -----------------------------------------------------------------------------
  -- use the float type directly
  -----------------------------------------------------------------------------
  procedure ApFloatResize_proc(l: in float;
                               constant exponent_width : in integer;
                               constant fraction_width : in integer;                               
                               result : out std_logic_vector);
  procedure ApFloatAdd_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatSub_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatMul_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOeq_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOne_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOgt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOge_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOlt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOle_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOrd_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUno_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUeq_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUne_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUgt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUge_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUlt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUle_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatToApIntSigned_proc(l: in float; result : out std_logic_vector);
  procedure ApFloatToApIntUnsigned_proc(l: in float; result : out std_logic_vector);
  procedure ApIntToApFloatSigned_proc(l: in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;
                                      result : out std_logic_vector);
  procedure ApIntToApFloatUnsigned_proc(l: in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;                                        
                                      result : out std_logic_vector);

  -- TODO
  -- procedures ApFloatToApIntSigned_Proc, ApFloatToApIntUnsigned_Proc,
  --            ApIntSignedToApFloat_Proc, ApIntUnsignedToApFloat_Proc
  procedure TwoInputFloatArithOperation(constant id    : in string;
		  			x, y : in std_logic_vector;
		  			constant exponent_width : in integer;
		  			constant fraction_width : in integer;
					result : out std_logic_vector);
  procedure TwoInputFloatCompareOperation(constant id    : in string;
                                   	x, y : in std_logic_vector;
                                   	constant exponent_width : in integer;
                                   	constant fraction_width : in integer;
                                   	result : out std_logic_vector);
  procedure SingleInputFloatOperation(constant id : in string;
                                      x : in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;                                      
                                      result : out std_logic_vector);
  

end package FloatOperatorPackage;

package body FloatOperatorPackage is

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatResize_proc (l : in float;
                                constant exponent_width : in integer;
                                constant fraction_width : in integer;
                                result : out std_logic_vector) is					
  begin
     result := To_SLV(RESIZE(l,exponent_width, fraction_width ));
  end ApFloatResize_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatAdd_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatAdd_proc" severity error;
     result := To_SLV(l+r);  
  end ApFloatAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatSub_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatSub_proc" severity error;
     result := To_SLV(l-r);  
  end ApFloatSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatMul_proc (l : in float; r : in float; result : out std_logic_vector) is
    variable float_result  : float(l'left downto l'right);
  begin
    assert (l'length = r'length)
      report "input operand length mismatch in ApFloatMul_proc" severity error;
    assert (l'length = result'length)						     
      report "input and output operand length mismatch in ApFloatMul_proc" severity error;
    float_result := l*r;  
    result := To_SLV(float_result);  
  end ApFloatMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOeq_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l=r);  
  end ApFloatOeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOne_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l /= r);  
  end ApFloatOne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOgt_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l > r);  
  end ApFloatOgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOge_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l >= r);  
  end ApFloatOge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOlt_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l < r);  
  end ApFloatOlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOle_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l <= r); 
  end ApFloatOle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOrd_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(not(Unordered (x => l,y => r))); 
  end ApFloatOrd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUno_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(Unordered (x => l,y => r)); 
  end ApFloatUno_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUeq_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(eq(l => l, r => r, check_error => false) or Unordered (x => l,y => r)); 
  end ApFloatUeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUne_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result :=  To_SLV(ne(l => l, r => r, check_error => false) or Unordered (x => l,y => r));
  end ApFloatUne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUgt_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  gt(l => l, r => r, check_error => false) or Unordered (x => l,y => r);
     result :=  To_SLV(cr);
  end ApFloatUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUge_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  ge(l => l, r => r, check_error => false) or Unordered (x => l,y => r);  
     result(result'low) :=  to_std_logic(cr);
  end ApFloatUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUlt_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  lt(l => l, r => r, check_error => false) or Unordered (x => l,y => r); 
     result(result'low) := to_std_logic(cr);
  end ApFloatUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUle_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  le(l => l, r => r, check_error => false) or Unordered (x => l,y => r);  
     result(result'low) := to_std_logic(cr);
  end ApFloatUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntSigned_proc (l : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_signed(l,result'length));
  end ApFloatToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntUnsigned_proc (l : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_unsigned(l,result'length));
  end ApFloatToApIntUnsigned_proc; 				

 ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatSigned_proc (l : in std_logic_vector;
                                       constant exponent_width : in integer;
                                       constant fraction_width : in integer;
                                       result : out std_logic_vector) is
  begin
   result := To_SLV(to_float(to_signed(l),exponent_width,fraction_width,round_zero));
  end ApIntToApFloatSigned_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatUnsigned_proc (l : in std_logic_vector;
                                         constant exponent_width : in integer;
                                         constant fraction_width : in integer;                                         
                                         result : out std_logic_vector) is
  begin
   result := To_SLV(to_float(to_unsigned(l),exponent_width, fraction_width,round_zero));
  end ApIntToApFloatUnsigned_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure TwoInputFloatArithOperation(constant id : in string;
                                   x, y : in std_logic_vector;
                                   constant exponent_width : in integer;
                                   constant fraction_width : in integer;
                                   result : out std_logic_vector) is	
    variable result_var : std_logic_vector(exponent_width+fraction_width downto 0);	
    variable temp_int: integer;
  begin
    result_var:= (others => '0');
    if id = "ApFloatAdd" then					
      ApFloatAdd_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatSub" then					
      ApFloatSub_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatMul" then					
      ApFloatMul_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    else	
      assert false report "Unsupported arithmetic float operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end TwoInputFloatArithOperation;			

  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure TwoInputFloatCompareOperation(constant id : in string;
                                   x, y : in std_logic_vector;
                                   constant exponent_width : in integer;
                                   constant fraction_width : in integer;
                                   result : out std_logic_vector) is	
    variable result_var : std_logic_vector(0 downto 0);
    variable temp_int: integer;
  begin

    assert(result'length = 1) report "comparison result must be a 1-bit integer" severity error;

    result_var:= (others => '0');
    if id = "ApFloatOeq" then					
      ApFloatOeq_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOne" then					
      ApFloatOne_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOgt" then					
      ApFloatOgt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOge" then					
      ApFloatOge_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOlt" then					
      ApFloatOlt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOle" then					
      ApFloatOle_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOrd" then					
      ApFloatOrd_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUno" then					
      ApFloatUno_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUeq" then					
      ApFloatUeq_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUne" then					
      ApFloatUne_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUgt" then					
      ApFloatUgt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUge" then					
      ApFloatUge_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUlt" then					
      ApFloatUlt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUle" then					
      ApFloatUle_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    else	
      assert false report "Unsupported float comparison operator-id " & id severity failure;	
    end if;	
    result(result'low) := result_var(0);	
  end TwoInputFloatCompareOperation;			

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure SingleInputFloatOperation(constant id : in string;
                                      x : in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;                                      
                                      result : out std_logic_vector) is	
    variable result_var : std_logic_vector(result'length-1 downto 0);	
  begin
    result_var:= (others => '0');
    if id = "ApFloatToApIntSigned" then					
      ApFloatToApIntSigned_proc(To_Float(x,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatToApIntUnsigned" then					
      ApFloatToApIntUnsigned_proc(To_Float(x,exponent_width,fraction_width), result_var);
    elsif id = "ApIntToApFloatSigned" then					
      ApIntToApFloatSigned_proc(x, exponent_width, fraction_width, result_var);
    elsif id = "ApIntToApFloatUnsigned" then					
      ApIntToApFloatUnsigned_proc(x, exponent_width, fraction_width, result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end SingleInputFloatOperation;	
	
  
	
end package body FloatOperatorPackage;	
