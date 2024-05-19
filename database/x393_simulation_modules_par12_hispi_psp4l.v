// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>par12_hispi_psp4l
 * @file par12_hispi_psp4l.v
 * @date 2015-10-11  
 * @author Andrey Filippov     
 *
 * @brief Convertp parallel 12bit to HiSPi packetized-SP 4 lanes
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * par12_hispi_psp4l.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  par12_hispi_psp4l.v is distributed in the hope that it will be useful,
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

module  par12_hispi_psp4l#(
    parameter FULL_HEIGHT =    0, // number of lines in a frame. If 0 - wait to the VACT end, if > 0 - output immediately
    parameter CLOCK_MPY =     10,
    parameter CLOCK_DIV =      3,
    parameter LANE0_DLY =      1.3,
    parameter LANE1_DLY =      2.7,
    parameter LANE2_DLY =      0.2,
    parameter LANE3_DLY =      1.8,
    parameter CLK_DLY =        2.3,
    parameter EMBED_LINES =    2,   // number of first lines containing embedded (non-image) data
    parameter MSB_FIRST =      0,
    parameter FIFO_LOGDEPTH = 12    // line FIFO address bits (includes sync+latency overhead)
)(
    input        pclk,
    input        rst,
    input [11:0] pxd,
    input        vact,
    input        hact_in, // should be multiple of 4 pixels
    output [3:0] lane_p,
    output [3:0] lane_n,
    output       clk_p,
    output       clk_n
);
    localparam FIFO_DEPTH  = 1 << FIFO_LOGDEPTH; 
    localparam  [3:0] SYNC_SOF = 3;
    localparam  [3:0] SYNC_SOL = 1;
    localparam  [3:0] SYNC_EOF = 7;
    localparam  [3:0] SYNC_EOL = 6;
//    localparam  SYNC_EMBED = 4;

    integer      lines_left; // number of lines left in a frame
    integer      pre_lines; // Number of lines left with "embedded" (not image) data
    reg   [ 1:0] lane_pcntr; // count input pixels to extend hact to 4*n if needed
    wire         hact = hact_in ||  (|lane_pcntr);
    reg          image_lines;
    reg          vact_d;
    reg   [47:0] pxd_d;
    reg   [48:0] fifo_di; // msb: 0 - data,1 sync
    reg          fifo_we;
    reg          hact_d;
    reg          next_sof;
    reg          next_line_pclk; // triggers serial output of a line (generated at SOL and EOF, wait full line)
    reg          next_frame_pclk; // start of a new frame on input
    wire         pre_fifo_we_eof_w =     (FULL_HEIGHT > 0) ? (next_line_pclk && (lines_left == 0)) : (vact_d && !vact);
//    wire         pre_fifo_we_sof_sol_w = vact_d && ((FULL_HEIGHT > 0) ? ((next_sof && hact && !hact_d) || (hact_d && ! hact && (lines_left > 1)))
    wire         pre_fifo_we_sof_sol_w = vact_d && ((FULL_HEIGHT > 0) ? ((next_sof && hact && !hact_d) || (next_line_pclk && (lines_left != 0)))
     : (hact && !hact_d));
    wire         pre_fifo_we_data_w =    vact_d && hact_d && (lane_pcntr == 0);
    wire         pre_fifo_we_w = pre_fifo_we_eof_w || pre_fifo_we_sof_sol_w || pre_fifo_we_data_w;
    
    always @(posedge pclk) begin
        if      (!vact)            lines_left <= FULL_HEIGHT;
        else if (hact_d && ! hact) lines_left <= lines_left - 1;
    end    
    
    always @(posedge pclk) begin
    
        vact_d <= vact;
        hact_d <= hact;
//        pxd_d <=  {pxd_d[35:0],pxd};
        pxd_d <=  {pxd, pxd_d[47:12]};
        
        
        if     (!vact) lane_pcntr <= 0;
        else if (hact) lane_pcntr <= lane_pcntr + 1;

        if      (!vact)                           pre_lines <= EMBED_LINES;
        else if (!image_lines && hact_d && !hact) pre_lines <= pre_lines - 1;
        
        if      (!vact)                                               image_lines <= (EMBED_LINES != 0);
        else if (!image_lines && hact_d && !hact && (pre_lines == 1)) image_lines <= 1;
        
        if      (!vact)  next_sof <= 1;
        else if (hact_d) next_sof <= 0;
        
        if (!vact_d) next_line_pclk <= 0;
        else         next_line_pclk <= (FULL_HEIGHT >0)? (hact_d && !hact): (!vact || (hact && !hact_d && !next_sof));

        next_frame_pclk <= vact_d && hact && !hact_d && next_sof;
        
        fifo_we <= pre_fifo_we_w;

        if (!pre_fifo_we_w) fifo_di <= 'bx;
        else if (pre_fifo_we_data_w)    fifo_di <= {1'b0,pxd_d};
        else if (pre_fifo_we_sof_sol_w) fifo_di <= {1'b1,{4 {{ 7'b0, ~image_lines, next_sof?SYNC_SOF:SYNC_SOL}}}};
        else if (pre_fifo_we_eof_w)     fifo_di <= {1'b1,{4 {{7'b0, 1'b0, SYNC_EOF}}}};
    end
    reg  [48:0]                fifo_ram [0 : FIFO_DEPTH - 1];
    reg  [FIFO_LOGDEPTH - 1:0] fifo_wa;
    
    always @ (posedge pclk) begin
        if      (rst)     fifo_wa <= 0;
        else if (fifo_we) fifo_wa <= fifo_wa + 1;
        
        if (fifo_we) fifo_ram[fifo_wa] <= fifo_di;
    end

    // generate output clock (normally multiplier first, but in simulation there will be less calculations if division is first)
    wire         oclk;
//    wire         int_clk;
    wire         next_line_oclk; 
    wire         next_frame_oclk ;
    reg          orst_r = 1;
    wire         orst = rst || orst_r;
    simul_clk_mult_div #(
        .MULTIPLIER(CLOCK_MPY),
        .DIVISOR(CLOCK_DIV),
        .SKIP_FIRST(5)
    ) simul_clk_div_mult_i (
        .clk_in(pclk), // input
        .en(1'b1), // input
        .clk_out(oclk) // output
    );

    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) pulse_cross_clock_sof_sol_i (
        .rst       (rst),             // input
        .src_clk   (pclk),            // input
        .dst_clk   (oclk),            // input
        .in_pulse  (next_line_pclk),  // input
        .out_pulse (next_line_oclk),  // output
        .busy() // output
    );

    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) pulse_cross_clock_sof_i (
        .rst       (rst),             // input
        .src_clk   (pclk),            // input
        .dst_clk   (oclk),            // input
        .in_pulse  (next_frame_pclk), // input
        .out_pulse (next_frame_oclk), // output
        .busy() // output
    );

    always @ (oclk) begin
        orst_r <= rst;
    end
    
    wire                 [3:0] rdy ; // all lanes operate at the same time, only one rdy bit is used
    wire                 [3:0] sdata;
    wire                 [3:0] sdata_dly;
    reg  [FIFO_LOGDEPTH - 1:0] fifo_ra;
    wire                [48:0] fifo_out = fifo_ram[fifo_ra];
    wire                       fifo_dav;
//    wire                       next_line;
    wire                       sof_sol_sent;
    reg                  [1:0] lines_available; // number of lines ready in FIFO
    wire                       line_available = |lines_available;
    generate
        genvar i;
        for (i=0; i < 4; i=i+1) begin: cmprs_channel_block
            par12_hispi_psp4l_lane #(
                .SYNC_SOF  (SYNC_SOF),
                .SYNC_SOL  (SYNC_SOL),
                .SYNC_EOF  (SYNC_EOF),
                .SYNC_EOL  (SYNC_EOL),
                .IDL       (12'h800),
                .MSB_FIRST (MSB_FIRST)
            ) par12_hispi_psp4l_lane_i (
                .clk            (oclk),                                   // input
                .rst            (orst),                                   // input
                .din            ({fifo_out[48], fifo_out[i * 12 +: 12]}), // input[12:0] 
                .dav            (fifo_dav),                               // input
                .next_line      (line_available),                         // input
                .sof_sol_sent   (sof_sol_sent),                           // output reg
                .rdy            (rdy[i]),                                 // output
                .sout           (sdata[i])                                // output reg 
            );
            // TODO: Add delays and diff out here?
       end
    endgenerate   
    reg   [1:0] frames_open;     // number of frames that are already started on input, but not yet finished on output //next_frame_oclk
    wire        eof_sent =         rdy[0] && fifo_dav && fifo_out[48] && (fifo_out[2:0] == SYNC_EOF[2:0]);
    assign fifo_dav =  (|frames_open) && !(fifo_out[48] && (fifo_out[2:0] == SYNC_SOF[2:0]) && !line_available);
    always @(posedge oclk) begin
        if (orst)                                  lines_available <= 0;
        else if ( next_line_oclk && !sof_sol_sent) lines_available <= lines_available + 1;
        else if (!next_line_oclk &&  sof_sol_sent) lines_available <= lines_available - 1;

        if (orst)                                  frames_open <= 0;
        else if ( next_frame_oclk && !eof_sent)    frames_open <= frames_open + 1;
        else if (!next_frame_oclk &&  eof_sent)    frames_open <= frames_open - 1;

        if       (orst)                            fifo_ra <= fifo_wa;
        else if  (fifo_dav &&  rdy[0])             fifo_ra <= fifo_ra + 1;
              
    end
     
    sim_frac_clk_delay #(
        .FRAC_DELAY  (LANE0_DLY),
        .SKIP_FIRST  (5)
    ) sim_frac_clk_delay0_i (
        .clk         (oclk),        // input
        .din         (sdata[0]),    // input
        .dout        (sdata_dly[0]) // output
    );
    
    sim_frac_clk_delay #(
        .FRAC_DELAY  (LANE1_DLY),
        .SKIP_FIRST  (5)
    ) sim_frac_clk_delay1_i (
        .clk         (oclk),        // input
        .din         (sdata[1]),    // input
        .dout        (sdata_dly[1]) // output
    );
    sim_frac_clk_delay #(
        .FRAC_DELAY  (LANE2_DLY),
        .SKIP_FIRST  (5)
    ) sim_frac_clk_delay2_i (
        .clk         (oclk),        // input
        .din         (sdata[2]),    // input
        .dout        (sdata_dly[2]) // output
    );
    sim_frac_clk_delay #(
        .FRAC_DELAY  (LANE3_DLY),
        .SKIP_FIRST  (5)
    ) sim_frac_clk_delay3_i (
        .clk         (oclk),        // input
        .din         (sdata[3]),    // input
        .dout        (sdata_dly[3]) // output
    );
    reg clk_pn;
    wire clk_pn_dly;
    always @ (posedge oclk) begin
        if (orst) clk_pn <= 0;
        else      clk_pn <= ~clk_pn;
    end

    sim_frac_clk_delay #(
        .FRAC_DELAY  (CLK_DLY),
        .SKIP_FIRST  (5)
    ) sim_frac_clk_delay_clk_i (
        .clk         (oclk),        // input
        .din         (clk_pn),    // input
        .dout        (clk_pn_dly) // output
    );
    
    assign lane_p =  sdata_dly;
    assign lane_n = ~sdata_dly;

    assign clk_p =  clk_pn_dly;
    assign clk_n = ~clk_pn_dly;

endmodule

module  par12_hispi_psp4l_lane#(
    parameter  [3:0] SYNC_SOF = 3,
    parameter  [3:0] SYNC_SOL = 1,
    parameter  [3:0] SYNC_EOF = 7,
    parameter  [3:0] SYNC_EOL = 6,
    parameter [11:0] IDL = 12'h800,
    parameter        MSB_FIRST = 0
)(
    input        clk,
    input        rst,
    input [12:0] din,
    input        dav,
    input        next_line, // enable to continue seq_eol_sol
    output reg   sof_sol_sent,   // SOL sent
    output       rdy,
    output reg   sout
);
    reg   [11:0] sr;
    reg   [11:0] sr_in;
    reg          sr_in_av; //
    reg   [ 3:0] bcntr;
    reg   [ 3:0] seq_sof;
    reg   [ 3:0] seq_eof;
    reg   [ 7:0] seq_eol_sol;
    reg          embed; 
    wire         dav_rdy = dav && rdy;
    wire         is_sync = din[12];
    wire  [11:0] din_filt = (din[11:1] == 11'h0)? 12'h001 : din[11:0]; 
//    wire         pause = seq_eol_sol[4] && !next_line; 
    wire         pause = seq_eol_sol[3] && !next_line; 
    assign rdy = !sr_in_av;

    always @ (posedge clk) begin
        if (rst || (bcntr == 11)) bcntr <= 0;
        else                      bcntr <= bcntr + 1;

        if      (rst)        sr <= 'bx;
        else if (bcntr == 0) sr <= (sr_in_av && !pause) ? sr_in : IDL;
        else                 sr <= MSB_FIRST ? {sr[10:0],1'b0} : {1'b0,sr[11:1]}; 
        
        sout <= MSB_FIRST ? sr[11] : sr[0];
        
        if      (rst)                embed <= 0;
        else if (dav_rdy && is_sync) embed <= din[4];
        
        if      (rst)                                           seq_sof <= 0;
        else if (dav_rdy && is_sync && (din[3:0] == SYNC_SOF )) seq_sof <= 8;
        else if (bcntr == 0)                                    seq_sof <= seq_sof >> 1;
        
        if      (rst)                                                seq_eof <= 0;
        else if (dav_rdy && is_sync && (din[2:0] == SYNC_EOF[2:0] )) seq_eof <= 8;
        else if (bcntr == 0)                                         seq_eof <= seq_eof >> 1;
        
        if      (rst)                                               seq_eol_sol <= 0;
        else if (dav_rdy && is_sync && (din[3:0] == SYNC_SOL ))     seq_eol_sol <= 'h80;
        else if ((bcntr == 0) && !pause)                            seq_eol_sol <= seq_eol_sol >> 1;
        
        if (dav_rdy)                                                          sr_in <=  is_sync ? 12'hfff :  din_filt;
        else if ((bcntr == 0) && !pause) begin
            if (seq_sof[3] || seq_eof[3] || seq_eol_sol[7] || seq_eol_sol[3]) sr_in <=  12'h0;
            else if (seq_eol_sol[4])                                          sr_in <=  12'hfff;
            else if (seq_sof[1])                                              sr_in <=  {7'b0, embed, SYNC_SOF};
            else if (seq_eof[1])                                              sr_in <=  {7'b0, 1'b0,  SYNC_EOF};
            else if (seq_eol_sol[5])                                          sr_in <=  {7'b0, 1'b0,  SYNC_EOL};
            else if (seq_eol_sol[1])                                          sr_in <=  {7'b0, embed, SYNC_SOL};
        end
        
        if      (rst)        sr_in_av <= 0;
        else if (dav_rdy)    sr_in_av <= 1;
//        else if (bcntr == 0) sr_in_av <= (|seq_sof[3:1]) || (|seq_eof[3:1]) || ((|seq_eol_sol[7:1]) && !pause);
        else if (bcntr == 0) sr_in_av <= (|seq_sof[3:1]) || (|seq_eof[3:1]) || (|seq_eol_sol[7:1]);
        
        sof_sol_sent <= (bcntr == 0) && (seq_sof[1] || seq_eol_sol[1]);
    end
endmodule

