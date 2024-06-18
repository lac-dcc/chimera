// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_afi_mux_ptr
 * @file cmprs_afi_mux_ptr.v
 * @date 2015-06-28  
 * @author Andrey Filippov     
 *
 * @brief Maintain 4-channel chunk pointers (before AXI)
 * Advance 32-byte chunk pointers for each AXI burst and each frame (4*2=8 pointers)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_afi_mux_ptr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_afi_mux_ptr.v is distributed in the hope that it will be useful,
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

module  cmprs_afi_mux_ptr(
    input                         hclk,               // global clock to run axi_hp @ 150MHz, shared by all compressor channels
    // Write dual port 8x27 channel start address/length RAM
    input                  [26:0] sa_len_di,          // data to write per-channle buffer sa/length in chunks
    input                  [ 2:0] sa_len_wa,          // channel address to write sa/lengths
    input                         sa_len_we,          // write enable sa/length data
    
    input                         en,                 // 0 - resets, 0->1 resets all pointers. While reset allows write response
    input                  [ 3:0] reset_pointers,     // per-channel - reset pointers
    input                         pre_busy_w,         // combinatorial signal - one before busy[0] (depends on ptr_resetting)
    input                  [ 1:0] pre_winner_channel, // channel that won arbitration for AXI access, valid 1 cycle ahead of @ pre_busy_w
//    input                  [ 1:0] winner_channel,     // channel that won arbitration for AXI access, valid @ pre_busy_w
    input                         need_to_bother,     // wants to start access if address and data FIFO permit
    input                   [1:0] chunk_inc_want_m1,  // how much to increment chunk pointer (0..3) +1 - valid with busy[0] (w/o rollover)
    
    input                         last_burst_in_frame, // valid with busy[0] (last_burst_in_frame<=last_chunk_w[winner2])
                                                       // last_burst_in_frame is invalid when rollover splits burst in 2
    input                  [ 3:0] busy,               // one cycle less than sending 1-4 bursts, [1] - delayed by 1, [2] - by 2 
    output                        ptr_resetting,      // pointers will be reset next cycle (2-cycle-long pulse)
    output reg             [26:0] chunk_addr,         // chunk absolute address, valid with busy[1]
    input                  [ 2:0] chunk_ptr_ra,       // chunk pointer read address {eof, chn[1:0]}
    output                 [26:0] chunk_ptr_rd,       // chunk pointer read data (non-registered
//    output                 [ 2:0] max_inc             // maximal increment to rollover (limited by 4)        
    output                 [ 2:0] max_wlen            // maximal wlen[3:2], MSB - limited by rollover        

);
    reg   [3:0] reset_rq;               // request to reset pointers when ready
    reg   [3:0] reset_rq_pri;           // one-hot reset rq 
    wire  [1:0] reset_rq_enc;           // encoded reset_rq_pri
    wire        start_resetting_w;
    reg   [1:0] resetting;              // resetting chunk_pointer and eof_pointer
    reg   [2:0] ptr_wa;                 // pointer memory write port address, msb - eof/current, 2 LSB - channel
    reg         ptr_we;                 // pointer memory write enable
    reg  [26:0] ptr_ram[0:7];           // pointer (current and eof) memory (in 32-byte chunks
    wire [26:0] ptr_ram_di;             // data to be written to ptr_ram
    reg  [26:0] sa_len_ram[0:7];        // start chunk/num cunks in a buffer (write port @mclk)
    reg  [26:0] chunk_ptr_inc;          // incremented by 1..4 chunk pointer
//    reg  [27:0] rollover_r;         // incremented chunk pointer, decremented by length (MSB - sign)
    reg         en_d;                   //enable delayed by 1 cycle
    wire [ 2:0] sa_len_ra;              // start/len read address (0..3 - start addresses, 4..7 - lengths)

    reg  [ 2:0] max_inc_ram[0:3];       // maximal increment to rollover (limited by 4)     
    wire [ 1:0] pre_chunk_inc_m1;
    reg  [ 2:0] chunk_inc;
    wire [26:0] chunks_to_rollover;
    
    reg   [3:0] chunks_to_rollover_r;   // [3] >=8 
// SuppressWarnings VEditor unused 
    wire  [3:0] chunks_to_rollover_m1;
    wire  [3:0] pre_chunks_to_rollover_m1;
    reg         max_inc_ram_we;
    reg   [1:0] max_inc_ram_wa;
    wire        rollover_w; // this cycle causes rollover - valid at pre_busy_w
    reg         rollover_r; // this cycle causes rollover - valid at busy[0] and late
    reg  [ 1:0] winner_channel;     // channel that won arbitration for AXI access, valid @ pre_busy_w
    
    
    wire        ptr_ram_wa = ptr_ram[ptr_wa]; // SuppressThisWarning VEditor debug - just to view 
//    wire  [2:0] max_wlen_di;   // data to write to max_inc_ram and bypass register
    reg   [2:0] max_wlen_r;    // memory registered output
    reg   [2:0] max_wlen_same; // used to bypass max_inc_ram for the same channel
//    reg         use_same_max_wlen; // valid @ pre_busy_w
    reg   [1:0] last_max_written; // channel for which max_wlen was written to RAM
    
    assign ptr_resetting = resetting[0];
    assign sa_len_ra= {busy[1],ptr_wa[1:0]};
    
    assign reset_rq_enc = {reset_rq_pri[3] | reset_rq_pri[2],
                           reset_rq_pri[3] | reset_rq_pri[1]};
    assign ptr_ram_di= (resetting[1] ||rollover_r)  ? 27'b0 : chunk_ptr_inc ;

    assign chunk_ptr_rd = ptr_ram[chunk_ptr_ra];
    assign start_resetting_w = en && !busy[0] && !resetting[0] && (|reset_rq) && !need_to_bother;
    
///    assign max_wlen = max_inc_ram[winner_channel]; // valid @pre_busy_w
//    assign max_wlen = (last_max_written == winner_channel) ? (max_inc_ram_we? max_wlen_di: max_wlen_same) :max_wlen_r ; // valid @pre_busy_w
    assign max_wlen = (last_max_written == winner_channel) ? max_wlen_same :max_wlen_r ; // valid @pre_busy_w
    
//chunk_inc_want_m1
    assign pre_chunk_inc_m1 = (max_wlen[1:0] >= chunk_inc_want_m1)? chunk_inc_want_m1 : max_wlen[1:0];
    assign rollover_w =       !max_wlen[2] && (max_wlen[1:0] <= chunk_inc_want_m1);
    
    assign chunks_to_rollover = sa_len_ram[sa_len_ra] -  ptr_ram_di;
    assign chunks_to_rollover_m1 = chunks_to_rollover_r -1;
//    assign max_wlen_di = (|chunks_to_rollover_m1[3:2])?3'h7:{1'b0,chunks_to_rollover_m1[1:0]};    
    // 1 cycle ahead of chunks_to_rollover_m1
    assign pre_chunks_to_rollover_m1 =  {|chunks_to_rollover[26:3],chunks_to_rollover[2:0]} - 1;  
    always @ (posedge hclk) begin
        winner_channel <= pre_winner_channel;
        max_wlen_r <= max_inc_ram[pre_winner_channel]; // valid @pre_busy_w
        if       (!en)                 last_max_written <= 0;
        else if  (ptr_we & ~ptr_wa[2]) last_max_written <= ptr_wa[1:0];
        
        en_d <= en;
        // ===== calculate and rollover channel addresses ====
        // clear (during "resetting" or update 8x27 RAM that holds chunk pointers for the current burst and currenty frame
        // uses (reads) additional memory with per-channel start addresses and lengths (both measured in 32-byte chunks
        // read port of the ptr_ram will be used to monitor pointers through the status network
        // TODO: Make sure correct RAM modules are inferred
        // write length RAM
        if (sa_len_we) sa_len_ram[sa_len_wa] <= sa_len_di;
        if (start_resetting_w)  reset_rq_pri <= {reset_rq[3] & ~(|reset_rq[2:0]),
                                                 reset_rq[2] & ~(|reset_rq[1:0]),
                                                 reset_rq[1] &     ~reset_rq[0],
                                                 reset_rq[0]};
                                                 
        if (en && !en_d) reset_rq <= 4'hf;
        else             reset_rq <= reset_pointers | (reset_rq  & ~({4{resetting[0] &~ resetting[1]}} & reset_rq_pri));
        
        if (!en) resetting <= 0;
        else     resetting <= {resetting[0], start_resetting_w | (resetting[0] & ~resetting[1])};
        
        if (resetting == 2'b1)               ptr_wa[1:0] <= reset_rq_enc;
        else if (pre_busy_w)                 ptr_wa[1:0] <= winner_channel;
        
        if (start_resetting_w || pre_busy_w) ptr_wa[2]  <= 0;
        else if (ptr_we)                     ptr_wa[2]  <= 1;
        
        ptr_we <= resetting[0] ||   //  a pair of cycles to reset chunk pointer and frame chunk pointer
                  (busy[1] && !busy[2]) || // always update chunk pointer
                  (busy[2] && !busy[3] && last_burst_in_frame); // optionally update frame chunk pointer (same value)

        if (busy[0] && !busy[1]) begin // first clock of busy
            // calculate full address for current AXI burst (valid 1 clk after busy)
            chunk_addr <= ptr_ram[ptr_wa] + sa_len_ram[sa_len_ra];
            chunk_ptr_inc <= ptr_ram[ptr_wa] + chunk_inc;
        end                  
//        if (busy[1] && !busy[2]) begin // first clock of busy
//            chunk_ptr_rovr <={1'b0,chunk_ptr_inc} - {1'b0,sa_len_ram[sa_len_ra]}; // sa_len_ra now points at length
//        end
        // write to ptr_ram (1 or 2 locations - if eof)
        if (ptr_we) ptr_ram[ptr_wa] <= ptr_ram_di;
        
        if (pre_busy_w) chunk_inc <= {1'b0, pre_chunk_inc_m1} + 1;
        
        if (pre_busy_w) rollover_r <= rollover_w;
        
//    wire [26:0] chunks_to_rollover;
    
//    reg   [3:0] chunks_to_rollover_r;   // [3] >=8 
        if (ptr_we) chunks_to_rollover_r <= {|chunks_to_rollover[26:3],chunks_to_rollover[2:0]};
        
        max_inc_ram_we <= ptr_we & ~ptr_wa[2];
        max_inc_ram_wa <= ptr_wa[1:0];
        
        // set 1 cycle earlier 
        if (ptr_we & ~ptr_wa[2]) max_wlen_same <= (|pre_chunks_to_rollover_m1[3:2])?3'h7:{1'b0,pre_chunks_to_rollover_m1[1:0]};
        
        if (max_inc_ram_we) begin
            max_inc_ram[max_inc_ram_wa] <= max_wlen_same; // max_wlen_di; //  (|chunks_to_rollover_m1[3:2])?3'h7:{1'b0,chunks_to_rollover_m1[1:0]};
//            max_wlen_same <=               max_wlen_di;
        end
        
        
    end
endmodule


