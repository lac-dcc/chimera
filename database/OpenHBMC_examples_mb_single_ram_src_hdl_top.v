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
    
    output  wire            hram_ck_p,
    output  wire            hram_ck_n,
    output  wire            hram_reset_n,
    output  wire            hram_cs_n,
    inout   wire            hram_rwds,
    inout   wire    [7:0]   hram_dq
);
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    SoC
    SoC_inst
    (
        .clkin               ( clkin        ),
        .resetn              ( 1'b1         ),
        .HyperBus_hb_ck_p    ( hram_ck_p    ),
        .HyperBus_hb_ck_n    ( hram_ck_n    ),
        .HyperBus_hb_cs_n    ( hram_cs_n    ),
        .HyperBus_hb_dq      ( hram_dq      ),
        .HyperBus_hb_reset_n ( hram_reset_n ),
        .HyperBus_hb_rwds    ( hram_rwds    )
    );

endmodule

`default_nettype wire
