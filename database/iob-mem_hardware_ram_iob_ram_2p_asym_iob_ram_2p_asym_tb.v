// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns / 1ps

// test defines
`define W_DATA_W 32
`define R_DATA_W 8
`define MAXADDR_W 10

module iob_ram_2p_asym_tb;

   // determine W_ADDR_W and R_ADDR_W
   localparam W_DATA_W = `W_DATA_W;
   localparam R_DATA_W = `R_DATA_W;
   localparam MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W);
   localparam MINDATA_W = `IOB_MIN(W_DATA_W, R_DATA_W);
   localparam MAXADDR_W = `MAXADDR_W;
   localparam MINADDR_W = MAXADDR_W - $clog2(MAXDATA_W/MINDATA_W);
   localparam W_ADDR_W = W_DATA_W == MINDATA_W? MAXADDR_W: MINADDR_W;
   localparam R_ADDR_W = R_DATA_W == MINDATA_W? MAXADDR_W: MINADDR_W;
   localparam N = MAXDATA_W/MINDATA_W;

   reg clk = 0;

   // external write port
   wire [N-1:0]        ext_mem_w_en;
   wire [N*MINADDR_W-1:0] ext_mem_w_addr;
   wire [N*MINDATA_W-1:0] ext_mem_w_data;
   // external read port
   wire                ext_mem_r_en;
   wire [N*MINADDR_W-1:0] ext_mem_r_addr;
   reg  [N*MINDATA_W-1:0] ext_mem_r_data;

   // write port
   reg w_en = 0;
   reg [W_DATA_W-1:0] w_data;
   reg [W_ADDR_W-1:0] w_addr;
   // read port
   reg                r_en = 0;
   wire [R_DATA_W-1:0] r_data;
   reg [R_ADDR_W-1:0]  r_addr;

   // system clock
   localparam clk_per = 10; //ns
   always #(clk_per/2) clk = ~clk;

   localparam seq_ini = 10;
   integer             i;

   reg [W_DATA_W*2**W_ADDR_W-1:0] test_data;
   reg [R_DATA_W-1:0]             r_data_expected;

   initial begin

      $display("W_DATA_W=%d", W_DATA_W);
      $display("W_ADDR_W=%d", W_ADDR_W);
      $display("R_DATA_W=%d", R_DATA_W);
      $display("R_ADDR_W=%d", R_ADDR_W);

      if(W_DATA_W > R_DATA_W)
        $display("W_DATA_W > R_DATA_W");
      else if (W_DATA_W < R_DATA_W)
        $display("W_DATA_W < R_DATA_W");
      else
        $display("W_DATA_W = R_DATA_W");

      // compute the test_data
      for (i=0; i < 2**W_ADDR_W; i=i+1)
        test_data[i*W_DATA_W +: W_DATA_W] = i+seq_ini;

      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif
      repeat(4) @(posedge clk) #1;

      // write all the locations of RAM
      w_en = 1;
      for(i = 0; i < 2**W_ADDR_W; i = i + 1) begin
         w_addr = i;         
         w_data = i+seq_ini;

         @(posedge clk) #1;
      end
      w_en = 0;

      @(posedge clk) #1;

      // read all the locations of RAM
      r_en = 1;
      for(i = 0 ; i < 2**R_ADDR_W; i = i + 1) begin
         r_addr = i;
         @(posedge clk) #1;
         // verify response
         r_data_expected = test_data[i*R_DATA_W +: R_DATA_W];
         if(r_data !== r_data_expected)
           $display("ERROR: read addr=%x, got %x, expected %x", r_addr, r_data, r_data_expected);
      end

      #(5*clk_per) $finish;
   end

   // instantiate the Unit Under Test (UUT)
   iob_ram_2p_asym
     #(
       .W_DATA_W(W_DATA_W),
       .R_DATA_W(R_DATA_W),
       .ADDR_W(MAXADDR_W),
       .N(N)
       )
   uut
     (
      .clk(clk),

      .ext_mem_w_en(ext_mem_w_en),
      .ext_mem_w_data(ext_mem_w_data),
      .ext_mem_w_addr(ext_mem_w_addr),
      .ext_mem_r_en(ext_mem_r_en),
      .ext_mem_r_addr(ext_mem_r_addr),
      .ext_mem_r_data(ext_mem_r_data),
      
      .w_en(w_en),
      .w_addr(w_addr),
      .w_data(w_data),

      .r_en(r_en),
      .r_addr(r_addr),
      .r_data(r_data)
      );

   genvar p;
   generate for(p=0; p < N; p=p+1) begin
      wire mem_w_en;
      wire [MINDATA_W-1:0]	mem_w_data;
      wire [MINADDR_W-1:0]	mem_w_addr;
      wire mem_r_en;
      wire [MINADDR_W-1:0]  mem_r_addr;
      wire [MINDATA_W-1:0]  mem_r_data;

      assign mem_w_en = ext_mem_w_en[p];
      assign mem_w_addr = ext_mem_w_addr[p*MINADDR_W +: MINADDR_W];
      assign mem_w_data = ext_mem_w_data[p*MINDATA_W +: MINDATA_W];
      assign mem_r_en = ext_mem_r_en;
      assign mem_r_addr = ext_mem_r_addr[p*MINADDR_W +: MINADDR_W];

      iob_ram_2p
        #(
          .DATA_W(MINDATA_W),
          .ADDR_W(MINADDR_W)
          )
      iob_ram_2p_inst
        (
         .clk     (clk),
         .w_en    (mem_w_en),
         .w_addr  (mem_w_addr),
         .w_data  (mem_w_data),
         .r_en    (mem_r_en),
         .r_addr  (mem_r_addr),
         .r_data  (mem_r_data)
         );

      assign ext_mem_r_data[p*MINDATA_W +: MINDATA_W] = mem_r_data;
   end endgenerate

endmodule
