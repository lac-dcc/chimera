/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_bit_sync.v
 *  Purpose:  Single bit synchronizer.
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


`default_nettype none
`timescale 1ps / 1ps


(* KEEP_HIERARCHY = "TRUE" *)
module hbmc_bit_sync #
(
    parameter integer C_SYNC_STAGES = 3,
    parameter         C_RESET_STATE = 1'b0
)
(
    input   wire    arst,
    input   wire    clk,
    input   wire    d,
    output  wire    q
);

    (* shreg_extract = "no", ASYNC_REG = "TRUE" *)  reg [C_SYNC_STAGES - 1:0] d_sync;
    
    
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            d_sync <= {C_SYNC_STAGES{C_RESET_STATE}};
        end else begin
            d_sync <= {d_sync[C_SYNC_STAGES - 2:0], d};
        end 
    end
    
    
    assign q = d_sync[C_SYNC_STAGES - 1];
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
