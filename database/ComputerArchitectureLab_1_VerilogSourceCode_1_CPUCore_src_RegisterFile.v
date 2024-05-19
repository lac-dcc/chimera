// This program was cloned from: https://github.com/Summer-Summer/ComputerArchitectureLab
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB（Embeded System Lab）
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: RegisterFile
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(
    input wire clk,
    input wire rst,
    input wire WE3,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD3,
    output wire [31:0] RD1,
    output wire [31:0] RD2
    );

    reg [31:0] RegFile[31:1];
    integer i;
    //
    always@(negedge clk or posedge rst) 
    begin 
        if(rst)                                 for(i=1;i<32;i=i+1) RegFile[i][31:0]<=32'b0;
        else if( (WE3==1'b1) && (A3!=5'b0) )    RegFile[A3]<=WD3;   
    end
    //    
    assign RD1= (A1==5'b0)?32'b0:RegFile[A1];
    assign RD2= (A2==5'b0)?32'b0:RegFile[A2];
    
endmodule

//功能说明
    //上升沿写入，异步读的寄存器堆，0号寄存器值始终为32'b0
    //在接入RV32Core时，输入为~clk，因此本模块时钟输入和其他部件始终相反
    //等价于例化本模块时正常接入时钟clk，同时修改代码为always@(negedge clk or negedge rst) 
//实验要求  
    //无需修改