// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>stuffer393
 * @file stuffer393.v
 * @author Andrey Filippov     
 *
 * @brief Bit stuffer for JPEG/JP4 compressor based on earlier design
 * Now used for comparison only, functionality is reimplemented in
 * bit_stuffer_metadata module.
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * stuffer393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * stuffer393.v is distributed in the hope that it will be useful,
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

`define debug_compressor
// 08.27.2005 - modified "rdy" - moved register to make it faster.
// 01.22.2004 - fixed bug if flush comes with !rdy (required mod of huffman.v to extend "flush" until ready)
// 02.05.2004 - modified data length output. It is 24 it ow, in bytes and is output as last 4 bytes in the
//              data block that is 32-byte DMA page aligned

// running on v8.2i - does not meet constraints with enabled global USE_SYNC_SET yes/auto because set input is slower. Trying to selectively disable it

// s ynthesis attribute use_sync_set of stuffer is no; 
// s ynthesis attribute use_sync_reset of stuffer is no; 
// s ynthesis attribute use_clock_enable of stuffer is no; 
// TODO:
// 1: Add FIFO buffer - with hclk on the read side
// 2: Get rid of imgptr - read addresses from the AFI module
// 3  Add multi-word status transmitter or just status transmit module for each compressor channel (29 bits are OK to read in multiple of 32-byte blocks
// Or make FIFO outside of the stuffer?

module stuffer393 (
//    input              rst,       // global reset
    input              mclk,
    input              mrst,       // @posedge mclk, sync reset
    input              xrst,       // @posedge xclk, sync reset
    input              last_block, //  use it to copy timestamp from fifo 
    
    
// time stamping - will copy time at the end of color_first (later than the first hact after vact in the current frame, but before the next one
// and before the data is needed for output 
    input              ts_pre_stb,  // @mclk - 1 cycle before receiving 8 bytes of timestamp data
    input        [7:0] ts_data,     // timestamp data (s0,s1,s2,s3,us0,us1,us2,us3==0)
    input              color_first, // @fradv_clk only used for timestamp
    input              fradv_clk,   // clock to synchronize color_first (leading edge to advance timestamp data for the output)
    
    input              clk,         // 2x pixel clock
    input              en_in,       // enable, 0- reset (other clock domain, needs re-sync)
    input              flush,       // flush output data (fill byte with 0, long word with 0
    input              abort,       // @ any, extracts 0->1 and flushes
    input              stb,         // input data strobe
    input        [3:0] dl,          // [3:0] number of bits to send (0 - 16) ??
    input       [15:0] d,           // [15:0] input data to shift (only lower bits are valid)
//    input       [31:0] sec,         // [31:0] number of seconds
//    input       [19:0] usec,        // [19:0] number of microseconds
    output             rdy,         // enable huffman encoder to proceed. Used as CE for many huffman encoder registers
    // outputs @ negedge clk
    output reg  [15:0] q,           // [15:0] output data
    output reg         qv,          // output data valid
    output             done,        // reset by !en, goes high after some delay after flushing
///    output reg  [23:0] imgptr,      // [23:0]image pointer in 32-byte chunks 
    output reg         flushing,
    output reg         running      // from registering timestamp until done
`ifdef DEBUG_RING
,   output reg [3:0]  dbg_etrax_dma
   ,output            dbg_ts_rstb
   ,output [7:0]      dbg_ts_dout

`endif        
    
`ifdef debug_stuffer
,      output reg   [3:0] etrax_dma_r // [3:0] just for testing
,       output reg   [3:0] test_cntr,
       output reg   [7:0] test_cntr1
       
`endif
);

`ifdef DEBUG_RING
   assign dbg_ts_rstb = ts_rstb; 
   assign dbg_ts_dout = ts_dout;
`endif   

//etrax_dma[3:0]
`ifdef debug_stuffer
    reg           en_d;
`endif
    reg           en; // re-clock en_in to match this clock
    reg     [2:0] abort_r;
    reg           force_flush;
    
    
    
    reg    [23:1] stage1;         //    stage 1 register (after right-shifting input data by 0..7 - actually left by 7..0)
    wire    [2:0] shift1;        // shift amount for stage 1
    reg     [4:0] stage1_bits;    // number of topmost invalid bits in stage1 register - 2 MSBs, use lower 3  stage2_bits
    reg     [4:0] stage1_length;  // number of bits (1..16) in stage 1 register

    wire          flush_end;
    reg           stage1_full;
    wire    [7:0] byteMask;
    wire   [31:1] longMask;    
    wire   [31:1] dflt_stage2;
    wire   [ 2:0] sel;
    wire   [ 1:0] st2m;
    wire   [31:1] st2_d;
    reg    [31:1] stage2;
    reg    [ 4:0] stage2_bits;
    wire          send8h;
    wire          send8l;
    wire          send8;
    reg           flush_end_delayed;   // update: fixed delay some delay after flush_end to ensure combining with output FIFO empty
    wire          pre_flush_end_delayed;    // some delay after flush_end to ensure combining with output FIFO empty
    reg    [23:0] size_count; //(now will be byte count)
     
// to make it faster - split in parts
    reg           inc_size_count2316;
    reg    [ 2:0] size_out;
    reg           size_out_over;// only needed with extra 32 bytes of zeroes added.
    reg           busy_eob;     // flushing and sending length
    reg           trailer;      // sending out data length and 32 bytes for ETRAX
    reg           was_trailer;  // sending out data length and 32 bytes for ETRAX
    reg           last_block_d; // last_block delayed by one clock
    reg    [ 3:0] etrax_dma;    // count words to make total size multiple of 32 bytes.
                                // Last 4 bytes of data will have actual length in bytes
                                // There will always be at least 4 more bytes (0-es) before length - needed for software
    reg           will_flush;   // next dv will be flushing byte/word
    wire          flush_now;
    wire          start_sizeout; //delay by 2 cycles

    reg           send8h_r;
    reg           send8l_r;

    wire          pre_stage2_bits_3;    // what will be registered to stage2_bits[3];
    wire    [4:3] willbe_stage1_bits;
    wire    [3:0] sum_lengths;
    reg     [1:0] st2m_r;
    
//    reg     [2:0] stb_time;
    reg    [31:0] sec_r;
    reg    [19:0] usec_r;
    reg           time_out;
    reg           time_size_out;
    wire          start_time_out;
    
// stb_time[2] - single-cycle pulse after color_first goes low 
    reg    [19:0] imgsz32; // current image size in multiples of 32-bytes
    reg           inc_imgsz32;
    // re-clock enable to this clock
    
    wire          ts_rstb; // one cycle before getting timestamp data from FIFO
    wire    [7:0] ts_dout; // timestamp data, byte at a time
//    reg     [7:0] ts_cycles; // 1-hot we for the portions of the 'old" timestamp registers
    reg     [6:0] ts_cycles; // 1-hot we for the portions of the 'old" timestamp registers
    
    reg           color_first_r; // registered with the same clock as color_first to extract leading edge
    wire          stb_start; // re-clocked  color_first
    
    
//    assign ts_rstb = trailer && !was_trailer;  // enough time to have timestamp data
    assign ts_rstb = last_block && !last_block_d;  // enough time to have timestamp data
    always @ (negedge clk) begin
        last_block_d <= last_block;
        ts_cycles <= {ts_cycles[5:0],ts_rstb};
        if      (ts_cycles[0])  sec_r[ 7: 0] <= ts_dout;
        else if (start_sizeout) sec_r[ 7: 0] <= size_count[ 7:0];
        else if (time_size_out) sec_r[ 7: 0] <= sec_r[23:16];
        
        if      (ts_cycles[1])  sec_r[15: 8] <= ts_dout;
        else if (start_sizeout) sec_r[15: 8] <= size_count[15:8];
        else if (time_size_out) sec_r[15: 8] <= sec_r[31:24];
        
        if      (ts_cycles[2])  sec_r[23:16] <= ts_dout;
        else if (start_sizeout) sec_r[23:16] <= size_count[23:16];
        else if (time_size_out) sec_r[23:16] <= usec_r[ 7: 0];

        if      (ts_cycles[3])  sec_r[31:24] <= ts_dout;
        else if (start_sizeout) sec_r[31:24] <= 8'hff;
        else if (time_size_out) sec_r[31:24] <= usec_r[15: 8];
        
        if      (ts_cycles[4]) usec_r[ 7: 0] <= ts_dout;
        else if (time_out)     usec_r[ 7: 0] <= {4'h0, usec_r[19:16]};
        
        if      (ts_cycles[5]) usec_r[15: 8] <= ts_dout;
        else if (time_out)     usec_r[15: 8] <= 8'h0;

        if      (ts_cycles[6]) usec_r[19:16] <= ts_dout[3:0];
        else if (time_out)     usec_r[19:16] <= 4'h0;
        
/*    
        stb_time[2:0] <= {stb_time[1] & ~stb_time[0], stb_time[0],color_first};
        if        (stb_time[2]) sec_r[31:0] <= sec[31:0];
        else if (start_sizeout) sec_r[31:0] <= {8'hff, size_count[23:0]};
        else if (time_size_out) sec_r[31:0] <= {usec_r[15:0],sec_r[31:16]};
        if   (stb_time[2]) usec_r[19:0] <= usec[19:0];
        else if (time_out) usec_r[19:0] <= {16'h0,usec_r[19:16]};
*/        
    end
    
    always @ (negedge clk) begin
        en <= en_in;
        // re-clock abort, extract leading edge
        abort_r <= {abort_r[0] & ~abort_r[1], abort_r[0], abort};
        if      (!en)       force_flush <= 0;
        else if (abort_r)   force_flush <= 1;
        else if (flush_end) force_flush <= 0;
        
        if      (!en)         running <= 0;
//        else if (stb_time[2]) running <= 1;
        else if (stb_start)   running <= 1;
        else if (flush_end)   running <= 0;
        
    end

    always @ (negedge clk)  begin
        flushing <= en && !flush_end && (((flush || force_flush) && rdy) || flushing);
    end
    
    wire    [4:0]    pre_stage1_bits;
    assign pre_stage1_bits[4:0]={2'b00,stage1_bits[2:0]} +  {(dl[3:0]==4'b0),dl[3:0]};
    
    always @ (negedge clk)    begin 
        if (!en || flush_end) stage1_bits[4:0] <= 5'b0;
        else if (stb && rdy) stage1_bits <= {(2'b10-pre_stage1_bits[4:3]),pre_stage1_bits[2:0]};
    end

    assign shift1[2:0]= stage1_bits[2:0] + dl[2:0];
    always @ (negedge clk) if (stb && rdy)    begin
        case (shift1[2:0])
            0: stage1[23:1]    <= {     d[15:0],7'b0};
            1: stage1[23:1]    <= {1'b0,d[15:0],6'b0};
            2: stage1[23:1]    <= {2'b0,d[15:0],5'b0};
            3: stage1[23:1]    <= {3'b0,d[15:0],4'b0};
            4: stage1[23:1]    <= {4'b0,d[15:0],3'b0};
            5: stage1[23:1]    <= {5'b0,d[15:0],2'b0};
            6: stage1[23:1]    <= {6'b0,d[15:0],1'b0};
            7: stage1[23:1]    <= {7'b0,d[15:0]     };
         endcase
        stage1_length[4:0]    <= {(dl[3:0]==4'b0),dl[3:0]};
    end


//*****************************
    always @ (negedge clk) begin
        if (!en) stage2_bits    <= 5'b0;
        else if (send8) stage2_bits[4:0] <= stage2_bits[4:0] - 8;
        else if (flushing && !stage1_full && !stage2_bits[4] && (stage2_bits[3:0]!=4'b0)) stage2_bits[4:0]<=5'h10;    // actual flushing to word size
        else        stage2_bits[4:0]    <= (rdy && stage1_full)? {1'b0,stage2_bits[3:0]}+stage1_length[4:0]:{1'b0,stage2_bits[3:0]};
    end

    assign        sum_lengths=stage2_bits[3:0]+stage1_length[3:0];
    assign pre_stage2_bits_3= en &&
                          (send8? (~stage2_bits[3]): (
                                  !(flushing && !stage1_full && !stage2_bits[4] && (stage2_bits[3:0]!=4'b0)) && // not flushing
                                  ((rdy && stage1_full)?sum_lengths[3]:    stage2_bits[3] )
                                  ));
    assign willbe_stage1_bits[4:3]={2{en && !flush_end}} & ((stb && rdy)?(2'b10-pre_stage1_bits[4:3]):stage1_bits[4:3]);
    

// accelerating rdy calculation - making it a register
    wire       pre_busy_eob=en && !flush_end_delayed && (busy_eob || (flush && rdy));
    wire [4:3] pre_stage2_bits_4_interm1=stage2_bits[4:3]-2'h1;
    wire [4:0] pre_stage2_bits_4_interm2={1'b0,stage2_bits[3:0]}+stage1_length[4:0];
    wire       pre_stage2_bits_4=en && (send8?
                                     (pre_stage2_bits_4_interm1[4]):
                                     ((flushing && !stage1_full && !stage2_bits[4] && (stage2_bits[3:0]!=4'b0))?
                                       (1'b1):
                                       (((rdy && stage1_full))?
                                         (pre_stage2_bits_4_interm2[4]):
                                         (1'b0)
                                       )
                                     )
                              );
    wire pre_send8h_r= (( send8h_r  &&  stage2_bits[4])?
                           (&stage2[23:16]):
                           ((!send8l_r  || !stage2_bits[4])?
                             (&((longMask[31:24] & st2_d[31:24]) | (~longMask[31:24] & dflt_stage2[31:24]))):
                             (send8h_r)
                           )
                         );

    wire pre_send8l_r= ((( send8h_r || send8l_r) &&  stage2_bits[4] )?
                        (&stage2[15:8]):
                        (&((longMask[23:16] & st2_d[23:16]) | (~longMask[23:16] & dflt_stage2[23:16])))
                       );

//Trying to delay rdy to make more room before it
    reg           rdy_rega;
    reg           rdy_regb;
    reg           rdy_regc;
    reg           rdy_regd;
// s ynthesis attribute use_sync_set of {module_name|signal_name|instance_name} [is] no; 
 
   always @ (negedge clk) begin
        rdy_rega <= !pre_stage2_bits_4;
        rdy_regb <= !pre_send8h_r;
        rdy_regc <= !pre_send8l_r;
        rdy_regd <= !pre_busy_eob;
        busy_eob <= pre_busy_eob;
//**********************************
        send8h_r<=pre_send8h_r;
        send8l_r<=pre_send8l_r;
    end
    assign rdy = (rdy_rega || (rdy_regb && rdy_regc)) && rdy_regd;
    
    assign send8h= send8h_r && stage2_bits[4];
    assign send8l= send8l_r && stage2_bits[4];
    assign send8=stage2_bits[4] && (send8h_r || send8l_r);

    always    @ (negedge clk) begin
        if (!en) stage1_full <= 1'b0;
/* TODO: MAke sure it is OK !! 05/12/2010 */
        else if (flushing) stage1_full <= 1'b0; //force flush does not turn off stb, in normal operation flushing is after last stb
        else if (rdy) stage1_full <=stb; //force flush does not turn off stb, in normal operation flushing is after last stb

    end
    assign    sel[2:0]=stage2_bits[2:0];
    assign    byteMask[7:0]=    {!sel[2] && !sel[1] && !sel[0],
                                 !sel[2] && !sel[1],
                                 !sel[2] && (!sel[1] || !sel[0]),
                                 !sel[2],
                                 !sel[2] || (!sel[1] && !sel[0]),
                                 !sel[2] || !sel[1],
                                 !sel[2] || !sel[1] || !sel[0],
                                 1'b1
                                 };

//TODO: Try to move stage1_full up here, this is the time-limiting path 05.26.2010
    assign    longMask[31:1]={{8{(flushing || stage1_full) && !stage2_bits[3]}} & byteMask[7:0],
                              {8{flushing || stage1_full}} & ({8{!stage2_bits[3]}} | byteMask[7:0]),
                              {8{stage1_full}},
                              {7{stage1_full}}};

    always @ (negedge clk) st2m_r[1:0]<=willbe_stage1_bits[4:3]-{1'b0,pre_stage2_bits_3};
    
    assign    st2m[1:0]=st2m_r[1:0];
    assign    st2_d[31:1]=    {{8{!flushing || stage1_full}} & (st2m[1]?{stage1[7:1],1'b0}:(st2m[0]? stage1[15:8]:     stage1[23:16])),
                               {8{!flushing || stage1_full}} & (st2m[1]? stage1[23:16]:    (st2m[0]?{stage1[7:1],1'b0}:stage1[15: 8])),
                               st2m[1]? stage1[15: 8]:    {stage1[7:1],1'b0},
                               {stage1[7:1]}};
    assign    dflt_stage2=stage2_bits[4]?{stage2[15:1],16'b0}:{stage2[31:1]};


always @ (negedge clk) begin
    if          (send8h) stage2[31:24] <= stage2[23:16];
    else if (send8l) stage2[31:24] <= 8'h00;
    else                  stage2[31:24] <= (longMask[31:24] & st2_d[31:24]) | (~longMask[31:24] & dflt_stage2[31:24]);
    if          (send8)  stage2[23:16] <= stage2[15:8];
    else                  stage2[23:16] <= (longMask[23:16] & st2_d[23:16]) | (~longMask[23:16] & dflt_stage2[23:16]);

    if          (send8)  stage2[15: 8] <= {stage2[7:1],1'b0};
    else                  stage2[15: 8] <= (longMask[15: 8] & st2_d[15: 8]) | (~longMask[15: 8] & dflt_stage2[15: 8]);

    if          (send8)  stage2[7:  1] <= 7'b0;
    else                  stage2[7:  1] <= (longMask[7: 1] & st2_d[7: 1]) | (~longMask[7: 1] & dflt_stage2[7: 1]);
end

// output stage
    assign   flush_end= !stage2_bits[4] && flushing && !stage1_full && (stage2_bits[3:0]==4'b0);
    assign flush_now= en && (!send8) && (flushing && !stage1_full && !stage2_bits[4]) && !will_flush;
`ifdef debug_stuffer
    reg [3:0] tst_done_dly;
`endif

    always @ (negedge clk) begin
 //reset_data_counters; // reset data transfer counters (only when DMA and compressor are disabled)
//        if (reset_data_counters ) etrax_dma[3:0] <= 0; // not needed to be reset after frame, and that was wrong (to early)
        if (!en ) etrax_dma[3:0] <= 0; // Now en here waits for flashing to end, so it should not be too early
        else if (qv) etrax_dma[3:0] <= etrax_dma[3:0] + 1;

// just for testing
`ifdef DEBUG_RING
   dbg_etrax_dma <= etrax_dma[3:0];
`endif        

`ifdef debug_stuffer
        en_d<= en;
        if (en) etrax_dma_r[3:0] <= etrax_dma[3:0];
        if    (done) test_cntr1[7:0] <= 0;
        else if (qv) test_cntr1[7:0] <= test_cntr1[7:0] +1 ; // normally should be one (done 1 ahead of end of qv)
        tst_done_dly[3:0] <= {tst_done_dly[2:0],done};
        if (tst_done_dly[1]) test_cntr[3:0] <= 0;
        else if (qv)         test_cntr[3:0] <= test_cntr[3:0] +1 ;
`endif
 

        size_out_over <= en && (size_out_over?(!done):size_out[0]);
  
        size_out[2:0]<={size_out[1:0],start_sizeout};
        time_out <= en && (start_time_out || (time_out && !(etrax_dma[3:2]== 2'h3)));
        time_size_out <= en && (start_time_out || (time_size_out && !(etrax_dma[3:1]== 3'h7)));
  
        trailer <= en && (trailer?(!flush_end_delayed):(flush_end));
        was_trailer<=trailer; 
        will_flush <= en && (will_flush?(!qv):(flush_now && (stage2_bits[3:0]!=4'b0)));
        if (flush_now) size_count[0] <= stage2_bits[3] ^ (|stage2_bits[2:0]); // odd number of bytes
        if (!en || size_out[2]) size_count[15:1] <= 0;
        else if (!trailer && !was_trailer && qv && (!will_flush || !size_count[0]))  size_count[15:1] <= size_count[15:1]+1;
        inc_size_count2316 <= (!trailer && !was_trailer && qv && (!will_flush || !size_count[0])) && (&size_count[15:1]);
//reset_data_counters instead of !en here?
        if      (!en || size_out[2]) size_count[23:16] <= 0;
        else if (inc_size_count2316) size_count[23:16] <= size_count[23:16]+1;

        qv <= en && (stage2_bits[4] || trailer);
// to make it faster (if needed) use a single register as a source for  q[15:0] in two following lines
        if      (time_size_out)  q[15:0] <= {sec_r[7:0],sec_r[15:8]};
        else                     q[15:0] <= {(stage2_bits[4]?stage2[31:24]:8'b0),
                                             ((stage2_bits[4] && !send8h)? stage2[23:16]:8'b0)};
        inc_imgsz32 <= (etrax_dma[3:0]== 4'h0) && qv;
//reset_data_counters instead of !en here?
//        if (reset_data_counters || done) imgsz32[19:0] <= 0;
        if (!en || done) imgsz32[19:0] <= 0; // now en is just for stuffer, waits for flushing to end
        else if (inc_imgsz32) imgsz32[19:0]<=imgsz32[19:0]+1;

///        if (reset_data_counters) imgptr[23:0] <= 0;
///        else if (done) imgptr[23:0] <= imgptr[23:0]+ imgsz32[19:0];
        
        flush_end_delayed <= en & pre_flush_end_delayed; // en just to prevent optimizing pre_flush_end_delayed+flush_end_delayed into a single SRL16
    end
//start_sizeout
    assign start_time_out= qv && trailer && (etrax_dma[3:0]== 4'h8) && !size_out_over;
    assign start_sizeout= time_out && (etrax_dma[3:0]== 4'hc);
// SRL16_1 i_pre_flush_end_delayed (.D(size_out[1]),.Q(pre_flush_end_delayed), .A0(1'b0), .A1(1'b1), .A2(1'b1), .A3(1'b1), .CLK(clk)); // dly=3+1    // rather arbitrary?
    dly_16 #(.WIDTH(1)) i_pre_flush_end_delayed(.clk(~clk),.rst(1'b0), .dly(4'd14), .din(size_out[1]), .dout(pre_flush_end_delayed));    // dly=14+1 // rather arbitrary?
    assign done = flush_end_delayed;

    // extract strart of frame run from different clock, re-clock from the source
    always @ (posedge fradv_clk) color_first_r <= color_first;
    pulse_cross_clock stb_start_i    (.rst(xrst), .src_clk(fradv_clk), .dst_clk(~clk), .in_pulse(!color_first && color_first_r), .out_pulse(stb_start),.busy());
    
    reg rst_nclk;
    always @ (negedge clk) rst_nclk <= xrst;
    timestamp_fifo timestamp_fifo_i (
//        .rst      (rst),       // input
        .sclk     (mclk),        // input
        .srst     (mrst),        // input
        .pre_stb  (ts_pre_stb),  // input
        .din      (ts_data),     // input[7:0] 
         // may use stb_start @ negedge clk
        .aclk     (~clk),        //fradv_clk),   // input
        .arst     (rst_nclk),        //fradv_clk),   // input
        
        .advance  (stb_start),   // color_first), // input
        .rclk     (~clk),        // input
        .rrst     (rst_nclk),    //fradv_clk),   // input
        .rstb     (ts_rstb),     // input
        .dout     (ts_dout)      // output[7:0] reg 
    );

endmodule
