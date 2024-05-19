// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// Testbench for simulation

`timescale 1ns/1ns
module testbench;

   localparam NEW_WIDTH = 16;
   
   reg                  clk;
   reg                  rst_n;
   reg                  load;
   reg [NEW_WIDTH-1:0]  data_load;
   wire [NEW_WIDTH-1:0] cnt;
   integer              i;
   integer              pre_delay;
   integer              load_width;
   
   cnt_load #(.WIDTH(NEW_WIDTH))
   cnt_dut (
            .clk       ( clk       ),
            .rst_n     ( rst_n     ),
            .load      ( load      ),
            .data_load ( data_load ),
            .cnt       ( cnt       )
      );
   
   // Clock generator
   initial begin
      clk=0;
      forever #10 clk=!clk;
   end
   
 // Set reset duration
   task reset(input integer unsigned rst_time);
      begin
         $display("########## Reset start ##########");
         rst_n  = 1'b0;
         #(rst_time) rst_n =1'b1;
         $display("########## Reset finish ##########\n");
      end
   endtask // reset

   // Set random data for load
   task set_data;
      begin
         $display("########## Set load_data ##########");
         pre_delay       = $urandom%(30);
         load_width        = $urandom%(50)+10;
         data_load       = $urandom%(2**NEW_WIDTH-1);
         #(pre_delay) load   = 1'b1;
         #(load_width) load  = 1'b0;
         $display("########## Finish load data ##########\n");
      end   
   endtask // set_data
   
   initial begin
      //For Icarus simulation
      $dumpvars();
      
      $monitor("@time=%0t\t load=%0b\t data_load=0x%h\t cnt=0x%h",$time,load,data_load,cnt);
      //Initial value at 0 time
      rst_n    = 1'b1;
      load   = 1'b0;
      data_load  = 0;

      //Reset design
      #14 reset(24);

      // Generate load_data
      for(i=0;i<10;i=i+1)begin
         #80 set_data();
      end
      #100 $finish;
            
   end
endmodule // testbench
