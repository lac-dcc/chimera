`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 19:00:41
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    reg clk_in;
    reg reset;
    wire clk;
    wire [31:0]pc;
    wire [31:0]inst;
    wire IM_R;
    wire DM_CS;
    wire DM_R;
    wire DM_W;

    wire [31:0]alu_r;

    top uut(clk_in,reset,clk,pc,inst,addr,rdata,wdata,IM_R,DM_CS,DM_R,DM_W,alu_r);

    // 不同的initial块是并行的，块内部顺序执行
    initial 
    begin
        clk_in = 0;
        forever #100 clk_in = ~clk_in;
    end

    initial
    begin
        reset = 0;
        #50 reset=1;
        #10 reset=0;
        #2000 $stop;
    end
        
    initial // 用iverilog+gtkwave仿真时用到的
    begin            
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, top_tb);    //tb模块名称
    end

endmodule
