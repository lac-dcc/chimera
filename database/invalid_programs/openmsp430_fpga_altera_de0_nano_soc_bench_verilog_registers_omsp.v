//----------------------------------------------------------------------------
// Copyright (C) 2001 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: registers.v
//
// *Module Description:
//                      Direct connections to internal registers & memory.
//
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 143 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2012-05-09 22:20:03 +0200 (Wed, 09 May 2012) $
//----------------------------------------------------------------------------

// CPU registers
//======================

wire       [15:0] omsp_r0     = dut.openmsp430_0.execution_unit_0.register_file_0.r0;
wire       [15:0] omsp_r1     = dut.openmsp430_0.execution_unit_0.register_file_0.r1;
wire       [15:0] omsp_r2     = dut.openmsp430_0.execution_unit_0.register_file_0.r2;
wire       [15:0] omsp_r3     = dut.openmsp430_0.execution_unit_0.register_file_0.r3;
wire       [15:0] omsp_r4     = dut.openmsp430_0.execution_unit_0.register_file_0.r4;
wire       [15:0] omsp_r5     = dut.openmsp430_0.execution_unit_0.register_file_0.r5;
wire       [15:0] omsp_r6     = dut.openmsp430_0.execution_unit_0.register_file_0.r6;
wire       [15:0] omsp_r7     = dut.openmsp430_0.execution_unit_0.register_file_0.r7;
wire       [15:0] omsp_r8     = dut.openmsp430_0.execution_unit_0.register_file_0.r8;
wire       [15:0] omsp_r9     = dut.openmsp430_0.execution_unit_0.register_file_0.r9;
wire       [15:0] omsp_r10    = dut.openmsp430_0.execution_unit_0.register_file_0.r10;
wire       [15:0] omsp_r11    = dut.openmsp430_0.execution_unit_0.register_file_0.r11;
wire       [15:0] omsp_r12    = dut.openmsp430_0.execution_unit_0.register_file_0.r12;
wire       [15:0] omsp_r13    = dut.openmsp430_0.execution_unit_0.register_file_0.r13;
wire       [15:0] omsp_r14    = dut.openmsp430_0.execution_unit_0.register_file_0.r14;
wire       [15:0] omsp_r15    = dut.openmsp430_0.execution_unit_0.register_file_0.r15;


// Data Memory cells
//======================

wire       [15:0] omsp_mem200 = dut.pmem_0.altsyncram_component.mem_data[0];
wire       [15:0] omsp_mem202 = dut.pmem_0.altsyncram_component.mem_data[1];
wire       [15:0] omsp_mem204 = dut.pmem_0.altsyncram_component.mem_data[2];
wire       [15:0] omsp_mem206 = dut.pmem_0.altsyncram_component.mem_data[3];
wire       [15:0] omsp_mem208 = dut.pmem_0.altsyncram_component.mem_data[4];
wire       [15:0] omsp_mem20A = dut.pmem_0.altsyncram_component.mem_data[5];
wire       [15:0] omsp_mem20C = dut.pmem_0.altsyncram_component.mem_data[6];
wire       [15:0] omsp_mem20E = dut.pmem_0.altsyncram_component.mem_data[7];
wire       [15:0] omsp_mem210 = dut.pmem_0.altsyncram_component.mem_data[8];
wire       [15:0] omsp_mem212 = dut.pmem_0.altsyncram_component.mem_data[9];
wire       [15:0] omsp_mem214 = dut.pmem_0.altsyncram_component.mem_data[10];
wire       [15:0] omsp_mem216 = dut.pmem_0.altsyncram_component.mem_data[11];
wire       [15:0] omsp_mem218 = dut.pmem_0.altsyncram_component.mem_data[12];
wire       [15:0] omsp_mem21A = dut.pmem_0.altsyncram_component.mem_data[13];
wire       [15:0] omsp_mem21C = dut.pmem_0.altsyncram_component.mem_data[14];
wire       [15:0] omsp_mem21E = dut.pmem_0.altsyncram_component.mem_data[15];
wire       [15:0] omsp_mem220 = dut.pmem_0.altsyncram_component.mem_data[16];
wire       [15:0] omsp_mem222 = dut.pmem_0.altsyncram_component.mem_data[17];
wire       [15:0] omsp_mem224 = dut.pmem_0.altsyncram_component.mem_data[18];
wire       [15:0] omsp_mem226 = dut.pmem_0.altsyncram_component.mem_data[19];
wire       [15:0] omsp_mem228 = dut.pmem_0.altsyncram_component.mem_data[20];
wire       [15:0] omsp_mem22A = dut.pmem_0.altsyncram_component.mem_data[21];
wire       [15:0] omsp_mem22C = dut.pmem_0.altsyncram_component.mem_data[22];
wire       [15:0] omsp_mem22E = dut.pmem_0.altsyncram_component.mem_data[23];
wire       [15:0] omsp_mem230 = dut.pmem_0.altsyncram_component.mem_data[24];
wire       [15:0] omsp_mem232 = dut.pmem_0.altsyncram_component.mem_data[25];
wire       [15:0] omsp_mem234 = dut.pmem_0.altsyncram_component.mem_data[26];
wire       [15:0] omsp_mem236 = dut.pmem_0.altsyncram_component.mem_data[27];
wire       [15:0] omsp_mem238 = dut.pmem_0.altsyncram_component.mem_data[28];
wire       [15:0] omsp_mem23A = dut.pmem_0.altsyncram_component.mem_data[29];
wire       [15:0] omsp_mem23C = dut.pmem_0.altsyncram_component.mem_data[30];
wire       [15:0] omsp_mem23E = dut.pmem_0.altsyncram_component.mem_data[31];
wire       [15:0] omsp_mem240 = dut.pmem_0.altsyncram_component.mem_data[32];
wire       [15:0] omsp_mem242 = dut.pmem_0.altsyncram_component.mem_data[33];
wire       [15:0] omsp_mem244 = dut.pmem_0.altsyncram_component.mem_data[34];
wire       [15:0] omsp_mem246 = dut.pmem_0.altsyncram_component.mem_data[35];
wire       [15:0] omsp_mem248 = dut.pmem_0.altsyncram_component.mem_data[36];
wire       [15:0] omsp_mem24A = dut.pmem_0.altsyncram_component.mem_data[37];
wire       [15:0] omsp_mem24C = dut.pmem_0.altsyncram_component.mem_data[38];
wire       [15:0] omsp_mem24E = dut.pmem_0.altsyncram_component.mem_data[39];
wire       [15:0] omsp_mem250 = dut.pmem_0.altsyncram_component.mem_data[40];
wire       [15:0] omsp_mem252 = dut.pmem_0.altsyncram_component.mem_data[41];
wire       [15:0] omsp_mem254 = dut.pmem_0.altsyncram_component.mem_data[42];
wire       [15:0] omsp_mem256 = dut.pmem_0.altsyncram_component.mem_data[43];
wire       [15:0] omsp_mem258 = dut.pmem_0.altsyncram_component.mem_data[44];
wire       [15:0] omsp_mem25A = dut.pmem_0.altsyncram_component.mem_data[45];
wire       [15:0] omsp_mem25C = dut.pmem_0.altsyncram_component.mem_data[46];
wire       [15:0] omsp_mem25E = dut.pmem_0.altsyncram_component.mem_data[47];
wire       [15:0] omsp_mem260 = dut.pmem_0.altsyncram_component.mem_data[48];
wire       [15:0] omsp_mem262 = dut.pmem_0.altsyncram_component.mem_data[49];
wire       [15:0] omsp_mem264 = dut.pmem_0.altsyncram_component.mem_data[50];
wire       [15:0] omsp_mem266 = dut.pmem_0.altsyncram_component.mem_data[51];
wire       [15:0] omsp_mem268 = dut.pmem_0.altsyncram_component.mem_data[52];
wire       [15:0] omsp_mem26A = dut.pmem_0.altsyncram_component.mem_data[53];
wire       [15:0] omsp_mem26C = dut.pmem_0.altsyncram_component.mem_data[54];
wire       [15:0] omsp_mem26E = dut.pmem_0.altsyncram_component.mem_data[55];
wire       [15:0] omsp_mem270 = dut.pmem_0.altsyncram_component.mem_data[56];
wire       [15:0] omsp_mem272 = dut.pmem_0.altsyncram_component.mem_data[57];
wire       [15:0] omsp_mem274 = dut.pmem_0.altsyncram_component.mem_data[58];
wire       [15:0] omsp_mem276 = dut.pmem_0.altsyncram_component.mem_data[59];
wire       [15:0] omsp_mem278 = dut.pmem_0.altsyncram_component.mem_data[60];
wire       [15:0] omsp_mem27A = dut.pmem_0.altsyncram_component.mem_data[61];
wire       [15:0] omsp_mem27C = dut.pmem_0.altsyncram_component.mem_data[62];
wire       [15:0] omsp_mem27E = dut.pmem_0.altsyncram_component.mem_data[63];
wire       [15:0] omsp_mem280 = dut.pmem_0.altsyncram_component.mem_data[64];


// Program Memory cells
//======================
reg   [15:0] pmem [0:`PMEM_SIZE-1];

// Interrupt vectors
wire  [15:0] irq_vect_15      = pmem[(1<<(`PMEM_MSB+1))-1];  // RESET Vector
wire  [15:0] irq_vect_14      = pmem[(1<<(`PMEM_MSB+1))-2];  // NMI
wire  [15:0] irq_vect_13      = pmem[(1<<(`PMEM_MSB+1))-3];  // IRQ 13
wire  [15:0] irq_vect_12      = pmem[(1<<(`PMEM_MSB+1))-4];  // IRQ 12
wire  [15:0] irq_vect_11      = pmem[(1<<(`PMEM_MSB+1))-5];  // IRQ 11
wire  [15:0] irq_vect_10      = pmem[(1<<(`PMEM_MSB+1))-6];  // IRQ 10
wire  [15:0] irq_vect_09      = pmem[(1<<(`PMEM_MSB+1))-7];  // IRQ  9
wire  [15:0] irq_vect_08      = pmem[(1<<(`PMEM_MSB+1))-8];  // IRQ  8
wire  [15:0] irq_vect_07      = pmem[(1<<(`PMEM_MSB+1))-9];  // IRQ  7
wire  [15:0] irq_vect_06      = pmem[(1<<(`PMEM_MSB+1))-10]; // IRQ  6
wire  [15:0] irq_vect_05      = pmem[(1<<(`PMEM_MSB+1))-11]; // IRQ  5
wire  [15:0] irq_vect_04      = pmem[(1<<(`PMEM_MSB+1))-12]; // IRQ  4
wire  [15:0] irq_vect_03      = pmem[(1<<(`PMEM_MSB+1))-13]; // IRQ  3
wire  [15:0] irq_vect_02      = pmem[(1<<(`PMEM_MSB+1))-14]; // IRQ  2
wire  [15:0] irq_vect_01      = pmem[(1<<(`PMEM_MSB+1))-15]; // IRQ  1
wire  [15:0] irq_vect_00      = pmem[(1<<(`PMEM_MSB+1))-16]; // IRQ  0

// Interrupt detection
wire         omsp_nmi_detect  = dut.openmsp430_0.frontend_0.nmi_pnd;
wire         omsp_irq_detect  = dut.openmsp430_0.frontend_0.irq_detect;

// Debug interface
wire         omsp_dbg_en      = dut.openmsp430_0.dbg_en;
wire         omsp_dbg_clk     = dut.openmsp430_0.clock_module_0.dbg_clk;
wire         omsp_dbg_rst     = dut.openmsp430_0.clock_module_0.dbg_rst;


// CPU internals
//======================

wire         omsp_mclk        = dut.openmsp430_0.mclk;
wire         omsp_puc_rst     = dut.openmsp430_0.puc_rst;
