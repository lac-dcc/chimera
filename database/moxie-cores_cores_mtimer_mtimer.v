module mtimer 
   (/*AUTOARG*/
   // Outputs
   tick_o,
   // Inputs
   clk_i, rst_i
   );

   input clk_i, rst_i;
   output reg	tick_o;

   reg [23:0] cnt;

   wire       done;
   assign done = (cnt == 24'b101111101011110000100000);
   
   always @(posedge clk_i)
     cnt <= (done | rst_i) ? 0 : (cnt + 1);

   always @(posedge clk_i)
     tick_o <= rst_i ? 1'b0 : done;

endmodule // mtimer
