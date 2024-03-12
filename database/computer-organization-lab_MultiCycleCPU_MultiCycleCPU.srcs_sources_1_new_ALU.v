`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 19:11:01
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [2:0] ALUOp,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] result,
    output zero,    // 结果是否为0？是为1，否为0
    output sign    // 结果是否为负？是为1，否为0
    );
    
    assign zero = (result == 0) ? 1 : 0;
    assign sign = result[31];
    
    always @(ALUOp or A or B) begin
        case(ALUOp)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b010: result = B << A;
            3'b011: result = A | B;
            3'b100: result = A & B;
            3'b101: result = (A < B) ? 1 : 0; // 5: 比较无符号数
            3'b110: begin                     // 6: 比较带符号数
                        if((A[31] == B[31]) && (A < B)) result = 1;
                        else if(A[31]==1 && B[31]==0) result = 1;
                        else result = 0;
                    end
            3'b111: result = A ^ B;
        endcase
    end
endmodule
