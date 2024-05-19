// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: CPU Control Module
// Project Name: Computer organization Project 4
//////////////////////////////////////////////////////////////////////////////////

`include "opcodes.v"

module Control(
    input [3:0] opcode,
    input [5:0] func,
    output RegDst,
    output Jump,
    output Branch,
    output MemRead,
    output MemtoReg,
    output reg [3:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    output OpenPort
    );
    
    /* 
    Receives opcode and function code of an instruction, and generates control signals.
    RegDst  : Chooses RF write address (rt or rd)
    Jump    : Whether this instruction is a jump
    Branch  : Whether this instruction is a branch
    MemRead : Whether we should read data memory
    MemtoReg: Chooses what to write to RF (ALU result or data read from memory)
    ALUOp   : Controls ALU operation. Directly connected to the input OP of the ALU. (There is no ALU control module in this CPU)
    MemWrite: Whether we should write data to memory
    ALUSrc  : Chooses ALU second input (Second RF read data or sign-extended immediate)
    RegWrite: Whether we should write data to RF
    OpenPort: Wheter to open output_port of CPU
    */
    
    assign RegDst = (opcode==`OPCODE_R);
    assign Jump = (opcode==`OPCODE_JMP || opcode==`OPCODE_JAL);
    assign Branch = (opcode==`OPCODE_BEQ || opcode==`OPCODE_BNE || opcode==`OPCODE_BGZ || opcode==`OPCODE_BLZ);
    assign MemRead = (opcode==`OPCODE_LWD || opcode==`OPCODE_SWD);
    assign MemtoReg = (opcode==`OPCODE_LWD);
    assign MemWrite = (opcode==`OPCODE_SWD);
    assign ALUSrc = !(opcode==`OPCODE_R || opcode==`OPCODE_BEQ || opcode==`OPCODE_BNE);
    assign RegWrite = !(opcode==`OPCODE_SWD || opcode==`OPCODE_BEQ || opcode==`OPCODE_BNE || opcode==`OPCODE_BGZ || opcode==`OPCODE_BLZ || opcode==`OPCODE_JMP || func==`FUNC_WWD);
    assign OpenPort = (opcode==`OPCODE_R & func==`FUNC_WWD);
    
    always @(*) begin
        if (opcode==`OPCODE_R & func<8) ALUOp = func[3:0];
        else if (opcode==`OPCODE_ADI || opcode==`OPCODE_LWD || opcode==`OPCODE_SWD) ALUOp = 0;
        else if (opcode==`OPCODE_ORI) ALUOp = 3;
        else if (opcode==`OPCODE_LHI) ALUOp = 8;
        else if (opcode==`OPCODE_BNE) ALUOp = 9;
        else if (opcode==`OPCODE_BEQ) ALUOp = 10;
        else if (opcode==`OPCODE_BGZ) ALUOp = 11;
        else if (opcode==`OPCODE_BLZ) ALUOp = 12;
        else ALUOp = 15;
    end
    
endmodule
