// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: bpr_averager.v
 *  Purpose:  The key low level averaging module of the bad pixel replacer.
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


module bpr_averager
(
    input   wire            clk,
    input   wire            cen,
    input   wire            srst,
    
    input   wire    [14:0]  pix_in_0,
    input   wire    [14:0]  pix_in_1,
    
    output  wire    [14:0]  pix_out_avg
);

    localparam  BOTH_BAD  = 2'b00,
                PIX_1_BAD = 2'b01,
                PIX_0_BAD = 2'b10,
                BOTH_GOOD = 2'b11;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    reg     [14:0]  pix_out = {15{1'b0}};
    wire            pix_0_good_flag = pix_in_0[14];
    wire            pix_1_good_flag = pix_in_1[14];
    wire    [14:0]  pix_sum = pix_in_0[13:0] + pix_in_1[13:0] + 1'b1;
    
    always @(posedge clk) begin
        if (cen) begin
            if (srst) begin
                pix_out <= {15{1'b0}};
            end else begin
                case ({pix_1_good_flag, pix_0_good_flag})
                    BOTH_GOOD: pix_out <= {1'b1, pix_sum[14:1]};
                    PIX_0_BAD: pix_out <= pix_in_1;
                    PIX_1_BAD: pix_out <= pix_in_0;
                    BOTH_BAD:  pix_out <= {1'b0, {14{1'b0}}};
                endcase
            end
        end
    end
    
    assign pix_out_avg = pix_out;
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
