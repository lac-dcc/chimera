// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

// 7 bit Register with synchronous enable input
module _7bitSync(
  input wire clk, rst, en,
  input wire [6:0] i,
  output reg [6:0] o
);
  always @(posedge clk, posedge rst)
    begin
      if (rst)
        o <= 7'b0000_000;
      else if (en)
        o <= i;
    end

endmodule