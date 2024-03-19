/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: bpr_3x1_interpol.v
 *  Purpose:  3x1 pixel row/column averaging module.
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


module bpr_3x1_interpol
(
    input   wire            clk,
    input   wire            cen,
    input   wire            srst,
    
    input   wire    [14:0]  pix_in_0,
    input   wire    [14:0]  pix_in_1,
    input   wire    [14:0]  pix_in_2,
    
    output  wire    [14:0]  pix_out_avg
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    [14:0]  pix_01_avg;
    wire    [14:0]  pix_12_avg;
    
    
    bpr_averager bpr_averager_01
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_in_0), 
        .pix_in_1       (pix_in_1), 
        .pix_out_avg    (pix_01_avg)
    );
    
    
    bpr_averager bpr_averager_12
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_in_1), 
        .pix_in_1       (pix_in_2), 
        .pix_out_avg    (pix_12_avg)
    );
    
    
    bpr_averager bpr_averager_result
    (
        .clk            (clk), 
        .cen            (cen), 
        .srst           (srst), 
        .pix_in_0       (pix_01_avg), 
        .pix_in_1       (pix_12_avg), 
        .pix_out_avg    (pix_out_avg)
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
