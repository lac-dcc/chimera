// This program was cloned from: https://github.com/Peter-Herrmann/Lucid64
// License: Apache License 2.0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
// Module Name: register_file                                                                    //
// Description: A 31x64 register file for use with an RV64I processor. Writes happen on negedge. //
// Author     : Peter Herrmann                                                                   //
//                                                                                               //
// SPDX-License-Identifier: Apache-2.0                                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


module register_file (
    input              clk_i,           // Negedge sensitive

    input       [4:0]  rs1_idx_i,       // Register source 1 index
    input       [4:0]  rs2_idx_i,       // Register source 2 index
    input       [4:0]  rd_idx_i,        // Destination Register index

    input       [63:0] wr_data_i,       // Write data input
    input              wr_en_i,         // Write strobe

    output wire [63:0] rs1_data_ao,     // rs1 data output (async)
    output wire [63:0] rs2_data_ao      // rs2 data output (async)
);
    
    reg [63:0] RF [31:1]; 

    // Read control. Returns 0 if reading from x0.
    assign rs1_data_ao = (rs1_idx_i != 'b0) ? RF[rs1_idx_i] : 'b0;
    assign rs2_data_ao = (rs2_idx_i != 'b0) ? RF[rs2_idx_i] : 'b0;


    // Write control (On NEGEDGE). Will not write to x0.
    always @ (negedge clk_i) begin
        if(wr_en_i && (rd_idx_i != 'b0)) 
            RF[rd_idx_i] <= wr_data_i;
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
