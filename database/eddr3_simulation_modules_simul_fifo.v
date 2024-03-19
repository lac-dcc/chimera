/*******************************************************************************
 * Module: simul_fifo
 * Date:2014-04-06  
 * Author: Andrey Filippov     
 * Description: simple fifo for simulation
 *
 * Copyright (c) 2014 Elphel, Inc.
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
 *******************************************************************************/
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