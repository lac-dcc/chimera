// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>imu_timestamps393
 * @file imu_timestamps393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief Acquire timestmps for events
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * imu_timestamps393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  imu_timestamps393.v is distributed in the hope that it will be useful,
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

module  imu_timestamps393(
    input                         xclk, // 80 MHz, posedge
    input                         rst,  // sync reset (@posedge xclk)
    output reg                    ts_snap, // request to take a local time snapshot
    input                         ts_stb,  // one clock pulse before receiving a local TS data
    input                   [7:0] ts_data, // local timestamp data (s0,s1,s2,s3,u0,u1,u2,u3==0)

    input                   [3:0] ts_rq,// requests to create timestamps (4 channels), @posedge xclk
    output                  [3:0] ts_ackn, // timestamp for this channel is stored
    input                   [3:0] ra,   // read address (2 MSBs - channel number, 2 LSBs - usec_low, (usec_high ORed with channel <<24), sec_low, sec_high
    output                 [15:0] dout);// output data
    reg           ts_rcv;
    reg           ts_busy;
    reg           ts_busy_d; 
    reg     [1:0] chn; // channel for which timestamp is bein requested/received
    wire    [3:0] rq_pri; // 1-hot prioritized timestamp request
    wire    [1:0] rq_enc; // encoded request channel
    reg     [2:0] cntr; // ts rcv counter
    wire          pre_snap;
    reg     [7:0] ts_data_r; // previous value of ts_data
    reg    [15:0] ts_ram[0:15];
    reg           rcv_last; // receiving last byte (usec MSB)
    reg     [3:0] ts_ackn_r;
    wire    [3:0] chn1hot;
    wire          pre_ackn;
    
    assign rq_pri = {ts_rq[3] & ~(|ts_rq[2:0]),
                     ts_rq[2] & ~(|ts_rq[1:0]),
                     ts_rq[1] & ~  ts_rq[0],
                     ts_rq[0]};
    assign rq_enc = {rq_pri[3] | rq_pri[2],
                     rq_pri[3] | rq_pri[1]};
                     
    assign pre_snap = (|ts_rq) && !ts_busy && !ts_busy_d; 
    assign chn1hot = {chn[1] & chn[0], chn[1] & ~chn[0], ~chn[1] & chn[0], ~chn[1] & ~chn[0]};
    assign pre_ackn = ts_rcv && (cntr == 3'h6);
    
    
    assign ts_ackn = ts_ackn_r;
    
    
    always @ (posedge xclk) begin
        ts_snap <= pre_snap && !rst;
        
        if (ts_rcv) ts_data_r <= ts_data;
        
        if      (rst)                      ts_busy <= 0;
        else if (pre_snap)                 ts_busy <= 1;
        else if (ts_rcv && (cntr == 3'h6)) ts_busy <= 0; // adjust 6?
        
        ts_busy_d <= ts_busy;
        
        rcv_last <= ts_rcv && (cntr == 3'h6);
        
        if      (rst)       ts_rcv <= 0;
        else if (ts_stb)    ts_rcv <= 1;
        else if (rcv_last)  ts_rcv <= 0;
        
        if (!ts_rcv) cntr <= 0;
        else      cntr <= cntr + 1;
        if (pre_snap) chn <= rq_enc;
        // insert channel instead of the usec MSB, swap usec <-> sec
        if (ts_rcv && cntr[0]) ts_ram[{chn, ~cntr[2], cntr[1]}] <= {rcv_last ? {6'b0,chn} : ts_data, ts_data_r};
        
        if (rst) ts_ackn_r <= 4'hf;
        else     ts_ackn_r <= ts_rq & (ts_ackn_r | (chn1hot & {4{pre_ackn}}));
        
    
        
        
    end
    
    assign dout[15:0] = ts_ram[ra];
                       
endmodule 

