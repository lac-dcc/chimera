// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mul_saxi_wr_chn
 * @file mul_saxi_wr_chn.v
 * @date 2015-07-10  
 * @author Andrey Filippov     
 *
 * @brief One channel of the mult_saxi_wr (read/write common buffer)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * mul_saxi_wr_chn.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mul_saxi_wr_chn.v is distributed in the hope that it will be useful,
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

module  mult_saxi_wr_chn #(
    parameter MULT_SAXI_HALF_BRAM =      1,     // 0 - use full 36Kb BRAM for the buffer, 1 - use just half
    parameter MULT_SAXI_BSLOG =          4,     // number of bits to represent burst size (4 - b.s. = 16, 0 - b.s = 1)
    parameter MULT_SAXI_ADV_WR =         4,     // number of clock cycles before end of write to genearte adv_wr_done
    parameter MULT_SAXI_ADV_RD =         3      // number of clock cycles before end of read to genearte wdata_busy (if !fifo_half_full)
) (
    input                                mclk,       // system clock
    input                                aclk,       // global clock to run s_axi (@150MHz?)
    input                                en,         // enable this channle ( 0 - reset)  
    input                                has_burst,  // channel has at least 1 burst (should go down immediately after read_burst if no more data)
    // use grant_wr to request reading external data
//    output                               read_burst, // request to read a burst of data from the channel
    input                                valid,      // data valid (same latency)
    output                               rq_wr,      // request to write to the buffer FIFO
    input                                grant_wr,   // single-cycle 
    output [(MULT_SAXI_HALF_BRAM?6:7):0] wa, // write buffer address (w/o 2 MSB - channel)
    output reg                           adv_wr_done, // outputs grant_wr for short bursts, or several clocks before end of wr
//    output                               pre_we,     // will be registered after mux - use valid
    output reg                           rq_out,
    input                                grant_out, // single-cycle
    input                                fifo_half_full, // output fifo is half full - use it to suspend readout
    output [(MULT_SAXI_HALF_BRAM?6:7):0] ra, // read buffer address (w/o 2 MSB - channel)
    output                               pre_re,     // will be registerd after the MUX
    output reg                           first_re,   // reading first word (next cycle after corresponding pre_re)
    output reg                           last_re,    // reading lastt word (next cycle after corresponding pre_re)
    
    output reg                           wdata_busy    

);
    localparam BURSTS_BITS= (MULT_SAXI_HALF_BRAM ? 9 : 10 ) - MULT_SAXI_BSLOG - 2; // number of bits to count number of bursts in 0-th quarter of the buffer
    
    reg     [BURSTS_BITS-1:0] wr_burst;
    reg [MULT_SAXI_BSLOG-1:0] wr_word;
    reg       [BURSTS_BITS:0] wr_num_burst; // number of bursts in the buffer chn0, as seen from the write side

    reg     [BURSTS_BITS-1:0] rd_burst;
    reg [MULT_SAXI_BSLOG-1:0] rd_word;
    reg       [BURSTS_BITS:0] rd_num_burst; // number of bursts in the buffer chn0, as seen from the read side
    reg                       rq_wr_r;
    reg                       rq_wr_busy;
//    reg                       early_wr_done; // single-cycle pulse several clock before end of write busy
//    reg                       grant_wr_r;
//    wire                      grant_wr_sngl;
//    wire                      grant_wr_aclk;
    wire                      write_last_in_burst;
    wire                      burst_written_aclk;
//    reg                       grant_out_r;
//   wire                      grant_out_sngl;
    wire                      grant_out_mclk;
    reg                       en_aclk;
    wire                      last_word_busy;  
    reg                       pre_re_r;  // may be interrupted if fifo_half_full
    reg                       out_busy;  // output data in progress
    
    assign wa = {wr_burst, wr_word};
    assign ra = {rd_burst, rd_word};
    assign rq_wr = rq_wr_r;
//    assign grant_wr_sngl = grant_wr && !grant_wr_r;
//    assign grant_out_sngl = grant_out && ~grant_out_r;
    assign last_word_busy = &wr_word ; // make it earlier, use BURSTS_BITS selection (& (word | (1 <<???)))
    assign write_last_in_burst = valid && (&wr_word);
    assign pre_re = pre_re_r;

    localparam ADV_WR_COUNT=(1 << MULT_SAXI_BSLOG) - MULT_SAXI_ADV_WR;
    localparam ADV_RD_COUNT=(1 << MULT_SAXI_BSLOG) - MULT_SAXI_ADV_RD;
    
    
    always @ (posedge mclk) begin
        adv_wr_done <= rq_wr_busy && (wr_word == ((ADV_WR_COUNT >= 0)? ADV_WR_COUNT : 0));
        
        if      (!en)                     rq_wr_busy <= 0;
        else if (grant_wr)                rq_wr_busy <= 1;
        else if (valid && last_word_busy) rq_wr_busy <= 0;
        
        
        rq_wr_r <= has_burst & (~wr_num_burst[BURSTS_BITS] & ~(&wr_num_burst[BURSTS_BITS-1:0])) & ~grant_wr & ~rq_wr_busy;
        // Number of bursts in fifo as seen from the input
        if      (!en)                               wr_num_burst <= 0;
        else if ( grant_wr && !grant_out_mclk) wr_num_burst <= wr_num_burst + 1;
        else if (!grant_wr &&  grant_out_mclk) wr_num_burst <= wr_num_burst - 1;

        if (!en || grant_wr) wr_word <= 0;
        else if (valid)      wr_word <= wr_word + 1;
        
        if      (!en)                 wr_burst <= 0;
        else if (write_last_in_burst) wr_burst <= wr_burst + 1;
        
        
    end
    
    reg                       early_busy;  // output data in progress

    always @ (posedge aclk) begin
        en_aclk <= en;
        // Number of bursts in fifo as seen from the output
        if      (!en_aclk)                          rd_num_burst <= 0;
        else if ( burst_written_aclk && !grant_out) rd_num_burst <= rd_num_burst + 1;
        else if (!burst_written_aclk &&  grant_out) rd_num_burst <= rd_num_burst - 1;
        
        if      (!en_aclk)                          rq_out <= 0;
        else if ( burst_written_aclk && !grant_out) rq_out <= 1;
        else if (!burst_written_aclk &&  grant_out) rq_out <= |rd_num_burst[BURSTS_BITS:1]; // >=2
        
        if (! en_aclk || grant_out)      rd_word <= 0;
        else if (pre_re_r)               rd_word <=rd_word +1;
        
        if (!en_aclk)                    rd_burst <= wr_burst; // <= 0 is OK too
        else if (pre_re_r && (&rd_word)) rd_burst <= rd_burst + 1;
        
        if      (!en_aclk)               out_busy <= 0;
        else if (grant_out)              out_busy <= 1;
        else if ((&rd_word) && pre_re_r) out_busy <= 0;

        if (!en_aclk || fifo_half_full || ((&rd_word) && pre_re_r))  pre_re_r <= 0;
        else                                                         pre_re_r <= out_busy;
        
        first_re <= pre_re_r && !(|rd_word); // will be used to copy channel/axi_wid
        last_re <=  pre_re_r && (&rd_word); // will be used to generate axi_wlast
        
        if (!en_aclk || (ADV_RD_COUNT > 0)) early_busy <= 0; // small counts will never get busy
        else if (grant_out)                 early_busy <= 1;
        else if (rd_word == ADV_RD_COUNT)   early_busy <= 0;
        
        if (!en_aclk)                                                         wdata_busy <= 0;
        else if (grant_out)                                                   wdata_busy <= 1;
        else if ((!fifo_half_full && !early_busy) || (&rd_word) || !out_busy) wdata_busy <= 0; 
    end
    
    pulse_cross_clock grant_out_mclk_i (
        .rst         (!en), // input
        .src_clk     (aclk), // input
        .dst_clk     (mclk), // input
        .in_pulse    (grant_out), // input
        .out_pulse   (grant_out_mclk), // output
        .busy() // output
    );
    pulse_cross_clock write_last_in_burst_i (
        .rst         (!en_aclk), // input
        .src_clk     (mclk), // input
        .dst_clk     (aclk), // input
        .in_pulse    (write_last_in_burst), // input
        .out_pulse   (burst_written_aclk), // output
        .busy() // output
    );
endmodule
