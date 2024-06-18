// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module alu_decoder (
    input [1:0] ALUop,
    input [4:0] func,
    output reg [3:0] opcode
);
    
always @(*) begin
    if (ALUop == 2) 
        opcode = 4'b0000;
    else if (~ALUop[1]) 
        case (func[2:0])
            3'b000 : opcode = (func[3] & func[4])? 4'b0001 : 4'b0000 ; //ADD or ADDI or SUB
            3'b001 : opcode = 4'b0110; //SLL or SLLI
            3'b010 : opcode = 4'b0010; //SLT or SLTI
            3'b100 : opcode = 4'b0011; //XOR or XORI
            3'b101 : opcode = (func[3])? 4'b1000 : 4'b0111; // SRAI or SRA or SRLI or SRL 
            3'b110 : opcode = 4'b0100; //OR or ORI
            3'b111 : opcode = 4'b0101; //AND or ANDI

            default         : opcode = 4'b0000;
    endcase
    else 
        opcode = 4'b0000;

end

endmodule