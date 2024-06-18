// This program was cloned from: https://github.com/gfg-development/grayblastVGA
// License: Apache License 2.0

/* A combinatoric bit by bit calculation of the square root.
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

module sqrt #(parameter BIT_WIDTH = 12) (
    input  wire [BIT_WIDTH - 1 : 0] x_in,
    output wire [BIT_WIDTH - 1 : 0] x_out
);

    wire [BIT_WIDTH * BIT_WIDTH / 2 - 1 : 0]         d;
    wire [BIT_WIDTH * (BIT_WIDTH / 2 + 1) - 1 : 0]   c;
    wire [BIT_WIDTH * (BIT_WIDTH / 2 + 1) - 1 : 0]   x;
    wire [(BIT_WIDTH + 1)  * BIT_WIDTH / 2 - 1: 0]   x_diff;

    assign x[BIT_WIDTH - 1 : 0] = x_in;
    assign c[BIT_WIDTH - 1 : 0] = 0;

    genvar i;
    generate
        for (i = 0; i < BIT_WIDTH / 2; i = i + 1) begin
            assign d[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] = 1 << (BIT_WIDTH - 2*i - 2);

            // x_diff = x - (c + d)
            assign x_diff[(BIT_WIDTH + 1) * (i + 1) - 1 : (BIT_WIDTH + 1) * i]
                =    x[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] 
                - (c[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] + d[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i]);

            // if (d > n) { c = 0 } else { if (x_diff[BIT_WIDTH] < 0) { c = (c >> 1) } else { c = (c >> 1) + d } }
            assign c[BIT_WIDTH * (i + 2) - 1 : BIT_WIDTH * (i + 1)] =   (d[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] > x_in) ? 0 :
                                                                        (x_diff[(BIT_WIDTH + 1) * (i + 1) - 1] == 1'b1) ? 
                                                                            (c[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] >> 1) : 
                                                                            ((c[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] >> 1) + d[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i]);

            // if (d > n) { x = xin } else { if (x_diff[BIT_WIDTH] < 0) { x = x } else { x = x_diff } }
            assign x[BIT_WIDTH * (i + 2) - 1 : BIT_WIDTH * (i + 1)] =   (d[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i] > x_in) ? x_in :
                                                                        (x_diff[(BIT_WIDTH + 1) * (i + 1) - 1] == 1'b1) ? 
                                                                            (x[BIT_WIDTH * (i + 1) - 1 : BIT_WIDTH * i]) : 
                                                                            (x_diff[(BIT_WIDTH + 1) * (i + 1) - 2 : (BIT_WIDTH + 1) * i]);
        end
    endgenerate

    assign x_out    = c[BIT_WIDTH * (BIT_WIDTH / 2 + 1) - 1 : BIT_WIDTH * (BIT_WIDTH / 2)];
endmodule
