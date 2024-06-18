// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// Up-down counter_tb
`timescale 1ns/1ns
module testbench;
   
   localparam NEW_WIDTH = 32;
   
   reg                  clk;
   reg                  rst_n;
   reg                  up_down;
   wire [NEW_WIDTH-1:0] cnt;
   integer              rst_time;
   integer              i;
   integer              up_time;
   integer              down_time;
   

   cnt_updown #(.WIDTH(NEW_WIDTH)) cnt_dut (
      .clk     ( clk     ),
      .rst_n   ( rst_n   ),
      .up_down ( up_down ),
      .cnt     ( cnt     )
      );
   
  // Clock generator
   initial begin
      clk = 0;
      forever #10 clk = !clk ;
   end

   
   task reset(input integer  rst_time);
      begin
         $display("########## Reset start ##########");
         rst_n      = 1'b0;
         #(rst_time) rst_n  = 1'b1;
         $display("########## Reset finish ##########\n");
      end
   endtask // reset  

   initial begin
      //Init variable for gtkwave
      $dumpvars();

      $monitor("time=%0t\t up_down=%b\t cnt=0x%h",$time,up_down,cnt);
      rst_n    = 1'b1;
      up_down  = 1'b0;

      reset(24);
      
      for(i=0;i<10;i=i+1)begin
         up_time               = $urandom%(1000)+20;
         down_time             = $urandom%(1000)+20;
         #(up_time) up_down    = 1'b0;
         #(down_time) up_down  = 1'b1;
      end

      #100 $finish;
      
   end
endmodule // testbench
