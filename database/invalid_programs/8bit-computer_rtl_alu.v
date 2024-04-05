module alu(
  input wire enable,
  input wire clk,
  input wire [2:0] mode,
  input wire [N-1:0] in_a,
  input wire [N-1:0] in_b,
  output wire [N-1:0] out,
  output reg flag_zero,
  output reg flag_carry
);

  `include "rtl/parameters.v"

  parameter N = 8;

  reg [N-1:0] buf_out;

  initial begin
    flag_carry = 0;
    flag_zero = 0;
  end

  always @(posedge clk) begin
    if (enable) begin
      case (mode)
        `ALU_ADD: {flag_carry, buf_out} = in_a + in_b;
        `ALU_ADC: {flag_carry, buf_out} = in_a + in_b + flag_carry;
        `ALU_SUB: {flag_carry, buf_out} = in_a - in_b;
        `ALU_INC: {flag_carry, buf_out} = in_a + 1;
        `ALU_DEC: {flag_carry, buf_out} = in_a - 1;
        `ALU_AND: buf_out = in_a & in_b;
        `ALU_OR:  buf_out = in_a | in_b;
        `ALU_XOR: buf_out = in_a ^ in_b;
        default:  buf_out = 'hxx;
      endcase

      flag_zero = (buf_out == 0) ? 1 : 0;

    end
  end

  assign out = buf_out;

endmodule
