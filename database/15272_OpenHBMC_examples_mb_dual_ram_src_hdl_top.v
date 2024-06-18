// This program was cloned from: https://github.com/OVGN/OpenHBMC
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: top.v
 *  Purpose:  Top module of the OpenHBMC example project.
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
 *  limitations under the License.
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module top
(
    input   wire            clkin,
    
    output  wire            hram_r0_ck_p,
    output  wire            hram_r0_ck_n,
    output  wire            hram_r0_reset_n,
    output  wire            hram_r0_cs_n,
    inout   wire            hram_r0_rwds,
    inout   wire    [7:0]   hram_r0_dq,
    
    output  wire            hram_r1_ck_p,
    output  wire            hram_r1_ck_n,
    output  wire            hram_r1_reset_n,
    output  wire            hram_r1_cs_n,
    inout   wire            hram_r1_rwds,
    inout   wire    [7:0]   hram_r1_dq
);
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam HYPERRAM_CLOCKING_MODE = "BUFIO";   // "BUFG"

    
    generate
        case (HYPERRAM_CLOCKING_MODE)
        
            "BUFG": begin : bufg_mode
                SoC_bufg
                SoC_bufg_inst
                (
                    .clkin                  ( clkin           ),
                    .resetn                 ( 1'b1            ),
                    
                    .HyperBus_R0_hb_ck_p    ( hram_r0_ck_p    ),
                    .HyperBus_R0_hb_ck_n    ( hram_r0_ck_n    ),
                    .HyperBus_R0_hb_cs_n    ( hram_r0_cs_n    ),
                    .HyperBus_R0_hb_dq      ( hram_r0_dq      ),
                    .HyperBus_R0_hb_reset_n ( hram_r0_reset_n ),
                    .HyperBus_R0_hb_rwds    ( hram_r0_rwds    ),
                    
                    .HyperBus_R1_hb_ck_p    ( hram_r1_ck_p    ),
                    .HyperBus_R1_hb_ck_n    ( hram_r1_ck_n    ),
                    .HyperBus_R1_hb_cs_n    ( hram_r1_cs_n    ),
                    .HyperBus_R1_hb_dq      ( hram_r1_dq      ),
                    .HyperBus_R1_hb_reset_n ( hram_r1_reset_n ),
                    .HyperBus_R1_hb_rwds    ( hram_r1_rwds    )
                );
            end
        
            "BUFIO": begin : bufio_mode
                SoC_bufio
                SoC_bufio_inst
                (
                    .clkin                  ( clkin           ),
                    .resetn                 ( 1'b1            ),
                    
                    .HyperBus_R0_hb_ck_p    ( hram_r0_ck_p    ),
                    .HyperBus_R0_hb_ck_n    ( hram_r0_ck_n    ),
                    .HyperBus_R0_hb_cs_n    ( hram_r0_cs_n    ),
                    .HyperBus_R0_hb_dq      ( hram_r0_dq      ),
                    .HyperBus_R0_hb_reset_n ( hram_r0_reset_n ),
                    .HyperBus_R0_hb_rwds    ( hram_r0_rwds    ),
                    
                    .HyperBus_R1_hb_ck_p    ( hram_r1_ck_p    ),
                    .HyperBus_R1_hb_ck_n    ( hram_r1_ck_n    ),
                    .HyperBus_R1_hb_cs_n    ( hram_r1_cs_n    ),
                    .HyperBus_R1_hb_dq      ( hram_r1_dq      ),
                    .HyperBus_R1_hb_reset_n ( hram_r1_reset_n ),
                    .HyperBus_R1_hb_rwds    ( hram_r1_rwds    )
                );
            end
            
            default: begin : check_parameters
                INVALID_PARAMETER invalid_parameter_msg();
            end
            
        endcase
    endgenerate

endmodule

`default_nettype wire
