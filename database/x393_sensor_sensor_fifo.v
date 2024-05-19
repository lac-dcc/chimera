// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensor_fifo
 * @file sensor_fifo.v
 * @date 2015-05-19  
 * @author Andrey Filippov     
 *
 * @brief Cross clock boundary for sensor data, synchronize to HACT
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sensor_fifo.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensor_fifo.v is distributed in the hope that it will be useful,
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

module  sensor_fifo #(
    parameter SENSOR_DATA_WIDTH = 12,
    parameter SENSOR_FIFO_2DEPTH = 4, // 4-bit address
    parameter [3:0] SENSOR_FIFO_DELAY = 5 // 7 // approxiametly half (1 << SENSOR_FIFO_2DEPTH) - how long to wait after getting HACT on FIFO before stering it on output
)(
//    input                          rst,
    input                          iclk, // input -synchronous clock
    input                          pclk, // internal lixel clock
    input                          prst, // @ posedge pclk
    input                          irst, // @ posedge iclk
    
    input  [SENSOR_DATA_WIDTH-1:0] pxd_in,  // sensor data @posedge iclk
    input                          vact,
    input                          hact,
    output [SENSOR_DATA_WIDTH-1:0] pxd_out,
    output                         data_valid, // @posedge pclk: continuous data valid for each line, FIFO should compensate for clock differences
    output                         sof,        // @posedge pclk: single-cycle Start of Frame
    output                         eof         // @posedge pclk: single-cycle End of Frame (not yet used)
);
    reg                          vact_r,hact_r,sof_in,eof_in;
    wire [SENSOR_DATA_WIDTH-1:0] pxd_w;
    wire                         nempty, hact_w,sof_w,eof_w;
    reg                          sof_r,eof_r;
    wire we;
    // output clock domain
//    wire                        pre_re;
    wire                        re; // re_w,re;
//    reg                         re_r;
    reg                   [1:0] pre_hact;
    reg                   [1:0] hact_out_r;
    reg [SENSOR_DATA_WIDTH-1:0] pxd_r;
//    wire                        hact_out_start;
    
    assign we=sof_in || eof_in || hact || hact_r;
    always @(posedge iclk) begin
        if (irst) {vact_r,hact_r,sof_in,eof_in} <= 0;
        else      {vact_r,hact_r,sof_in,eof_in} <= {vact,hact, vact && ! vact_r, vact_r && !vact};
    end

    fifo_cross_clocks #(
        .DATA_WIDTH(SENSOR_DATA_WIDTH+3),
        .DATA_DEPTH(SENSOR_FIFO_2DEPTH)
    ) fifo_cross_clocks_i (
        .rst        (1'b0),   // rst), // input
        .rrst       (prst),   // input
        .wrst       (irst),   // input
        .rclk       (pclk),   // input
        .wclk       (iclk),   // input
        .we         (we),     // input
        .re         (re),     // input
        .data_in    ({eof_in, sof_in, hact,   pxd_in}), // input[15:0] 
        .data_out   ({eof_w,  sof_w,  hact_w, pxd_w}), // output[15:0] 
        .nempty     (nempty), // output
        .half_empty ()        // output
    );
/*
    dly_16 #(
        .WIDTH(1)
    ) hact_dly_16_i (
        .clk(pclk),                         // input
        .rst(prst),                         // input
        .dly(SENSOR_FIFO_DELAY),            // input[3:0] 
        .din(pre_hact[0] && ! pre_hact[1]), // input[0:0] 
        .dout(hact_out_start)               // output[0:0] 
    );
*/    
    wire pre_sof_pclk;
    wire pre_eof_pclk;
    wire pre_sol_pclk;

    wire sof_pclk;
    wire eof_pclk;
    wire sol_pclk;
    
    pulse_cross_clock pulse_cross_clock_sof_i (
        .rst         (irst),           // input
        .src_clk     (iclk),          // input
        .dst_clk     (pclk),          // input
        .in_pulse    (sof_in),  // input
        .out_pulse   (pre_sof_pclk),      // output
        .busy() // output
    );

    pulse_cross_clock pulse_cross_clock_eof_i (
        .rst         (irst),           // input
        .src_clk     (iclk),          // input
        .dst_clk     (pclk),          // input
        .in_pulse    (eof_in),  // input
        .out_pulse   (pre_eof_pclk),      // output
        .busy() // output
    );

    pulse_cross_clock pulse_cross_clock_sol_i (
        .rst         (irst),           // input
        .src_clk     (iclk),          // input
        .dst_clk     (pclk),          // input
        .in_pulse    (hact && !hact_r),  // input
        .out_pulse   (pre_sol_pclk),      // output
        .busy() // output
    );

    dly_16 #(
        .WIDTH(3)
    ) hact_dly_16_i (
        .clk(pclk),                                       // input
        .rst(prst),                                       // input
        .dly(SENSOR_FIFO_DELAY),                          // input[3:0] 
        .din({pre_sof_pclk, pre_eof_pclk, pre_sol_pclk}), // input[0:0] 
        .dout({sof_pclk, eof_pclk, sol_pclk})             // output[0:0] 
    );
    
    
    
    reg sof_rq;
    reg eof_rq;
    reg sol_rq;
    always @ (posedge pclk) begin
        if (prst || (re && sof_w)) sof_rq <= 0;
        else if (sof_pclk)         sof_rq <= 1;

        if (prst || (re && eof_w)) eof_rq <= 0;
        else if (eof_pclk)         eof_rq <= 1;

        if (prst || (re && hact_out_r[0] && !hact_out_r[1])) sol_rq <= 0;
        else if (sol_pclk)                                   sol_rq <= 1;
    end
    
    
    
    // output clock domain
//    assign pre_re = nempty && !re_r;
// Generating first read (for hact), then wait to fill half FIFO and continue continuous read until hact end
//    assign re_w = re_r && nempty; // to protect from false positive on nempty
//    assign re = (re_w && !pre_hact) || hact_out_r; // no check for nempty - producing un-interrupted stream
//    assign re = (re_r && nempty && !pre_hact[0]) || hact_out_r[0]; // no check for nempty - producing un-interrupted stream
    assign re = ((sof_rq || eof_rq || sol_rq) && nempty) || hact_out_r[0]; // no check for nempty - producing un-interrupted stream
    assign pxd_out= pxd_r;
    assign data_valid = hact_out_r[1];
    assign sof = sof_r;
    assign eof = eof_r;

    always @(posedge pclk) begin
//        if (prst) re_r <= 0;
//        else      re_r <= nempty && !re_r && !pre_hact[0]; // only generate one cycle (after SOF of HACT)

        if    (prst) pre_hact[0] <= 0;
        else if (re) pre_hact[0] <= hact_w;

        if    (prst) pre_hact[1] <= 0;
        else         pre_hact[1] <= pre_hact[0];


        if    (prst) pxd_r <= 0;
        else if (re) pxd_r <= pxd_w;

        if      (prst)            hact_out_r[0] <= 0;
        else if (sol_pclk)        hact_out_r[0] <= 1;
        else if (!(hact_w) && re) hact_out_r[0] <= 0;
        
        if      (prst || (!(hact_w) && re)) hact_out_r[1] <= 0;
        else                                hact_out_r[1] <= hact_out_r[0];

        if (prst) sof_r <= 0;
        else      sof_r <= re && sof_w;

        if (prst) eof_r <= 0;
        else      eof_r <= re && eof_w;

    end
     
/*
    always @(posedge iclk) begin
        if (irst) re_r <= 0;
        else      re_r <= pre_re;

        if    (irst) pre_hact[0] <= 0;
        else if (re) pre_hact[0] <= hact_w;

        if    (irst) pre_hact[1] <= 0;
        else if (re) pre_hact[1] <= pre_hact[0];

        if    (irst) pxd_r <= 0;
        else if (re) pxd_r <= pxd_w;

        if      (irst)           hact_out_r <= 0;
        else if (hact_out_start) hact_out_r <= 1;
        else if (!hact_w)        hact_out_r <= 0;

        if (irst) sof_r <= 0;
        else      sof_r <= re && sof_w;

        if (irst) eof_r <= 0;
        else      eof_r <= re && eof_w;

    end
*/    


endmodule

