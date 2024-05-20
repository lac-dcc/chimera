// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ALUContral(func, ALUop, ALUsrcA);
    input [5:0] func;
    output reg [2:0] ALUop;
    output reg ALUsrcA;
    
    always @(func)
    begin
        ALUsrcA = 1'b0; //default
        case(func)
            6'b100000: ALUop = 3'b000; //add
            6'b100010: ALUop = 3'b001; //sub
            6'b100101: ALUop = 3'b010; //or
            6'b100100: ALUop = 3'b011; //and
            6'b000000: 
            begin
                ALUop = 3'b100; //sll
                ALUsrcA = 1'b1; 
            end
            6'b000100: ALUop = 3'b100; //sllv
            6'b000010: 
            begin
                ALUop = 3'b101; //srl
                ALUsrcA = 1'b1; 
            end
            6'b000110: ALUop = 3'b101; //srlv
            6'b000011: 
            begin
                ALUop = 3'b110; //sra
                ALUsrcA = 1'b1; 
            end
            6'b000111: ALUop = 3'b110; //srav
            default: ALUop = 3'b000; //others
        endcase
    end

endmodule

