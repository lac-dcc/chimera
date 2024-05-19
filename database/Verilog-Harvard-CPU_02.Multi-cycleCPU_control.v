// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: CPU Control
// Project Name: Computer organization Project 5
//////////////////////////////////////////////////////////////////////////////////

`include "opcodes.v"

`define NUM_CTRL 16
`define NUM_RT 14

module Control(
    input clk,
    input reset_n,
    input [3:0] opcode,
    input [5:0] func,
    output PCWriteCond,
    output PCWrite,
    output IorD,
    output ReadM,
    output WriteM,
    output [1:0] RegSrc,
    output IRWrite,
    output RegWrite,
    output [1:0] RegDst,
    output [1:0] PCSrc,
    output ALUSrcA,
    output [1:0] ALUSrcB,
    output Halt,
    output OpenPort,
    output reg [3:0] ALUOp,
    output increment_num_inst
    );
    /*
    Implementation of a micro-code controller using a ROM.
    
    Receives opcode and function code of an instruction, and generates control signals.
    Only those that are different from the lecture slide are explained here.
    
    RegSrc[2]   : Data being written to the RF.   B(00) or MDR(01) or PC(10)
    RegDst[2]   : Adress of register to write to. Inst[9:8](00) or Inst[7:6](01) or 2(10) 
    PCSrc[2]    : Source of next PC.              ALU result right now(00) or ALU result last cycle(01) or jump target(10) or A(11) 
    ALUSrcB[2]  : Second input to ALU.            B(00) or 1(01) or sign-extended immediate(10)
    
    increment_num_inst : signal that the next state is IF. CPU should increment num_inst for test.
    */
    
    reg [4:0] state, next_state;    // State code, as well as register transfer code, are defined in the design document. You can find this in my report.
    reg [3:0] one, two;             // Input to ROM. Code of (at most) two register transfers that occur this cycle.
    wire [`NUM_CTRL-1:0] CTRL;      // Output from ROM. (Almost) all control signals.
    
    // Unpack CTRL from ROM.
    assign {PCWriteCond, PCWrite, IorD, ReadM, WriteM, RegSrc, IRWrite, RegWrite, RegDst, PCSrc, ALUSrcA, ALUSrcB} = CTRL;
    
    // Halt and OpenPort
    assign Halt = (opcode==`OPCODE_R & func==`FUNC_HLT & state==2);
    assign OpenPort = (opcode==`OPCODE_R & func==`FUNC_WWD & state==2);
    
    assign increment_num_inst = (next_state == 0);
    
    // State transition
    always @(posedge clk) begin
        if (!reset_n) state <= 0;
        else state <= next_state;
    end
    
    // Set next_state
    always @(*) begin
        case (state)
             0: begin
                if (opcode==`OPCODE_ADI | opcode==`OPCODE_ORI | opcode==`OPCODE_LHI | opcode==`OPCODE_LWD) next_state = 1;
                else if ((opcode==`OPCODE_R & func!=`FUNC_JPR & func!=`FUNC_JRL) | opcode==`OPCODE_SWD) next_state = 2;
                else if (opcode==`OPCODE_BEQ | opcode==`OPCODE_BNE | opcode==`OPCODE_BGZ | opcode==`OPCODE_BLZ) next_state = 3;
                else if (opcode==`OPCODE_JMP) next_state = 4;
                else if (opcode==`OPCODE_JAL) next_state = 5;
                else if (opcode==`OPCODE_R & func==`FUNC_JPR) next_state = 6;
                else if (opcode==`OPCODE_R & func==`FUNC_JRL) next_state = 7;
            end
             1: begin
                if (opcode==`OPCODE_ADI | opcode==`OPCODE_ORI | opcode==`OPCODE_LHI) next_state = 8;
                else if (opcode==`OPCODE_LWD) next_state = 10;
            end
             2: begin
                if (opcode==`OPCODE_R & (func==`FUNC_WWD | func==`FUNC_HLT)) next_state = 0;
                else if (opcode==`OPCODE_R & func!=`FUNC_JPR & func!=`FUNC_JRL) next_state = 9;
                else if (opcode==`OPCODE_SWD) next_state = 10;
            end
             3: next_state = 11;
             4: next_state = 0;
             5: next_state = 0;
             6: next_state = 0;
             7: next_state = 0;
             8: next_state = 12;
             9: next_state = 13;
            10: begin
                if (opcode==`OPCODE_LWD) next_state = 14;
                else if (opcode==`OPCODE_SWD) next_state = 15;
            end
            11: next_state = 0;
            12: next_state = 0;
            13: next_state = 0;
            14: next_state = 16;
            15: next_state = 0;
            16: next_state = 0;
        endcase
    end
    
    // Set 'one'
    always @(*) begin
        case (state)
             0: one = 0;
             1: one = `NUM_RT;
             2: one = `NUM_RT;
             3: one = 2;
             4: one = 3;
             5: one = 3;
             6: one = 5;
             7: one = 4;
             8: one = 6;
             9: one = 7;
             10: one = 6;
             11: one = 7;
             12: one = 9;
             13: one = 10;
             14: one = 11;
             15: one = 12;
             16: one = 13;
             default:  one = 0;
        endcase
    end
    
    // Set 'two'
    always @(*) begin
        if (state==0) two = 1;
        else if (state==5) two = 4;
        else if (state==7) two = 5;
        else if (state==11) two = 8;
        else two = `NUM_RT;
    end
    
    // Set ALUOp
    always @(*) begin
        if (state==0 | state==3 | state==10) begin
            ALUOp = 0;
        end else if (state==8) begin
            if (opcode==`OPCODE_ADI) ALUOp = 0;
            else if (opcode==`OPCODE_ORI) ALUOp = 3;
            else if (opcode==`OPCODE_LHI) ALUOp = 8;
            else ALUOp = 15;
        end else if (state==9) begin
            if (opcode==`OPCODE_R & func<8) ALUOp = func[3:0];
            else ALUOp = 15;
        end else if (state==11) begin
            if (opcode==`OPCODE_BNE) ALUOp = 9;
            else if (opcode==`OPCODE_BEQ) ALUOp = 10;
            else if (opcode==`OPCODE_BGZ) ALUOp = 11;
            else if (opcode==`OPCODE_BLZ) ALUOp = 12;
            else ALUOp = 15;
        end else begin
            ALUOp = 15;
        end
    end
    
    // Instantiate ROM
    ROM rom (.one(one),
         .two(two),
         .CTRL(CTRL));
    
endmodule
