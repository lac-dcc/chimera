// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// define file
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>


`define NOP 32'h13
`define RST_PC 32'h80000000
// `define HAS_AXI_BUS
// `define HAS_AXI_BUS_ARBITER
// `define HAS_ICACHE
// `define HAS_DCACHE
// `define ICACHE_LINE_MULIT_SRAM
// `define DCACHE_LINE_MULIT_SRAM
// `define SIM
// `define DPI_C
// `define ADD_USE_ADD_BASE
// `define use_booth_mul
`define PRV_M   2'h3
`define PRV_S   2'h1
`define PRV_U   2'h0

`define CSR_ADDR_MISA               12'h301
`define CSR_ADDR_MVENDORID          12'hF11
`define CSR_ADDR_MARCHID            12'hF12
`define CSR_ADDR_MIMPID             12'hF13
`define CSR_ADDR_MHARTID            12'hF14
`define CSR_ADDR_MSTATUS            12'h300
`define CSR_ADDR_MTVEC              12'h305
`define CSR_ADDR_MEDELEG            12'h302
`define CSR_ADDR_MIDELEG            12'h303
`define CSR_ADDR_MIP                12'h344
`define CSR_ADDR_MIE                12'h304
`define CSR_ADDR_MCYCLE             12'hB00
`define CSR_ADDR_MINSTRET           12'hB02
`define CSR_ADDR_MHPMCOUNTER3       12'hB03
`define CSR_ADDR_MHPMCOUNTER4       12'hB04
`define CSR_ADDR_MHPMCOUNTER5       12'hB05
`define CSR_ADDR_MHPMCOUNTER6       12'hB06
`define CSR_ADDR_MHPMCOUNTER7       12'hB07
`define CSR_ADDR_MHPMCOUNTER8       12'hB08
`define CSR_ADDR_MHPMCOUNTER9       12'hB09
`define CSR_ADDR_MHPMCOUNTER10      12'hB0A
`define CSR_ADDR_MHPMCOUNTER11      12'hB0B
`define CSR_ADDR_MHPMCOUNTER12      12'hB0C
`define CSR_ADDR_MHPMCOUNTER13      12'hB0D
`define CSR_ADDR_MHPMCOUNTER14      12'hB0E
`define CSR_ADDR_MHPMCOUNTER15      12'hB0F
`define CSR_ADDR_MHPMCOUNTER16      12'hB10
`define CSR_ADDR_MHPMCOUNTER17      12'hB11
`define CSR_ADDR_MHPMCOUNTER18      12'hB12
`define CSR_ADDR_MHPMCOUNTER19      12'hB13
`define CSR_ADDR_MHPMCOUNTER20      12'hB14
`define CSR_ADDR_MHPMCOUNTER21      12'hB15
`define CSR_ADDR_MHPMCOUNTER22      12'hB16
`define CSR_ADDR_MHPMCOUNTER23      12'hB17
`define CSR_ADDR_MHPMCOUNTER24      12'hB18
`define CSR_ADDR_MHPMCOUNTER25      12'hB19
`define CSR_ADDR_MHPMCOUNTER26      12'hB1A
`define CSR_ADDR_MHPMCOUNTER27      12'hB1B
`define CSR_ADDR_MHPMCOUNTER28      12'hB1C
`define CSR_ADDR_MHPMCOUNTER29      12'hB1D
`define CSR_ADDR_MHPMCOUNTER30      12'hB1E
`define CSR_ADDR_MHPMCOUNTER31      12'hB1F
`define CSR_ADDR_MHPMENVENT3        12'h323
`define CSR_ADDR_MHPMENVENT4        12'h324
`define CSR_ADDR_MHPMENVENT5        12'h325
`define CSR_ADDR_MHPMENVENT6        12'h326
`define CSR_ADDR_MHPMENVENT7        12'h327
`define CSR_ADDR_MHPMENVENT8        12'h328
`define CSR_ADDR_MHPMENVENT9        12'h329
`define CSR_ADDR_MHPMENVENT10       12'h32A
`define CSR_ADDR_MHPMENVENT11       12'h32B
`define CSR_ADDR_MHPMENVENT12       12'h32C
`define CSR_ADDR_MHPMENVENT13       12'h32D
`define CSR_ADDR_MHPMENVENT14       12'h32E
`define CSR_ADDR_MHPMENVENT15       12'h32F
`define CSR_ADDR_MHPMENVENT16       12'h330
`define CSR_ADDR_MHPMENVENT17       12'h331
`define CSR_ADDR_MHPMENVENT18       12'h332
`define CSR_ADDR_MHPMENVENT19       12'h333
`define CSR_ADDR_MHPMENVENT20       12'h334
`define CSR_ADDR_MHPMENVENT21       12'h335
`define CSR_ADDR_MHPMENVENT22       12'h336
`define CSR_ADDR_MHPMENVENT23       12'h337
`define CSR_ADDR_MHPMENVENT24       12'h338
`define CSR_ADDR_MHPMENVENT25       12'h339
`define CSR_ADDR_MHPMENVENT26       12'h33A
`define CSR_ADDR_MHPMENVENT27       12'h33B
`define CSR_ADDR_MHPMENVENT28       12'h33C
`define CSR_ADDR_MHPMENVENT29       12'h33D
`define CSR_ADDR_MHPMENVENT30       12'h33E
`define CSR_ADDR_MHPMENVENT31       12'h33F
`define CSR_ADDR_MCOUNTEREN         12'h306
`define CSR_ADDR_MCOUNTINHIBIT      12'h320
`define CSR_ADDR_MSCRATCH           12'h340
`define CSR_ADDR_MEPC               12'h341
`define CSR_ADDR_MCAUSE             12'h342
`define CSR_ADDR_MTVAL              12'h343
`define CSR_ADDR_MCONFIGPTR         12'hF15
`define CSR_ADDR_MENVCFG            12'h30A
`define CSR_ADDR_MSECCFG            12'h747
`define CSR_ADDR_SSTATUS            12'h100
`define CSR_ADDR_STVEC              12'h105
`define CSR_ADDR_SIP                12'h144
`define CSR_ADDR_SIE                12'h104
`define CSR_ADDR_SCOUNTEREN         12'h106
`define CSR_ADDR_SSCRATCH           12'h140
`define CSR_ADDR_SEPC               12'h141
`define CSR_ADDR_SCAUSE             12'h142
`define CSR_ADDR_STVAL              12'h143
`define CSR_ADDR_SENVCFG            12'h10A
`define CSR_ADDR_SATP               12'h180
`define CSR_ADDR_CYCLE              12'hC00
//! CSR_ADDR_TIME
`define CSR_ADDR_INSTRET            12'hC02
`define CSR_ADDR_HPMCOUNTER3        12'hC03
`define CSR_ADDR_HPMCOUNTER4        12'hC04
`define CSR_ADDR_HPMCOUNTER5        12'hC05
`define CSR_ADDR_HPMCOUNTER6        12'hC06
`define CSR_ADDR_HPMCOUNTER7        12'hC07
`define CSR_ADDR_HPMCOUNTER8        12'hC08
`define CSR_ADDR_HPMCOUNTER9        12'hC09
`define CSR_ADDR_HPMCOUNTER10       12'hC0A
`define CSR_ADDR_HPMCOUNTER11       12'hC0B
`define CSR_ADDR_HPMCOUNTER12       12'hC0C
`define CSR_ADDR_HPMCOUNTER13       12'hC0D
`define CSR_ADDR_HPMCOUNTER14       12'hC0E
`define CSR_ADDR_HPMCOUNTER15       12'hC0F
`define CSR_ADDR_HPMCOUNTER16       12'hC10  
`define CSR_ADDR_HPMCOUNTER17       12'hC11
`define CSR_ADDR_HPMCOUNTER18       12'hC12
`define CSR_ADDR_HPMCOUNTER19       12'hC13
`define CSR_ADDR_HPMCOUNTER20       12'hC14
`define CSR_ADDR_HPMCOUNTER21       12'hC15
`define CSR_ADDR_HPMCOUNTER22       12'hC16
`define CSR_ADDR_HPMCOUNTER23       12'hC17
`define CSR_ADDR_HPMCOUNTER24       12'hC18
`define CSR_ADDR_HPMCOUNTER25       12'hC19
`define CSR_ADDR_HPMCOUNTER26       12'hC1A
`define CSR_ADDR_HPMCOUNTER27       12'hC1B
`define CSR_ADDR_HPMCOUNTER28       12'hC1C
`define CSR_ADDR_HPMCOUNTER29       12'hC1D
`define CSR_ADDR_HPMCOUNTER30       12'hC1E
`define CSR_ADDR_HPMCOUNTER31       12'hC1F

