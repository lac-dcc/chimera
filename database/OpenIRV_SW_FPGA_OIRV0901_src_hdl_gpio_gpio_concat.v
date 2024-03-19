/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: gpio_concat.v
 *  Purpose:  GPIO concatenation module to simplify AXI GPIO block design.
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


module gpio_concat
(
    output  wire    [19:0]  gpio,
    
    input   wire            btn_0_down,
    input   wire            btn_1_down,
    input   wire            btn_2_down,
    input   wire            btn_3_down,
    
    input   wire            btn_0_up,
    input   wire            btn_1_up,
    input   wire            btn_2_up,
    input   wire            btn_3_up,
    
    input   wire            btn_0_shrt,
    input   wire            btn_1_shrt,
    input   wire            btn_2_shrt,
    input   wire            btn_3_shrt,
    
    input   wire            btn_0_long,
    input   wire            btn_1_long,
    input   wire            btn_2_long,
    input   wire            btn_3_long,
    
    input   wire            btn_0_imm,
    input   wire            btn_1_imm,
    input   wire            btn_2_imm,
    input   wire            btn_3_imm
);
    
    assign  gpio[0]  = btn_0_down;
    assign  gpio[1]  = btn_1_down;
    assign  gpio[2]  = btn_2_down;
    assign  gpio[3]  = btn_3_down;
    
    assign  gpio[4]  = btn_0_up;
    assign  gpio[5]  = btn_1_up;
    assign  gpio[6]  = btn_2_up;
    assign  gpio[7]  = btn_3_up;
    
    assign  gpio[8]  = btn_0_shrt;
    assign  gpio[9]  = btn_1_shrt;
    assign  gpio[10] = btn_2_shrt;
    assign  gpio[11] = btn_3_shrt;
    
    assign  gpio[12] = btn_0_long;
    assign  gpio[13] = btn_1_long;
    assign  gpio[14] = btn_2_long;
    assign  gpio[15] = btn_3_long;
    
    assign  gpio[16] = btn_0_imm;
    assign  gpio[17] = btn_1_imm;
    assign  gpio[18] = btn_2_imm;
    assign  gpio[19] = btn_3_imm;
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
