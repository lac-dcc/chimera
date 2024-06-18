// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl393_test01
 * @file mcntrl393_test01.v
 * @date 2015-02-06  
 * @author Andrey Filippov     
 *
 * @brief Temporary  module to interface mcntrl393 control signals
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl393_test01.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl393_test01.v is distributed in the hope that it will be useful,
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

module  mcntrl393_test01#(
    parameter MCNTRL_TEST01_ADDR=                 'h0f0,
    parameter MCNTRL_TEST01_MASK=                 'h7f0,
    parameter FRAME_HEIGHT_BITS=                   16,   // Maximal frame height
    parameter MCNTRL_TEST01_CHN1_MODE=            'h2,   // set mode register for channel 5
    parameter MCNTRL_TEST01_CHN1_STATUS_CNTRL=    'h3,   // control status reporting for channel 5
    parameter MCNTRL_TEST01_CHN2_MODE=            'h4,   // set mode register for channel 2
    parameter MCNTRL_TEST01_CHN2_STATUS_CNTRL=    'h5,   // control status reporting for channel 2
    parameter MCNTRL_TEST01_CHN3_MODE=            'h6,   // set mode register for channel 3
    parameter MCNTRL_TEST01_CHN3_STATUS_CNTRL=    'h7,   // control status reporting for channel 3
    parameter MCNTRL_TEST01_CHN4_MODE=            'h8,   // set mode register for channel 4
    parameter MCNTRL_TEST01_CHN4_STATUS_CNTRL=    'h9,   // control status reporting for channel 4
    parameter MCNTRL_TEST01_STATUS_REG_CHN1_ADDR= 'h3c,  // status/readback register for channel 2
    parameter MCNTRL_TEST01_STATUS_REG_CHN2_ADDR= 'h3d,  // status/readback register for channel 3
    parameter MCNTRL_TEST01_STATUS_REG_CHN3_ADDR= 'h3e,  // status/readback register for channel 4
    parameter MCNTRL_TEST01_STATUS_REG_CHN4_ADDR= 'h3f  // status/readback register for channel 4
)(
    input                         mrst,
    input                         mclk,     // global clock, half DDR3 clock, synchronizes all I/O through the command port
    // programming interface
    input                   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,     // strobe (with first byte) for the command a/d
    output                  [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,   // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)
    
    output                        frame_start_chn1, // input
    output                        next_page_chn1, // input
    input                         page_ready_chn1, // output
    input                         frame_done_chn1, // output
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn1, // output[15:0]
    output                        suspend_chn1, // input

    output                        frame_start_chn2,  // input
    output                        next_page_chn2,    // input
    input                         page_ready_chn2, // output
    input                         frame_done_chn2, // output
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn2, // output[15:0] 
    output                        suspend_chn2, // input
    
    output                        frame_start_chn3, // input
    output                        next_page_chn3, // input
    input                         page_ready_chn3, // output
    input                         frame_done_chn3, // output
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn3, // output[15:0]
    output                        suspend_chn3, // input

    output                        frame_start_chn4, // input
    output                        next_page_chn4, // input
    input                         page_ready_chn4, // output
    input                         frame_done_chn4, // output
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_chn4, // output[15:0]
    output                        suspend_chn4 // input
    
);
    localparam PAGE_BITS=4;       // number of LSB to indicate pages read/written
    localparam STATUS_PAYLOAD_BITS=FRAME_HEIGHT_BITS+PAGE_BITS+2;
    wire        cmd_we;
    wire  [3:0] cmd_a;
    wire  [7:0] cmd_data;
    wire [STATUS_PAYLOAD_BITS-1:0] status_chn1;
    wire                     [7:0] status_chn1_ad; 
    wire                           status_chn1_rq;
    wire                           status_chn1_start; // input
    wire [STATUS_PAYLOAD_BITS-1:0] status_chn2;
    wire                     [7:0] status_chn2_ad; 
    wire                           status_chn2_rq;
    wire                           status_chn2_start; // input
    wire [STATUS_PAYLOAD_BITS-1:0] status_chn3;
    wire                     [7:0] status_chn3_ad; 
    wire                           status_chn3_rq;
    wire                           status_chn3_start; // input
    wire [STATUS_PAYLOAD_BITS-1:0] status_chn4;
    wire                     [7:0] status_chn4_ad; 
    wire                           status_chn4_rq;
    wire                           status_chn4_start; // input
    
    reg            [PAGE_BITS-1:0] page_chn1;
    reg            [PAGE_BITS-1:0] page_chn2;
    reg            [PAGE_BITS-1:0] page_chn3;
    reg            [PAGE_BITS-1:0] page_chn4;
    reg                            frame_start_chn1_r;
    reg                            frame_start_chn2_r;
    reg                            frame_start_chn3_r;
    reg                            frame_start_chn4_r;
    reg                            next_page_chn1_r;
    reg                            next_page_chn2_r;
    reg                            next_page_chn3_r;
    reg                            next_page_chn4_r;
    reg                            suspend_chn1_r;
    reg                            suspend_chn2_r;
    reg                            suspend_chn3_r;
    reg                            suspend_chn4_r;
    
    
    wire        set_chn1_mode=   cmd_we && (cmd_a== MCNTRL_TEST01_CHN1_MODE);          // set mode register for channel 1
    wire        set_chn1_status= cmd_we && (cmd_a== MCNTRL_TEST01_CHN1_STATUS_CNTRL);  // control status reporting for channel 1
    wire        set_chn2_mode=   cmd_we && (cmd_a== MCNTRL_TEST01_CHN2_MODE);          // set mode register for channel 2
    wire        set_chn2_status= cmd_we && (cmd_a== MCNTRL_TEST01_CHN2_STATUS_CNTRL);  // control status reporting for channel 2
    wire        set_chn3_mode=   cmd_we && (cmd_a== MCNTRL_TEST01_CHN3_MODE);          // set mode register for channel 3
    wire        set_chn3_status= cmd_we && (cmd_a== MCNTRL_TEST01_CHN3_STATUS_CNTRL);  // control status reporting for channel 3
    wire        set_chn4_mode=   cmd_we && (cmd_a== MCNTRL_TEST01_CHN4_MODE);          // set mode register for channel 4
    wire        set_chn4_status= cmd_we && (cmd_a== MCNTRL_TEST01_CHN4_STATUS_CNTRL);  // control status reporting for channel 4
    wire        cmd_frame_start_w=cmd_data[0];
    wire        cmd_next_page_w=  cmd_data[1];
    wire        cmd_suspend_w=    cmd_data[2];
    reg         frame_busy_chn1;
    reg         frame_busy_chn2;
    reg         frame_busy_chn3;
    reg         frame_busy_chn4;
    reg         frame_finished_chn1;
    reg         frame_finished_chn2;
    reg         frame_finished_chn3;
    reg         frame_finished_chn4;
    
    assign frame_start_chn1 = frame_start_chn1_r;    
    assign frame_start_chn2 = frame_start_chn2_r;    
    assign frame_start_chn3 = frame_start_chn3_r;    
    assign frame_start_chn4 = frame_start_chn4_r;    
    assign next_page_chn1 =   next_page_chn1_r;    
    assign next_page_chn2 =   next_page_chn2_r;    
    assign next_page_chn3 =   next_page_chn3_r;    
    assign next_page_chn4 =   next_page_chn4_r;    
    assign suspend_chn1 = suspend_chn1_r;
    assign suspend_chn2 = suspend_chn2_r;
    assign suspend_chn3 = suspend_chn3_r;
    assign suspend_chn4 = suspend_chn4_r;
    assign status_chn1={page_chn1,line_unfinished_chn1,frame_finished_chn1, frame_busy_chn1};
    assign status_chn2={page_chn2,line_unfinished_chn2,frame_finished_chn2, frame_busy_chn2};
    assign status_chn3={page_chn3,line_unfinished_chn3,frame_finished_chn3, frame_busy_chn3};
    assign status_chn4={page_chn4,line_unfinished_chn4,frame_finished_chn4, frame_busy_chn4};

    always @ (posedge mclk) begin
        frame_start_chn1_r <= set_chn1_mode && cmd_frame_start_w;
        frame_start_chn2_r <= set_chn2_mode && cmd_frame_start_w;
        frame_start_chn3_r <= set_chn3_mode && cmd_frame_start_w;
        frame_start_chn4_r <= set_chn4_mode && cmd_frame_start_w;
        next_page_chn1_r <=   set_chn1_mode && cmd_next_page_w;
        next_page_chn2_r <=   set_chn2_mode && cmd_next_page_w;
        next_page_chn3_r <=   set_chn3_mode && cmd_next_page_w;
        next_page_chn4_r <=   set_chn4_mode && cmd_next_page_w;
    end

    always @ (posedge mclk) begin
        if      (mrst)               page_chn1 <= 0;
        else if (frame_start_chn1_r) page_chn1 <= 0;
        else if (page_ready_chn1)    page_chn1 <= page_chn1 + 1;

        if      (mrst)               page_chn2 <= 0;
        else if (frame_start_chn2_r) page_chn2 <= 0;
        else if (page_ready_chn2)    page_chn2 <= page_chn2 + 1;

        if      (mrst)               page_chn3 <= 0;
        else if (frame_start_chn3_r) page_chn3 <= 0;
        else if (page_ready_chn3)    page_chn3 <= page_chn3 + 1;
        
        if      (mrst)               page_chn4 <= 0;
        else if (frame_start_chn4_r) page_chn4 <= 0;
        else if (page_ready_chn4)    page_chn4 <= page_chn4 + 1;


        if      (mrst)           suspend_chn1_r <= 0;
        else if (set_chn1_mode)  suspend_chn1_r <= cmd_suspend_w;

        if      (mrst)           suspend_chn2_r <= 0;
        else if (set_chn2_mode)  suspend_chn2_r <= cmd_suspend_w;

        if      (mrst)           suspend_chn3_r <= 0;
        else if (set_chn3_mode)  suspend_chn3_r <= cmd_suspend_w;

        if      (mrst)           suspend_chn4_r <= 0;
        else if (set_chn4_mode)  suspend_chn4_r <= cmd_suspend_w;

        if      (mrst)                                    frame_busy_chn1 <= 0;
        else if ( frame_start_chn1_r && !frame_done_chn1) frame_busy_chn1 <= 1;
        else if (!frame_start_chn1_r &&  frame_done_chn1) frame_busy_chn1 <= 0;

        if      (mrst)                                    frame_busy_chn2 <= 0;
        else if ( frame_start_chn2_r && !frame_done_chn2) frame_busy_chn2 <= 1;
        else if (!frame_start_chn2_r &&  frame_done_chn2) frame_busy_chn2 <= 0;

        if      (mrst)                                    frame_busy_chn3 <= 0;
        else if ( frame_start_chn3_r && !frame_done_chn3) frame_busy_chn3 <= 1;
        else if (!frame_start_chn3_r &&  frame_done_chn3) frame_busy_chn3 <= 0;

        if      (mrst)                                    frame_busy_chn4 <= 0;
        else if ( frame_start_chn4_r && !frame_done_chn4) frame_busy_chn4 <= 1;
        else if (!frame_start_chn4_r &&  frame_done_chn4) frame_busy_chn4 <= 0;
        
        if      (mrst)                                    frame_finished_chn1 <= 0;
        else if ( frame_start_chn1_r && !frame_done_chn1) frame_finished_chn1 <= 0;
        else if (!frame_start_chn1_r &&  frame_done_chn1) frame_finished_chn1 <= 1;
        
        if      (mrst)                                    frame_finished_chn2 <= 0;
        else if ( frame_start_chn2_r && !frame_done_chn2) frame_finished_chn2 <= 0;
        else if (!frame_start_chn2_r &&  frame_done_chn2) frame_finished_chn2 <= 1;

        if      (mrst)                                    frame_finished_chn3 <= 0;
        else if ( frame_start_chn3_r && !frame_done_chn3) frame_finished_chn3 <= 0;
        else if (!frame_start_chn3_r &&  frame_done_chn3) frame_finished_chn3 <= 1;

        if      (mrst)                                    frame_finished_chn4 <= 0;
        else if ( frame_start_chn4_r && !frame_done_chn4) frame_finished_chn4 <= 0;
        else if (!frame_start_chn4_r &&  frame_done_chn4) frame_finished_chn4 <= 1;
    end
    
    always @ (posedge mclk) begin
        frame_start_chn1_r <= set_chn1_mode && cmd_frame_start_w;
        frame_start_chn2_r <= set_chn2_mode && cmd_frame_start_w;
        frame_start_chn3_r <= set_chn3_mode && cmd_frame_start_w;
        frame_start_chn4_r <= set_chn4_mode && cmd_frame_start_w;
        next_page_chn1_r <=   set_chn1_mode && cmd_next_page_w;
        next_page_chn2_r <=   set_chn2_mode && cmd_next_page_w;
        next_page_chn3_r <=   set_chn3_mode && cmd_next_page_w;
        next_page_chn4_r <=   set_chn4_mode && cmd_next_page_w;
    end
    
    cmd_deser #(
        .ADDR       (MCNTRL_TEST01_ADDR),
        .ADDR_MASK  (MCNTRL_TEST01_MASK),
        .NUM_CYCLES (3),
        .ADDR_WIDTH (4),
        .DATA_WIDTH (8)
    ) cmd_deser_mcontr_test01_8bit_i (
        .rst        (1'b0),      //   rst), // input
        .clk        (mclk),      // input
        .srst       (mrst),      // input
        .ad         (cmd_ad),    // input[7:0] 
        .stb        (cmd_stb),   // input
        .addr       (cmd_a),     // output[15:0] 
        .data       (cmd_data),  // output[31:0] 
        .we         (cmd_we)     // output
    );
    
    
    status_router4 status_router4_i (
        .rst        (1'b0),              //   rst), // input
        .clk        (mclk),              // input
        .srst       (mrst),              // input
        .db_in0     (status_chn1_ad),    // input[7:0] 
        .rq_in0     (status_chn1_rq),    // input
        .start_in0  (status_chn1_start), // output
        .db_in1     (status_chn2_ad),    // input[7:0] 
        .rq_in1     (status_chn2_rq),    // input
        .start_in1  (status_chn2_start), // output
        .db_in2     (status_chn3_ad),    // input[7:0] 
        .rq_in2     (status_chn3_rq),    // input
        .start_in2  (status_chn3_start), // output
        .db_in3     (status_chn4_ad),    // input[7:0] 
        .rq_in3     (status_chn4_rq),    // input
        .start_in3  (status_chn4_start), // output
        
        .db_out     (status_ad), // output[7:0] 
        .rq_out     (status_rq), // output
        .start_out  (status_start) // input
    );
    
    status_generate #(
        .STATUS_REG_ADDR(MCNTRL_TEST01_STATUS_REG_CHN1_ADDR),
        .PAYLOAD_BITS(STATUS_PAYLOAD_BITS)
    ) status_generate_chn1_i (
        .rst        (1'b0),             //   rst), // input
        .clk        (mclk),             // input
        .srst       (mrst),             // input
        .we         (set_chn1_status),  // input
        .wd         (cmd_data[7:0]),    // input[7:0] 
        .status     (status_chn1),      // input[25:0] 
        .ad         (status_chn1_ad),   // output[7:0] 
        .rq         (status_chn1_rq),   // output
        .start      (status_chn1_start) // input
    );

    status_generate #(
        .STATUS_REG_ADDR(MCNTRL_TEST01_STATUS_REG_CHN2_ADDR),
        .PAYLOAD_BITS(STATUS_PAYLOAD_BITS)
    ) status_generate_chn2_i (
        .rst        (1'b0),             //   rst), // input
        .clk        (mclk),             // input
        .srst       (mrst),             // input
        .we         (set_chn2_status),  // input
        .wd         (cmd_data[7:0]),    // input[7:0] 
        .status     (status_chn2),      // input[25:0] 
        .ad         (status_chn2_ad),   // output[7:0] 
        .rq         (status_chn2_rq),   // output
        .start      (status_chn2_start) // input
    );

    status_generate #(
        .STATUS_REG_ADDR(MCNTRL_TEST01_STATUS_REG_CHN3_ADDR),
        .PAYLOAD_BITS(STATUS_PAYLOAD_BITS)
    ) status_generate_chn3_i (
        .rst        (1'b0),             //   rst), // input
        .clk        (mclk),             // input
        .srst       (mrst),             // input
        .we         (set_chn3_status),  // input
        .wd         (cmd_data[7:0]),    // input[7:0] 
        .status     (status_chn3),      // input[25:0] 
        .ad         (status_chn3_ad),   // output[7:0] 
        .rq         (status_chn3_rq),   // output
        .start      (status_chn3_start) // input
    );

    status_generate #(
        .STATUS_REG_ADDR(MCNTRL_TEST01_STATUS_REG_CHN4_ADDR),
        .PAYLOAD_BITS(STATUS_PAYLOAD_BITS)
    ) status_generate_chn4_i (
        .rst        (1'b0),             //   rst), // input
        .clk        (mclk),             // input
        .srst       (mrst),             // input
        .we         (set_chn4_status),  // input
        .wd         (cmd_data[7:0]),    // input[7:0] 
        .status     (status_chn4),      // input[25:0] 
        .ad         (status_chn4_ad),   // output[7:0] 
        .rq         (status_chn4_rq),   // output
        .start      (status_chn4_start) // input
    );

endmodule

