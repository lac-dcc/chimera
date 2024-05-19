// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_hispi_lane
 * @file sens_hispi_lane.v
 * @date 2015-10-13  
 * @author Andrey Filippov     
 *
 * @brief Decode a single lane of the HiSPi data assuming packetized-SP protocol
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_hispi_lane.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_hispi_lane.v is distributed in the hope that it will be useful,
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

module  sens_hispi_lane#(
    parameter HISPI_MSB_FIRST = 0
)(
    input             ipclk,   // half HiSPi recovered clock (165 MHz for 660 bps of MT9F002)
    input             irst,    // reset sync to ipclk 
    input       [3:0] din,     // @posedge ipclk, din[3] came first
    output reg [11:0] dout,    // 12-bit data output
    output reg        dv,      // data valid - continuous marks line
    output reg        embed,   // valid @sol and up through all dv
    output reg        sof,     // always before first sol - not instead of
    output reg        eof,     // always after last eol (not instead of)
    output reg        sol,     // start of line - 1 cycle before dv
    output reg        eol,      // end of line - last dv
    output reg [1:0]  mon_barrel // monitor barrel shifter    
);
    localparam  [3:0] SYNC_SOF = HISPI_MSB_FIRST ? 4'h3 : 4'hc;
    localparam  [3:0] SYNC_SOL = HISPI_MSB_FIRST ? 4'h1 : 4'h8;
    localparam  [3:0] SYNC_EOF = HISPI_MSB_FIRST ? 4'h7 : 4'he;
//    localparam  [3:0] SYNC_EOL = 6;
    
    localparam  [3:0] SYNC_EMBED  = HISPI_MSB_FIRST ? 4'h1 : 4'h8; // other nibble (bit 4)

    localparam        LSB_INDEX =   HISPI_MSB_FIRST ? 2 : 0; // nibble number in 12-bit word
    localparam        MSB_INDEX =   HISPI_MSB_FIRST ? 0 : 2; // nibble number in 12-bit word
    
    
    reg   [3:0] d_r; // rehistered input data
    wire   [2:0] num_trail_0_w; // number of trailing 0-s in the last nibble
    wire   [2:0] num_lead_0_w; // number of leading 0-s in the last nibble
    wire   [2:0] num_trail_1_w; // number of trailing 1-s in the last nibble
    wire   [2:0] num_lead_1_w; // number of leading 1-s in the last nibble
    wire         zero_after_ones_w;
    reg    [3:0] num_running_ones;
    reg    [4:0] num_running_zeros; // after sufficient ones
    reg          prev4ones;      // previous data nibble was 4'hf
    reg    [1:0] num_first_zeros; // number of zeros in a first nibble after all ones
    reg    [1:0] shift_val;       // barrel shifter select (0 is 4!)
    wire         got_sync_w = !num_running_zeros[3] && (&num_running_zeros_w[4:3]);
    reg          got_sync;       // Got 24 zeros after >=16 1-s
    reg    [3:0] barrel;
    reg    [3:0] sync_decode; // 1-hot decoding of the last sync word
    
    reg          got_sof;
    reg          got_eof;
    reg          got_sol;
//    reg          got_eol;
    reg          got_embed;
    
    reg    [2:0] pre_dv;
    wire   [3:0] dout_w;
    wire   [4:0] num_running_zeros_w = num_running_zeros + {1'b0, num_lead_0_w};
    wire         start_line =  sync_decode[3] && (got_sol || got_sof);
    wire         start_line_d; // delayed just to turn on pre_dv;
    
    
    assign num_trail_0_w = (|din) ? ((|din[2:0]) ? ((|din[1:0]) ? (din[0] ? 3'h0 : 3'h1) : 3'h2) : 3'h3) : 3'h4;
    assign num_lead_0_w =  (|din) ? ((|din[3:1]) ? ((|din[3:2]) ? (din[3] ? 3'h0 : 3'h1) : 3'h2) : 3'h3) : 3'h4;

    assign num_trail_1_w = (&din) ? 3'h4 : ((&din[2:0]) ? 3'h3 : ((&din[1:0]) ? 3'h2 :((&din[0]) ? 3'h1 : 3'h0)));
    assign num_lead_1_w =  (&din) ? 3'h4 : ((&din[3:1]) ? 3'h3 : ((&din[3:2]) ? 3'h2 :((&din[3]) ? 3'h1 : 3'h0)));
//    assign zero_after_ones_w = !((din[0] && !din[1]) || (din[1] && !din[2]) || (din[2] && !din[3]) || (d_r[3] && !din[0]));
    assign zero_after_ones_w = !((din[0] && !din[1]) || (din[1] && !din[2]) || (din[2] && !din[3]) || (din[3] && !d_r[0]));
    
    always @(posedge ipclk) begin
        d_r <= din;
        prev4ones <= num_trail_1_w[2];
        
        if (prev4ones && !num_trail_1_w[2]) num_first_zeros <= num_trail_0_w[1:0]; // 4 will be 0
        // first stage - get at least 12 consecutive 1-s, expecting many consecutive 0-s after, so any
        // 1 after zero should restart counting.
        if      (irst)                                          num_running_ones <= 0;
        else if ((num_running_ones == 0) || !zero_after_ones_w) num_running_ones <= {1'b0,num_trail_1_w};
        // keep number of running 1-s saturated to 12 (to prevent roll over). Temporary there could be 13..15
        // When running 1-s turn to running zeros, the count will not reset and stay on through counting
        // of 0-s (will only reset by 1 after 0)
        else                                                    num_running_ones <= (&num_running_ones[3:2]) ? 4'hc :
                                                                (num_running_ones + {1'b0, num_lead_1_w});
        // Now count consecutive 0-s after (>=12) 1-s. Not using zero_after_ones in the middle of the run - will
        // rely on the number of running ones being reset in that case
        // Saturate number with 24 (5'h18), but only first transition from <24 to >=24 is used for sync
        // detection.
        if      (irst || !num_running_ones[3]) num_running_zeros <= 0;
//        else if (!num_running_ones[2])         num_running_zeros <= {2'b0,num_trail_0_w};
        else if (prev4ones)                    num_running_zeros <= {2'b0,num_trail_0_w};
        else                                   num_running_zeros <= (&num_running_zeros[4:3])? 5'h18 : num_running_zeros_w;

        if (irst) got_sync <= 0;
        else      got_sync <= got_sync_w;

        // got_sync should also abort data run - delayed by 10 clocks
        
        if      (irst)       shift_val <= 0;
//      else if (got_sync)   shift_val <= num_first_zeros;
        else if (got_sync_w) shift_val <= num_first_zeros;
        mon_barrel <= shift_val;
        
        case (shift_val)
            2'h0: barrel <= din;
//            2'h1: barrel <= {d_r[2:0], din[3]};
            2'h1: barrel <= {d_r[0],   din[3:1]};
            2'h2: barrel <= {d_r[1:0], din[3:2]};
//            2'h3: barrel <= {d_r[0],   din[3:1]};
            2'h3: barrel <= {d_r[2:0], din[3]};
        endcase

        if      (irst)     sync_decode <= 0;
        else if (got_sync) sync_decode <= 4'h1;
        else               sync_decode <= sync_decode << 1;
        
        if      (got_sync)                                       got_sof <= 0;
        else if (sync_decode[LSB_INDEX] && (barrel == SYNC_SOF)) got_sof <= 1;
        
        if      (got_sync)                                       got_eof <= 0;
        else if (sync_decode[LSB_INDEX] && (barrel == SYNC_EOF)) got_eof <= 1;
        
        if      (got_sync)                                       got_sol <= 0;
        else if (sync_decode[LSB_INDEX] && (barrel == SYNC_SOL)) got_sol <= 1;
        
//        if      (got_sync)                                       got_eol <= 0;
//        else if (sync_decode[LSB_INDEX] && (barrel == SYNC_EOL)) got_eol <= 1;

        if      (got_sync)                                       got_embed <= 0;
        else if (sync_decode[1] && (barrel == SYNC_EMBED))       got_embed <= 1;
        
        if      (irst)              dout[ 3:0] <= 0; 
        else if (pre_dv[LSB_INDEX]) dout[ 3:0] <= dout_w;

        if      (irst)              dout[ 7:4] <= 0; 
        else if (pre_dv[1])         dout[ 7:4] <= dout_w;
        
        if      (irst)              dout[11:8] <= 0; 
        else if (pre_dv[MSB_INDEX]) dout[11:8] <= dout_w;

        if  (irst || got_sync) pre_dv <= 0;
        else if (start_line_d) pre_dv <= 1;
        else                   pre_dv <= {pre_dv[1:0],pre_dv[2]};
        
        if (irst) dv <= 0;
        else      dv <= pre_dv[2];

        if (irst) sol <= 0;
        else      sol <= start_line_d;

        if (irst) eol <= 0;
        else      eol <= got_sync && (|pre_dv);
        
        if (irst) sof <= 0;
        else      sof <= sync_decode[3] && got_sof;
        
        if (irst) eof <= 0;
        else      eof <= sync_decode[3] && got_eof;

        if      (irst)           embed <= 0;
        else if (sync_decode[3]) embed <= got_embed && (got_sof || got_sol);
    end

    dly_16 #(
        .WIDTH(4)
    ) dly_16_dout_i (
        .clk  (ipclk), // input
        .rst  (1'b0),  // input
        .dly  (4'h8),     // input[3:0] 
        .din  (HISPI_MSB_FIRST ? barrel :{barrel[0],barrel[1],barrel[2],barrel[3]}), // input[0:0] 
        .dout (dout_w) // output[0:0] 
    );
    dly_16 #(
        .WIDTH(1)
    ) dly_16_pre_start_line_i (
        .clk  (ipclk), // input
        .rst  (1'b0),  // input
        .dly  (4'h7),     // input[3:0] 
        .din  (start_line), // input[0:0] 
        .dout (start_line_d) // output[0:0] 
    );


endmodule
