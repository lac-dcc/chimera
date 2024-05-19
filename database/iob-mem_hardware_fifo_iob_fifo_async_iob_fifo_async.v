// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns/1ps
`include "iob_lib.vh"

module iob_fifo_async
  #(parameter
    W_DATA_W = 0,
    R_DATA_W = 0,
    ADDR_W = 0 //higher ADDR_W lower DATA_W
    )
   (
    input                     rst,

    //read port
    input                     r_clk,
    input                     r_en,
    output reg [R_DATA_W-1:0] r_data,
    output reg                r_empty,
    output reg                r_full,
    output reg [ADDR_W:0]     r_level,

    //write port
    input                     w_clk,
    input                     w_en,
    input [W_DATA_W-1:0]      w_data,
    output reg                w_empty,
    output reg                w_full,
    output reg [ADDR_W:0]     w_level

    );

    //determine W_ADDR_W and R_ADDR_W
   localparam MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W);
   localparam MINDATA_W = `IOB_MIN(W_DATA_W, R_DATA_W);
   localparam R = MAXDATA_W/MINDATA_W;
   localparam ADDR_W_DIFF = $clog2(R);
   localparam MINADDR_W = ADDR_W-$clog2(R);//lower ADDR_W (higher DATA_W)
   localparam W_ADDR_W = (W_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W;
   localparam R_ADDR_W = (R_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W;
   localparam [ADDR_W:0] FIFO_SIZE = (1'b1 << ADDR_W); //in bytes


   //read/write increments
   wire [ADDR_W-1:0]          r_incr, w_incr;

   //binary read addresses on both domains
   wire [R_ADDR_W-1:0]        r_raddr_bin, w_raddr_bin;
   wire [W_ADDR_W-1:0]        r_waddr_bin, w_waddr_bin;

   //normalized binary addresses
   wire [ADDR_W-1:0]          r_raddr_bin_n, r_waddr_bin_n;
   wire [ADDR_W-1:0]          w_waddr_bin_n, w_raddr_bin_n;

   //assign according to assymetry type
   generate
      if (W_DATA_W > R_DATA_W) begin
         assign r_incr = 1'b1;
         assign w_incr = 1'b1 << ADDR_W_DIFF;
         assign w_waddr_bin_n = w_waddr_bin<<ADDR_W_DIFF;
         assign w_raddr_bin_n = w_raddr_bin;
         assign r_raddr_bin_n = r_raddr_bin;
         assign r_waddr_bin_n = r_waddr_bin<<ADDR_W_DIFF;
      end else if (R_DATA_W > W_DATA_W) begin
         assign w_incr = 1'b1;
         assign r_incr = 1'b1 << ADDR_W_DIFF;
         assign w_waddr_bin_n = w_waddr_bin;
         assign w_raddr_bin_n = w_raddr_bin<<ADDR_W_DIFF;
         assign r_raddr_bin_n = r_raddr_bin<<ADDR_W_DIFF;
         assign r_waddr_bin_n = r_waddr_bin;
      end else begin
         assign r_incr = 1'b1;
         assign w_incr = 1'b1;
         assign w_raddr_bin_n = w_raddr_bin;
         assign w_waddr_bin_n = w_waddr_bin;
         assign r_waddr_bin_n = r_waddr_bin;
         assign r_raddr_bin_n = r_raddr_bin;
      end
   endgenerate


   //sync write gray address to read domain
   wire [W_ADDR_W-1:0]        w_waddr_gray;
   wire [W_ADDR_W-1:0]        r_waddr_gray;
   `IOB_SYNC(r_clk, rst, 1'b0, W_ADDR_W, w_waddr_gray,  w_waddr_gray_sync0, w_waddr_gray_sync1, r_waddr_gray)

   //sync read gray address to write domain
   wire [R_ADDR_W-1:0]        r_raddr_gray;
   wire [R_ADDR_W-1:0]        w_raddr_gray;
   `IOB_SYNC(w_clk, rst, 1'b0, R_ADDR_W, r_raddr_gray,  r_raddr_gray_sync0, r_raddr_gray_sync1, w_raddr_gray)


   //READ DOMAIN FIFO LEVEL
   wire [ADDR_W-1:0]          r_level_int = r_waddr_bin_n - r_raddr_bin_n;

   
   //
   //READ STATE MACHINE
   //
   
   //read state
   localparam INIT=0, EMPTY=1, DEFAULT=2, FULL=3;
   reg [1:0]                  r_st, r_st_nxt;
   `IOB_REG_AR(r_clk, rst, INIT, r_st, r_st_nxt)

   `IOB_COMB begin
      r_level = r_level_int; //note rhs has 1 bit less
      r_full = 1'b0;
      r_empty = 1'b0;
      r_st_nxt = r_st;

      case (r_st)

        INIT: begin //reset state: ensures usability only in the next state
           r_full = 1'b1;
           r_empty = 1'b1;
           r_st_nxt = EMPTY;
        end
        
        EMPTY: begin
           r_empty = 1'b1;
           if(r_level_int >= r_incr)
             r_st_nxt = DEFAULT;
        end

        default: begin
           if(r_en && (r_level_int-r_incr) < r_incr)
             r_st_nxt = EMPTY;
           if(r_level_int == 0) begin
              r_full = 1'b1;
              r_level = FIFO_SIZE;
           end
        end

      endcase

   end

   //WRITE DOMAIN FIFO LEVEL
   wire [ADDR_W-1:0]      w_level_int = w_waddr_bin_n - w_raddr_bin_n;

   //WRITE STATE MACHINE
   reg [1:0]              w_st, w_st_nxt;
   `IOB_REG_AR(w_clk, rst, INIT, w_st, w_st_nxt)

   `IOB_COMB begin
      w_level = w_level_int; //note rhs has 1 bit less
      w_full = 1'b0;
      w_empty = 1'b0;
      w_st_nxt = w_st;

      case (w_st)

        INIT: begin //reset state: ensures usability only in the next state
           w_full = 1'b1;
           w_empty = 1'b1;
           w_st_nxt = DEFAULT;
        end
        
        default: begin
           if( w_level_int == 0 )
             w_empty = 1'b1;
           if(w_en && (w_level_int + w_incr) > (FIFO_SIZE-w_incr))
             w_st_nxt = FULL;
        end

        FULL: begin
           w_full = 1'b1;
           if(w_level_int == 0)
             w_level = FIFO_SIZE;
           else if(w_level_int <= (FIFO_SIZE-w_incr))
             w_st_nxt = DEFAULT;
        end

      endcase
   end

   //read address gray code counter
   wire r_en_int  = r_en & ~r_empty;
   iob_gray_counter
     #(
       .W(R_ADDR_W)
       )
   r_raddr_gray_counter
     (
      .clk(r_clk),
      .rst(rst),
      .en(r_en_int),
      .data_out(r_raddr_gray)
      );

   //write address gray code counter
   wire w_en_int = w_en & ~w_full;
   iob_gray_counter
     #(
       .W(W_ADDR_W)
       )
   w_waddr_gray_counter
     (
      .clk(w_clk),
      .rst(rst),
      .en(w_en_int),
      .data_out(w_waddr_gray)
      );

   //convert gray read address to binary
   iob_gray2bin
     #(
       .DATA_W(R_ADDR_W)
       )
   gray2bin_r_raddr
     (
      .gr(r_raddr_gray),
      .bin(r_raddr_bin)
      );

   //convert synced gray write address to binary
   iob_gray2bin
     #(
       .DATA_W(W_ADDR_W)
       )
   gray2bin_r_raddr_sync
     (
      .gr(r_waddr_gray),
      .bin(r_waddr_bin)
      );

   //convert gray write address to binary
   iob_gray2bin
     #(
       .DATA_W(W_ADDR_W)
       )
   gray2bin_w_waddr
     (
      .gr(w_waddr_gray),
      .bin(w_waddr_bin)
      );

   //convert synced gray read address to binary
   iob_gray2bin
     #(
       .DATA_W(R_ADDR_W)
       )
   gray2bin_w_raddr_sync
     (
      .gr(w_raddr_gray),
      .bin(w_raddr_bin)
      );

   // FIFO memory
   iob_ram_t2p_asym
     #(
       .W_DATA_W(W_DATA_W),
       .R_DATA_W(R_DATA_W),
       .ADDR_W(ADDR_W)
       )
   t2p_asym_ram
     (
      .w_clk(w_clk),
      .w_en(w_en_int),
      .w_data(w_data),
      .w_addr(w_waddr_bin),

      .r_clk(r_clk),
      .r_addr(r_raddr_bin),
      .r_en(r_en_int),
      .r_data(r_data)
      );

endmodule
