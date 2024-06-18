// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module control(
    input [31:0]instr,

    output reg [11:0]imm12,
    output reg rf_we,
    output reg [2:0]alu_op,
    output reg is_r_type
);

wire [6:0]opcode = instr[6:0];
wire [2:0]funct3 = instr[14:12];
wire [6:0]funct7 = instr[31:25];

always @(*) begin
    rf_we = 1'b0;
    alu_op = 3'b0;
    imm12 = 12'b0;
    is_r_type = 1'b0;

    casez ({funct7, funct3, opcode})
        17'b?????_??_000_0010011: begin // ADDI
            rf_we = 1'b1;
            alu_op = 3'b001;
            imm12 = instr[31:20];
            is_r_type = 1'b0;
        end
        17'b?????_??_100_0010011: begin // XORI
            rf_we = 1'b1;
            alu_op = 3'b100;
            imm12 = instr[31:20];
            is_r_type = 1'b0;
        end
        17'b?????_??_110_0010011: begin // ORI
            rf_we = 1'b1;
            alu_op = 3'b110;
            imm12 = instr[31:20];
            is_r_type = 1'b0;
        end
        17'b?????_??_111_0010011: begin // ANDI
            rf_we = 1'b1;
            alu_op = 3'b111;
            imm12 = instr[31:20];
            is_r_type = 1'b0;
        end
        17'b00000_00_000_0110011: begin // ADD
            rf_we = 1'b1;
            alu_op = 3'b001;
            is_r_type = 1'b1;
        end
        17'b00000_00_100_0110011: begin // XOR
            rf_we = 1'b1;
            alu_op = 3'b100;
            is_r_type = 1'b1;
        end
        17'b00000_00_110_0110011: begin // OR
            rf_we = 1'b1;
            alu_op = 3'b110;
            is_r_type = 1'b1;
        end
        17'b00000_00_111_0110011: begin // AND
            rf_we = 1'b1;
            alu_op = 3'b111;
            is_r_type = 1'b1;
        end
        default: ;
    endcase
end

endmodule
