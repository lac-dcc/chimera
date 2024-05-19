// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: ALU
// Project Name: Computer organization Project 4
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input signed [15:0] A,
    input signed [15:0] B,
    input [3:0] OP,
    output reg [15:0] C,
    output bcond
    );
    
    always @(*) begin
        case (OP)
            0:  C = A + B;          // ADD, ADI, LWD, SWD
            1:  C = A - B;          // SUB
            2:  C = A & B;          // AND
            3:  C = A | B;          // ORR, ORI
            4:  C = ~A;             // NOT
            5:  C = ~A + 1'b1;      // TCP
            6:  C = A << 1;         // SHL
            7:  C = A >>> 1;        // SHR
            8:  C = {B[7:0], 8'b0}; // LHI
            9:  C = A - B;          // BNE
            10: C = A - B;          // BEQ
            11: C = A;              // BGZ
            12: C = A;              // BLZ
            default: C = 16'bz;
        endcase
    end
    
    // Using assign, C and bcond change at the same time.
    // The timing would have been different if they were inside a single always block. 
    assign bcond = OP==9  ? (C!=0) :        // BNE
                   OP==10 ? (C==0) :        // BEQ
                   OP==11 ? (C>0)  :        // BGZ                
                   OP==12 ? (C<0)  : 0;     // BLZ
    
endmodule
