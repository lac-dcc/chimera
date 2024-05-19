// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_tiled_32_rd
 * @file cmd_encod_tiled_32_rd.v
 * @date 2015-02-218  
 * @author Andrey Filippov     
 *
 * @brief Command sequencer generator for reading a tiled area
 * up to 1 kB. Memory is mapped so 8 consecuitive rows have same RA, CA
 * and alternating BA (0 to 7). Data will be read in columns 32 bytes wide,
 * then proceding to the next column (if >1).
 * This is a modification of module: cmd_encod_tiled_32_rd,
 * just reading 32 bytes per row instead of the 16 - that eases timing
 * Start burst should be even (LSB is ignored)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_tiled_32_rd.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_tiled_32_rd.v is distributed in the hope that it will be useful,
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
1: Most tile heights cause timing violation. Valid height mod 8 can be 0,6,7 (1,2,3,4,5 - invalid - wrong - that was for tile16 mode)
2: With option "keep_open" there should be no page boundary crossings, caller only checks the first line, and if window full width
 is not multiple of CAS page, page crossings can appear on other than first line (fix caller to use largest common divider of page and
 frame full width? Seems easy to fix
*/

module  cmd_encod_tiled_32_rd #(
    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10,
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10,  // VDT BUG: CMD_DONE_BIT is used in a function call parameter!
    parameter FRAME_WIDTH_BITS=     13,  // Maximal frame width - 8-word (16 bytes) bursts 
    parameter RSEL=                 1'b1 // Late/early READ commands
) (
    input                        mrst,
    input                        clk,
// programming interface
    input                  [2:0] start_bank,    // bank address
    input   [ADDRESS_NUMBER-1:0] start_row,     // memory row
    input   [COLADDR_NUMBER-4:0] start_col,     // start memory column in 8-bit bursts 
    input [FRAME_WIDTH_BITS:0] rowcol_inc_in, // increment {row.col} when bank rolls over, removed 3 LSBs (in 8-bursts)
    input                  [5:0] num_rows_in_m1,   // number of rows to read minus 1 
    input                  [5:0] num_cols_in_m1,   // number of 32-pixel columns to read (rows first, then columns) - 1
                                                   //(for compatibility with cmd_encod_tiled, LSB will be ignored)
    input                        keep_open_in,  // keep banks open (for <=8 banks only
    input                        skip_next_page_in, // do not reset external buffer (continue)    
    input                        start,       // start generating commands
    output reg            [31:0] enc_cmd,     // encoded command SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_32_rd.enc_cmd_reg[11:9,7:5,2] is unused and will be removed from module cmd_encod_tiled_32_rd.
    output reg                   enc_wr,      // write encoded command
    output reg                   enc_done     // encoding finished
);
    localparam FULL_ADDR_NUMBER=ADDRESS_NUMBER+COLADDR_NUMBER; // excluding 3 CA lsb, but adding 3 bank
    localparam ROM_WIDTH=10;
    localparam ROM_DEPTH=4;
    
    localparam ENC_NOP=        0;
    localparam ENC_BUF_WR=     1;
    localparam ENC_DCI=        2;
    localparam ENC_SEL=        3;
    localparam ENC_CMD_SHIFT=  4; // [5:4] - command: 0 -= NOP, 1 - READ, 2 - PRECHARGE, 3 - ACTIVATE
    localparam ENC_PAUSE_SHIFT=6; // [7:6] - 2- bit pause (for NOP commandes)
    localparam ENC_PRE_DONE=   8;
    localparam ENC_BUF_PGNEXT= 9;
    
    localparam ENC_CMD_NOP=      0; // 2-bit locally encoded commands
    localparam ENC_CMD_READ=     1;
//    localparam ENC_CMD_PRECHARGE=2;
    localparam ENC_CMD_ACTIVATE= 2; // using autoprecharge, so no PRECHARGE is needed. When en_act==0, ENC_CMD_ACTIVATE-> ENC_CMD_NOP (delay should be 0)
//    localparam REPEAT_ADDR=3;
    localparam LOOP_FIRST=   4; // address of the first word in a loop
    localparam LOOP_LAST=    6; // address of the last word in a loop
    localparam CMD_NOP=      0; // 3-bit normal memory RCW commands (positive logic)
    localparam CMD_READ=     2;
//    localparam CMD_PRECHARGE=5;
    localparam CMD_ACTIVATE= 4;
//    localparam AUTOPRECHARGE_BIT=COLADDR_NUMBER;
    
    reg   [ADDRESS_NUMBER-1:0] row;     // memory row
    reg   [COLADDR_NUMBER-4:0] col;     // start memory column in 8-bursts SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_32_rd.col_reg[0] is unused and will be removed from module cmd_encod_tiled_32_rd.
    reg                  [2:0] bank;    // memory bank;
    reg                  [5:0] num_rows_m1;  // number of rows in a tile minus 1
    reg                  [5:0] num_cols128_m2;  // number of r16-byte columns in a tile  -2 (even columns) SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_32_rd.num_cols128_m2_reg[0] is unused and will be removed from module cmd_encod_tiled_32_rd.
//    reg  [FULL_ADDR_NUMBER-4:0] rowcol_inc; // increment {row.col} when bank rolls over, remove 3 LSBs (in 8-bursts)
    reg   [FRAME_WIDTH_BITS:0] rowcol_inc; // increment {row.col} when bank rolls over, remove 3 LSBs (in 8-bursts)
    
    reg                        keep_open;                        
    reg                        skip_next_page;
    reg                        gen_run;
//    reg                        gen_run_d; // to output "done"?
    reg        [ROM_DEPTH-1:0] gen_addr; // will overrun as stop comes from ROM
    
    reg        [ROM_WIDTH-1:0] rom_r; 
    wire                       pre_done;
    wire                 [1:0] rom_cmd;
    wire                 [1:0] rom_skip;
    wire                 [2:0] full_cmd;
//    reg                        done;
    
    reg [FULL_ADDR_NUMBER-4:0] top_rc; // top combined row,column,bank burst address (excludes 3 CA LSBs), valid/modified @pre_act
    reg                        first_col;
    reg                        last_col;
    wire                       pre_act; //1 cycle before optional ACTIVATE
    wire                       pre_read; //1 cycle before READ command
    reg                  [5:0] scan_row; // current row in a tile (valid @pre_act)
    reg                  [5:0] scan_col; // current 16-byte column in a tile (valid @pre_act) SuppressThisWarning VivadoSynthesis: [Synth 8-3332] Sequential element cmd_encod_tiled_32_rd.scan_col_reg[0] is unused and will be removed from module cmd_encod_tiled_32_rd.
    reg                        start_d; // start, delayed by 1 clocks
    wire                       last_row;
    reg [FULL_ADDR_NUMBER-1:0] row_col_bank;     // RA,CA, BA - valid @pre_act;
    wire   [COLADDR_NUMBER-1:0] col_bank;// CA, BA - valid @ pre_read; 
    
    wire                       enable_act;
    reg                       enable_autopre;
    
    wire                 [2:0] next_bank_w;
    wire [ADDRESS_NUMBER+COLADDR_NUMBER-4:0] next_rowcol_w; // next row/col when bank rolls over (in 8-bursts)
    
    reg                        loop_continue;

    wire [FULL_ADDR_NUMBER-1:0] row_col_bank_next_w;     // RA,CA, BA - valid @pre_act;
    assign row_col_bank_next_w= last_row?
                                {top_rc,bank}: // can not work if ACTIVATE is next after ACTIVATE in the last row (single-row tile)
                                (&row_col_bank[2:0]? // bank==7
                                      {next_rowcol_w,3'b0}:  
                                      {row_col_bank[FULL_ADDR_NUMBER-1:3],next_bank_w});
                                

    assign     pre_done=rom_r[ENC_PRE_DONE] && gen_run;
//    assign     rom_cmd=  rom_r[ENC_CMD_SHIFT+:2] & {enable_act,1'b1}; // disable bit 1 if activate is disabled (not the first column)
    assign     rom_cmd=  rom_r[ENC_CMD_SHIFT+:2]; //  & {enable_act,1'b1}; // disable bit 1 if activate is disabled (not the first column)
    assign     rom_skip= rom_r[ENC_PAUSE_SHIFT+:2];
    assign     full_cmd= (enable_act && rom_cmd[1])?CMD_ACTIVATE:(rom_cmd[0]?CMD_READ:CMD_NOP);
    
    assign last_row=       (scan_row==num_rows_m1);
    assign enable_act=     first_col || !keep_open; // TODO: do not forget to zero addresses too (or they will become pause/done)
    assign next_bank_w=    row_col_bank[2:0]+1; //bank+1;
    assign next_rowcol_w=row_col_bank[FULL_ADDR_NUMBER-1:3]+rowcol_inc;
    
    assign pre_act=        gen_run && rom_cmd[1]; //1 cycle before optional ACTIVATE
    assign pre_read=       rom_r[ENC_CMD_SHIFT]; //1 cycle before READ command
    
    
    always @ (posedge clk) begin
        if (mrst)          gen_run <= 0;
        else if (start_d)  gen_run<= 1; // delaying
        else if (pre_done) gen_run<= 0;
        
//        if (rst)           gen_run_d <= 0;
//        else               gen_run_d <= gen_run;

        if (mrst)       num_rows_m1 <= 0;                    
        else if (start) num_rows_m1 <= num_rows_in_m1;  // number of rows
        
        if (mrst)       num_cols128_m2 <= 0;
        else if (start)         num_cols128_m2 <= num_cols_in_m1 & ~1;  // number of r32-byte columns
        
        if (mrst)         start_d <=0;
        else             start_d <=  start;
        
        if (mrst)                     top_rc <= 0;
        else if (start_d)             top_rc <= {row,col}+2;
        else if (pre_act && last_row) top_rc <= top_rc+2; // may increment RA  

        if (mrst)                          row_col_bank <= 0;
        else if (start_d)                 row_col_bank <= {row,col,bank}; // TODO: Use start_col,... and start, not start_d?
        
        else if (pre_act)               row_col_bank <= row_col_bank_next_w; 
        

        if (mrst)                     scan_row <= 0;
        else if (start_d)             scan_row <= 0;
        else if (pre_act)             scan_row <= last_row?0:scan_row+1;
        
        if (mrst)                      scan_col <= 0;
        else if (start_d)             scan_col <= 0;
        else if (pre_act && last_row) scan_col <= scan_col+2; // for ACTIVATE, not for READ

        if (mrst)                     first_col <= 0;
        else if (start_d)             first_col <= 1;
        else if (pre_act && last_row) first_col  <= 0;

        if (mrst)                     last_col <= 0;
        else if (start_d)             last_col <= num_cols128_m2==0; // if single column - will start with 1'b1;
        else if (pre_act)             last_col <= (scan_col==num_cols128_m2); // too early for READ ?

        if (mrst)                     enable_autopre <= 0;
        else if (start_d)             enable_autopre <= 0;
        else if (pre_act)             enable_autopre <=  last_col || !keep_open; // delayed by 2 pre_act tacts form last_col, OK with a single column
        
        if (mrst)     loop_continue<=0;
        else loop_continue <=  (scan_col==num_cols128_m2) && last_row;                 
        
        if (mrst)                    gen_addr <= 0;
        else if (!start_d && !gen_run) gen_addr <= 0;
        else if ((gen_addr==LOOP_LAST) && !loop_continue) gen_addr <= LOOP_FIRST; // skip loop alltogeter
        else                         gen_addr <= gen_addr+1; // not in a loop
    end
    
    always @ (posedge clk) if (start) begin
        row<=start_row;
        col <= start_col & ~1;
        bank <= start_bank;
        rowcol_inc <= rowcol_inc_in;
        keep_open <= keep_open_in && (|num_cols_in_m1[5:3] == 0);
        skip_next_page <= skip_next_page_in;
    end
    
    // ROM-based (registered output) encoded sequence
    always @ (posedge clk) begin
        if (mrst)           rom_r <= 0; // TODO: make mrst cause gen_addr = 4'hf?
        else case (gen_addr)
            4'h0: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)  | (1 << ENC_NOP) | (1 << ENC_PAUSE_SHIFT); // here does not matter, just to work with masked ACTIVATE
            4'h1: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT);
            4'h2: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT) | (1 << ENC_NOP)         | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'h3: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
// loop:            
            4'h4: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'h5: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT) | (1 << ENC_NOP)         | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'h6: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
// end loop            
            4'h7: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'h8: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT) | (1 << ENC_NOP)         | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL);
            4'h9: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
// do not combine this NOP -  ENC_CMD_READ + ENC_NOP enables autoprecharge
            4'ha: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT)                          | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'hb: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PAUSE_SHIFT)                     | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'hc: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_DCI) | (RSEL << ENC_SEL) | (1 << ENC_BUF_PGNEXT); 
            4'hd: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (3 << ENC_PAUSE_SHIFT)                     | (1 << ENC_DCI);
            4'he: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PRE_DONE);
            default:rom_r <= 0;
       endcase
    end
    always @ (posedge clk) begin
        
        if (mrst)           enc_wr <= 0;
        else               enc_wr <= gen_run; //  || gen_run_d;
        
        if (mrst)           enc_done <= 0;
        else               enc_done <= enc_wr && !gen_run; // !gen_run_d;
        
        if (mrst)             enc_cmd <= 0;
//        else if ((rom_cmd==0) || (rom_cmd[1] && !enable_act)) enc_cmd <= func_encode_skip ( // encode pause
        else if (gen_run) begin
          if (rom_cmd[0] || (rom_cmd[1] && enable_act)) enc_cmd <= func_encode_cmd ( // encode non-NOP command
            rom_cmd[1]? // activate
            row_col_bank[FULL_ADDR_NUMBER-1:COLADDR_NUMBER]: // top combined row,column,bank burst address (excludes 3 CA LSBs), valid/modified @pre_act
                    {{ADDRESS_NUMBER-COLADDR_NUMBER-1{1'b0}},
                        enable_autopre & ~rom_r[ENC_NOP],
                        {col_bank[COLADDR_NUMBER-1:4],~rom_r[ENC_NOP]},
                        3'b0}, //  [14:0] addr;       // 15-bit row/column address
            rom_cmd[1]?
                row_col_bank[2:0]:
                col_bank[2:0],       //
            full_cmd[2:0],           //   rcw;        // RAS/CAS/WE, positive logic. full_cmd[0]==0 (never write/precharge) => enc_cmd_reg[11]==0
            1'b0,                    //   odt_en;     // enable ODT
            1'b0,                    //   cke;        // disable CKE
            rom_r[ENC_SEL],          //   sel;        // first/second half-cycle, other will be nop (cke+odt applicable to both)
            1'b0,                    //   dq_en;      // enable (not tristate) DQ  lines (internal timing sequencer for 0->1 and 1->0)
            1'b0,                    //   dqs_en;     // enable (not tristate) DQS lines (internal timing sequencer for 0->1 and 1->0)
            1'b0,                    //   dqs_toggle; // enable toggle DQS according to the pattern
            rom_r[ENC_DCI],          //   dci;        // DCI disable, both DQ and DQS lines (internal logic and timing sequencer for 0->1 and 1->0)
            rom_r[ENC_BUF_WR],       //   buf_wr;     // connect to external buffer (but only if not paused)
            1'b0,                    //   buf_rd;     // connect to external buffer (but only if not paused)     
            rom_r[ENC_NOP],          //   nop;        // add NOP after the current command, keep other data
            rom_r[ENC_BUF_PGNEXT] && !skip_next_page);     //   buf_rst;    // connect to external buffer (but only if not paused)
          else enc_cmd <= func_encode_skip ( // encode pause
            {{CMD_PAUSE_BITS-2{1'b0}},rom_skip[1:0]}, // skip;   // number of extra cycles to skip (and keep all the other outputs)
            pre_done, // done,                                     // end of sequence 
            3'b0,                    // bank (here OK to be any)
            1'b0,                    //   odt_en;     // enable ODT
            1'b0,                    //   cke;        // disable CKE
            rom_r[ENC_SEL],          //   sel;        // first/second half-cycle, other will be nop (cke+odt applicable to both)
            1'b0,                    //   dq_en;      // enable (not tristate) DQ  lines (internal timing sequencer for 0->1 and 1->0)
            1'b0,                    //   dqs_en;     // enable (not tristate) DQS lines (internal timing sequencer for 0->1 and 1->0)
            1'b0,                    //   dqs_toggle; // enable toggle DQS according to the pattern
            rom_r[ENC_DCI],          //   dci;        // DCI disable, both DQ and DQS lines (internal logic and timing sequencer for 0->1 and 1->0)
            rom_r[ENC_BUF_WR],       //   buf_wr;     // connect to external buffer (but only if not paused)
            1'b0,                    //   buf_rd;     // connect to external buffer (but only if not paused)
            rom_r[ENC_BUF_PGNEXT] && !skip_next_page);     //   buf_rst;    // connect to external buffer (but only if not paused)
        end
    end    
    fifo_2regs #(
        .WIDTH(COLADDR_NUMBER)
    ) fifo_2regs_i (
        .mrst  (mrst),                             // input
        .clk   (clk),                              // input
        .din   (row_col_bank[COLADDR_NUMBER-1:0]), // input[15:0] 
        .wr    (pre_act),                          // input
        .rd    (pre_read && !rom_r[ENC_NOP]),      // input - update only after the second READ
        .srst  (start_d),                          // input
        .dout  (col_bank)                          // output[15:0] 
    );

`include "includes/x393_mcontr_encode_cmd.vh" 
endmodule

