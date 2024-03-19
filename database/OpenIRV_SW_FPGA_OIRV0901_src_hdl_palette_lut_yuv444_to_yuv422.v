/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: yuv444_to_yuv422.v
 *  Purpose:  Pipelined YUV444 to YUV422 stream color converter.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
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
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module yuv444_to_yuv422
(
    input   wire            clk,
    input   wire            cen,
    
    input   wire    [7:0]   y0_in,
    input   wire    [7:0]   u0_in,
    input   wire    [7:0]   v0_in,
    
    input   wire    [7:0]   y1_in,
    input   wire    [7:0]   u1_in,
    input   wire    [7:0]   v1_in,
    
    output  reg     [7:0]   y0_out = {8{1'b0}},
    output  wire    [7:0]   u_out,
    output  reg     [7:0]   y1_out = {8{1'b0}},
    output  wire    [7:0]   v_out
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [8:0]  u_sum = {9{1'b0}};
    reg     [8:0]  v_sum = {9{1'b0}};
    
    
    always @(posedge clk) begin
        if (cen) begin
            y0_out <= y0_in;
            y1_out <= y1_in;
            u_sum  <= u0_in + u1_in + 1'b1;
            v_sum  <= v0_in + v1_in + 1'b1;
        end
    end
    
    
    assign u_out = u_sum[8:1];
    assign v_out = v_sum[8:1];

endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
