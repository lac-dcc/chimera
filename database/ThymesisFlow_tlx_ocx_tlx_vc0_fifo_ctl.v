// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2016 10:27:08 AM
// Design Name: 
// Module Name: tlx_vc_fifo_ctl 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Createdg
// 
//////////////////////////////////////////////////////////////////////////////////


module ocx_tlx_vc0_fifo_ctl
    #(
     parameter addr_width = 7,
     parameter DATA_WIDTH = 56
    )
    (
    input tlx_clk,
    input reset_n, 
    input  crc_flush_done,
    input  crc_flush_inprog,
    input  crc_error,    
    output wr_ena,
    output [addr_width-1:0] wr_addr,
    output [DATA_WIDTH-1:0] wr_data,
    output rd_ena,
    output [addr_width-1:0] rd_addr, 
    input [6:0] afu_tlx_initial_credit,
    input [DATA_WIDTH-1:0] fp_rcv_info,
    input fp_rcv_valid,
    input data_hold_vc,
    input [1:0] data_arb_flit_cnt,
    input control_parsing_start,
    input control_parsing_end,
    input bookend_flit_v,
    input data_fifo_wr_ena,
    input afu_tlx_credit_return
    );
    
wire set_credit_value_din; 
reg  set_credit_value_dout;   
wire credit_incr, credit_decr;
wire [addr_width:0] credit_cnt_din;
reg  [addr_width:0] credit_cnt_dout;
wire fifo_wr_incr;
wire [addr_width:0] fifo_wr_ptr_din, fifo_wr_verif_ptr_din;
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg  [addr_width:0] fifo_wr_ptr_dout, fifo_wr_verif_ptr_dout;
wire [addr_width:0] fifo_rd_ptr_din;
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg  [addr_width:0] fifo_rd_ptr_dout;
wire [addr_width:0] ctl_cnt_dout_add;

wire rd_ena_din;
reg  rd_ena_dout;

wire [6:0] frame_cnt_din;
reg  [6:0] frame_cnt_dout;
wire [6:0] frame_cnt2_din;
reg  [6:0] frame_cnt2_dout;
wire [6:0] ctl_cnt_din;
reg  [6:0] ctl_cnt_dout;
wire [6:0] ctl2_cnt_din;
reg  [6:0] ctl2_cnt_dout;
wire [6:0] data_wr_cnt_din;
reg  [6:0] data_wr_cnt_dout;
wire [1:0] bookend_cnt_din;
reg  [1:0] bookend_cnt_dout;
wire frame_cnt2_ena_din;
reg  frame_cnt2_ena_dout;
wire release_hold;
wire ctl_cnt_incr;
wire ctl_cnt_clr;
wire ctl_cnt_hold_1;
wire ctl_cnt_load;
wire ctl_cnt_load_1;
reg bookend_vc_v_dout;
wire bookend_vc_v_din;
wire bookend_incr;
wire bookend_decr;
wire bookend_hold;
reg  bookend_flit_v_dout;
wire bookend_flit_v_din;
wire [2:0] data_flit_cnt_decoded;
reg  [1:0] parsing_ended_cnt_dout;
wire [1:0] parsing_ended_cnt_din;
wire parse_end_incr;
wire parse_end_decr;
wire parse_end_hold;
reg  crc_error_dout;
wire crc_error_s1_din;
reg  crc_error_s1_dout;
wire crc_error_s2_din;
reg  crc_error_s2_dout;
wire wait_for_data;
always @(posedge tlx_clk)
begin
    if(!reset_n)
    begin
    frame_cnt_dout <= 7'b0;
    frame_cnt2_dout <= 7'b0;
    ctl_cnt_dout <= 7'b0;
    ctl2_cnt_dout <= 7'b0;
    data_wr_cnt_dout <= 7'b0;
    bookend_cnt_dout <= 2'b0;
    set_credit_value_dout <= 1'b1;
    credit_cnt_dout <= 8'b0;
    fifo_wr_ptr_dout <= 8'b0;
    fifo_wr_verif_ptr_dout <= 8'b0;
    fifo_rd_ptr_dout <= 8'b0;
    rd_ena_dout <= 1'b0;
    frame_cnt2_ena_dout <= 1'b0;
    bookend_vc_v_dout <= 1'b0;
    bookend_flit_v_dout <= 1'b0;
    parsing_ended_cnt_dout <= 2'b0;
    crc_error_dout <= 1'b0;
    crc_error_s1_dout <= 1'b0;
    crc_error_s2_dout <= 1'b0;
    end
    else
    begin
    frame_cnt_dout <= frame_cnt_din;
    frame_cnt2_dout <= frame_cnt2_din;
    ctl_cnt_dout <= ctl_cnt_din;
    ctl2_cnt_dout <= ctl2_cnt_din;
    data_wr_cnt_dout <= data_wr_cnt_din;
    bookend_cnt_dout <= bookend_cnt_din;
    set_credit_value_dout <= set_credit_value_din;
    credit_cnt_dout <= credit_cnt_din;
    fifo_wr_ptr_dout <= fifo_wr_ptr_din;
    fifo_wr_verif_ptr_dout <= fifo_wr_verif_ptr_din;
    fifo_rd_ptr_dout <= fifo_rd_ptr_din;
    rd_ena_dout <= rd_ena_din; 
    frame_cnt2_ena_dout <= frame_cnt2_ena_din;
    bookend_vc_v_dout <= bookend_vc_v_din;
    bookend_flit_v_dout <= bookend_flit_v_din;
    parsing_ended_cnt_dout <= parsing_ended_cnt_din;
    crc_error_dout <= crc_error;
    crc_error_s1_dout <= crc_error_s1_din;
    crc_error_s2_dout <= crc_error_s2_din;
    end
end    

//Unused signals
wire unused_intentionally;
assign unused_intentionally = (| {rd_ena_dout, crc_flush_done} );
//

assign crc_error_s1_din = crc_error_dout;
assign crc_error_s2_din = crc_error_s1_dout; 
//Afu credit manager
assign credit_cnt_din[addr_width:0] = (set_credit_value_dout) ? {1'b0, afu_tlx_initial_credit[6:0]} : //initial credit value
                        credit_incr && credit_decr ? credit_cnt_dout[addr_width:0] :
                        credit_incr ? credit_cnt_dout[addr_width:0] + 8'b0000001 :
                        credit_decr ? credit_cnt_dout[addr_width:0] - 8'b0000001 : credit_cnt_dout[addr_width:0];
assign set_credit_value_din = 1'b0; //used for initial grab of afu credit count
assign credit_decr = rd_ena_din;
assign credit_incr = afu_tlx_credit_return;   
//fifo wr pointer logic
assign fifo_wr_incr = fp_rcv_valid;
assign fifo_wr_ptr_din = fifo_wr_incr ? fifo_wr_ptr_dout[addr_width:0] + {{addr_width{1'b0}}, 1'b1} : fifo_wr_ptr_dout[addr_width:0];

// For LINT, if  addr_width > 6, then need to pad ctl_cnt_dout for addition with fifo_wr_verif_ptr_dout
// assign ctl_cnt_dout_add = ctl_cnt_dout;
assign ctl_cnt_dout_add = {{addr_width-6{1'b0}}, ctl_cnt_dout};

assign fifo_wr_verif_ptr_din =  release_hold ? fifo_wr_verif_ptr_dout + ctl_cnt_dout_add : 
                                (frame_cnt_dout == 7'b0) && ~data_hold_vc ? fifo_wr_ptr_din : fifo_wr_verif_ptr_dout;//advance verified pointer once good crc has come in for commands/responses with data or commands/responses have no data
assign wr_ena = fp_rcv_valid;
assign wr_addr = fifo_wr_ptr_dout[addr_width-1:0];
assign wr_data = fp_rcv_info;
//fifo rd pointer logic
assign parse_end_incr = control_parsing_end & ((parsing_ended_cnt_dout == 2'b00 & (frame_cnt_dout  != 7'b0 | data_hold_vc)) 
                                            |  (parsing_ended_cnt_dout == 2'b01 & (frame_cnt2_dout != 7'b0 | data_hold_vc)));
assign parse_end_decr = release_hold;
assign parse_end_hold = (parse_end_decr & parse_end_incr) | (release_hold & control_parsing_end & data_hold_vc);
assign parsing_ended_cnt_din = parse_end_hold ? parsing_ended_cnt_dout :
                               parse_end_incr ? parsing_ended_cnt_dout + 2'b01 :
                               parse_end_decr ? parsing_ended_cnt_dout - 2'b01 : parsing_ended_cnt_dout;                    
assign data_flit_cnt_decoded = (data_arb_flit_cnt == 2'b01) ? 3'b001 : //64B of data
                               (data_arb_flit_cnt == 2'b10) ? 3'b010 : //128B of data
                               (data_arb_flit_cnt == 2'b11) ? 3'b100 : 3'b000; //256B of data                        
assign bookend_flit_v_din = bookend_flit_v;                       
assign bookend_vc_v_din = bookend_flit_v_dout ? 1'b1 :
                          (bookend_incr || control_parsing_start) ? 1'b0 : bookend_vc_v_dout;
assign bookend_incr = bookend_vc_v_dout & ((bookend_cnt_dout == 2'b00 & frame_cnt_dout != 7'b0) | (bookend_cnt_dout == 2'b01 & (frame_cnt2_dout != 7'b0)) | (data_hold_vc & ~control_parsing_start));
assign bookend_decr = release_hold;
assign bookend_hold = bookend_incr & bookend_decr;                                                                
assign bookend_cnt_din = bookend_hold ? bookend_cnt_dout :
                         bookend_incr ? bookend_cnt_dout + 2'b01 :
                         bookend_decr ? bookend_cnt_dout - 2'b01 : bookend_cnt_dout;                                                  
assign frame_cnt_din =  (release_hold && (frame_cnt2_dout == 7'b0) & data_hold_vc) ? {4'b0, data_flit_cnt_decoded} :
                        (release_hold && (frame_cnt2_dout == 7'b0)) ?  7'b0:
                        (release_hold && (frame_cnt2_dout != 7'b0) & data_hold_vc & ~control_parsing_start) ?  frame_cnt2_dout + {4'b0, data_flit_cnt_decoded} :
                        (release_hold && (frame_cnt2_dout != 7'b0)) ?  frame_cnt2_dout :
                        (data_hold_vc && ~frame_cnt2_ena_din) ? {4'b0, data_flit_cnt_decoded} + frame_cnt_dout : frame_cnt_dout;                       
assign data_wr_cnt_din = (~crc_flush_inprog && crc_error_s2_dout) && (bookend_cnt_dout == 2'b00) ? 7'b0 :
                         (data_fifo_wr_ena && release_hold) ? 7'b0000001:
                         (data_fifo_wr_ena) ? data_wr_cnt_dout + 7'b0000001 : 
                         (release_hold) ? 7'b0:data_wr_cnt_dout;                        
assign release_hold = (frame_cnt_dout == data_wr_cnt_dout) & (bookend_cnt_dout > 2'b00) & (frame_cnt_dout != 7'b0) & (parsing_ended_cnt_dout != 2'b00);  
//If another control flit has is being parsed before data from the previous control flit is stored
assign wait_for_data = (frame_cnt_dout > data_wr_cnt_dout) | (bookend_cnt_dout == 2'b00);
assign frame_cnt2_ena_din = (control_parsing_start && wait_for_data && (frame_cnt_dout != 7'b0)) || (release_hold && frame_cnt2_dout != 7'b0 && parsing_ended_cnt_dout > 2'b01) ? 1'b1 : //a new control flit is being parsed and the current frame still needs data
                            release_hold ? 1'b0 : frame_cnt2_ena_dout;
assign frame_cnt2_din = (release_hold && (frame_cnt2_dout != 7'b0) && data_hold_vc && control_parsing_start) ? {4'b0, data_flit_cnt_decoded} :
                        release_hold ?  7'b0 :
                        (data_hold_vc && frame_cnt2_ena_din) ? {4'b0, data_flit_cnt_decoded} + frame_cnt2_dout : frame_cnt2_dout;  
                        
assign ctl_cnt_incr = (data_hold_vc | (fp_rcv_valid & (frame_cnt_dout > data_wr_cnt_dout))) & ~frame_cnt2_ena_din & ~release_hold;
assign ctl_cnt_clr  = ~data_hold_vc & release_hold & (frame_cnt2_dout == 7'b0);
assign ctl_cnt_load = release_hold & (frame_cnt2_dout != 7'b0) & ~data_hold_vc; 
assign ctl_cnt_load_1 = release_hold & (frame_cnt2_dout != 7'b0) & data_hold_vc & ~control_parsing_start; 
assign ctl_cnt_hold_1 = release_hold & data_hold_vc;                                   
assign ctl_cnt_din = ctl_cnt_incr   ? ctl_cnt_dout + 7'b0000001 :
                     ctl_cnt_clr    ? 7'b0 :                      
                     ctl_cnt_load   ? ctl2_cnt_dout :
                     ctl_cnt_load_1 ? ctl2_cnt_dout + 7'b0000001 :
                     ctl_cnt_hold_1 ? 7'b0000001 : ctl_cnt_dout; 
assign ctl2_cnt_din = (release_hold && (frame_cnt2_dout != 7'b0) && data_hold_vc && control_parsing_start) ? 7'b0000001:
                      release_hold ? 7'b0 : 
                      (data_hold_vc || (fp_rcv_valid && (frame_cnt_dout > data_wr_cnt_dout))) && frame_cnt2_ena_din ? ctl2_cnt_dout + 7'b0000001 : ctl2_cnt_dout;
                                                                                            
assign rd_ena_din = ((fifo_wr_verif_ptr_dout[addr_width-1:0] > fifo_rd_ptr_dout[addr_width-1:0]) | (fifo_wr_verif_ptr_dout[addr_width] != fifo_rd_ptr_dout[addr_width]))  & (credit_cnt_dout[addr_width:0] > 8'b0000000);
assign fifo_rd_ptr_din[addr_width:0] = rd_ena_din ? fifo_rd_ptr_dout[addr_width:0] + {{addr_width{1'b0}}, 1'b1} : fifo_rd_ptr_dout[addr_width:0];
// assign rd_addr = fifo_rd_ptr_dout;
assign rd_addr = fifo_rd_ptr_dout[addr_width-1:0];
assign rd_ena = rd_ena_din;
  
endmodule
