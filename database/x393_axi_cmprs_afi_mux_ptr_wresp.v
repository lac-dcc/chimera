// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_afi_mux_ptr_wresp
 * @file cmprs_afi_mux_ptr_wresp.v
 * @date 2015-06-28  
 * @author Andrey Filippov     
 *
 * @brief Maintain 4-channel chunk pointers for wrirte response
 * Advance 32-byte chunk pointers for each AXI burst and each frame (4*2=8 pointers)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_afi_mux_ptr_wresp.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_afi_mux_ptr_wresp.v is distributed in the hope that it will be useful,
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

module  cmprs_afi_mux_ptr_wresp(
    input                         hclk,               // global clock to run axi_hp @ 150MHz, shared by all compressor channels
    // Write dual port 4x27 channel length RAM (shadows 1/2 of the similar RAM for main pointers)
    input                  [26:0] length_di,          // data to write per-channle buffer length in chunks
    input                  [ 1:0] length_wa,          // channel address to write lengths
    input                         length_we,          // write enable length data
    
    input                         en,                 // 0 - resets, 0->1 resets all pointers. While reset allows write response
    input                  [ 3:0] reset_pointers,     // per-channel - reset pointers
    
    input                  [ 2:0] chunk_ptr_ra,       // chunk pointer read address {eof, chn[1:0]}
    output                 [26:0] chunk_ptr_rd,       // chunk pointer read data (non-registered
    
    output reg             [ 3:0] eof_written,        // per-channel end of frame confirmed written to system memory by write response

    // AFI write response channels    
    input                         afi_bvalid,
    output                        afi_bready,
    input                  [ 5:0] afi_bid // encodes channel, eof, and burst size minus 1 in chunks (0..3)
    
);
    reg   [3:0] reset_rq;               // request to reset pointers when ready
    reg   [3:0] reset_rq_pri;           // one-hot reset rq 
    wire  [1:0] reset_rq_enc;           // encoded reset_rq_pri
    wire        start_resetting_w;
    reg   [1:0] resetting;              // resetting chunk_pointer and eof_pointer
    wire  [2:0] ptr_wa;                 // pointer memory write port address, msb - eof/current, 2 LSB - channel
    reg         ptr_we;                 // pointer memory write enable
    reg  [26:0] ptr_ram[0:7];           // pointer (current and eof) memory (in 32-byte chunks
    wire [26:0] ptr_ram_di;             // data to be written to ptr_ram
    reg  [26:0] len_ram[0:3];           // start chunk/num cunks in a buffer (write port @mclk)
    reg  [26:0] chunk_ptr_inc;          // incremented by 1..4 chunk pointer
    reg  [27:0] chunk_ptr_rovr;         // incremented chunk pointer, decremented by length (MSB - sign)
    reg  [ 4:0] busy;                   // one-hot busy stages (usually end with [4]   

    reg  [ 4:0] id_r;                   // registered ID data - MSB is unused
    reg   [1:0] chn;                    // selected channel valid @busy[2]
    reg         eof;                    // eof register being written
    reg         last_burst_in_frame;    // this response is for eof
    reg   [2:0] chunk_inc;
    reg         afi_bready_r;           //
    reg         afi_bvalid_r;           // make it slow;
    wire        pre_busy;
    wire        pre_we;
    reg         en_d;                   //enable delayed by 1 cycle
    
    assign reset_rq_enc = {reset_rq_pri[3] | reset_rq_pri[2],
                           reset_rq_pri[3] | reset_rq_pri[1]};
    assign ptr_ram_di= resetting[1] ? 27'b0 : (chunk_ptr_rovr[27] ? chunk_ptr_inc : chunk_ptr_rovr[26:0]);
    
    assign ptr_wa = {eof,chn}; // valid @busy[2]
    assign afi_bready = afi_bready_r;
    
    assign pre_we= resetting[0] ||                   //  a pair of cycles to reset chunk pointer and frame chunk pointer
                   busy[3] ||                        // always update chunk pointer
                  (busy[4] && last_burst_in_frame); // optionally update frame chunk pointer (same value)
    assign pre_busy=             afi_bvalid_r && en && !(|busy[2:0]) && !pre_we;
    assign start_resetting_w =  !afi_bvalid_r && en && !(|busy[2:0]) && !pre_we && (|reset_rq);

    assign chunk_ptr_rd = ptr_ram[chunk_ptr_ra];
        
    always @ (posedge hclk) begin
        en_d <= en;
        // write length RAM
        if (length_we) len_ram[length_wa] <= length_di;
        afi_bvalid_r <= afi_bvalid;
        
        afi_bready_r <= !en || pre_busy; // (!busy[0] && !pre_busy && !resetting[0] && !start_resetting_w);
        busy <= {busy[3:0], pre_busy}; // adjust bits
        
//        if (afi_bready && afi_bvalid) id_r <= afi_bid[4:0]; // id_r[5] is never used - revoved
        if (afi_bvalid && pre_busy) id_r <= afi_bid[4:0]; // id_r[5] is never used - revoved
        
        if (start_resetting_w)  reset_rq_pri <= {reset_rq[3] & ~(|reset_rq[2:0]),
                                                 reset_rq[2] & ~(|reset_rq[1:0]),
                                                 reset_rq[1] &     ~reset_rq[0],
                                                 reset_rq[0]};
        
        if (en && !en_d) reset_rq <= 4'hf; // request reset all
        else             reset_rq <= reset_pointers | (reset_rq  & ~({4{resetting[0] &~ resetting[1]}} & reset_rq_pri));
        
        if (!en) resetting <= 0;
        else     resetting <= {resetting[0], start_resetting_w | (resetting[0] & ~resetting[1])};
        
        if      (resetting == 2'b01)  chn <= reset_rq_enc;
        else if (busy[1])             chn <= id_r[0 +: 2];
        
        if (busy[1]) begin // first busy cycle
            last_burst_in_frame <= id_r[2]; 
            chunk_inc <= {1'b0,id_r[3 +:2]} + 1; 
        end

        ptr_we <= pre_we;

        if ((resetting == 2'b01) || busy[0]) eof  <= 0;
        else if (ptr_we)                     eof  <= 1; // always second write cycle
        
        if (busy[2]) chunk_ptr_inc <= ptr_ram[ptr_wa] + chunk_inc; // second clock of busy
        if (busy[3]) chunk_ptr_rovr <={1'b0,chunk_ptr_inc} - {1'b0,len_ram[chn]}; // third clock of busy

        // write to ptr_ram (1 or 2 locations - if eof)
        if (ptr_we) ptr_ram[ptr_wa] <= ptr_ram_di;
        
        // Watch write response channel, detect EOF IDs, generate eof_written* output signals
        eof_written[0] <=  afi_bvalid_r && afi_bready_r && (id_r[2:0]== 3'h4);
        eof_written[1] <=  afi_bvalid_r && afi_bready_r && (id_r[2:0]== 3'h5);
        eof_written[2] <=  afi_bvalid_r && afi_bready_r && (id_r[2:0]== 3'h6);
        eof_written[3] <=  afi_bvalid_r && afi_bready_r && (id_r[2:0]== 3'h7);
        
        
        
    end
endmodule

