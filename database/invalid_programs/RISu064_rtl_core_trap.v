`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`include "defines.vh"

// Trap and CSR handling, generate interrupt and handles exception
// Supervisior mode interrupt delegation is not supported (yet)
module trap(
    input  wire         clk,
    input  wire         rst,
    // External interrupt
    input  wire         extint_software,
    input  wire         extint_timer,
    input  wire         extint_external,
    // From issue
    input  wire [63:0]  ix_trap_pc,
    input  wire [4:0]   ix_trap_dst,
    input  wire [1:0]   ix_trap_csr_op,
    input  wire [11:0]  ix_trap_csr_id,
    input  wire [63:0]  ix_trap_csr_opr,
    input  wire         ix_trap_mret,
    input  wire         ix_trap_int,
    input  wire         ix_trap_intexc,
    input  wire [3:0]   ix_trap_cause,
    input  wire         ix_trap_valid,
    output wire         ix_trap_ready,
    output wire [15:0]  trap_ix_ip, // Pending and ready interrupt
    // To writeback
    output reg  [4:0]   trap_wb_dst,
    output reg  [63:0]  trap_wb_result,
    output reg  [63:0]  trap_wb_pc,
    output reg          trap_wb_wb_en,
    output reg          trap_wb_valid,
    input  wire         trap_wb_ready,
    // From writeback, for counting
    input  wire [2:0]   wb_trap_instret, // Number of instructions retired
    // To MMU
    output wire [63:0]  trap_mmu_satp,
    output wire [1:0]   trap_mmu_mpp,
    // To instruction fetch unit
    output reg          trap_if_pc_override,
    output reg  [63:0]  trap_if_new_pc
);
    parameter HARTID = 64'd0;

    localparam ST_IDLE = 1'd0;
    localparam ST_CSRWR = 1'd1;
    reg [0:0] state;

    reg [63:0] mcycle;
    reg [63:0] minstret;
    reg gmie; // global interrupt enable
    reg gmpie; // Previous interrupt enable
    reg [15:0] mie;
    reg [15:0] mip;
    reg [63:0] mtvec;
    reg [63:0] mscratch;
    reg [63:0] mepc;
    reg mcause_intexc;
    reg [3:0] mcause_code;
`ifdef ENABLE_MMU
    reg [1:0] mpp;
    reg [63:0] satp;

    assign trap_mmu_satp = satp;
    assign trap_mmu_mpp = mpp;

    wire machine_csr_allowed = mpp == `MSTATUS_MPP_MACHINE;
    wire supervisor_csr_allowed = mpp == `MSTATUS_MPP_SUPERVISOR || machine_csr_allowed;
`else
    assign trap_mmu_satp = 64'b0;
    assign trap_mmu_mpp = `MSTATUS_MPP_MACHINE;
    wire machine_csr_allowed = 1'b1;
    wire supervisor_csr_allowed = 1'b0;
`endif

    assign trap_ix_ip = gmie ? (mie & mip) : (16'b0);

    // CSR op
    reg [1:0] csr_op;
    reg [63:0] csr_opr;
    reg [11:0] csr_id;
    wire [63:0] csr_wr =
            (csr_op == `CSR_RW) ? (csr_opr) :
            (csr_op == `CSR_RS) ? (trap_wb_result | csr_opr) :
            (csr_op == `CSR_RC) ? (trap_wb_result & ~csr_opr) : trap_wb_result;

    wire [63:0] trapvec_int = (mtvec[1:0] == `MTVEC_MODE_VECTORED) ?
            {mtvec[63:6], ix_trap_cause[3:0], 2'b0} : {mtvec[63:2], 2'b0};
    wire [63:0] trapvec_exc = {mtvec[63:2], 2'b0};

    reg extint_software_last;
    reg extint_timer_last;
    reg extint_external_last;
    wire extint_software_active = !extint_software_last && extint_software;
    wire extint_timer_active = !extint_timer_last && extint_timer;
    wire extint_external_active = !extint_external_last && extint_external;
    wire [15:0] extint_pending_overlay = {4'b0, extint_external_active,
            3'b0, extint_timer_active, 3'b0, extint_software_active, 3'b0};
        
    assign ix_trap_ready = (state == ST_IDLE);

    always @(posedge clk) begin
        // If not otherwise modified, update values
        mcycle <= mcycle + 1;
        minstret <= minstret + {61'b0, wb_trap_instret};
        mip <= mip | extint_pending_overlay;

        // Update external interrupt reg
        extint_software_last <= extint_software;
        extint_timer_last <= extint_timer;
        extint_external_last <= extint_external;

        // Trap & CSR FSM
        case (state)
        ST_IDLE: begin
            trap_wb_valid <= 1'b0;
            trap_if_pc_override <= 1'b0;
            if (ix_trap_valid) begin
                // Accept
                if (ix_trap_int) begin
                    // Interrupt
                    if ((ix_trap_intexc == `MCAUSE_EXCEPTION) || (gmie &&
                            ((mie[`MIE_MSI] && (ix_trap_cause == `MCAUSE_MSI)) ||
                            (mie[`MIE_MTI] && (ix_trap_cause == `MCAUSE_MTI)) ||
                            (mie[`MIE_MEI] && (ix_trap_cause == `MCAUSE_MEI))))) begin
                        // Interrupt accepted, otherwise silently reject
                        mcause_intexc <= ix_trap_intexc;
                        mcause_code <= ix_trap_cause;
                        trap_if_pc_override <= 1'b1;
                        trap_if_new_pc <= (ix_trap_intexc == `MCAUSE_EXCEPTION) ?
                                (trapvec_exc) : (trapvec_int);
                        mepc <= ix_trap_pc;
                        gmie <= 1'b0;
                        gmpie <= gmie;
                        state <= ST_IDLE;
                    end
                end
                else if (ix_trap_mret) begin
                    trap_if_pc_override <= 1'b1;
                    trap_if_new_pc <= mepc;
                    gmie <= gmpie;
                    gmpie <= 1'b1;
                    state <= ST_IDLE;
                    // Issue a wb_valid without wb_en to register itself as
                    // an retired instruction
                    trap_wb_valid <= 1'b1;
                    trap_wb_wb_en <= 1'b0;
                end
                else begin
                    // CSR read
                    state <= ST_CSRWR;
                    trap_wb_wb_en <= 1'b1;
                    trap_wb_dst <= ix_trap_dst;
                    trap_wb_pc <= ix_trap_pc;
                    trap_wb_valid <= 1'b1;
                    csr_op <= ix_trap_csr_op;
                    csr_opr <= ix_trap_csr_opr;
                    csr_id <= ix_trap_csr_id;
                    case (ix_trap_csr_id)
                    `CSR_CYCLE: trap_wb_result <= mcycle;
                    // CSR_TIME triggers an exception
                    `CSR_INSTRET: trap_wb_result <= minstret;
                    `CSR_MVENDORID: trap_wb_result <= `MVENDORID;
                    `CSR_MARCHID: trap_wb_result <= `MARCHID;
                    `CSR_MIMPID: trap_wb_result <= `MIMPID;
                    `CSR_MHARTID: trap_wb_result <= HARTID;
                    `CSR_MISA: trap_wb_result <= `MISA_VAL;
                    `CSR_MIE: trap_wb_result <= {48'b0, mie};
                    `CSR_MTVEC: trap_wb_result <= mtvec;
                    `CSR_MSCRATCH: trap_wb_result <= mscratch;
                    `CSR_MEPC: trap_wb_result <= mepc;
                    `CSR_MCAUSE: trap_wb_result <= {mcause_intexc, 59'd0, mcause_code};
                    `CSR_MIP: trap_wb_result <= {48'b0, mip};
                    `CSR_MCYCLE: trap_wb_result <= mcycle;
                    `CSR_MINSTRET: trap_wb_result <= minstret;
                    `ifdef ENABLE_MMU
                    `CSR_MSTATUS: trap_wb_result <= {51'b0, mpp, 3'd0, gmpie, 3'd0, gmie, 3'd0};
                    `CSR_SATP: trap_wb_result <= satp;
                    `else
                    `CSR_MSTATUS: trap_wb_result <= {56'd0, gmpie, 3'd0, gmie, 3'd0};
                    `endif
                    default: begin
                        // Invalid CSR read
                    `ifndef IGNORE_INVALID_CSR
                        mcause_intexc <= `MCAUSE_EXCEPTION;
                        mcause_code <= `MCAUSE_ILLEGALI;
                        trap_if_pc_override <= 1'b1;
                        trap_if_new_pc <= trapvec_exc;
                        mepc <= ix_trap_pc;
                        gmie <= 1'b0;
                        gmpie <= gmie;
                        state <= ST_IDLE;
                    `else
                        trap_wb_result <= 64'd0;
                    `endif
                        $display("Unknwon CSR");
                    end
                    endcase
                    if (((ix_trap_csr_id[9:8] == 2'b11) && !machine_csr_allowed) || 
                            ((ix_trap_csr_id[9:8] == 2'b01) && !supervisor_csr_allowed) ||
                            ((ix_trap_csr_id[11:10] == 2'b11) && (ix_trap_csr_op != `CSR_RD))) begin
                        // Access CSR without appropriate priviledge level or
                        // writing to read-only CSRs raise illegal instruction
                        // exception.
                        mcause_intexc <= `MCAUSE_EXCEPTION;
                        mcause_code <= `MCAUSE_ILLEGALI;
                        trap_if_pc_override <= 1'b1;
                        trap_if_new_pc <= trapvec_exc;
                        mepc <= ix_trap_pc;
                        gmie <= 1'b0;
                        gmpie <= gmie;
                        state <= ST_IDLE;
                        $display("Illegal CSR access");
                    end
                    $display("CSR read %x = %d", ix_trap_csr_id, trap_wb_result);
                end
            end
        end
        ST_CSRWR: begin
            if (trap_wb_ready) begin
                state <= ST_IDLE;
                trap_wb_valid <= 1'b0;
            end
            case (csr_id)
            `CSR_MSTATUS: begin
                `ifdef ENABLE_MMU
                mpp <= csr_wr[`MSTATUS_MPP_MSB:`MSTATUS_MPP_LSB];
                `endif
                gmie <= csr_wr[`MSTATUS_MIE_BIT];
                gmpie <= csr_wr[`MSTATUS_MPIE_BIT];
            end
            `CSR_MIE: mie <= csr_wr[15:0];
            `CSR_MTVEC: mtvec <= csr_wr;
            `CSR_MSCRATCH: mscratch <= csr_wr;
            `CSR_MEPC: mepc <= csr_wr;
            `CSR_MCAUSE: begin
                mcause_intexc <= csr_wr[63];
                mcause_code <= csr_wr[3:0];
            end
            `CSR_MIP: mip <= csr_wr[15:0] | extint_pending_overlay;
            `CSR_MCYCLE: mcycle <= csr_wr;
            `CSR_MINSTRET: minstret <= csr_wr;
            `ifdef ENABLE_MMU
            `CSR_SATP: satp <= csr_wr;
            `endif
            default: begin end // Nothing to do by default
            endcase
        end
        endcase

        if (rst) begin
            state <= ST_IDLE;
            gmie <= 1'b0;
            mie <= 16'd0;
            `ifdef ENABLE_MMU
            mpp <= `MSTATUS_MPP_MACHINE;
            satp[63:60] <= 4'd0;
            `endif
            // mcycle and minstret does not need reset
            // They could hold any value after reset
            // mip should be manually cleared before unmasking interrupt
        end
    end

endmodule
