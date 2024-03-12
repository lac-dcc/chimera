/*-------------------------------------------------------------------------
// Module:  mem_wb
// File:    mem_wb.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: pass the signals from lsu stage to write back stage
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`include "defines.v"

module mem_wb(

    input wire                    clk_i,
    input wire                    n_rst_i,

    /*-- signals from contrl module -----*/
    input wire[5:0]               stall_i,
    input wire                    flush_i,

    /*-- signals from mem -----*/
	//GPR
    input wire                    rd_we_i,
    input wire[`RegAddrBus]       rd_addr_i,
    input wire[`RegBus]           rd_wdata_i,

    //CSR
    input wire                    csr_we_i,
    input wire[`RegBus]           csr_waddr_i,
    input wire[`RegBus]           csr_wdata_i,

    /*-- signals passed to mem_wb stage -----*/
	//GPR
    output reg                    rd_we_o,
    output reg[`RegAddrBus]       rd_addr_o,
    output reg[`RegBus]           rd_wdata_o,

    //CSR
    output reg                    csr_we_o,
    output reg[`RegBus]           csr_waddr_o,
    output reg[`RegBus]           csr_wdata_o,

    output reg                    instret_incr_o
);

    always @ (posedge clk_i) begin
        if(n_rst_i == `RstEnable) begin
		    // GPR
            rd_we_o <= `WriteDisable;
            rd_addr_o <= `NOPRegAddr;
            rd_wdata_o <= `ZeroWord;

			// CSR
            csr_we_o <= `WriteDisable;
            csr_waddr_o <= `ZeroWord;
            csr_wdata_o <= `ZeroWord;

            instret_incr_o  <= 1'b0;
        end else if(flush_i == 1'b1 ) begin  //need to flush the pipeline
            rd_we_o <= `WriteDisable;
            rd_addr_o <= `NOPRegAddr;
            rd_wdata_o <= `ZeroWord;

            csr_we_o <= `WriteDisable;
            csr_waddr_o <= `ZeroWord;
            csr_wdata_o <= `ZeroWord;

            instret_incr_o <= 1'b0;
        end else if(stall_i[4] == `Stop && stall_i[5] == `NoStop) begin  //stall this stage
            rd_we_o <= `WriteDisable;
            rd_addr_o <= `NOPRegAddr;
            rd_wdata_o <= `ZeroWord;

            csr_we_o <= `WriteDisable;
            csr_waddr_o <= `ZeroWord;
            csr_wdata_o <= `ZeroWord;

            instret_incr_o  <= 1'b0;
        end else if(stall_i[4] == `NoStop) begin
		    // write the GPR
            rd_we_o <= rd_we_i;
            rd_addr_o <= rd_addr_i;
            rd_wdata_o <= rd_wdata_i;

			// write the CSR
            csr_we_o <= csr_we_i;
            csr_waddr_o <= csr_waddr_i;
            csr_wdata_o <= csr_wdata_i;
            //update the retired instruction counter by adding one
            instret_incr_o  <= 1'b1;
        end  //if
    end  //always
endmodule
