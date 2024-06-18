// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b> simul_lwir160x120_telemetry
 * @file simul_lwir160x120_telemetry.v
 * @date 2019-04-01  
 * @author Andrey Filippov
 *     
 * @brief Combine telemetry data into vospi packet payload
 *
 * @copyright Copyright (c) 2019 Elphel, Inc.
 *
 * <b>License </b>
 *
 * simul_lwir160x120_telemetry.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * simul_lwir160x120_telemetry.v is distributed in the hope that it will be useful,
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

module  simul_lwir160x120_telemetry(
    input                   clk,
    input                   en,     // write all telemetry, but average
    input                   en_avg, // write frame average (may be simultaneous)
    // telemetry data
    input            [15:0] telemetry_rev,
    input            [31:0] telemetry_time,
    input            [31:0] telemetry_status,
    input            [63:0] telemetry_srev,
    input            [31:0] telemetry_frame,
    input            [15:0] telemetry_mean,
    input            [15:0] telemetry_temp_counts,
    input            [15:0] telemetry_temp_kelvin,
    input            [15:0] telemetry_temp_last_kelvin,
    input            [31:0] telemetry_time_last_ms,
    input            [15:0] telemetry_agc_roi_top,
    input            [15:0] telemetry_agc_roi_left,
    input            [15:0] telemetry_agc_roi_bottom,
    input            [15:0] telemetry_agc_roi_right,
    input            [15:0] telemetry_agc_high,
    input            [15:0] telemetry_agc_low,
    input            [31:0] telemetry_video_format, //???
    output reg [160*16-1:0] telemetry_a,
    output reg [160*16-1:0] telemetry_b
);
    always @(posedge clk) if (en) begin
        telemetry_a <= {
            telemetry_rev             [15:0],  // word   0
            telemetry_time            [31:0],  // words  1.. 2
            telemetry_status          [31:0],  // words  3.. 4
            {8{16'b0}},                        // words  5..12
            telemetry_srev            [63:0],  // words 13..16
            {3{16'b0}},                        // words 17..19
            telemetry_frame           [31:0],  // words 20..21
            en_avg?telemetry_mean[15:0]:telemetry_a[(159-22)*16 +: 16], // words 22
            telemetry_temp_counts     [15:0],  // words 23
            telemetry_temp_kelvin     [15:0],  // words 24
            {4{16'b0}},                        // words 25..28
            telemetry_temp_last_kelvin[15:0],  // words 29
            telemetry_time_last_ms    [31:0],  // words 30..31
            {2{16'b0}},                        // words 32..33
            telemetry_agc_roi_top     [15:0],  // words 34
            telemetry_agc_roi_left    [15:0],  // words 35
            telemetry_agc_roi_bottom  [15:0],  // words 36
            telemetry_agc_roi_right   [15:0],  // words 37
            telemetry_agc_high        [15:0],  // words 38
            telemetry_agc_low         [15:0],  // words 39
            {32{16'b0}},                       // words 40..71
            telemetry_video_format    [31:0],  // words 72..73
            {86{16'b0}}                        // words 74..159
        };
        telemetry_b <= 0;
    end else if (en_avg) begin
        telemetry_a[(159-22)*16 +: 16] <= telemetry_mean[15:0];
    end 
    

endmodule

