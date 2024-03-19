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
//--------------------------------------------------------------------
// ALU Operations
//--------------------------------------------------------------------

`define RV_ALU_NONE                                4'b0000
`define RV_ALU_SHIFTL                              4'b0001
`define RV_ALU_SHIFTR                              4'b0010
`define RV_ALU_SHIFTR_ARITH                        4'b0011
`define RV_ALU_ADD                                 4'b0100
`define RV_ALU_SUB                                 4'b0110
`define RV_ALU_AND                                 4'b0111
`define RV_ALU_OR                                  4'b1000
`define RV_ALU_XOR                                 4'b1001
`define RV_ALU_LESS_THAN                           4'b1010
`define RV_ALU_LESS_THAN_SIGNED                    4'b1011

//-----------------------------------------------------------------
// Privilege levels
//-----------------------------------------------------------------
`define PRIV_USER                       0
`define PRIV_SUPER                      1
`define PRIV_MACHINE                    3

//-----------------------------------------------------------------
// Status Register
//-----------------------------------------------------------------
`define SR_UIE         (1 << 0)
`define SR_UIE_R       0
`define SR_SIE         (1 << 1)
`define SR_SIE_R       1
`define SR_MIE         (1 << 3)
`define SR_MIE_R       3
`define SR_UPIE        (1 << 4)
`define SR_UPIE_R      4
`define SR_SPIE        (1 << 5)
`define SR_SPIE_R      5
`define SR_MPIE        (1 << 7)
`define SR_MPIE_R      7
`define SR_SPP         (1 << 8)
`define SR_SPP_R       8

`define SR_MPP_SHIFT   11
`define SR_MPP_MASK    2'h3
`define SR_MPP_R       12:11
`define SR_MPP_U       `PRIV_USER
`define SR_MPP_S       `PRIV_SUPER
`define SR_MPP_M       `PRIV_MACHINE

`define SR_SUM          (1 << 18)
`define SR_SUM_R        18

//-----------------------------------------------------------------
// IRQ Numbers
//-----------------------------------------------------------------
`define IRQ_S_SOFT   1
`define IRQ_M_SOFT   3
`define IRQ_S_TIMER  5
`define IRQ_M_TIMER  7
`define IRQ_S_EXT    9
`define IRQ_M_EXT    11
`define IRQ_MIN      (`IRQ_S_SOFT)
`define IRQ_MAX      (`IRQ_M_EXT + 1)
`define IRQ_MASK     ((1 << `IRQ_M_EXT)   |                       (1 << `IRQ_M_TIMER) |                       (1 << `IRQ_M_SOFT))

`define SR_IP_MSIP_R      `IRQ_M_SOFT
`define SR_IP_MTIP_R      `IRQ_M_TIMER
`define SR_IP_MEIP_R      `IRQ_M_EXT
`define SR_IP_SSIP_R      `IRQ_S_SOFT
`define SR_IP_STIP_R      `IRQ_S_TIMER
`define SR_IP_SEIP_R      `IRQ_S_EXT

//-----------------------------------------------------------------
// CSR Registers - Machine
//-----------------------------------------------------------------
`define CSR_MSTATUS       12'h300
`define CSR_MSTATUS_MASK  32'hFFFFFFFF
`define CSR_MISA          12'h301
`define CSR_MISA_MASK     32'hFFFFFFFF
    `define MISA_RV32     32'h40000000
    `define MISA_RVI      32'h00000100
    `define MISA_RVE      32'h00000010
    `define MISA_RVM      32'h00001000
    `define MISA_RVA      32'h00000001
    `define MISA_RVF      32'h00000020
    `define MISA_RVD      32'h00000008
    `define MISA_RVC      32'h00000004
    `define MISA_RVS      32'h00040000
    `define MISA_RVU      32'h00100000
`define CSR_MEDELEG       12'h302
`define CSR_MEDELEG_MASK  32'h0000FFFF
`define CSR_MIDELEG       12'h303
`define CSR_MIDELEG_MASK  32'h0000FFFF
`define CSR_MIE           12'h304
`define CSR_MIE_MASK      `IRQ_MASK
`define CSR_MTVEC         12'h305
`define CSR_MTVEC_MASK    32'hFFFFFFFF
`define CSR_MSCRATCH      12'h340
`define CSR_MSCRATCH_MASK 32'hFFFFFFFF
`define CSR_MEPC          12'h341
`define CSR_MEPC_MASK     32'hFFFFFFFF
`define CSR_MCAUSE        12'h342
`define CSR_MCAUSE_MASK   32'h8000000F
`define CSR_MTVAL         12'h343
`define CSR_MTVAL_MASK    32'hFFFFFFFF
`define CSR_MIP           12'h344
`define CSR_MIP_MASK      `IRQ_MASK
`define CSR_MCYCLE        12'hc00
`define CSR_MCYCLE_MASK   32'hFFFFFFFF
`define CSR_MTIME         12'hc01
`define CSR_MTIME_MASK    32'hFFFFFFFF
`define CSR_MTIMEH        12'hc81
`define CSR_MTIMEH_MASK   32'hFFFFFFFF
`define CSR_MHARTID       12'hF14
`define CSR_MHARTID_MASK  32'hFFFFFFFF

// Non-std
`define CSR_MTIMECMP        12'h7c0
`define CSR_MTIMECMP_MASK   32'hFFFFFFFF

//-----------------------------------------------------------------
// CSR Registers - Simulation control
//-----------------------------------------------------------------
`define CSR_DSCRATCH       12'h7b2
`define CSR_DSCRATCH_MASK  32'hFFFFFFFF
`define CSR_SIM_CTRL       12'h8b2
`define CSR_SIM_CTRL_MASK  32'hFFFFFFFF
    `define CSR_SIM_CTRL_EXIT (0 << 24)
    `define CSR_SIM_CTRL_PUTC (1 << 24)

//-----------------------------------------------------------------
// Exception Causes
//-----------------------------------------------------------------
`define MCAUSE_INT                      31
`define MCAUSE_MISALIGNED_FETCH         ((0 << `MCAUSE_INT) | 0)
`define MCAUSE_FAULT_FETCH              ((0 << `MCAUSE_INT) | 1)
`define MCAUSE_ILLEGAL_INSTRUCTION      ((0 << `MCAUSE_INT) | 2)
`define MCAUSE_BREAKPOINT               ((0 << `MCAUSE_INT) | 3)
`define MCAUSE_MISALIGNED_LOAD          ((0 << `MCAUSE_INT) | 4)
`define MCAUSE_FAULT_LOAD               ((0 << `MCAUSE_INT) | 5)
`define MCAUSE_MISALIGNED_STORE         ((0 << `MCAUSE_INT) | 6)
`define MCAUSE_FAULT_STORE              ((0 << `MCAUSE_INT) | 7)
`define MCAUSE_ECALL_U                  ((0 << `MCAUSE_INT) | 8)
`define MCAUSE_ECALL_S                  ((0 << `MCAUSE_INT) | 9)
`define MCAUSE_ECALL_H                  ((0 << `MCAUSE_INT) | 10)
`define MCAUSE_ECALL_M                  ((0 << `MCAUSE_INT) | 11)
`define MCAUSE_PAGE_FAULT_INST          ((0 << `MCAUSE_INT) | 12)
`define MCAUSE_PAGE_FAULT_LOAD          ((0 << `MCAUSE_INT) | 13)
`define MCAUSE_PAGE_FAULT_STORE         ((0 << `MCAUSE_INT) | 15)
`define MCAUSE_INTERRUPT                (1 << `MCAUSE_INT)

//-----------------------------------------------------------------
// Debug defines for exception types
//-----------------------------------------------------------------
`define RV_EXCPN_W                        6
`define RV_EXCPN_MISALIGNED_FETCH         6'h10
`define RV_EXCPN_FAULT_FETCH              6'h11
`define RV_EXCPN_ILLEGAL_INSTRUCTION      6'h12
`define RV_EXCPN_BREAKPOINT               6'h13
`define RV_EXCPN_MISALIGNED_LOAD          6'h14
`define RV_EXCPN_FAULT_LOAD               6'h15
`define RV_EXCPN_MISALIGNED_STORE         6'h16
`define RV_EXCPN_FAULT_STORE              6'h17
`define RV_EXCPN_ECALL                    6'h18
`define RV_EXCPN_ECALL_U                  6'h18
`define RV_EXCPN_ECALL_S                  6'h19
`define RV_EXCPN_ECALL_H                  6'h1a
`define RV_EXCPN_ECALL_M                  6'h1b
`define RV_EXCPN_PAGE_FAULT_INST          6'h1c
`define RV_EXCPN_PAGE_FAULT_LOAD          6'h1d
`define RV_EXCPN_PAGE_FAULT_STORE         6'h1f
`define RV_EXCPN_EXCEPTION                6'h10
`define RV_EXCPN_INTERRUPT                6'h20
`define RV_EXCPN_ERET                     6'h30
`define RV_EXCPN_FENCE                    6'h31
`define RV_EXCPN_TYPE_MASK                6'h30
`define RV_EXCPN_SUBTYPE_R                3:0
