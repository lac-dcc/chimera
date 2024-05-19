// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module control(
    input [31:0]instr,

    output reg [11:0]imm12,
    output reg rf_we,
    output reg [2:0]alu_op
);

wire [6:0]opcode = /* Problem 3: extract field 'opcode' from instruction. */
wire [2:0]funct3 = /* Problem 3: extract field 'funct3' from instruction. */

always @(*) begin
    rf_we = 1'b0;
    alu_op = 3'b0;
    imm12 = 12'b0;

    casez ({funct3, opcode})
        10'b000_0010011: begin // ADDI
            rf_we = 1'b1;
            alu_op = 3'b1;
            imm12 = instr[31:20];
        end
        default: ;
    endcase
end

endmodule
