//Testbench for simple_counter

`timescale 1ns/1ns
module testbench;

   localparam W = 8;

   reg          clk;
   reg          rst_n;
   wire [W-1:0] cnt;

 
   simple_counter #(.WIDTH(W))
   cnt1(
 // Outputs
        .cnt    ( cnt   ),
 // Inputs
        .clk    ( clk   ),
        .rst_n  ( rst_n ));
   
   //Clock generation
   initial begin
      clk = 0;
      forever #10 clk = !clk;
   end

   initial begin
      $dumpvars;
      
      $monitor("@time=%0t\t cnt=0x%h\n",$time,cnt);
      rst_n      = 1;
      #15 rst_n  = 0;
      #25 rst_n  = 1;
      #350 $finish;
   end
endmodule // testbench

