// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>huffman393
 * @file huffman393.v
 * @author Andrey Filippov     
 *
 * @brief Huffman encoder for JPEG compressor based on previous design that used
 * 2x clock. Superseded by huffman_stuffer_meta module.
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * huffman393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * huffman393.v is distributed in the hope that it will be useful,
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

`include "system_defines.vh" 
// 01/22/2004 - extended flush until ready (modified stuffer.v too)
module huffman393    (
    input             xclk,            // pixel clock, sync to incoming data
    input             xclk2x,          // twice frequency - uses negedge inside
    input             en,              // will reset if ==0 (sync to xclk)

    input             mclk,         // system clock to write tables
    input             tser_we,      // enable write to a  table
    input             tser_a_not_d, // address/not data distributed to submodules
    input      [ 7:0] tser_d,       // byte-wide serialized tables address/data to submodules
    
    input      [15:0] di,              // [15:0]    specially RLL prepared 16-bit data (to FIFO) (sync to xclk)
    input             ds,              // di valid strobe  (sync to xclk)
    input             rdy,             // receiver (bit stuffer) is ready to accept data
    output reg [15:0] do,              // [15:0]    output data
    output reg [ 3:0] dl,              // [3:0] data length (4'h0 is 'h16)
    output reg        dv,              // output data valid
    output reg        flush,           // last block done - flush the rest bits
    output reg        last_block,
    output reg        test_lbw,
    output            gotLastBlock,   // last block done - flush the rest bits
    input             clk_flush,      // other clock to generate synchronized 1-cycle flush_clk output   
    output            flush_clk,       // 1-cycle flush output @ clk_flush
    output            fifo_or_full     // FIFO output register full - just for debuging
);
`ifdef INFER_LATCHES
    reg    [15:0] hcode_latch;    // table output huffman code (1..16 bits)
    reg    [ 3:0] hlen_latch;        // table - code length only 4 LSBs are used, so 0 means 16
    reg    [ 7:0] haddr70_latch;
    reg           haddr8_latch;
    reg           tables_re_latch;
//    reg           stuffer_was_rdy_early_latch;
`else
    wire   [15:0] hcode_latch;    // table output huffman code (1..16 bits)
    wire   [ 3:0] hlen_latch;        // table - code length only 4 LSBs are used
    wire   [ 7:0] haddr70_latch;
    wire          haddr8_latch;
    wire          tables_re_latch;
//    wire          stuffer_was_rdy_early_latch;
`endif
    wire   [31:0] tables_out; // Only [19:0] are used
    reg    [ 7:0] haddr_r;    // index in huffman table    
    wire   [ 7:0] haddr_next;

    wire   [ 8:0] haddr = {haddr8_latch,haddr70_latch};    // index in huffman table     (after latches)
     
    wire   [15:0] fifo_o;
    reg           stuffer_was_rdy;
    wire          read_next;    // assigned depending on steps (each other cycle for normal codes, each for special 00/F0

    reg     [5:0] steps;
// first stage registers 
    reg     [5:0] rll;    // 2 MSBs - counter to send "f0" codes

// replacing SRL16 with FD as SRL has longer output delay from clock 
    reg     [3:0] rll1;
    reg     [3:0] rll2;
    reg           typeDC;
    reg           typeAC;
    reg    [11:0] sval;    // signed input value

    wire    [1:0] code_typ0;    // valid at steps[0]
    reg           tbsel_YC0;    // valid at steps[0] - 0 -Y table, 1 - CbCr
    reg     [1:0] code_typ1;
    reg     [1:0] code_typ2;
    reg           code_typ3;
    reg           code_typ4;
    reg           tbsel_YC1;
    reg           tbsel_YC2;
    reg           tbsel_YC3;

    reg    [15:0] out_bits;    // bits to send
    reg     [3:0] out_len;        // length of bits to send (4'h0 means 16)
//    wire          fifo_or_full;    // fifo output register full read_next
    wire          will_read;
    wire   [10:0] var_do;
    wire    [3:0] var_dl;
    wire    [3:0] var_dl_late;

    reg           dv0;

    reg           eob;
    wire          gotDC;
    wire          gotAC;
    wire          gotRLL;
    wire          gotEOB;
    wire          gotLastWord;
    wire          gotColor;

    wire          want_read; // as will_read, but w/o fifo status
    reg           ready_to_flush;    // read the last data from fifo
    reg           en2x; // en sync to xclk2x;


    wire          pre_dv;
    wire   [15:0] pre_bits;
    wire   [ 3:0] pre_len;

//    reg           twe_d; // table write enable (twe) delayed by 1 clock

    always @ (negedge xclk2x) en2x <= en;
    
    assign gotDC=         fifo_o[15] &&  fifo_o[14];
    assign gotAC=         fifo_o[15] && !fifo_o[14];
    assign gotRLL=        !fifo_o[15] && !fifo_o[12];
    assign gotEOB=        !fifo_o[15] &&  fifo_o[12];
    assign gotLastBlock=  fifo_o[15] &&  fifo_o[14] && fifo_o[12];
    assign gotLastWord=  !fifo_o[14] &&  fifo_o[12];    // (AC or RLL) and last bit set
    assign gotColor= fifo_o[13];

    always @(negedge xclk2x) stuffer_was_rdy <= !en2x || rdy; // stuffer ready shoud be on if !en (move to register?)for now]
//    wire          want_read_early;
   


    assign read_next= en2x && ((!steps[0] && !rll[5]) || eob ) && fifo_or_full; // fifo will never have data after the last block...
    assign will_read= stuffer_was_rdy && fifo_or_full && en2x && ((!steps[0] && !rll[5]) || eob ); // fifo will never have data after the last block...
    assign want_read= stuffer_was_rdy &&                         ((!steps[0] && !rll[5]) || eob ); // for FIFO
//    assign want_read_early= stuffer_was_rdy_early_latch && ((!steps[0] && !rll[5]) || eob ); // for FIFO

    always @ (negedge xclk2x) if (stuffer_was_rdy) begin
        eob <= read_next && gotEOB;// will be 1 only during step[0]

        if (!en2x) steps[5:0]    <= 'b0;
        else     steps[5:0]    <= {steps[4] && code_typ4, // will be skipped for codes 00/F0
                                   steps[3:0],
                                   (read_next && !(gotRLL && (fifo_o[5:4]==2'b00))) || rll[5] }; // will not start if it was <16, waiting for AC
    end
    always @ (negedge xclk2x)    begin
//        last_block <= en2x && (last_block?(!flush):(stuffer_was_rdy && will_read && gotLastBlock));
        
        if      (!en2x || flush)                               last_block <= 0;
        else if (stuffer_was_rdy && will_read && gotLastBlock) last_block <= 1;
        
        ready_to_flush <= en2x && (ready_to_flush?(!flush):(stuffer_was_rdy && last_block &&  will_read && gotLastWord));
        test_lbw <= en2x && last_block &&  gotLastWord;
// did not work if flush was just after not ready?
        flush    <= en2x &&( flush?(!rdy):(rdy && stuffer_was_rdy && ready_to_flush && !(|steps)) );
    end


    always @ (negedge xclk2x) if (will_read) begin
        typeDC               <= gotDC;
        typeAC               <= gotAC;
        sval[11:0]           <= fifo_o[11:0];
        if (gotDC) tbsel_YC0 <= gotColor;
    end
  

    always @ (negedge xclk2x) if (stuffer_was_rdy) begin
        if (!en2x || (read_next && gotAC) || (steps[0] && typeAC))             rll[5:4] <= 2'b0;
        else if (read_next && gotRLL)                                          rll[5:4] <= fifo_o[5:4];
        else if (rll[5:4]!=2'b00)                                              rll[5:4] <= rll[5:4]-1;
        
        if (!en2x || (read_next && !gotAC && !gotRLL) || (steps[0] && typeAC)) rll[3:0] <= 4'b0;
        else if (read_next && gotRLL)                                          rll[3:0] <= fifo_o[3:0];
    end

    assign code_typ0={typeDC || (!eob && (rll[5:4]==2'b0)),
                      typeDC || (!eob && (rll[5:4]!=2'b0))};

    assign haddr_next[7:0] = code_typ2[1]?
                                        (code_typ2[0]?{var_dl[3:0],4'hf}:       // DC (reusing the spare cells of the AC table)
                                                      {rll2[3:0],var_dl[3:0]}): // AC normal code
                                        (code_typ2[0]?8'hf0:                    //skip 16 zeros code
                                                      8'h00);                   //skip to end of block code

    always @ (negedge xclk2x) if (stuffer_was_rdy && steps[2]) begin    // may be just if (stuffer_was_rdy)
        haddr_r[7:0]    <= haddr_next[7:0];
    end


    assign pre_dv =         steps[4] || (steps[5] && (var_dl_late[3:0]!=4'b0));
    assign pre_bits[15:0]    = steps[5]?{5'b0,var_do[10:0]}:     hcode_latch[15:0];
    assign pre_len [ 3:0]    = steps[5]?      var_dl_late[ 3:0]: hlen_latch  [3:0];

`ifdef INFER_LATCHES
    always @* if (~xclk2x) hlen_latch <=  tables_out[19:16];
    always @* if (~xclk2x) hcode_latch <= tables_out[15:0];
//    always @* if (xclk2x)  stuffer_was_rdy_early_latch <= !en2x || rdy;
    always @* if (xclk2x)  tables_re_latch <= en2x && rdy;

    always @* if (xclk2x) begin
        if (stuffer_was_rdy) haddr8_latch <= tbsel_YC2;
        else                 haddr8_latch <= tbsel_YC3;
    end

    always @* if (xclk2x) begin
        if (stuffer_was_rdy && steps[2]) haddr70_latch <= haddr_next;
        else                             haddr70_latch <= haddr_r;
    end

`else
    latch_g_ce #(
        .WIDTH           (4),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (1) // inverted!
    ) latch_hlen_i (
        .rst     (1'b0),               // input
        .g       (xclk2x),             // input
        .ce      (1'b1),               // input
        .d_in    (tables_out[19:16]),  // input[0:0] 
        .q_out   (hlen_latch)          // output[0:0] 
    );

    latch_g_ce #(
        .WIDTH           (16),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (1) // inverted!
    ) latch_hcode_i (
        .rst     (1'b0),               // input
        .g       (xclk2x),             // input
        .ce      (1'b1),               // input
        .d_in    (tables_out[15:0]),   // input[0:0] 
        .q_out   (hcode_latch)         // output[0:0] 
    );
/*
    latch_g_ce #(
        .WIDTH           (1),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (0) // non-inverted!
    ) latch_stuffer_was_rdy_early_i (
        .rst     (1'b0),                        // input
        .g       (xclk2x),                      // input
        .ce      (1'b1),                        // input
        .d_in    (!en2x || rdy),                // input[0:0] 
        .q_out   (stuffer_was_rdy_early_latch)  // output[0:0] 
    );
*/
    latch_g_ce #(
        .WIDTH           (1),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (0) // non-inverted!
    ) latch_tables_re_i (
        .rst     (1'b0),                        // input
        .g       (xclk2x),                      // input
        .ce      (1'b1),                        // input
        .d_in    (en2x && rdy),                 // input[0:0] 
        .q_out   (tables_re_latch)              // output[0:0] 
    );

    latch_g_ce #(
        .WIDTH           (1),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (0) // non-inverted!
    ) latch_haddr8_re_i (
        .rst     (1'b0),                        // input
        .g       (xclk2x),                      // input
        .ce      (1'b1),                        // input
        .d_in    (stuffer_was_rdy ? tbsel_YC2 : tbsel_YC3), // input[0:0] 
        .q_out   (haddr8_latch)              // output[0:0] 
    );

    latch_g_ce #(
        .WIDTH           (8),
        .INIT            (0),
        .IS_CLR_INVERTED (0),
        .IS_G_INVERTED   (0) // non-inverted!
    ) latch_haddr70_re_i (
        .rst     (1'b0),                        // input
        .g       (xclk2x),                      // input
        .ce      (1'b1),                        // input
        .d_in    ((stuffer_was_rdy && steps[2]) ? haddr_next : haddr_r), // input[0:0] 
        .q_out   (haddr70_latch)              // output[0:0] 
    );
`endif


    always @ (negedge xclk2x) if (stuffer_was_rdy) begin
        dv0            <= pre_dv;
        out_bits[15:0] <= pre_bits[15:0];
        out_len [ 3:0] <= pre_len [ 3:0];
    end
    
    always @ (negedge xclk2x) if (!en2x || rdy) begin
        dv       <= stuffer_was_rdy? pre_dv:dv0;
        do[15:0] <= stuffer_was_rdy? pre_bits[15:0]:out_bits[15:0];
        dl[ 3:0] <= stuffer_was_rdy? pre_len [ 3:0]:out_len [ 3:0];
    end



// "Extract shift registers" in synthesis should be off! FD has lower output delay than SRL16
    always @ (negedge xclk2x) if (stuffer_was_rdy) begin
        code_typ1[1:0] <= code_typ0[1:0];
        code_typ2[1:0] <= code_typ1[1:0];
        code_typ3      <= code_typ2[1];
        code_typ4      <= code_typ3;
        rll1[3:0]      <= rll[3:0];
        rll2[3:0]      <= rll1[3:0];
        tbsel_YC1      <= tbsel_YC0;
        tbsel_YC2      <= tbsel_YC1;
        tbsel_YC3      <= tbsel_YC2;
    end
   
    
    wire          twe;
    wire  [15:0]  tdi;
    wire  [22:0]  ta;
    
  
     table_ad_receive #(
        .MODE_16_BITS (1),
        .NUM_CHN      (1)
    ) table_ad_receive_i (
        .clk       (mclk),              // input
        .a_not_d   (tser_a_not_d),      // input
        .ser_d     (tser_d),            // input[7:0] 
        .dv        (tser_we),           // input
        .ta        (ta),                // output[22:0] 
        .td        (tdi),               // output[15:0] 
        .twe       (twe)                // output
    );
  
  

    huff_fifo393 i_huff_fifo (
        .xclk            (xclk),            // input
        .xclk2x          (xclk2x),          // input
        .en              (en),              // input
        .di              (di[15:0]),        // input[15:0] data in (sync to xclk)
        .ds              (ds),              // input din valid (sync to xclk)
        .want_read       (want_read),       // input
//        .want_read_early (want_read_early), // input
        .dav             (fifo_or_full),    // output reg FIFO output register has data 
//        .q_latch         (fifo_o[15:0]));   // output[15:0] reg data (will add extra buffering if needed)
        .q               (fifo_o[15:0]));   // output[15:0] reg data (will add extra buffering if needed)

    varlen_encode393 i_varlen_encode(
        .clk      (xclk2x),           // input
        .en       (stuffer_was_rdy),  // input  will enable registers. 0 - freeze
        .start    (steps[0]),         // input
        .d        (sval[11:0]),       // input[11:0] 12-bit signed
        .l        (var_dl[ 3:0]),     // output[3:0] reg code length
        .l_late   (var_dl_late[3:0]), // output[3:0] reg
        .q        (var_do[10:0]));    // output[10:0] reg code
                                        
//   always @ (negedge xclk2x) twe_d <= twe;
//   always @ (posedge   sclk) twe_d <= twe;
/*   
   RAMB16_S18_S36 i_htab (
                          .DOA(),           // Port A 16-bit Data Output
                          .DOPA(),          // Port A 2-bit Parity Output
                          .ADDRA({ta[8:0],twe_d}),  // Port A 10-bit Address Input
                          .CLKA(!xclk2x),      // Port A Clock
                          .DIA(tdi[15:0]),  // Port A 16-bit Data Input
                          .DIPA(2'b0),      // Port A 2-bit parity Input
                          .ENA(1'b1),       // Port A RAM Enable Input
                          .SSRA(1'b0),      // Port A Synchronous Set/Reset Input
                          .WEA(twe | twe_d),// Port A Write Enable Input

                          .DOB({unused[11:0],tables_out[19:0]}),      // Port B 32-bit Data Output
                          .DOPB(),          // Port B 4-bit Parity Output
                          .ADDRB(haddr[8:0]),  // Port B 9-bit Address Input
                          .CLKB(xclk2x),       // Port B Clock
                          .DIB(32'b0),      // Port B 32-bit Data Input
                          .DIPB(4'b0),      // Port-B 4-bit parity Input
                          .ENB(tables_re_latch),  // PortB RAM Enable Input
                          .SSRB(1'b0),      // Port B Synchronous Set/Reset Input
                          .WEB(1'b0)        // Port B Write Enable Input
   );
*/

    ram18_var_w_var_r #(
        .REGISTERS(0),
        .LOG2WIDTH_WR(4),
        .LOG2WIDTH_RD(5),
        .DUMMY(0)
`ifdef PRELOAD_BRAMS
    `include "includes/huffman.dat.vh"
`endif
    ) i_htab (
        .rclk(xclk2x), // input
        .raddr(haddr[8:0]), // input[8:0] 
        .ren(tables_re_latch), // input
        .regen(1'b1), // input
//        .data_out({unused[11:0],tables_out[19:0]}), // output[31:0] 
        .data_out(tables_out), // output[31:0] 
        .wclk(mclk), // input
//        .waddr({ta[8:0],twe_d}), // input[9:0] 
//        .we(twe | twe_d), // input
        .waddr(ta[9:0]), // input[9:0] 
        .we   (twe), // input
        .web(4'hf), // input[3:0] 
        .data_in(tdi[15:0]) // input[15:0] 
    );
    
    pulse_cross_clock flush_clk_i (
        .rst       (!en2x),
        .src_clk   (~xclk2x),
        .dst_clk   (clk_flush),
        .in_pulse  (flush),
        .out_pulse (flush_clk),
        .busy      ());
    
endmodule

