// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_4mux
 * @file cmd_encod_4mux.v
 * @date 2015-02-21  
 * @author Andrey Filippov     
 *
 * @brief 4-to-1 mux to cmbine memory sequences sources
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_4mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_4mux.v is distributed in the hope that it will be useful,
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

module  cmd_encod_4mux(
    input                   mrst,
    input                   clk,

    input                   start0,       // this channel was started
    input            [31:0] enc_cmd0,     // encoded command
    input                   enc_wr0,      // write encoded command
    input                   enc_done0,     // encoding finished

    input                   start1,       // this channel was started
    input            [31:0] enc_cmd1,     // encoded command
    input                   enc_wr1,      // write encoded command
    input                   enc_done1,     // encoding finished

    input                   start2,       // this channel was started
    input            [31:0] enc_cmd2,     // encoded command
    input                   enc_wr2,      // write encoded command
    input                   enc_done2,     // encoding finished

    input                   start3,       // this channel was started
    input            [31:0] enc_cmd3,     // encoded command
    input                   enc_wr3,      // write encoded command
    input                   enc_done3,     // encoding finished

    output reg              start,       // combined output was started (1 clk from |start*)
    output reg       [31:0] enc_cmd,     // encoded command
    output reg              enc_wr,      // write encoded command
    output reg              enc_done     // encoding finished
);
    reg [3:0] select;
    wire start_w= start0 | start1 |start2 | start3;
    always @ (posedge clk) begin
        if (mrst)      start <= 0;
        else           start <= start_w;
    
        if      (mrst)    select <= 0;
        else if (start_w) select <={ // normally should be no simultaneous starts, so priority is not needed
                            start3 & ~start2 & ~start1 & ~start0,
                            start2 & ~start1 & ~start0,
                            start1 & ~start0,
                            start0};
    end
    
    always @(posedge clk) begin
        enc_cmd <=  ({32{select[0]}} & enc_cmd0) |
                    ({32{select[1]}} & enc_cmd1) |
                    ({32{select[2]}} & enc_cmd2) |
                    ({32{select[3]}} & enc_cmd3);
                    
        enc_wr <=   (select[0] & enc_wr0) |
                    (select[1] & enc_wr1) |
                    (select[2] & enc_wr2) |
                    (select[3] & enc_wr3);
                    
        enc_done <= (select[0] & enc_done0) |
                    (select[1] & enc_done1) |
                    (select[2] & enc_done2) |
                    (select[3] & enc_done3);
    end

endmodule

