// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: cpu
// Project Name: Computer organization Project 4
//////////////////////////////////////////////////////////////////////////////////

// DEFINITIONS
`define WORD_SIZE 16    // data and address word size

// INCLUDE files
`include "opcodes.v"    // "opcode.v" consists of "define" statements for
                        // the opcodes and function codes for all instructions

// MODULE DECLARATION
module cpu (
    output reg readM,                       // read from memory
    output reg [`WORD_SIZE-1:0] address,    // current address for data
    inout [`WORD_SIZE-1:0] data,            // data being input or output
    input inputReady,                       // indicates that data is ready from the input port
    input reset_n,                          // active-low RESET signal
    input clk,                              // clock signal

    // for debuging/testing purpose
    output reg [`WORD_SIZE-1:0] num_inst,   // number of instruction during execution
    output [`WORD_SIZE-1:0] output_port // this will be used for a "WWD" instruction
);

    // General CPU declarations
    reg reading_instruction;                    // Whether the current data access is for instruction or memory
    reg [`WORD_SIZE-1:0] PC, nextPC;            // Update PC to nextPC at every posedge clk
    reg [`WORD_SIZE-1:0] instruction, dataReg;  // Because data is only available for a short time, we need to save it.
    
    // Control signals from control module
    wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, OpenPort;
    wire [3:0] ALUOp;
    
    // RF related declarations
    wire [`WORD_SIZE-1:0] ReadData1, ReadData2;
    
    // ALU related declarations
    wire bcond;
    wire [`WORD_SIZE-1:0] ALUResult;
    
    // Actual modul declarations
    Control control(.opcode(instruction[15:12]),
                    .func(instruction[5:0]),
                    .RegDst(RegDst),
                    .Jump(Jump),
                    .Branch(Branch),
                    .MemRead(MemRead),
                    .MemtoReg(MemtoReg),
                    .ALUOp(ALUOp),
                    .MemWrite(MemWrite),
                    .ALUSrc(ALUSrc),
                    .RegWrite(RegWrite),
                    .OpenPort(OpenPort));
                    
    RF rf(.write(RegWrite),
          .clk(clk),
          .reset_n(reset_n),
          .addr1(instruction[11:10]),
          .addr2(instruction[9:8]),
          .addr3(RegDst ? instruction[7:6] : instruction[9:8]), // Write address either rt or rd
          .data1(ReadData1),
          .data2(ReadData2),
          .data3(MemtoReg ? dataReg : ALUResult));
          
    ALU alu(.A(ReadData1),
            .B(ALUSrc ? {{8{instruction[7]}}, instruction[7:0]} : ReadData2),   // Either sign-extended immediate or second register read from RF.
            .OP(ALUOp),
            .C(ALUResult),
            .bcond(bcond));
    
    always @(*) begin
        if (Jump) nextPC = {PC[15:12], instruction[11:0]};  // Jumping to target (12 bit), concatenated with the upper 4 bits of PC.
        else if (Branch & bcond) nextPC = PC + {{8{instruction[7]}}, instruction[7:0]}; // Branching to PC + sign-extend(immediate)
        else nextPC = PC + 1;   // Next instruction
    end
    
    // Only open when OpenPort is asserted by the control module
    assign output_port = OpenPort ? ReadData1 : `WORD_SIZE'bz;
  
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin     // Asynchronous active low reset
            PC <= 0;
            nextPC <= 0;
            num_inst <= 1;
        end else begin
            PC <= nextPC;
            num_inst <= num_inst + 1;
        end
    end
    
    // When PC updates, assert readM for instruction fetch
    always @(PC) begin
        address = PC;
        readM = 1;
        reading_instruction = 1;
    end
    
    // When inputReady changes from 0 to 1
    always @(posedge inputReady) begin
        if (reading_instruction) begin  // instruction fetch mode
            instruction <= data;
            readM <= 0;
            reading_instruction <= 0;   // deassert since instruction fetch is done
        end else begin                  // data fetch mode
            dataReg <= data;
            readM <= 0;
        end
    end

endmodule
//////////////////////////////////////////////////////////////////////////
