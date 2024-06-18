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
// Design Name:    data_ram_mux                                               //
// Project Name:   rvj1-caravel-soc                                           //
// Language:       System Verilog                                             //
//                                                                            //
// Description:    A mux for the data RAM. It is interfaced by the            //
//                 riscv-jedro-1 core and a wishbone master.                  //
//                                                                            //
//                                                      					  //
//                                          --|   instr_mem_if                //
//                |--------|              -   |-----                          //
//                |  DATA  | openram_if  |    |                               //
//                |   RAM  |-------------|    |                               //
//                |        |    wbm_if   |    |                               //
//                |________|   |---------|    |   wishbone if                 //
//                             |          -   |-----                          //
//                             |            --|                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module data_ram_mux #(
    parameter RAM_ADDR_WIDTH_WORDS = 8,
    parameter BASE_ADDR_RAM = 32'h3000_4000
)
(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input  wire                            sel_wb,

	// Interface to rvj1 core
    output reg  [31:0]                     rdata,
    output reg                             ack,
    output reg                             err,
    input  wire [3:0]                      we,
    input  wire                            stb,
    input  wire [31:0]                     addr,
    input  wire [31:0]                     wdata,
	input  wire [3:0]					   sel,

	// Input slave wishbone interface
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

	// Output to data ram
    output wire                            ram_clk0,
    output reg                             ram_csb0,   // active low chip select
    output reg                             ram_web0,   // active low write enable
    output reg  [3:0]                      ram_wmask0, // write (byte) mask
    output reg  [RAM_ADDR_WIDTH_WORDS-1:0] ram_addr0,
    output reg  [31:0]                     ram_din0,
    input  wire [31:0]                     ram_dout0,

	// Output to wishbone master
	output wire							   wbm_clk_o,
	output wire							   wbm_rst_o,
	output reg							   wbm_stb_o,
	output reg							   wbm_cyc_o,
	output reg							   wbm_we_o,
	output reg	[3:0]					   wbm_sel_o,
	output reg [31:0]					   wbm_dat_o,
	output reg [31:0]					   wbm_adr_o,
	input wire							   wbm_ack_i,
	input wire [31:0]					   wbm_dat_i
);
	/****************************
	* DEFINITIONS AND CLOCKING
	****************************/
	localparam RAM_ADDR_WIDTH_BYTES = RAM_ADDR_WIDTH_WORDS + 2;
    localparam ADDR_LO_MASK = (1 << RAM_ADDR_WIDTH_BYTES) - 1;
    localparam ADDR_HI_MASK = 32'hffff_ffff - ADDR_LO_MASK; 
    
	wire ram_cs;
    reg ram_cs_r, ram_wbs_ack_r, core_ack;
	reg was_ram;	
	
	reg stb_delay;
	wire stb_rising;

    assign ram_clk0 = wb_clk_i;
	assign wbm_clk_o = wb_clk_i;
	assign wbm_rst_o = wb_rst_i;

    wire is_ram;
	/****************************
	* WISHBONE SLAVE - RAM ACKING
	****************************/
    assign ram_cs = sel_wb && wbs_stb_i && wbs_cyc_i && ((wbs_adr_i & ADDR_HI_MASK) == BASE_ADDR_RAM) && !wb_rst_i;
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
    
    reg core_ack_rff;
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            core_ack <= 0;
            core_ack_rff <= 0;
        end else if (stb) begin
            core_ack_rff <= stb && is_ram;
            core_ack <= core_ack_rff;
        end else begin
            core_ack_rff <= 0;
            core_ack <= 0;
        end
    end

	/****************************
	* IS CORE WRITE TO RAM LOGIC
	****************************/
	assign is_ram = (addr & ADDR_HI_MASK) == BASE_ADDR_RAM;
	always@(posedge wb_clk_i) begin
		if (wb_rst_i) was_ram <= 0;
		else		  was_ram <= is_ram;
	end


	always@(posedge wb_clk_i) begin
		if (wb_rst_i) stb_delay <= 1'b0;
		else 		  stb_delay <= stb;
	end

	assign stb_rising = stb & ~stb_delay;

	/****************************
	* COMBINATIONAL LOGIC
	****************************/
    always@(*) begin
		ram_csb0 = 1'b1; // it is active low
		ram_web0 = 1'b1; // also active low
		ram_wmask0 = 0;
		ram_addr0 = 0;
		ram_din0 = 0;
		wbm_stb_o = 0;
		wbm_cyc_o = 0;
		wbm_we_o = 0;
		wbm_sel_o = 0;
		wbm_dat_o = 0;
		wbm_adr_o = 0;
		rdata = 0;
		ack = 0;
		err = 0;
		wbs_ack_o = 0;
		wbs_dat_o = 0;
        if (sel_wb) begin
        	ram_csb0   = !ram_cs_r;
            ram_web0   = ~wbs_we_i;
            ram_wmask0 = wbs_sel_i;
            ram_addr0  = wbs_adr_i[RAM_ADDR_WIDTH_WORDS-1:0];
            ram_din0   = wbs_dat_i;
            wbs_dat_o  = ram_dout0;
            wbs_ack_o  = ram_wbs_ack_r && ram_cs;
        end
        else begin
        	ram_csb0   = (~stb) && is_ram;  // active low
        	ram_web0   = (~(|we)) && is_ram;  // active low
        	ram_wmask0 = we && is_ram;  
        	ram_addr0  = addr[RAM_ADDR_WIDTH_WORDS+2-1:2];
        	ram_din0   = wdata;

			wbm_stb_o  = stb_rising;
			wbm_cyc_o  = stb;
			wbm_we_o   = |we;
			wbm_sel_o  = sel; // Currently LSU only supports reading words
			wbm_dat_o  = wdata;
			wbm_adr_o  = addr;
        	
        	ack        = core_ack | wbm_ack_i; // core_ack is generated only when writing to ram
			err		   = 0;  // TODO
			if (was_ram) rdata = ram_dout0; // This assumes 1 cycle delay from all slave devices
			else		 rdata = wbm_dat_i;  
        end
    end

endmodule
