// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>simul_fifo
 * @file simul_fifo.v
 * @date 2014-04-06  
 * @author Andrey Filippov     
 *
 * @brief simple fifo for simulation
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * simul_fifo.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_fifo.v is distributed in the hope that it will be useful,
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

module simul_fifo
#(
  parameter integer WIDTH=  32,         // total number of output bits
  parameter integer DEPTH=  64,         // maximal number of words in FIFO
//  parameter OUT_DELAY = 3.5,
  parameter integer FIFO_DEPTH=DEPTH+1
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
  integer            count;
  
  assign data_out=    fifo[out_address];
  assign valid=       count!=0;
  assign input_ready= count<DEPTH;

  always @ (posedge clk or posedge reset) begin
    if    (reset)  in_address <= 0;
    else if (load) in_address <= (in_address==(FIFO_DEPTH-1))?0:in_address+1;

    if    (reset)            out_address <= 0;
    else if (valid && ready) out_address <= (out_address==(FIFO_DEPTH-1))?0:out_address+1;

    
    if    (reset)                       count <= 0;
    else if (!(valid && ready) && load) count <= count+1;
    else if (valid && ready && !load)   count <= count-1;
  end

  always @ (posedge clk) begin
    if (load) fifo[in_address] <= data_in;
  end
endmodule