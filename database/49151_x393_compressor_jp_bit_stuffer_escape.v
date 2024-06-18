// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>bit_stuffer_escape
 * @file bit_stuffer_escape.v
 * @date 2015-10-24  
 * @author Andrey Filippov     
 *
 * @brief Escapes each 0xff with 0x00, 32-bit input and output
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * bit_stuffer_escape.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  bit_stuffer_escape.v is distributed in the hope that it will be useful,
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

module  bit_stuffer_escape(
    input                   xclk,            // pixel clock, sync to incoming data
    input                   rst,             // @xclk

    input            [31:0] din,             // input data, MSB aligned
    input             [1:0] bytes_in,        // number of bytes, valid @ ds (0 means 4)
    input                   in_stb,          // input data/bytes_in strobe
    input                   flush_in,        // end of input data 
    output reg       [31:0] d_out,           // output 32-bit data
    output reg        [1:0] bytes_out,       // valid @dv(only), 0 means 4 bytes 
    output reg              dv,              // output data valid
    output reg              flush_out        // delayed flush in matching the data latency
);
    wire   [3:0] in_ff = {&din[31:24],&din[23:16],&din[15:8],&din[7:0]};
    wire   [3:0] fifo_nempty;
    wire   [3:0] fifo_ff;
    wire   [3:0] fifo_re;
    wire  [31:0] fifo_pre_out;
    // mask output for flushing
    wire  [31:0] fifo_out = fifo_pre_out & {{8{fifo_nempty[3]}},{8{fifo_nempty[2]}},{8{fifo_nempty[1]}},{8{fifo_nempty[0]}}};
    reg    [3:0] flush_pend;
    
    reg    [3:0] bytes_in_mask_w;
    always @* case (bytes_in)
        2'h0 : bytes_in_mask_w <= 4'b1111;
        2'h1 : bytes_in_mask_w <= 4'b1000;
        2'h2 : bytes_in_mask_w <= 4'b1100;
        2'h3 : bytes_in_mask_w <= 4'b1110;
    endcase
    
    
    generate
        genvar i;
            for (i = 0; i < 4; i = i+1) begin: byte_fifo_block
                fifo_same_clock #(
                    .DATA_WIDTH(9),
                    .DATA_DEPTH(4)
                ) fifo_same_clock_i (
                    .rst       (1'b0),                                // input
                    .clk       (xclk),                                // input
                    .sync_rst  (rst),                                 // input
                    .we        (in_stb && bytes_in_mask_w[i]),        // input
                    .re        (fifo_re[i]),                          // input
                    .data_in   ({in_ff[i],din[8*i +: 8]}),            // input[15:0] 
                    .data_out  ({fifo_ff[i],fifo_pre_out[8*i +: 8]}), // output[15:0] 
                    .nempty    (fifo_nempty[i]),                      // output
                    .half_full ()                                     // output reg 
                );
        end
    endgenerate
    
    reg          cry_ff;         // 0xff was the last byte in the previous word
    reg    [1:0] fifo_byte_pntr; // byte pointer in fifo output, starting from MSB (0)
    wire   [3:0] fifo_ff_barrel_w = fifo_byte_pntr[1]?
                                      (fifo_byte_pntr[0]?{fifo_ff[0],fifo_ff[3:1]}:{fifo_ff[1:0],fifo_ff[3:2]}):
                                      (fifo_byte_pntr[0]?{fifo_ff[2:0],fifo_ff[3]}:fifo_ff[3:0]);

    wire   [3:0] fifo_nempty_barrel_w = fifo_byte_pntr[1]?
                                      (fifo_byte_pntr[0]?{fifo_nempty[0],fifo_nempty[3:1]}:{fifo_nempty[1:0],fifo_nempty[3:2]}):
                                      (fifo_byte_pntr[0]?{fifo_nempty[2:0],fifo_nempty[3]}:fifo_nempty[3:0]);
    
    wire  [31:0]  fifo_out_barrel_w = fifo_byte_pntr[1]?
                                      (fifo_byte_pntr[0]?{fifo_out[7:0], fifo_out[31: 8]}:{fifo_out[15:0],fifo_out[31:16]}):
                                      (fifo_byte_pntr[0]?{fifo_out[23:0],fifo_out[31:24]}:fifo_out[31:0]);

// folowing registers are combinatorial signals
    reg          sel3_w; // select source for byte3 (MSB) from the barrel-shifted:0, it's own, 1 - zero (escape)
    reg    [1:0] sel2_w; // select source for byte2 from the barrel-shifted: 0, it's own, 1 - next higher byte, 3 - zero (escape)
    reg    [1:0] sel1_w; // select source for byte1 from the barrel-shifted: 0, it's own, 1 - next higher byte, 3 - zero (escape)
    reg    [1:0] sel0_w; // select source for byte0 (LSB) from the barrel-shifted: 0, it's own, 1 - next higher byte, 2 - two bytes higher,
                         // 3 - zero (escape)
    reg          cry_ff_w; // next value for cry_ff
    reg    [3:0] bytes_rdy_w;   // data is available to generate an output word
    wire         rdy_w = &bytes_rdy_w;
    reg    [1:0] num_zeros_w;   // number of escape zeros in the output word                      
    reg    [3:0] fifo_re_mask_w; // which fifo to read, bitmask (to be AND-ed with &bytes_rdy_w[3:0]}
    
    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b0xxxx: sel3_w <= 0;
        default:  sel3_w <= 1;
    endcase
                          
    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b00xxx: sel2_w <= 0;
        5'b1xxxx: sel2_w <= 1;
        default:  sel2_w <= 3;
    endcase
     
    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b000xx: sel1_w <= 0;
        5'b01xxx: sel1_w <= 1;
        5'b10xxx: sel1_w <= 1;
        default:  sel1_w <= 3;
    endcase

    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b0000x: sel0_w <= 0;
        5'b001xx: sel0_w <= 1;
        5'b010xx: sel0_w <= 1;
        5'b100xx: sel0_w <= 1;
        5'b11xxx: sel0_w <= 2;
        default:  sel0_w <= 3;
    endcase

    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b00001: cry_ff_w <= 1;
        5'b0011x: cry_ff_w <= 1;
        5'b0101x: cry_ff_w <= 1;
        5'b1001x: cry_ff_w <= 1;
        5'b111xx: cry_ff_w <= 1;
        default:  cry_ff_w <= 0;
    endcase
    
    always @* case (sel3_w)
        1'b0 :    bytes_rdy_w[3] <= fifo_nempty_barrel_w[3];
        1'b1 :    bytes_rdy_w[3] <= 1; 
    endcase

    always @* case (sel2_w)
        2'b00 :    bytes_rdy_w[2] <= fifo_nempty_barrel_w[2];
        2'b01 :    bytes_rdy_w[2] <= fifo_nempty_barrel_w[3]; 
        2'b11 :    bytes_rdy_w[2] <= 1;
        default :  bytes_rdy_w[2] <= 'bx;
    endcase

    always @* case (sel1_w)
        2'b00 :    bytes_rdy_w[1] <= fifo_nempty_barrel_w[1];
        2'b01 :    bytes_rdy_w[1] <= fifo_nempty_barrel_w[2]; 
        2'b11 :    bytes_rdy_w[1] <= 1;
        default :  bytes_rdy_w[1] <= 'bx;
    endcase

    always @* case (sel0_w)
        2'b00 :    bytes_rdy_w[0] <= fifo_nempty_barrel_w[0];
        2'b01 :    bytes_rdy_w[0] <= fifo_nempty_barrel_w[1]; 
        2'b10 :    bytes_rdy_w[0] <= fifo_nempty_barrel_w[2]; 
        2'b11 :    bytes_rdy_w[0] <= 1;
    endcase


    always @* casex ({cry_ff,fifo_ff_barrel_w})
        5'b0001x: num_zeros_w <= 1;
        5'b001xx: num_zeros_w <= 1;
        5'b010xx: num_zeros_w <= 1;
        5'b011xx: num_zeros_w <= 2;
        5'b100xx: num_zeros_w <= 1;
        5'b101xx: num_zeros_w <= 2;
        5'b110xx: num_zeros_w <= 2;
        default:  num_zeros_w <= 0;
    endcase


    always @* casex ({num_zeros_w,fifo_byte_pntr})
        4'b00xx: fifo_re_mask_w <= 4'b1111;
        4'b0100: fifo_re_mask_w <= 4'b1110;
        4'b0101: fifo_re_mask_w <= 4'b0111;
        4'b0110: fifo_re_mask_w <= 4'b1011;
        4'b0111: fifo_re_mask_w <= 4'b1101;
        4'b1000: fifo_re_mask_w <= 4'b1100;
        4'b1001: fifo_re_mask_w <= 4'b0110;
        4'b1010: fifo_re_mask_w <= 4'b0011;
        4'b1011: fifo_re_mask_w <= 4'b1001;
        default: fifo_re_mask_w <= 'bx; // impossible num_zeros_w 
    endcase

//    assign fifo_re = flush_pend[2]? fifo_nempty : (rdy_w ? fifo_re_mask_w : 4'b0); // when flushing read whatever is left
    assign fifo_re = fifo_nempty & (({4{rdy_w}} & fifo_re_mask_w) | {4{flush_pend[2]}});// when flushing read whatever is left

    always @(posedge xclk) begin
        if (rst || flush_pend[2])   cry_ff <= 0;
        else if (rdy_w)             cry_ff <= cry_ff_w;
        
        if (rst || flush_pend[2]) fifo_byte_pntr <= 0; // flush reads all the remaining data from FIFO, byte pointer should be reset too
        else if (rdy_w)           fifo_byte_pntr <= fifo_byte_pntr - num_zeros_w;
        
        dv <= rdy_w || (flush_pend[2] && (cry_ff || (|fifo_nempty)));
        if (rdy_w || (flush_pend[2] && (cry_ff || (|fifo_nempty)))) begin
            case (sel3_w)
                1'b0 :    d_out[31:24] <= fifo_out_barrel_w[31:24];
                1'b1 :    d_out[31:24] <= 8'b0; 
            endcase        
            case (sel2_w)
                2'b00 :   d_out[23:16] <= fifo_out_barrel_w[23:16];
                2'b01 :   d_out[23:16] <= fifo_out_barrel_w[31:24]; 
                2'b11 :   d_out[23:16] <= 8'b0;
                default : d_out[23:16] <= 'bx;
            endcase
            case (sel1_w)
                2'b00 :   d_out[15: 8] <= fifo_out_barrel_w[15: 8];
                2'b01 :   d_out[15: 8] <= fifo_out_barrel_w[23:16]; 
                2'b11 :   d_out[15: 8] <= 8'b0;
                default : d_out[15: 8] <= 'bx;
            endcase
            case (sel0_w)
                2'b00 :   d_out[ 7: 0] <= fifo_out_barrel_w[ 7: 0];
                2'b01 :   d_out[ 7: 0] <= fifo_out_barrel_w[15: 8]; 
                2'b10 :   d_out[ 7: 0] <= fifo_out_barrel_w[23:16]; 
                2'b11 :   d_out[ 7: 0] <= 8'b0;
                default : d_out[ 7: 0] <= 'bx;
            endcase
        end
        
        if      (rst)           flush_pend[0] <= 0;
        else if (flush_in)      flush_pend[0] <= 1;
        else if (flush_pend[1]) flush_pend[0] <= 0;
        
        if (rst) flush_pend[1] <= 0;
        else     flush_pend[1] <= flush_pend[0] &&!flush_pend[1] && !rdy_w;
        
        if (rst) flush_pend[3:2] <= 0;
        else     flush_pend[3:2] <= {flush_pend[2:1]};
        
        if (rst) flush_out <=  0;
        else     flush_out <= flush_pend[3]; 
        
        if (rst) bytes_out <= 'bx;
        else if ( rdy_w || flush_pend[2]) casex(bytes_rdy_w[3:0])
            4'b10xx :  bytes_out <= 1;
            4'b110x :  bytes_out <= 2;
            4'b1110 :  bytes_out <= 3;
            default :  bytes_out <= 0; // all 4 bytes
        endcase
    end

endmodule

