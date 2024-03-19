/*******************************************************************************
 * Module: simul_axi_master_rdaddr
 * Date:2014-03-23  
 * Author: andrey     
 * Description: Simulation model for AXI read address channel
 *
 * Copyright (c) 2014 Elphel, Inc.
 * simul_axi_master_rdaddr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_master_rdaddr.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/

`timescale 1ns/1ps

module simul_axi_master_rdaddr
#(
  parameter integer ID_WIDTH=12,
  parameter integer ADDRESS_WIDTH=32,
  parameter integer LATENCY=0,          // minimal delay between inout and output ( 0 - next cycle)
  parameter integer DEPTH=8,            // maximal number of commands in FIFO
  parameter DATA_DELAY = 3.5,
  parameter VALID_DELAY = 4.0
  
//  parameter integer DATA_2DEPTH=(1<<DATA_DEPTH)-1
)(
    input                      clk,
    input                      reset,
    input  [ID_WIDTH-1:0]      arid_in,
    input  [ADDRESS_WIDTH-1:0] araddr_in,
    input  [3:0]               arlen_in,
    input  [2:0]               arsize_in,
    input  [1:0]               arburst_in,
    input  [3:0]               arcache_in,
    input  [2:0]               arprot_in,

    output [ID_WIDTH-1:0]      arid,
    output [ADDRESS_WIDTH-1:0] araddr,
    output [3:0]               arlen,
    output [2:0]               arsize,
    output [1:0]               arburst,
    output [3:0]               arcache,
    output [2:0]               arprot,
    output                     arvalid,
    input                      arready,

    input                      set_cmd,  // latch all other input data at posedge of clock
    output                     ready     // command/data FIFO can accept command
);
    wire [ID_WIDTH-1:0]      arid_out;
    wire [ADDRESS_WIDTH-1:0] araddr_out;
    wire [3:0]               arlen_out;
    wire [2:0]               arsize_out;
    wire [1:0]               arburst_out;
    wire [3:0]               arcache_out;
    wire [2:0]               arprot_out;
    wire                     arvalid_out;
    
    assign #(DATA_DELAY) arid=    arid_out;
    assign #(DATA_DELAY) araddr=  araddr_out;
    assign #(DATA_DELAY) arlen=   arlen_out;
    assign #(DATA_DELAY) arsize=  arsize_out;
    assign #(DATA_DELAY) arburst= arburst_out;
    assign #(DATA_DELAY) arcache= arcache_out;
    assign #(DATA_DELAY) arprot=  arprot_out;
    assign #(VALID_DELAY) arvalid=arvalid_out;

simul_axi_fifo
    #(
      .WIDTH(ID_WIDTH+ADDRESS_WIDTH+16),     // total number of output bits
      .LATENCY(LATENCY),                     // minimal delay between inout and output ( 0 - next cycle)
      .DEPTH(DEPTH)                          // maximal number of commands in FIFO
//  parameter OUT_DELAY = 3.5,
    ) simul_axi_fifo_i (
    .clk(clk),         // input              clk,
    .reset(reset),       // input              reset,
    .data_in({arid_in,araddr_in,arlen_in,arsize_in,arburst_in,arcache_in,arprot_in}),     // input  [WIDTH-1:0] data_in,
    .load(set_cmd),        // input              load,
    .input_ready(ready), // output             input_ready,
    .data_out({arid_out,araddr_out,arlen_out,arsize_out,arburst_out,arcache_out,arprot_out}),    // output [WIDTH-1:0] data_out,
    .valid(arvalid_out),       // output             valid,
    .ready(arready));      //  input              ready);

endmodule
