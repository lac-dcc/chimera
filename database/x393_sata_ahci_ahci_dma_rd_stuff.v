// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ahci_dma_rd_stuff
 * @file ahci_dma_rd_stuff.v
 * @date 2016-01-01  
 * @author Andrey Filippov     
 *
 * @brief Stuff DWORD data with missing words into continuous 32-bit data
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * ahci_dma_rd_stuff.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ahci_dma_rd_stuff.v is distributed in the hope that it will be useful,
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

module  ahci_dma_rd_stuff(
    input             rst,      // sync reset
    input             clk,      // single clock
    input             din_av,   // input data available
    input             din_avm_w,// >1 word of data available (early)
    input             din_avm,  // >1 word of data available (registered din_avm_w)
    input             flushing, // output partial dword if available (should be ? cycles after last _re/ with data?)
    input      [31:0] din,      // 32-bit input dfata
    input       [1:0] dm,       // data mask showing which (if any) words in input dword are valid 
    output            din_re,   // read input data
    output            flushed,  // flush (end of last PRD is finished - data left module)
    output reg [31:0] dout,     // output 32-bit data
    output            dout_vld, // output data valid
    input             dout_re,   // consumer reads output data (should be AND-ed with dout_vld)
    output            last_DW
);
    reg  [15:0] hr; // holds 16-bit data from previous din_re if not consumed
    reg         hr_full;
    reg   [1:0] dout_vld_r;
    reg         din_av_safe_r;
    reg         din_re_r;
    wire  [1:0] dav_in = {2{din_av_safe_r}} & dm;
    wire  [1:0] drd_in = {2{din_re}} & dm;
    
    wire [15:0] debug_din_low =  din[15: 0];
    wire [15:0] debug_din_high = din[31:16];
    wire [15:0] debug_dout_low =  dout[15: 0];
    wire [15:0] debug_dout_high = dout[31:16];
    
//    wire        empty_in = din_av_safe_r && !(|dm);
//    wire        two_words_avail = &dav_in || (|dav_in && hr_full);
    wire        more_words_avail = |dav_in || hr_full;
    wire  [1:0] next_or_empty = {2{dout_re}} | ~dout_vld_r;
/// assign din_re = (din_av_safe_r && !(|dm)) || ((!dout_vld_r || dout_re) && (two_words_avail)) ; // flush
    
// ---------------

    wire room_for2 = dout_re || (!(&dout_vld_r) && !hr_full) || !(|dout_vld_r);
    wire room_for1 = dout_re || !hr_full || !(&dout_vld_r);
    reg              slow_down; // first time fifo almost empty
    reg              slow_dav;  // enable dout_vld waiting after each read out not to miss last DWORD
    reg              last_DW_r;
    reg              last_dw_sent;
    wire             no_new_data_w;
    reg        [1:0] no_new_data_r;
    
    
    
    assign din_re = din_av_safe_r && (!(|dm) || room_for2 || (room_for1 && !(&dm)));

/// assign dout_vld = (&dout_vld_r) || ((|dout_vld_r) && flushing);
    assign dout_vld = (!slow_down && (&dout_vld_r)) || slow_dav;
    
    assign last_DW = last_DW_r;
    assign flushed = last_DW_r && dout_re;
    assign no_new_data_w = !din_av && !hr_full;
//    assign flushed = 
    
    always @ (posedge clk) begin
        din_re_r <= din_re;
    
        if (rst) din_av_safe_r <= 0;
        else     din_av_safe_r <= din_av && (din_avm || (!din_re && !din_re_r));
        
        // set low word of the OR
        if (rst)                   dout_vld_r[0] <= 0;
        else if (next_or_empty[0]) dout_vld_r[0] <= hr_full || (din_re && (|dm));
        
        if (next_or_empty[0]) begin
            if (hr_full)        dout[15: 0] <= hr;
            else if (din_re) begin
                if (dm[0])      dout[15: 0] <= din[15: 0];
                else if (dm[1]) dout[15: 0] <= din[31:16];
            end
        end
        
        // set high word of the OR
        if (rst)                   dout_vld_r[1] <= 0;
        else if (next_or_empty[1]) dout_vld_r[1] <= next_or_empty[0]?
                                                     (din_re && ((hr_full &&(|dm)) || (&dm))) :
                                                     (hr_full || (din_re && (|dm)));
                                                     
        if (next_or_empty[1])   begin   
            if (next_or_empty[0]) begin
                if (din_re) begin
                    if      (hr_full && dm[0])             dout[31:16] <= din[15: 0];
                    else if (dm[1] && (!hr_full || dm[0])) dout[31:16] <= din[31:16];
                end
            end else begin
                if (hr_full)        dout[31:16] <= hr;
                else if (din_re) begin
                    if (dm[0])      dout[31:16] <= din[15: 0];
                    else if (dm[1]) dout[31:16] <= din[31:16];
                end
            end
        end

        // set holding register
        if      (rst)                               hr_full <= 0;
        else if (((&next_or_empty) && !(&drd_in)) ||
                 ((|next_or_empty) && !(|drd_in)))  hr_full <= 0;
        else if (((&drd_in) && !(&next_or_empty)) ||
                 ((|drd_in) && !(|next_or_empty)))  hr_full <= 1;
                 
        if      (drd_in[1]) hr <=  din[31:16];
        else if (drd_in[0]) hr <=  din[15: 0];
        
        if (rst || !flushing) slow_down <= 0;
        else if (!din_avm_w)  slow_down <= 1;
        
        if (rst || !flushing || last_dw_sent) slow_dav <= 0;
        else                    slow_dav <=  !dout_re && !last_dw_sent && ((!next_or_empty[1] && more_words_avail) || last_DW_r);
        
        
        if      (rst || !flushing)     last_dw_sent <= 0;
        else if (last_DW_r && dout_re) last_dw_sent <= 1;
        
        no_new_data_r <= {no_new_data_r[0], no_new_data_w};
        if      (rst || !flushing)                               last_DW_r <= 0;
        else if (slow_down && no_new_data_w && (&no_new_data_r)) last_DW_r <= 1;
        else if (dout_re)                                        last_DW_r <= 0;

    end

endmodule

