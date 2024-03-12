`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu
(
    input   wire		clk,
    
	// alu in
    input   wire [10:0]	alu_cmd,
	input	wire [7:0]	alu_in1,
	input	wire [7:0]	alu_in2,

    // alu out
	output  reg [8:0]	alu_out0,
	output  reg [15:0]	alu_out1,
	output  reg [7:0]	alu_out2,
	output  reg [7:0]	alu_out3,
	output  reg [7:0]	alu_out4
);

// 加/减运算
always@(posedge clk)
begin
    if(alu_cmd[0])  
		alu_out0  <= (alu_in1 + alu_in2);
    else if(alu_cmd[1])  
		alu_out0  <= (alu_in1 - alu_in2);
end

// 乘法运算
always@(posedge clk)
begin
    if(alu_cmd[2])  
		alu_out1  <= (alu_in1 * alu_in2);
end

// 比较运算
always@(posedge clk)
begin
    if(alu_cmd[3]) 
		alu_out2 <= (alu_in1 >  alu_in2);
    else if(alu_cmd[4]) 
		alu_out2 <= (alu_in1 == alu_in2);
end

// 逻辑运算
always@(posedge clk)
begin
    if(alu_cmd[5])  
		alu_out3 <= (alu_in1 && alu_in2);
    else if(alu_cmd[6])  
		alu_out3 <= (alu_in1 &  alu_in2);
    else if(alu_cmd[7])  
		alu_out3 <= (alu_in1 || alu_in2);
    else if(alu_cmd[8])  
		alu_out3 <= (alu_in1 |  alu_in2);
end

// 移位操作
always@(posedge clk)
begin
    if(alu_cmd[9])  
		alu_out4 <= (alu_in1 << alu_in2);
    else if(alu_cmd[10]) 
		alu_out4 <= (alu_in1 >> alu_in2);
end

endmodule
