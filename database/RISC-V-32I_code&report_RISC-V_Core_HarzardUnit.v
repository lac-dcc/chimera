`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB（Embeded System Lab）
// Engineer: Haojun Xia & Xuan Wang
// Create Date: 2019/02/22
// Design Name: RISCV-Pipline CPU
// Module Name: HarzardUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Deal with harzards in pipline
//////////////////////////////////////////////////////////////////////////////////
module HarzardUnit(
    input wire CpuRst, ICacheMiss, DCacheMiss, 
    input wire BranchE, JalrE, JalD, 
    input wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,
    input wire [1:0] RegReadE,
    input wire MemToRegE,
    input wire [2:0] RegWriteM, RegWriteW,
    output reg StallF, FlushF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW,
    output reg [1:0] Forward1E, Forward2E
    );
    //Stall and Flush signals generate
	always@(*) begin
		//------------------------------控制相关之清空------------------------------
		FlushF <= CpuRst;//IF寄存器（PC寄存器）只有初始化时需要清空
		FlushD <= CpuRst || (BranchE || JalrE || JalD);//ID寄存器（处于IF/ID之间的寄存器）在发生3种跳转时清空
		FlushE <= CpuRst || (MemToRegE && (RdE == Rs1D || RdE == Rs2D)) || (BranchE || JalrE);//EX寄存器在发生2种跳转和无法转发的数据相关时清空
		FlushM <= CpuRst;//MEM寄存器（处于EX/MEM之间的寄存器）只有初始化时需要清空
		FlushW <= CpuRst;//WB寄存器（处于MEM/WB之间的寄存器）只有初始化时需要清空
		StallF <= ~CpuRst && (MemToRegE && (RdE == Rs1D || RdE == Rs2D));
		StallD <= ~CpuRst && (MemToRegE && (RdE == Rs1D || RdE == Rs2D));
		StallE <= 1'b0;
		StallM <= 1'b0;
		StallW <= 1'b0;
		//------------------------------数据相关之停顿------------------------------
		//考虑当前指令在ID阶段
		//上一条指令访存并写回 且 当前指令ID阶段读的是同一个寄存器，则停顿（插入bubble）
		//这里并不像Forward那样判断RegWriteE非0，因为写入寄存器的数据可能是ALU的结果也可能是访存的结果
		//只有上一条指令写回寄存器的结果是访存的结果————情况3，才需要停顿，因此用MemToRegE判断
		//如果上一条指令写回寄存器的结果是ALU的结果，那么这就等价于情况1，会用Forward处理
	end


	always@(*) begin
		//------------------------------数据相关之转发------------------------------
		//当前指令在EX阶段
		//默认forward=2'b00
		//如果RegWriteM不为0，说明上一条指令（此时在MEM阶段）的ALU结果要写回寄存器————情况1————forward=2'b01
		//如果RegWriteW不为0，说明上上一条指令（此时在WB阶段）的访存结果要写回寄存器————情况2————forward=2'b11
		//应该注意。某些指令写0号寄存器，这是不起作用的，也就无需forward
		//Forward Register Source 1
		Forward1E[0] <= RdW != 0 && |RegWriteW && RegReadE[1] && (RdW == Rs1E) && ~(|RegWriteM && RegReadE[1] && (RdM == Rs1E));//如果上上条指令写回位置是Rs1E，上条指令也是，则应该取上条指令写的值
		Forward1E[1] <= RdM != 0 && |RegWriteM && RegReadE[1] && (RdM == Rs1E);
		//Forward Register Source 2
		Forward2E[0] <= RdW != 0 && |RegWriteW && RegReadE[0] && (RdW == Rs2E) && ~(|RegWriteM && RegReadE[0] && (RdM == Rs2E));//如果上上条指令写回位置是Rs2E，上条指令也是，则应该取上条指令写的值
		Forward2E[1] <= RdM != 0 && |RegWriteM && RegReadE[0] && (RdM == Rs2E);
	end
endmodule

//功能说明
    //HarzardUnit用来处理流水线冲突，通过插入气泡，forward以及冲刷流水段解决数据相关和控制相关，组合逻辑电路
    //可以最后实现。前期测试CPU正确性时，可以在每两条指令间插入四条空指令，然后直接把本模块输出定为，不forward，不stall，不flush 
//输入
    //CpuRst                                    外部信号，用来初始化CPU，当CpuRst==1时CPU全局复位清零（所有段寄存器flush），Cpu_Rst==0时cpu开始执行指令
    //ICacheMiss, DCacheMiss                    为后续实验预留信号，暂时可以无视，用来处理cache miss
    //BranchE, JalrE, JalD                      用来处理控制相关
    //Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW     用来处理数据相关，分别表示源寄存器1号码，源寄存器2号码，目标寄存器号码
    //RegReadE RegReadD[1]==1                   表示A1对应的寄存器值被使用到了，RegReadD[0]==1表示A2对应的寄存器值被使用到了，用于forward的处理
    //RegWriteM, RegWriteW                      用来处理数据相关，RegWrite!=3'b0说明对目标寄存器有写入操作
    //MemToRegE                                 表示Ex段当前指令 从Data Memory中加载数据到寄存器中
//输出
    //StallF, FlushF, StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW    控制五个段寄存器进行stall（维持状态不变）和flush（清零）
    //Forward1E, Forward2E                                                              控制forward
//实验要求  
    //实现HarzardUnit模块   