/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: sync_cdc_bit.v
 *  Purpose:  Single bit synchronizer.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020, Vaagn Oganesyan <ovgn@protonmail.com>
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


module sync_cdc_bit #
(
    parameter integer C_SYNC_STAGES = 3
)
(
    input   wire    clk,
    input   wire    d,
    output  wire    q
);

    xpm_cdc_single #
    (
        .DEST_SYNC_FF   ( C_SYNC_STAGES ),  // DECIMAL; range: 2-10
        .INIT_SYNC_FF   ( 0             ),  // DECIMAL; 0 = disable simulation init values, 1=enable simulation init values
        .SIM_ASSERT_CHK ( 0             ),  // DECIMAL; 0 = disable simulation messages, 1=enable simulation messages
        .SRC_INPUT_REG  ( 0             )   // DECIMAL; 0 = do not register input, 1 = register input
    )
    xpm_cdc_single_inst
    (
        .src_clk        ( 1'b0 ),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
        .dest_clk       ( clk  ),   // 1-bit input: Clock signal for the destination clock domain.
        .src_in         ( d    ),   // 1-bit input: Input signal to be synchronized to dest_clk domain.
        .dest_out       ( q    )    // 1-bit output: src_in synchronized to the destination clock domain. This output is registered.
    );
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
