// This program was cloned from: https://github.com/Peter-Herrmann/Lucid64
// License: Apache License 2.0

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
// Module Name: bypass_unit                                                                      //
// Description: A simple 2-stage bypass/forwarding unit for a source register. Load use          //
//              hazards are detected by this unit, but handling them is left to the user.        //
// Author     : Peter Herrmann                                                                   //
//                                                                                               //
// SPDX-License-Identifier: Apache-2.0                                                           //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

module bypass_unit (
    //============ Forwarded register inputs ============//
    input               EXE_mem_read_i,
    input               EXE_rd_wr_en_i,  MEM_rd_wr_en_i,
    input               EXE_valid_i,     MEM_valid_i,
    input      [4:0]    EXE_rd_idx_i,    MEM_rd_idx_i,
    input      [63:0]   EXE_rd_data_i,   MEM_rd_data_i,

    //============= Source Register Inputs ==============//
    input      [4:0]    rs_idx_i,
    input      [63:0]   rs_data_i,
    input               rs_used_i,

    //====== Updated Register and Hazard Indicator ======//
    output reg [63:0]   rs_data_ao,
    output reg          load_use_hazard_ao
);

    // Signals to identify if a RAW conflict is possible (registers_i match)
    reg mem_conflict, exe_conflict;
    reg mem_raw, exe_raw;

    // Updated data after mem stage
    reg [63:0] data_updated_mem;

    always @ (*) begin
        mem_conflict = (rs_idx_i == MEM_rd_idx_i);
        exe_conflict = (rs_idx_i == EXE_rd_idx_i);

        mem_raw = (mem_conflict && MEM_rd_wr_en_i && MEM_valid_i && rs_used_i);
        exe_raw = (exe_conflict && EXE_rd_wr_en_i && EXE_valid_i && rs_used_i);

        // Forward from the last stage, with lower precedence
        data_updated_mem = mem_raw ? MEM_rd_data_i : rs_data_i;

        // Forward from the execture stage and signal a LU hazard if needed
        rs_data_ao = exe_raw ? EXE_rd_data_i : data_updated_mem;
        load_use_hazard_ao = exe_raw && EXE_mem_read_i;
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
