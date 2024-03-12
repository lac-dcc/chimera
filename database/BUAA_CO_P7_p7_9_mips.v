`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:09 11/23/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );

	 wire [31:0] PrRD;
	 wire [6:2] ExcCode;
	 wire [31:0] PrAddr;
	 wire [31:0] PrWD;
	 wire PrWe;
    wire [31:0] DEV_Addr;
    wire [31:0] DEV_WD;
    wire [31:0] DEV0_RD;
    wire [31:0] DEV1_RD;
	 wire WeDEV0;
	 wire WeDEV1;
	 wire IRQ0;
	 wire IRQ1;
	 wire [7:2] HWInt;
	 
	CPU my_CPU(.clk(clk),.reset(reset),.HWInt(HWInt),.PrRD(PrRD),.ExcCode(ExcCode),.PrAddr(PrAddr),.PrWD(PrWD),.PrWe(PrWe));
	Bridge my_Bridge(PrAddr,PrWe,PrRD,PrWD,DEV_Addr,DEV_WD,DEV0_RD,DEV1_RD,WeDEV0,WeDEV1,{4'b0,IRQ1,IRQ0},HWInt);
	DEV0 my_time0(clk,reset,DEV_Addr,WeDEV0,DEV_WD,DEV0_RD,IRQ0);
	DEV1 my_time1(clk,reset,DEV_Addr,WeDEV1,DEV_WD,DEV1_RD,IRQ1);
	 
	assign ExcCode = (IRQ0||IRQ1) ? 5'b00000 : 5'b11111;
endmodule
