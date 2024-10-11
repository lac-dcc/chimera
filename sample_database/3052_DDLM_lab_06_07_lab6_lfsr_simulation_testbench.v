// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

//Testbench for lfsr

`timescale 1ns/1ns

module testbench;

   reg        clk;
   reg        rst_n;
   wire [7:0] prg_out;
   integer    seq_len;
   
   lfsr l_inst
   (
         // Outputs
         .prg_out ( prg_out ),
         // Inputs
         .clk     ( clk     ),
         .rst_n   ( rst_n   )
   );
   
   initial begin
      clk = 0;
      forever #2 clk = ~clk;
   end

   task async_rst;
      begin
         $display("---------- Start async_reset at %0t ns ----------\n",$time);
         #13 rst_n  = 1'b0;
         #14 rst_n  = 1'b1;
         $display("---------- Finish async_reset at %0t ns ----------\n",$time);
      end
   endtask // async_rst
 
   initial begin
      $dumpvars();
      $monitor("Time=%0t ns\t LFSR=0x%h",$time,prg_out);
      rst_n    = 1'b1;
      seq_len  = 0;
      async_rst();
      #20
      //Max len sequence detect
      forever 
      begin
        @(negedge clk)
          begin
             seq_len = seq_len+1;
             if(prg_out == 8'hfc)begin
                $display("---------- Sequence lenght =%0d ----------\n",seq_len);        
                $finish;
             end
          end
      end
   end
   
endmodule // testbench
