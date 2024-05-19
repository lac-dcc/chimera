// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns / 1ps
`include "iob_lib.vh"

//test defines
`define ADDR_W 4
`define TESTSIZE 256 //bytes


module iob_fifo_async_tb;

   localparam TESTSIZE = `TESTSIZE; //bytes
   localparam W_DATA_W = `W_DATA_W;
   localparam R_DATA_W = `R_DATA_W;
   localparam MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W);
   localparam MINDATA_W = `IOB_MIN( W_DATA_W, R_DATA_W );
   localparam ADDR_W = `ADDR_W;
   localparam R=MAXDATA_W/MINDATA_W;
   localparam MINADDR_W = ADDR_W-$clog2(R);//lower ADDR_W (higher DATA_W)
   localparam W_ADDR_W = W_DATA_W == MAXDATA_W? MINADDR_W : ADDR_W;
   localparam R_ADDR_W = R_DATA_W == MAXDATA_W? MINADDR_W : ADDR_W;

   reg reset = 0;

   //write port
   reg                 w_clk = 0;
   reg                 w_en = 0;
   reg [W_DATA_W-1:0]  w_data;
   wire                w_empty;
   wire                w_full;
   wire [ADDR_W:0]     w_level;

   //read port
   reg                 r_clk = 0;
   reg                 r_en = 0;
   wire [R_DATA_W-1:0] r_data;
   wire                r_empty;
   wire                r_full;
   wire [ADDR_W:0]     r_level;


   // clocks
   parameter clk_per_w = 10; //ns
   always #(clk_per_w/2) w_clk = ~w_clk;
   parameter clk_per_r = 13; //ns
   always #(clk_per_r/2) r_clk = ~r_clk;

   integer             i,j; //iterators

   reg [TESTSIZE*8-1:0] test_data;
   reg [TESTSIZE*8-1:0] read;

   //
   // WRITE PROCESS
   //
   reg                  w_r_en = 0;//disable reads initially

   initial begin

      if(W_DATA_W > R_DATA_W)
        $display("W_DATA_W > R_DATA_W");
      else if (W_DATA_W < R_DATA_W)
        $display("W_DATA_W < R_DATA_W");
      else
        $display("W_DATA_W = R_DATA_W");

      $display("W_DATA_W=%d", W_DATA_W);
      $display("W_ADDR_W=%d", W_ADDR_W);
      $display("R_DATA_W=%d", R_DATA_W);
      $display("R_ADDR_W=%d", R_ADDR_W);

      //create the test data bytes
      for (i=0; i < TESTSIZE; i=i+1)
        test_data[i*8 +: 8] = i;

      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif
      repeat(4) @(posedge w_clk) #1;


      //reset FIFO
      #clk_per_w;
      @(posedge w_clk) #1;
      reset = 1;
      repeat (4) @(posedge w_clk) #1;
      reset = 0;

      //wait for FIFO ready (full = 0)
      while (w_full) @(posedge w_clk) #1;

      //fill up the FIFO
      for(i = 0; i < 2**W_ADDR_W; i = i + 1) begin
         w_en = 1;
         w_data = test_data[i*W_DATA_W +: W_DATA_W];
         @(posedge w_clk) #1;
      end
      w_en = 0;

      if(w_full != 1) begin
         $display("ERROR: expecting w_full=1");
         $finish;
      end
      $display("INFO: w_full=1 as expected");


      if(w_level != 2**ADDR_W) begin
        $display("ERROR: expecting w_level = 2**ADDR, got %d", w_level);
         $finish;
      end
      $display("INFO: w_level = 2**ADDR as expected");

      //enable reads and wait for empty
      w_r_en = 1;
      while (!w_empty) @(posedge w_clk) #1;
      $display("INFO: w_empty=0 as expected");

      //write test data continuously to the FIFO
      for(i = 0; i < ((TESTSIZE*8)/W_DATA_W); i = i + 1) begin
         while(w_full)  @(posedge w_clk) #1;
         w_en = 1;
         w_data = test_data[i*W_DATA_W +: W_DATA_W];
         @(posedge w_clk) #1;
         w_en = 0;
      end

   end

   //
   // READ PROCESS
   //

   initial begin

      //wait for reset to be de-asserted
      @(negedge reset) repeat(4) @(posedge r_clk) #1;
      while(!w_r_en) @(posedge r_clk) #1;


      //wait for FIFO full
      while (!r_full)  @(posedge r_clk) #1;
      $display("INFO: r_full=1 as expected");

      //read data from the entire FIFO
      for(j = 0; j < 2**R_ADDR_W; j = j + 1) begin
         while(r_empty) @(posedge r_clk) #1;
         r_en = 1;
         @(posedge r_clk) #1;
         read[j*R_DATA_W +: R_DATA_W] = r_data;
         r_en = 0;
      end

      while(!r_empty)  @(posedge r_clk) #1;
      $display("INFO: r_empty = 1 as expected");


      if(r_level != 0) begin
         $display("ERROR: expecting r_level = 0, but got r_level=%d", r_level);
         $finish;
      end
      $display("INFO: r_level = 0 as expected");


      //read data continuously from the FIFO
      for(j = 0; j < ((TESTSIZE*8)/R_DATA_W); j = j + 1) begin
         while(r_empty) @(posedge r_clk) #1;
         r_en = 1;
         @(posedge r_clk) #1;
         read[j*R_DATA_W +: R_DATA_W] = r_data;
         r_en = 0;
      end

      if(read !== test_data) begin
        $display("ERROR: data read does not match the test data.");
        $display("data read XOR test data: %x", read^test_data);
      end
      $display("INFO: data read matches test data as expected");

      #(5*clk_per_r) $finish;
   end

   // Instantiate the Unit Under Test (UUT)
   iob_fifo_async
     #(
       .W_DATA_W(W_DATA_W),
       .R_DATA_W(R_DATA_W),
       .ADDR_W(ADDR_W)
       )
   uut
     (
      .rst(reset),

      .r_clk(r_clk),
      .r_en(r_en),
      .r_data(r_data),
      .r_empty(r_empty),
      .r_full(r_full),
      .r_level(r_level),

      .w_clk(w_clk),
      .w_en(w_en),
      .w_data(w_data),
      .w_empty(w_empty),
      .w_full(w_full),
      .w_level(w_level)
      );

endmodule
