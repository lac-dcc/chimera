/*-------------------------------------------------------------------------
// Module:  mem
// File:    mem.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: LSU
//              (1) handle the load and store instruction
//              (2) process the exception
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

module mem(

    input wire                    n_rst_i,

    /*-- signals from exu-----*/
    input wire[`RegBus]           exception_i,       // exception type
    input wire[`RegBus]           pc_i,       // the pc when exception happened
    input wire[`RegBus]           inst_i,            // the instruction caused the exception

    input wire                    rd_we_i,
    input wire[`RegAddrBus]       rd_addr_i,
    input wire[`RegBus]           rd_wdata_i,

    input wire[`AluOpBus]         uopcode_i,         //uop_code, to determine it is a load or a store
    input wire[`RegBus]           mem_addr_i,
    input wire[`RegBus]           mem_wdata_i,

    /*-- signals to access the external memory -----*/
    output reg[`RegBus]           mem_addr_o,
    output wire                   mem_we_o,
    output reg[3:0]               mem_sel_o,          //the selector for bytes operation
    output reg[`RegBus]           mem_data_o,
    output reg                    mem_ce_o,
    input wire[`RegBus]           mem_data_i,        //the read result from memroy

    input wire                    csr_we_i,
    input wire[`RegBus]           csr_waddr_i,
    input wire[`RegBus]           csr_wdata_i,

    /*-- signals from write back for data dependance detection -----*/
    input wire                    wb_csr_we_i,
    input wire[`RegBus]           wb_csr_waddr_i,
    input wire[`RegBus]           wb_csr_wdata_i,

    /*-- pass down to mem_wb stage -----*/
    output reg                    rd_we_o,
    output reg[`RegAddrBus]       rd_addr_o,
    output reg[`RegBus]           rd_wdata_o,

    output reg                    csr_we_o,
    output reg[`RegBus]           csr_waddr_o,
    output reg[`RegBus]           csr_wdata_o,

    /*------- signals to control ----------*/
    output wire                   stall_req_o,
    output reg[`RegBus]           exception_o,
    output reg[`RegBus]           pc_o,
    output reg[`RegBus]           inst_o

);

    reg  mem_we;
    reg  mem_re;

    reg  addr_align_halfword;
    reg  addr_align_word;

    reg  load_operation;
    reg  store_operation;

    reg  load_addr_align_exception;
    reg  store_addr_align_exception;

    assign load_operation = ( (uopcode_i == `UOP_CODE_LH) || (uopcode_i == `UOP_CODE_LHU) ||(uopcode_i == `UOP_CODE_LW) ) ? 1'b1 : 1'b0;

    assign store_operation = ( (uopcode_i == `UOP_CODE_SH) ||(uopcode_i == `UOP_CODE_SW) ) ? 1'b1 : 1'b0;


    assign addr_align_halfword =(   ( (uopcode_i == `UOP_CODE_SH) || (uopcode_i == `UOP_CODE_LH) || (uopcode_i == `UOP_CODE_LHU) )
                                 && (mem_addr_i[0] == 1'b0) ) ? 1'b1 : 1'b0;

    assign addr_align_word =(   ( (uopcode_i == `UOP_CODE_SW) || (uopcode_i == `UOP_CODE_LW) )
                             && (mem_addr_i[1:0] == 2'b00 ) ) ? 1'b1 : 1'b0;

    assign load_addr_align_exception = (~ (addr_align_halfword || addr_align_word)) & load_operation;
    assign store_addr_align_exception = (~ (addr_align_halfword || addr_align_word)) & store_operation;

    // to ctrl module
    //exception ={ misaligned_load, misaligned_store, illegal_inst, misaligned_inst, ebreak, ecall, mret}
    assign exception_o = {25'b0, load_addr_align_exception, store_addr_align_exception, exception_i[4:0]};

    // to the next stage
    assign pc_o = pc_i;
    assign inst_o = inst_i;

    assign csr_we_o = csr_we_i;
    assign csr_waddr_o = csr_waddr_i;
    assign csr_wdata_o = csr_wdata_i;

    assign rd_we_o = rd_we_i;
    assign rd_addr_o = rd_addr_i;
    assign rd_wdata_o = rd_wdata_i;

    assign mem_we = ( (uopcode_i == `UOP_CODE_SB) || (uopcode_i == `UOP_CODE_SH)
                    ||(uopcode_i == `UOP_CODE_SW) ) ? 1'b1 : 1'b0;

    assign mem_re = ( (uopcode_i == `UOP_CODE_LB) || (uopcode_i == `UOP_CODE_LBU)
	                ||(uopcode_i == `UOP_CODE_LH) || (uopcode_i == `UOP_CODE_LHU)
			   	    ||(uopcode_i == `UOP_CODE_LW) ) ? 1'b1 : 1'b0;

    assign mem_we_o = mem_we & (~(|exception_o));  // if exeception happened, give up the store operation on the ram
    assign mem_ce_o = mem_we_o | mem_re;
    assign mem_addr_o = mem_addr_i;

    assign stall_req_o = 0;

    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
			//operation on RAM
            mem_addr_o = `ZeroWord;
            mem_we = `WriteDisable;
            mem_sel_o = 4'b0000;
            mem_data_o = `ZeroWord;
            mem_ce_o = `ChipDisable;

            //GPR
            rd_addr_o = `NOPRegAddr;
            rd_we_o = `WriteDisable;
            rd_wdata_o = `ZeroWord;

			//CSR
            csr_we_o = `WriteDisable;
            csr_waddr_o = `ZeroWord;
            csr_wdata_o = `ZeroWord;

            exception_o = `ZeroWord;
            pc_o = `ZeroWord;
            inst_o =  `NOP_INST;
        end else begin
            mem_sel_o = 4'b1111;
            case (uopcode_i)
                `UOP_CODE_LB:     begin
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            rd_wdata_o = {{24{mem_data_i[7]}},mem_data_i[7:0]};
                            mem_sel_o = 4'b1000;
                        end
                        2'b01:  begin
                            rd_wdata_o = {{24{mem_data_i[15]}},mem_data_i[15:8]};
                            mem_sel_o = 4'b0100;
                        end
                        2'b10:  begin
                            rd_wdata_o = {{24{mem_data_i[23]}},mem_data_i[23:16]};
                            mem_sel_o = 4'b0010;
                        end
                        2'b11:  begin
                            rd_wdata_o = {{24{mem_data_i[31]}},mem_data_i[31:24]};
                            mem_sel_o = 4'b0001;
                        end
                        default:    begin
                            rd_wdata_o = `ZeroWord;
                        end
                    endcase
                end

                `UOP_CODE_LBU:        begin
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            rd_wdata_o = {{24{1'b0}},mem_data_i[7:0]};
                            mem_sel_o = 4'b1000;
                        end
                        2'b01:  begin
                            rd_wdata_o = {{24{1'b0}},mem_data_i[15:8]};
                            mem_sel_o = 4'b0100;
                        end
                        2'b10:  begin
                            rd_wdata_o = {{24{1'b0}},mem_data_i[23:16]};
                            mem_sel_o = 4'b0010;
                        end
                        2'b11:  begin
                            rd_wdata_o = {{24{1'b0}},mem_data_i[31:24]};
                            mem_sel_o = 4'b0001;
                        end
                        default:    begin
                            rd_wdata_o = `ZeroWord;
                        end
                    endcase
                end

                `UOP_CODE_LH:     begin
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            rd_wdata_o = {{16{mem_data_i[15]}},mem_data_i[15:0]};
                            mem_sel_o = 4'b1100;
                        end
                        2'b10:  begin
                            rd_wdata_o = {{16{mem_data_i[31]}},mem_data_i[31:16]};
                            mem_sel_o = 4'b0011;
                        end
                        default:    begin
                            rd_wdata_o = `ZeroWord;
                        end
                    endcase
                end

                `UOP_CODE_LHU:        begin
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            rd_wdata_o = {{16{1'b0}},mem_data_i[15:0]};
                            mem_sel_o = 4'b1100;
                        end
                        2'b10:  begin
                            rd_wdata_o = {{16{1'b0}},mem_data_i[31:16]};
                            mem_sel_o = 4'b0011;
                        end
                        default:    begin
                            rd_wdata_o = `ZeroWord;
                        end
                    endcase
                end

                `UOP_CODE_LW:     begin
                    rd_wdata_o = mem_data_i;
                    mem_sel_o = 4'b1111;
                end

                `UOP_CODE_SB:     begin
                    mem_data_o = {mem_wdata_i[7:0],mem_wdata_i[7:0],mem_wdata_i[7:0],mem_wdata_i[7:0]};
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            mem_sel_o = 4'b0001;
                        end
                        2'b01:  begin
                            mem_sel_o = 4'b0010;
                        end
                        2'b10:  begin
                            mem_sel_o = 4'b0100;
                        end
                        2'b11:  begin
                            mem_sel_o = 4'b1000;
                        end
                        default:    begin
                            mem_sel_o = 4'b0000;
                        end
                    endcase
                end

                `UOP_CODE_SH:     begin
                    mem_data_o = {mem_wdata_i[15:0],mem_wdata_i[15:0]};
                    case (mem_addr_i[1:0])
                        2'b00:  begin
                            mem_sel_o = 4'b0011;
                        end
                        2'b10:  begin
                            mem_sel_o = 4'b1100;
                        end
                        default:    begin
                            mem_sel_o = 4'b0000;
                        end
                    endcase
                end

                `UOP_CODE_SW:  begin
                    // check the address align with 4 bytes
                    mem_data_o = mem_wdata_i;
                    mem_sel_o = 4'b1111;
                end

                default:  begin
                    //nothing to do
                end
            endcase
        end    //if
    end   //always
endmodule



