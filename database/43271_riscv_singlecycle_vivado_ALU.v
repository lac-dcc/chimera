// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 09:48:17 AM
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

`define ALUOp_nop 5'b00000
`define ALUOp_lui 5'b00001
`define ALUOp_auipc 5'b00010
`define ALUOp_add 5'b00011
`define ALUOp_sub 5'b00100
`define ALUOp_bne 5'b00101
`define ALUOp_blt 5'b00110
`define ALUOp_bge 5'b00111
`define ALUOp_bltu 5'b01000
`define ALUOp_bgeu 5'b01001
`define ALUOp_slt 5'b01010
`define ALUOp_sltu 5'b01011
`define ALUOp_xor 5'b01100
`define ALUOp_or 5'b01101
`define ALUOp_and 5'b01110
`define ALUOp_sll 5'b01111
`define ALUOp_srl 5'b10000
`define ALUOp_sra 5'b10001

module alu_480( 
    input	clk,
    input	rstn,
    input signed [31:0] 	A, B,  
    input [4:0]  			ALUOp, 
    input [31:0]   rom_addr,
    output reg signed [31:0] 	C, 
    output reg [7:0] 		Zero
); 
       
always@(posedge clk or negedge rstn)begin
    if(!rstn) 
        begin
        C=0; Zero=0;
        end
    else
        case(ALUOp)
            `ALUOp_lui: begin C = B + 0; Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_auipc:begin C = B + rom_addr;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_add: begin C = A + B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sub: begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bne: begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_blt:begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bge:begin C = A - B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bltu:begin C = ($unsigned(A) < $unsigned(B)) ? 1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_bgeu:begin C = ($unsigned(A) >= $unsigned(B)) ? 1'b1:1'b0;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_slt: begin C = (A<B)?1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            `ALUOp_sltu: begin C = ($unsigned(A)<$unsigned(B)) ? 1'b1:1'b0; Zero = C==0 ? 1'b1 : 1'b0;end
            `ALUOp_xor: begin C = A ^ B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_or:begin C = A | B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_and:begin C = A & B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sll:begin C = A << B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_srl:begin C = A >> B;Zero = C==0 ? 1'b1 : 1'b0; end
            `ALUOp_sra:begin C = A >>> B;Zero = C==0 ? 1'b1 : 1'b0; end
            default:C = 32'hFFFFFFFF;
        endcase
end
endmodule
