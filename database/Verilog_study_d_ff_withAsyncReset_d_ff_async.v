// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module d_ff_async (
  input wire clk,
  input wire rst_n,
  input wire d,
  output reg q
);
  always @(posedge clk or negedge rst_n) begin
    if (rst_n)
      q <= 1'b0;  // Asynchronous reset
    else
      q <= d;
  end
endmodule