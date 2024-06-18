// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>timestamp_snapshot
 * @file timestamp_snapshot.v
 * @date 2015-07-03  
 * @author Andrey Filippov     
 *
 * @brief Take timestamp snapshot and send the ts message over the 8-bit bus
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * timestamp_snapshot.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  timestamp_snapshot.v is distributed in the hope that it will be useful,
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

module  timestamp_snapshot(
//    input                rst,
    input                tclk, // clock that drives time counters
    input         [31:0] sec,  // @tclk: current time seconds
    input         [19:0] usec, // @tclk: current time microseconds
    // snapshot destination clock domain
    input                sclk,
    input                srst, // @ posedge sclk - sync reset
    input                snap,
    output reg           pre_stb, // one clock pulse before sending TS data
    output reg     [7:0] ts_data  // timestamp data (s0,s1,s2,s3,u0,u1,u2,u3==0)
);
    wire         snap_tclk;
    reg   [51:0] sec_usec_snap;
    wire         pulse_busy;
    reg          pulse_busy_r;
    reg    [2:0] cntr;
    reg          snd;
    wire         pre_stb_w;

    assign pre_stb_w = !pulse_busy && pulse_busy_r;
    
    always @ (posedge tclk) begin
        if (snap_tclk) sec_usec_snap <= {usec,sec};
    end
    
    always @(posedge sclk) begin
        if      (srst)                         snd <= 0;
        else if (!pulse_busy && pulse_busy_r)  snd <= 1;
        else if ((&cntr) || snap)              snd <= 0;
        pre_stb <= pre_stb_w;
    end

    always @(posedge sclk) begin

        pulse_busy_r <= pulse_busy;
        
        if (!snd) cntr <= 0;
        else      cntr <=  cntr + 1;
        
        if (snd) case (cntr)
            3'h0: ts_data <= sec_usec_snap[ 7: 0];
            3'h1: ts_data <= sec_usec_snap[15: 8];
            3'h2: ts_data <= sec_usec_snap[23:16];
            3'h3: ts_data <= sec_usec_snap[31:24];
            3'h4: ts_data <= sec_usec_snap[39:32];
            3'h5: ts_data <= sec_usec_snap[47:40];
            3'h6: ts_data <= {4'b0,sec_usec_snap[51:48]};
            3'h7: ts_data <= 8'b0;
        endcase
    end
    
    pulse_cross_clock #(
        .EXTRA_DLY (1)
    ) snap_tclk_i (
        .rst       (srst), // input
        .src_clk   (sclk), // input
        .dst_clk   (tclk), // input
        .in_pulse  (snap), // input
        .out_pulse (snap_tclk), // output
        .busy      (pulse_busy) // output
    );
    

endmodule

