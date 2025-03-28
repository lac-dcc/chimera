// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

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
// *File Name: omsp_register_file.v
// 
// *Module Description:
//                       openMSP430 Register files
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 34 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2009-12-29 20:10:34 +0100 (Di, 29 Dez 2009) $
//----------------------------------------------------------------------------
`include "timescale.v"
`include "openMSP430_defines.v"

module  omsp_register_file (

// OUTPUTs
    cpuoff,                       // Turns off the CPU
    gie,                          // General interrupt enable
    oscoff,                       // Turns off LFXT1 clock input
    pc_sw,                        // Program counter software value
    pc_sw_wr,                     // Program counter software write
    reg_dest,                     // Selected register destination content
    reg_src,                      // Selected register source content
    scg1,                         // System clock generator 1. Turns off the SMCLK
    status,                       // R2 Status {V,N,Z,C}

// INPUTs
    alu_stat,                     // ALU Status {V,N,Z,C}
    alu_stat_wr,                  // ALU Status write {V,N,Z,C}
    inst_bw,                      // Decoded Inst: byte width
    inst_dest,                    // Register destination selection
    inst_src,                     // Register source selection
    mclk,                         // Main system clock
    pc,                           // Program counter
    puc,                          // Main system reset
    reg_dest_val,                 // Selected register destination value
    reg_dest_wr,                  // Write selected register destination
    reg_pc_call,                  // Trigger PC update for a CALL instruction
    reg_sp_val,                   // Stack Pointer next value
    reg_sp_wr,                    // Stack Pointer write
    reg_sr_wr,                    // Status register update for RETI instruction
    reg_sr_clr,                   // Status register clear for interrupts
    reg_incr                      // Increment source register
);

// OUTPUTs
//=========
output 	            cpuoff;       // Turns off the CPU
output 	            gie;          // General interrupt enable
output 	            oscoff;       // Turns off LFXT1 clock input
output       [15:0] pc_sw;        // Program counter software value
output              pc_sw_wr;     // Program counter software write
output       [15:0] reg_dest;     // Selected register destination content
output       [15:0] reg_src;      // Selected register source content
output              scg1;         // System clock generator 1. Turns off the SMCLK
output        [3:0] status;       // R2 Status {V,N,Z,C}

// INPUTs
//=========
input         [3:0] alu_stat;     // ALU Status {V,N,Z,C}
input         [3:0] alu_stat_wr;  // ALU Status write {V,N,Z,C}
input               inst_bw;      // Decoded Inst: byte width
input        [15:0] inst_dest;    // Register destination selection
input        [15:0] inst_src;     // Register source selection
input               mclk;         // Main system clock
input        [15:0] pc;           // Program counter
input               puc;          // Main system reset
input        [15:0] reg_dest_val; // Selected register destination value
input               reg_dest_wr;  // Write selected register destination
input               reg_pc_call;  // Trigger PC update for a CALL instruction
input        [15:0] reg_sp_val;   // Stack Pointer next value
input               reg_sp_wr;    // Stack Pointer write
input               reg_sr_wr;    // Status register update for RETI instruction
input               reg_sr_clr;   // Status register clear for interrupts
input               reg_incr;     // Increment source register


//=============================================================================
// 1)  AUTOINCREMENT UNIT
//=============================================================================

wire [15:0] incr_op         = inst_bw ? 16'h0001 : 16'h0002;
wire [15:0] reg_incr_val    = reg_src+incr_op;

wire [15:0] reg_dest_val_in = inst_bw ? {8'h00,reg_dest_val[7:0]} : reg_dest_val;


//=============================================================================
// 2)  SPECIAL REGISTERS (R1/R2/R3)
//=============================================================================

// Source input selection mask (for interrupt support)
//-----------------------------------------------------

wire [15:0] inst_src_in = reg_sr_clr ? 16'h0004 : inst_src;


// R0: Program counter
//---------------------

wire [15:0] r0       = pc;

wire [15:0] pc_sw    = reg_dest_val_in;
wire        pc_sw_wr = (inst_dest[0] & reg_dest_wr) | reg_pc_call;


// R1: Stack pointer
//-------------------
reg [15:0] r1;
wire       r1_wr  = inst_dest[1] & reg_dest_wr;
wire       r1_inc = inst_src_in[1]  & reg_incr;

always @(posedge mclk or posedge puc)
  if (puc)            r1 <= 16'h0000;
  else if (r1_wr)     r1 <= reg_dest_val_in & 16'hfffe;
  else if (reg_sp_wr) r1 <= reg_sp_val      & 16'hfffe;
  else if (r1_inc)    r1 <= reg_incr_val    & 16'hfffe;


// R2: Status register
//---------------------
reg  [15:0] r2;
wire        r2_wr  = (inst_dest[2] & reg_dest_wr) | reg_sr_wr;

wire        r2_c   = alu_stat_wr[0] ? alu_stat[0]       :
                     r2_wr          ? reg_dest_val_in[0]   : r2[0]; // C

wire        r2_z   = alu_stat_wr[1] ? alu_stat[1]       :
                     r2_wr          ? reg_dest_val_in[1]   : r2[1]; // Z

wire        r2_n   = alu_stat_wr[2] ? alu_stat[2]       :
                     r2_wr          ? reg_dest_val_in[2]   : r2[2]; // N

wire  [7:3] r2_nxt = r2_wr          ? reg_dest_val_in[7:3] : r2[7:3];

wire        r2_v   = alu_stat_wr[3] ? alu_stat[3]       :
                     r2_wr          ? reg_dest_val_in[8]   : r2[8]; // V


always @(posedge mclk or posedge puc)
  if (puc)             r2 <= 16'h0000;
  else if (reg_sr_clr) r2 <= 16'h0000;
  else                 r2 <= {7'h00, r2_v, r2_nxt, r2_n, r2_z, r2_c};

assign status = {r2[8], r2[2:0]};
assign gie    =  r2[3];
assign cpuoff =  r2[4] | (r2_nxt[4] & r2_wr);
assign oscoff =  r2[5];
assign scg1   =  r2[7];


// R3: Constant generator
//------------------------
reg [15:0] r3;
wire       r3_wr  = inst_dest[3] & reg_dest_wr;
wire       r3_inc = inst_src_in[3]  & reg_incr;

always @(posedge mclk or posedge puc)
  if (puc)         r3 <= 16'h0000;
  else if (r3_wr)  r3 <= reg_dest_val_in;
  else if (r3_inc) r3 <= reg_incr_val;


//=============================================================================
// 4)  GENERAL PURPOSE REGISTERS (R4...R15)
//=============================================================================

// R4
reg [15:0] r4;
wire       r4_wr  = inst_dest[4] & reg_dest_wr;
wire       r4_inc = inst_src_in[4]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r4  <= 16'h0000;
  else if (r4_wr)   r4  <= reg_dest_val_in;
  else if (r4_inc)  r4  <= reg_incr_val;

// R5
reg [15:0] r5;
wire       r5_wr  = inst_dest[5] & reg_dest_wr;
wire       r5_inc = inst_src_in[5]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r5  <= 16'h0000;
  else if (r5_wr)   r5  <= reg_dest_val_in;
  else if (r5_inc)  r5  <= reg_incr_val;

// R6
reg [15:0] r6;
wire       r6_wr  = inst_dest[6] & reg_dest_wr;
wire       r6_inc = inst_src_in[6]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r6  <= 16'h0000;
  else if (r6_wr)   r6  <= reg_dest_val_in;
  else if (r6_inc)  r6  <= reg_incr_val;

// R7
reg [15:0] r7;
wire       r7_wr  = inst_dest[7] & reg_dest_wr;
wire       r7_inc = inst_src_in[7]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r7  <= 16'h0000;
  else if (r7_wr)   r7  <= reg_dest_val_in;
  else if (r7_inc)  r7  <= reg_incr_val;

// R8
reg [15:0] r8;
wire       r8_wr  = inst_dest[8] & reg_dest_wr;
wire       r8_inc = inst_src_in[8]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r8  <= 16'h0000;
  else if (r8_wr)   r8  <= reg_dest_val_in;
  else if (r8_inc)  r8  <= reg_incr_val;

// R9
reg [15:0] r9;
wire       r9_wr  = inst_dest[9] & reg_dest_wr;
wire       r9_inc = inst_src_in[9]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r9  <= 16'h0000;
  else if (r9_wr)   r9  <= reg_dest_val_in;
  else if (r9_inc)  r9  <= reg_incr_val;

// R10
reg [15:0] r10;
wire       r10_wr  = inst_dest[10] & reg_dest_wr;
wire       r10_inc = inst_src_in[10]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r10 <= 16'h0000;
  else if (r10_wr)  r10 <= reg_dest_val_in;
  else if (r10_inc) r10 <= reg_incr_val;

// R11
reg [15:0] r11;
wire       r11_wr  = inst_dest[11] & reg_dest_wr;
wire       r11_inc = inst_src_in[11]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r11 <= 16'h0000;
  else if (r11_wr)  r11 <= reg_dest_val_in;
  else if (r11_inc) r11 <= reg_incr_val;

// R12
reg [15:0] r12;
wire       r12_wr  = inst_dest[12] & reg_dest_wr;
wire       r12_inc = inst_src_in[12]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r12 <= 16'h0000;
  else if (r12_wr)  r12 <= reg_dest_val_in;
  else if (r12_inc) r12 <= reg_incr_val;

// R13
reg [15:0] r13;
wire       r13_wr  = inst_dest[13] & reg_dest_wr;
wire       r13_inc = inst_src_in[13]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r13 <= 16'h0000;
  else if (r13_wr)  r13 <= reg_dest_val_in;
  else if (r13_inc) r13 <= reg_incr_val;

// R14
reg [15:0] r14;
wire       r14_wr  = inst_dest[14] & reg_dest_wr;
wire       r14_inc = inst_src_in[14]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r14 <= 16'h0000;
  else if (r14_wr)  r14 <= reg_dest_val_in;
  else if (r14_inc) r14 <= reg_incr_val;

// R15
reg [15:0] r15;
wire       r15_wr  = inst_dest[15] & reg_dest_wr;
wire       r15_inc = inst_src_in[15]  & reg_incr;
always @(posedge mclk or posedge puc)
  if (puc)          r15 <= 16'h0000;
  else if (r15_wr)  r15 <= reg_dest_val_in;
  else if (r15_inc) r15 <= reg_incr_val;


//=============================================================================
// 5)  READ MUX
//=============================================================================

assign reg_src  = (r0      & {16{inst_src_in[0]}})   | 
                  (r1      & {16{inst_src_in[1]}})   | 
                  (r2      & {16{inst_src_in[2]}})   | 
                  (r3      & {16{inst_src_in[3]}})   | 
                  (r4      & {16{inst_src_in[4]}})   | 
                  (r5      & {16{inst_src_in[5]}})   | 
                  (r6      & {16{inst_src_in[6]}})   | 
                  (r7      & {16{inst_src_in[7]}})   | 
                  (r8      & {16{inst_src_in[8]}})   | 
                  (r9      & {16{inst_src_in[9]}})   | 
                  (r10     & {16{inst_src_in[10]}})  | 
                  (r11     & {16{inst_src_in[11]}})  | 
                  (r12     & {16{inst_src_in[12]}})  | 
                  (r13     & {16{inst_src_in[13]}})  | 
                  (r14     & {16{inst_src_in[14]}})  | 
                  (r15     & {16{inst_src_in[15]}});

assign reg_dest = (r0      & {16{inst_dest[0]}})  | 
                  (r1      & {16{inst_dest[1]}})  | 
                  (r2      & {16{inst_dest[2]}})  | 
                  (r3      & {16{inst_dest[3]}})  | 
                  (r4      & {16{inst_dest[4]}})  | 
                  (r5      & {16{inst_dest[5]}})  | 
                  (r6      & {16{inst_dest[6]}})  | 
                  (r7      & {16{inst_dest[7]}})  | 
                  (r8      & {16{inst_dest[8]}})  | 
                  (r9      & {16{inst_dest[9]}})  | 
                  (r10     & {16{inst_dest[10]}}) | 
                  (r11     & {16{inst_dest[11]}}) | 
                  (r12     & {16{inst_dest[12]}}) | 
                  (r13     & {16{inst_dest[13]}}) | 
                  (r14     & {16{inst_dest[14]}}) | 
                  (r15     & {16{inst_dest[15]}});


endmodule // omsp_register_file

`include "openMSP430_undefines.v"
