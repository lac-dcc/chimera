// This program was cloned from: https://github.com/zephray/vga_to_ascii
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UPT
// Engineer: Oana Boncalo & Alexandru Amaricai
// 
// Create Date:    15:37:02 04/10/2013 
// Design Name: 
// Module Name:    debounce_rst 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module debounce_rst(
    input wire clk,
    input wire noisy_rst,
	 input wire pll_locked,
    output clean_pll_rst,
	 output clean_async_rst
    );
	 
	 localparam NR_SAMPLES = 10;
	 localparam DELAY_CC = 100;
	 localparam BITS_DELAY_CC = 8;// 8 = ceil(log2(DELAY_CC));
	 
	 reg [NR_SAMPLES-1: 0] 		rst_samples;
	 wire 							rst_samples_and_N, rst_samples_and_N_1;
	 reg [DELAY_CC-1: 0] 		rst_debounce_delay_loop = {1'b0, {(DELAY_CC-1){1'b1}}};
	 reg [BITS_DELAY_CC-1: 0] 	rst_cnt_delay = 100 + 128;//100 + {1'b1, {(BITS_DELAY_CC-2){1'b0}}}; 	 //keep reset active for DELAY_CC time
	 wire 							async_rst, pll_rst, rst_edge, start_up_rst;
	 
	 
	// --4-bit Shift Register For resetting the PLL
	//--Asserts Start_Up_Rst for 4 clock periods

	SRL16E #(
      .INIT(16'h000F) // Initial Value of Shift Register
   ) SRL16E_inst (
      .Q(start_up_rst), // SRL data output
      .A0 (1'b1),     	//-- Select[0] input
      .A1 (1'b1),     	//-- Select[1] input
      .A2 (1'b0),     	//-- Select[2] input
      .A3 (1'b0),     	//-- Select[3] input
      .CE (1'b1),     	// Clock enable input
      .CLK(clk),   		// Clock input
      .D(1'b0)        	// SRL data input
   );
	 //debounce logic
	 always @(posedge clk)
	 begin
		rst_samples <= {rst_samples [NR_SAMPLES-2: 0],noisy_rst}; 
	 end
	
	 assign rst_samples_and_N =  & rst_samples;
	 assign rst_samples_and_N_1 = & rst_samples[NR_SAMPLES-2:0];
	 //detect edge
	 assign rst_edge = (rst_samples_and_N_1 && (! rst_samples_and_N))? 1'b1: 1'b0;
	 
	//----------------------------------------------------------------------------------
	//-- Reset with take-off and landing
	//-- delay 95 cc = DELAY_CC - 4 reset
	//-- then keep it active for 3 cc (as long as one of rst_debounce_delay_loop[DELAY_CC-2], rst_debounce_delay_loop[DELAY_CC-3] or rst_debounce_delay_loop[DELAY_CC-4] is 0)
	//----------------------------------------------------------------------------------	
	 always @(posedge clk)
	 begin
		if (rst_edge || rst_debounce_delay_loop[DELAY_CC-1])
				rst_debounce_delay_loop <= {rst_debounce_delay_loop[DELAY_CC-2:0],rst_debounce_delay_loop[DELAY_CC-1]};
	 end
	
	assign pll_rst = ((~rst_debounce_delay_loop[DELAY_CC-2]) || (~rst_debounce_delay_loop[DELAY_CC-3]) ||
					(~rst_debounce_delay_loop[DELAY_CC-4]) || start_up_rst)? 1'b1: 1'b0;
	
	wire int_rst;
	assign int_rst =  ~pll_locked;
	
	//decrement counter for 100 cc then rst_cnt_delay[BITS_DELAY_CC-1] becomes 0
	always @(posedge clk)
	begin 
		if (int_rst)
			rst_cnt_delay <= 228;//DELAY_CC + {1'b1, {(BITS_DELAY_CC-2){1'b0}}};
		else 
			if (rst_cnt_delay[BITS_DELAY_CC-1])
				rst_cnt_delay <= rst_cnt_delay - 1;
	 end
	
	assign async_rst = rst_cnt_delay[BITS_DELAY_CC-1] | rst_debounce_delay_loop[DELAY_CC -1]; //--100 cc have passed since reset signal has been generated
	
	assign clean_async_rst = async_rst;
	assign clean_pll_rst = pll_rst;
	

endmodule