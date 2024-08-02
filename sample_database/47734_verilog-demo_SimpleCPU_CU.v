// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module CU (
    input [15:0] Ins,
    output wire Register_write_enable,
    output wire [3:0] ALU_opcode,
    output wire [2:0] r1, r2, r3
);
reg Register_write_enable_r;
reg [3:0] ALU_opcode_r;
reg [2:0] r1_r, r2_r, r3_r;
reg [6:0] opcode;
assign r1 = r1_r;
assign r2 = r2_r;
assign r3 = r3_r;
assign ALU_opcode = ALU_opcode_r;
assign Register_write_enable = Register_write_enable_r;
always @ (Ins) begin
    opcode = Ins[15:9];
    r1_r = Ins[8:6];
    r2_r = Ins[5:3];
    r3_r = Ins[2:0];
    case (opcode)
        7'b0000000: begin
            ALU_opcode_r = 4'b0000;       // 加法
            Register_write_enable_r = 1;
        end
        7'b0000001: begin
            ALU_opcode_r = 4'b0001;       // 减法
            Register_write_enable_r = 1;
        end
        7'b0000010: begin
            ALU_opcode_r = 4'b0010;       // 与操作
            Register_write_enable_r = 1;
        end
        7'b0000011: begin
            ALU_opcode_r = 4'b0011;       // 或操作
            Register_write_enable_r = 1;
        end
        7'b0000100: begin
            ALU_opcode_r = 4'b0100;      // 逻辑左移
            Register_write_enable_r = 1;
        end
        7'b0000101: begin
            ALU_opcode_r = 4'b0101;      // 逻辑右移
            Register_write_enable_r = 1;
        end
        default: begin
            ALU_opcode_r = 4'b0;       // 默认输出为0
            Register_write_enable_r = 0;
        end
    endcase
end
endmodule
