// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_encod_linear_mux
 * @file cmd_encod_linear_mux.v
 * @date 2015-01-31  
 * @author Andrey Filippov     
 *
 * @brief Multiplex parameters from multiple channels sharing the same
 * linear command encoders (cmd_encod_linear_rd and cmd_encod_linear_wr)
 * Latency 1 clcok cycle
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_encod_linear_mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_encod_linear_mux.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" 
module  cmd_encod_linear_mux#(
    parameter ADDRESS_NUMBER=       15,
    parameter COLADDR_NUMBER=       10
) (
    input                        clk,
`ifdef def_scanline_chn0
    input                  [2:0] bank0,      // bank address
    input   [ADDRESS_NUMBER-1:0] row0,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col0, // start memory column in 8-bursts
    input                  [5:0] num128_0,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial0,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn0
        input                        start0_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn0
        input                        start0_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn1
    input                  [2:0] bank1,      // bank address
    input   [ADDRESS_NUMBER-1:0] row1,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col1, // start memory column in 8-bursts
    input                  [5:0] num128_1,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial1,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn1
        input                        start1_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn1
        input                        start1_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn2
    input                  [2:0] bank2,      // bank address
    input   [ADDRESS_NUMBER-1:0] row2,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col2, // start memory column in 8-bursts
    input                  [5:0] num128_2,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial2,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn2
        input                        start2_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn2
        input                        start2_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn3
    input                  [2:0] bank3,      // bank address
    input   [ADDRESS_NUMBER-1:0] row3,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col3, // start memory column in 8-bursts
    input                  [5:0] num128_3,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial3,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn3
        input                        start3_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn3
        input                        start3_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn4
    input                  [2:0] bank4,      // bank address
    input   [ADDRESS_NUMBER-1:0] row4,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col4, // start memory column in 8-bursts
    input                  [5:0] num128_4,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial4,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn4
        input                        start4_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn4
        input                        start4_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn5
    input                  [2:0] bank5,      // bank address
    input   [ADDRESS_NUMBER-1:0] row5,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col5, // start memory column in 8-bursts
    input                  [5:0] num128_5,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial5,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn5
        input                        start5_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn5
        input                        start5_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn6
    input                  [2:0] bank6,      // bank address
    input   [ADDRESS_NUMBER-1:0] row6,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col6, // start memory column in 8-bursts
    input                  [5:0] num128_6,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial6,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn6
        input                        start6_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn6
        input                        start6_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn7
    input                  [2:0] bank7,      // bank address
    input   [ADDRESS_NUMBER-1:0] row7,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col7, // start memory column in 8-bursts
    input                  [5:0] num128_7,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial7,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn7
        input                        start7_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn7
        input                        start7_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn8
    input                  [2:0] bank8,      // bank address
    input   [ADDRESS_NUMBER-1:0] row8,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col8, // start memory column in 8-bursts
    input                  [5:0] num128_8,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial8,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn8
        input                        start8_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn8
        input                        start8_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn9
    input                  [2:0] bank9,      // bank address
    input   [ADDRESS_NUMBER-1:0] row9,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col9, // start memory column in 8-bursts
    input                  [5:0] num128_9,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial9,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn9
        input                        start9_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn9
        input                        start9_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn10
    input                  [2:0] bank10,      // bank address
    input   [ADDRESS_NUMBER-1:0] row10,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col10, // start memory column in 8-bursts
    input                  [5:0] num128_10,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial10,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn10
        input                        start10_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn10
        input                        start10_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn11
    input                  [2:0] bank11,      // bank address
    input   [ADDRESS_NUMBER-1:0] row11,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col11, // start memory column in 8-bursts
    input                  [5:0] num128_11,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial11,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn11
        input                        start11_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn11
        input                        start11_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn12
    input                  [2:0] bank12,      // bank address
    input   [ADDRESS_NUMBER-1:0] row12,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col12, // start memory column in 8-bursts
    input                  [5:0] num128_12,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial12,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn12
        input                        start12_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn12
        input                        start12_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn13
    input                  [2:0] bank13,      // bank address
    input   [ADDRESS_NUMBER-1:0] row13,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col13, // start memory column in 8-bursts
    input                  [5:0] num128_13,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial13,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn13
        input                        start13_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn13
        input                        start13_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn14
    input                  [2:0] bank14,      // bank address
    input   [ADDRESS_NUMBER-1:0] row14,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col14, // start memory column in 8-bursts
    input                  [5:0] num128_14,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial14,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn14
        input                        start14_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn14
        input                        start14_wr,   // start generating memory write channel commands
    `endif
`endif
`ifdef def_scanline_chn15
    input                  [2:0] bank15,      // bank address
    input   [ADDRESS_NUMBER-1:0] row15,       // memory row
    input   [COLADDR_NUMBER-4:0] start_col15, // start memory column in 8-bursts
    input                  [5:0] num128_15,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    input                        partial15,    // first of the two halves of a split tile (caused by memory page crossing)    
    `ifdef def_read_mem_chn15
        input                        start15_rd,   // start generating memory read channel commands
    `endif
    `ifdef def_write_mem_chn15
        input                        start15_wr,   // start generating memory write channel commands
    `endif
`endif
    output                  [2:0] bank,       // bank address
    output   [ADDRESS_NUMBER-1:0] row,        // memory row
    output   [COLADDR_NUMBER-4:0] start_col,  // start memory column in 8-bursts
    output                  [5:0] num128,     // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    output                        partial,    // first of the two halves of a split tile (caused by memory page crossing)    
    output                        start_rd,   // start generating commands in cmd_encod_linear_rd
    output                        start_wr    // start generating commands in cmd_encod_linear_wr
);
    reg                     [2:0] bank_r;     // bank address
    reg      [ADDRESS_NUMBER-1:0] row_r;      // memory row
    reg      [COLADDR_NUMBER-4:0] start_col_r;// start memory column in 8-bursts
    reg                     [5:0] num128_r;   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    reg                           partial_r;
    reg                           start_rd_r;    // start generating commands
    reg                           start_wr_r;    // start generating commands

    wire                    [2:0] bank_w;     // bank address
    wire     [ADDRESS_NUMBER-1:0] row_w;      // memory row
    wire     [COLADDR_NUMBER-4:0] start_col_w;// start memory column in 8-bursts
    wire                    [5:0] num128_w;   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
    wire                          partial_w;
    wire                          start_rd_w;    // start generating commands
    wire                          start_wr_w;    // start generating commands
   
    localparam PAR_WIDTH=3+ADDRESS_NUMBER+COLADDR_NUMBER-3+6+1;
    localparam [PAR_WIDTH-1:0] PAR_DEFAULT=0;
    assign bank =      bank_r;
    assign row =       row_r;
    assign start_col = start_col_r;
    assign num128 =    num128_r;
    assign partial=    partial_r;
    assign start_rd =     start_rd_r;
    assign start_wr =     start_wr_r;
    
    assign start_rd_w= 0
    `ifdef def_scanline_chn0
        `ifdef def_read_mem_chn0
            | start0_rd
        `endif
    `endif
    `ifdef def_scanline_chn1
        `ifdef def_read_mem_chn1
            | start1_rd
        `endif
    `endif
    `ifdef def_scanline_chn2
        `ifdef def_read_mem_chn2
            | start2_rd
        `endif
    `endif
    `ifdef def_scanline_chn3
        `ifdef def_read_mem_chn3
            | start3_rd
        `endif
    `endif
    `ifdef def_scanline_chn4
        `ifdef def_read_mem_chn4
            | start4_rd
        `endif
    `endif
    `ifdef def_scanline_chn5
        `ifdef def_read_mem_chn5
            | start5_rd
        `endif
    `endif
    `ifdef def_scanline_chn6
        `ifdef def_read_mem_chn6
            | start6_rd
        `endif
    `endif
    `ifdef def_scanline_chn7
        `ifdef def_read_mem_chn7
            | start7_rd
        `endif
    `endif
    `ifdef def_scanline_chn8
        `ifdef def_read_mem_chn8
            | start8_rd
        `endif
    `endif
    `ifdef def_scanline_chn9
        `ifdef def_read_mem_chn9
            | start9_rd
        `endif
    `endif
    `ifdef def_scanline_chn10
        `ifdef def_read_mem_chn10
            | start10_rd
        `endif
    `endif
    `ifdef def_scanline_chn11
        `ifdef def_read_mem_chn11
            | start11_rd
        `endif
    `endif
    `ifdef def_scanline_chn12
        `ifdef def_read_mem_chn12
            | start12_rd
        `endif
    `endif
    `ifdef def_scanline_chn13
        `ifdef def_read_mem_chn13
            | start13_rd
        `endif
    `endif
    `ifdef def_scanline_chn14
        `ifdef def_read_mem_chn14
            | start14_rd
        `endif
    `endif
    `ifdef def_scanline_chn15
        `ifdef def_read_mem_chn15
            | start15_rd
        `endif
    `endif
    ;
    
    assign start_wr_w= 0
    `ifdef def_scanline_chn0
        `ifdef def_write_mem_chn0
            | start0_wr
        `endif
    `endif
    `ifdef def_scanline_chn1
        `ifdef def_write_mem_chn1
            | start1_wr
        `endif
    `endif
    `ifdef def_scanline_chn2
        `ifdef def_write_mem_chn2
            | start2_wr
        `endif
    `endif
    `ifdef def_scanline_chn3
        `ifdef def_write_mem_chn3
            | start3_wr
        `endif
    `endif
    `ifdef def_scanline_chn4
        `ifdef def_write_mem_chn4
            | start4_wr
        `endif
    `endif
    `ifdef def_scanline_chn5
        `ifdef def_write_mem_chn5
            | start5_wr
        `endif
    `endif
    `ifdef def_scanline_chn6
        `ifdef def_write_mem_chn6
            | start6_wr
        `endif
    `endif
    `ifdef def_scanline_chn7
        `ifdef def_write_mem_chn7
            | start7_wr
        `endif
    `endif
    `ifdef def_scanline_chn8
        `ifdef def_write_mem_chn8
            | start8_wr
        `endif
    `endif
    `ifdef def_scanline_chn9
        `ifdef def_write_mem_chn9
            | start9_wr
        `endif
    `endif
    `ifdef def_scanline_chn10
        `ifdef def_write_mem_chn10
            | start10_wr
        `endif
    `endif
    `ifdef def_scanline_chn11
        `ifdef def_write_mem_chn11
            | start11_wr
        `endif
    `endif
    `ifdef def_scanline_chn12
        `ifdef def_write_mem_chn12
            | start12_wr
        `endif
    `endif
    `ifdef def_scanline_chn13
        `ifdef def_write_mem_chn13
            | start13_wr
        `endif
    `endif
    `ifdef def_scanline_chn14
        `ifdef def_write_mem_chn14
            | start14_wr
        `endif
    `endif
    `ifdef def_scanline_chn15
        `ifdef def_write_mem_chn15
            | start15_wr
        `endif
    `endif
    ;

    `ifdef def_scanline_chn0
        wire start0=0
        `ifdef def_read_mem_chn0
            | start0_rd
        `endif
        `ifdef def_write_mem_chn0
            | start0_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn1
        wire start1=0
        `ifdef def_read_mem_chn1
            | start1_rd
        `endif
        `ifdef def_write_mem_chn1
            | start1_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn2
        wire start2=0
        `ifdef def_read_mem_chn2
            | start2_rd
        `endif
        `ifdef def_write_mem_chn2
            | start2_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn3
        wire start3=0
        `ifdef def_read_mem_chn3
            | start3_rd
        `endif
        `ifdef def_write_mem_chn3
            | start3_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn4
        wire start4=0
        `ifdef def_read_mem_chn4
            | start4_rd
        `endif
        `ifdef def_write_mem_chn4
            | start4_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn5
        wire start5=0
        `ifdef def_read_mem_chn5
            | start5_rd
        `endif
        `ifdef def_write_mem_chn5
            | start5_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn6
        wire start6=0
        `ifdef def_read_mem_chn6
            | start6_rd
        `endif
        `ifdef def_write_mem_chn6
            | start6_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn7
        wire start7=0
        `ifdef def_read_mem_chn7
            | start7_rd
        `endif
        `ifdef def_write_mem_chn7
            | start7_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn8
        wire start8=0
        `ifdef def_read_mem_chn8
            | start8_rd
        `endif
        `ifdef def_write_mem_chn8
            | start8_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn9
        wire start9=0
        `ifdef def_read_mem_chn9
            | start9_rd
        `endif
        `ifdef def_write_mem_chn9
            | start9_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn10
        wire start10=0
        `ifdef def_read_mem_chn10
            | start10_rd
        `endif
        `ifdef def_write_mem_chn10
            | start10_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn11
        wire start11=0
        `ifdef def_read_mem_chn11
            | start11_rd
        `endif
        `ifdef def_write_mem_chn11
            | start11_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn12
        wire start12=0
        `ifdef def_read_mem_chn12
            | start12_rd
        `endif
        `ifdef def_write_mem_chn12
            | start12_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn13
        wire start13=0
        `ifdef def_read_mem_chn13
            | start13_rd
        `endif
        `ifdef def_write_mem_chn13
            | start13_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn14
        wire start14=0
        `ifdef def_read_mem_chn14
            | start14_rd
        `endif
        `ifdef def_write_mem_chn14
            | start14_wr
        `endif
        ;
    `endif
    `ifdef def_scanline_chn15
        wire start15=0
        `ifdef def_read_mem_chn15
            | start15_rd
        `endif
        `ifdef def_write_mem_chn15
            | start15_wr
        `endif
        ;
    `endif

    
    
    assign {bank_w, row_w, start_col_w, num128_w, partial_w} = 0    
`ifdef def_scanline_chn0
            | (start0?{bank0, row0, start_col0, num128_0, partial0}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn1
            | (start1?{bank1, row1, start_col1, num128_1, partial1}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn2
            | (start2?{bank2, row2, start_col2, num128_2, partial2}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn3
            | (start3?{bank3, row3, start_col3, num128_3, partial3}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn4
            | (start4?{bank4, row4, start_col4, num128_4, partial4}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn5
            | (start5?{bank5, row5, start_col5, num128_5, partial5}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn6
            | (start6?{bank6, row6, start_col6, num128_6, partial6}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn7
            | (start7?{bank7, row7, start_col7, num128_7, partial7}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn8
            | (start8?{bank8, row8, start_col8, num128_8, partial8}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn9
            | (start9?{bank9, row9, start_col9, num128_9, partial9}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn10
            | (start10?{bank10, row10, start_col10, num128_10, partial10}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn11
            | (start11?{bank11, row11, start_col11, num128_11, partial11}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn12
            | (start12?{bank12, row12, start_col12, num128_12, partial12}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn13
            | (start13?{bank13, row13, start_col13, num128_13, partial13}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn14
            | (start14?{bank14, row14, start_col14, num128_14, partial14}:PAR_DEFAULT)
`endif    
`ifdef def_scanline_chn15
            | (start15?{bank15, row15, start_col15, num128_15, partial15}:PAR_DEFAULT)
`endif    
;
    always @ (posedge clk) begin
        if (start_rd_w || start_wr_w) begin
            bank_r <=      bank_w;
            row_r <=       row_w;
            start_col_r <= start_col_w;
            num128_r <=    num128_w;
            partial_r <=   partial_w;
        end
        start_rd_r <=     start_rd_w;
        start_wr_r <=     start_wr_w;
    end
    

endmodule

