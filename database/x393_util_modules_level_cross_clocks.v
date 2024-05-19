// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>level_cross_clocks
 * @file level_cross_clocks.v
 * @date 2015-07-19  
 * @author Aandrey Filippov     
 *
 * @brief re-sample signal to a different clock to reduce metastability
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * level_cross_clocks.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  level_cross_clocks.v is distributed in the hope that it will be useful,
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

module  level_cross_clocks#(
    parameter WIDTH = 1,
    parameter REGISTER = 2, // number of registers (>=12)
    parameter FAST0 = 1'b0,
    parameter FAST1 = 1'b0
)(
    input              clk,
    input  [WIDTH-1:0] d_in,
    output [WIDTH-1:0] d_out
);
    generate
        genvar i;
        for (i = 0; i < WIDTH ; i = i+1) begin: level_cross_clock_block
            if (REGISTER <= 1)
                level_cross_clocks_ff_bit  #(.FAST1(FAST1))  level_cross_clocks_single_i ( // just a single ff (if metastability is not a problem)
                    .clk   (clk),       // input
                    .d_in  (d_in[i]),   // input
                    .d_out (d_out[i])   // output
                );
            else if (REGISTER == 2)
                level_cross_clocks_sync_bit  #(.FAST0(FAST0),.FAST1(FAST1))  level_cross_clocks_sync_i ( // classic 2-register synchronizer
                    .clk   (clk),       // input
                    .d_in  (d_in[i]),   // input
                    .d_out (d_out[i])   // output
                );
            else
                level_cross_clocks_single_bit #( // >2 bits (first two only are synchronizer)
                    .REGISTER(REGISTER), .FAST0(FAST0), .FAST1(FAST1)
                ) level_cross_clocks_single_i (
                    .clk   (clk),       // input
                    .d_in  (d_in[i]),   // input
                    .d_out (d_out[i])   // output
                );
        end
    endgenerate
endmodule

module  level_cross_clocks_single_bit#(
    parameter REGISTER = 3, // number of registers (>=3)
    parameter FAST0 = 1'b0,
    parameter FAST1 = 1'b0
)(
    input   clk,
    input   d_in,
    output  d_out
);
    reg  [REGISTER - 3 : 0] regs = {REGISTER -2 {FAST1}};
    wire                    d_sync; // after a 2-bit synchronizer
    wire [REGISTER - 2 : 0] regs_next = {regs, d_sync};
    assign d_out = regs[REGISTER -3];
    always @ (posedge clk) begin
        if      (FAST0)  regs <= {REGISTER - 3{d_in}} & regs_next[REGISTER - 3 : 0];   
        else if (FAST1)  regs <= {REGISTER - 3{d_in}} | regs_next[REGISTER - 3 : 0];   
        else             regs <=                        regs_next[REGISTER - 3 : 0]; // | d_in complains about widths mismatch
    end
    level_cross_clocks_sync_bit #(.FAST0(FAST0),.FAST1(FAST1)) level_cross_clocks_sync_bit_i (
        .clk   (clk), // input
        .d_in  (d_in), // input
        .d_out (d_sync) // output
    );
endmodule

// Classic 2-bit (exactly) synchronizer
module  level_cross_clocks_sync_bit #(
    parameter FAST0 = 1'b0,
    parameter FAST1 = 1'b0
)(
    input   clk,
    input   d_in,
    output  d_out
);
`ifndef IGNORE_ATTR
    (* ASYNC_REG = "TRUE" *)
`endif
    reg  [1:0] sync_zer; 
    assign d_out = sync_zer [1];
    always @ (posedge clk) begin
        if      (FAST0) sync_zer <= {sync_zer[0] & d_in, d_in};
        else if (FAST1) sync_zer <= {sync_zer[0] | d_in, d_in};
        else            sync_zer <= {sync_zer[0],d_in};
    end
endmodule

module  level_cross_clocks_ff_bit #( // just a single FF if REGISTER == 1 (if metastability is not a problem)
    parameter FAST1 = 1'b0
) (
    input       clk,
    input      d_in,
    output     d_out
);
    reg d_out_r = FAST1;
    assign d_out = d_out_r;
    always @ (posedge clk) begin
        d_out_r <= d_in;
    end
endmodule


