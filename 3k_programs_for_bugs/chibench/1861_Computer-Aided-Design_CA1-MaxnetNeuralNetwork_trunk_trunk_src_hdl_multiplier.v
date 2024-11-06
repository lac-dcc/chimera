// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module ieee754_multiplier (
    input [31:0] a,b,
    output reg [31:0] result
);
  parameter EXP_WIDTH = 8;
  parameter FRAC_WIDTH = 23;
  wire underflow, overflow;
  wire [EXP_WIDTH - 1:0] exponent_a, exponent_b, exponent_sum, final_exponent, err;
  wire sign_a, sign_b, sign_final, zero_a, zero_b;
  wire [FRAC_WIDTH:0] mantissa_a, mantissa_b;
  wire [FRAC_WIDTH - 1:0] final_mantissa, temp_a, temp_b;
  wire [47:0] mantissa;

  assign zero_a = ~(|a);
  assign zero_b = ~(|b);

  assign {sign_a, exponent_a, temp_a} = a;
  assign mantissa_a = {1'b1 , temp_a};
  assign {sign_b, exponent_b, temp_b} = b;
  assign mantissa_b = {1'b1 , temp_b};
  assign mantissa = (mantissa_a * mantissa_b) + 1'b1;

  assign sign_final = sign_a ^ sign_b;
  assign exponent_sum = exponent_a + exponent_b - 8'd127;
  assign final_mantissa = mantissa[47] ? mantissa[47:24] : mantissa[46:23] + 1'b1;
  assign final_exponent = mantissa[47] ? exponent_sum + 1 : exponent_sum;

  assign overflow = (exponent_a[7] & exponent_b[7]) & ~final_exponent[7];
  assign underflow = (~exponent_b[7] & ~exponent_a[7] & final_exponent[7]);

  assign err = underflow ? (overflow ? final_exponent : 8'b0) : (overflow ? 8'b11111111 : final_exponent);
  assign result = (zero_a | zero_b) ? 32'b0 : {sign_final, err, final_mantissa};
endmodule

