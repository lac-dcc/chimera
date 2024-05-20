// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module CPU(clk_, DataBusIn, DataBusOut,AddressBus, ContralBus, init);
    input clk_,init;
    input [31:0] DataBusIn;
    output [31:0] DataBusOut;
    output [31:0] AddressBus;
    output [3:0] ContralBus;

    reg clk=1;
    integer i=-1;
    always@(negedge clk_)
    begin
        i = (i + 1) % 2;
        if (i == 0) begin
            clk = ~clk;
        end
    end


    //module IF(J, Branch, target, zero, imm, pc, clk, init);
    wire J, Branch, ZERO;
    wire [15:0] imm;
    wire [25:0] target;
    wire [31:0] pc;

    IF If(.J(J), .Branch(Branch), .target(target), .zero(ZERO), .imm(imm), .pc(pc), .clk(clk), .init(init));
    

    
    //module Decoder(istruction, op, rs, rt, rd, shamt, funct, imm, addr);
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [31:0] shamt; //0扩展->32位
    wire [5:0] funct;
 
    reg [31:0] InstructReg;
    Decoder decoder(.istruction(InstructReg), .op(op), .rs(rs), .rt(rt), .rd(rd), .shamt(shamt), .funct(funct), .imm(imm), .addr(target));

    //module CU(op, RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype, ALUop);
    wire RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype;
    wire [2:0] CU_ALUop;
    CU cu(.op(op), .RegWrite(RegWrite), .RegDst(RegDst), .ALUsrcB(ALUsrcB), .ImmExt(ImmExt), .MemWrite(MemWrite), .Branch(Branch), .J(J), .MemtoReg(MemtoReg), .Memrhalf(Memrhalf), .Memrbyte(Memrbyte), .MemExt(MemExt), .Rtype(Rtype), .ALUop(CU_ALUop));

    assign ContralBus = {MemWrite,Memrhalf, Memrbyte,MemExt};

    //module ALUContral(func, ALUop, ALUsrcA);
    wire [2:0] ALUC_ALUop;
    wire ALUC_ALUsrcA;
    ALUContral alu_contral(.func(funct), .ALUop(ALUC_ALUop), .ALUsrcA(ALUC_ALUsrcA));

    //MUX ALUc多路选择
    wire [2:0] ALUop;
    MUX2_3B mux2_3b_1(.A(CU_ALUop),.B(ALUC_ALUop),.S(Rtype),.Y(ALUop));

    //MUX ALUsrcA多路选择 只有r型才会有shamt
    wire ALUsrcA;
    MUX2_1B mux2_1b_1(.A(1'b0),.B(ALUC_ALUsrcA),.S(Rtype),.Y(ALUsrcA));

 

    //module ImmExtend(imm, ImmExt, imm_ext);
    wire [31:0] imm_ext;
    ImmExtend imm_extend(.imm(imm), .ImmExt(ImmExt), .imm_ext(imm_ext));


    //mux2_5B rf 目的寄存器多路选择器
    wire [4:0] rw;
    MUX2_5B mux2_5B_1(.A(rt),.B(rd),.S(RegDst),.Y(rw));
    //module RF(ra,rb,rd,rw,we,qa,qb,clk,reset)
    wire [31:0] rf_rd, rf_qa, rf_qb;
    RF rf(.ra(rs), .rb(rt), .rd(rf_rd), .rw(rw), .we(RegWrite), .qa(rf_qa), .qb(rf_qb), .clk(clk), .reset(init));
    
    //存储器输入数据
    assign DataBusOut = rf_qb;

    //ALU A 输入多路选择器
    wire [31:0] ALU_A;
    MUX2_32B MUX2_32B_1(.A(rf_qa), .B(shamt), .S(ALUsrcA), .Y(ALU_A));

    //ALU B 输入多路选择器
    wire [31:0] ALU_B;
    MUX2_32B MUX2_32B_2(.A(rf_qb), .B(imm_ext), .S(ALUsrcB), .Y(ALU_B));

    //ALU(A,B,ALUC,ZERO,OF,OUT);
    wire [31:0] ALU_OUT;
    wire OF;
    ALU alu(.A(ALU_A), .B(ALU_B),.ALUC(ALUop),.ZERO(ZERO),.OF(OF),.OUT(ALU_OUT));

    //memtoreg
    MUX2_32B mux2_32B_3(.A(ALU_OUT), .B(DataBusIn), .S(MemtoReg), .Y(rf_rd));

    

    //控制地址总线是数据还是指令
    reg AddressBusC=1;
    assign AddressBus = AddressBusC?ALU_OUT:pc;

    reg [1:0] state = 2'b00;  // 2-bit state register
    integer count = 0;
    always @(negedge clk_) begin

        count = count+1;
        if (count == 5) begin
            count = 1;
            state = 2'b00;
        end

        case (state)
            2'b00: begin
                state = 2'b01;
            end
            2'b01: begin
                AddressBusC = 0;
                state = 2'b10;
            end
            2'b10:
            begin
                InstructReg = DataBusIn;
                AddressBusC = 1;
                state = 2'b11;
            end
            2'b11: begin
                state = 2'b11;
            end
        endcase
    end
endmodule