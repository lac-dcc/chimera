// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: cpu
// Project Name: Computer organization Project 5
//////////////////////////////////////////////////////////////////////////////////

// INCLUDE files
`include "opcodes.v"
`include "constants.v"

// MODULE DECLARATION
module cpu (
    output reg readM,                       // read from memory
    output reg writeM,                      // write to memory
    output reg [`WORD_SIZE-1:0] address,    // current address for data
    inout [`WORD_SIZE-1:0] data,            // data being input or output
    input inputReady,                       // indicates that data is ready from the input port
    input reset_n,                          // active-low RESET signal
    input clk,                              // clock signal

    // for debuging/testing purpose
    output reg [`WORD_SIZE-1:0] num_inst,   // number of instruction during execution
    output [`WORD_SIZE-1:0] output_port,    // this will be used for a "WWD" instruction
    output is_halted                        // 1 if the cpu is halted
);


    ///////////////////////////// Declarations and Instantiations ///////////////////////////// 
    // Testbench purposes
    reg [`WORD_SIZE-1:0] internal_num_inst;     // only show num_inst value for exactly one cycle in each instruction
    
    // Registers in the CPU
    reg [`WORD_SIZE-1:0] PC, nextPC;
    reg [`WORD_SIZE-1:0] IR, MDR;
    reg [`WORD_SIZE-1:0] A, B;
    reg [`WORD_SIZE-1:0] ALUOut;
    
    // Control module
    wire PCWriteCond, PCWrite, IorD, control_read, control_write, IRWrite, RegWrite, ALUSrcA, OpenPort, increment_num_inst;
    wire [1:0] RegSrc, RegDst, PCSrc, ALUSrcB;
    wire [3:0] ALUOp;
    
    Control control (clk, reset_n, IR[15:12], IR[5:0], PCWriteCond, PCWrite, IorD, control_read, control_write, RegSrc,
             IRWrite, RegWrite, RegDst, PCSrc, ALUSrcA, ALUSrcB, is_halted, OpenPort, ALUOp, increment_num_inst);
    
    // RF
    reg [`WORD_SIZE-1:0] WriteAddress, WriteData;
    wire [`WORD_SIZE-1:0] ReadData1, ReadData2;
    
    RF rf (RegWrite, clk, reset_n, IR[11:10], IR[9:8], WriteAddress, ReadData1, ReadData2, WriteData);
    
    // ALU
    reg [`WORD_SIZE-1:0] ALUin1, ALUin2;
    wire [`WORD_SIZE-1:0] ALUResult;
    wire branch_cond;
    
    ALU alu (ALUin1, ALUin2, ALUOp, ALUResult, branch_cond);
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    //////////////////////////////////////// CPU reset //////////////////////////////////////// 
    always @(posedge clk) begin
        if (!reset_n) begin     // Synchronous active-low reset
            PC <= 0;
            internal_num_inst <= 1;
        end
    end
    ///////////////////////////////////////////////////////////////////////////////////////////

    
    ///////////////////////////////////// Outward Signals /////////////////////////////////////
    // Only open output_port when control signal OpenPort is asserted,
    assign output_port = OpenPort ? ReadData1 : `WORD_SIZE'bz;
    
    // increment_num_inst is asserted when the current stage is the last stage of this instruction.
    always @(posedge increment_num_inst) begin
        internal_num_inst <= internal_num_inst + 1;
    end
    always @(increment_num_inst) begin
        if (increment_num_inst) num_inst = internal_num_inst;
        else num_inst = 0;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    ////////////////////////////////////// Memory Access //////////////////////////////////////
    // Read
    always @(posedge control_read) begin
        if (IorD) address <= ALUOut;
        else address <= PC;
        readM <= 1;
    end
    always @(posedge inputReady) begin
        if (IRWrite) IR <= data;     // instruction fetch mode
        else MDR <= data;            // data fetch mode
        readM <= 0;
    end
    
    // Write
    assign data = control_write ? B : `WORD_SIZE'bz;
    always @(posedge control_write) begin
        address <= ALUOut;
        writeM <= 1;
    end
    always @(negedge clk) begin     // Kill writeM before posedge.
        writeM <= 0;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////// Updating PC ///////////////////////////////////////
    // Determine nextPC
    always @(*) begin
        case (PCSrc)
            0: nextPC = ALUResult;
            1: nextPC = ALUOut;
            2: nextPC = { PC[15:12], IR[11:0] };
            3: nextPC = ReadData1;
            default: begin end
        endcase
    end
    
    // Update PC at clock posedge
    always @(posedge clk) begin
        if (reset_n) 
            if (PCWrite | (PCWriteCond & branch_cond)) PC <= nextPC;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    

    ////////////////////////////////////// Register File //////////////////////////////////////
    always @(*) begin
        case (RegDst)
            0: WriteAddress = IR[9:8];
            1: WriteAddress = IR[7:6];
            2: WriteAddress = 2'b10;
            default: begin end
        endcase
        case (RegSrc)
            0: WriteData = ALUOut;
            1: WriteData = MDR;
            2: WriteData = PC;
            default: begin end
        endcase
    end
    
    // Register transfer every clock
    always @(posedge clk) begin
        if(reset_n) begin
            A <= ReadData1;
            B <= ReadData2;
        end
    end
    ///////////////////////////////////////////////////////////////////////////////////////////


    /////////////////////////////////////////// ALU ///////////////////////////////////////////
    always @(*) begin
        case (ALUSrcA)
            0: ALUin1 = PC;
            1: ALUin1 = A;
            default: begin end
        endcase
        case (ALUSrcB)
            0: ALUin2 = B;
            1: ALUin2 = 16'b1;
            2: ALUin2 = { {8{IR[7]}}, IR[7:0] };
            default: begin end
        endcase
    end
    
    // Register transfer every clock
    always @(posedge clk) begin
        if (reset_n) ALUOut <= ALUResult;
    end
    ///////////////////////////////////////////////////////////////////////////////////////////
    
endmodule
