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
use ahir.OperatorPackage.all;
use ahir.FloatOperatorPackage.all;


library ahir_ieee_proposed;
use ahir_ieee_proposed.float_pkg.all;

entity GenericCombinationalOperator is
  generic
    (
      name: string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer := 4;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer := 0;    -- width of input2
      num_inputs    : integer := 1;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer := 4;          -- width of output.
      constant_operand : std_logic_vector := "0001"; -- constant operand.. (it is always the second operand)
      constant_width: integer := 4;
      use_constant  : boolean := true
      );
  port (
    data_in       : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    result      : out std_logic_vector(owidth-1 downto 0)
    );
end GenericCombinationalOperator;


architecture Vanilla of GenericCombinationalOperator is
  constant iwidth : integer := iwidth_1 + iwidth_2;
begin  -- Behave

  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;

  TwoOperand : if num_inputs = 2 generate
    -- int x int -> int
    TwoOpIntIntInt: if input1_is_int and input2_is_int and output_is_int generate
      process(data_in)
        variable   result_var : std_logic_vector(owidth-1 downto 0);
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
      begin
        op1 := data_in(iwidth-1 downto iwidth_2);
        op2 := data_in(iwidth_2-1 downto 0);
        result_var := (others => '0');
        TwoInputOperation(operator_id, op1, op2,result_var);
        result <= result_var;
      end process;
    end generate TwoOpIntIntInt;

    -- float x float -> float
    TwoOpFloatFloatFloat: if (not input1_is_int) and (not input2_is_int) and (not output_is_int) generate
      assert(iwidth_1 = iwidth_2) report "floatXfloat -> float operation: inputs must be of the same width." severity error;
      assert(input1_characteristic_width = input2_characteristic_width) report "floatXfloat -> float operation: input exponent sizes must be the same."
        severity error;
      
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);
      begin
        op1 := data_in(iwidth-1 downto iwidth_2);
        op2 := data_in(iwidth_2-1 downto 0);
        result_var := (others => '0');
        TwoInputFloatArithOperation(operator_id, op1,op2,input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate TwoOpFloatFloatFloat;

    -- float x float -> int
    TwoOpFloatFloatInt: if ((not input1_is_int) and (not input2_is_int) and output_is_int) generate
      assert(iwidth_1 = iwidth_2) report "floatXfloat -> int operation: inputs must be of the same width." severity error;
      assert(input1_characteristic_width = input2_characteristic_width) report "floatXfloat -> int operation: input exponent sizes must be the same."
        severity error;
      
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);        
      begin
        result_var := (others => '0');

	op1 := data_in(iwidth-1 downto iwidth_2);
	op2 := data_in(iwidth_2-1 downto 0);

        TwoInputFloatCompareOperation(operator_id, op1,op2, input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate TwoOpFloatFloatInt;

    -- float x int -> * and int x float -> * are not permitted.
    assert(input1_is_int = input2_is_int) report "both operands of two input operators should be either ints or floats"
      severity failure;

    -- int x int -> float is not permitted.
    assert((not input1_is_int) or output_is_int) report "if the inputs to a two-input operation are ints, the output cannot be a float!" severity failure;

  end generate TwoOperand;


  SingleOperandNoConstant : if num_inputs = 1 and not use_constant generate

    SingleOperandNoConstantIntInt: if input1_is_int and output_is_int generate
      process(data_in)
        variable   result_var    : std_logic_vector(owidth-1 downto 0);
      begin
        result_var := (others => '0');
        SingleInputOperation(operator_id, data_in, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantIntInt;
    
    SingleOperandNoConstantFloatFloat: if (not input1_is_int) and (not output_is_int) generate

      -- the resize operation is to be treated specially, since
      -- there are two different conversions..
      ResizeFloat: if (operator_id = "ApFloatResize") generate

        Trivial: if ((output_mantissa_width = input1_mantissa_width) and
			(output_characteristic_width = input1_characteristic_width)) generate
		result <= data_in;
	end generate Trivial;

        NonTrivial: if ((output_mantissa_width /= input1_mantissa_width) or
			(output_characteristic_width /= input1_characteristic_width)) generate
          process(data_in)
            variable op1: std_logic_vector(iwidth_1-1 downto 0);
            variable   result_var: std_logic_vector(owidth-1 downto 0);                
          begin
            op1 := data_in;
            result_var := (others => '0');
            ApFloatResize_proc(To_Float(op1, input1_characteristic_width, input1_mantissa_width),
                               output_characteristic_width,
                               output_mantissa_width,
                               result_var);
            result <= result_var;
          end process;        
	end generate NonTrivial;
      end generate ResizeFloat;

      NotResizeFloat: if (operator_id /= "ApFloatResize") generate
        
        process(data_in)
          variable op1: std_logic_vector(iwidth_1-1 downto 0);
          variable   result_var: std_logic_vector(owidth-1 downto 0);                
        begin
          op1 := data_in;
          result_var := (others => '0');
          SingleInputFloatOperation(operator_id, op1, input1_characteristic_width, input1_mantissa_width, result_var);
          result <= result_var;
        end process;
      end generate NotResizeFloat;
      
    end generate SingleOperandNoConstantFloatFloat;

    SingleOperandNoConstantFloatInt: if (not input1_is_int) and output_is_int generate
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);                
      begin
        op1 := data_in;
        result_var := (others => '0');
        SingleInputFloatOperation(operator_id, op1, input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantFloatInt;

    SingleOperandNoConstantIntFloat: if (input1_is_int) and (not output_is_int) generate
      process(data_in)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                
      begin
        result_var := (others => '0');
        SingleInputFloatOperation(operator_id, data_in, output_characteristic_width, output_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantIntFloat;
  end generate SingleOperandNoConstant;

  SingleOperandWithConstant : if num_inputs = 1 and use_constant generate

    SingleOperandWithConstantIntInt: if input1_is_int and output_is_int generate
      SigBlock: block
        signal op2_sig : std_logic_vector(constant_width-1 downto 0);
      begin  -- block SigBlock
        -- TODO: changes here.
        op2_sig <= constant_operand;

        process(data_in,op2_sig)
          variable   result_var    : std_logic_vector(owidth-1 downto 0);
        begin
          result_var := (others => '0');
          TwoInputOperation(operator_id,
                            data_in,
                            op2_sig,
                            result_var); 
          result <= result_var;
        end process;
      end block SigBlock;
    end generate SingleOperandWithConstantIntInt;

    SingleOperandWithConstantFloatInt: if (not input1_is_int) and output_is_int generate

      SigBlock: block
      	signal op2_sig: std_logic_vector(constant_width-1 downto 0);
      begin
      op2_sig <= constant_operand;
      process(data_in, op2_sig)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                        
      begin
        result_var := (others => '0');
       	TwoInputFloatCompareOperation(operator_id, data_in, op2_sig,input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
      end block SigBlock;
    end generate SingleOperandWithConstantFloatInt;

    SingleOperandWithConstantFloatFloat: if (not input1_is_int) and (not output_is_int) generate
      SigBlock: block
      	signal op2_sig: std_logic_vector(constant_width-1 downto 0);
      begin
      op2_sig <= constant_operand;
      process(data_in, op2_sig)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                        
      begin
        result_var := (others => '0');
       	TwoInputFloatArithOperation(operator_id, data_in, op2_sig, input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end block SigBlock;
    end generate SingleOperandWithConstantFloatFloat;
  end generate SingleOperandWithConstant;
  
end Vanilla;



