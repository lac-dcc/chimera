// Testbench for clock divider

`timescale 1ns/1ns
module testbench;

   localparam DIV_CNT = 10;
   
   reg  clk_in;
   reg  rst_n;
   wire clk_out;
   
   

   cnt_div #(.DIV_CNT(DIV_CNT)) 
   cnt_dut(
	         .clk_in  ( clk_in  ),
	         .rst_n   ( rst_n   ),
	         .clk_out ( clk_out )
	 );
   
   //Clock generation
   initial begin
      clk_in = 0;
      forever #10 clk_in = !clk_in;
   end

      
   initial begin
      $dumpvars();
      rst_n      = 1'b1;
      #13 rst_n  = 1'b0;
      #25 rst_n  = 1'b1;
      repeat(5)
        @(posedge clk_out);
      #20 $finish;
      
   end

endmodule // testbench
