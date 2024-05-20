// This program was cloned from: https://github.com/Peter-Herrmann/Lucid64
// License: Apache License 2.0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
// Module Name: immediate_gen                                                                    //
// Description: Immediate value generator                                                        //
// Author     : Peter Herrmann                                                                   //
//                                                                                               //
// SPDX-License-Identifier: Apache-2.0                                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

module immediate_gen (
    input      [31:7] inst_31_7_i,
    
    output reg [63:0] i_immed_o,
    output reg [63:0] s_immed_o,
    output reg [63:0] b_immed_o,
    output reg [63:0] u_immed_o,
    output reg [63:0] j_immed_o
);

    always @(inst_31_7_i) begin
        i_immed_o = { { 52{inst_31_7_i[31]} }, 
                        inst_31_7_i[31:20] } ;

        s_immed_o = { { 52{inst_31_7_i[31]} }, 
                        inst_31_7_i[31:25], 
                        inst_31_7_i[11:7]};

        b_immed_o = { { 51{inst_31_7_i[31]} }, 
                        inst_31_7_i[31], 
                        inst_31_7_i[7], 
                        inst_31_7_i[30:25], 
                        inst_31_7_i[11:8], 
                        1'b0};

        u_immed_o = { { 32{inst_31_7_i[31]} }, 
                        inst_31_7_i[31:12], 
                        12'b0};

        j_immed_o = { { 43{inst_31_7_i[31]} }, 
                        inst_31_7_i[31], 
                        inst_31_7_i[19:12], 
                        inst_31_7_i[20], 
                        inst_31_7_i[30:21], 
                        1'b0};
    end

endmodule


///////////////////////////////////////////////////////////////////////////////////////////////////
////   Copyright 2024 Peter Herrmann                                                           ////
////                                                                                           ////
////   Licensed under the Apache License, Version 2.0 (the "License");                         ////
////   you may not use this file except in compliance with the License.                        ////
////   You may obtain a copy of the License at                                                 ////
////                                                                                           ////
////       http://www.apache.org/licenses/LICENSE-2.0                                          ////
////                                                                                           ////
////   Unless required by applicable law or agreed to in writing, software                     ////
////   distributed under the License is distributed on an "AS IS" BASIS,                       ////
////   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                ////
////   See the License for the specific language governing permissions and                     ////
////   limitations under the License.                                                          ////
///////////////////////////////////////////////////////////////////////////////////////////////////
