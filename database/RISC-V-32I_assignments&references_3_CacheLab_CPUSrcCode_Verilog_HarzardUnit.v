/*  
 *  HarzardUnit是用来解决流水线的数据相关、控制相关问题，输出stall、flush和forward信号 
 *  Author: Haojun Xia  
 *  Email: xhjustc@mail.ustc.edu.cn
 *  Time: 2019.2.22
 */

/* Stall和Flush信号的使用场景 *///////////////////////////////////////////////////////
//  1.Load-Use型，前一条指令load到x号寄存器，紧接着的指令用到了x号寄存器作为操作数
//  当load处于EX阶段，Use处于ID阶段时，StallF=1 StallD=1 FLushE=1
//  IF      ID      EX   |     MM      WB                           [Load]
//          IF      ID   | ID重新译码  EX     MM      WB            [Use]       
//  条件判断：（MemToRegE==1） && （RdE==Rs1D||RdE==Rs2D)
//  信号输出： StallF=1 StallD=1 FLushE=1
//
//  2.JAL无条件跳转
// 当JAL处于ID阶段时，FlushD=1
//  IF      ID   |     EX        MM      WB                          [JAL]
//          IF   |   IF取新地址  ID      EX     MM      WB           [Any]
//  条件判断：JalD==1
//  信号输出：FlushD=1
//
//  3.JALR无条件跳转
//  当JALR处于ID阶段时，StallF=1，FlushD=1
//  IF      ID   |    EX                                              [JALR]
//          IF   |   IF取相同地址                                     [Any]
//  条件判断：JalrD==1
//  信号输出：StallF=1 FlushD=1
//  当JALR处于EX阶段时，FLushD=1
//  IF      ID      EX       |    MM       WB                         [JALR]
//          IF  IF取相同地址 | IF取新地址  ID     EX     MM     WB    [Any]
//  条件判断：JalrE==1
//  信号输出：FlushD=1
//
//  4.Branch条件分支
//  当Br处于ID阶段时，StallF=1，FlushD=1
//  IF      ID   |    EX                                              [Br]
//          IF   |   IF取相同地址                                     [Any]
//  条件判断：BranchD==1
//  信号输出：StallF=1，FlushD=1
//  当Br处于EX阶段时
//  如果BranchE=1（即分支条件成立时），FlushD=1
//  IF      ID      EX       |    MM       WB                         [JALR]
//          IF  IF取相同地址 | IF取新地址  ID     EX     MM     WB    [Any]
//  条件判断：BranchE==1
//  信号输出：FlushD=1
//  如果BranchE=0，不作其它特殊处理
//  IF      ID      EX       |    MM       WB                         [JALR]
//          IF  IF取相同地址 |    ID       EX     MM     WB           [Any]
//  条件判断：BranchE==0
//  信号输出：不作其它特殊处理
//////////////////////////////////////////////////////////////////////////////////////
/* Stall和Flush信号的使用场景 *///////////////////////////////////////////////////////
//  1.EX阶段需要用到 上上 条指令load的值或者ALU计算结果
//  条件判断：RegWriteW==1 && (RdW==Rs1E||RdW==Rs2E)
//  信号输出：Forward1E=2'b01 Forward2E=2'b01
//  2.EX阶段需要用到 上 条指令的ALU计算结果
//  条件判断：RegWriteM==1 && (RdM==Rs1E||RdM==Rs2E)
//  信号输出：Forward1E=2'b10 Forward2E=2'b10
//////////////////////////////////////////////////////////////////////////////////////  

//处理顺序  优先处理EX段的情况 再考虑ID段
//值得注意的是，如果EX段是Branch、Jal或者Jalr，此时ID都为空，不会出现以上多种情况并存
//如果EX是load，出现了load-use问题，那么优先处理EX段的冲突，将按照load-use问题处理，即使ID段是跳转指令，也暂且不采取措施

module HarzardUnit(
    input wire BranchD, BranchE,
    input wire JalrD, JalrE, JalD,
    input wire [4:0] Rs1D, Rs2D, Rs1E, Rs2E,
    input wire MemToRegE,
    input wire [2:0] RegWriteE, RegWriteM, RegWriteW,
    input wire [4:0] RdE, RdM, RdW,
    input wire ICacheMiss, DCacheMiss ,
    output reg StallF, FlushD, StallD, FlushE, StallE, StallM, StallW,
    output wire Forward1D, Forward2D,
    output reg [1:0] Forward1E, Forward2E
    );
    //
    assign Forward1D=1'b0;
    assign Forward2D=1'b0;
    //Stall and Flush signals generate
    always @ (*)
    begin
        if(DCacheMiss | ICacheMiss)
        begin
            StallF<=1'b1;
            StallD<=1'b1;
            FlushD<=1'b0;
            FlushE<=1'b0;
            StallE<=1'b1;
            StallM<=1'b1;
            StallW<=1'b1;
        end
        else if(BranchE)
        begin
            StallF<=1'b0;
            StallD<=1'b0;
            FlushD<=1'b1;
            FlushE<=1'b0;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
        end
        else if(JalrE)
            begin
            StallF<=1'b0;
            StallD<=1'b0;
            FlushD<=1'b1;
            FlushE<=1'b0;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
        end
        else if(MemToRegE & ((RdE==Rs1D)||(RdE==Rs2D)) )
            begin
            StallF<=1'b1;
            StallD<=1'b1;
            FlushD<=1'b0;
            FlushE<=1'b1;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
        end
        else if(JalrD)
        begin
            StallF<=1'b1;
            StallD<=1'b0;
            FlushD<=1'b1;
            FlushE<=1'b0;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
        end
        else if(JalD)
        begin
            StallF<=1'b0;
            StallD<=1'b0;
            FlushD<=1'b1;
            FlushE<=1'b0;        
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;   
        end
        else if(BranchD)
        begin
            StallF<=1'b1;
            StallD<=1'b0;
            FlushD<=1'b1;
            FlushE<=1'b0;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
            end
        else
        begin
            StallF<=1'b0;
            StallD<=1'b0;
            FlushD<=1'b0;
            FlushE<=1'b0;
            StallE<=1'b0;
            StallM<=1'b0;
            StallW<=1'b0;
        end
    end
    //Forward信号的使用场景
    always@(*)
    begin
        if( (RegWriteM!=3'b0) && (RdM==Rs1E) &&(RdM!=5'b0) )
            Forward1E<=2'b10;
        else if( (RegWriteW!=3'b0) && (RdW==Rs1E) &&(RdW!=5'b0) )
            Forward1E<=2'b01;
        else
            Forward1E<=2'b00;
    end
    always@(*)
    begin
        if( (RegWriteM!=3'b0) && (RdM==Rs2E) &&(RdM!=5'b0) )
            Forward2E<=2'b10;
        else if( (RegWriteW!=3'b0) && (RdW==Rs2E) &&(RdW!=5'b0) )
            Forward2E<=2'b01;
        else
            Forward2E<=2'b00;
    end      
endmodule
