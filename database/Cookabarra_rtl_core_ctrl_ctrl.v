/*-------------------------------------------------------------------------
// Module:  ctrl
// File:    ctrl.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: the control module
// (1) handle the stall request from ifu, idu, exu, slu and control the pipeline
// (2) handle the interrupt and exeception.
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

module ctrl(
    input wire                   clk_i,
    input wire                   n_rst_i,

    input wire[`RegBus]          exception_i,
    input wire[`RegBus]          pc_i,
    input wire[`RegBus]          inst_i,

    /* ----- stall request from other modules --------*/
    input wire                   stallreq_from_if_i,
    input wire                   stallreq_from_id_i,
    input wire                   stallreq_from_ex_i,
    input wire                   stallreq_from_mem_i,

    /* ------------  signals from CSR  ---------------*/
    input wire                   mstatus_ie_i,    // global interrupt enabled or not
    input wire                   mie_external_i,  // external interrupt enbled or not
    input wire                   mie_timer_i,     // timer interrupt enabled or not
    input wire                   mie_sw_i,        // sw interrupt enabled or not

    input wire                   mip_external_i,   // external interrupt pending
    input wire                   mip_timer_i,      // timer interrupt pending
    input wire                   mip_sw_i,         // sw interrupt pending

    input wire[`RegBus]          mtvec_i,          // the trap vector
    input wire[`RegBus]          epc_i,            // get the epc for the mret instruction

    /* ------------  signals from CSR  ---------------*/
    output reg                   ie_type_o,
    output reg                   set_cause_o,
    output reg[3:0]              trap_casue_o,

    output reg                   set_epc_o,
    output reg[`RegBus]          epc_o,

    output reg                   set_mtval_o,
    output reg[`RegBus]          mtval_o,

    output reg                   mstatus_ie_clear_o,
    output reg                   mstatus_ie_set_o,

    /* ---signals to other stages of the pipeline  ----*/
    output reg[5:0]              stall_o,   // stall request to PC,IF_ID, ID_EX, EX_MEM, MEM_WB， one bit for one stage respectively
    output reg                   flush_o,   // flush the whole pipleline, exception or interrupt happens
    output reg[`RegBus]          new_pc_o   // notify the ifu to fetch the instruction from the new PC
);

    /* --------------------- handle the stall request -------------------*/
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            stall_o = 6'b000000;
        // stall request from lsu: need to stop the ifu(0), IF_ID(1), ID_EXE(2), EXE_MEM(3), MEM_WB(4)
        end else if(stallreq_from_mem_i == `Stop) begin
            stall_o = 6'b011111;
        // stall request from exu: stop the PC,IF_ID, ID_EXE, EXE_MEM
        end else if(stallreq_from_ex_i == `Stop) begin
            stall_o = 6'b001111;
		// stall request from id: stop PC,IF_ID, ID_EXE
        end else if(stallreq_from_id_i == `Stop) begin
            stall_o = 6'b000111;
		// stall request from if: stop the PC,IF_ID, ID_EXE
        end else if(stallreq_from_if_i == `Stop) begin
            stall_o = 6'b000111;
        end else begin
            stall_o = 6'b000000;
        end // if
    end // always


    /* --------------------- handle the the interrupt and exceptions -------------------*/
    // state registers
    reg [3:0] curr_state;
    reg [3:0] next_state;

    // machine states
    parameter STATE_RESET         = 4'b0001;
    parameter STATE_OPERATING     = 4'b0010;
    parameter STATE_TRAP_TAKEN    = 4'b0100;
    parameter STATE_TRAP_RETURN   = 4'b1000;

    //exception_i ={25'b0 ,misaligned_load, misaligned_store, illegal_inst, misaligned_inst, ebreak, ecall, mret}
    wire   mret;
    wire   ecall;
    wire   ebreak;
    wire   misaligned_inst;
    wire   illegal_inst;
    wire   misaligned_store;
    wire   misaligned_load;

    assign {misaligned_load, misaligned_store, illegal_inst, misaligned_inst, ebreak, ecall, mret} = exception_i[6:0];

    /* check there is a interrupt on pending*/
    wire   eip;
    wire   tip;
    wire   sip;
    wire   ip;

    assign eip = mie_external_i & mip_external_i;
    assign tip = mie_timer_i &  mip_timer_i;
    assign sip = mie_sw_i & mip_sw_i;
    assign ip = eip | tip | sip;

    /* an interrupt or an exception, need to be processed */
    wire   trap_happened;
    assign trap_happened = (mstatus_ie_i & ip) | ecall | misaligned_inst | illegal_inst | misaligned_store | misaligned_load;

    always @ (*)   begin
        case(curr_state)
            STATE_RESET: begin
                next_state = STATE_OPERATING;
            end

            STATE_OPERATING: begin
                if(trap_happened)
                    next_state = STATE_TRAP_TAKEN;
                else if(mret)
                    next_state = STATE_TRAP_RETURN;
                else
                    next_state = STATE_OPERATING;
            end

            STATE_TRAP_TAKEN: begin
                next_state = STATE_OPERATING;
            end

            STATE_TRAP_RETURN: begin
                next_state = STATE_OPERATING;
            end

            default: begin
                next_state = STATE_OPERATING;
            end
        endcase
    end

    always @(posedge clk_i) begin
        if(n_rst_i == `RstEnable)
            curr_state <= STATE_RESET;
        else
            curr_state <= next_state;
    end

    assign epc_o = pc_i;

    reg [1:0]          mtvec_mode; // machine trap mode
    reg [29:0]         mtvec_base; // machine trap base address

    assign mtvec_base = mtvec_i[31:2];
    assign mtvec_mode = mtvec_i[1:0];

    reg[`RegBus] trap_mux_out;
    wire [`RegBus] vec_mux_out;
    wire [`RegBus] base_offset;

    // mtvec = { base[maxlen-1:2], mode[1:0]}
    // The value in the BASE field must always be aligned on a 4-byte boundary, and the MODE setting may impose
    // additional alignment constraints on the value in the BASE field.
    // when mode =2'b00, direct mode, When MODE=Direct, all traps into machine mode cause the pc to be set to the address in the BASE field.
    // when mode =2'b01, Vectored mode, all synchronous exceptions into machine mode cause the pc to be set to the address in the BASE
    // field, whereas interrupts cause the pc to be set to the address in the BASE field plus four times the interrupt cause number.
    assign base_offset = {26'b0, trap_casue_o, 2'b0};  // trap_casue_o * 4
    assign vec_mux_out = mtvec_i[0] ? {mtvec_base, 2'b00} + base_offset : {mtvec_base, 2'b00};
    assign trap_mux_out = ie_type_o ? vec_mux_out : {mtvec_base, 2'b00};

    // output generation
    always @ (*)   begin
        case(curr_state)
            STATE_RESET: begin
                flush_o = 1'b0;
                new_pc_o = `REBOOT_ADDR;
                set_epc_o = 1'b0;
                set_cause_o = 1'b0;
                mstatus_ie_clear_o = 1'b0;
                mstatus_ie_set_o = 1'b0;
            end

            STATE_OPERATING: begin
                flush_o = 1'b0;
                new_pc_o = `ZeroWord;
                set_epc_o = 1'b0;
                set_cause_o = 1'b0;
                mstatus_ie_clear_o = 1'b0;
                mstatus_ie_set_o = 1'b0;
            end

            STATE_TRAP_TAKEN: begin
                flush_o = 1'b1;
                new_pc_o = trap_mux_out;       // jump to the trap handler
                set_epc_o = 1'b1;              // update the epc csr
                set_cause_o = 1'b1;            // update the mcause csr
                mstatus_ie_clear_o = 1'b1;     // disable the mie bit in the mstatus
                mstatus_ie_set_o = 1'b0;
            end

            STATE_TRAP_RETURN: begin
                flush_o = 1'b1;
                new_pc_o =  epc_i;
                set_epc_o = 1'b0;
                set_cause_o = 1'b0;
                mstatus_ie_clear_o = 1'b0;
                mstatus_ie_set_o = 1'b1;      //enable the mie
            end

            default: begin
                flush_o = 1'b0;
                new_pc_o = `ZeroWord;
                set_epc_o = 1'b0;
                set_cause_o = 1'b0;
                mstatus_ie_clear_o = 1'b0;
                mstatus_ie_set_o = 1'b0;
            end
        endcase
    end


    /* update the mcause csr */
    always @(posedge clk_i)
    begin
        if(n_rst_i == `RstEnable) begin
            trap_casue_o <= 4'b0;
            ie_type_o <= 1'b0;
            set_mtval_o <= 1'b0;
            mtval_o <= `ZeroWord;

        end else if(curr_state == STATE_OPERATING) begin
            if(mstatus_ie_i & eip) begin
                trap_casue_o <= 4'b1011; // M-mode external interrupt
                ie_type_o <= 1'b1;
            end else if(mstatus_ie_i & sip) begin
                trap_casue_o <= 4'b0011; // M-mode software interrupt
                ie_type_o <= 1'b1;
            end else if(mstatus_ie_i & tip) begin
                trap_casue_o <= 4'b0111; // M-mode timer interrupt
                ie_type_o <= 1'b1;

            end else if(misaligned_inst) begin
                trap_casue_o <= 4'b0000; // Instruction address misaligned, cause = 0
                ie_type_o <= 1'b0;
                set_mtval_o <= 1'b1;
                mtval_o <= pc_i;

            end else if(illegal_inst) begin
                trap_casue_o <= 4'b0010; // Illegal instruction, cause = 2
                ie_type_o <= 1'b0;
                set_mtval_o <= 1'b1;
                mtval_o <= inst_i;     //set to the instruction

            end else if(ebreak) begin
                trap_casue_o <= 4'b0011; // Breakpoint, cause =3
                ie_type_o <= 1'b0;
                set_mtval_o <= 1'b1;
                mtval_o <= pc_i;

            end else if(misaligned_store) begin
                trap_casue_o <= 4'b0110; // Store address misaligned  //cause 6
                ie_type_o <= 1'b0;
                set_mtval_o <= 1'b1;
                mtval_o <= pc_i;

            end else if(misaligned_load) begin
                trap_casue_o <= 4'b0100; // Load address misaligned  cause =4
                ie_type_o <= 1'b0;
                set_mtval_o <= 1'b1;
                mtval_o <= pc_i;

            end else if(ecall) begin
                trap_casue_o <= 4'b1011; // ecall from M-mode, cause = 11
                ie_type_o <= 1'b0;
            end
        end
    end

endmodule