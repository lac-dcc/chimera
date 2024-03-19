/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: pipeline.v
 *  Purpose:  Simple width/depth configurable pipeline delay nodule.
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


module pipeline #
(
    parameter   PIPE_WIDTH  = 32,
    parameter   PIPE_STAGES = 8
)
(
    input   wire                        clk,
    input   wire                        cen,
    input   wire                        srst,
    input   wire    [PIPE_WIDTH - 1:0]  pipe_in,
    output  wire    [PIPE_WIDTH - 1:0]  pipe_out
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    genvar i;
    
    generate
        for (i = 0; i < PIPE_WIDTH; i = i + 1) begin: loop
        
            reg [PIPE_STAGES - 1:0] pipe_gen;
            
            always @(posedge clk) begin
                if (srst) begin
                    pipe_gen <= {PIPE_STAGES{1'b0}};
                end else begin
                    if (cen) begin
                        pipe_gen <= (PIPE_STAGES > 1)? {pipe_gen[PIPE_STAGES - 2:0], pipe_in[i]} : pipe_in[i];
                    end
                end
            end
            
            assign pipe_out[i] = pipe_gen[PIPE_STAGES - 1];
        end
    endgenerate
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
