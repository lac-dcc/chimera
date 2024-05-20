// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

`include "mem_async.v"
`include "mem_sync.v"
`include "rf.v"
`include "alucontrol.v"
`include "alu.v"
`include "pclogic.v"
`include "andm.v"
`include "signextend.v"
`include "mux.v"

module datapath(
    input clk, 
    input reset, 
    input RegDst,
    input AluSrc,
    input MemtoReg,
    input RegWrite,
    input MemRead,
    input MemWrite,
    input Branch,
    input[1:0] ALUOp,
    input[5:0] OpCode
);

    wire [31:0] Instruction;
    wire [3:0] ALUCtrl;
    wire [31:0] ALUout;
    wire Zero;

    assign OpCode = Instruction[31:26];

    wire [31:0] PC_adr;

    wire [31:0] ReadRegister1;
    wire [31:0] ReadRegister2;

    wire [4:0] muxinstr_out;
    wire [31:0] muxalu_out;
    wire [31:0] muxdata_out;

    wire [31:0] ReadData;

    wire [31:0] signExtend;

    wire PCsel;

    //Instruction memory
    mem_async meminstr(.a(PC_adr[7:0]), .d(Instruction));
    //Data memory 
    mem_sync memdata(clk, ALUout[7:0], ReadData, ReadRegister2, MemRead, MemWrite);
    //Registers 
    rf registerfile(clk,RegWrite,Instruction[25:21],Instruction[20:16],muxinstr_out, ReadRegister1, ReadRegister2, muxdata_out); 
    
    //ALUControl
    alucontrol AluControl(ALUOp, Instruction[5:0], ALUCtrl);
    //ALU
    alu Alu(ReadRegister1, muxalu_out, ALUCtrl, ALUout, Zero); 

    //generate PC
    pclogic PC(clk, reset, signExtend, PC_adr, PCsel); 
    //AndPC (branch & zero)
    andm andPC(Branch, Zero, PCsel); 
    //Sign extend
    signextend Signextend(signExtend, Instruction[15:0]); 

    //MUX for Write Register
    mux #(5) muxinstr(RegDst, Instruction[20:16],Instruction[15:11],muxinstr_out);
    //MUX for ALU
    mux #(32) muxalu(AluSrc, ReadRegister2, signExtend, muxalu_out);
    //MUX for Data memory
    mux #(32) muxdata(MemtoReg, ALUout, ReadData, muxdata_out); 

endmodule
