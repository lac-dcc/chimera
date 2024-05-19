// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>simul_axi_master_wraddr
 * @file simul_axi_master_wraddr.v
 * @date 2014-03-24  
 * @author Andrey Filippov    
 *
 * @brief Simulation model for AXI write address channel
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * simul_axi_master_wraddr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_master_wraddr.v is distributed in the hope that it will be useful,
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

module  simul_axi_master_wraddr
#(
  parameter integer ID_WIDTH=12,
  parameter integer ADDRESS_WIDTH=32,
  parameter integer LATENCY=0,          // minimal delay between inout and output ( 0 - next cycle)
  parameter integer DEPTH=8,            // maximal number of commands in FIFO
  parameter DATA_DELAY = 3.5,
  parameter VALID_DELAY = 4.0
)(
    input                      clk,
    input                      reset,
    input  [ID_WIDTH-1:0]      awid_in,
    input  [ADDRESS_WIDTH-1:0] awaddr_in,
    input  [3:0]               awlen_in,
    input  [1:0]               awsize_in,
    input  [1:0]               awburst_in,
    input  [3:0]               awcache_in,
    input  [2:0]               awprot_in,

    output [ID_WIDTH-1:0]      awid,
    output [ADDRESS_WIDTH-1:0] awaddr,
    output [3:0]               awlen,
    output [1:0]               awsize,
    output [1:0]               awburst,
    output [3:0]               awcache,
    output [2:0]               awprot,
    output                     awvalid,
    input                      awready,

    input                      set_cmd,  // latch all other input data at posedge of clock
    output                     ready     // command/data FIFO can accept command
);
    wire [ID_WIDTH-1:0]      awid_out;
    wire [ADDRESS_WIDTH-1:0] awaddr_out;
    wire [3:0]               awlen_out;
    wire [1:0]               awsize_out;
    wire [1:0]               awburst_out;
    wire [3:0]               awcache_out;
    wire [2:0]               awprot_out;
    wire                     awvalid_out;
    
    assign #(DATA_DELAY) awid=    awid_out;
    assign #(DATA_DELAY) awaddr=  awaddr_out;
    assign #(DATA_DELAY) awlen=   awlen_out;
    assign #(DATA_DELAY) awsize=  awsize_out;
    assign #(DATA_DELAY) awburst= awburst_out;
    assign #(DATA_DELAY) awcache= awcache_out;
    assign #(DATA_DELAY) awprot=  awprot_out;
    assign #(VALID_DELAY) awvalid= awvalid_out;

simul_axi_fifo
    #(
      .WIDTH(ID_WIDTH+ADDRESS_WIDTH+15),     // total number of output bits
      .LATENCY(LATENCY),                     // minimal delay between inout and output ( 0 - next cycle)
      .DEPTH(DEPTH)                          // maximal number of commands in FIFO
//  parameter OUT_DELAY = 3.5,
    ) simul_axi_fifo_i (
    .clk(clk),         // input              clk,
    .reset(reset),       // input              reset,
    .data_in({awid_in,awaddr_in,awlen_in,awsize_in,awburst_in,awcache_in,awprot_in}),     // input  [WIDTH-1:0] data_in,
    .load(set_cmd),        // input              load,
    .input_ready(ready), // output             input_ready,
    .data_out({awid_out,awaddr_out,awlen_out,awsize_out,awburst_out,awcache_out,awprot_out}),    // output [WIDTH-1:0] data_out,
    .valid(awvalid_out),       // output             valid,
    .ready(awready));      //  input              ready);

endmodule

