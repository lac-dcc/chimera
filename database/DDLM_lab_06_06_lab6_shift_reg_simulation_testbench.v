// Testbench for shift_reg module

`timescale 1ns/1ns

module testbench;

   localparam WIDTH=8;
   
   reg        clk;
   reg        rst_n;
   reg        shift_en;
   reg        data_in;
   wire [7:0] data_out;
   wire       serial_out;
      
   
   shift_reg #(.WIDTH(WIDTH)) shft
   (// Outputs
      .data_out   ( data_out   ),
      .serial_out ( serial_out ),
      // Inputs
      .clk        ( clk        ),
      .rst_n      ( rst_n      ),
      .data_in    ( data_in    ),
      .shift_en   ( shift_en   )
   );

   //Clock generation
   initial begin
      clk = 0;
      forever #4 clk = ~clk;
   end

   // Create serial package
   task push;
      begin
         $display("########## Shift enable active ##########");
         shift_en  = 1'b1;
         repeat(9)begin
            @(negedge clk)
              data_in = $urandom%2;
         end
         shift_en  = 1'b0;
         $display("########## Shift enable disable ##########\n");
      end
   endtask

   // Create reset signal
   task async_rst;
      begin
         $display("########## RESET start! ##########");
         #10 rst_n = 1'b0;
         #10 rst_n = 1'b1;
         $display("########## RESET finish!\n ##########");
      end
   endtask
   
   initial begin
      $dumpvars();
      $display("#################### Starting simulation ####################");
      $monitor("@time=%0t\t data_out=0x%h\t",$time,data_out);
      
      shift_en  = 1'b0;
      rst_n     = 1'b1;
      data_in   = 1'b0;
      
      //Async reset
      async_rst();
      
     //Push new data
      repeat(10) begin
         #50 push;
      end      
      #200 $finish;
   end
   
endmodule // testbench
