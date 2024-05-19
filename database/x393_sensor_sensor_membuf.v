// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sensor_membuf
 * @file sensor_membuf.v
 * @date 2015-07-12  
 * @author Andrey Filippov     
 *
 * @brief Memory buffer for one sensor channel
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sensor_membuf.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sensor_membuf.v is distributed in the hope that it will be useful,
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

module  sensor_membuf #(
    parameter WADDR_WIDTH=9 // for 36Kb RAM
)(
    input         pclk,
    input         prst,         // reset @ posedge pclk
    input         mrst,         // reset @ posedge mclk
    input         frame_run_mclk, // @mclk - memory channel is ready to accept data from the sensor
    input  [15:0] px_data,      // @posedge pclk pixel (pixel pair) data from the sensor channel
    input         px_valid,     // px_data valid
    input         last_in_line, // valid with px_valid - last px_data in line
    
    input         mclk,         // memory interface clock
    input         rpage_set,    // set internal read page to rpage_in (reset pointers)
    input         rpage_next,   // advance to next page (and reset lower bits to 0)
    input         buf_rd,       // read buffer to memory, increment read address (register enable will be delayed)
    output [63:0] buf_dout,     // data out
    output        page_written  // buffer page (full or partial) is written to the memory buffer 
`ifdef DEBUG_SENS_MEM_PAGES
    ,output [1:0] dbg_rpage   
    ,output [1:0] dbg_wpage   
`endif              

);
    
    reg              [1:0] wpage;
    reg  [WADDR_WIDTH-1:0] waddr;
    
//    reg                    sim_rst = 1; // just for simulation - reset from system reset to the first rpage_set
    reg              [2:0] rst_pntr;
    reg                    frame_run_pclk;
    wire                   rst_wpntr;
    wire                   inc_wpage_w;
    wire                   px_use = frame_run_pclk && px_valid; // px valid and enabled by memory controller
    
    
`ifdef DEBUG_SENS_MEM_PAGES
    assign dbg_wpage = dbg_wpage;   
`endif              
    
    assign inc_wpage_w = px_use && (last_in_line || (&waddr));
    always @ (posedge mclk) begin
        rst_pntr <= {rst_pntr[1] &~rst_pntr[0], rst_pntr[0], rpage_set};
//        if (rpage_set) sim_rst <= 0;
    end
    
    always @ (posedge pclk) begin
        if (prst || rst_wpntr || (px_use && last_in_line)) waddr <= 0;
        else if (px_use)                                   waddr <= waddr + 1;
        
        if (prst || rst_wpntr) wpage <= 0;
        else if (inc_wpage_w)  wpage <=  wpage + 1;
        
        frame_run_pclk <= frame_run_mclk;
    end 

    pulse_cross_clock  rst_wpntr_i (
            .rst        (mrst), // sim_rst),
            .src_clk    (mclk),
            .dst_clk    (pclk),
            .in_pulse   (rst_pntr[2]),
            .out_pulse  (rst_wpntr),
            .busy       ()
     );

    pulse_cross_clock  page_written_i (
            .rst        (prst), // sim_rst || rpage_set),
            .src_clk    (pclk),
            .dst_clk    (mclk),
            .in_pulse   (inc_wpage_w),
            .out_pulse  (page_written),
            .busy       ()
     );


    mcntrl_buf_wr #(
         .LOG2WIDTH_WR(4)  // 64 bit external interface
    ) chn1wr_buf_i (
        .ext_clk      (pclk),            // input
        .ext_waddr    ({wpage, waddr}),  // input[9:0] 
        .ext_we       (px_use),        // input
        .ext_data_in  (px_data),         // input[15:0] buf_wdata - from AXI
        .rclk         (mclk),            // input
        .rpage_in     (2'b0),            // input[1:0] 
        .rpage_set    (rpage_set),       // input  @ posedge mclk
        .page_next    (rpage_next),      // input
`ifdef DEBUG_SENS_MEM_PAGES
        .page         (dbg_rpage),       // output[1:0]
`else        
        .page         (),                // output[1:0]
`endif              
        .rd           (buf_rd),          // input
        .data_out     (buf_dout)         // output[63:0] 
    );


endmodule

