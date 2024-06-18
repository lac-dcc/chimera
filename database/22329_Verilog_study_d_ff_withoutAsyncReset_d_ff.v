// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module d_ff(
  input wire clk,
  input wire d,
  output reg q
);
  always @(posedge clk)
    begin
      q <= d;
    end
endmodule