/*-------------------------------------------------------------------------
// Module:  if_id
// File:    if_id.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: fetch instruction from the instruction rom
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

module if_id(

    input wire                    clk_i,
    input wire                    n_rst_i,

    /* ------- signals from the ctrl unit --------*/
    input wire[5:0]               stall_i,
    input wire                    flush_i,

    /* ------- signals from the ifu  -------------*/
    input wire[`InstAddrBus]      pc_i,
    input wire[`InstAddrBus]      next_pc_i,
    input wire                    next_taken_i,
	input wire                    branch_slot_end_i,

    /* ------- signals from the inst_rom  --------*/
    input wire[`InstBus]          inst_i, //the instruction

    /* ---------signals from exu -----------------*/
    input wire                    branch_redirect_i,

	/* ------- signals to the decode -------------*/
    output reg[`InstAddrBus]      pc_o,
    output reg[`InstBus]          inst_o,
    output reg[`InstAddrBus]      next_pc_o,
    output reg                    next_taken_o,

	output reg                    branch_slot_end_o
);

    always @ (posedge clk_i) begin
        if (n_rst_i == `RstEnable) begin
            pc_o <= `ZeroWord;
            inst_o <= `NOP_INST;
            branch_slot_end_o <= 1'b0;
        end else if (branch_redirect_i == 1'b1) begin
            pc_o <= pc_i;
            inst_o <= `NOP_INST;
            branch_slot_end_o <= 1'b0;
        end else if(flush_i == 1'b1 ) begin
            pc_o <= pc_i;
            inst_o <= `NOP_INST;
            branch_slot_end_o <= 1'b0;
		// stop the fetching but keep the decoder on going
        end else if(stall_i[1] == `Stop && stall_i[2] == `NoStop) begin
            pc_o <= pc_i;
            inst_o <= `NOP_INST;
            branch_slot_end_o <= 1'b0;
        //pass the signals from ifu to decoder
        end else if(stall_i[1] == `NoStop) begin
            pc_o <= pc_i;
            inst_o <= inst_i;
            next_pc_o <= next_pc_i;
            next_taken_o <= next_taken_i;
            branch_slot_end_o <= branch_slot_end_i;
        end
    end
endmodule
