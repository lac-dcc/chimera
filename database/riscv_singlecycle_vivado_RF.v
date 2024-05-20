// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/05 09:30:38
// Design Name: 
// Module Name: RF
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


module RF_480(
    input	clk,				//100MHZ CLK
    input	rstn,				//reset signal
    input	RFWr,				//Rfwrite = mem2reg  
    input 	[15:0] sw_i, 		//sw_i[15]---sw_i[0]
    input 	[4:0] A1, A2, A3,	// Register Num 
    input 	[31:0] WD,			//Write data
    output [31:0] RD1, RD2	    //Data output port
    );
    reg [31:0] rf[31:0];
    integer i;
    //初始化
    initial begin
        for(i=0;i<=31;i=i+1)
            rf[i] =i;
    end
    //修改寄存器
    always@(posedge clk or negedge rstn)
        if(~rstn&&~sw_i[1])begin
            for(i=0;i<=31;i=i+1)
                rf[i]=i;
        end
        else
            if(RFWr&&~sw_i[1]&&(A3!=0))begin //写信号，非调试模式，且不是写x0
                rf[A3]<=WD;
            end
    assign RD1=(A1!=0)?rf[A1]:0;
    assign RD2=(A2!=0)?rf[A2]:0;
    
endmodule
