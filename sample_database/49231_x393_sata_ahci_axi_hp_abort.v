// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>axi_hp_abort
 * @file axi_hp_abort.v
 * @date 2016-02-07  
 * @author Andrey Filippov     
 *
 * @brief Trying to gracefully reset AXI HP after aborted transmission
 * For read channel - just keep afi_rready on until RD FIFO is empty (afi_rcount ==0)
 * For write - keep track aof all what was sent so far, assuming aw is always ahead of w
 * Reset only by global reset (system POR) - probably it is not possible to just
 * reset PL or relaod bitfile, 
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * axi_hp_abort.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  axi_hp_abort.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  axi_hp_abort(
    input             hclk,
    input             hrst,  // just disables processing inputs
    input             abort,
    output            busy, // should disable control of afi_wvalid, afi_awid
    output reg        done,
    input             afi_awvalid, // afi_awready is supposed to be always on when afi_awvalid (caller uses fifo counetrs) ?
    input             afi_awready, //
    input      [ 5:0] afi_awid, 
    input       [3:0] afi_awlen, 
    input             afi_wvalid_in,
    input             afi_wready,
    output            afi_wvalid,
    output reg [ 5:0] afi_wid,
    input             afi_arvalid,
    input             afi_arready,
    input      [ 3:0] afi_arlen,
    input             afi_rready_in,
    input             afi_rvalid,
    output            afi_rready,
    output            afi_wlast,
// TODO:  Try to resolve problems when afi_racount, afi_wacount afi_wcount do not match expected
    input      [ 2:0] afi_racount,
    input      [ 7:0] afi_rcount,
    input      [ 5:0] afi_wacount,
    input      [ 7:0] afi_wcount,
    output reg        dirty,     // single bit to be sampled in different clock domain to see if flushing is needed
    output reg        axi_mismatch,   // calculated as 'dirty' but axi hp counters are 0
    output     [21:0] debug
);
    reg               busy_r;
    wire              done_w = busy_r && !dirty ;
    reg         [3:0] aw_lengths_ram[0:31];
    reg         [4:0] aw_lengths_waddr = 0;
    reg         [4:0] aw_lengths_raddr = 0;
    reg         [5:0] aw_count = 0;
    reg         [7:0] w_count = 0;
    reg         [7:0] r_count = 0;
    reg               adav = 0;
    wire              arwr = !hrst && afi_arvalid && afi_arready;
    wire              drd =  !hrst && afi_rvalid && afi_rready_in;
    wire              awr = !hrst && afi_awvalid && afi_awready;
    reg               ard_r = 0; // additional length read if not much data
    wire              ard = adav && ((|w_count[7:4]) || ard_r);
    wire              wwr = !hrst && afi_wready && afi_wvalid_in;
    reg               afi_rready_r;
    reg               afi_wlast_r; // wait one cycle after last in each burst (just to ease timing)
    reg               busy_aborting; // actually aborting
    wire              reset_counters = busy_r && !busy_aborting;
    assign busy = busy_r;
    
    assign afi_rready = busy_aborting && (|r_count) && ((|afi_rcount[7:1]) || (!afi_rready_r &&  afi_rcount[0]));
    assign afi_wlast =  busy_aborting && adav && (w_count[3:0] == aw_lengths_ram[aw_lengths_raddr]);
    assign afi_wvalid = busy_aborting && adav && !afi_wlast_r;
    assign debug = {aw_count[5:0], w_count[7:0], r_count[7:0]};
    
    // Watch for transactios performed by others (and this one too)
    always @ (posedge hclk) begin
        // read channel
        if (reset_counters) r_count <= 0;
        else if (drd)
             if (arwr)      r_count <= r_count + {4'b0, afi_arlen};
             else           r_count <= r_count - 1;
        else
             if (arwr)      r_count <= w_count  + {4'b0, afi_arlen} + 1;
    
        // write channel
    
        if (awr) afi_wid <= afi_awid; // one command is supposed to use just one awid/wid

        if (awr) aw_lengths_ram [aw_lengths_waddr] <= afi_awlen;

        if (reset_counters) aw_lengths_waddr <= 0;
        else if (awr)       aw_lengths_waddr <= aw_lengths_waddr + 1;

        if (reset_counters) aw_lengths_raddr <= 0;
        else if (ard)       aw_lengths_raddr <= aw_lengths_raddr + 1;
        
        if (reset_counters)    aw_count <= 0;
        else if ( awr && !ard) aw_count <= aw_count + 1;
        else if (!awr &&  ard) aw_count <= aw_count - 1;
        
        adav <= !reset_counters && (|aw_count[5:1]) || ((awr || aw_count[0]) && !ard) || (awr && aw_count[0]);
        
        ard_r <= !ard && adav && (w_count[3:0] > aw_lengths_ram[aw_lengths_raddr]);
        
        if (reset_counters) w_count <= 0;
        else if (wwr)
             if (ard)       w_count <= w_count - {4'b0, aw_lengths_ram[aw_lengths_raddr]};
             else           w_count <= w_count + 1;
        else
             if (ard)       w_count <= w_count - {4'b0, aw_lengths_ram[aw_lengths_raddr]} - 1;
        
        dirty <= (|r_count) || (|aw_count); // assuming w_count can never be non-zero? - no
    end
    
    // flushing part
    always @ (posedge hclk) begin
    
        if      (abort)  busy_r <= 1;
        else if (done_w) busy_r <= 0;

        if      (abort && ((|afi_racount) || (|afi_rcount) || (|afi_wacount) || (|afi_wcount)))  busy_aborting <= 1;
        else if (done_w) busy_aborting <= 0;

        
        done <=  done_w;
        afi_rready_r <= afi_rready;
        afi_wlast_r <=  afi_wlast;
        
        axi_mismatch <= busy && !busy_aborting && dirty;  //  
    end 
    

endmodule

