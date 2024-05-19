// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>varlen_encode393
 * @file varlen_encode393.v
 * @author Andrey Filippov     
 *
 * @brief Part of the Huffman encoder for JPEG compressor - variable length encoder.
 * Used double clock rate, superseded by varlen_encode_snglclk, left for comparison.
 * 
 * Encoder will work 2 cycles per "normal" word, 1 cycle for codes "00" and "f0",
 * only magnitude output is needed ASAP (2 cycles, the value out should be
 * valid on the 5-th cycle - it will latency 4 cycles run each other cycle.
 * Later implementsed a shortcut - all codes processed in 2 cycles.
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * varlen_encode393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * varlen_encode393.v is distributed in the hope that it will be useful,
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
//used the other edge of the clk2x

module    varlen_encode393 (
    input             clk,       // twice frequency - uses negedge inside
    input              en,       // will enable registers. 0 - freeze at once
    input              start, // (not faster than each other cycle)
    input       [11:0] d,        // 12-bit signed
    output reg   [3:0] l,        // [3:0] code length
    output reg   [3:0] l_late,// delayed l (sync to q)
    output reg  [10:0] q);    // [10:0]code

    reg    [11:0] d1;
    reg    [10:0] q0;
    reg     [2:0] cycles;

    wire          this0 =  |d1[ 3:0];
    wire          this1 =  |d1[ 7:4];
    wire          this2 =  |d1[10:8];
    wire    [1:0] codel0 = {|d1[ 3: 2],d1[ 3] || (d1[ 1] & ~d1[ 2])};
    wire    [1:0] codel1 = {|d1[ 7: 6],d1[ 7] || (d1[ 5] & ~d1[ 6])};
    wire    [1:0] codel2 = {|d1[   10],          (d1[ 9] & ~d1[10])};
    wire    [3:0] codel =  this2? {2'b10,codel2[1:0]} :
                     (this1? {2'b01, codel1[1:0]} :
                             (this0 ? {2'b00,codel0[1:0]} : 4'b1111));    // after +1 will be 0;

    always @ (negedge clk)  if (en) begin
        cycles[2:0]    <= {cycles[1:0],start};
    end

    always @ (negedge clk) if (en && start) begin
        d1[  11]    <=  d[11];
        d1[10:0]    <=  d[11]?-d[10:0]:d[10:0];
    end

    always @ (negedge clk) if (en & cycles[0]) begin
        q0[10:0]    <= d1[11]?~d1[10:0]:d1[10:0];
        l    <= codel[3:0]+1;    // needed only ASAP, valid only 2 cycles after start
    end
    
    always @ (negedge clk) if (en & cycles[2]) begin
        q[10:0]    <= q0[10:0];
        l_late[3:0]    <= l[3:0];
    end

endmodule
