// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns/1ps
`include "iob_lib.vh"

module iob_fifo_sync
  #(
    parameter
    W_DATA_W = 0,
    R_DATA_W = 0,
    ADDR_W = 0, //higher ADDR_W lower DATA_W
    //determine W_ADDR_W and R_ADDR_W
    MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W),
    MINDATA_W = `IOB_MIN(W_DATA_W, R_DATA_W),
    N = MAXDATA_W/MINDATA_W,
    MINADDR_W = ADDR_W-$clog2(N),//lower ADDR_W (higher DATA_W)
    W_ADDR_W = (W_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W,
    R_ADDR_W = (R_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W
    )
   (
    `IOB_INPUT(arst, 1),
    `IOB_INPUT(rst, 1),
    `IOB_INPUT(clk, 1),

    //write port
    `IOB_OUTPUT(ext_mem_w_en, N),
    `IOB_OUTPUT(ext_mem_w_data, (MINDATA_W*N)),
    `IOB_OUTPUT(ext_mem_w_addr, (MINADDR_W*N)),
    //read port
    `IOB_OUTPUT(ext_mem_r_en, 1),
    `IOB_OUTPUT(ext_mem_r_addr, (MINADDR_W*N)),
    `IOB_INPUT(ext_mem_r_data, (MINDATA_W*N)),

    //read port
    `IOB_INPUT(r_en, 1),
    `IOB_OUTPUT(r_data, R_DATA_W),
    `IOB_OUTPUT_VAR(r_empty, 1),
    //write port
    `IOB_INPUT(w_en, 1),
    `IOB_INPUT(w_data, W_DATA_W),
    `IOB_OUTPUT_VAR(w_full, 1),

    //FIFO level
    `IOB_OUTPUT_VAR(level, (ADDR_W+1))
    );

   localparam ADDR_W_DIFF = $clog2(N);
   localparam [ADDR_W:0] FIFO_SIZE = (1'b1 << ADDR_W); //in bytes

   //effective write enable
   wire                   w_en_int = w_en & ~w_full;

   //write address
   `IOB_VAR(w_addr, W_ADDR_W)
   `IOB_COUNTER_ARRE(clk, arst, rst, w_en_int, w_addr)

   //effective read enable
   wire                   r_en_int  = r_en & ~r_empty;

   //read address
   `IOB_VAR(r_addr, R_ADDR_W)
   `IOB_COUNTER_ARRE(clk, arst, rst, r_en_int, r_addr)

   //assign according to assymetry type
   localparam [ADDR_W:0] w_incr = (W_DATA_W > R_DATA_W) ? 1'b1 << ADDR_W_DIFF : 1'b1 ;
   localparam [ADDR_W:0] r_incr = (R_DATA_W > W_DATA_W) ? 1'b1 << ADDR_W_DIFF : 1'b1 ;
   
   //FIFO level
   reg [ADDR_W+1:0]         level_nxt;
   `IOB_REG_ARR(clk, arst, 1'b0, rst, 1'b0, level, level_nxt[0+:ADDR_W+1])

   `IOB_COMB begin
      level_nxt = {1'd0,level};
      if(w_en_int && (!r_en_int))
        level_nxt = level + w_incr;
      else if(w_en_int && r_en_int)
        level_nxt = (level + w_incr) -r_incr;
      else if (r_en_int) // (!w_en_int) && r_en_int
        level_nxt = level -r_incr;
   end

   //FIFO empty
   `IOB_WIRE(r_empty_nxt, 1)
   assign r_empty_nxt = level_nxt[0+:ADDR_W+1] < r_incr;
   `IOB_REG_AR(clk, arst, 1'd1, r_empty, r_empty_nxt)

   //FIFO full
   `IOB_WIRE(w_full_nxt, 1)
   assign w_full_nxt = level_nxt[0+:ADDR_W+1] > (FIFO_SIZE -w_incr);
   `IOB_REG_AR(clk, arst, 1'd0, w_full, w_full_nxt)

   //FIFO memory
   iob_ram_2p_asym
     #(
       .W_DATA_W  (W_DATA_W),
       .R_DATA_W  (R_DATA_W),
       .ADDR_W    (ADDR_W)
       )
    iob_ram_2p_asym0
     (
      .clk           (clk),
      
      .ext_mem_w_en  (ext_mem_w_en),
      .ext_mem_w_data(ext_mem_w_data),
      .ext_mem_w_addr(ext_mem_w_addr),
      .ext_mem_r_en  (ext_mem_r_en),
      .ext_mem_r_addr(ext_mem_r_addr),
      .ext_mem_r_data(ext_mem_r_data),

      .w_en          (w_en_int),
      .w_data        (w_data),
      .w_addr        (w_addr),

      .r_en          (r_en_int),
      .r_addr        (r_addr),
      .r_data        (r_data)
      );

endmodule
