// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

// Incomplete floating-point adder
//
// Positive numbers only
// No rounding
// No infinity and NaN (Not a Number)

module incomplete_fp_adder
  (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum,
    output        zero,
    output        pos_inf,
    output        neg_inf,
    output        nan
  );
  
  // Extract the exponents

  wire [7:0] orig_a_exp = a [30:23];
  wire [7:0] orig_b_exp = b [30:23];
  
  // Swap the numbers if the exponent of the first is larger
  
  wire [31:0] swap_a, swap_b;
  
  assign { swap_a, swap_b }
    = orig_a_exp > orig_b_exp ? { b, a } : { a, b };
    
  // Extract sign, mantissa / significand and exponent

  wire        a_sign , b_sign ;
  wire [ 7:0] a_exp  , b_exp  ;
  wire [22:0] a_mant , b_mant ;
  
  assign { a_sign, a_exp, a_mant } = swap_a;
  assign { b_sign, b_exp, b_mant } = swap_b;

  // Shift the significand of the number with the smaller exponent
  // Here we assume that a is not zero

  wire [23:0] a_mant_shifted
    = { 1'b1, a_mant } >> (b_exp - a_exp);

  // Add the significands
  // Here we assume that b is not zero
  
  wire carry;
  wire [23:0] added_mants;
  
  assign { carry, added_mants }
    = a_mant_shifted + { 1'b1, b_mant };
  
  // !!! Note that in Verilog if we add two 24-bit numbers
  // and the left hand side is 25-bit-wide, it does generate carry bit
  // to the most significant bit of the result.
  
  // Check carry and adjust
  
  reg [ 7:0] sum_exp;
  reg [22:0] sum_mant;
  
  always @*
    if (carry)
      begin
        sum_exp  = b_exp + 1'd1;
        sum_mant = added_mants [23:1];
      end
      else
      begin
        sum_exp  = b_exp;
        sum_mant = added_mants [22:0];
      end
  
  // Forming the result

  wire [31:0] calculated_sum
    = { 1'b0,  // sign is not implemented
        sum_exp, sum_mant };
  
  wire a_zero = (a [30:0] == 31'b0);
  wire b_zero = (b [30:0] == 31'b0);
  
  assign sum = a_zero ? b : b_zero ? a : calculated_sum;
                 
  assign zero    = (sum [30:0] == 31'b0);
  assign pos_inf = 1'b0;  // Positive infinity is not implemented
  assign neg_inf = 1'b0;  // Negative infinity is not implemented
  assign nan     = 1'b0;  // Not a Number (NaN) is not implemnted
  
endmodule
