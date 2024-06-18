// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2024 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * Mux jtag and core to memory access
-*/

module jtag_core_mux
(
    //Inputs
    input            clk                ,
    input            rst_n              ,
    input            jtag_bus_req_i     ,

    input  [ 31:0]   mem_d_data_rd_i    ,
    input            mem_d_accept_i     ,
    input            mem_d_ack_i        ,
    input            mem_d_error_i      ,
    input  [ 10:0]   mem_d_resp_tag_i   ,
    input            mem_load_fault_i   ,
    input            mem_store_fault_i  ,

    input  [ 31:0]   core_mem_d_addr_i       ,
    input  [ 31:0]   core_mem_d_data_wr_i    ,
    input            core_mem_d_rd_i         ,
    input  [  3:0]   core_mem_d_wr_i         ,
    input            core_mem_d_cacheable_i  ,
    input  [ 10:0]   core_mem_d_req_tag_i    ,
    input            core_mem_d_invalidate_i ,
    input            core_mem_d_writeback_i  ,
    input            core_mem_d_flush_i      ,

    input  [ 31:0]   jtag_mem_d_addr_i       ,
    input  [ 31:0]   jtag_mem_d_data_wr_i    ,
    input            jtag_mem_d_rd_i         ,
    input  [  3:0]   jtag_mem_d_wr_i         ,
    input            jtag_mem_d_cacheable_i  ,
    input  [ 10:0]   jtag_mem_d_req_tag_i    ,
    input            jtag_mem_d_invalidate_i ,
    input            jtag_mem_d_writeback_i  ,
    input            jtag_mem_d_flush_i      ,

    //Outputs
    output [ 31:0]   mem_d_addr_o       ,
    output [ 31:0]   mem_d_data_wr_o    ,
    output           mem_d_rd_o         ,
    output [  3:0]   mem_d_wr_o         ,
    output           mem_d_cacheable_o  ,
    output [ 10:0]   mem_d_req_tag_o    ,
    output           mem_d_invalidate_o ,
    output           mem_d_writeback_o  ,
    output           mem_d_flush_o      ,

    output [ 31:0]   core_mem_d_data_rd_o  ,
    output           core_mem_d_accept_o   ,
    output           core_mem_d_ack_o      ,
    output           core_mem_d_error_o    ,
    output [ 10:0]   core_mem_d_resp_tag_o ,
    output           core_mem_load_fault_o ,
    output           core_mem_store_fault_o,

    output [ 31:0]   jtag_mem_d_data_rd_o  ,
    output           jtag_mem_d_accept_o   ,
    output           jtag_mem_d_ack_o      ,
    output           jtag_mem_d_error_o    ,
    output [ 10:0]   jtag_mem_d_resp_tag_o ,
    output           jtag_mem_load_fault_o ,
    output           jtag_mem_store_fault_o
);

    reg   [ 31:0]   mem_d_addr_r       ;
    reg   [ 31:0]   mem_d_data_wr_r    ;
    reg             mem_d_rd_r         ;
    reg   [  3:0]   mem_d_wr_r         ;
    reg             mem_d_cacheable_r  ;
    reg   [ 10:0]   mem_d_req_tag_r    ;
    reg             mem_d_invalidate_r ;
    reg             mem_d_writeback_r  ;
    reg             mem_d_flush_r      ;

    always @(*) begin
        if (jtag_bus_req_i == 1'b1) begin
            mem_d_addr_r       = jtag_mem_d_addr_i       ;
            mem_d_data_wr_r    = jtag_mem_d_data_wr_i    ;
            mem_d_rd_r         = jtag_mem_d_rd_i         ;
            mem_d_wr_r         = jtag_mem_d_wr_i         ;
            mem_d_cacheable_r  = jtag_mem_d_cacheable_i  ;
            mem_d_req_tag_r    = jtag_mem_d_req_tag_i    ;
            //mem_d_invalidate_r = jtag_mem_d_invalidate_i ;
            //mem_d_writeback_r  = jtag_mem_d_writeback_i  ;
            //mem_d_flush_r      = jtag_mem_d_flush_i      ;
        end
        else begin
            mem_d_addr_r       = core_mem_d_addr_i       ;
            mem_d_data_wr_r    = core_mem_d_data_wr_i    ;
            mem_d_rd_r         = core_mem_d_rd_i         ;
            mem_d_wr_r         = core_mem_d_wr_i         ;
            mem_d_cacheable_r  = core_mem_d_cacheable_i  ;
            mem_d_req_tag_r    = core_mem_d_req_tag_i    ;
            //mem_d_invalidate_r = core_mem_d_invalidate_i ;
            //mem_d_writeback_r  = core_mem_d_writeback_i  ;
            //mem_d_flush_r      = core_mem_d_flush_i      ;
        end

        mem_d_invalidate_r = core_mem_d_invalidate_i ;
        mem_d_writeback_r  = core_mem_d_writeback_i  ;
        mem_d_flush_r      = core_mem_d_flush_i      ;
    end

    assign mem_d_addr_o        = mem_d_addr_r       ;
    assign mem_d_data_wr_o     = mem_d_data_wr_r    ;
    assign mem_d_rd_o          = mem_d_rd_r         ;
    assign mem_d_wr_o          = mem_d_wr_r         ;
    assign mem_d_cacheable_o   = mem_d_cacheable_r  ;
    assign mem_d_req_tag_o     = mem_d_req_tag_r    ;
    assign mem_d_invalidate_o  = mem_d_invalidate_r ;
    assign mem_d_writeback_o   = mem_d_writeback_r  ;
    assign mem_d_flush_o       = mem_d_flush_r      ;

    assign core_mem_d_data_rd_o   = mem_d_data_rd_i  ;
    assign core_mem_d_accept_o    = (jtag_bus_req_i == 1'b0) ? mem_d_accept_i : 1'b0   ;
    assign core_mem_d_ack_o       = (jtag_bus_req_i == 1'b0) ? mem_d_ack_i    : 1'b0   ;
    assign core_mem_d_error_o     = mem_d_error_i    ;
    assign core_mem_d_resp_tag_o  = mem_d_resp_tag_i ;
    assign core_mem_load_fault_o  = (jtag_bus_req_i == 1'b0) ? mem_load_fault_i  : 1'b0;
    assign core_mem_store_fault_o = (jtag_bus_req_i == 1'b0) ? mem_store_fault_i : 1'b0;

    assign jtag_mem_d_data_rd_o   = mem_d_data_rd_i  ;
    assign jtag_mem_d_accept_o    = (jtag_bus_req_i == 1'b1) ? mem_d_accept_i : 1'b0   ;
    assign jtag_mem_d_ack_o       = (jtag_bus_req_i == 1'b1) ? mem_d_ack_i    : 1'b0   ;
    assign jtag_mem_d_error_o     = mem_d_error_i    ;
    assign jtag_mem_d_resp_tag_o  = mem_d_resp_tag_i ;
    assign jtag_mem_load_fault_o  = (jtag_bus_req_i == 1'b1) ? mem_load_fault_i  : 1'b0;
    assign jtag_mem_store_fault_o = (jtag_bus_req_i == 1'b1) ? mem_store_fault_i : 1'b0;

endmodule
