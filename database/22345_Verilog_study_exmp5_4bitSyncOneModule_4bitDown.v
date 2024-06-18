// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module _4bitDown(
  input wire clk, set, // wire = physical connection, reg = memory element
  output wire [3:0] o
);
  wire [3:0] i_temp;
  reg [3:0] o_temp;
  always @(posedge clk, posedge set)
  begin
    if (set)
      o_temp <= 4'b1111;
    else
      o_temp <= i_temp;
  end
  assign i_temp = o_temp - 1;
  assign o = o_temp;

endmodule