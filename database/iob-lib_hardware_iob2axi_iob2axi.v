// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"
`include "axi.vh"

module iob2axi
  #(
    parameter ADDR_W = 0,
    parameter DATA_W = 0,
    // AXI-4 Full I/F parameters
    parameter AXI_ADDR_W = ADDR_W,
    parameter AXI_DATA_W = DATA_W
    )
   (
    //
    // Control I/F
    //
    input                run,
    input                direction, // 0 for reading, 1 for writing
    input [ADDR_W-1:0]   addr,
    output               ready,
    output               error,

    //
    // Native Slave I/F
    //
    input                s_valid,
    input [ADDR_W-1:0]   s_addr,
    input [DATA_W-1:0]   s_wdata,
    input [DATA_W/8-1:0] s_wstrb,
    output [DATA_W-1:0]  s_rdata,
    output               s_ready,

    //
    // AXI-4 Full Master I/F
    //
`include "m_axi_m_port.vh"
`include "iob_gen_if.vh"
    );

   wire                  run_int;
   wire                  run_wr, run_rd;
   wire                  ready_int;
   wire                  ready_rd, ready_wr;
   wire                  error_rd, error_wr;

   wire                  in_fifo_ready, out_fifo_ready;

   wire                  rd_valid, wr_valid;
   wire [ADDR_W-1:0]     rd_addr, wr_addr; //**
   wire [DATA_W-1:0]     rd_wdata, wr_rdata;
   wire [DATA_W/8-1:0]   rd_wstrb, wr_rstrb;
   wire                  rd_ready, wr_ready;

   assign ready = ready_int & ~run_int;
   assign error = error_rd | error_wr;

   assign s_ready = |s_wstrb? in_fifo_ready: out_fifo_ready;

   //
   // Input FIFO
   //
   wire                       in_fifo_full;
   wire                       in_fifo_wr = s_valid & |s_wstrb & ~in_fifo_full;
   wire [DATA_W+DATA_W/8-1:0] in_fifo_wdata = {s_wdata, s_wstrb};

   wire                       in_fifo_empty;
   wire                       in_fifo_rd = wr_valid;
   wire [DATA_W+DATA_W/8-1:0] in_fifo_rdata;

   wire [`AXI_LEN_W:0]        in_fifo_level;

   reg                        in_fifo_empty_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         in_fifo_empty_reg <= 1'b1;
      end else begin
         in_fifo_empty_reg <= in_fifo_empty;
      end
   end

   assign wr_rdata = in_fifo_rdata[DATA_W/8 +: DATA_W];
   assign wr_rstrb = in_fifo_rdata[0 +: DATA_W/8];

   reg                        wr_ready_int;
   assign wr_ready = wr_ready_int & ~in_fifo_empty_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         wr_ready_int <= 1'b0;
      end else begin
         wr_ready_int <= wr_valid;
      end
   end

   reg                        in_fifo_ready_int;
   assign in_fifo_ready = in_fifo_ready_int & ~in_fifo_full;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         in_fifo_ready_int <= 1'b0;
      end else begin
         in_fifo_ready_int <= s_valid & |s_wstrb;
      end
   end

   iob_fifo_sync
     #(
       .W_DATA_W(DATA_W+DATA_W/8),
       .R_DATA_W(DATA_W+DATA_W/8),
       .ADDR_W(`AXI_LEN_W)
       )
   iob_fifo_sync0
     (
      .clk     (clk),
      .rst     (rst),

      .w_en    (in_fifo_wr),
      .w_data  (in_fifo_wdata),
      .w_full  (in_fifo_full),

      .r_en    (in_fifo_rd),
      .r_data  (in_fifo_rdata),
      .r_empty (in_fifo_empty),

      .level   (in_fifo_level)
      );

   //
   // Output FIFO
   //
   wire                  out_fifo_full;
   wire                  out_fifo_wr = rd_valid & |rd_wstrb & ~out_fifo_full;
   wire [DATA_W-1:0]     out_fifo_wdata = rd_wdata;

   wire                  out_fifo_empty;
   wire                  out_fifo_rd = s_valid & ~|s_wstrb & ~out_fifo_empty;
   wire [DATA_W-1:0]     out_fifo_rdata;

   wire [`AXI_LEN_W:0]   out_fifo_level;
   wire [`AXI_LEN_W:0]   out_fifo_capacity = {1'b1, `AXI_LEN_W'd0} - out_fifo_level;

   reg                   out_fifo_empty_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         out_fifo_empty_reg <= 1'b1;
      end else begin
         out_fifo_empty_reg <= out_fifo_empty;
      end
   end

   reg                   rd_ready_int;
   assign rd_ready = rd_ready_int & ~out_fifo_full;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         rd_ready_int <= 1'b0;
      end else begin
         rd_ready_int <= rd_valid;
      end
   end

   assign s_rdata = out_fifo_rdata;

   reg                   out_fifo_ready_int;
   assign out_fifo_ready = out_fifo_ready_int & ~out_fifo_empty_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         out_fifo_ready_int <= 1'b0;
      end else begin
         out_fifo_ready_int <= s_valid & ~|s_wstrb;
      end
   end

   iob_fifo_sync
     #(
       .W_DATA_W(DATA_W),
       .R_DATA_W(DATA_W),
       .ADDR_W(`AXI_LEN_W)
       )
   iob_fifo_sync1
     (
      .clk     (clk),
      .rst     (rst),

      .w_en    (out_fifo_wr),
      .w_data  (out_fifo_wdata),
      .w_full  (out_fifo_full),

      .r_en    (out_fifo_rd),
      .r_data  (out_fifo_rdata),
      .r_empty (out_fifo_empty),

      .level   (out_fifo_level)
      );

   //
   // Compute next run
   //
   wire [`AXI_LEN_W:0]   length_int = direction? in_fifo_level: out_fifo_capacity;

   reg [`AXI_LEN_W-1:0]  count;
   wire                  count_en = ~&count & |length_int;

   assign run_int = ready_int & |length_int & (length_int[`AXI_LEN_W] | &count);
   assign run_wr  = direction? run_int: 1'b0;
   assign run_rd  = direction? 1'b0: run_int;

   assign ready_int = ready_wr & ready_rd;

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         count <= `AXI_LEN_W'd0;
      end else if (run_int) begin
         count <= `AXI_LEN_W'd0;
      end else if (count_en) begin
         count <= count + 1'b1;
      end
   end

   //
   // Compute first address and burst length for the next data transfer
   //
   localparam WADDR_W = ADDR_W - $clog2(DATA_W/8); // Word address width

   reg [`AXI_LEN_W-1:0]  length_burst;

   reg [ADDR_W-1:0]      addr_int;
   reg [WADDR_W-1:0]     addr_int_next;
   wire [WADDR_W-1:0]    addr4k  = {addr_int[ADDR_W-1:12], {(12-(ADDR_W-WADDR_W)){1'b1}}};
   wire [WADDR_W-1:0]    addrRem = addr_int[ADDR_W-1 -: WADDR_W] + length_int - 1'b1;
   wire [WADDR_W-1:0]    minAddr = `IOB_MIN(addr4k, addrRem);

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         addr_int <= {ADDR_W{1'b0}};
      end else if (run) begin
         addr_int <= addr;
      end else if (run_int) begin
         addr_int <= {addr_int_next, {(ADDR_W-WADDR_W){1'b0}}};
      end
   end

   always @* begin
      addr_int_next = minAddr + 1'b1;

      if (minAddr == addr4k) begin
         length_burst = addr4k - addr_int[ADDR_W-1 -: WADDR_W];
      end else begin // minAddr == addrRem
         length_burst = length_int - 1'b1;
      end
   end

   //
   // AXI Read
   //
   iob2axi_rd
     #(
       .ADDR_W(ADDR_W),
       .DATA_W(DATA_W)
       )
   iob2axi_rd0
     (
      .clk    (clk),
      .rst    (rst),

      // Control I/F
      .run    (run_rd),
      .addr   (addr_int),
      .length (length_burst),
      .ready  (ready_rd),
      .error  (error_rd),

      // AXI-4 full read master I/F
`include "m_m_axi_read_portmap.vh"
      // Native Master Write I/F
      .m_valid (rd_valid),
      .m_addr  (rd_addr),
      .m_wdata (rd_wdata),
      .m_wstrb (rd_wstrb),
      .m_ready (rd_ready)
      );

   //
   // AXI Write
   //
   iob2axi_wr
     #(
       .ADDR_W(ADDR_W),
       .DATA_W(DATA_W)
       )
   iob2axi_wr0
     (
      .clk     (clk),
      .rst     (rst),

      // Control I/F
      .run     (run_wr),
      .addr    (addr_int),
      .length  (length_burst),
      .ready   (ready_wr),
      .error   (error_wr),

      // AXI-4 full write master I/F
`include "m_m_axi_write_portmap.vh"

      // Native Master Read I/F
      .m_valid (wr_valid),
      .m_addr  (wr_addr),
      .m_rdata (wr_rdata),
      .m_rstrb (wr_rstrb),
      .m_ready (wr_ready)
      );

endmodule
