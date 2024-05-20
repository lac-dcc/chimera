// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`include "xgriscv_defines.v"
module xgriscv_cpu_480(
    input      clk,           
    input      reset,         
    input [31:0]  instr,    
    input [31:0]  readdata,     
   
    output    memwrite,          
    output [31:0] pc,     
    output [31:0] addr,   
    output [31:0] writedata,
    output [31:0] pcW

);

 //=====================指令解码=================
   wire [6:0]Op;  
   assign Op = instr[6:0]; //opcode
   wire [6:0]Funct7;
   assign Funct7 = instr[31:25];   //funcnt7
   wire [2:0]Funct3;
   assign Funct3 = instr[14:12];   //funct3
   wire [4:0]rs1;
   assign rs1 = instr[19:15];  // rs1
   wire [4:0]rs2 ;
   assign rs2= instr[24:20];  // rs2
   wire [4:0]rd;
   assign rd = instr[11:7];  // rd
   wire [11:0]iimm;      
   assign iimm = instr[31:20]; //i型指令的立即数解析方式生成的立即数
   wire [11:0]simm;
   assign simm = {instr[31:25],instr[11:7]};   //s型指令立即数解析方式生成的立即数
   wire [4:0] iimm_shamt;
   assign iimm_shamt = instr[24:20];   //i形指令移位立即数
   wire [19:0] jimm;
   assign jimm = {instr[31],instr[19:12],instr[20],instr[30:21]};  //UJ型指令立即数
   wire [11:0] bimm;
   assign bimm = {instr[31],instr[7],instr[30:25],instr[11:8]};    //SB型指令立即数
   wire [19:0] uimm;
   assign uimm = instr[31:12]; //U型指令立即数 
   //===============================================

//========控制信号例化=================== 
    wire Zero; //alu输出的两个值之一，用于branch
    wire RegWrite;//用于控制写信号
    wire MemWrite;//是否写入Mem
    wire[5:0]EXTOp;//立即数生成信号
    wire[4:0] ALUOp;//ALUOp
    wire ALUSrc;//ALUSrc
    wire [2:0] DMType;//Mem读取/写入方式：字节/半字...
    wire [1:0]WDSel;//控制信号,写回寄存器
    wire [2:0]NPCOp;//NPCOp下一条ROMadddress
   ctrl_480 U_CTRL_480(
    .Op(Op),
    .Funct3(Funct3),
    .Funct7(Funct7),
    .Zero(Zero),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .EXTOp(EXTOp),
    .ALUOp(ALUOp),
    .NPCOp(NPCOp),
    .ALUSrc(ALUSrc),
    .DMType(DMType),
    .WDSel(WDSel)
    );
    assign memwrite = MemWrite;
 //========================================
//PC的读取和写入=========================================
wire [31:0]immout;//立即数生成输出的立即数
wire [31:0] aluout;   //ALU的输出
wire [31:0] NPC;
PC U_PC(.clk(clk), .rstn(reset), .NPC(NPC), .PC(pc) );
NPC U_NPC(.PC(pc), .NPCOp(NPCOp), .Zero(Zero), .immout(immout), .NPC(NPC), .rs1(rs1),.ALUOp(ALUOp), .aluout(aluout), .pcW(pcW));
//======================================================
//================立即数生成===============

   EXT_480 U_EXT_480(
    .iimm_shamt(iimm_shamt),
    .iimm(iimm),
    .simm(simm),
    .bimm(bimm),
    .uimm(uimm),
    .jimm(jimm),
    .EXTOp(EXTOp),
    .immout(immout)
   ); 
   //==============================================================

   //================RF===================
    wire[31:0]RD1;//第一个读端口读出来的数据
    wire[31:0]RD2;//第二个读端口读出来的数据
    wire[31:0] WD; //写入寄存器的数据
   //RF的例化
    regfile U_RF_480(
    .clk(clk),
    .we3(RegWrite),
    .ra1(rs1),
    .ra2(rs2),
    .wa3(rd),
    .wd3(WD),
    .rd1(RD1),
    .rd2(RD2)
    );

   //==============ALU===================
    wire signed [31:0]A;    //ALU第一个输入
    wire signed [31:0]B;    //ALU第二个输入

    //选择ALU的输入，用mux搞定RD2
    assign A=RD1;
    alu_mux_480 U_alu_mux_480(
            .immout(immout),
            .RD2(RD2),
            .ALUSrc(ALUSrc),
            .B(B)
    );
 //alu例化
   alu_480 U_alu_480(
        .A(A), 
        .B(B), 
        .rom_addr(pc),
        .ALUOp(ALUOp), 
        .C(aluout), 
        .Zero(Zero)
    );
//================================================ 

//==================================================
  assign addr=aluout;  //Mem的地址，由ALU计算得出
  assign writedata=RD2;  //输入Mem的数据，store指令时，用第二个读端口读出来的数据
  assign memwrite = MemWrite;

  //选择输入rf的值===================== 
  rf_mux_480 U_RF_mux_480(
    .WDSel(WDSel),
    .dout(readdata),
    .PC_out(pc),
    .aluout(aluout),
    .WD(WD)
);
//=========================================
endmodule