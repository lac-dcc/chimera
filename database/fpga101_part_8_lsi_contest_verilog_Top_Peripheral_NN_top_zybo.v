// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:   17:00:00 11/04/2017 
// Design Name:   Neural Network (using backpropagation)
// Module Name:   NN_top_zybo (Zybo board)
// Project Name:  LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
// Description: 
//			Top module for Zybo board
//Input:
//			CLK	: 1 bit	    : clock signal
//			RST	: 1 bit 	: reset signal - high active
//          LED : 4 bits    : LED signals
//                          : LED[3] D18   : Finish updating
//                          : LED[2] G14   : Finish updating
//                          : LED[1] M15   : Turn on (a3_1 >  a3_2) 
//                          : LED[0] M14   : Turn on (a3_1 <= a3_2)
//			din : 1 bit 	: read enable signal (for memory) high active
//			select_initial  : 1 bit
// Output:
//			renewal w3_ij	: 16 bits 00_0000.0000_0000_00 signed : renewal of w3 (i = 1,2,3 / j = 1,2)
//			renewal w2_ij	: 16 bits 00_0000.0000_0000_00 signed : renewal of w3 (i = 1,2 / j = 1,2,3)
//			renewal b3_i	: 16 bits 00_0000.0000_0000_00 signed : renewal of b3 (i = 1,2)
//			renewal b2_i	: 16 bits 00_0000.0000_0000_00 signed : renewal of b2 (i = 1,2,3)
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NN_top (
    input               CLK,
    input               RST,
    input   [2:0]       BTN,
    input   [2:0]       SW,
    output  [3:0]       LED
);

wire finish_updating;
wire Debounce_RST;
wire signed [15:0] a3_1;
wire signed [15:0] a3_2;
wire signed [15:0] input_k_1;
wire signed [15:0] input_k_2;
wire locked;
wire clk_p;
wire DeRST;

clk_wiz_0 CLK_WIZ_0(
    .clk_in1(CLK),
    .clk_out1(clk_p),
    .reset(BTN[2]),
    .locked(locked)
    );

gen_input_k GEN_INPUT_K(
    .clk(clk_p),
    .SW(SW),
    .input_k_1(input_k_1),
    .input_k_2(input_k_2)
   );

chattering CHATTERING(
     .sw(RST),
     .clk(CLK),
     .res(BTN[2]),
     .sig(DeRST)
     );
    
NN_CORE DUT_NN_CORE(
    .clk(clk_p),
    .res(DeRST),
    .update_coeff(~finish_updating),
    .input_k_1(input_k_1),
    .input_k_2(input_k_2),
    .finish_updating(finish_updating),
    .a3_1(a3_1),
    .a3_2(a3_2)
    );
    
assign LED[3] = finish_updating;
assign LED[2] = finish_updating;

gen_comp GEN_COMP(
    .a3_1(a3_1),
    .a3_2(a3_2),
    .LED1(LED[1]),
    .LED0(LED[0])
    );    

endmodule
