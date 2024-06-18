// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b> debug_read
 * @file debug_read.v
 * @date 2018-02-01  
 * @author Andrey Filippov
 *     
 * @brief read wide data by providing address
 *
 * @copyright Copyright (c) 2018 <set up in Preferences-Verilog/VHDL Editor-Templates> .
 *
 * <b>License </b>
 *
 * debug_read.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * debug_read.v is distributed in the hope that it will be useful,
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

module  debug_read#(
    parameter DEBUG_NUM  =                     16, // number of 32-bit input registers
    parameter DEBUG_PAYLOAD =                  2,  // number of debug bits to watch for change
    parameter DEBUG_STATUS =                  'h714, //
    parameter DEBUG_STATUS_MASK =             'h7ff,
    parameter DEBUG_STATUS_REG_ADDR =         'hf0,  // 1 location
    parameter DEBUG_STATUS_PAYLOAD_ADDR =     'he0  // 16 locations
)(
    input                           mclk,        // system clock
    input                           mrst,        // @ posedge mclk - sync reset
    // programming interface
    input                     [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                           cmd_stb,     // strobe (with first byte) for the command a/d
    output                    [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                          status_rq,   // input request to send status downstream
    input                           status_start, // Acknowledge of the first status packet byte (address)
    input  [DEBUG_NUM * 32 - 1 : 0] dbg_in,
    input   [DEBUG_PAYLOAD - 1 : 0] dbg_watch
);

    wire           [31:0] cmd_data; 
    wire                  cmd_status;

    cmd_deser #(
        .ADDR       (DEBUG_STATUS),
        .ADDR_MASK  (DEBUG_STATUS_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (1),
        .DATA_WIDTH (32)
        
    ) cmd_deser_32bit_i (
        .rst        (1'b0),         //rst),         // input
        .clk        (mclk),        // input
        .srst       (mrst),        // input
        .ad         (cmd_ad),      // input[7:0] 
        .stb        (cmd_stb),     // input
        .addr       (),            // output[3:0] // not used 
        .data       (cmd_data),    // output[31:0] 
        .we         (cmd_status)   // output
    );

    status_generate #(
        .STATUS_REG_ADDR     (DEBUG_STATUS_REG_ADDR),
        .PAYLOAD_BITS        (DEBUG_PAYLOAD),
        .REGISTER_STATUS     (1),
        .EXTRA_WORDS         (DEBUG_NUM),
        .EXTRA_REG_ADDR      (DEBUG_STATUS_PAYLOAD_ADDR)
        
    ) status_generate_i (
        .rst           (1'b0),                  //  rst),                   // input
        .clk           (mclk),                  // input
        .srst          (mrst),                  // input
        .we            (cmd_status),            // input
        .wd            (cmd_data[7:0]),         // input[7:0] 
        .status        ({dbg_in, dbg_watch }),  // input[25:0] // 2 LSBs - may add "real" status 
        .ad            (status_ad),             // output[7:0] 
        .rq            (status_rq),             // output
        .start         (status_start)           // input
    );


endmodule

