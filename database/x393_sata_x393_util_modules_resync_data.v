// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: resync_data
 * Date:2015-12-22  
 * Author: Andrey Filippov
 * Description: Resynchronize data between clock domains. No over/underruns
 * are checker, start with half FIFO full. Async reset sets
 * specifies output values regardless of the clocks 
 *
 * Copyright (c) 2014 Elphel, Inc.
 * resync_data.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  resync_data.v is distributed in the hope that it will be useful,
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

module resync_data
#(
  parameter integer DATA_WIDTH=16,
  parameter integer DATA_DEPTH=4, // >= 2
  parameter         INITIAL_VALUE = 0
  
) (
    input                       arst,     // async reset, active high (global)
    input                       srst,     // same as arst, but relies on the clocks 
    input                       wclk,     // write clock - positive edge
    input                       rclk,     // read clock - positive edge
    input                       we,       // write enable
    input                       re,       // read enable
    input      [DATA_WIDTH-1:0] data_in,  // input data
    output reg [DATA_WIDTH-1:0] data_out, // output data
    output reg                  valid     // data valid @ rclk
  );
    localparam integer DATA_2DEPTH=(1<<DATA_DEPTH)-1;
    reg  [DATA_WIDTH-1:0] ram [0:DATA_2DEPTH];
    reg  [DATA_DEPTH-1:0] raddr;
    reg  [DATA_DEPTH-1:0] waddr;
    
    reg             [1:0] rrst = 3;

    always @ (posedge  rclk or posedge arst) begin
        if      (arst)                         valid <= 0;
        else if (srst)                         valid <= 0;
        else if (&waddr[DATA_DEPTH-2:0] && we) valid <= 1; // just once set and stays until reset
    end
    
    
    always @ (posedge  wclk or posedge arst) begin
        if      (arst) waddr <= 0;
        else if (srst) waddr <= 0;
        else if (we)   waddr <= waddr + 1;
    end
    
    always @ (posedge  rclk or posedge arst) begin
        if      (arst) rrst <= 3;
        else if (srst) rrst <= 3; // resync to rclk
        else           rrst <= rrst << 1;
    
        if      (arst)          raddr <= 0;
        else if (rrst[0])       raddr <= 0;
        else if (re || rrst[1]) raddr <= raddr + 1;
        
        if (arst)               data_out <= INITIAL_VALUE;
        else if (rrst[0])       data_out <= INITIAL_VALUE;
        else if (re || rrst[1]) data_out <= ram[raddr];
    end
    
    always @ (posedge  wclk) begin
          if (we) ram[waddr] <= data_in;
    end
    
endmodule

