// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

//Testbench for simple pwm
`timescale 1ns/1ns
module testbench;
   
   localparam PWM_SIZE=8;
   
   reg                clk;
   reg                rst_n;
   reg [PWM_SIZE-1:0] imp_width;
   wire               pwm_out;
   // Quantity of data
   integer            i;
   //random number of pulses
   integer            cycle_cnt;
   
   pwm #(.PWM_WIDTH(PWM_SIZE))
   pwm_inst
     (
      .clk      ( clk       ),
      .rst_n    ( rst_n     ),
      .imp_width( imp_width ),
      .pwm_out  ( pwm_out   )
      );
   
   //Clock generation
   initial begin
      clk = 1'b0;
      forever #2 clk = ~clk;
   end

   task async_rst;
      begin
         $display("---------- Reset start at %0t ns -----------",$time);
         #23 rst_n = 1'b0;
         #15 rst_n = 1'b1;
         $display("---------- Reset finish at %0t ns ---------\n",$time); 
      end
   endtask // async_rst
   
   //Create random input data
   task in_data(input integer imp_cnt);
      begin
         imp_width=$urandom%(2**PWM_SIZE-1);
         repeat(imp_cnt+1)
           @(posedge pwm_out);
      end
   endtask // in_data
   
   
   initial begin
      $dumpvars();
      
      imp_width  = 8'h0;
      rst_n      = 1'b1;
      
      //Async reset
      async_rst;
      
      //Start simulation

      for(i=0;i<10;i=i+1)
        begin
           cycle_cnt = $urandom%(10);
           #10 in_data(cycle_cnt);
        end
      #100 $finish;
   end 
   
endmodule // testbench
