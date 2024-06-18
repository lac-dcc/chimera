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
// Design Name:    instr_ram_mux                                              //
// Project Name:   rvj1-caravel-soc                                           //
// Language:       System Verilog                                             //
//                                                                            //
// Description:    A mux for the instruction RAM. It is interfaced by the     //
//                 riscv-jedro-1 core and a wishbone master.                  //
//                                                                            //
//                                          --|   instr_mem_if                //
//                                        -   |-----                          //
//                |--------|             |    |                               //
//                |  INSTR | openram_if  |    |                               //
//                |   RAM  |-------------|    |                               //
//                |        |             |    |   wishbone if                 //
//                |________|              -   |-----                          //
//                                          --|                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module instr_ram_mux #(
    parameter RAM_ADDR_WIDTH_BYTES = 12,
    parameter BASE_ADDR = 32'h3000_0000
)
(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input  wire                            sel_wb,

    output reg  [31:0]                     rdata,
    input  wire [31:0]                     addr,
    
    input  wire  we,
    input  wire  cyc,
    input  wire  stb,
    output reg  ack,
    
    input  wire                            wb_clk_i,
    input  wire                            wb_rst_i,
    input  wire                            wbs_stb_i,
    input  wire                            wbs_cyc_i,
    input  wire                            wbs_we_i,
    input  wire [3:0]                      wbs_sel_i,
    input  wire [31:0]                     wbs_dat_i,
    input  wire [31:0]                     wbs_adr_i,
    output reg                             wbs_ack_o,
    output reg  [31:0]                     wbs_dat_o,

	output wire							   ram_clk0,
    output reg                             ram_csb0,   // active low chip select
    output reg                             ram_web0,   // active low write enable
    output reg  [3:0]                      ram_wmask0, // write (byte) mask
    output reg  [RAM_ADDR_WIDTH_BYTES-2-1:0] ram_addr0,
    output reg  [31:0]                     ram_din0,
    input  wire [31:0]                     ram_dout0
);
    localparam ADDR_LO_MASK = (1 << RAM_ADDR_WIDTH_BYTES) - 1;
    localparam ADDR_HI_MASK = 32'hffff_ffff - ADDR_LO_MASK; 

    wire ram_cs;
    reg  ram_cs_r;
    reg  ram_wbs_ack_r;

	assign ram_clk0 = wb_clk_i;   
 
    assign ram_cs = wbs_stb_i && wbs_cyc_i && ((wbs_adr_i & ADDR_HI_MASK) == BASE_ADDR) && !wb_rst_i;
    always @(negedge wb_clk_i) begin
        if (wb_rst_i) begin
            ram_cs_r <= 0;
            ram_wbs_ack_r <= 0;
        end
        else begin
            ram_cs_r <= !ram_cs_r && ram_cs;
            ram_wbs_ack_r <= ram_cs_r;
        end
    end
    

    always@(*) begin
        if (sel_wb) begin
            ram_csb0   = !ram_cs_r;
            ram_web0   = ~wbs_we_i;
            ram_wmask0 = wbs_sel_i;
            ram_addr0  = wbs_adr_i[RAM_ADDR_WIDTH_BYTES-1:2];
            ram_din0   = wbs_dat_i;
            wbs_dat_o  = ram_dout0;
            wbs_ack_o  = ram_wbs_ack_r & ram_cs;
            rdata = 0;
        end
        else begin
            // ram_csb0   = ~(cyc & stb);  // active low expecting 0
            ram_csb0   = 0;
            ram_web0   = ~we;  // we are only reading
            ram_wmask0 = 0;  // is irrelevant for reading
            ram_addr0  = addr[RAM_ADDR_WIDTH_BYTES-1:2];
            ram_din0   = 0;
			wbs_dat_o  = 0;
			wbs_ack_o  = 0;
            rdata      = ram_dout0;
        end
    end

    reg ack_rff;
    // reg ack_rfff;

    // always @(posedge wb_clk_i or negedge wb_rst_i) begin
    //     if (wb_rst_i) begin
    //         ack <= 0;
    //         ack_rff <= 0;
    //     end else begin
    //         ack_rff <= (stb & cyc);
    //         ack_rfff <= ack_rff;
    //     end
    // end

    // always @(posedge wb_clk_i or negedge wb_rst_i) begin
    //     if (wb_ack_i) begin
    //         ack <= 0;
    //     end
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            ack <= 0;
            ack_rff <= 0;
        end else if(cyc) begin
            ack_rff <= (stb & cyc);
            ack <= ack_rff;
        end
        else begin
            ack <= 0;
            ack_rff <= 0;
        end
    end
endmodule
