// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : Y_comp                            //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 07.06.2018                        //
//Last revision : 07.06.2018                        //
//////////////////////////////////////////////////////



// y = 0.299*R + 0.587*G + 0.114*B

module Y_comp
(
	input  logic	                 clk      ,
    input  logic	                 reset_n  ,
	input  logic        [7:0]        R_comp   , // 
	input  logic        [7:0]        G_comp   , // 
	input  logic        [7:0]        B_comp   , // 
	input  logic                     valid_in ,
	input  logic                     frame_end_in ,
	output logic                     valid_out,
	output logic                     frame_end_out,
	output logic       [7:0]         Y_comp    // 
);

reg [7:0] Rmult0299;
reg [7:0] Gmult0587;
reg [7:0] Bmult0114;
reg [8:0] Y_reg;
reg [25:0] tmp_Rmult0299;
reg [25:0] tmp_Gmult0587;
reg [25:0] tmp_Bmult0114;
localparam const_0299 = 18'd78381 ; // 0.299 * 2^18
localparam const_0587 = 18'd153878; // 0.587 * 2^18
localparam const_0114 = 18'd29884 ; // 0.114 * 2^18


always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		tmp_Rmult0299 <= '0;
	else 
		tmp_Rmult0299 <= const_0299 * R_comp;

always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		tmp_Gmult0587 <= '0;
	else 
		tmp_Gmult0587 <= const_0587 * G_comp;
		
always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		tmp_Bmult0114 <= '0;
	else 
		tmp_Bmult0114 <= const_0114 * B_comp;	

always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		Rmult0299 <= '0;
	else 
		Rmult0299 <= tmp_Rmult0299[25:18] + tmp_Rmult0299[17];

always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		Gmult0587 <= '0;
	else
		Gmult0587 <= tmp_Gmult0587[25:18] + tmp_Gmult0587[17];
		
always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		Bmult0114 <= '0;
	else 
		Bmult0114 <= tmp_Bmult0114[25:18] + tmp_Bmult0114[17];
		
always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		Y_reg <= '0;
	else 
		Y_reg <= Rmult0299 + Gmult0587 + Bmult0114;			

		
reg [2:0] sh_reg;
reg [2:0] sh_reg2;
always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		sh_reg <= '0;
	else
		sh_reg <= {sh_reg[1:0], valid_in};
		
always_ff @( posedge clk or negedge reset_n )	
	if (~reset_n )
		sh_reg2 <= '0;
	else
		sh_reg2 <= {sh_reg2[1:0], frame_end_in};
		
assign Y_comp     =	Y_reg[8] ? 8'd255 : Y_reg[7:0];	
assign valid_out  = sh_reg[2];
assign frame_end_out = sh_reg2[2];

endmodule