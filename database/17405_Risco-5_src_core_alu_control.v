// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module ALU_Control (
    input wire is_immediate,
    input wire [1:0] aluop_in,
    input wire [6:0] func7,
    input wire [2:0] func3,
    output reg [3:0] aluop_out
);

always @(*) begin
    case (aluop_in)
        2'b00: 
            aluop_out = 4'b0010;

        2'b01: begin
            case (func3)
                3'b000: //beq
                    aluop_out = 4'b0110; // SUB
                3'b100: // blt
                    aluop_out = 4'b1011; // precisa arrumar - Maior Igual
                3'b110: // bltu  
                    aluop_out = 4'b1101; // precisa arrumar - Maior Igual
                3'b101: // bge
                    aluop_out = 4'b0111; // SLT
                3'b111: // bgeu
                    aluop_out = 4'b1111;
                3'b001: // bne
                    aluop_out = 4'b1110; // Igualdade
                default: aluop_out = 4'b0110;
            endcase
        end

        2'b10: begin
            case (func3)
                3'b000: // addi, add e sub
                    if(is_immediate == 1'b0 && func7[5] == 1'b1)
                        aluop_out = 4'b0110;
                    else
                        aluop_out = 4'b0010;
                3'b001: // slli e sll
                    aluop_out = 4'b1000;
                3'b010: // slti e slt
                    aluop_out = 4'b0111;
                3'b011: // sltiu e sltu
                    aluop_out = 4'b1111;
                3'b100: // xori e xor
                    aluop_out = 4'b1010;
                3'b101: // srai, srli e sra, srl
                    if(func7[5] == 1'b1)
                        aluop_out = 4'b0011;
                    else
                        aluop_out = 4'b1001;
                3'b110: // ori e or
                    aluop_out = 4'b0001;
                3'b111: // andi e and
                    aluop_out = 4'b0000;
                default: aluop_out = 4'b0010;
            endcase
        end
    endcase
end

endmodule
