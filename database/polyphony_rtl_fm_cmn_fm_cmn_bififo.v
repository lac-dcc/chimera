//=======================================================================
//                        Project Polyphony
//
// File:
//   fm_cmn_bfifo.v
//
// Abstract:
//   Block RAM FIFO
//
//  Created:
//    20 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//  Revision History

module fm_cmn_bififo (
  clk_core,
  rst_x,
  i_wstrobe,
  i_dt,
  o_full,
  i_renable,
  o_dt,
  o_empty,
  o_dnum
);

// set default parameters
parameter P_WIDTH = 32;
parameter P_RANGE = 8;
parameter P_DEPTH = 1 << P_RANGE;
////////////////////////////
// I/O definition
////////////////////////////
input         clk_core;       // system clock
input         rst_x;          // system reset
input         i_wstrobe;      // write strobe
input  [P_WIDTH-1:0] i_dt;      // write data
output        o_full;         // write data full
input         i_renable;      // read enable
output [P_WIDTH-1:0] o_dt;      // read data
output        o_empty;        // read data empty
output [P_RANGE:0] o_dnum;      // written data number

/////////////////////////
//  Register definition
/////////////////////////
reg [P_RANGE-1:0] r_write_counter;
reg [P_RANGE-1:0] r_read_counter;
reg [P_RANGE:0]   r_status;
reg               r_sel;
/////////////////////////
//  wire definition
/////////////////////////
wire             o_full;
wire             o_empty;
wire [P_WIDTH-1:0] o_dt;
wire [P_WIDTH-1:0] w_dto;
wire [P_WIDTH-1:0] w_dto_th;
wire [1:0]       w_status;
wire             w_we;
wire             w_re;
wire [P_RANGE-1:0] w_read_counter_inc;
wire [P_RANGE-1:0] w_read_counter;
/////////////////////////
//  assign statement
/////////////////////////
assign o_full  = (r_status == P_DEPTH);
assign o_empty = (r_status == 0);
assign o_dnum = r_status;
assign o_dt = (o_empty) ? 'd0 :
              (r_sel) ? w_dto_th : w_dto;
assign w_read_counter_inc = r_read_counter + 1'b1;
assign w_read_counter = (w_re) ? w_read_counter_inc : r_read_counter;
assign w_we = !o_full & i_wstrobe;
assign w_re = i_renable & !o_empty;
assign w_status = {w_re,w_we};
////////////////////////
// always statement
///////////////////////
  // write side
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_write_counter <= 'd0;
    end else begin
      if (w_we) begin
        r_write_counter <= r_write_counter + 1'b1;
      end
    end
  end

  // read side
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_read_counter <= 'd0;
    end else begin
      if (w_re) begin
        r_read_counter <= r_read_counter + 1'b1;
      end
    end
  end

  // ram output select
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_sel <= 1'b0;
    end else begin
        r_sel <= (r_write_counter == w_read_counter) ? 1'b1 : 1'b0;
    end
  end

  // status counter
  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_status <= 'd0;
    end else begin
      case (w_status)
        2'b01:  r_status <= r_status + 1'b1; // write
        2'b10:  r_status <= r_status - 1'b1; // read
        default:  r_status <= r_status;      // nothing to do 
      endcase
    end
  end

///////////////////
// module instance
///////////////////
    fm_cmn_bram_01 #(P_WIDTH, P_RANGE) bram_00 (
        .clk(clk_core),
        .we(w_we),
        .a(r_write_counter),
        .dpra(w_read_counter),
        .di(i_dt),
        .spo(w_dto_th),
        .dpo(w_dto)
    );
endmodule


