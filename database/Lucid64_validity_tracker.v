// This program was cloned from: https://github.com/Peter-Herrmann/Lucid64
// License: Apache License 2.0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
// Module Name: validity_tracker                                                                 //
// Description: This module tracks the validity of a pipeline stage. It manages stalls, squashes //
//              (explicit invalidation), bubbles (invalid instructions introduced into a         //
//              pipeline), and validity inheritance from pervious stages. It handles hazards     //
//              associated with multiple conditions (i.e. squash during bubbles or stalls)       //
//              occuring at the same time.                                                       //
// Author     : Peter Herrmann                                                                   //
//                                                                                               //
// SPDX-License-Identifier: Apache-2.0                                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


module validity_tracker (
    input       clk_i,
    input       rst_ni,

    input       valid_i,
    input       squash_i,
    input       bubble_i,
    input       stall_i,

    output wire valid_ao
);

    reg  squashed_during_stall, squashed_during_bubble;


    always @(posedge clk_i) begin
        if (~rst_ni || ~stall_i) 
            squashed_during_stall   <= 'b0;
        else if (stall_i && squash_i) 
            squashed_during_stall   <= 'b1;
    end


    always @(posedge clk_i) begin
        if (~rst_ni || ~bubble_i) 
            squashed_during_bubble   <= 'b0;
        else if (bubble_i && squash_i) 
            squashed_during_bubble   <= 'b1;
    end


    assign valid_ao = valid_i && 
                      ~squash_i && ~squashed_during_stall && 
                      ~bubble_i && ~squashed_during_bubble;


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
