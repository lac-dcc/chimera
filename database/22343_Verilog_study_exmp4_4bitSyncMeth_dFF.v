// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module dff(
  input wire clk, set, en,
  input wire [3:0] i,
  output wire [3:0] o
);
  reg [3:0] o_reg;
  wire [3:0] o_next;
  always @(posedge clk, posedge set)
  begin
    if (set)
      o_reg <= 4'b1111;
    else if (en)
      o_reg <= o_next;
  end
  assign o_next = i;
  assign o = o_reg;

endmodule