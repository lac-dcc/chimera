// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: simul_axi_master_wdata
 * Date:2014-03-24  
 * Author: Andrey Filippov    
 * Description: Simulation model for AXI write data channel
 *
 * Copyright (c) 2014 Elphel, Inc..
 * simul_axi_master_wdata.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_master_wdata.v is distributed in the hope that it will be useful,
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
 *******************************************************************************/
`timescale 1ns/1ps

module  simul_axi_master_wdata#(
  parameter integer ID_WIDTH=12,
  parameter integer DATA_WIDTH=32,
  parameter integer WSTB_WIDTH= 4,
  parameter integer LATENCY=0,          // minimal delay between inout and output ( 0 - next cycle)
  parameter integer DEPTH=8,            // maximal number of commands in FIFO
  parameter DATA_DELAY = 3.5,
  parameter VALID_DELAY = 4.0
)(
    input                      clk,
    input                      reset,
    input  [ID_WIDTH-1:0]      wid_in,
    input  [DATA_WIDTH-1:0]    wdata_in,
    input  [WSTB_WIDTH-1:0]    wstrb_in,
    input                      wlast_in,
    output [ID_WIDTH-1:0]      wid,
    output [DATA_WIDTH-1:0]    wdata,
    output [WSTB_WIDTH-1:0]    wstrb,
    output                     wlast,
    output                     wvalid,
    input                      wready,

    input                      set_cmd,  // latch all other input data at posedge of clock
    output                     ready     // command/data FIFO can accept command
);

    wire  [ID_WIDTH-1:0]      wid_out;
    wire  [DATA_WIDTH-1:0]    wdata_out;
    wire  [WSTB_WIDTH-1:0]    wstrb_out;
    wire                      wlast_out;
    wire                      wvalid_out;
    
    assign #(DATA_DELAY)  wid=    wid_out;
    assign #(DATA_DELAY)  wdata=  wdata_out;
    assign #(DATA_DELAY)  wstrb=  wstrb_out;
    assign #(DATA_DELAY)  wlast=  wlast_out;
    assign #(VALID_DELAY) wvalid= wvalid_out;

simul_axi_fifo
    #(
      .WIDTH(ID_WIDTH+DATA_WIDTH+WSTB_WIDTH+1),  // total number of output bits
      .LATENCY(LATENCY),                         // minimal delay between inout and output ( 0 - next cycle)
      .DEPTH(DEPTH)                              // maximal number of commands in FIFO
    ) simul_axi_fifo_i (
    .clk(clk),         // input              clk,
    .reset(reset),       // input              reset,
    .data_in({wid_in, wdata_in, wstrb_in, wlast_in}),     // input  [WIDTH-1:0] data_in,
    .load(set_cmd),        // input              load,
    .input_ready(ready), // output             input_ready,
    .data_out({wid_out, wdata_out, wstrb_out, wlast_out}),    // output [WIDTH-1:0] data_out,
    .valid(wvalid_out),       // output             valid,
    .ready(wready));          //  input              ready);

endmodule

