// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Copyright (c) 2014 Elphel, Inc.
 * Dual port memory wrapper, with variable width write and variable width read
 * using "SDP" ot "TDP" modes of RAMB36E1
 * ram_var_w_var_r.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ram_var_w_var_r.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *******************************************************************************/
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
module  ram_var_w_var_r
#(
  parameter integer REGISTERS    = 0, // 1 - registered output
  parameter integer LOG2WIDTH_WR = 6,  // WIDTH= 1  << LOG2WIDTH
  parameter integer LOG2WIDTH_RD = 6,  // WIDTH= 1  << LOG2WIDTH
  parameter         DUMMY = 0
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram36_declare_init.vh"
`endif
  
 )
   (
      input                         rclk,     // clock for read port
//      input  [ 9:0] raddr,    // read address
      input        [14-LOG2WIDTH_RD:0] raddr,    // read address
      input                            ren,      // read port enable
      input                            regen,    // output register enable
      output [(1 << LOG2WIDTH_RD)-1:0] data_out, // data out
      
      input                            wclk,     // clock for read port
      input        [14-LOG2WIDTH_WR:0] waddr,    // write address
      input                            we,       // write port enable
      input                     [ 7:0] web,      // write byte enable
      input  [(1 << LOG2WIDTH_WR)-1:0] data_in   // data out
    );
    generate
        if (DUMMY)
            ram_dummy #(
                .LOG2WIDTH_RD(LOG2WIDTH_RD)
            ) ramp_dummy_i (
                .data_out(data_out) 
            );
        else if ((LOG2WIDTH_WR == 6) && (LOG2WIDTH_RD == 6))
            ram_64w_64r #(
                .REGISTERS    (REGISTERS)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
            ) ram_i (
                .rclk         (rclk),     // input
                .raddr        (raddr),    // input[8:0] 
                .ren          (ren),      // input
                .regen        (regen),    // input
                .data_out     (data_out), // output[63:0] 
                .wclk         (wclk),     // input
                .waddr        (waddr),    // input[8:0] 
                .we           (we),       // input
                .web          (web),      // input[7:0] 
                .data_in      (data_in)   // input[63:0] 
            );
        else if ((LOG2WIDTH_WR == 6) && (LOG2WIDTH_RD < 6))
            ram_64w_lt64r #(
                .REGISTERS    (REGISTERS),
                .LOG2WIDTH_RD (LOG2WIDTH_RD)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
            ) ram_i (
                .rclk         (rclk),     // input
                .raddr        (raddr),    // input[(>8):0] 
                .ren          (ren),      // input
                .regen        (regen),    // input
                .data_out     (data_out), // output[(<32):0] 
                .wclk         (wclk),     // input
                .waddr        (waddr),    // input[8:0] 
                .we           (we),       // input
                .web          (web),      // input[7:0] 
                .data_in      (data_in)   // input[63:0] 
            );
        else if ((LOG2WIDTH_WR < 6) && (LOG2WIDTH_RD == 6))
            ram_lt64w_64r #(
                .REGISTERS    (REGISTERS),
                .LOG2WIDTH_WR (LOG2WIDTH_WR)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
            ) ram_i (
                .rclk         (rclk),     // input
                .raddr        (raddr),    // input[8:0] 
                .ren          (ren),      // input
                .regen        (regen),    // input
                .data_out     (data_out), // output[63:0] 
                .wclk         (wclk),     // input
                .waddr        (waddr),    // input[(>8):0] 
                .we           (we),       // input
                .web          (web),      // input[7:0] 
                .data_in      (data_in)   // input[(<32):0] 
            );
        else if ((LOG2WIDTH_WR < 6) && (LOG2WIDTH_RD < 6))
            ram_lt64w_lt64r #(
                .REGISTERS    (REGISTERS),
                .LOG2WIDTH_WR (LOG2WIDTH_WR),
                .LOG2WIDTH_RD (LOG2WIDTH_RD)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
            ) ram_i (
                .rclk         (rclk),     // input
                .raddr        (raddr),    // input[(>8):0] 
                .ren          (ren),      // input
                .regen        (regen),    // input
                .data_out     (data_out), // output[(<32):0] 
                .wclk         (wclk),     // input
                .waddr        (waddr),    // input[(>8):0] 
                .we           (we),       // input
                .web          (web),      // input[7:0] 
                .data_in      (data_in)   // input[(<32):0] 
            );
    endgenerate
endmodule

// Both ports with 64 bit widths
module  ram_64w_64r
#(
  parameter integer REGISTERS    = 0 // 1 - registered output
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram36_declare_init.vh"
`endif
 )
   (
      input                         rclk,     // clock for read port
      input                   [8:0] raddr,    // read address
      input                         ren,      // read port enable
      input                         regen,    // output register enable
      output                 [63:0] data_out, // data out
      
      input                         wclk,     // clock for read port
      input                  [ 8:0] waddr,    // write address
      input                         we,       // write port enable
      input                  [ 7:0] web,      // write byte enable
      input                  [63:0] data_in  // data out
    );
    localparam  PWIDTH_WR=72;
    localparam  PWIDTH_RD=72;
    
    RAMB36E1
    #(
    .RSTREG_PRIORITY_A         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .DOA_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .DOB_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .RAM_EXTENSION_A           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .RAM_EXTENSION_B           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .READ_WIDTH_A              (PWIDTH_RD),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .READ_WIDTH_B              (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_A             (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_B             (PWIDTH_WR),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .RAM_MODE                  ("SDP"),          // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK       ("ALL"),          // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE                 ("NONE"),         // "NONE" or filename with initialization data
    .SIM_DEVICE                ("7SERIES"),      // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"
    .EN_ECC_READ               ("FALSE"),        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
    .EN_ECC_WRITE              ("FALSE")         // Valid:"FALSE","TRUE" (ECC decoder circuitry)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
    ) RAMB36E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO           (data_out[31:0]), // Port A data/LSB data[31:0], output
        .DOPADOP         (),               // Port A parity/LSB parity[3:0], output
        .DIADI           (data_in[31:0]),  // Port A data/LSB data[31:0], input
        .DIPADIP         (4'h0),           // Port A parity/LSB parity[3:0], input
        .ADDRARDADDR     ({1'b1,raddr[8:0],6'b111111}),  // Port A (read port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKARDCLK       (rclk),           // Port A (read port in SDP) clock, input
        .ENARDEN         (ren),            // Port A (read port in SDP) Enable, input
        .REGCEAREGCE     (regen),          // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM   (1'b0),           // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG   (1'b0),           // Port A (read port in SDP) register set/reset, input
        .WEA             (4'b0),           // Port A (read port in SDP) Write Enable[3:0], input
        // Port B
        .DOBDO           (data_out[63:32]),// Port B data/MSB data[31:0], output
        .DOPBDOP         (),               // Port B parity/MSB parity[3:0], output
        .DIBDI           (data_in[63:32]), // Port B data/MSB data[31:0], input
        .DIPBDIP         (4'b0),           // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR     ({1'b1,waddr[8:0],6'b111111}), // Port B (write port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKBWRCLK       (wclk),           // Port B (write port in SDP) clock, input
        .ENBWREN         (we),             // Port B (write port in SDP) Enable, input
        .REGCEB          (1'b0),           // Port B (write port in SDP) register enable, input
        .RSTRAMB         (1'b0),           // Port B (write port in SDP) set/reset, input
        .RSTREGB         (1'b0),           // Port B (write port in SDP) register set/reset, input
        .WEBWE           (web),            // Port B (write port in SDP) Write Enable[7:0], input
        // Error correction circuitry
        .SBITERR         (),               // Single bit error status, output
        .DBITERR         (),               // Double bit error status, output
        .ECCPARITY       (),               // Genearted error correction parity [7:0], output
        .RDADDRECC       (),               // ECC read address[8:0], output
        .INJECTSBITERR   (1'b0),           // inject a single-bit error, input
        .INJECTDBITERR   (1'b0),           // inject a double-bit error, input
        // Cascade signals to create 64Kx1
        .CASCADEOUTA     (),               // A-port cascade, output   
        .CASCADEOUTB     (),               // B-port cascade, output
        .CASCADEINA      (1'b0),           // A-port cascade, input
        .CASCADEINB      (1'b0)            // B-port cascade, input
    );

endmodule

// Both ports with less than 64 bit widths - TODO: see if it is still possible to use SDP
module  ram_lt64w_lt64r
#(
  parameter integer REGISTERS    = 0, // 1 - registered output
  parameter integer LOG2WIDTH_WR = 5,  // WIDTH= 1  << LOG2WIDTH
  parameter integer LOG2WIDTH_RD = 5   // WIDTH= 1  << LOG2WIDTH
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram36_declare_init.vh"
`endif
 )
   (
      input                            rclk,     // clock for read port
//      input  [ 9:0] raddr,    // read address
      input        [14-LOG2WIDTH_RD:0] raddr,    // read address
      input                            ren,      // read port enable
      input                            regen,    // output register enable
      output [(1 << LOG2WIDTH_RD)-1:0] data_out, // data out
      
      input                            wclk,     // clock for read port
      input        [14-LOG2WIDTH_WR:0] waddr,    // write address
      input                            we,       // write port enable
      input                     [ 7:0] web,      // write byte enable
      input  [(1 << LOG2WIDTH_WR)-1:0] data_in   // data out
    );
    localparam  PWIDTH_WR = (LOG2WIDTH_WR > 2)? (9 << (LOG2WIDTH_WR - 3)): (1 << LOG2WIDTH_WR);
    localparam  PWIDTH_RD = (LOG2WIDTH_RD > 2)? (9 << (LOG2WIDTH_RD - 3)): (1 << LOG2WIDTH_RD);
    localparam  WIDTH_WR  = 1 << LOG2WIDTH_WR;
    localparam  WIDTH_RD  = 1 << LOG2WIDTH_RD;
    wire          [31:0] data_out32;
    wire [WIDTH_WR+31:0] data_in_ext = {32'b0,data_in};
    wire          [31:0] data_in32=data_in_ext[31:0];
    assign data_out=data_out32[WIDTH_RD-1:0];
    RAMB36E1
    #(
    .RSTREG_PRIORITY_A         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .DOA_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .DOB_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .RAM_EXTENSION_A           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .RAM_EXTENSION_B           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .READ_WIDTH_A              (PWIDTH_RD),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .READ_WIDTH_B              (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_A             (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_B             (PWIDTH_WR),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .RAM_MODE                  ("TDP"),          // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK       ("ALL"),          // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE                 ("NONE"),         // "NONE" or filename with initialization data
    .SIM_DEVICE                ("7SERIES"),      // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"

    .EN_ECC_READ               ("FALSE"),        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
    .EN_ECC_WRITE              ("FALSE")         // Valid:"FALSE","TRUE" (ECC decoder circuitry)
//    .INIT_A(36'h0),               // Output latches initialization data
//    .INIT_B(36'h0),               // Output latches initialization data
//    .SRVAL_A(36'h0),              // Output latches initialization data (copied at when RSTRAM/RSTREG activated)    
//    .SRVAL_B(36'h0)               // Output latches initialization data (copied at when RSTRAM/RSTREG activated)
/*
    parameter IS_CLKARDCLK_INVERTED = 1'b0;
    parameter IS_CLKBWRCLK_INVERTED = 1'b0;
    parameter IS_ENARDEN_INVERTED = 1'b0;
    parameter IS_ENBWREN_INVERTED = 1'b0;
    parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
    parameter IS_RSTRAMB_INVERTED = 1'b0;
    parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
    parameter IS_RSTREGB_INVERTED = 1'b0;
*/    
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
    
    ) RAMB36E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO           (data_out32),     // Port A data/LSB data[31:0], output
        .DOPADOP         (),               // Port A parity/LSB parity[3:0], output
        .DIADI           (32'h0),          // Port A data/LSB data[31:0], input
        .DIPADIP         (4'h0),           // Port A parity/LSB parity[3:0], input
        .ADDRARDADDR     ({1'b1,raddr,{LOG2WIDTH_RD{1'b1}}}),  // Port A (read port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKARDCLK       (rclk),           // Port A (read port in SDP) clock, input
        .ENARDEN         (ren),            // Port A (read port in SDP) Enable, input
        .REGCEAREGCE     (regen),          // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM   (1'b0),           // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG   (1'b0),           // Port A (read port in SDP) register set/reset, input
        .WEA             (4'b0),           // Port A (read port in SDP) Write Enable[3:0], input
        // Port B
        .DOBDO           (),               // Port B data/MSB data[31:0], output
        .DOPBDOP         (),               // Port B parity/MSB parity[3:0], output
        .DIBDI           (data_in32),      // Port B data/MSB data[31:0], input
        .DIPBDIP         (4'b0),           // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR     ({1'b1,waddr,{LOG2WIDTH_WR{1'b1}}}), // Port B (write port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKBWRCLK       (wclk),           // Port B (write port in SDP) clock, input
        .ENBWREN         (we),             // Port B (write port in SDP) Enable, input
        .REGCEB          (1'b0),           // Port B (write port in SDP) register enable, input
        .RSTRAMB         (1'b0),           // Port B (write port in SDP) set/reset, input
        .RSTREGB         (1'b0),           // Port B (write port in SDP) register set/reset, input
        .WEBWE           (web[7:0]),       // Port B (write port in SDP) Write Enable[7:0], input
        // Error correction circuitry
        .SBITERR         (),               // Single bit error status, output
        .DBITERR         (),               // Double bit error status, output
        .ECCPARITY       (),               // Genearted error correction parity [7:0], output
        .RDADDRECC       (),               // ECC read address[8:0], output
        .INJECTSBITERR   (1'b0),           // inject a single-bit error, input
        .INJECTDBITERR   (1'b0),           // inject a double-bit error, input
        // Cascade signals to create 64Kx1
        .CASCADEOUTA     (),               // A-port cascade, output   
        .CASCADEOUTB     (),               // B-port cascade, output
        .CASCADEINA      (1'b0),           // A-port cascade, input
        .CASCADEINB      (1'b0)            // B-port cascade, input
    );

endmodule

// Write port less than 64bits, read port 64 bit widths
module  ram_lt64w_64r
#(
  parameter integer REGISTERS    = 0, // 1 - registered output
  parameter integer LOG2WIDTH_WR = 5  // WIDTH= 1  << LOG2WIDTH
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram36_declare_init.vh"
`endif
 )
   (
      input                            rclk,     // clock for read port
//      input  [ 9:0] raddr,    // read address
      input                      [8:0] raddr,    // read address
      input                            ren,      // read port enable
      input                            regen,    // output register enable
      output                    [63:0] data_out, // data out
      
      input                            wclk,     // clock for read port
      input        [14-LOG2WIDTH_WR:0] waddr,    // write address
      input                            we,       // write port enable
      input                     [ 7:0] web,      // write byte enable
      input  [(1 << LOG2WIDTH_WR)-1:0] data_in   // data out
    );
    localparam  PWIDTH_WR = (LOG2WIDTH_WR > 2)? (9 << (LOG2WIDTH_WR - 3)): (1 << LOG2WIDTH_WR);
    localparam  PWIDTH_RD = 72;
    localparam  WIDTH_WR  = 1 << LOG2WIDTH_WR;
//    localparam  WIDTH_RD  = 64;
    wire [WIDTH_WR+31:0] data_in_ext = {32'b0,data_in};
    wire          [31:0] data_in32=data_in_ext[31:0];
    RAMB36E1
    #(
    .RSTREG_PRIORITY_A         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .DOA_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .DOB_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .RAM_EXTENSION_A           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .RAM_EXTENSION_B           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .READ_WIDTH_A              (PWIDTH_RD),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .READ_WIDTH_B              (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_A             (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_B             (PWIDTH_WR),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .RAM_MODE                  ("SDP"),          // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK       ("ALL"),          // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE                 ("NONE"),         // "NONE" or filename with initialization data
    .SIM_DEVICE                ("7SERIES"),      // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"

    .EN_ECC_READ               ("FALSE"),        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
    .EN_ECC_WRITE              ("FALSE")         // Valid:"FALSE","TRUE" (ECC decoder circuitry)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
    ) RAMB36E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO           (data_out[31:0]), // Port A data/LSB data[31:0], output
        .DOPADOP         (),               // Port A parity/LSB parity[3:0], output
        .DIADI           (32'h0),          // Port A data/LSB data[31:0], input
        .DIPADIP         (4'h0),           // Port A parity/LSB parity[3:0], input
        .ADDRARDADDR     ({1'b1,raddr[8:0],6'b111111}),  // Port A (read port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKARDCLK       (rclk),           // Port A (read port in SDP) clock, input
        .ENARDEN         (ren),            // Port A (read port in SDP) Enable, input
        .REGCEAREGCE     (regen),          // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM   (1'b0),           // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG   (1'b0),           // Port A (read port in SDP) register set/reset, input
        .WEA             (4'b0),           // Port A (read port in SDP) Write Enable[3:0], input
        // Port B
        .DOBDO           (data_out[63:32]), // Port B data/MSB data[31:0], output
        .DOPBDOP         (),               // Port B parity/MSB parity[3:0], output
        .DIBDI           (data_in32),      // Port B data/MSB data[31:0], input
        .DIPBDIP         (4'b0),           // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR     ({1'b1,waddr,{LOG2WIDTH_WR{1'b1}}}), // Port B (write port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKBWRCLK       (wclk),           // Port B (write port in SDP) clock, input
        .ENBWREN         (we),             // Port B (write port in SDP) Enable, input
        .REGCEB          (1'b0),           // Port B (write port in SDP) register enable, input
        .RSTRAMB         (1'b0),           // Port B (write port in SDP) set/reset, input
        .RSTREGB         (1'b0),           // Port B (write port in SDP) register set/reset, input
        .WEBWE           (web[7:0]),       // Port B (write port in SDP) Write Enable[7:0], input
        // Error correction circuitry
        .SBITERR         (),               // Single bit error status, output
        .DBITERR         (),               // Double bit error status, output
        .ECCPARITY       (),               // Genearted error correction parity [7:0], output
        .RDADDRECC       (),               // ECC read address[8:0], output
        .INJECTSBITERR   (1'b0),           // inject a single-bit error, input
        .INJECTDBITERR   (1'b0),           // inject a double-bit error, input
        // Cascade signals to create 64Kx1
        .CASCADEOUTA     (),               // A-port cascade, output   
        .CASCADEOUTB     (),               // B-port cascade, output
        .CASCADEINA      (1'b0),           // A-port cascade, input
        .CASCADEINB      (1'b0)            // B-port cascade, input
    );

endmodule

// Write port 64 bita, read port - less than 64 bits
module  ram_64w_lt64r
#(
  parameter integer REGISTERS    = 0, // 1 - registered output
//  parameter integer LOG2WIDTH_WR = 5,  // WIDTH= 1  << LOG2WIDTH
  parameter integer LOG2WIDTH_RD = 5   // WIDTH= 1  << LOG2WIDTH
`ifdef PRELOAD_BRAMS
    ,
    `include "includes/ram36_declare_init.vh"
`endif
 )
   (
      input                            rclk,     // clock for read port
//      input  [ 9:0] raddr,    // read address
      input        [14-LOG2WIDTH_RD:0] raddr,    // read address
      input                            ren,      // read port enable
      input                            regen,    // output register enable
      output [(1 << LOG2WIDTH_RD)-1:0] data_out, // data out
      
      input                            wclk,     // clock for read port
      input                      [8:0] waddr,    // write address
      input                            we,       // write port enable
      input                     [ 7:0] web,      // write byte enable
      input                     [63:0] data_in   // data out
    );
    localparam  PWIDTH_WR = 72;
    localparam  PWIDTH_RD = (LOG2WIDTH_RD > 2)? (9 << (LOG2WIDTH_RD - 3)): (1 << LOG2WIDTH_RD);
    localparam  WIDTH_RD  = 1 << LOG2WIDTH_RD;
    wire          [31:0] data_out32;
    assign data_out=data_out32[WIDTH_RD-1:0];
    RAMB36E1
    #(
    .RSTREG_PRIORITY_A         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B         ("RSTREG"),       // Valid: "RSTREG" or "REGCE"
    .DOA_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .DOB_REG                   (REGISTERS),      // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .RAM_EXTENSION_A           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .RAM_EXTENSION_B           ("NONE"),         // Cascading, valid: "NONE","UPPER", LOWER"
    .READ_WIDTH_A              (PWIDTH_RD),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .READ_WIDTH_B              (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_A             (0),              // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_B             (PWIDTH_WR),      // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .RAM_MODE                  ("SDP"),          // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B              ("WRITE_FIRST"),  // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK       ("ALL"),          // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE                 ("NONE"),         // "NONE" or filename with initialization data
    .SIM_DEVICE                ("7SERIES"),      // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"

    .EN_ECC_READ               ("FALSE"),        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
    .EN_ECC_WRITE              ("FALSE")         // Valid:"FALSE","TRUE" (ECC decoder circuitry)
`ifdef PRELOAD_BRAMS
    `include "includes/ram36_pass_init.vh"
`endif
    ) RAMB36E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO           (data_out32),     // Port A data/LSB data[31:0], output
        .DOPADOP         (),               // Port A parity/LSB parity[3:0], output
        .DIADI           (data_in[31:0]),  // Port A data/LSB data[31:0], input
        .DIPADIP         (4'h0),           // Port A parity/LSB parity[3:0], input
        .ADDRARDADDR     ({1'b1,raddr,{LOG2WIDTH_RD{1'b1}}}),  // Port A (read port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKARDCLK       (rclk),           // Port A (read port in SDP) clock, input
        .ENARDEN         (ren),            // Port A (read port in SDP) Enable, input
        .REGCEAREGCE     (regen),          // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM   (1'b0),           // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG   (1'b0),           // Port A (read port in SDP) register set/reset, input
        .WEA             (4'b0),           // Port A (read port in SDP) Write Enable[3:0], input
        // Port B
        .DOBDO           (),               // Port B data/MSB data[31:0], output
        .DOPBDOP         (),               // Port B parity/MSB parity[3:0], output
        .DIBDI           (data_in[63:32]), // Port B data/MSB data[31:0], input
        .DIPBDIP         (4'b0),           // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR({1'b1,waddr[8:0],6'b111111}), // Port B (write port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKBWRCLK       (wclk),           // Port B (write port in SDP) clock, input
        .ENBWREN         (we),             // Port B (write port in SDP) Enable, input
        .REGCEB          (1'b0),           // Port B (write port in SDP) register enable, input
        .RSTRAMB         (1'b0),           // Port B (write port in SDP) set/reset, input
        .RSTREGB         (1'b0),           // Port B (write port in SDP) register set/reset, input
        .WEBWE           (web[7:0]),       // Port B (write port in SDP) Write Enable[7:0], input
        // Error correction circuitry
        .SBITERR         (),               // Single bit error status, output
        .DBITERR         (),               // Double bit error status, output
        .ECCPARITY       (),               // Genearted error correction parity [7:0], output
        .RDADDRECC       (),               // ECC read address[8:0], output
        .INJECTSBITERR   (1'b0),           // inject a single-bit error, input
        .INJECTDBITERR   (1'b0),           // inject a double-bit error, input
        // Cascade signals to create 64Kx1
        .CASCADEOUTA     (),               // A-port cascade, output   
        .CASCADEOUTB     (),               // B-port cascade, output
        .CASCADEINA      (1'b0),           // A-port cascade, input
        .CASCADEINB      (1'b0)            // B-port cascade, input
    );

endmodule

module  ram_dummy
#(
  parameter integer LOG2WIDTH_RD = 5   // WIDTH= 1  << LOG2WIDTH
 )
   (
      output [(1 << LOG2WIDTH_RD)-1:0] data_out // data out
   );
   assign data_out=0;
endmodule

