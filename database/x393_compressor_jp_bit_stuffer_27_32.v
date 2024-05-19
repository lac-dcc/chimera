// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>bit_stuffer_27_32
 * @file bit_stuffer_27_32.v
 * @date 2015-10-23  
 * @author Andrey Filippov     
 *
 * @brief Aggregate MSB aligned variable-length (1..27) data to 32-bit words
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * bit_stuffer_27_32.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  bit_stuffer_27_32.v is distributed in the hope that it will be useful,
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

module  bit_stuffer_27_32#(
    parameter DIN_LEN = 27
)(
    input                   xclk,            // pixel clock, sync to incoming data
    input                   rst,             // @xclk
    input     [DIN_LEN-1:0] din,             // input data, MSB aligned
    input             [4:0] dlen,            // input data width
    input                   ds,              // input data valid
    input                   flush_in,        // flush remaining data - should be after last ds. Also prepares for the next block
    output           [31:0] d_out,           // outpt 32-bit data
    output reg        [1:0] bytes_out,       // (0 means 4) valid with dv
    output reg              dv,              // output data valid
    output reg              flush_out        // delayed flush in matching the data latency
);
    localparam  DATA1_LEN = DIN_LEN + 32 - 8;
    localparam  DATA2_LEN = DIN_LEN + 32 - 2;
    localparam  DATA3_LEN = DIN_LEN + 32 - 1;
    reg  [DATA1_LEN-1:0] data1;   // first stage of the barrel shifter
    reg  [DATA2_LEN-1:0] data2;   // second stage of the barrel shifter
    reg  [DATA3_LEN-1:0] data3;   // second stage of the barrel shifter/ output register
    
    reg         [5:0] early_length; // number of bits in the last word (mod 32)
    reg         [5:0] dlen1; // use for the stage 2, MSB - carry out
    reg         [5:0] dlen2; // use for the stage 3
    
    reg        [31:0] dmask2_rom; // data mask (sync with data2) - 1 use new data, 0 - use old data. Use small ROM?
    
    reg         [1:0] stage; // delayed ds or flush
    //reg         [1:0] ds_stage;
    reg         [2:0] flush_stage;
//    reg               flush_pend;
//    wire              flush_ackn = flush_pend && !flush_stage[0] && !stage[0];
    // probably just a single unconditional flush_in delay (not to appear next after ds) will work
//    wire        [4:0] pre_bits_out_w = dlen2[4:0] + 5'h7; 
    wire        [5:0] pre_bits_out_w = {1'b0,dlen2[4:0]} + 6'h7; 

    assign d_out = data3[DATA3_LEN-1 -: 32];
    
    always @ (posedge xclk) begin
    
//        if (rst) flush_pend <= 0;
//        else     flush_pend <= flush_in || (flush_pend && !stage[0]);
    
        if (rst) stage <= 0;
        else     stage <= {stage[0], ds | flush_in};

//        if (rst) ds_stage <= 0;
//        else     ds_stage <= {ds_stage[0], ds};

        if (rst) flush_stage <= 0;
        else     flush_stage <= {flush_stage[1:0], flush_in};
        
        if (rst || flush_in) early_length <= 0;
        else if (ds)         early_length <= early_length[4:0] + dlen; // early_length[5] is not used in calculations, it is just carry out
        
        if     (rst)              dlen1 <= 0;
//        else if (ds)       dlen1 <= early_length; // previous value
        else if (ds || flush_in)  dlen1 <= early_length; // previous value

        if      (rst)        dlen2 <= 0;
        else if (stage[0])   dlen2 <= dlen1; // previous value (position)
        

        // barrel shifter stage 1 (0/8/16/24)
        if (rst) data1 <= 'bx;
//        else if (flush_in) data1 <= 51'b0; // is it needed?
        else if (ds) case (early_length[4:3])
            2'h0: data1 <= {      din, 24'b0};
            2'h1: data1 <= { 8'b0,din, 16'b0};
            2'h2: data1 <= {16'b0,din,  8'b0};
            2'h3: data1 <= {24'b0,din       }; 
        endcase
    
        // barrel shifter stage 2 (0/2/4/6)
        if (rst) data2 <= 'bx;
        else if (flush_stage[0]) data2 <= 0; // flush_stage[0] - equivalent of "if (flush_in) data1 <= 0;"
        else if (stage[0]) case (dlen1[2:1])
            2'h0: data2 <= {      data1, 6'b0};
            2'h1: data2 <= { 2'b0,data1, 4'b0};
            2'h2: data2 <= { 4'b0,data1, 2'b0};
            2'h3: data2 <= { 6'b0,data1      };
        endcase
        
        if (rst) dmask2_rom <= 'bx;
        else if (stage[0]) case (dlen1[4:0])
            5'h00: dmask2_rom <= 32'hffffffff;
            5'h01: dmask2_rom <= 32'h7fffffff;
            5'h02: dmask2_rom <= 32'h3fffffff;
            5'h03: dmask2_rom <= 32'h1fffffff;
            5'h04: dmask2_rom <= 32'h0fffffff;
            5'h05: dmask2_rom <= 32'h07ffffff;
            5'h06: dmask2_rom <= 32'h03ffffff;
            5'h07: dmask2_rom <= 32'h01ffffff;
            5'h08: dmask2_rom <= 32'h00ffffff;
            5'h09: dmask2_rom <= 32'h007fffff;
            5'h0a: dmask2_rom <= 32'h003fffff;
            5'h0b: dmask2_rom <= 32'h001fffff;
            5'h0c: dmask2_rom <= 32'h000fffff;
            5'h0d: dmask2_rom <= 32'h0007ffff;
            5'h0e: dmask2_rom <= 32'h0003ffff;
            5'h0f: dmask2_rom <= 32'h0001ffff;
            5'h10: dmask2_rom <= 32'h0000ffff;
            5'h11: dmask2_rom <= 32'h00007fff;
            5'h12: dmask2_rom <= 32'h00003fff;
            5'h13: dmask2_rom <= 32'h00001fff;
            5'h14: dmask2_rom <= 32'h00000fff;
            5'h15: dmask2_rom <= 32'h000007ff;
            5'h16: dmask2_rom <= 32'h000003ff;
            5'h17: dmask2_rom <= 32'h000001ff;
            5'h18: dmask2_rom <= 32'h000000ff;
            5'h19: dmask2_rom <= 32'h0000007f;
            5'h1a: dmask2_rom <= 32'h0000003f;
            5'h1b: dmask2_rom <= 32'h0000001f;
            5'h1c: dmask2_rom <= 32'h0000000f;
            5'h1d: dmask2_rom <= 32'h00000007;
            5'h1e: dmask2_rom <= 32'h00000003;
            5'h1f: dmask2_rom <= 32'h00000001;
        endcase
        // barrel shifter stage 3 (0/1), combined with output/hold register
        if (rst) data3 <= 'bx;
//        else if (ds_stage[1]) begin
        else if (stage[1]) begin // flush causes shift too
            data3[DATA3_LEN-1 -: 32] <= (~dmask2_rom & (dlen2[5] ? {data3[DATA3_LEN-1-32 : 0],6'b0}: data3[DATA3_LEN-1 -: 32])) |
                               ( dmask2_rom & (dlen2[0] ? {1'b0,data2[DATA2_LEN-1 -: 31]} : data2[DATA2_LEN-1 -: 32]));
            data3[DATA3_LEN-1-32: 0] <= dlen2[0] ? data2[DATA2_LEN-31-1 : 0] : {data2[DATA2_LEN-32-1 : 0], 1'b0};
            
        end

///        dv <= (stage[0] && dlen1[5]) || (flush_stage[1] && (|data3[DATA3_LEN-1 -: 32])); // both ds and flush-caused (full 32-bit out if available)
 
        dv <= (stage[0] && dlen1[5]) || (flush_stage[1] && (|pre_bits_out_w[5:3])); // both ds and flush-caused (full 32-bit out if available)
// no difference in number of cells
//        if      (rst )                bytes_out <= 0; // if the dv was caused by 32 bits full - output 4 bytes
//        else if (ds_stage[1])         bytes_out <= 0; // if the dv was caused by 32 bits full - output 4 bytes
//        if  (rst || ds_stage[1]) bytes_out <= 0; // if the dv was caused by 32 bits full - output 4 bytes

// bytes_out valid with dv
        if      (rst || stage[0])     bytes_out <= 0; // if the dv was caused by 32 bits full - output 4 bytes
        else if (flush_stage[1])      bytes_out <= pre_bits_out_w[4:3];
    
        flush_out <= flush_stage[2];

    end

endmodule

