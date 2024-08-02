// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hb_clk_obuf.v
 *  Purpose:  HyperBus clock forwarding output buffer.
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


module hb_clk_obuf #
(
    parameter integer DRIVE_STRENGTH = 8,
    parameter         SLEW_RATE      = "SLOW"
)
(
    input   wire    cen,
    input   wire    clk,
    output  wire    hb_ck_p,
    output  wire    hb_ck_n
);

    wire    oddr_clk_p;
    wire    oddr_clk_n;

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    ODDR #
    (
        .DDR_CLK_EDGE ( "SAME_EDGE" ),  // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT         ( 1'b0        ),  // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE       ( "ASYNC"     )   // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_ck_p
    (
        .Q  ( oddr_clk_p ),     // 1-bit DDR output
        .C  ( clk        ),     // 1-bit clock input
        .CE ( 1'b1       ),     // 1-bit clock enable input
        .D1 ( cen        ),     // 1-bit data input (positive edge)
        .D2 ( 1'b0       ),     // 1-bit data input (negative edge)
        .R  ( 1'b0       ),     // 1-bit reset
        .S  ( 1'b0       )      // 1-bit set
    );
    
    
    OBUF #
    (
        .DRIVE  ( DRIVE_STRENGTH ),     // Specify the output drive strength
        .SLEW   ( SLEW_RATE      )      // Specify the output slew rate
    )
    OBUF_ck_p
    (
        .I  ( oddr_clk_p ),     // Buffer input
        .O  ( hb_ck_p    )      // Buffer output (connect directly to top-level port)
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    ODDR #
    (
        .DDR_CLK_EDGE ( "SAME_EDGE" ),  // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT         ( 1'b0        ),  // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE       ( "ASYNC"     )   // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_ck_n
    (
        .Q  ( oddr_clk_n ),     // 1-bit DDR output
        .C  ( clk        ),     // 1-bit clock input
        .CE ( 1'b1       ),     // 1-bit clock enable input
        .D1 ( ~cen       ),     // 1-bit data input (positive edge)
        .D2 ( 1'b1       ),     // 1-bit data input (negative edge)
        .R  ( 1'b0       ),     // 1-bit reset
        .S  ( 1'b0       )      // 1-bit set
    );
    
    
    OBUF #
    (
        .DRIVE  ( DRIVE_STRENGTH ),     // Specify the output drive strength
        .SLEW   ( SLEW_RATE      )      // Specify the output slew rate
    )
    OBUF_ck_n
    (
        .I  ( oddr_clk_n ),     // Buffer input
        .O  ( hb_ck_n    )      // Buffer output (connect directly to top-level port)
    );
    
    

endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
