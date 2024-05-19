// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
//                        Project Polyphony
//
// File:
//   fm_hvc_dma.v
//
// Abstract:
//   VGA DMAC
//
//  Created:
//    8 August 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//  Revision History
//  2008/12/26 output clk_sys synchronized vsync
//  2009/01/22 anti-aliasing mode support

module fm_rd_split (
    clk_core,
    rst_x,
    i_req,
    i_adrs,
    i_len,
    o_ack,
    // dram if
    o_req,
    o_adrs,
    o_len,
    i_ack
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    parameter P_IDLE      = 'd0;
    parameter P_SECOND    = 'd1;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input         clk_core;
    input         rst_x;

    input         i_req;
    input [P_IB_ADDR_WIDTH-1:0]
                  i_adrs;
    input [P_IB_LEN_WIDTH-1:0]
                  i_len;  // 32 burst x 10
    output         o_ack;
    // dram if
    output        o_req;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len;  // 16 burst x 10
    input         i_ack;

//////////////////////////////////
// reg
//////////////////////////////////
    reg    r_state;
    reg    [P_IB_LEN_WIDTH-1:0]
           r_len;
//////////////////////////////////
// wire
//////////////////////////////////
   wire    w_a;
   wire    w_size;
   wire [P_IB_LEN_WIDTH-1:0]
           w_len;  // 16 burst x 10
//////////////////////////////////
// assign
//////////////////////////////////
 assign w_len = i_len - 5'h10;
   
 assign o_req = i_req;
 assign o_len = ((r_state == P_IDLE)&w_size) ? 'd16 :
		((r_state == P_SECOND)&w_size) ? w_len :
        i_len;
   
 assign o_ack = ((r_state == P_SECOND) & i_ack) |
                ((r_state == P_IDLE) & !w_size & i_ack);
 assign w_a = (r_state == P_SECOND);
 assign o_adrs = {i_adrs[P_IB_ADDR_WIDTH-1:5],w_a,4'b0};

 assign w_size = (i_len > 5'h10);
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_state <= P_IDLE;
  end else begin
    case (r_state)
      P_IDLE: begin
        if (i_req & i_ack)  begin
          if (w_size) r_state <= P_SECOND;
	end
      end
      P_SECOND: begin
        if (i_ack)  r_state <= P_IDLE;
      end
    endcase
  end
end

endmodule
