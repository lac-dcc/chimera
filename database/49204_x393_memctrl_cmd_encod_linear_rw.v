// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_linear_rw
 * @file cmd_encod_linear_rw.v
 * @date 2015-02-21  
 * @author Andrey Filippov     
 *
 * @brief Combining 2 modules:cmd_encod_linear_rd and cmd_encod_linear_wr
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_linear_rw.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_linear_rw.v is distributed in the hope that it will be useful,
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

module  cmd_encod_linear_rw#(
//    parameter BASEADDR = 0,
    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10,
    parameter NUM_XFER_BITS=         6,   // number of bits to specify transfer length
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10,   // VDT BUG: CMD_DONE_BIT is used in a function call parameter!
    parameter RSEL=                 1'b1, // late/early READ commands (to adjust timing by 1 SDCLK period)
    parameter WSEL=                 1'b0  // late/early WRITE commands (to adjust timing by 1 SDCLK period)
) (
    input                        mrst,
    input                        clk,
// programming interface
//    input                  [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
//    input                        cmd_stb,     // strobe (with first byte) for the command a/d
    input                  [2:0] bank_in,     // bank address
    input   [ADDRESS_NUMBER-1:0] row_in,      // memory row
    input   [COLADDR_NUMBER-4:0] start_col,   // start memory column in 8-bursts
    input    [NUM_XFER_BITS-1:0] num128_in,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        skip_next_page_in, // do not reset external buffer (continue)    
    input                        start_rd,       // start generating commands by cmd_encod_linear_rd
    input                        start_wr,       // start generating commands by cmd_encod_linear_wr
    output reg                   start,       // this channel was started (1 clk from start_rd || start_wr
    output reg            [31:0] enc_cmd,     // encoded command
    output reg                   enc_wr,      // write encoded command
    output reg                   enc_done     // encoding finished
);
    wire            [31:0] enc_cmd_rd;     // encoded command
    wire                   enc_wr_rd;      // write encoded command
    wire                   enc_done_rd;    // encoding finished
    wire            [31:0] enc_cmd_wr;     // encoded command
    wire                   enc_wr_wr;      // write encoded command
    wire                   enc_done_wr;    // encoding finished
    reg                    select_wr;

    cmd_encod_linear_rd #(
        .ADDRESS_NUMBER    (ADDRESS_NUMBER),
        .COLADDR_NUMBER    (COLADDR_NUMBER),
        .NUM_XFER_BITS     (NUM_XFER_BITS),
        .CMD_PAUSE_BITS    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT      (CMD_DONE_BIT),
        .RSEL              (RSEL)
    ) cmd_encod_linear_rd_i (
        .mrst               (mrst), // input
        .clk                (clk), // input
        .bank_in            (bank_in), // input[2:0] 
        .row_in             (row_in), // input[14:0] 
        .start_col          (start_col), // input[6:0] 
        .num128_in          (num128_in), // input[5:0] 
        .skip_next_page_in  (skip_next_page_in), // input
        .start              (start_rd), // input
        .enc_cmd            (enc_cmd_rd), // output[31:0] reg 
        .enc_wr             (enc_wr_rd), // output reg 
        .enc_done           (enc_done_rd) // output reg 
    );
    
    cmd_encod_linear_wr #(
        .ADDRESS_NUMBER    (ADDRESS_NUMBER),
        .COLADDR_NUMBER    (COLADDR_NUMBER),
        .NUM_XFER_BITS     (NUM_XFER_BITS),
        .CMD_PAUSE_BITS    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT      (CMD_DONE_BIT),
        .WSEL              (WSEL)
    ) cmd_encod_linear_wr_i (
        .mrst               (mrst), // input
        .clk                (clk), // input
        .bank_in            (bank_in), // input[2:0] 
        .row_in             (row_in), // input[14:0] 
        .start_col          (start_col), // input[6:0] 
        .num128_in          (num128_in), // input[5:0] 
        .skip_next_page_in  (skip_next_page_in), // input
        .start              (start_wr), // input
        .enc_cmd            (enc_cmd_wr), // output[31:0] reg 
        .enc_wr             (enc_wr_wr), // output reg 
        .enc_done           (enc_done_wr) // output reg 
    );
    
    always @(posedge clk) begin
        if (mrst)      start <= 0;
        else           start <= start_rd || start_wr;

        if      (mrst)     select_wr <= 0;
        else if (start_rd) select_wr <= 0;
        else if (start_wr) select_wr <= 1;
    end
    always @(posedge clk) begin
        enc_cmd <= select_wr? enc_cmd_wr: enc_cmd_rd;
        enc_wr <= select_wr? enc_wr_wr: enc_wr_rd;
        enc_done <= select_wr? enc_done_wr: enc_done_rd;
    end

endmodule

