// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>fifo_sameclock_control
 * @file fifo_sameclock_control.v
 * @date 2016-01-20  
 * @author Andrey Filippov     
 *
 * @brief BRAM-based fifo control, uses BARM output registers
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * fifo_sameclock_control.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  fifo_sameclock_control.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  fifo_sameclock_control#(
    parameter WIDTH = 9
)(
    input                  clk,
    input                  rst,  // clock-sync reset
    input                  wr,  // write to FIFO (also applied directly to memory)
    input                  rd,  // read from FIFO, internally masked by nempty
    output                 nempty,    // at read side 
    output       [WIDTH:0] fill_in,   // valid at write side, latency 1 for read 
    output reg [WIDTH-1:0] mem_wa,
    output reg [WIDTH-1:0] mem_ra,
    output                 mem_re,
    output                 mem_regen,
    output reg             over,
    output reg             under
    
);
    reg       [WIDTH:0] fill_ram;
    
    reg                 ramo_full;
    reg                 rreg_full;
    
    assign mem_re = (|fill_ram) && (!ramo_full || !rreg_full || rd);
    assign mem_regen =   ramo_full && (!rreg_full || rd);
    assign nempty =    rreg_full;
    assign fill_in =   fill_ram;
    
    always @ (posedge clk) begin
        if     (rst) mem_wa <= 0;
        else if (wr) mem_wa <= mem_wa + 1;

        if      (rst)    mem_ra <= 0;
        else if (mem_re) mem_ra <= mem_ra + 1;

        if      (rst)                fill_ram <= 0;
        else if (wr ^ mem_re)        fill_ram <= mem_re ? (fill_ram - 1) : (fill_ram + 1);

        if      (rst)                ramo_full <= 0;
        else if (mem_re ^ mem_regen) ramo_full <= mem_re;

        if      (rst)                           rreg_full <= 0;
        else if (mem_regen ^ (rd && rreg_full)) rreg_full <= mem_regen;
        
        if (rst)                     under <= 0;
        else                         under <= rd && ! rreg_full;
        
        if (rst)                     over <= 0;
        else                         over <= wr && fill_ram[WIDTH] && !fill_ram[WIDTH-1];
        
    end

endmodule

