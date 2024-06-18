// This program was cloned from: https://github.com/openXC7/demo-projects
// License: BSD 3-Clause "New" or "Revised" License

module PLL
(
  input  clk_in,
  output  clk_out = 0
);


  always @ (posedge clk_in)
  begin
      clk_out <= ! clk_out;
  end
endmodule
