// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ALUContral(func, ALUop, ALUsrcA,RegWriteDataMUX_2b);
    input [5:0] func;
    output reg [3:0] ALUop;
    output reg ALUsrcA;
    output reg [1:0] RegWriteDataMUX_2b;
    
    always @(func)
    begin
        ALUsrcA = 1'b0; //default
        RegWriteDataMUX_2b = 2'b00;
        case(func)
            6'b100000: ALUop = 4'b0000; //add
            6'b100001: ALUop = 4'b0000; //addu
            6'b100010: ALUop = 4'b0001; //sub
            6'b100011: ALUop = 4'b0001; //subu
            6'b100101: ALUop = 4'b0010; //or
            6'b100100: ALUop = 4'b0011; //and
            6'b100111: ALUop = 4'b1000; //nor
            6'b100110: ALUop = 4'b0111; //xor
            6'b101010:
            begin
                ALUop = 4'b0001; //sub set less than
                RegWriteDataMUX_2b = 2'b10;
            end
            6'b000000: 
            begin
                ALUop = 4'b0100; //sll
                ALUsrcA = 1'b1; 
            end
            6'b000100: ALUop = 4'b0100; //sllv
            6'b000010: 
            begin
                ALUop = 4'b0101; //srl
                ALUsrcA = 1'b1; 
            end
            6'b000110: ALUop = 4'b0101; //srlv
            6'b000011: 
            begin
                ALUop = 4'b0110; //sra
                ALUsrcA = 1'b1; 
            end
            6'b000111: ALUop = 4'b0110; //srav
            default: ALUop = 4'b0000; //others
        endcase
    end

endmodule

