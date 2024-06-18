// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ram18t_var_w_var_r
 * @file ram18t_var_w_var_r.v
 * @date 2015-05-29  
 * @author Andrey Filippov     
 *
 * @brief Dual port memory wrapper, with variable width write and variable
 * width read,  using "TDP" mode of RAMB36E1. Same R/W widths in each port.
 * Does not use parity bits to increase total data width, width down to 1 are valid.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * ram18t_var_w_var_r.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ram18t_var_w_var_r.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps
`include "system_defines.vh" 
/*
   Address/data widths
   Connect unused data to 1b0, unused addresses - to 1'b1
   
   RAMB18E1 in True Dual Port (TDP) Mode - each port individually
   +-----------+---------+---------+---------+
   |Data Width | Address |   Data  | Parity  |
   +-----------+---------+---------+---------+
   |     1     | A[13:0] | D[0]    |  ---    |
   |     2     | A[13:1] | D[1:0]  |  ---    |
   |     4     | A[13:2] | D[3:0[  |  ---    |
   |     9     | A[13:3] | D[7:0]  | DP[0]   |
   |    18     | A[13:4] | D[15:0] | DP[1:0] |
   +-----------+---------+---------+---------+

   RAMB18E1 in Simple Dual Port (SDP) Mode
   one of the ports (r or w) - 32/36 bits, other - variable 
   +------------+---------+---------+---------+
   |Data Widths | Address |   Data  | Parity  |
   +------------+---------+---------+---------+
   |   32/  1   | A[13:0] | D[0]    |  ---    |
   |   32/  2   | A[13:1] | D[1:0]  |  ---    |
   |   32/  4   | A[13:2] | D[3:0[  |  ---    |
   |   36/  9   | A[13:3] | D[7:0]  | DP[0]   |
   |   36/ 18   | A[13:4] | D[15:0] | DP[1:0] |
   |   36/ 36   | A[13:5] | D[31:0] | DP[3:0] |
   +------------+---------+---------+---------+
   
   RAMB36E1 in True Dual Port (TDP) Mode - each port individually
   +-----------+---------+---------+---------+
   |Data Width | Address |   Data  | Parity  |
   +-----------+---------+---------+---------+
   |     1     | A[14:0] | D[0]    |  ---    |
   |     2     | A[14:1] | D[1:0]  |  ---    |
   |     4     | A[14:2] | D[3:0[  |  ---    |
   |     9     | A[14:3] | D[7:0]  | DP[0]   |
   |    18     | A[14:4] | D[15:0] | DP[1:0] |
   |    36     | A[14:5] | D[31:0] | DP[3:0] |
   |1(Cascade) | A[15:0] | D[0]    |  ---    |
   +-----------+---------+---------+---------+

   RAMB36E1 in Simple Dual Port (SDP) Mode
   one of the ports (r or w) - 64/72 bits, other - variable 
   +------------+---------+---------+---------+
   |Data Widths | Address |   Data  | Parity  |
   +------------+---------+---------+---------+
   |   64/  1   | A[14:0] | D[0]    |  ---    |
   |   64/  2   | A[14:1] | D[1:0]  |  ---    |
   |   64/  4   | A[14:2] | D[3:0[  |  ---    |
   |   64/  9   | A[14:3] | D[7:0]  | DP[0]   |
   |   64/ 18   | A[14:4] | D[15:0] | DP[1:0] |
   |   64/ 36   | A[14:5] | D[31:0] | DP[3:0] |
   |   64/ 72   | A[14:6] | D[63:0] | DP[7:0] |
   +------------+---------+---------+---------+
*/

module  ram18t_var_w_var_r
#(
  parameter integer REGISTERS_A = 0, // 1 - registered output
  parameter integer REGISTERS_B = 0, // 1 - registered output
  parameter integer LOG2WIDTH_A = 4,  // WIDTH= 9  << (LOG2WIDTH - 3)
  parameter integer LOG2WIDTH_B = 4,  // WIDTH= 9  << (LOG2WIDTH - 3)
  parameter WRITE_MODE_A =        "NO_CHANGE", //Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
  parameter WRITE_MODE_B =        "NO_CHANGE"  //Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram18_declare_init.vh"
`endif
 )(
      input                               clk_a,     // clock for port A
      input            [13-LOG2WIDTH_A:0] addr_a,    // address port A
      input                               en_a,      // enable port A (read and write)
      input                               regen_a,   // output register enable port A
      input                               we_a,      // write port enable port A
      output     [(1 << LOG2WIDTH_A)-1:0] data_out_a,// data out port A
      input      [(1 << LOG2WIDTH_A)-1:0] data_in_a, // data in port A
      
      input                               clk_b,     // clock for port BA
      input            [13-LOG2WIDTH_B:0] addr_b,    // address port B
      input                               en_b,      // read enable port B
      input                               regen_b,   // output register enable port B
      input                               we_b,      // write port enable port B
      output     [(1 << LOG2WIDTH_B)-1:0] data_out_b,// data out port B
      input      [(1 << LOG2WIDTH_B)-1:0] data_in_b  // data in port B
);
    localparam  PWIDTH_A = (LOG2WIDTH_A > 2)? (9 << (LOG2WIDTH_A - 3)): (1 << LOG2WIDTH_A);
    localparam  PWIDTH_B = (LOG2WIDTH_B > 2)? (9 << (LOG2WIDTH_B - 3)): (1 << LOG2WIDTH_B);
    localparam  WIDTH_A  = 1 << LOG2WIDTH_A;
    localparam  WIDTH_B  = 1 << LOG2WIDTH_B;
    
    wire          [15:0] data_out16_a;
    assign data_out_a=data_out16_a[WIDTH_A-1:0];

    wire          [15:0] data_out16_b;
    assign data_out_b=data_out16_b[WIDTH_B-1:0];


    wire [WIDTH_A+15:0] data_in_ext_a =  {16'b0,data_in_a[WIDTH_A-1:0]};
    wire         [15:0] data_in16_a =    data_in_ext_a[15:0];

    wire [WIDTH_B+15:0] data_in_ext_b =  {16'b0,data_in_b[WIDTH_B-1:0]};
    wire         [15:0] data_in16_b =    data_in_ext_b[15:0];

    RAMB18E1
    #(
    .RSTREG_PRIORITY_A         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .DOA_REG                   (REGISTERS_A),    // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 18)
    .DOB_REG                   (REGISTERS_B),    // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 18)
    .READ_WIDTH_A              (PWIDTH_A),       // Valid: 0,1,2,4,9,18 and in SDP mode - 36 (should be 0 if port is not used)
    .READ_WIDTH_B              (PWIDTH_B),       // Valid: 0,1,2,4,9,18 and in SDP mode - 36 (should be 0 if port is not used)
    .WRITE_WIDTH_A             (PWIDTH_A),       // Valid: 0,1,2,4,9,18 and in SDP mode - 36 (should be 0 if port is not used)
    .WRITE_WIDTH_B             (PWIDTH_B),       // Valid: 0,1,2,4,9,18 and in SDP mode - 36 (should be 0 if port is not used)
    .RAM_MODE                  ("TDP"),          // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A              (WRITE_MODE_A),   // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B              (WRITE_MODE_B),   // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK       ("ALL"),          // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE                 ("NONE"),         // "NONE" or filename with initialization data
    .SIM_DEVICE                ("7SERIES")      // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"
`ifdef PRELOAD_BRAMS
    `include "includes/ram18_pass_init.vh"
`endif
    
    ) RAMB18E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO           (data_out16_a),    // Port A data/LSB data[15:0], output
        .DOPADOP         (),                // Port A parity/LSB parity[1:0], output
        .DIADI           (data_in16_a),     // Port A data/LSB data[15:0], input
        .DIPADIP         (2'b0),            // Port A parity/LSB parity[1:0], input
        .ADDRARDADDR     ({addr_a,{LOG2WIDTH_A{1'b1}}}),  // Port A (read port in SDP) address [13:0], unused should be high, input
        .CLKARDCLK       (clk_a),           // Port A (read port in SDP) clock, input
        .ENARDEN         (en_a),            // Port A (read port in SDP) Enable, input
        .REGCEAREGCE     (regen_a),         // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM   (1'b0),            // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG   (1'b0),            // Port A (read port in SDP) register set/reset, input
        .WEA             ({2{we_a}}),       // Port A (read port in SDP) Write Enable[1:0], input
        // Port B
        .DOBDO           (data_out16_b),    // Port B data/MSB data[31:0], output
        .DOPBDOP         (),                // Port B parity/MSB parity[3:0], output
        .DIBDI           (data_in16_b),     // Port B data/MSB data[31:0], input
        .DIPBDIP         (2'b0),            // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR     ({addr_b,{LOG2WIDTH_B{1'b1}}}), // Port B (read port in SDP) address [13:0], unused should be high, input
        .CLKBWRCLK       (clk_b),           // Port B (write port in SDP) clock, input
        .ENBWREN         (en_b),            // Port B (write port in SDP) Enable, input
        .REGCEB          (regen_b),         // Port B (write port in SDP) register enable, input
        .RSTRAMB         (1'b0),            // Port B (write port in SDP) set/reset, input
        .RSTREGB         (1'b0),            // Port B (write port in SDP) register set/reset, input
        .WEBWE           ({4{we_b}})        // Port B (write port in SDP) Write Enable[3:0], input
    );

endmodule

