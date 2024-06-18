// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>simul_axi_fifo
 * @file simul_axi_fifo.v
 * @date 2014-03-23  
 * @author Andrey Filippov    
 *
 * @brief Simulation model for FIFO in AXI channels
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * simul_axi_fifo.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * simul_axi_fifo.v is distributed in the hope that it will be useful,
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

module simul_axi_fifo
#(
  parameter integer WIDTH=  64,         // total number of output bits
  parameter integer LATENCY=0,          // minimal delay between inout and output ( 0 - next cycle)
  parameter integer DEPTH=8,            // maximal number of commands in FIFO
//  parameter OUT_DELAY = 3.5,
  parameter integer FIFO_DEPTH=LATENCY+DEPTH+1
//  parameter integer DATA_2DEPTH=(1<<DATA_DEPTH)-1
)(
  input              clk,
  input              reset,
  input  [WIDTH-1:0] data_in,
  input              load,
  output             input_ready,
  output [WIDTH-1:0] data_out,
  output             valid,
  input              ready);
  
  reg  [WIDTH-1:0]   fifo [0:FIFO_DEPTH-1];
  integer            in_address;
  integer            out_address;
  integer            in_count;
  integer            out_count;
  reg    [LATENCY:0] latency_delay_r;
  
  wire               out_inc=latency_delay[LATENCY];
  wire               input_ready_w =  in_count<DEPTH;
  wire               load_and_ready = load & input_ready_w; // Masked load with input_ready 07/06/2016
  wire [LATENCY+1:0] latency_delay={latency_delay_r,load_and_ready};             
  
  assign data_out=    fifo[out_address];
  assign valid=       out_count!=0;
  
  assign input_ready= input_ready_w;
//  assign out_inc={

  always @ (posedge clk or posedge reset) begin
    if (reset) latency_delay_r <= 0;
    else       latency_delay_r <= latency_delay[LATENCY:0];

    if      (reset)          in_address <= 0;
    else if (load_and_ready) in_address <= (in_address==(FIFO_DEPTH-1))?0:in_address+1;

    if    (reset)            out_address <= 0;
    else if (valid && ready) out_address <= (out_address==(FIFO_DEPTH-1))?0:out_address+1;
    
    if    (reset)                                 in_count <= 0;
    else if (!(valid && ready) && load_and_ready) in_count <= in_count+1;
    else if (valid && ready && !load_and_ready)   in_count <= in_count-1;

    if    (reset)                          out_count <= 0;
    else if (!(valid && ready) && out_inc) out_count <= out_count+1;
    else if (valid && ready && !out_inc)   out_count <= out_count-1;
  end
  always @ (posedge clk) begin
    if (load_and_ready) fifo[in_address] <= data_in;
  end
  
endmodule