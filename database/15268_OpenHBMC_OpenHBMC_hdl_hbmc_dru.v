// This program was cloned from: https://github.com/OVGN/OpenHBMC
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_dru.v
 *  Purpose:  Data recovery unit.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2022, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 * ----------------------------------------------------------------------------
 */


/*----------------------------------------------------------------------------------------------------------------------------*/
/*
 * STEP_0
 * 
 * Samples at the edges of the RWDS strobe are "X", i.e. metastable:
 *
 * ____________________________  ______  ______  ______  ______  ______  _     _  ______  ______  ______  ____________________
 * DATA                        \/ D[0] \/ D[1] \/ D[2] \/ D[3] \/ D[4] \/  ...  \/D(N+1)\/D(N+2)\/D(N+3)\/                    
 * ____________________________/\______/\______/\______/\______/\______/\_ ... _/\______/\______/\______/\____________________
 *                               ______          ______          ______           ______          ______                      
 * RWDS                         /      \        /      \        /      \         /      \        /      \                     
 * ____________________________/        \______/        \______/        \_ ... _/        \______/        \____________________
 *                                                                                                                            
 *  ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^        ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^
 *  0   0   0   0   0   0   0   X   1   X   0   X   1   X   0   X   1   X        X   1   X   0   X   1   X   0   0   0   0   0
 */
/*----------------------------------------------------------------------------------------------------------------------------*/
/*
 * STEP_1             STEP_2                    STEP_3     STEP_4     STEP_5     STEP_6     STEP_7
 *
 * Deserializer       a. Samples with single    XOR edge   Removed    Bit[5]     Removed    U value
 * possible output       X value produce two    detection  repeated   is carry   repeated   can be
 * values for RWDS:      possible samples.      vectors:   vectors:   out:       vectors:   1 or 0:
 *                    b. Samples with two X
 *                       values produce four
 *     543210            possible samples.
 *     ------         c. Repeated samples
 *     000000            are removed.
 *     00000x                                    
 *     000001            543210                 543210     543210     543210     543210     543210
 *     0000x1            ------                 ------     ------     ------     ------     ------
 *     000011            000000                 00000U     00000U     c0000U     c0000U     c00000 - OK, check carry_in
 * +-- 000x11            000001                 00001U     00001U     c0001U     c0001U     c00010 - OK, check carry_in
 * |                     000011                 00010U     00010U     c0010U     c0010U     c00100 - OK, check carry_in
 * +-> 000111 <----+     000111                 00100U     00100U     c0100U     c0100U     c01000 - OK, check carry_in
 *     00x11x      |     000110                 00101U     00101U     c0101U     c0101U     c01010 - OK, check carry_in
 *     001110      |     001110                 01001U     01001U     c1001U     c1001U     c10010 - OK, check carry_in
 *     0x11x0      |     001111                 01000U     01000U     c1000U     c1000U     c10000 - OK, check carry_in
 *     011100      |     001100                 01010U     01010U     c1010U     c1010U     c10100 - OK, check carry_in
 *     x11x00      |     011100                 10010U     10010U     c0010U     ^carry_out
 *     111000 --+  |     011110                 10001U     10001U     c0001U                c00001 - OK, carry_in is impossible
 *     11x00x   |  |     011000                 10100U     10100U     c0100U                c00011 - NO, reject (stuck 1's)
 *     110001   |  |     111000                 00100U     10000U     c0000U                c00101 - OK, carry_in is impossible
 *     1x00x1   |  |     111100                 00010U                ^carry_out            c01001 - OK, carry_in is impossible
 *     100011   |  |     110000                 01000U                                      c01011 - NO, reject ( > 2 edges + stuck 1's)
 *     x00x11 --|--+     110001                 01001U                                      c10011 - NO, reject ( > 2 edges + stuck 1's)
 *              |        111001                 00101U                                      c10001 - OK, carry_in is impossible
 *     11x000 <-+        100001                 10001U                                      c10101 - NO, reject ( > 2 edges)
 *     110000            100011                 10010U                                      ^carry_out
 *     1x0000            110011                 01010U
 *     100000            100111                 10100U
 *     x00000            100000                 10000U
 *     000000                                        ^
 *                                                   Undefined,
 *                                                  (depends on
 *                                                   previous
 *                                                   sample)
 */
/*----------------------------------------------------------------------------------------------------------------------------*/
/*
 *  Result:
 *
 *  5 43210
 *  - -----
 *  c 00000 - OK, check carry_in
 *  c 00010 - OK, check carry_in
 *  c 00100 - OK, check carry_in
 *  c 01000 - OK, check carry_in
 *  c 01010 - OK, check carry_in
 *  c 10010 - OK, check carry_in
 *  c 10000 - OK, check carry_in
 *  c 10100 - OK, check carry_in
 *  c 00001 - OK, carry_in is impossible
 *  c 00101 - OK, carry_in is impossible
 *  c 01001 - OK, carry_in is impossible
 *  c 10001 - OK, carry_in is impossible
 *  ^carry_out
 */
/*----------------------------------------------------------------------------------------------------------------------------*/


`default_nettype none
`timescale 1ps / 1ps


module hbmc_dru
(
    input   wire            clk,
    input   wire            arst,
    input   wire    [5:0]   rwds_oversampled,
    input   wire    [47:0]  data_oversampled,
    output  wire            recov_valid,
    output  wire    [15:0]  recov_data,
    output  reg             align_error,
    output  reg             rwds_error
);

/*----------------------------------------------------------------------------------------------------------------------------*/

    reg             prev_last_bit;
    reg     [5:0]   rwds_pair_xor;
    reg     [47:0]  data_pipeline;
    
    
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            prev_last_bit <= 1'b0;
            rwds_pair_xor <=  {6{1'b0}};
            data_pipeline <= {48{1'b0}};
        end else begin
            /* Single bit pipeline delay for input data
             * to compensate edge detection stage delay */
            data_pipeline <= data_oversampled;
            
            /* Saving previous sample last bit to detect
             * an edge at the transition of two samples */
            prev_last_bit <= rwds_oversampled[5];
            
            /* RWDS edge detection vector */
            rwds_pair_xor <= {
                                 ^ rwds_oversampled[5:4],
                                 ^ rwds_oversampled[4:3],
                                 ^ rwds_oversampled[3:2],
                                 ^ rwds_oversampled[2:1],
                                 ^ rwds_oversampled[1:0],
                                   rwds_oversampled[0] ^ prev_last_bit
                             };
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    genvar i;
    
    wire    [7:0]   data_mux_0;
    wire    [7:0]   data_mux_1;
    wire    [7:0]   data_mux_2;
    wire    [7:0]   data_mux_3;
    wire    [7:0]   data_mux_4;
    wire    [7:0]   data_mux_5;
    
    
    /* Data bus states at different sample positions */
    generate
        for (i = 0; i < 8; i = i + 1) begin : data_sample_mux
            assign data_mux_0[i] = data_pipeline[6 * i + 0];
            assign data_mux_1[i] = data_pipeline[6 * i + 1];
            assign data_mux_2[i] = data_pipeline[6 * i + 2];
            assign data_mux_3[i] = data_pipeline[6 * i + 3];
            assign data_mux_4[i] = data_pipeline[6 * i + 4];
            assign data_mux_5[i] = data_pipeline[6 * i + 5];
        end
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg             carry;
    reg     [7:0]   data_0;
    reg     [7:0]   data_1;
    reg     [7:0]   data_2;
    reg     [1:0]   data_cnt;
    
    
    /* Current process performs data bytes recovery,
     * based on RWDS strobe state. At every cycle
     * FSM can recover and output up to 3 bytes max */
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            carry      <= 1'b0;
            data_0     <= {8{1'b0}};
            data_1     <= {8{1'b0}};
            data_2     <= {8{1'b0}};
            data_cnt   <= {2{1'b0}};
            rwds_error <= 1'b0;
        end else begin
            
            /* This carry flag is used to indicate that
             * RWDS edge was detected at the last bit of
             * the previous 6-bit sample and valid data
             * should be captured at the 0-bit position
             * of the current data sample */
            carry <= rwds_pair_xor[5];
            
            case (rwds_pair_xor[4:0])
                
                5'b00000: begin
                    data_0   <= (carry)? data_mux_0 : data_0;
                    data_1   <= data_1;
                    data_2   <= data_2;
                    data_cnt <= (carry)? 2'd1 : 2'd0;
                end
                
                5'b00010: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_2;
                    data_1   <= (carry)? data_mux_2 : data_1;
                    data_2   <= data_2;
                    data_cnt <= (carry)? 2'd2 : 2'd1;
                end
                
                5'b00100: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_3;
                    data_1   <= (carry)? data_mux_3 : data_1;
                    data_2   <= data_2;
                    data_cnt <= (carry)? 2'd2 : 2'd1;
                end
                
                5'b01000: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_4;
                    data_1   <= (carry)? data_mux_4 : data_1;
                    data_2   <= data_2;
                    data_cnt <= (carry)? 2'd2 : 2'd1;
                end
                
                5'b01010: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_2;
                    data_1   <= (carry)? data_mux_2 : data_mux_4;
                    data_2   <= (carry)? data_mux_4 : data_2;
                    data_cnt <= (carry)? 2'd3 : 2'd2;
                end
                
                5'b10010: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_2;
                    data_1   <= (carry)? data_mux_2 : data_mux_5;
                    data_2   <= (carry)? data_mux_5 : data_2;
                    data_cnt <= (carry)? 2'd3 : 2'd2;
                end
                
                5'b10000: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_5;
                    data_1   <= (carry)? data_mux_5 : data_1;
                    data_2   <= data_2;
                    data_cnt <= (carry)? 2'd2 : 2'd1;
                end
                
                5'b10100: begin
                    data_0   <= (carry)? data_mux_0 : data_mux_3;
                    data_1   <= (carry)? data_mux_3 : data_mux_5;
                    data_2   <= (carry)? data_mux_5 : data_2;
                    data_cnt <= (carry)? 2'd3 : 2'd2;
                end
                
                5'b00001: begin
                    data_0   <= data_mux_1;
                    data_1   <= data_1;
                    data_2   <= data_2;
                    data_cnt <= 2'd1;
                end
                
                5'b00101: begin
                    data_0   <= data_mux_1;
                    data_1   <= data_mux_3;
                    data_2   <= data_2;
                    data_cnt <= 2'd2;
                end
                
                5'b01001: begin
                    data_0   <= data_mux_1;
                    data_1   <= data_mux_4;
                    data_2   <= data_2;
                    data_cnt <= 2'd2;
                end
                
                5'b10001: begin
                    data_0   <= data_mux_1;
                    data_1   <= data_mux_5;
                    data_2   <= data_2;
                    data_cnt <= 2'd2;
                end
                
                default: begin
                    data_0     <= data_0;
                    data_1     <= data_1;
                    data_2     <= data_2;
                    data_cnt   <= 2'd0;
                    rwds_error <= 1'b1;
                end
                
            endcase
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [15:0]  temp;
    reg     [15:0]  data;
    reg     [1:0]   temp_valid;
    reg             data_valid;
    
    
    /* As data bytes recovery FSM produces unaligned
     * data stream, this FSM performs data realignment
     * by repacking incoming 1-3 byte width stream into
     * fixed 16-bit stream with valid strobe */
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            temp        <= {16{1'b0}};
            data        <= {16{1'b0}};
            temp_valid  <= 2'b00;
            data_valid  <= 1'b0;
            align_error <= 1'b0;
        end else begin
            case (data_cnt)
                2'd0: begin
                    if (temp_valid == 2'b11) begin
                        data       <= temp;
                        data_valid <= 1'b1;
                        temp_valid <= 2'b00;
                    end else begin
                        data_valid <= 1'b0;
                    end
                end
                
                2'd1: begin
                    case (temp_valid)
                        2'b00: begin
                            data_valid <= 1'b0;
                            temp[7:0]  <= data_0;
                            temp_valid <= 2'b01;
                        end
                        
                        2'b01: begin
                            data       <= {data_0, temp[7:0]};
                            data_valid <= 1'b1;
                            temp_valid <= 2'b00;
                        end
                        
                        2'b11: begin
                            data       <= temp;
                            data_valid <= 1'b1;
                            temp[7:0]  <= data_0;
                            temp_valid <= 2'b01;
                        end
                        
                        default: begin
                            align_error <= 1'b1;
                        end
                    endcase
                end
                
                2'd2: begin
                    case (temp_valid)
                        2'b00: begin
                            data       <= {data_1, data_0};
                            data_valid <= 1'b1;
                            temp_valid <= 2'b00;
                        end
                        
                        2'b01: begin
                            data       <= {data_0, temp[7:0]};
                            data_valid <= 1'b1;
                            temp[7:0]  <= data_1;
                            temp_valid <= 2'b01;
                        end
                        
                        2'b11: begin
                            data       <= temp;
                            data_valid <= 1'b1;
                            temp       <= {data_1, data_0};
                            temp_valid <= 2'b11;
                        end
                        
                        default: begin
                            align_error <= 1'b1;
                        end
                    endcase
                end
                
                2'd3: begin
                    case (temp_valid)
                        2'b00: begin
                            data       <= {data_1, data_0};
                            data_valid <= 1'b1;
                            temp[7:0]  <= data_2;
                            temp_valid <= 2'b01;
                        end
                        
                        2'b01: begin
                            data       <= {data_0, temp[7:0]};
                            data_valid <= 1'b1;
                            temp       <= {data_2, data_1};
                            temp_valid <= 2'b11;
                        end
                        
                        default: begin
                            align_error <= 1'b1;
                        end
                    endcase
                end
            endcase
        end
    end
    
    
    assign recov_valid = data_valid;
    assign recov_data  = {data[7:0], data[15:8]};


endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
