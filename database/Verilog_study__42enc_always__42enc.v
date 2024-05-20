// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module _42enc(
  input [3:0] y,
  output reg [1:0] a
);

always @(*)  // sensitivity list is always the input
begin
  case (y)
    4'b0001: a = 2'b00;
    4'b0010: a = 2'b01;
    4'b0100: a = 2'b10;
    4'b1000: a = 2'b11;
    default: a = 2'b00;
  endcase
end

endmodule