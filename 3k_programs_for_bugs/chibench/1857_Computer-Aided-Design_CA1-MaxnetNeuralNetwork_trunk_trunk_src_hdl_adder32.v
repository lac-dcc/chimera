// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Adder32 
  (input [31:0]a,
   input [31:0]b,
   output reg  [31:0] result);

  reg [23:0] mantissa_a,mantissa_b,temp_m;
  reg [22:0] Mantissa;
  reg [7:0] Exponent;
  reg Sign;
  wire MSB;
  reg [7:0] A_Exponent,B_Exponent,Temp_Exponent,diff_Exponent;
  reg A_sign,B_sign,Temp_sign;
  reg [32:0] Temp;
  reg carry;
  reg [2:0] one_hot;
  reg comp;
  reg [7:0] exp_adjust;

    always @* begin

    if(a[30:23] >= b[30:23]) 
    begin
      mantissa_a = {1'b1, a[22:0]};
      A_Exponent = a[30:23];
      A_sign = a[31];
      mantissa_b = {1'b1, b[22:0]};
      B_Exponent = b[30:23];
      B_sign = b[31];
    end
    else
    begin
      mantissa_a = {1'b1, b[22:0]};
      A_Exponent = b[30:23];
      A_sign = b[31];
      mantissa_b = {1'b1, a[22:0]};
      B_Exponent = a[30:23];
      B_sign = a[31];
    end

    diff_Exponent = A_Exponent-B_Exponent;
    mantissa_b = (mantissa_b >> diff_Exponent);
    {carry,temp_m} =  (A_sign ~^ B_sign)? mantissa_a + mantissa_b : mantissa_a-mantissa_b ;
    exp_adjust = A_Exponent;
    if(carry)
    begin
      temp_m = temp_m>>1;
      exp_adjust = exp_adjust+1'b1;
    end
    else
    begin
      while(!temp_m[23])
      begin
        temp_m = temp_m<<1;
        exp_adjust =  exp_adjust-1'b1;
      end
    end

    Sign = A_sign;
    Mantissa = temp_m[22:0];
    Exponent = exp_adjust;
    result = {Sign,Exponent,Mantissa};
    end

    //Temp_Mantissa = (A_sign ~^ B_sign) ? (carry ? Temp_Mantissa>>1 : Temp_Mantissa) : (0);
    //Temp_Exponent = carry ? A_Exponent + 1'b1 : A_Exponent;
    //Temp_sign = A_sign;
    //result = {Temp_sign,Temp_Exponent,Temp_Mantissa[22:0]};
endmodule
