// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>status_router16
 * @file status_router16.v
 * @date 2015-01-31  
 * @author Andrey Filippov     
 *
 * @brief Routes status data from 16 sources
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * status_router16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  status_router16.v is distributed in the hope that it will be useful,
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

module  status_router16(
    input        rst,
    input        clk,
    input        srst, // @ posedge clk
    // 4 input channels 
    input [7:0]  db_in0,
    input        rq_in0,
    output       start_in0, // only for the first cycle, combinatorial
    input [7:0]  db_in1,
    input        rq_in1,
    output       start_in1, // only for the first cycle, combinatorial
    input [7:0]  db_in2,
    input        rq_in2,
    output       start_in2, // only for the first cycle, combinatorial
    input [7:0]  db_in3,
    input        rq_in3,
    output       start_in3, // only for the first cycle, combinatorial
    input [7:0]  db_in4,
    input        rq_in4,
    output       start_in4, // only for the first cycle, combinatorial
    input [7:0]  db_in5,
    input        rq_in5,
    output       start_in5, // only for the first cycle, combinatorial
    input [7:0]  db_in6,
    input        rq_in6,
    output       start_in6, // only for the first cycle, combinatorial
    input [7:0]  db_in7,
    input        rq_in7,
    output       start_in7, // only for the first cycle, combinatorial
    input [7:0]  db_in8,
    input        rq_in8,
    output       start_in8, // only for the first cycle, combinatorial
    input [7:0]  db_in9,
    input        rq_in9,
    output       start_in9, // only for the first cycle, combinatorial
    input [7:0]  db_in10,
    input        rq_in10,
    output       start_in10, // only for the first cycle, combinatorial
    input [7:0]  db_in11,
    input        rq_in11,
    output       start_in11, // only for the first cycle, combinatorial
    input [7:0]  db_in12,
    input        rq_in12,
    output       start_in12, // only for the first cycle, combinatorial
    input [7:0]  db_in13,
    input        rq_in13,
    output       start_in13, // only for the first cycle, combinatorial
    input [7:0]  db_in14,
    input        rq_in14,
    output       start_in14, // only for the first cycle, combinatorial
    input [7:0]  db_in15,
    input        rq_in15,
    output       start_in15, // only for the first cycle, combinatorial

    // output (multiplexed) channel
    output [7:0] db_out,
    output       rq_out,
    input        start_out  // only for the first cycle, combinatorial
);

    wire   [7:0] db_int [1:0];
    wire   [1:0] rq_int;
    wire   [1:0] start_int;  // only for the first cycle, combinatorial

    status_router2 #(
        .FIFO_TYPE ("TWO_CYCLE") //= "ONE_CYCLE" // higher latency, but easier timing - use on some levels (others - default "ONE_CYCLE")
    ) status_router2_top_i (
        .rst       (rst), // input
        .clk       (clk), // input
        .srst      (srst), // input
        .db_in0    (db_int[0]), // input[7:0] 
        .rq_in0    (rq_int[0]), // input
        .start_in0 (start_int[0]), // output
        .db_in1    (db_int[1]), // input[7:0] 
        .rq_in1    (rq_int[1]), // input
        .start_in1 (start_int[1]), // output
        .db_out    (db_out), // output[7:0] 
        .rq_out    (rq_out), // output
        .start_out (start_out) // input
    );

    status_router8 status_router8_01234567_i (
        .rst       (rst), // input
        .clk       (clk), // input
        .srst      (srst), // input
        .db_in0    (db_in0), // input[7:0] 
        .rq_in0    (rq_in0), // input
        .start_in0 (start_in0), // output
        .db_in1    (db_in1), // input[7:0] 
        .rq_in1    (rq_in1), // input
        .start_in1 (start_in1), // output
        .db_in2    (db_in2), // input[7:0] 
        .rq_in2    (rq_in2), // input
        .start_in2 (start_in2), // output
        .db_in3    (db_in3), // input[7:0] 
        .rq_in3    (rq_in3), // input
        .start_in3 (start_in3), // output
        .db_in4    (db_in4), // input[7:0] 
        .rq_in4    (rq_in4), // input
        .start_in4 (start_in4), // output
        .db_in5    (db_in5), // input[7:0] 
        .rq_in5    (rq_in5), // input
        .start_in5 (start_in5), // output
        .db_in6    (db_in6), // input[7:0] 
        .rq_in6    (rq_in6), // input
        .start_in6 (start_in6), // output
        .db_in7    (db_in7), // input[7:0] 
        .rq_in7    (rq_in7), // input
        .start_in7 (start_in7), // output
        .db_out    (db_int[0]), // output[7:0] 
        .rq_out    (rq_int[0]), // output
        .start_out (start_int[0]) // input
    );

    status_router8 status_router8_89abcdef_i (
        .rst       (rst), // input
        .clk       (clk), // input
        .srst      (srst), // input
        .db_in0    (db_in8), // input[7:0] 
        .rq_in0    (rq_in8), // input
        .start_in0 (start_in8), // output
        .db_in1    (db_in9), // input[7:0] 
        .rq_in1    (rq_in9), // input
        .start_in1 (start_in9), // output
        .db_in2    (db_in10), // input[7:0] 
        .rq_in2    (rq_in10), // input
        .start_in2 (start_in10), // output
        .db_in3    (db_in11), // input[7:0] 
        .rq_in3    (rq_in11), // input
        .start_in3 (start_in11), // output
        .db_in4    (db_in12), // input[7:0] 
        .rq_in4    (rq_in12), // input
        .start_in4 (start_in12), // output
        .db_in5    (db_in13), // input[7:0] 
        .rq_in5    (rq_in13), // input
        .start_in5 (start_in13), // output
        .db_in6    (db_in14), // input[7:0] 
        .rq_in6    (rq_in14), // input
        .start_in6 (start_in14), // output
        .db_in7    (db_in15), // input[7:0] 
        .rq_in7    (rq_in15), // input
        .start_in7 (start_in15), // output
        .db_out    (db_int[1]), // output[7:0] 
        .rq_out    (rq_int[1]), // output
        .start_out (start_int[1]) // input
    );

endmodule

