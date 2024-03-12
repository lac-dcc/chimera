
// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/**
 * Simplistic Ibex bus implementation
 *
 * This module is designed for demo and simulation purposes, do not use it in
 * a real-world system.
 *
 * This implementation doesn't handle the full bus protocol, but makes the
 * following simplifying assumptions.
 *
 * - All devices (slaves) must respond in the next cycle after the request.
 * - Host (master) arbitration is strictly priority based.
 */
 
module timer #(
  // Bus data width (must be 32)
  parameter int unsigned DataWidth    = 32,
  // Bus address width
  parameter int unsigned AddressWidth = 32
) (
  input  wire                    clk_i,
  input  wire                    rst_ni,
  // Bus interface
  input  wire                    timer_req_i,

  input  wire [AddressWidth-1:0] timer_addr_i,
  input  wire                    timer_we_i,
  input  wire [DataWidth/8-1:0]  timer_be_i,
  input  wire [DataWidth-1:0]    timer_wdata_i,
  output wire                    timer_rvalid_o,
  output wire [DataWidth-1:0]    timer_rdata_o,
  output wire                    timer_err_o,
  output wire                    timer_intr_o
);

  // The timers are always 64 bits
  localparam int unsigned TW = 64;
  // Upper bits of address are decoded into timer_req_i
  localparam int unsigned ADDR_OFFSET = 10; // 1kB

  // Register map
  localparam bit [9:0] MTIME_LOW = 0;
  localparam bit [9:0] MTIME_HIGH = 4;
  localparam bit [9:0] MTIMECMP_LOW = 8;
  localparam bit [9:0] MTIMECMP_HIGH = 12;

  reg                 timer_we;
  reg                 mtime_we, mtimeh_we;
  reg                 mtimecmp_we, mtimecmph_we;
  reg [DataWidth-1:0] mtime_wdata, mtimeh_wdata;
  reg [DataWidth-1:0] mtimecmp_wdata, mtimecmph_wdata;
  reg [TW-1:0]        mtime_q, mtime_d, mtime_inc;
  reg [TW-1:0]        mtimecmp_q, mtimecmp_d;
  reg                 interrupt_q, interrupt_d;
  reg                 error_q, error_d;
  reg [DataWidth-1:0] rdata_q, rdata_d;
  reg                 rvalid_q;

  // Global write enable for all registers
  assign timer_we = timer_req_i & timer_we_i;

  // mtime increments every cycle
  assign mtime_inc = mtime_q + 64'd1;

  // Generate write data based on byte strobes
  for (genvar b = 0; b < DataWidth / 8; b++) begin : gen_byte_wdata

    assign mtime_wdata[(b*8)+:8]     = timer_be_i[b] ? timer_wdata_i[b*8+:8] : mtime_q[(b*8)+:8];
    assign mtimeh_wdata[(b*8)+:8]    = timer_be_i[b] ? timer_wdata_i[b*8+:8] : mtime_q[DataWidth+(b*8)+:8];
    assign mtimecmp_wdata[(b*8)+:8]  = timer_be_i[b] ? timer_wdata_i[b*8+:8] : mtimecmp_q[(b*8)+:8];
    assign mtimecmph_wdata[(b*8)+:8] = timer_be_i[b] ? timer_wdata_i[b*8+:8] : mtimecmp_q[DataWidth+(b*8)+:8];
  end

  // Generate write enables
  assign mtime_we     = timer_we & (timer_addr_i[ADDR_OFFSET-1:0] == MTIME_LOW);
  assign mtimeh_we    = timer_we & (timer_addr_i[ADDR_OFFSET-1:0] == MTIME_HIGH);
  assign mtimecmp_we  = timer_we & (timer_addr_i[ADDR_OFFSET-1:0] == MTIMECMP_LOW);
  assign mtimecmph_we = timer_we & (timer_addr_i[ADDR_OFFSET-1:0] == MTIMECMP_HIGH);

  // Generate next data
  assign mtime_d    = {(mtimeh_we    ? mtimeh_wdata    : mtime_inc[63:32]),  (mtime_we     ? mtime_wdata     : mtime_inc[31:0])};
  assign mtimecmp_d = {(mtimecmph_we ? mtimecmph_wdata : mtimecmp_q[63:32]), (mtimecmp_we  ? mtimecmp_wdata  : mtimecmp_q[31:0])};

  // Generate registers
  always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      mtime_q <= 'b0;
    end else begin
      mtime_q <= mtime_d;
    end
  end

  always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      mtimecmp_q <= 'b0;
    end else if (mtimecmp_we | mtimecmph_we) begin
      mtimecmp_q <= mtimecmp_d;
    end
  end

  // interrupt remains set until mtimecmp is written
  assign interrupt_d  = ((mtime_q >= mtimecmp_q) | interrupt_q) & ~(mtimecmp_we | mtimecmph_we);

  always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      interrupt_q <= 'b0;
    end else begin
      interrupt_q <= interrupt_d;
    end
  end

  assign timer_intr_o = interrupt_q;

  // Read data
  always @ ( * ) begin
    rdata_d = 'b0;
    error_d = 1'b0;
    case (timer_addr_i[ADDR_OFFSET-1:0])
      MTIME_LOW:     rdata_d = mtime_q[31:0];
      MTIME_HIGH:    rdata_d = mtime_q[63:32];
      MTIMECMP_LOW:  rdata_d = mtimecmp_q[31:0];
      MTIMECMP_HIGH: rdata_d = mtimecmp_q[63:32];
      default: begin
        rdata_d = 'b0;
        // Error if no address matched
        error_d = 1'b1;
      end
    endcase
  end

  // error_q and rdata_q are only valid when rvalid_q is high  //shawn modified to the same cycle
  always @(*) begin    //posedge clk_i
    if (timer_req_i) begin
      rdata_q = rdata_d;
      error_q = error_d;
    end else begin
      rdata_q = 32'b0;
      error_q = 1'b0;      
    end
  end

  assign timer_rdata_o = rdata_q;

  // Read data is always valid one cycle after a request   //shawn modified to the same cycle
  always @( * ) begin    //posedge clk_i or negedge rst_ni
    if (!rst_ni) begin
      rvalid_q = 1'b0;
    end else begin
      rvalid_q = timer_req_i;
    end
  end
  
    
  assign timer_rvalid_o = rvalid_q;
  assign timer_err_o    = error_q;

endmodule
