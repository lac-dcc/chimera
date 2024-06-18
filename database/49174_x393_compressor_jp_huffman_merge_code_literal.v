// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>huffman_merge_code_literal
 * @file huffman_merge_code_literal.v
 * @date 2015-10-22  
 * @author Andrey Filippov     
 *
 * @brief Merge 1-16 bits of Huffman code with 0..11 bits of literal data,
 * align result to MSB : {huffman,literal, {n{1'b0}}
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * huffman_merge_code_literal.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  huffman_merge_code_literal.v is distributed in the hope that it will be useful,
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

module  huffman_merge_code_literal(
    input             clk,
    input             in_valid,
    input      [15:0] huff_code,
    input      [ 3:0] huff_code_len, // 0 means 16
    input      [10:0] literal,
    input      [ 3:0] literal_len,
    output reg        out_valid, // latency 5 from input
    output reg [26:0] out_bits,  // latency 5 from input
    output reg [ 4:0] out_len    // latency 5 from input
);
    reg        [10:0] lit0;
    reg        [10:0] lit1;
    reg        [10:0] lit2;
    reg        [15:0] huff0; // SR-s will be extracted?
    reg        [15:0] huff1;
    reg        [15:0] huff2;
    reg        [26:0] data3;
    reg         [3:0] llen0;
    reg         [3:0] llen1;
    reg         [3:0] llen2;
    reg         [4:0] olen3;
    reg         [3:0] hlen0;
    reg         [3:0] hlen1;
    reg         [4:0] hlen2;
    reg         [3:0] hlen2m1;
    reg         [1:0] hlen3m1;
    reg         [3:0] valid;
    
    always @ (posedge clk) begin
        // input layer 0
        lit0 <= literal;
        llen0 <= literal_len;
        huff0 <= huff_code;
        hlen0 <= huff_code_len;
        valid[0] <= in_valid;
        // layer 1
        casex (llen0[3:2])
            2'b1x: lit1 <= lit0;
            2'b01: lit1 <= {lit0[6:0],4'b0};
            2'b00: lit1 <= {lit0[2:0],8'b0};
        endcase
        llen1 <= llen0;
        huff1 <= huff0;
        hlen1 <= hlen0;
        valid[1] <= valid[0];
        // layer 2
        case (llen1[1:0])
            2'b11: lit2 <= lit1;
            2'b10: lit2 <= {lit1[9:0], 1'b0};
            2'b01: lit2 <= {lit1[8:0], 2'b0};
            2'b00: lit2 <= {lit1[7:0], 3'b0};
        endcase
        llen2 <= llen1;
        huff2 <= huff1;
        hlen2 <= {~(|hlen1),hlen1};
        hlen2m1 <= hlen1 - 1; // s0 
        valid[2] <= valid[1];
        // layer 3
        olen3 <= hlen2 + llen2;
        case (hlen2m1[3:2])
            2'b11: data3 <= {huff2[15:0],lit2[10:0]};
            2'b10: data3 <= {huff2[11:0],lit2[10:0], 4'b0};
            2'b01: data3 <= {huff2[ 7:0],lit2[10:0], 8'b0};
            2'b00: data3 <= {huff2[ 3:0],lit2[10:0],12'b0};
        endcase
        hlen3m1 <= hlen2m1[1:0];
        valid[3] <= valid[2];
        //layer4
        out_len <= olen3;
        case (hlen3m1[1:0])
            2'b11: out_bits <= data3;
            2'b10: out_bits <= {data3[25:0], 1'b0};
            2'b01: out_bits <= {data3[24:0], 2'b0};
            2'b00: out_bits <= {data3[23:0], 3'b0};
        endcase
        out_valid <= valid[3];
    end    
    

endmodule

