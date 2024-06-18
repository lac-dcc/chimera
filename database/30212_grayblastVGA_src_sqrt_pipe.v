// This program was cloned from: https://github.com/gfg-development/grayblastVGA
// License: Apache License 2.0

/* A sequiential bit by bit calculation of the square root.
 *
 * -----------------------------------------------------------------------------
 *
 * Copyright (C) 2023 Gerrit Grutzeck (g.grutzeck@gfg-development.de)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * -----------------------------------------------------------------------------
 *
 * Author   : Gerrit Grutzeck g.grutzeck@gfg-development.de
 * File     : sqrt.v
 * Create   : Mai 15, 2024
 * Revise   : Mai 15, 2024
 * Revision : 1.0
 *
 * -----------------------------------------------------------------------------
 */
`default_nettype none

module sqrt_pipe #(parameter BIT_WIDTH = 12) (
    input  wire                     clk,
    input  wire                     reset,

    input  wire [BIT_WIDTH - 1 : 0] x_in,
    input  wire                     start,

    output wire [BIT_WIDTH - 1 : 0] x_out,
    output wire                     finish
);

    reg                       idle;
    reg [BIT_WIDTH - 1 : 0]   d;
    reg [BIT_WIDTH - 1 : 0]   c;
    reg [BIT_WIDTH - 1 : 0]   x;
    reg                       flag;

    wire [BIT_WIDTH : 0]      x_diff;

    assign x_diff = x - (c + d);


    always @(posedge clk) begin
        if (reset == 1) begin
            idle          <= 1;
        end else begin
            if (idle == 1) begin
                if (start == 1) begin
                    flag  <= 0;
                    x     <= x_in;
                    c     <= 0;
                    d     <= { 2'b01, {(BIT_WIDTH - 2){1'b0}}};
                    idle  <= 0;
                end
            end else begin
                if ((d <= x) || (flag == 1)) begin
                    flag  <= 1;

                    // check if x_diff is negative by evaluating the MSB
                    if (x_diff[BIT_WIDTH] == 1'b1) begin
                        c <= c >> 1;
                    end else begin
                        c <= (c >> 1) + d;
                        x <= x_diff[BIT_WIDTH - 1 : 0];
                    end
                end

                d         <= d >> 2;

                if ((d[0] == 1'b1) || (d[1] == 1'b1)) begin
                    idle  <= 1;
                end
            end
        end
    end

    assign x_out    = c;
    assign finish   = idle;
endmodule
