// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_linear_rd
 * @file cmd_encod_linear_rd.v
 * @date 2015-01-23  
 * @author Andrey Filippov     
 *
 * @brief Command sequencer generator for reading a sequential up to 1KB page
 * single page access, bank and row will not be changed
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_linear_rd.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_linear_rd.v is distributed in the hope that it will be useful,
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

module  cmd_encod_linear_rd #(
//    parameter BASEADDR = 0,
    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10,
    parameter NUM_XFER_BITS=         6,    // number of bits to specify transfer length
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10, // VDT BUG: CMD_DONE_BIT is used in a function call parameter!
    parameter RSEL=                1'b1
) (
    input                        mrst,
    input                        clk,
// programming interface
//    input                  [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
//    input                        cmd_stb,     // strobe (with first byte) for the command a/d
    input                  [2:0] bank_in,     // bank address
    input   [ADDRESS_NUMBER-1:0] row_in,      // memory row
    input   [COLADDR_NUMBER-4:0] start_col,   // start memory column in 8-bursts
    input    [NUM_XFER_BITS-1:0] num128_in,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        skip_next_page_in, // do not reset external buffer (continue)    
    input                        start,       // start generating commands
    output reg            [31:0] enc_cmd,     // encoded command SuppressThisWarning VivadoSynthesis [Synth 8-3332] Sequential element cmd_encod_linear_rd.enc_cmd_reg[10:9,7:5,2] is unused and will be removed from module cmd_encod_linear_rd.
    output reg                   enc_wr,      // write encoded command
    output reg                   enc_done     // encoding finished
);
    localparam ROM_WIDTH=10;
    localparam ROM_DEPTH=4;
    
//    localparam ENC_BUF_PGNEXT=    0;
    localparam ENC_NOP=        0;
    localparam ENC_BUF_WR=     1;
    localparam ENC_DCI=        2;
    localparam ENC_SEL=        3;
    localparam ENC_CMD_SHIFT=  4; // [5:4] - command: 0 -= NOP, 1 - READ, 2 - PRECHARGE, 3 - ACTIVATE
    localparam ENC_PAUSE_SHIFT=6; // [7:6] - 2- bit pause (for NOP commandes)
    localparam ENC_PRE_DONE=   8;
    localparam ENC_BUF_PGNEXT=    9;
    
    localparam ENC_CMD_NOP=      0; // 2-bit locally encoded commands
    localparam ENC_CMD_READ=     1;
    localparam ENC_CMD_PRECHARGE=2;
    localparam ENC_CMD_ACTIVATE= 3;
    localparam REPEAT_ADDR=3;
    
    localparam CMD_NOP=      0; // 3-bit normal memory RCW commands (positive logic)
    localparam CMD_READ=     2;
    localparam CMD_PRECHARGE=5;
    localparam CMD_ACTIVATE= 4;
    
    reg   [ADDRESS_NUMBER-1:0] row;     // memory row
    reg   [COLADDR_NUMBER-4:0] col;     // start memory column (3 LSBs should be 0?) // VDT BUG: col is used as a function call parameter!
    reg                  [2:0] bank;    // memory bank;
    reg    [NUM_XFER_BITS-1:0] num128;  // number of 128-bit words to transfer
    reg                        skip_next_page;
    reg                        gen_run;
//    reg                        gen_run_d;
    reg        [ROM_DEPTH-1:0] gen_addr; // will overrun as stop comes from ROM
    
    reg        [ROM_WIDTH-1:0] rom_r; // SuppressThisWarning VivadoSynthesis [Synth 8-3332] Sequential element cmd_encod_linear_rd.rom_r_reg[0] is unused and will be removed from module cmd_encod_linear_rd.
    wire                       pre_done;
    wire                 [1:0] rom_cmd;
    wire                 [1:0] rom_skip;
    wire                 [2:0] full_cmd;
//    reg                        done;

    assign     pre_done=rom_r[ENC_PRE_DONE] && gen_run;
    assign     rom_cmd=  rom_r[ENC_CMD_SHIFT+:2];
    assign     rom_skip= rom_r[ENC_PAUSE_SHIFT+:2];
    assign     full_cmd= rom_cmd[1]?(rom_cmd[0]?CMD_ACTIVATE:CMD_PRECHARGE):(rom_cmd[0]?CMD_READ:CMD_NOP);
    
    always @ (posedge clk) begin
        if (mrst)          gen_run <= 0;
        else if (start)    gen_run<= 1;
        else if (pre_done) gen_run<= 0;
        

        if      (mrst)               gen_addr <= 0;
        else if (!start && !gen_run) gen_addr <= 0;
///        else if ((gen_addr==(REPEAT_ADDR-1)) && (num128[NUM_XFER_BITS-1:1]==0)) gen_addr <= REPEAT_ADDR+1; // skip loop alltogeter
// AF 2015/09/12 : num128[NUM_XFER_BITS-1:0] == 0 for the full 64-bursts!
        else if ((gen_addr==(REPEAT_ADDR-1)) && (num128[NUM_XFER_BITS-1:0] == 1)) gen_addr <= REPEAT_ADDR+1; // skip loop alltogeter
        else if ((gen_addr !=REPEAT_ADDR) || (num128[NUM_XFER_BITS-1:1]==0)) gen_addr <= gen_addr+1; // not in a loop
//counting loops?        
        if      (mrst)         num128 <= 0;
        else if (start)        num128 <= num128_in;
        else if (!gen_run)     num128 <= 0; //
        else if ((gen_addr == (REPEAT_ADDR-1)) || (gen_addr == REPEAT_ADDR))  num128 <= num128 -1;
    end
    
    always @ (posedge clk) if (start) begin
        row<=row_in;
//        col <= start_col;
        bank <= bank_in;
        skip_next_page <= skip_next_page_in;
    end
    always @ (posedge clk) begin
        if (start) col <= start_col;
        else if (rom_cmd==ENC_CMD_READ) col <= col+1;
    end
    
    // ROM-based (registered output) encoded sequence
    always @ (posedge clk) begin
        if (mrst)          rom_r <= 0;
        else case (gen_addr)
            4'h0: rom_r <= (ENC_CMD_ACTIVATE <<  ENC_CMD_SHIFT); 
            4'h1: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PAUSE_SHIFT); 
            4'h2: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT) | (1 << ENC_NOP)         | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL); 
            4'h3: rom_r <= (ENC_CMD_READ <<      ENC_CMD_SHIFT) | (1 << ENC_NOP)         | (1 << ENC_BUF_WR) | (1 << ENC_DCI) | (RSEL << ENC_SEL);
            4'h4: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PAUSE_SHIFT)                     | (1 << ENC_DCI) | (RSEL << ENC_SEL);
            4'h5: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_BUF_PGNEXT)                      | (1 << ENC_DCI) | (RSEL << ENC_SEL);
            4'h6: rom_r <= (ENC_CMD_PRECHARGE << ENC_CMD_SHIFT)                                              | (1 << ENC_DCI);
            4'h7: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (2 << ENC_PAUSE_SHIFT)                     | (1 << ENC_DCI);
            4'h8: rom_r <= (ENC_CMD_NOP <<       ENC_CMD_SHIFT) | (1 << ENC_PRE_DONE);
            default:rom_r <= 0;
       endcase
    end
    always @ (posedge clk) begin
        
        if (mrst)          enc_wr <= 0;
        else               enc_wr <= gen_run; //  || gen_run_d;
        
        if (mrst)          enc_done <= 0;
        else               enc_done <= enc_wr && !gen_run; // !gen_run_d;
        
        if (mrst)          enc_cmd <= 0;
        else if (gen_run) begin
          if (rom_cmd==0) enc_cmd <= func_encode_skip ( // encode pause
            {{CMD_PAUSE_BITS-2{1'b0}},rom_skip[1:0]}, // skip;   // number of extra cycles to skip (and keep all the other outputs)
            pre_done, // done,                                     // end of sequence 
            bank[2:0],                                // bank (here OK to be any)
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
          else  enc_cmd <= func_encode_cmd ( // encode non-NOP command
            rom_cmd[1]?
                    row:
                    {{ADDRESS_NUMBER-COLADDR_NUMBER{1'b0}},col[COLADDR_NUMBER-4:0],3'b0}, //  [14:0] addr;       // 15-bit row/column address
            bank[2:0],                                // bank (here OK to be any)
            full_cmd[2:0],           //   rcw;        // RAS/CAS/WE, positive logic
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
            rom_r[ENC_BUF_PGNEXT] && !skip_next_page);  //   buf_rst;    // connect to external buffer (but only if not paused)
        end
    end    
    
// move to include?
`include "includes/x393_mcontr_encode_cmd.vh" 
endmodule

