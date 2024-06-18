// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_buf_average
 * @file cmprs_buf_average.v
 * @date 2015-06-14  
 * @author Andrey Filippov     
 *
 * @brief Saves Y and C components to buffers, caculates averages
 * during write, then subtracts them during read and provides to
 * the after DCT to restore DC
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_buf_average.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_buf_average.v is distributed in the hope that it will be useful,
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
// TODO:Clean up even more - remove signals that are not related to calculating/subtracting averages
module  cmprs_buf_average#(
        parameter CMPRS_COLOR18 =           0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =           1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =            2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =               3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =           4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_MONO8 =             7  // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
)(
    input         xclk,   // global clock input, compressor single clock rate
    input         frame_en,
    input   [2:0] converter_type, // valid @ pre_first_in
    input         pre_first_in,     // marks the first input pixel from the external memory buffer
    input         yc_pre_first_out, // pre first output from color converter(s) to the Y/C buffers (was  pre_first_out)
    input  [ 1:0] bayer_phase,    // valid @ pre_first_in
    input         jp4_dc_improved,// valid @ pre_first_in
    input         hdr,            // valid @ pre_first_in
    input         subtract_dc_in, // valid @ pre_first_in: enable subtracting of DC component
    input         first_mb_in,    // valid @ pre_first_in - reading first macroblock
    input         last_mb_in,     // valid @ pre_first_in - reading last macroblock
                                    
    input  [ 7:0] yaddrw,
    input         ywe,
    input  [ 8:0] signed_y,
    input  [ 7:0] caddrw,
    input         cwe,
    input  [ 8:0] signed_c,
    output [ 9:0] dout,         // [9:0] data out (4:2:0) (signed, average=0)
    // When is it valid?
    output [ 8:0] avr,        // [8:0]    DC (average value) - RAM output, no register. For Y components 9'h080..9'h07f, for C - 9'h100..9'h0ff!
    output        dv,         // out data valid (will go high for at least 64 cycles)
    output        ds,         // single-cycle mark of the first_r pixel in a 64 (8x8) - pixel block
    output [ 2:0] tn,         // [2:0] tile number 0..3 - Y, 4 - Cb, 5 - Cr (valid with start)
    output reg    first,      // sending first_r MCU (valid @ ds)
    output reg    last,       // sending last_r MCU (valid @ ds)
// below signals valid at ds ( 1 later than tn, first_r, last_r)
    output  [2:0] component_num,    //[2:0] - component number (YCbCr: 0 - Y, 1 - Cb, 2 - Cr, JP4: 0-1-2-3 in sequence (depends on shift) 4 - don't use
    output        component_color,  // use color quantization table (YCbCR, jp4diff)
    output        component_first,   // first_r this component in a frame (DC absolute, otherwise - difference to previous)
    output reg    component_lastinmb // last_r component in a macroblock;
);

   wire    [5:0]   component_numsLS;  // component_num[0] vs tn
   wire    [5:0]   component_numsMS;  // component_num[1] vs tn
   wire    [5:0]   component_numsHS;  // component_num[2] vs tn
   wire    [5:0]   component_colorsS;  // use color quantization table (YCbCR, jp4diff)
   wire    [5:0]   component_firstsS; // first_r this component in a frame (DC absolute, otherwise - difference to previous)

   reg    [5:0]   component_numsL;  // component_num[0] vs tn
   reg    [5:0]   component_numsM;  // component_num[1] vs tn
   reg    [5:0]   component_numsH;  // component_num[2] vs tn
   reg    [5:0]   component_colors;  // use color quantization table (YCbCR, jp4diff)
   reg    [5:0]   component_firsts; // first_r this component in a frame (DC absolute, otherwise - difference to previous)

    // Y and C components buffer filled in by color conversion module

    reg   [1:0] wpage; // page (0/1) where data is being written to (both Y and CbCr)
    reg   [1:0] rpage; // page (0/1) from where data is sent out ( both Y and CbCr)
    reg   [8:0] raddr;          // output address of buffer memories (MSB selects Y(0)/CbCr(1))
    wire        four_blocks;    // decoded from converter_type
    reg         four_blocks_rd; // 4 blocks/macroblock, valid with raddr
    wire  [1:0] y_ren;          // read enable for Y buffer ([0] - ren, [1] - regen)
    wire  [1:0] c_ren;          // read enable for C buffer ([0] - ren, [1] - regen)
    reg         y_ren_r;              // regen for Y buffer
    reg         c_ren_r;              // regen for C buffer
    wire  [8:0] y_out;  // data output from Y block buffer, valid @
    wire  [8:0] c_out;  // data output from C block buffer, valid @
    wire        pre_subtract_dc;
    reg         subtract_dc;
    wire        pre_color_enable;
    reg         color_enable;
    wire        color_enable_d;// delay by 2 clocks to match data
    wire        pre_first_mb;    
    wire        pre_last_mb;    
        
// Copied from old code - check/fix it
    reg  [3:0] accYen;
    reg  [1:0] accCen;    // individual accumulator enable (includes clearing)
    reg  [3:0] accYfirst;
    reg  [1:0] accCfirst; // add to zero, instead of to acc @ acc*en 
    reg  [8:0] preAccY,  preAccC;     // registered data from color converters, matching acc selection latency 
    reg [14:0] accY0,accY1,accY2,accY3,accC0,accC1;
    reg        cs_first_out;
    wire       cs_first_out_late; // delay by 16 cycles - safe for overlap to set subrtact_dc mode
    reg  [5:0] accCntrY0,accCntrY1,accCntrY2,accCntrY3,accCntrC0,accCntrC1;
    wire [3:0] pre_accYdone;
    wire [1:0] pre_accCdone; // need to make sure that pre_accCdone do_r not happen with pre_accYdone
    reg  [3:0] accYrun;
    reg  [1:0] accCrun;
//    reg  [3:0] accYdone; // only bit 0 is used as a start of output
    reg        accYdone; // only bit 0 is used as a start of output
    reg        accYdoneAny;
    reg  [1:0] avrY_wa, pre_avrY_wa;
    reg        avrC_wa, pre_avrC_wa;
    reg        avrPage_wa, pre_avrPage_wa;
    reg        avr_we;        // Write to memory that stores average value
    reg  [8:0] avermem[0:15]; // average values memory -  2 pages (MSB) of 6 block values
    wire [3:0] avr_wa= {avrPage_wa,accYdoneAny?{1'b0,avrY_wa[1:0]}:{2'b10,avrC_wa}};
    reg  [3:0] avr_ra;  // read address for "average" memory
    reg  [8:0] avr_r;   // registered output data from average memory (simultaneouis with regsitered buffer data)
    // truncating average values
    wire [8:0] avrY_di= avrY_wa[1] ? (avrY_wa[0]?accY3[14:6]:accY2[14:6]):(avrY_wa[0]?accY1[14:6]:accY0[14:6]);
    wire [8:0] avrC_di= avrC_wa ?accC1[14:6]:accC0[14:6];

    reg  [1:0] buf_sel;
    reg  [9:0] pre_do;
    reg  [9:0] do_r;
    reg        dv_pre3; //3 cycles ahead of dv (data valid)
    reg        ds_pre3; //3 cycles ahead of ds (data strobe - first cycle of dv)

    reg        raddr_lastInBlock;
    reg        raddr_updateBlock; // first_r in block, after last_r also. Should be when *_r match the currently selected  converter for the macroblock
    reg        ccv_out_start_d; // ccv_out_start delayed by 1 clock to match time of raddr_updateBlock

    reg [ 2:0] converter_type_r;
    reg        ccv_out_start;    // find the best way to calculate (maybe just a common counter with different presets)
                                 // active 1 clk before start or reading blocks
    
    // accCntr* counters after the first value will be set to 1 (was 0 before)
    assign pre_accYdone[3:0] = {(accCntrY3[5:0] == 6'h3f) ? 1'b1 : 1'b0,
                                (accCntrY2[5:0] == 6'h3f) ? 1'b1 : 1'b0,
                                (accCntrY1[5:0] == 6'h3f) ? 1'b1 : 1'b0,
                                (accCntrY0[5:0] == 6'h3f) ? 1'b1 : 1'b0} & accYen[3:0];
    assign pre_accCdone[1:0] = {(accCntrC1[5:0] == 6'h3f) ? 1'b1 : 1'b0,
                                (accCntrC0[5:0] == 6'h3f) ? 1'b1 : 1'b0} & accCen[1:0];
                               
    assign y_ren={y_ren_r,!raddr[8]};                    
    assign c_ren={c_ren_r,raddr[8] && !raddr[7]};
    
    // assign output signals
    assign avr  = avr_r; // avermem[avr_ra[3:0]];
    assign dout =                do_r;
    assign tn[2:0] =           raddr[8:6];
// component_num,component_color,component_first for different converters vs tn (1 bit per tn (0..5)
    assign component_num[2:0]= {component_numsH[0],component_numsM[0],component_numsL[0]};
    assign component_color   = component_colors[0];
    assign component_first   = component_firsts[0];
    
    // Calculate average values for each block, count them to know when all 64 are ready, store trunctaed result in 9*16 memory                           
    always @ (posedge xclk) begin
        cs_first_out<= yc_pre_first_out;
        if (ywe) preAccY[8:0] <= signed_y[8:0];
        if (cwe) preAccC[8:0] <= signed_c[8:0];
        accYen[3:0] <= {4{frame_en & ywe}} & { yaddrw[7] &  yaddrw[6],
                                               yaddrw[7] &  ~yaddrw[6],
                                              ~yaddrw[7] &   yaddrw[6],
                                              ~yaddrw[7] &  ~yaddrw[6]};
        accCen[1:0] <= {2{frame_en & cwe}} & { caddrw[6],
                                              ~caddrw[6]};
        accYfirst[3:0] <= {4{cs_first_out}} | (accYfirst[3:0] & ~accYen[3:0]);
        accCfirst[1:0] <= {2{cs_first_out}} | (accCfirst[1:0] & ~accCen[1:0]);
        if (accYen[0]) accY0[14:0]<= (accYfirst[0]?15'h0:accY0[14:0]) + {{6{preAccY[8]}},preAccY[8:0]};
        if (accYen[1]) accY1[14:0]<= (accYfirst[1]?15'h0:accY1[14:0]) + {{6{preAccY[8]}},preAccY[8:0]};
        if (accYen[2]) accY2[14:0]<= (accYfirst[2]?15'h0:accY2[14:0]) + {{6{preAccY[8]}},preAccY[8:0]};
        if (accYen[3]) accY3[14:0]<= (accYfirst[3]?15'h0:accY3[14:0]) + {{6{preAccY[8]}},preAccY[8:0]};
        if (accCen[0]) accC0[14:0]<= (accCfirst[0]?15'h0:accC0[14:0]) + {{6{preAccC[8]}},preAccC[8:0]};
        if (accCen[1]) accC1[14:0]<= (accCfirst[1]?15'h0:accC1[14:0]) + {{6{preAccC[8]}},preAccC[8:0]};
        
        if      (!frame_en) accCntrY0[5:0]<= 6'h0;
        else if (accYen[0]) accCntrY0[5:0]<= (accYfirst[0]?6'h1:(accCntrY0[5:0]+1)); // was set to 0 before
        
        if      (!frame_en) accCntrY1[5:0]<= 6'h0;
        else if (accYen[1]) accCntrY1[5:0]<= (accYfirst[1]?6'h1:(accCntrY1[5:0]+1));
        
        if (!frame_en) accCntrY2[5:0]<= 6'h0;
        else if (accYen[2]) accCntrY2[5:0]<= (accYfirst[2]?6'h1:(accCntrY2[5:0]+1));
        
        if (!frame_en) accCntrY3[5:0]<= 6'h0;
        else if (accYen[3]) accCntrY3[5:0]<= (accYfirst[3]?6'h1:(accCntrY3[5:0]+1));
        
        if (!frame_en) accCntrC0[5:0]<= 6'h0;
        else if (accCen[0]) accCntrC0[5:0]<= (accCfirst[0]?6'h1:(accCntrC0[5:0]+1));
        
        if (!frame_en) accCntrC1[5:0]<= 6'h0;
        else if (accCen[1]) accCntrC1[5:0]<= (accCfirst[1]?6'h1:(accCntrC1[5:0]+1));
        
        accYrun[3:0] <= {4{frame_en}} & ((accYfirst[3:0] & accYen[3:0]) | (accYrun[3:0] & ~pre_accYdone[3:0]));
        accCrun[1:0] <= {2{frame_en}} & ((accCfirst[1:0] & accCen[1:0]) | (accCrun[1:0] & ~pre_accCdone[1:0]));
        
//        accYdone[3:0] <=  pre_accYdone[3:0] & accYrun[3:0];
        accYdone      <=  pre_accYdone[0] & accYrun[0];
        accYdoneAny   <=  |(pre_accYdone[3:0] & accYrun[3:0]);
        avr_we        <=  |(pre_accYdone[3:0] & accYrun[3:0]) || |(pre_accCdone[1:0] & accCrun[1:0]);
        
        // Delay write addresses to find write address of the block for which average value is recorded
        pre_avrY_wa[1:0] <= yaddrw[7:6];
        avrY_wa[1:0]     <= pre_avrY_wa[1:0];
        pre_avrC_wa      <= caddrw[  6];
        avrC_wa          <= pre_avrC_wa;
        pre_avrPage_wa   <= wpage[0];
        avrPage_wa       <= pre_avrPage_wa;
        
        if (avr_we)  avermem[avr_wa[3:0]] <= subtract_dc?(accYdoneAny?avrY_di[8:0]:avrC_di[8:0]):9'h0; 

    end
    
    always @(posedge xclk) begin
        if      (!frame_en)        wpage <= 0;
        else if (yc_pre_first_out) wpage <= wpage + 1; // will start from 1, not 0. Maybe changed to there strobe - end of writing

        if (!frame_en || pre_first_in) first <= 0;
        else if (ccv_out_start)        first <= pre_first_mb;

        if (ccv_out_start) begin
            rpage[1:0]   <=   wpage[1:0];
            four_blocks_rd <= four_blocks;
//            first <=       pre_first_mb;
            last <=        pre_last_mb;
            color_enable <=  pre_color_enable; // valid with address
        end
  
        // read buffers timing
        // Is it that raddr[8:7] == 2'b11 means "disable
        if  (!frame_en) raddr[8:0] <= 9'h180;
        else if (ccv_out_start) raddr[8:0] <= 0;
        else if (!raddr[8] || (!four_blocks_rd && !raddr[7])) raddr[8:0] <= raddr[8:0]+1; // for 4 blocks - count for 0,1; 6 blocks - 0,1,2
        
    // Reading output data and combining with the average values

        y_ren_r <= y_ren[0];                    
        c_ren_r <= c_ren[0];                    
        
        if (cs_first_out_late) subtract_dc <= pre_subtract_dc; 
        
        avr_ra[3:0] <= {rpage[0],raddr[8:6]}; 
        avr_r <= avermem[avr_ra[3:0]];

        buf_sel    <= {buf_sel[0],raddr[8]};
        pre_do[9:0] <= buf_sel[1]?(color_enable_d?({c_out[8],c_out[8:0]}-{avr[8],avr[8:0]}):10'b0):({y_out[8],y_out[8:0]}-{avr[8],avr[8:0]});
        do_r[9:0]   <= pre_do[9:0];
        
        raddr_lastInBlock <= frame_en && (raddr[5:0]==6'h3e);
        raddr_updateBlock <= raddr_lastInBlock || ccv_out_start;
        ccv_out_start_d <= ccv_out_start;
        
        if      (!frame_en)         dv_pre3 <= 0;
        else if (raddr_updateBlock) dv_pre3 <= !raddr[8] || (!four_blocks_rd && !raddr[7]);

        ds_pre3 <= raddr_updateBlock && (!raddr[8] || (!four_blocks_rd && !raddr[7]));
        
        // generate blobk type data        
    // Shift registers - generating block attributes to be used later in compressor
        if (raddr_updateBlock) begin
            if (ccv_out_start_d) begin // ccv_out_start_d valid with raddr_updateBlock
                component_numsL[5:0]  <= component_numsLS[5:0];
                component_numsM[5:0]  <= component_numsMS[5:0];
                component_numsH[5:0]  <= component_numsHS[5:0];
                component_colors[5:0] <= component_colorsS[5:0];
                component_firsts[5:0] <= pre_first_mb? component_firstsS[5:0]:6'h0; 
            end else begin
                component_numsL[5:0]  <= {1'b0,component_numsL[5:1]};
                component_numsM[5:0]  <= {1'b0,component_numsM[5:1]};
                component_numsH[5:0]  <= {1'b0,component_numsH[5:1]};
                component_colors[5:0] <= {1'b0,component_colors[5:1]};
                component_firsts[5:0] <= {1'b0,component_firsts[5:1]};
            end
        end
        component_lastinmb <= tn[0] && (four_blocks_rd? tn[1] : tn[2]); // last component in a macroblock;
    end
    
    // when to start reading out data from the buffer
    always @ (posedge xclk) if (pre_first_in)begin
        converter_type_r <= converter_type;
    end    
    always @ (posedge xclk) begin
        case (converter_type_r)
            CMPRS_COLOR18: ccv_out_start <= (yaddrw[7:0]==8'hc4); //TODO: adjust to minimal latency?
            CMPRS_COLOR20: ccv_out_start <= (yaddrw[7:0]==8'hc4); //TODO: adjust to minimal latency?
            CMPRS_MONO16:  ccv_out_start    <=  accYdone; //[0];
            CMPRS_JP4:     ccv_out_start    <=  accYdone; //[0];
            CMPRS_JP4DIFF: ccv_out_start    <=  accYdone; //[0];
            CMPRS_MONO8:   ccv_out_start    <=  accYdone; //[0];
            default:       ccv_out_start    <=  accYdone; //[0];
        endcase
    end    
    
    // delay from the start of data output from color converter to copy subtract_dc to be valid when average values are set
    dly_16 #(.WIDTH(1)) i_cs_first_out_late (.clk(xclk),.rst(1'b0), .dly(4'd15), .din(cs_first_out), .dout(cs_first_out_late));
    dly_16 #(.WIDTH(1)) i_color_enable_d    (.clk(xclk),.rst(1'b0), .dly( 4'd1), .din(color_enable), .dout(color_enable_d));
    dly_16 #(.WIDTH(1)) i_dv                (.clk(xclk),.rst(1'b0), .dly( 4'd2), .din(dv_pre3),      .dout(dv));
    dly_16 #(.WIDTH(1)) i_ds                (.clk(xclk),.rst(1'b0), .dly( 4'd2), .din(ds_pre3),      .dout(ds));

    cmprs_tile_mode2_decode #(
        .CMPRS_COLOR18   (CMPRS_COLOR18),
        .CMPRS_COLOR20   (CMPRS_COLOR20),
        .CMPRS_MONO16    (CMPRS_MONO16),
        .CMPRS_JP4       (CMPRS_JP4),
        .CMPRS_JP4DIFF   (CMPRS_JP4DIFF),
        .CMPRS_MONO8     (CMPRS_MONO8)
    ) cmprs_tile_mode2_decode_i (
        .xclk             (xclk), // input
        .pre_first_in     (pre_first_in), // input
        .converter_type   (converter_type), // input[2:0] 
        .bayer_phase      (bayer_phase), // input[1:0] 
        .jp4_dc_improved  (jp4_dc_improved), // input
        .hdr              (hdr), // input
        .subtract_dc_in   (subtract_dc_in), // input
        .first_mb_in      (first_mb_in), // input
        .last_mb_in       (last_mb_in), // input
        .four_blocks      (four_blocks), // output reg 
        .subtract_dc      (pre_subtract_dc), // output reg 
        .first_mb         (pre_first_mb), // output reg 
        .last_mb          (pre_last_mb),  // output reg 
        .color_enable     (pre_color_enable),     // prevent JPEG random colors
        .component_numsL  (component_numsLS), // output[5:0] reg 
        .component_numsM  (component_numsMS), // output[5:0] reg 
        .component_numsH  (component_numsHS), // output[5:0] reg 
        .component_colors (component_colorsS), // output[5:0] reg 
        .component_first  (component_firstsS) // output[5:0] reg 
    );

    ram18p_var_w_var_r #(
        .REGISTERS    (1), // will need to delay output strobe(s) by 1
        .LOG2WIDTH_WR (3),
        .LOG2WIDTH_RD (3),
        .DUMMY        (0)
    ) i_y_buff (
        .rclk         (xclk),                           // input
        .raddr        ({1'b0,rpage[1:0],raddr[7:0]}),  // input[11:0] 
        .ren          (y_ren[0]),                     // input // TODO: modify to read only when needed
        .regen        (y_ren[1]),                     // input
        .data_out     (y_out[8:0]),                    // output[8:0] 
        .wclk         (xclk),                           // input
        .waddr        ({1'b0,wpage[1:0],yaddrw[7:0]}), // input[11:0] 
        .we           (ywe),                           // input
        .web          (4'hf),                          // input[7:0] 
        .data_in      (signed_y[8:0])                  // input[9:0] 
    );

    ram18p_var_w_var_r #(
        .REGISTERS    (1), // will need to delay output strobe(s) by 1
        .LOG2WIDTH_WR (3),
        .LOG2WIDTH_RD (3),
        .DUMMY        (0)
    ) i_CrCb_buff (
        .rclk         (xclk),                           // input
        .raddr        ({1'b0,rpage[1:0],raddr[7:0]}),  // input[11:0] 
        .ren          (c_ren[0]),                      // input // TODO: modify to read only when needed
        .regen        (c_ren[1]),                      // input
        .data_out     (c_out[8:0]),                    // output[8:0] 
        .wclk         (xclk),                           // input
        .waddr        ({1'b0,wpage[1:0],caddrw[7:0]}), // input[11:0] 
        .we           (cwe),                           // input
        .web          (4'hf),                          // input[7:0] 
        .data_in      (signed_c[8:0])                      // input[71:0] 
    );


endmodule

