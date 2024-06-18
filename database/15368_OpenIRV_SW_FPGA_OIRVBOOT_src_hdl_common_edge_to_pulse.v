// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: edge_to_pulse.v
 *  Purpose:  Current module generates a positive pulse of specified duration
 *            for each incoming positive edge.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except edge_in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to edge_in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module edge_to_pulse #
(
    parameter CLK_HZ = 27000000,
    parameter PULSE_DURATION_MS = 1,
    parameter EDGE_TYPE = "RISING"      // RISING / FALLING / BOTH
)
(
    input   wire    clk,
    input   wire    rstn,
    input   wire    edge_in,
    output  reg     pulse_out = 1'b0
);
    
    localparam DELAY_MS = CLK_HZ / 1000;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg             in_1 = 1'b0;
    reg             state = 1'b0;
    reg     [31:0]  delay_tc   = 32'd0;
    
    
    always @(posedge clk) begin
        if (~rstn) begin
            state <= 1'b0;
            in_1  <= 1'b0;
            pulse_out <= 1'b0;
        end else begin
            in_1 <= edge_in;
        
            case (state)
                1'b0: begin
                    delay_tc <= 32'd0;
                    if (EDGE_TYPE == "BOTH") begin
                        state <= (edge_in ^ in_1)? 1'b1 : 1'b0;
                    end else begin
                        if (EDGE_TYPE == "RISING") begin
                            state <= (edge_in & ~in_1)? 1'b1 : 1'b0;
                        end else begin
                            state <= (~edge_in & in_1)? 1'b1 : 1'b0;
                        end
                    end
                end
                
                1'b1: begin
                    if (delay_tc < PULSE_DURATION_MS * DELAY_MS) begin
                        delay_tc <= delay_tc + 1'b1;
                        pulse_out <= 1'b1;
                    end else begin
                        state <= 1'b0;
                        pulse_out <= 1'b0;
                    end
                end
            endcase
        end
    end


endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
