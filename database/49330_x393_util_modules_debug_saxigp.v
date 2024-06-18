// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b> debug_saxigp
 * @file debug_saxigp.v
 * @date 2018-02-02  
 * @author Andrey Filippov
 *     
 * @brief Debugging loss of SAXIGP communication after upgrading Vivado 15.3->17.4
 *
 * @copyright Copyright (c) 2018 <set up in Preferences-Verilog/VHDL Editor-Templates> .
 *
 * <b>License </b>
 *
 * debug_saxigp.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * debug_saxigp.v is distributed in the hope that it will be useful,
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

module  debug_saxigp #(
    parameter DEBUG_STATUS =                  'h714, //
    parameter DEBUG_STATUS_MASK =             'h7ff,
    parameter DEBUG_STATUS_REG_ADDR =         'hf0,  // 1 location
    parameter DEBUG_STATUS_PAYLOAD_ADDR =     'he0  // 16 locations
)(
    input                           mclk,        // system clock
    input                           mrst,        // @ posedge mclk - sync reset
    // programming interface
    input                     [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                           cmd_stb,     // strobe (with first byte) for the command a/d
    output                    [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                          status_rq,   // input request to send status downstream
    input                           status_start, // Acknowledge of the first status packet byte (address)

    input                           saxi_aclk,  //    = hclk; // 150KHz
    input                    [31:0] saxi_awaddr,
    input                           saxi_awvalid,
    input                           saxi_awready,
    input                    [ 5:0] saxi_awid,
     
    input                    [ 1:0] saxi_awlock, 
    input                    [ 3:0] saxi_awcache, 
    input                    [ 2:0] saxi_awprot, 
    input                    [ 3:0] saxi_awlen, 
    input                    [ 1:0] saxi_awsize, 
    input                    [ 1:0] saxi_awburst, 
    input                    [ 3:0] saxi_awqos,
     
    input                    [31:0] saxi_wdata, 
    input                           saxi_wvalid,
    input                           saxi_wready,
    input                    [ 5:0] saxi_wid, 
    input                           saxi_wlast, // 
    
    input                    [ 3:0] saxi_wstrb, 
    input                           saxi_bvalid,
    input                           saxi_bready,
    input                    [ 5:0] saxi_bid, 
    input                    [ 1:0] saxi_bresp 
);

    reg [15:0] cntr_clk;
    reg [15:0] cntr_aw;
    reg [15:0] cntr_w;
    reg [15:0] cntr_b;
    reg        hrst;
    
    wire [159:0] dbg_in = {
        cntr_b,                                                  // 16 
        cntr_w,                                                  // 16 
        cntr_aw,                                                 // 16
        cntr_clk,                                                // 16
        saxi_awaddr,                                             // 32
        saxi_wdata,                                              // 32
         
        saxi_wvalid, saxi_wready, saxi_wid,                      // 8
        2'b0, saxi_awlock, saxi_awcache,                         // 8  
        1'b0, saxi_awprot, saxi_awlen,                           // 8
        saxi_awsize, saxi_awburst, saxi_awqos};                  // 8
        
    wire [25:0] dbg_watch = {
        saxi_awvalid, saxi_awready, saxi_awid, // 8
        1'b0, saxi_wlast, saxi_wstrb, saxi_bresp, saxi_bvalid,  saxi_bready, saxi_bid,   // 16
        saxi_awvalid && saxi_awready,
        saxi_wvalid && saxi_wready};
        
    
    always @ (posedge saxi_aclk) begin
        hrst <= mrst;
        if (hrst) cntr_clk <= 0;
        else      cntr_clk <= cntr_clk + 1;
        
        if      (hrst)                         cntr_aw <= 0;
        else if (saxi_awvalid && saxi_awready) cntr_aw <= cntr_aw + 1;
        
        if      (hrst)                         cntr_w <= 0;
        else if (saxi_wvalid && saxi_wready)   cntr_w <= cntr_w + 1;
        
        if      (hrst)                         cntr_b <= 0;
        else if (saxi_bvalid && saxi_bready)   cntr_b <= cntr_b + 1;
    end

    debug_read #(
        .DEBUG_NUM                 (5),
        .DEBUG_PAYLOAD             (26),
        .DEBUG_STATUS              (DEBUG_STATUS),
        .DEBUG_STATUS_MASK         (DEBUG_STATUS_MASK),
        .DEBUG_STATUS_REG_ADDR     (DEBUG_STATUS_REG_ADDR),
        .DEBUG_STATUS_PAYLOAD_ADDR (DEBUG_STATUS_PAYLOAD_ADDR)
    ) debug_read_i (
        .mclk                      (mclk),         // input
        .mrst                      (mrst),         // input
        .cmd_ad                    (cmd_ad),       // input[7:0] 
        .cmd_stb                   (cmd_stb),      // input
        .status_ad                 (status_ad),    // output[7:0] 
        .status_rq                 (status_rq),    // output
        .status_start              (status_start), // input
        .dbg_in                    (dbg_in),       // input[511:0] 
        .dbg_watch                 (dbg_watch)     // input[1:0] 
    );


endmodule

