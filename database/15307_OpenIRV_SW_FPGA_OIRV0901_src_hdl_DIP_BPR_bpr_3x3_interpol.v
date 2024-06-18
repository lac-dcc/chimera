// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: bpr_3x3_interpol.v
 *  Purpose:  3x3 matrix pixel averaging pipelined module.
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


module bpr_3x3_interpol
(
    input   wire            clk,
    input   wire            cen,
    input   wire            srst,
    input   wire            bypass,
    
    input   wire    [15:0]  pix_mid,
    
    input   wire    [14:0]  pix_top_left,
    input   wire    [14:0]  pix_top_mid,
    input   wire    [14:0]  pix_top_right,
    
    input   wire    [14:0]  pix_mid_left,
    input   wire    [14:0]  pix_mid_right,
    
    input   wire    [14:0]  pix_bot_left,
    input   wire    [14:0]  pix_bot_mid,
    input   wire    [14:0]  pix_bot_right,
    
    output  wire    [15:0]  pix_out
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [14:0]  pix_top_avg;
    wire    [14:0]  pix_bot_avg;
    wire    [14:0]  pix_left_avg;
    wire    [14:0]  pix_right_avg;
    
    wire    [14:0]  pix_horiz_avg;
    wire    [14:0]  pix_vert_avg;
    
    wire    [14:0]  pix_interpol;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    bpr_3x1_interpol bpr_3x1_interpol_top
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_top_left), 
        .pix_in_1       (pix_top_mid), 
        .pix_in_2       (pix_top_right), 
        .pix_out_avg    (pix_top_avg)
    );
    
    
    bpr_3x1_interpol bpr_3x1_interpol_bot
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_bot_left), 
        .pix_in_1       (pix_bot_mid), 
        .pix_in_2       (pix_bot_right), 
        .pix_out_avg    (pix_bot_avg)
    );
    
    
    bpr_3x1_interpol bpr_3x1_interpol_left
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_top_left), 
        .pix_in_1       (pix_mid_left), 
        .pix_in_2       (pix_bot_left), 
        .pix_out_avg    (pix_left_avg)
    );
    
    
    bpr_3x1_interpol bpr_3x1_interpol_right
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_top_right), 
        .pix_in_1       (pix_mid_right), 
        .pix_in_2       (pix_bot_right), 
        .pix_out_avg    (pix_right_avg)
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    bpr_averager bpr_averager_horiz
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_left_avg), 
        .pix_in_1       (pix_right_avg), 
        .pix_out_avg    (pix_horiz_avg)
    );
    
    
    bpr_averager bpr_averager_vert
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_top_avg), 
        .pix_in_1       (pix_bot_avg), 
        .pix_out_avg    (pix_vert_avg)
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    bpr_averager bpr_averager_result
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_horiz_avg), 
        .pix_in_1       (pix_vert_avg), 
        .pix_out_avg    (pix_interpol)
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [15:0]  pix_mid_delayed;
    
    pipeline #
    (
        .PIPE_WIDTH ( 16 ),
        .PIPE_STAGES( 4  )
    )
    pipeline_inst
    (
        .clk        (clk), 
        .cen        (cen), 
        .srst       (srst), 
        .pipe_in    (pix_mid), 
        .pipe_out   (pix_mid_delayed)
    );
    
    
    
    reg     [15:0]  out = {16{1'b0}};
    
    always @(posedge clk) begin
        if (cen) begin
            if (srst) begin
                out <= {16{1'b0}};
            end else begin
                if (bypass | pix_mid_delayed[15]) begin
                    out <= pix_mid_delayed;
                end else begin
                    if (pix_interpol[14]) begin
                        out <= {pix_mid_delayed[15:14], pix_interpol[13:0]};
                    end else begin
                        out <= {pix_mid_delayed[15:14], {14{1'b0}}};
                    end
                end
            end
        end
    end
    
    assign pix_out = out;
    
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
