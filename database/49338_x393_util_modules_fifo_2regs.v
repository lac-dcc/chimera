// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>fifo_2regs
 * @file fifo_2regs.v
 * @date 2015-02-17  
 * @author Andrey Filippov     
 *
 * @brief Simple two-register FIFO, no over/under check,
 * behaves correctly only for correct inputs
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * fifo_2regs.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  fifo_2regs.v is distributed in the hope that it will be useful,
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

module  fifo_2regs #(
    parameter WIDTH =16)
     (
     input              mrst,
     input              clk,
     input  [WIDTH-1:0] din,
     input              wr,
     input              rd,
     input              srst,
     output [WIDTH-1:0] dout
);
    reg              full_out;
    reg              full_in;
    reg  [WIDTH-1:0] reg_out;
    reg  [WIDTH-1:0] reg_in;
    
    assign dout=reg_out;
    always @ (posedge clk) begin
        if      (mrst)     full_out <=0;
        else if (srst)     full_out <=0;
        else if (wr || rd) full_out <= !(!wr && rd && !full_in);
        
        if      (mrst)     full_in <=0;
        else if (srst)     full_in <=0;
        else if (wr ^rd)   full_in <= wr && (full_out || full_in);
    end
    always @ (posedge clk) begin
        if (wr)                      reg_in <=  din;
        
        if (wr && (!full_out || rd)) reg_out <=  din;
        else if (rd)                 reg_out <=  reg_in;
    end

endmodule

