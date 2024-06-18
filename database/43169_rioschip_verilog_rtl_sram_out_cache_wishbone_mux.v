// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

////////////////////////////////////////////////////////////////////////////////                                          
// SPDX-FileCopyrightText: 2022, Jure Vreca                                   //                                          
//                                                                            //                                          
// Licenseunder the Apache License, Version 2.0(the "License");               //                                          
// you maynot use this file except in compliance with the License.            //                                           
// You may obtain a copy of the License at                                    //                                          
//                                                                            //                                          
//      http://www.apache.org/licenses/LICENSE-2.0                            //                                          
//                                                                            //                                          
// Unless required by applicable law or agreed to in writing, software        //                                          
// distributed under the License is distributed on an "AS IS" BASIS,          //                                          
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   //                                          
// See the License for the specific language governing permissions and        //                                          
// limitations under the License.                                             //                                          
// SPDX-License-Identifier: Apache-2.0                                        //                                          
// SPDX-FileContributor: Jure Vreca <jurevreca12@gmail.com>                   //                                          
////////////////////////////////////////////////////////////////////////////////      
////////////////////////////////////////////////////////////////////////////////
// Engineer:       Jure Vreca - jurevreca12@gmail.com                         //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    wishbone_mux                                               //
// Project Name:   rvj1-caravel-soc                                           //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    Muxes the wishbone interfaces to instr ram, data ram, and  //
//                 the other wishbone slaves.                                 //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module wishbone_mux #(
    parameter BASE_ADDR_0  = 32'h3000_0000,
    parameter ADDR_WIDTH_0 = 11,
    parameter BASE_ADDR_1  = 32'h3000_4000,
    parameter ADDR_WIDTH_1 = 10
)
(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    // Input wishbone comming from the master
    input             wbs_stb_i,
    input             wbs_cyc_i,
    input             wbs_we_i,
    input      [3:0]  wbs_sel_i,
    input      [31:0] wbs_dat_i,
    input      [31:0] wbs_adr_i,
    output reg        wbs_ack_o,
    output reg [31:0] wbs_dat_o,

    // Wishbone output 0
    output reg        wbs0_stb_o,
    output reg        wbs0_cyc_o,
    output reg        wbs0_we_o,
    output reg [3:0]  wbs0_sel_o,
    output reg [31:0] wbs0_dat_o,
    output reg [31:0] wbs0_adr_o,
    input             wbs0_ack_i,
    input      [31:0] wbs0_dat_i,

    // Wishbone output 1
    output reg        wbs1_stb_o,
    output reg        wbs1_cyc_o,
    output reg        wbs1_we_o,
    output reg [3:0]  wbs1_sel_o,
    output reg [31:0] wbs1_dat_o,
    output reg [31:0] wbs1_adr_o,
    input             wbs1_ack_i,
    input      [31:0] wbs1_dat_i,

    // Wishbone output 2
    output reg        wbs2_stb_o,
    output reg        wbs2_cyc_o,
    output reg        wbs2_we_o,
    output reg [3:0]  wbs2_sel_o,
    output reg [31:0] wbs2_dat_o,
    output reg [31:0] wbs2_adr_o,
    input             wbs2_ack_i,
    input      [31:0] wbs2_dat_i
);
    localparam ADDR_LO_MASK_0 = (1 << ADDR_WIDTH_0) - 1;
    localparam ADDR_HI_MASK_0 = 32'hffff_ffff - ADDR_LO_MASK_0; 

    localparam ADDR_LO_MASK_1 = (1 << ADDR_WIDTH_1) - 1;
    localparam ADDR_HI_MASK_1 = 32'hffff_ffff - ADDR_LO_MASK_1;


    always @(*) begin
		wbs_ack_o = wbs0_ack_i | wbs1_ack_i | wbs2_ack_i;
		wbs_dat_o = 0;
        wbs0_stb_o = 0;
        wbs0_cyc_o = 0;
        wbs0_we_o  = wbs_we_i;
        wbs0_sel_o = wbs_sel_i;
        wbs0_dat_o = wbs_dat_i;
        wbs0_adr_o = wbs_adr_i;
        wbs1_stb_o = 0;
        wbs1_cyc_o = 0;
        wbs1_we_o  = wbs_we_i;
        wbs1_sel_o = wbs_sel_i;
        wbs1_dat_o = wbs_dat_i;
        wbs1_adr_o = wbs_adr_i;
        wbs2_stb_o = 0;
        wbs2_cyc_o = 0;
        wbs2_we_o  = wbs_we_i;
        wbs2_sel_o = wbs_sel_i;
        wbs2_dat_o = wbs_dat_i;
        wbs2_adr_o = wbs_adr_i;
        if ((wbs_adr_i & ADDR_HI_MASK_0) == BASE_ADDR_0) begin
        	wbs0_stb_o = wbs_stb_i;
        	wbs0_cyc_o = wbs_cyc_i;
          	wbs_dat_o = wbs0_dat_i;
        end
        else if ((wbs_adr_i & ADDR_HI_MASK_1) == BASE_ADDR_1) begin
        	wbs1_stb_o = wbs_stb_i;
        	wbs1_cyc_o = wbs_cyc_i;
          	wbs_dat_o = wbs1_dat_i;
        end
        else begin
        	wbs2_stb_o = wbs_stb_i;
        	wbs2_cyc_o = wbs_cyc_i;
          	wbs_dat_o = wbs2_dat_i;
        end
    end 

endmodule
