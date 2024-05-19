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
// Create Date: 08/11/2016 10:32:00 AM
// Design Name: 
// Module Name: tlx_dcp_fifo_ctl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Add overrun error cases
// 
//////////////////////////////////////////////////////////////////////////////////

module ocx_tlx_dcp_fifo_ctl
    #(
    parameter addr_width = 7
    )
    (
    input  good_crc,
    input  crc_flush_done,
    input  crc_flush_inprog,
    input  fp_rcv_data_v,
    input  [511:0] fp_rcv_data_bus,
    input  [2:0] afu_tlx_rd_cnt,
    input  afu_tlx_rd_req,
    output fifo_wr_ena,
    output [addr_width-1:0] fifo_wr_addr,
    output [addr_width-1:0] fifo_wr_addr_clone,
    output [511:0] fifo_wr_data,
    output fifo_rd_ena,
    output [addr_width-1:0] fifo_rd_addr,
    output rcv_xmt_credit_return_v,
    input  crc_error,
    input  tlx_clk,
    input  reset_n
    );
wire [addr_width:0] fifo_wr_ptr_din,fifo_rd_ptr_din,fifo_wr_verif_ptr_din;
reg  [addr_width:0] fifo_wr_ptr_dout,fifo_rd_ptr_dout,fifo_wr_verif_ptr_dout,fifo_wr_ptr_dout_clone;
wire [addr_width-1:0] fifo_rd_cnt_din;
reg  [addr_width-1:0] fifo_rd_cnt_dout;
wire fifo_rd_ena_int;
wire [addr_width:0] fifo_wr_ptr_plus1, fifo_rd_ptr_plus1;
// reg  [addr_width:0] credit_init_cnt_reg = 2**(addr_width); 
reg  [addr_width:0] credit_init_cnt_reg; 
wire [3:0] afu_rd_cnt_decode;
wire crc_error_din;
reg  crc_error_dout;
wire crc_flush_inprog_din;
reg  crc_flush_inprog_dout;
//timing fix
wire [2:0] afu_rd_cnt_din;
reg  [2:0] afu_rd_cnt_dout;
wire afu_rd_req_din;
reg  afu_rd_req_dout;
always @(posedge tlx_clk)
begin
    if (!reset_n)
    begin
    fifo_wr_ptr_dout <= {addr_width+1{1'b0}};
    fifo_wr_ptr_dout_clone <= {addr_width+1{1'b0}};
    fifo_wr_verif_ptr_dout <= {addr_width+1{1'b0}};
    fifo_rd_ptr_dout <= {addr_width+1{1'b0}};
    fifo_rd_cnt_dout <= {addr_width{1'b0}};
//  credit_init_cnt_reg <= 2**(addr_width);
    credit_init_cnt_reg <= {1'b1, {addr_width{1'b0}} };
    crc_error_dout <= 1'b0;
    crc_flush_inprog_dout <= 1'b0;
    afu_rd_cnt_dout <= 3'b0;
    afu_rd_req_dout <= 1'b0;
    //NJO TODO on reset do I need to restart init credits?
    end
    else
    begin
    if(credit_init_cnt_reg != {addr_width+1{1'b0}})
        begin
        credit_init_cnt_reg <= credit_init_cnt_reg - {{addr_width{1'b0}}, 1'b1};
        end
    fifo_wr_ptr_dout <= fifo_wr_ptr_din;
    fifo_wr_ptr_dout_clone <= fifo_wr_ptr_din;
    fifo_wr_verif_ptr_dout <= fifo_wr_verif_ptr_din;
    fifo_rd_ptr_dout <= fifo_rd_ptr_din;  
    fifo_rd_cnt_dout <= fifo_rd_cnt_din; 
    crc_error_dout <= crc_error_din;
    crc_flush_inprog_dout <= crc_flush_inprog_din;
    afu_rd_cnt_dout <= afu_rd_cnt_din;
    afu_rd_req_dout <= afu_rd_req_din;    
    end 
end

//Unused signals
wire unused_intentionally;
assign unused_intentionally = fifo_wr_ptr_dout_clone[addr_width];
//
assign afu_rd_req_din = afu_tlx_rd_req;
assign afu_rd_cnt_din = afu_tlx_rd_cnt;
assign crc_flush_inprog_din = crc_flush_inprog;
assign crc_error_din = crc_error;
assign afu_rd_cnt_decode = (afu_rd_cnt_dout == 3'b011) ? 4'b0100 :
                           (afu_rd_cnt_dout == 3'b100) ? 4'b0011 : 
                           (afu_rd_cnt_dout == 3'b000) ? 4'b1000 : {1'b0,afu_rd_cnt_dout};                                
//Read Request Logic
assign fifo_rd_ena_int = (fifo_rd_cnt_dout != {addr_width{1'b0}}) & ((fifo_wr_verif_ptr_dout[addr_width] != fifo_rd_ptr_dout[addr_width]) | (fifo_wr_verif_ptr_dout[addr_width-1:0] > fifo_rd_ptr_dout[addr_width-1:0])) ; //if read count is not equal to zero
assign fifo_rd_cnt_din = (~afu_rd_req_dout && fifo_rd_ena_int) ? fifo_rd_cnt_dout - {{addr_width-1{1'b0}}, 1'b1} :
                         (afu_rd_req_dout && fifo_rd_ena_int)  ? (fifo_rd_cnt_dout - {{addr_width-1{1'b0}}, 1'b1}) + {{addr_width-4{1'b0}}, afu_rd_cnt_decode[3:0]} : 
                         (afu_rd_req_dout)                     ? fifo_rd_cnt_dout + {{addr_width-4{1'b0}}, afu_rd_cnt_decode[3:0]} : fifo_rd_cnt_dout;                         
//Write Pointer Bit 6 of pointers are an overflow bit
assign fifo_wr_ptr_plus1 = fifo_wr_ptr_dout + {{addr_width{1'b0}}, 1'b1};
assign fifo_wr_ptr_din = (crc_flush_done || (~crc_flush_inprog && crc_error_dout)) ? fifo_wr_verif_ptr_dout : 
                         fp_rcv_data_v  ? fifo_wr_ptr_plus1      : fifo_wr_ptr_dout;
                            
assign fifo_wr_verif_ptr_din = (good_crc && fp_rcv_data_v) ? fifo_wr_ptr_din :
                               (good_crc || crc_flush_inprog_dout) ? fifo_wr_ptr_dout : fifo_wr_verif_ptr_dout;                                               
//Read Pointer
assign fifo_rd_ptr_plus1 = fifo_rd_ptr_dout + {{addr_width{1'b0}}, 1'b1};
assign fifo_rd_ptr_din = fifo_rd_ena_int ? fifo_rd_ptr_plus1 : fifo_rd_ptr_dout;
//FIFO Outputs
assign fifo_wr_ena = fp_rcv_data_v;
assign fifo_wr_addr = fifo_wr_ptr_dout[addr_width-1:0];
assign fifo_wr_addr_clone = fifo_wr_ptr_dout_clone[addr_width-1:0]; //cloned write address to ease timing
assign fifo_wr_data = fp_rcv_data_bus;
assign fifo_rd_ena = fifo_rd_ena_int;
assign fifo_rd_addr = fifo_rd_ptr_dout[addr_width-1:0];
//credit return
//assign credit_init_cnt_din = (credit_init_cnt_dout != 0) ? credit_init_cnt_dout - 1 : credit_init_cnt_dout;
assign rcv_xmt_credit_return_v = (!reset_n) ? 1'b0 : 
                                 (credit_init_cnt_reg != {addr_width+1{1'b0}}) ? 1'b1 : fifo_rd_ena_int;
//bdi ptr
 

endmodule
