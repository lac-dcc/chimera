// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

module lfsr (out, clk, rst);

   output reg [63:0] out;
   input clk, rst;

   wire feedback;

   assign feedback = ~(out[63] ^ out[62] ^ out[60] ^ out[59]);

   always @(posedge clk, posedge rst)
   begin
    if (rst)
       out <= 64'b0;
    else
      out <= {out[62:0],feedback};
    end

 endmodule