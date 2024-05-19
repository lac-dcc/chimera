// This program was cloned from: https://github.com/ultraembedded/core_uriscv
// License: Apache License 2.0

//-----------------------------------------------------------------
//                          uRISC-V CPU
//                            V0.5.0
//               github.com/ultraembedded/core_uriscv
//                     Copyright 2015-2021
//
//                   admin@ultra-embedded.com
//
//                     License: Apache 2.0
//-----------------------------------------------------------------
// Copyright 2015-2021 github.com/ultraembedded
// 
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
module uriscv_csr
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter SUPPORT_CSR = 1
    ,parameter SUPPORT_MCYCLE = 1
    ,parameter SUPPORT_MTIMECMP = 1
    ,parameter SUPPORT_MSCRATCH = 1
    ,parameter SUPPORT_MIP_MIE = 1
    ,parameter SUPPORT_MTVEC = 1
    ,parameter SUPPORT_MTVAL = 1
    ,parameter SUPPORT_MULDIV = 1
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
     input          clk_i
    ,input          rst_i

    ,input          intr_i
    ,input  [31:0]  isr_vector_i

    ,input  [31:0]  cpu_id_i

    ,input          valid_i
    ,input  [31:0]  pc_i
    ,input  [31:0]  opcode_i
    ,input  [31:0]  rs1_val_i
    ,input  [31:0]  rs2_val_i
    ,output [31:0]  csr_rdata_o

    ,input          excpn_invalid_inst_i
    ,input          excpn_lsu_align_i

    ,input  [31:0]  mem_addr_i

    ,output [31:0]  csr_mepc_o

    ,output         exception_o
    ,output [5:0]   exception_type_o
    ,output [31:0]  exception_pc_o
);


//-----------------------------------------------------------------
// Includes
//-----------------------------------------------------------------
`include "uriscv_defs.v"

wire take_interrupt_w;
wire exception_w;

//-----------------------------------------------------------------
// Instruction Decode
//-----------------------------------------------------------------
wire [2:0] func3_w     = opcode_i[14:12]; // R, I, S
wire [4:0] rs1_w       = opcode_i[19:15];
wire [4:0] rs2_w       = opcode_i[24:20];
wire [4:0] rd_w        = opcode_i[11:7];

wire type_system_w     = (opcode_i[6:2] == 5'b11100);
wire type_store_w      = (opcode_i[6:2] == 5'b01000);

wire inst_csr_w        = SUPPORT_CSR && type_system_w && (func3_w != 3'b000 && func3_w != 3'b100);
wire inst_csrrw_w      = inst_csr_w  && (func3_w == 3'b001);
wire inst_csrrs_w      = inst_csr_w  && (func3_w == 3'b010);
wire inst_csrrc_w      = inst_csr_w  && (func3_w == 3'b011);
wire inst_csrrwi_w     = inst_csr_w  && (func3_w == 3'b101);
wire inst_csrrsi_w     = inst_csr_w  && (func3_w == 3'b110);
wire inst_csrrci_w     = inst_csr_w  && (func3_w == 3'b111);

wire inst_ecall_w      = SUPPORT_CSR && type_system_w && (opcode_i[31:7] == 25'h000000);
wire inst_ebreak_w     = SUPPORT_CSR && type_system_w && (opcode_i[31:7] == 25'h002000);
wire inst_mret_w       = SUPPORT_CSR && type_system_w && (opcode_i[31:7] == 25'h604000);

wire [11:0] csr_addr_w = valid_i ? opcode_i[31:20] : 12'b0;
wire [31:0] csr_data_w = (inst_csrrwi_w || inst_csrrsi_w || inst_csrrci_w) ? {27'b0, rs1_w} : rs1_val_i;
wire        csr_set_w  = (valid_i && !exception_w) ? (inst_csrrw_w || inst_csrrs_w || inst_csrrwi_w || inst_csrrsi_w): 1'b0;
wire        csr_clr_w  = (valid_i && !exception_w) ? (inst_csrrw_w || inst_csrrc_w || inst_csrrwi_w || inst_csrrci_w): 1'b0;

//-----------------------------------------------------------------
// Execute: CSR Access
//-----------------------------------------------------------------
reg [31:0] csr_mepc_q;
reg [31:0] csr_mepc_r;
reg [31:0] csr_mcause_q;
reg [31:0] csr_mcause_r;
reg [31:0] csr_sr_q;
reg [31:0] csr_sr_r;
reg [31:0] csr_mcycle_q;
reg [31:0] csr_mcycle_r;
reg [31:0] csr_mtimecmp_q;
reg [31:0] csr_mtimecmp_r;
reg [31:0] csr_mscratch_q;
reg [31:0] csr_mscratch_r;
reg [31:0] csr_mip_q;
reg [31:0] csr_mip_r;
reg [31:0] csr_mie_q;
reg [31:0] csr_mie_r;
reg [31:0] csr_mtvec_q;
reg [31:0] csr_mtvec_r;
reg [31:0] csr_mtval_q;
reg [31:0] csr_mtval_r;

always @ *
begin
    csr_mepc_r      = csr_mepc_q;
    csr_mcause_r    = csr_mcause_q;
    csr_sr_r        = csr_sr_q;

    csr_mcycle_r    = csr_mcycle_q + 32'd1;
    csr_mtimecmp_r  = csr_mtimecmp_q;
    csr_mscratch_r  = csr_mscratch_q;
    csr_mip_r       = csr_mip_q;
    csr_mie_r       = csr_mie_q;
    csr_mtvec_r     = csr_mtvec_q;
    csr_mtval_r     = csr_mtval_q;

    // External interrupt
    if (intr_i)
        csr_mip_r[`IRQ_M_EXT] = 1'b1;

    // Timer match - generate IRQ
    if (SUPPORT_MTIMECMP && csr_mcycle_r == csr_mtimecmp_r)
        csr_mip_r[`SR_IP_MTIP_R] = 1'b1;

    // Execute instruction / exception
    if (valid_i)
    begin
        // Exception / break / ecall
        if (exception_w || inst_ebreak_w || inst_ecall_w)
        begin
            // Save interrupt / supervisor state
            csr_sr_r[`SR_MPIE_R] = csr_sr_q[`SR_MIE_R];
            csr_sr_r[`SR_MPP_R]  = `PRIV_MACHINE;

            // Disable interrupts and enter supervisor mode
            csr_sr_r[`SR_MIE_R]  = 1'b0;

            // Save PC of next instruction (not yet executed)
            csr_mepc_r           = pc_i;

            // Extra info (badaddr / fault opcode)
            csr_mtval_r          = 32'b0;

            // Exception source
            if (excpn_invalid_inst_i)
            begin
                csr_mcause_r   = `MCAUSE_ILLEGAL_INSTRUCTION;
                csr_mtval_r    = opcode_i;
            end
            else if (inst_ebreak_w)
                csr_mcause_r   = `MCAUSE_BREAKPOINT;
            else if (inst_ecall_w)
                csr_mcause_r   = `MCAUSE_ECALL_M;
            else if (excpn_lsu_align_i)
            begin
                csr_mcause_r   = type_store_w ? `MCAUSE_MISALIGNED_STORE : `MCAUSE_MISALIGNED_LOAD;
                csr_mtval_r    = mem_addr_i;
            end
            else if (take_interrupt_w)
                csr_mcause_r   = `MCAUSE_INTERRUPT;
        end
        // MRET
        else if (inst_mret_w) 
        begin
            // Interrupt enable pop
            csr_sr_r[`SR_MIE_R]  = csr_sr_r[`SR_MPIE_R];
            csr_sr_r[`SR_MPIE_R] = 1'b1;

            // This CPU only supports machine mode
            csr_sr_r[`SR_MPP_R] = `PRIV_MACHINE;
        end
        else
        begin
            case (csr_addr_w)
            `CSR_MEPC:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mepc_r = csr_data_w;
                else if (csr_set_w)
                    csr_mepc_r = csr_mepc_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mepc_r = csr_mepc_r & ~csr_data_w;
            end
            `CSR_MCAUSE:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mcause_r = csr_data_w;
                else if (csr_set_w)
                    csr_mcause_r = csr_mcause_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mcause_r = csr_mcause_r & ~csr_data_w;
            end
            `CSR_MSTATUS:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_sr_r = csr_data_w;
                else if (csr_set_w)
                    csr_sr_r = csr_sr_r | csr_data_w;
                else if (csr_clr_w)
                    csr_sr_r = csr_sr_r & ~csr_data_w;
            end
            `CSR_MTIMECMP:
            begin
                if (SUPPORT_MTIMECMP && csr_set_w && csr_data_w != 32'b0)
                begin
                    csr_mtimecmp_r = csr_data_w;

                    // Clear interrupt pending
                    csr_mip_r[`SR_IP_MTIP_R] = 1'b0;
                end
            end
            `CSR_MSCRATCH:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mscratch_r = csr_data_w;
                else if (csr_set_w)
                    csr_mscratch_r = csr_mscratch_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mscratch_r = csr_mscratch_r & ~csr_data_w;
            end
            `CSR_MIP:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mip_r = csr_data_w;
                else if (csr_set_w)
                    csr_mip_r = csr_mip_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mip_r = csr_mip_r & ~csr_data_w;
            end
            `CSR_MIE:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mie_r = csr_data_w;
                else if (csr_set_w)
                    csr_mie_r = csr_mie_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mie_r = csr_mie_r & ~csr_data_w;
            end
            `CSR_MTVEC:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mtvec_r = csr_data_w;
                else if (csr_set_w)
                    csr_mtvec_r = csr_mtvec_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mtvec_r = csr_mtvec_r & ~csr_data_w;
            end
            `CSR_MTVAL:
            begin
                if (csr_set_w && csr_clr_w)
                    csr_mtval_r = csr_data_w;
                else if (csr_set_w)
                    csr_mtval_r = csr_mtval_r | csr_data_w;
                else if (csr_clr_w)
                    csr_mtval_r = csr_mtval_r & ~csr_data_w;
            end
            default:
              ;
            endcase
        end
    end
end

`ifdef verilator
`define HAS_SIM_CTRL
`endif
`ifdef verilog_sim
`define HAS_SIM_CTRL
`endif

always @ (posedge clk_i )
if (rst_i)
begin
    csr_mepc_q       <= 32'b0;
    csr_mcause_q     <= 32'b0;
    csr_sr_q         <= 32'b0;
    csr_mcycle_q     <= 32'b0;
    csr_mtimecmp_q   <= 32'b0;
    csr_mscratch_q   <= 32'b0;
    csr_mie_q        <= 32'b0;
    csr_mip_q        <= 32'b0;
    csr_mtvec_q      <= 32'b0;
    csr_mtval_q      <= 32'b0;
end
else
begin
    csr_mepc_q       <= csr_mepc_r;
    csr_mcause_q     <= csr_mcause_r;
    csr_sr_q         <= csr_sr_r;
    csr_mcycle_q     <= SUPPORT_MCYCLE   ? csr_mcycle_r   : 32'b0;
    csr_mtimecmp_q   <= SUPPORT_MTIMECMP ? csr_mtimecmp_r : 32'b0;
    csr_mscratch_q   <= SUPPORT_MSCRATCH ? csr_mscratch_r : 32'b0;
    csr_mie_q        <= SUPPORT_MIP_MIE  ? csr_mie_r      : 32'b0;
    csr_mip_q        <= SUPPORT_MIP_MIE  ? csr_mip_r      : 32'b0;
    csr_mtvec_q      <= SUPPORT_MTVEC    ? csr_mtvec_r    : 32'b0;
    csr_mtval_q      <= SUPPORT_MTVAL    ? csr_mtval_r    : 32'b0;

`ifdef HAS_SIM_CTRL
    if (valid_i && (csr_addr_w == `CSR_DSCRATCH || csr_addr_w == `CSR_SIM_CTRL) && inst_csr_w)
    begin
        case (csr_data_w & 32'hFF000000)
        `CSR_SIM_CTRL_EXIT:
        begin
            $finish;
            $finish;
        end
        `CSR_SIM_CTRL_PUTC:
        begin
            $write("%c", csr_data_w[7:0]);
        end
        endcase
    end
`endif           
end

//-----------------------------------------------------------------
// CSR Read Data MUX
//-----------------------------------------------------------------
reg [31:0] csr_data_r;

always @ *
begin
    csr_data_r = 32'b0;

    case (csr_addr_w)
    `CSR_MEPC:      csr_data_r = csr_mepc_q & `CSR_MEPC_MASK;
    `CSR_MCAUSE:    csr_data_r = csr_mcause_q & `CSR_MCAUSE_MASK;
    `CSR_MSTATUS:   csr_data_r = csr_sr_q & `CSR_MSTATUS_MASK;
    `CSR_MTVEC:     csr_data_r = csr_mtvec_q & `CSR_MTVEC_MASK;
    `CSR_MTVAL:     csr_data_r = csr_mtval_q & `CSR_MTVAL_MASK;
    `CSR_MTIME,
    `CSR_MCYCLE:    csr_data_r = csr_mcycle_q & `CSR_MTIME_MASK;
    `CSR_MTIMECMP:  csr_data_r = csr_mtimecmp_q & `CSR_MTIMECMP_MASK;
    `CSR_MSCRATCH:  csr_data_r = csr_mscratch_q & `CSR_MSCRATCH_MASK;
    `CSR_MIP:       csr_data_r = csr_mip_q & `CSR_MIP_MASK;
    `CSR_MIE:       csr_data_r = csr_mie_q & `CSR_MIE_MASK;
    `CSR_MISA:      csr_data_r = (SUPPORT_MULDIV ? `MISA_RVM : 32'b0) |
                                 `MISA_RV32 | `MISA_RVI;
    `CSR_MHARTID:   csr_data_r = cpu_id_i;
    default:        csr_data_r = 32'b0;
    endcase
end

assign csr_rdata_o       = csr_data_r;

// Interrupt request and interrupt enabled
assign take_interrupt_w  = SUPPORT_MIP_MIE ? ((|(csr_mip_q & csr_mie_q)) & csr_sr_q[`SR_MIE_R]) : (intr_i & csr_sr_q[`SR_MIE_R]);
assign exception_w       = valid_i && (take_interrupt_w || excpn_invalid_inst_i || (SUPPORT_CSR && excpn_lsu_align_i));

assign exception_o       = exception_w;
assign exception_pc_o    = SUPPORT_MTVEC ? csr_mtvec_q  : 
                           SUPPORT_CSR   ? isr_vector_i :
                           pc_i + 32'd4;
assign csr_mepc_o        = csr_mepc_q;

//-----------------------------------------------------------------
// Debug - exception type (checker use only)
//-----------------------------------------------------------------
reg [5:0] v_etype_r;

always @ *
begin
    v_etype_r = 6'b0;

    if (csr_mcause_r[`MCAUSE_INT])
        v_etype_r = `RV_EXCPN_INTERRUPT;
    else case (csr_mcause_r)
    `MCAUSE_MISALIGNED_FETCH   : v_etype_r = `RV_EXCPN_MISALIGNED_FETCH;
    `MCAUSE_FAULT_FETCH        : v_etype_r = `RV_EXCPN_FAULT_FETCH;
    `MCAUSE_ILLEGAL_INSTRUCTION: v_etype_r = `RV_EXCPN_ILLEGAL_INSTRUCTION;
    `MCAUSE_BREAKPOINT         : v_etype_r = `RV_EXCPN_BREAKPOINT;
    `MCAUSE_MISALIGNED_LOAD    : v_etype_r = `RV_EXCPN_MISALIGNED_LOAD;
    `MCAUSE_FAULT_LOAD         : v_etype_r = `RV_EXCPN_FAULT_LOAD;
    `MCAUSE_MISALIGNED_STORE   : v_etype_r = `RV_EXCPN_MISALIGNED_STORE;
    `MCAUSE_FAULT_STORE        : v_etype_r = `RV_EXCPN_FAULT_STORE;
    `MCAUSE_ECALL_U            : v_etype_r = `RV_EXCPN_ECALL_U;
    `MCAUSE_ECALL_S            : v_etype_r = `RV_EXCPN_ECALL_S;
    `MCAUSE_ECALL_H            : v_etype_r = `RV_EXCPN_ECALL_H;
    `MCAUSE_ECALL_M            : v_etype_r = `RV_EXCPN_ECALL_M;
    `MCAUSE_PAGE_FAULT_INST    : v_etype_r = `RV_EXCPN_PAGE_FAULT_INST;
    `MCAUSE_PAGE_FAULT_LOAD    : v_etype_r = `RV_EXCPN_PAGE_FAULT_LOAD;
    `MCAUSE_PAGE_FAULT_STORE   : v_etype_r = `RV_EXCPN_PAGE_FAULT_STORE;
    endcase
end

assign exception_type_o = v_etype_r;

endmodule
