// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_tiled_wr
 * @file cmd_encod_tiled_wr.v
 * @date 2015-02-19  
 * @author Andrey Filippov     
 *
 * @brief Command sequencer generator for writing a tiled area
 * up to 1 kB.
 *
 * Memory is mapped so 8 consecuitive rows have same RA, CA
 * and alternating BA (0 to 7). Data will be read in columns 16 bytes wide,
 * then proceding to the next column (if >1).
 * If number of rows is less than 8 it is possible to use keep_open_in input,
 * then there will be no ACTIVATE in other than first column and 
 * AUTO RECHARGE will be applied only to the last column (single column OK).
 * if number of rows >=8, that port is ignored. If number of rows is less than
 * 5 (less for slower clock) without keep_open_in tRTP may be not matched.
 * Seems that actual tile heigt mod 8 should be only 0, 6 or7.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_tiled_wr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_tiled_wr.v is distributed in the hope that it will be useful,
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
/*
TODO  Comments from cmd_encod_tiled_rd, update
Minimal ACTIVATE period =4 Tcm or 10ns, so maximal no-miss rate is Tck=1.25 ns (800 MHz)
Minimal window of 4 ACTIVATE pulses - 16 Tck or 40 (40 ns), so one ACTIVATE per 8 Tck is still OK down to 1.25 ns
Reads are in 16-byte colums: 1 8-burst (16 bytes) in a row, then next row, bank inc first. Then (if needed) - next column
Number of rows should be >=5 (4 now for tCK=2.5ns to meet tRP (precharge to activate) of the same bank (tRP=13ns)
Can read less if just one column
TODO: Maybe allow less rows with different sequence (no autoprecharge/no activate?) Will not work if row crosses page boundary
number fo rows>1!

Known issues:
1: Most tile heights cause timing violation. Valid height mod 8 can be 0,6,7 (1,2,3,4,5 - invalid)
2: With option "keep_open" there should be no page boundary crossings, caller only checks the first line, and if window full width
 is not multiple of CAS page, page crossings can appear on other than first line (fix caller to use largest common divider of page and
 frame full width? Seems easy to fix
*/

module  cmd_encod_tiled_wr #(
    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10,
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10,  // VDT BUG: CMD_DONE_BIT is used in a function call parameter!
    parameter FRAME_WIDTH_BITS=     13,  // Maximal frame width - 8-word (16 bytes) bursts 
    parameter WSEL=                 1'b0
) (
    input                        mrst,
    input                        clk,
// programming interface
    input                  [2:0] start_bank,    // bank address
    input   [ADDRESS_NUMBER-1:0] start_row,     // memory row
    input   [COLADDR_NUMBER-4:0] start_col,     // start memory column in 8-bit bursts 
    input [FRAME_WIDTH_BITS:0] rowcol_inc_in, // increment {row.col} when bank rolls over, removed 3 LSBs (in 8-bursts)
    input                  [5:0] num_rows_in_m1,   // number of rows to read minus 1
    input                  [5:0] num_cols_in_m1,   // number of 16-pixel columns to read (rows first, then columns) - 1
    input                        keep_open_in,  // keep banks open (for <=8 banks only
    input                        skip_next_page_in, // do not reset external buffer (continue)    
    input                        start,       // start generating commands
    output reg            [31:0] enc_cmd,     // encoded command  SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_wr.enc_cmd_reg[11,9,6,4:3,1] is unused and will be removed from module cmd_encod_tiled_wr.
    output reg                   enc_wr,      // write encoded command
    output reg                   enc_done     // encoding finished
);
    localparam FULL_ADDR_NUMBER=ADDRESS_NUMBER+COLADDR_NUMBER; // excluding 3 CA lsb, but adding 3 bank
    localparam ROM_WIDTH=12;
    localparam ROM_DEPTH=4;
    localparam ENC_NOP=         0;
    localparam ENC_BUF_RD=      1;
    localparam ENC_DQS_TOGGLE=  2;
    localparam ENC_DQ_DQS_EN=   3;
    localparam ENC_SEL=         4;
    localparam ENC_ODT=         5;
    localparam ENC_CMD_SHIFT=   6; // [7:6] - command: 0 -= NOP, 1 - WRITE, 2 - PRECHARGE, 3 - ACTIVATE
    localparam ENC_PAUSE_SHIFT= 8; // [9:8] - 2- bit pause (for NOP commandes)
    localparam ENC_PRE_DONE=   10;
    localparam ENC_BUF_PGNEXT= 11;
    
    localparam ENC_CMD_NOP=      0; // 2-bit locally encoded commands
    localparam ENC_CMD_WRITE=    1;
    localparam ENC_CMD_ACTIVATE= 2;

    localparam LOOP_FIRST=   6; // address of the first word in a loop
    localparam LOOP_LAST=    7; // address of the last word in a loop
    
    localparam CMD_NOP=      0; // 3-bit normal memory RCW commands (positive logic)
    localparam CMD_WRITE=    3;
    localparam CMD_ACTIVATE= 4;
    
    
    reg   [ADDRESS_NUMBER-1:0] row;     // memory row
    reg   [COLADDR_NUMBER-4:0] col;     // start memory column in 8-bursts
    reg                  [2:0] bank;    // memory bank;
    reg                  [5:0] num_rows_m1;  // number of rows in a tile minus 1
    reg                  [5:0] num_cols128_m1;  // number of r16-byte columns in a tile  -1
    reg   [FRAME_WIDTH_BITS:0] rowcol_inc; // increment {row.col} when bank rolls over, remove 3 LSBs (in 8-bursts)
    
    reg                        keep_open;                        
    reg                        skip_next_page;
    reg                        gen_run;
//    reg                        gen_run_d; // to output "done"?
    reg        [ROM_DEPTH-1:0] gen_addr; // will overrun as stop comes from ROM
    
    reg        [ROM_WIDTH-1:0] rom_r; // SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_wr.rom_r_reg[8,0] is unused and will be removed from module cmd_encod_tiled_wr.
    wire                       pre_done;
    wire                 [1:0] rom_cmd;
    wire                 [1:0] rom_skip;
    wire                 [2:0] full_cmd;
//    reg                        done;
    
    reg [FULL_ADDR_NUMBER-4:0] top_rc; // top combined row,column,bank burst address (excludes 3 CA LSBs), valid/modified @pre_act
    reg                        first_col;
    reg                        last_col;
    wire                       pre_act; //1 cycle before optional ACTIVATE
    wire                       pre_write; //1 cycle before READ command
    reg                  [5:0] scan_row; // current row in a tile (valid @pre_act)
    reg                  [5:0] scan_col; // current 16-byte column in a tile (valid @pre_act)
    reg                        start_d; // start, delayed by 1 clocks
    wire                       last_row;
    reg [FULL_ADDR_NUMBER-1:0] row_col_bank;     // RA,CA, BA - valid @pre_act;
    wire   [COLADDR_NUMBER-1:0] col_bank;// CA, BA - valid @ pre_write; 
    
    wire                       enable_act;
    reg                        enable_autopre;
    
    wire                 [2:0] next_bank_w;
    wire [ADDRESS_NUMBER+COLADDR_NUMBER-4:0] next_rowcol_w; // next row/col when bank rolls over (in 8-bursts)
    
    reg                        loop_continue;

    wire [FULL_ADDR_NUMBER-1:0] row_col_bank_next_w;     // RA,CA, BA - valid @pre_act;
    
//    reg                       cut_buf_rd;
    
//    always @ (posedge clk) begin
//        if (!gen_run)                                         cut_buf_rd <= 0;
//        else if ((gen_addr==(LOOP_LAST-1)) &&  loop_continue) cut_buf_rd <= 1; //*******
//    end    
    
    assign row_col_bank_next_w= last_row?
                                {top_rc,bank}: // can not work if ACTIVATE is next after ACTIVATE in the last row (single-row tile)
                                (&row_col_bank[2:0]? // bank==7
                                      {next_rowcol_w,3'b0}:  
                                      {row_col_bank[FULL_ADDR_NUMBER-1:3],next_bank_w});
                                

    assign     pre_done=rom_r[ENC_PRE_DONE] && gen_run;
    assign     rom_cmd=  rom_r[ENC_CMD_SHIFT+:2]; //  & {enable_act,1'b1}; // disable bit 1 if activate is disabled (not the first column)
    assign     rom_skip= rom_r[ENC_PAUSE_SHIFT+:2];
    assign     full_cmd= (enable_act && rom_cmd[1]) ? CMD_ACTIVATE : (rom_cmd[0] ? CMD_WRITE : CMD_NOP);
    
    assign last_row=       (scan_row==num_rows_m1);
    assign enable_act=     first_col || !keep_open; // TODO: do not forget to zero addresses too (or they will become pause/done)
    assign next_bank_w=    row_col_bank[2:0]+1; //bank+1;
    assign next_rowcol_w=row_col_bank[FULL_ADDR_NUMBER-1:3]+rowcol_inc;
    
    assign pre_act=        gen_run && rom_cmd[1]; //1 cycle before optional ACTIVATE
    assign pre_write=       rom_r[ENC_CMD_SHIFT]; //1 cycle before READ command
    
    
    always @ (posedge clk) begin
        if      (mrst)     gen_run <= 0;
        else if (start_d)  gen_run<= 1; // delaying
        else if (pre_done) gen_run<= 0;
        
        if (mrst)           num_rows_m1 <= 0;                    
        else if (start)    num_rows_m1 <= num_rows_in_m1;  // number of rows
        
        if (mrst)           num_cols128_m1 <= 0;
        else if (start)    num_cols128_m1 <= num_cols_in_m1;  // number of r16-byte columns
        
        if (mrst)         start_d <=0;
        else             start_d <=  start;
        
        if (mrst)                      top_rc <= 0;
        else if (start_d)             top_rc <= {row,col}+1;
        else if (pre_act && last_row) top_rc <= top_rc+1; // may increment RA  

        if (mrst)                          row_col_bank <= 0;
        else if (start_d)                 row_col_bank <= {row,col,bank}; // TODO: Use start_col,... and start, not start_d?
        
        else if (pre_act)               row_col_bank <= row_col_bank_next_w; 
        

        if (mrst)                      scan_row <= 0;
        else if (start_d)             scan_row <= 0;
        else if (pre_act)             scan_row <= last_row?0:scan_row+1;
        
        if (mrst)                      scan_col <= 0;
        else if (start_d)             scan_col <= 0;
        else if (pre_act && last_row) scan_col <= scan_col+1; // for ACTIVATE, not for READ

        if (mrst)                      first_col <= 0;
        else if (start_d)             first_col <= 1;
        else if (pre_act && last_row) first_col  <= 0;

        if (mrst)                      last_col <= 0;
        else if (start_d)             last_col <= num_cols128_m1==0; // if single column - will start with 1'b1;
        else if (pre_act)             last_col <= (scan_col==num_cols128_m1); // too early for READ ?

        if (mrst)                      enable_autopre <= 0;
        else if (start_d)             enable_autopre <= 0;
        else if (pre_act)             enable_autopre <=  last_col || !keep_open; // delayed by 2 pre_act tacts form last_col, OK with a single column
        
        if (mrst)     loop_continue<=0;
        else loop_continue <=  (scan_col==num_cols128_m1) && last_row;                 
        
        if (mrst)                     gen_addr <= 0;
        else if (!start_d && !gen_run) gen_addr <= 0;
        else if ((gen_addr==LOOP_LAST) && !loop_continue) gen_addr <= LOOP_FIRST; // skip loop alltogeter
        else                         gen_addr <= gen_addr+1; // not in a loop
    end
    
    always @ (posedge clk) if (start) begin
        row<=start_row;
        col <= start_col;
        bank <= start_bank;
        rowcol_inc <= rowcol_inc_in;
        keep_open <= keep_open_in && (|num_cols_in_m1[5:3] == 0);
        skip_next_page <= skip_next_page_in;
    end
    
    // ROM-based (registered output) encoded sequence
    always @ (posedge clk) begin
        if (mrst)           rom_r <= 0;
        else case (gen_addr)
            4'h0: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) ; // here does not matter, just to work with masked ACTIVATE
            4'h1: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) ; 
            4'h2: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL); 
            4'h3: rom_r <= (ENC_CMD_WRITE <<     ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL) | (1 << ENC_ODT); 
            4'h4: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL) | (1 << ENC_ODT); 
            4'h5: rom_r <= (ENC_CMD_WRITE <<     ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            // start loop
            4'h6: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            4'h7: rom_r <= (ENC_CMD_WRITE <<     ENC_CMD_SHIFT)                          | (1 << ENC_BUF_RD) | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            // end loop
            4'h8: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT)                                              | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            4'h9: rom_r <= (ENC_CMD_WRITE <<     ENC_CMD_SHIFT)                      | (1 << ENC_BUF_PGNEXT) | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            4'ha: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (3 << ENC_PAUSE_SHIFT)                     | (WSEL << ENC_SEL) | (1 << ENC_ODT) | (1 << ENC_DQ_DQS_EN) | (1 << ENC_DQS_TOGGLE); 
            4'hb: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (3 << ENC_PAUSE_SHIFT); 
            4'hc: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PRE_DONE);
            default:rom_r <= 0;
       endcase
    end
    always @ (posedge clk) begin
        if (mrst)          enc_wr <= 0;
        else               enc_wr <= gen_run || gen_run; // gen_run_d; *****
        
        if (mrst)          enc_done <= 0;
        else               enc_done <= enc_wr && !gen_run; // !gen_run_d; *****
        
        if (mrst)          enc_cmd <= 0;
        else if (gen_run) begin
          if (rom_cmd[0] || (rom_cmd[1] && enable_act)) enc_cmd <= func_encode_cmd ( // encode non-NOP command
            rom_cmd[1]? // activate
            row_col_bank[FULL_ADDR_NUMBER-1:COLADDR_NUMBER]: // top combined row,column,bank burst address (excludes 3 CA LSBs), valid/modified @pre_act
                    {{ADDRESS_NUMBER-COLADDR_NUMBER-1{1'b0}},
                        enable_autopre,
                        col_bank[COLADDR_NUMBER-1:3],
                        3'b0}, //  [14:0] addr;       // 15-bit row/column address
            rom_cmd[1]?
                row_col_bank[2:0]:
                col_bank[2:0],        //
            full_cmd[2:0],           //   rcw;        // RAS/CAS/WE, positive logic
            rom_r[ENC_ODT],          //   odt_en;     // enable ODT
            1'b0,                    //   cke;        // disable CKE
            rom_r[ENC_SEL],          //   sel;        // first/second half-cycle, other will be nop (cke+odt applicable to both)
            rom_r[ENC_DQ_DQS_EN],    //   dq_en;      // enable (not tristate) DQ  lines (internal timing sequencer for 0->1 and 1->0)
            rom_r[ENC_DQ_DQS_EN],    //   dqs_en;     // enable (not tristate) DQS lines (internal timing sequencer for 0->1 and 1->0)
            rom_r[ENC_DQS_TOGGLE],   //   dqs_toggle; // enable toggle DQS according to the pattern
            1'b0,                    //   dci;        // DCI disable, both DQ and DQS lines (internal logic and timing sequencer for 0->1 and 1->0)
            1'b0,                    //   buf_wr;     // connect to external buffer (but only if not paused)
            rom_r[ENC_BUF_RD],         //   buf_rd;     // connect to external buffer (but only if not paused)     
            rom_r[ENC_NOP],          //   nop;        // add NOP after the current command, keep other data
            rom_r[ENC_BUF_PGNEXT] && !skip_next_page);//   buf_rst;    // connect to external buffer (but only if not paused)
          else enc_cmd <= func_encode_skip ( // encode pause
            {{CMD_PAUSE_BITS-2{1'b0}},rom_skip[1:0]}, // skip;   // number of extra cycles to skip (and keep all the other outputs)
            pre_done, // done,                                     // end of sequence 
            3'b0,                    // bank (here OK to be any)
            rom_r[ENC_ODT],          //   odt_en;     // enable ODT
            1'b0,                    //   cke;        // disable CKE
            rom_r[ENC_SEL],          //   sel;        // first/second half-cycle, other will be nop (cke+odt applicable to both)
            rom_r[ENC_DQ_DQS_EN],    //   dq_en;      // enable (not tristate) DQ  lines (internal timing sequencer for 0->1 and 1->0)
            rom_r[ENC_DQ_DQS_EN],    //   dqs_en;     // enable (not tristate) DQS lines (internal timing sequencer for 0->1 and 1->0)
            rom_r[ENC_DQS_TOGGLE],   //   dqs_toggle; // enable toggle DQS according to the pattern
            1'b0,                    //   dci;        // DCI disable, both DQ and DQS lines (internal logic and timing sequencer for 0->1 and 1->0)
            1'b0,                    //   buf_wr;     // connect to external buffer (but only if not paused)
            rom_r[ENC_BUF_RD],         // buf_rd;     // connect to external buffer (but only if not paused)     
            rom_r[ENC_BUF_PGNEXT] && !skip_next_page);// buf_rst;    // connect to external buffer (but only if not paused)
        end    
    end
    fifo_2regs #(
        .WIDTH(COLADDR_NUMBER)
    ) fifo_2regs_i (
        .mrst (mrst), // input
        .clk (clk), // input
        .din (row_col_bank[COLADDR_NUMBER-1:0]), // input[15:0] 
        .wr(pre_act), // input
        .rd(pre_write), // input
        .srst(start_d), // input
        .dout(col_bank) // output[15:0] 
    );
`include "includes/x393_mcontr_encode_cmd.vh" 
endmodule

