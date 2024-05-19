// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module IF_ID(
    input wire clk,
    input wire reset,
    input wire flush_IFID,
    input wire hold,
    input wire Load_EX,     // if Load, flush is more important than hold

    input wire [31:0] Instruction,
    input wire [31:0] PC_IF,
    output reg [5:0] OpCode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] Shamt,
    output reg [5:0] Funct,
    output reg [31:0] PC_ID
);

initial begin
    OpCode <= 0;
    rs <= 0;
    rt <= 0;
    rd <= 0;
    Shamt <= 0;
    Funct <= 0;
    PC_ID <= 0;
end

always @(posedge clk or posedge reset) begin
    if(reset || (flush_IFID && Load_EX)) begin       // || flush_IFID
        OpCode <= 0;
        rs <= 0;
        rt <= 0;
        rd <= 0;
        Shamt <= 0;
        Funct <= 0;
        PC_ID <= 0;
    end
    else if (hold) begin
        OpCode <= OpCode;
        rs <= rs;
        rt <= rt;
        rd <= rd;
        Shamt <= Shamt;
        Funct <= Funct;
        PC_ID <= PC_ID;
    end
    else if (flush_IFID) begin
        OpCode <= 0;
        rs <= 0;
        rt <= 0;
        rd <= 0;
        Shamt <= 0;
        Funct <= 0;
        PC_ID <= 0;
    end
    else begin
        OpCode <= Instruction[31:26];
        rs <= Instruction[25:21];
        rt <= Instruction[20:16];
        rd <= Instruction[15:11];
        Shamt <= Instruction[10:6];
        Funct <= Instruction[5:0];
        PC_ID <= PC_IF;
    end
//     else if(!hold) begin
//         if(flush_IFID) begin
//             OpCode <= 0;
//             rs <= 0;
//             rt <= 0;
//             rd <= 0;
//             Shamt <= 0;
//             Funct <= 0;
//             PC_ID <= 0;
//         end
//         else begin
//             OpCode <= Instruction[31:26];
//             rs <= Instruction[25:21];
//             rt <= Instruction[20:16];
//             rd <= Instruction[15:11];
//             Shamt <= Instruction[10:6];
//             Funct <= Instruction[5:0];
//             PC_ID <= PC_IF;
//         end
//     end
//     else begin
//         OpCode <= OpCode;
//         rs <= rs;
//         rt <= rt;
//         rd <= rd;
//         Shamt <= Shamt;
//         Funct <= Funct;
//         PC_ID <= PC_ID;
//     end

end

endmodule