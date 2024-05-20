// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module _16bit(
  input wire clk, rst,
  input wire [15:0] i,
  output reg [15:0] o
);
  always @(posedge clk or posedge rst) begin
    if (rst)
      o <= 16'b0000_0000_0000_0000;
    else
      o <= i;
  end

endmodule