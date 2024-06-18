// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module bugs_addsubz (
  input do_sub,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] out,
  output reg result_is_zero

);

  always @(*) begin
    case (do_sub)
      0: out = a + b;
      1: out = a - b;
    endcase
    result_is_zero = (out == 0);
  end

endmodule



