// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps
`include "iob_lib.vh"

//test defines
`define W_DATA_W 32
`define R_DATA_W 8
`define MAXADDR_W 10


module iob_ram_t2p_asym_tb;

   //determine W_ADDR_W and R_ADDR_W
   localparam W_DATA_W = `W_DATA_W;
   localparam R_DATA_W = `R_DATA_W;
   localparam MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W);
   localparam MINDATA_W = `IOB_MIN(W_DATA_W, R_DATA_W);
   localparam MAXADDR_W = `MAXADDR_W;
   localparam MINADDR_W = MAXADDR_W - $clog2(MAXDATA_W/MINDATA_W);
   localparam W_ADDR_W = W_DATA_W == MINDATA_W? MAXADDR_W: MINADDR_W;
   localparam R_ADDR_W = R_DATA_W == MINDATA_W? MAXADDR_W: MINADDR_W;
 
   //write port 
   reg w_clk = 0;
   reg w_en = 0;
   reg [`W_DATA_W-1:0] w_data;
   reg [W_ADDR_W-1:0] w_addr;
   //read port
   reg                 r_clk = 0;
   reg                 r_en = 0;
   wire [`R_DATA_W-1:0] r_data;
   reg [R_ADDR_W-1:0]  r_addr;


   // clocks
   localparam clk_per_w = 10; //ns
   always #(clk_per_w/2) w_clk = ~w_clk; 

   localparam clk_per_r = 13; //ns
   always #(clk_per_r/2) r_clk = ~r_clk;
   
   localparam seq_ini = 10;
   integer              i;

   reg [`W_DATA_W*2**W_ADDR_W-1:0] test_data;
   reg [`R_DATA_W-1:0]             r_data_expected;

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
      
      //compute the test data
      for (i=0; i < 2**W_ADDR_W; i=i+1)
        test_data[i*`W_DATA_W +: `W_DATA_W] = i+seq_ini;    
      
      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif
      repeat(4) @(posedge w_clk) #1;

      //write all the locations of RAM 
      w_en = 1; 
      for(i = 0; i < 2**W_ADDR_W; i = i + 1) begin
         w_addr = i;
         w_data = i+seq_ini;
         @(posedge w_clk) #1;
      end
      w_en = 0;

      @(posedge r_clk) #1;

      //read all the locations of RAM
      r_en = 1;
      for(i = 0 ; i < 2**R_ADDR_W; i = i + 1) begin
         r_addr = i;
         @(posedge r_clk) #1;
         //verify response
         r_data_expected = test_data[i*`R_DATA_W +: `R_DATA_W];
         if(r_data !== r_data_expected)
           $display("ERROR: read addr=%x, got %x, expected %x", r_addr, r_data, r_data_expected);
      end
      
      #(5*clk_per_w) $finish;
   end


   // instantiate the Unit Under Test (UUT)
   iob_ram_t2p_asym
     #(
       .W_DATA_W(W_DATA_W),
       .R_DATA_W(R_DATA_W),
       .ADDR_W(MAXADDR_W)
       )
   uut 
     (
      .w_clk(w_clk), 
      .w_en(w_en),
      .w_addr(w_addr),
      .w_data(w_data), 
      
      .r_clk(r_clk),
      .r_en(r_en), 
      .r_addr(r_addr),
      .r_data(r_data)
      );

   
endmodule
