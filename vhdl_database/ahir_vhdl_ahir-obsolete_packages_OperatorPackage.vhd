library ieee;	
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;	
	
library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
	
library ieee_proposed;	
use ieee_proposed.math_utility_pkg.all;	
use ieee_proposed.fixed_pkg.all;	
use ieee_proposed.float_pkg.all;	

package OperatorPackage is

  procedure ApIntNot_proc(l: in apint; result : out IStdLogicVector);
  procedure ApIntToApIntSigned_proc(l: in apint; result : out IStdLogicVector);
  procedure ApIntToApIntUnsigned_proc(l: in apint; result : out IStdLogicVector);
  procedure ApIntAdd_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSub_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntAnd_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntOr_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntXor_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntMul_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSHL_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntLSHR_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntASHR_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntEq_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntNe_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntUgt_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntUge_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntUlt_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntUle_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSgt_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSge_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSlt_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApIntSle_proc(l: in apint; r : in apint; result : out IStdLogicVector);
  procedure ApFloatResize_proc(l: in apfloat; result : out IStdLogicVector);
  procedure ApFloatAdd_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatSub_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatMul_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOeq_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOne_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOgt_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOge_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOlt_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOle_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatOrd_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUno_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUeq_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUne_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUgt_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUge_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUlt_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatUle_proc(l: in apfloat; r : in apfloat; result : out IStdLogicVector);
  procedure ApFloatToApIntSigned_proc(l: in apfloat; result : out IStdLogicVector);
  procedure ApFloatToApIntUnsigned_proc(l: in apfloat; result : out IStdLogicVector);
  procedure ApIntToApFloatSigned_proc(l: in apint; result : out IStdLogicVector);
  procedure ApIntToApFloatUnsigned_proc(l: in apint; result : out IStdLogicVector);

  -- TODO
  -- procedures ApFloatToApIntSigned_Proc, ApFloatToApIntUnsigned_Proc,
  --            ApIntSignedToApFloat_Proc, ApIntUnsignedToApFloat_Proc

  procedure TwoInputOperation(constant id    : in string; x, y : in IStdLogicVector; result : out IStdLogicVector);
  procedure SingleInputOperation(constant id : in string; x : in IStdLogicVector; result : out IStdLogicVector);

end package OperatorPackage;

package body OperatorPackage is

  -----------------------------------------------------------------------------
  procedure ApIntNot_proc (l : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = result'length)						     
      report "Length Mismatch inApIntNot_proc" severity error;
    result := To_ISLV(to_apint( not to_signed(l)));
  end ApIntNot_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntSigned_proc (l : in apint; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(RESIZE(to_signed(l), result'length)));
  end ApIntToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntUnsigned_proc (l : in apint; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(RESIZE(to_unsigned(l), result'length)));
  end ApIntToApIntUnsigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAdd_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAdd_proc" severity error;
    result := To_ISLV(to_apint(to_signed(l)  + to_signed(r)));
  end ApIntAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSub_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntSub_proc" severity error;
    result := To_ISLV(to_apint(to_signed(l)  - to_signed(r)));
  end ApIntSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAnd_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAnd_proc" severity error;
    result := To_ISLV(to_apint(to_signed(l)  and to_signed(r)));
  end ApIntAnd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntOr_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntOr_proc" severity error;
    result := To_ISLV(to_apint(to_signed(l)  or to_signed(r)));
  end ApIntOr_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntXor_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntXor_proc" severity error;
    result := To_ISLV(to_apint(to_signed(l)  xor to_signed(r)));
  end ApIntXor_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntMul_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntMul_proc" severity error;
     result := To_ISLV(to_apint(resize((to_unsigned(l)  * to_unsigned(r)),result'length)));
  end ApIntMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSHL_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_unsigned(l)  sll to_integer(to_unsigned(r))));
  end ApIntSHL_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntLSHR_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_unsigned(l)  srl to_integer(to_unsigned(r))));
  end ApIntLSHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntASHR_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(shift_right(to_signed(l), to_integer(to_unsigned(r))))); 
  end ApIntASHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntEq_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  = to_signed(r)));
  end ApIntEq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntNe_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  /= to_signed(r)));
  end ApIntNe_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUgt_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_unsigned(l)  > to_unsigned(r)));
  end ApIntUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUge_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_unsigned(l)  >= to_unsigned(r))); 
  end ApIntUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUlt_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_unsigned(l)  < to_unsigned(r)));
  end ApIntUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUle_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_unsigned(l)  <= to_unsigned(r))); 
  end ApIntUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSgt_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  > to_signed(r)));
  end ApIntSgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSge_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  >= to_signed(r)));
  end ApIntSge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSlt_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  < to_signed(r)));
  end ApIntSlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSle_proc (l : in apint; r : in apint; result : out IStdLogicVector) is					
  begin
    result := To_ISLV(to_apint(to_signed(l)  <= to_signed(r)));
  end ApIntSle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatResize_proc (l : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apfloat(RESIZE(to_float(l), result'high, -result'low)));
  end ApFloatResize_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatAdd_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatAdd_proc" severity error;
     result := To_ISLV(to_apfloat(to_float(l) + to_float(r)));  
  end ApFloatAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatSub_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatSub_proc" severity error;
     result := To_ISLV(to_apfloat(to_float(l) - to_float(r)));  
  end ApFloatSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatMul_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatMul_proc" severity error;
     result := To_ISLV(to_apfloat(to_float(l) * to_float(r)));  
  end ApFloatMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOeq_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) = to_float(r)));  
  end ApFloatOeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOne_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) /= to_float(r)));  
  end ApFloatOne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOgt_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) > to_float(r)));  
  end ApFloatOgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOge_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) >= to_float(r)));  
  end ApFloatOge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOlt_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) < to_float(r)));  
  end ApFloatOlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOle_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_float(l) <= to_float(r))); 
  end ApFloatOle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOrd_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(not(Unordered (x => to_float(l),y => to_float(r))))); 
  end ApFloatOrd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUno_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint( Unordered (x => to_float(l),y => to_float(r)))); 
  end ApFloatUno_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUeq_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(eq(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r)))); 
  end ApFloatUeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUne_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result :=  To_ISLV(to_apint(ne(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r))));
  end ApFloatUne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUgt_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result :=  To_ISLV(to_apint(gt(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r))));
  end ApFloatUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUge_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result :=  To_ISLV(to_apint(ge(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r))));  
  end ApFloatUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUlt_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result :=  To_ISLV(to_apint(lt(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r)))); 
  end ApFloatUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUle_proc (l : in apfloat; r : in apfloat; result : out IStdLogicVector) is					
  begin
     result :=  To_ISLV(to_apint(le(l => to_float(l), r => to_float(r), check_error => false) or Unordered (x => to_float(l),y => to_float(r))));  
  end ApFloatUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntSigned_proc (l : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_signed(to_float(l),result'length)));
  end ApFloatToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntUnsigned_proc (l : in apfloat; result : out IStdLogicVector) is					
  begin
     result := To_ISLV(to_apint(to_unsigned(to_float(l),result'length)));
  end ApFloatToApIntUnsigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatSigned_proc (l : in apint; result : out IStdLogicVector) is					
  begin
   result := To_ISLV(to_apfloat(to_float(to_signed(l),result'high,-result'low,round_zero)));
  end ApIntToApFloatSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatUnsigned_proc (l : in apint; result : out IStdLogicVector) is					
  begin
   result := To_ISLV(to_apfloat(to_float(to_unsigned(l),result'high,-result'low,round_zero)));
  end ApIntToApFloatUnsigned_proc; 				
  ---------------------------------------------------------------------

   -----------------------------------------------------------------------------	
  procedure TwoInputOperation(constant id : in string; x, y : in IStdLogicVector; result : out IStdLogicVector) is	
    variable result_var : IStdLogicVector(result'high downto result'low);	
  begin
    if id = "ApIntAdd" then					
      ApIntAdd_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSub" then					
      ApIntSub_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntAnd" then					
      ApIntAnd_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntOr" then					
      ApIntOr_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntXor" then					
      ApIntXor_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntMul" then					
      ApIntMul_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSHL" then					
      ApIntSHL_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntLSHR" then					
      ApIntLSHR_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntASHR" then					
      ApIntASHR_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntEq" then					
      ApIntEq_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntNe" then					
      ApIntNe_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntUgt" then					
      ApIntUgt_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntUge" then					
      ApIntUge_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntUlt" then					
      ApIntUlt_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntUle" then					
      ApIntUle_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSgt" then					
      ApIntSgt_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSge" then					
      ApIntSge_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSlt" then					
      ApIntSlt_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApIntSle" then					
      ApIntSle_proc(To_apint(x), To_apint(y), result_var);
    elsif id = "ApFloatAdd" then					
      ApFloatAdd_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatSub" then					
      ApFloatSub_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatMul" then					
      ApFloatMul_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOeq" then					
      ApFloatOeq_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOne" then					
      ApFloatOne_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOgt" then					
      ApFloatOgt_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOge" then					
      ApFloatOge_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOlt" then					
      ApFloatOlt_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOle" then					
      ApFloatOle_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatOrd" then					
      ApFloatOrd_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUno" then					
      ApFloatUno_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUeq" then					
      ApFloatUeq_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUne" then					
      ApFloatUne_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUgt" then					
      ApFloatUgt_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUge" then					
      ApFloatUge_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUlt" then					
      ApFloatUlt_proc(To_apfloat(x), To_apfloat(y), result_var);
    elsif id = "ApFloatUle" then					
      ApFloatUle_proc(To_apfloat(x), To_apfloat(y), result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end TwoInputOperation;			
  -----------------------------------------------------------------------------
	
  -----------------------------------------------------------------------------	
  procedure SingleInputOperation(constant id : in string; x : in IStdLogicVector; result : out IStdLogicVector) is	
    variable result_var : IStdLogicVector(result'high downto result'low);	
  begin
    if id = "ApIntNot" then					
      ApIntNot_proc(To_apint(x), result_var);
    elsif id = "ApIntToApIntSigned" then					
      ApIntToApIntSigned_proc(To_apint(x), result_var);
    elsif id = "ApIntToApIntUnsigned" then					
      ApIntToApIntUnsigned_proc(To_apint(x), result_var);
    elsif id = "ApFloatResize" then					
      ApFloatResize_proc(To_apfloat(x), result_var);
    elsif id = "ApFloatToApIntSigned" then					
      ApFloatToApIntSigned_proc(To_apfloat(x), result_var);
    elsif id = "ApFloatToApIntUnsigned" then					
      ApFloatToApIntUnsigned_proc(To_apfloat(x), result_var);
    elsif id = "ApIntToApFloatSigned" then					
      ApIntToApFloatSigned_proc(To_apint(x), result_var);
    elsif id = "ApIntToApFloatUnsigned" then					
      ApIntToApFloatUnsigned_proc(To_apint(x), result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end SingleInputOperation;	
	
	
end package body OperatorPackage;	