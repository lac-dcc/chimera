// This program was cloned from: https://github.com/The-OpenROAD-Project/OpenROAD
// License: BSD 3-Clause "New" or "Revised" License

module top (in, out, clk);
   input clk;
   input [3:0] in; 
   output [3:0] out; 

   bus4 bus1(.clk(clk), .in(in), .out(out));
endmodule
