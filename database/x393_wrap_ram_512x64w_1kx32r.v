// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b> ram_512x64w_1kx32r
 * @file ram_512x64w_1kx32r.v
 * @author  Andrey Filippov
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *      
 * @brief Block RAM wrapper for the external memory read buffer
 *
 * <b>License:</b>
 *
 * ram_512x64w_1kx32r.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ram_512x64w_1kx32r.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
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
module  ram_512x64w_1kx32r
#(
  parameter integer REGISTERS = 0 // 1 - registered output
 )
   (
      input         rclk,     // clock for read port
      input  [ 9:0] raddr,    // read address
      input         ren,      // read port enable
      input         regen,    // output register enable
      output [31:0] data_out, // data out
      
      input         wclk,     // clock for read port
      input  [ 8:0] waddr,    // write address
      input         we,       // write port enable
      input  [ 7:0] web,      // write byte enable
      input  [63:0] data_in  // data out
    );
    RAMB36E1 
    #(
    .RSTREG_PRIORITY_A("RSTREG"), // Valid: "RSTREG" or "REGCE"
    .RSTREG_PRIORITY_B("RSTREG"), // Valid: "RSTREG" or "REGCE"
    .DOA_REG(REGISTERS),          // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .DOB_REG(REGISTERS),          // Valid: 0 (no output registers) and 1 - one output register (in SDP - to lower 36)
    .RAM_EXTENSION_A("NONE"),     // Cascading, valid: "NONE","UPPER", LOWER"
    .RAM_EXTENSION_B("NONE"),     // Cascading, valid: "NONE","UPPER", LOWER"
    .READ_WIDTH_A(36),            // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .READ_WIDTH_B(0),             // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_A(0),            // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .WRITE_WIDTH_B(72),            // Valid: 0,1,2,4,9,18,36 and in SDP mode - 72 (should be 0 if port is not used)
    .RAM_MODE("SDP"),             // Valid "TDP" (true dual-port) and "SDP" - simple dual-port
    .WRITE_MODE_A("WRITE_FIRST"), // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .WRITE_MODE_B("WRITE_FIRST"), // Valid: "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),// Valid: "DELAYED_WRITE","PERFORMANCE" (no access to the same page)
    .SIM_COLLISION_CHECK("ALL"),  // Valid: "ALL", "GENERATE_X_ONLY", "NONE", and "WARNING_ONLY"
    .INIT_FILE("NONE"),           // "NONE" or filename with initialization data
    .SIM_DEVICE("7SERIES"),       // Simulation device family - "VIRTEX6", "VIRTEX5" and "7_SERIES" // "7SERIES"

    .EN_ECC_READ("FALSE"),        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
    .EN_ECC_WRITE("FALSE")        // Valid:"FALSE","TRUE" (ECC decoder circuitry)
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
    
    ) RAMB36E1_i
    (
        // Port A (Read port in SDP mode):
        .DOADO(data_out[31:0]), // Port A data/LSB data[31:0], output
        .DOPADOP(),             // Port A parity/LSB parity[3:0], output
        .DIADI(data_in[31:0]),  // Port A data/LSB data[31:0], input
        .DIPADIP(4'h0),         // Port A parity/LSB parity[3:0], input
        .ADDRARDADDR({1'b1,raddr[9:0],5'b11111}),  // Port A (read port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKARDCLK(rclk),       // Port A (read port in SDP) clock, input
        .ENARDEN(ren),          // Port A (read port in SDP) Enable, input
        .REGCEAREGCE(regen),    // Port A (read port in SDP) register enable, input
        .RSTRAMARSTRAM(1'b0),   // Port A (read port in SDP) set/reset, input
        .RSTREGARSTREG(1'b0),   // Port A (read port in SDP) register set/reset, input
        .WEA(4'b0),             // Port A (read port in SDP) Write Enable[3:0], input
        // Port B
        .DOBDO(),               // Port B data/MSB data[31:0], output
        .DOPBDOP(),             // Port B parity/MSB parity[3:0], output
        .DIBDI(data_in[63:32]), // Port B data/MSB data[31:0], input
        .DIPBDIP(4'b0),         // Port B parity/MSB parity[3:0], input
        .ADDRBWRADDR({1'b1,waddr[8:0],6'b111111}), // Port B (write port in SDP) address [15:0]. used from [14] down, unused should be high, input
        .CLKBWRCLK(wclk),        // Port B (write port in SDP) clock, input
        .ENBWREN(we),            // Port B (write port in SDP) Enable, input
        .REGCEB(1'b0),               // Port B (write port in SDP) register enable, input
        .RSTRAMB(1'b0),              // Port B (write port in SDP) set/reset, input
        .RSTREGB(1'b0),              // Port B (write port in SDP) register set/reset, input
        .WEBWE(web[7:0]), // Port B (write port in SDP) Write Enable[7:0], input
        // Error correction circuitry
        .SBITERR(),      // Single bit error status, output
        .DBITERR(),      // Double bit error status, output
        .ECCPARITY(),    // Genearted error correction parity [7:0], output
        .RDADDRECC(),    // ECC read address[8:0], output
        .INJECTSBITERR(1'b0),// inject a single-bit error, input
        .INJECTDBITERR(1'b0),// inject a double-bit error, input
        // Cascade signals to create 64Kx1
        .CASCADEOUTA(),  // A-port cascade, output   
        .CASCADEOUTB(),  // B-port cascade, output
        .CASCADEINA(1'b0),   // A-port cascade, input
        .CASCADEINB(1'b0)    // B-port cascade, input
    );

endmodule

