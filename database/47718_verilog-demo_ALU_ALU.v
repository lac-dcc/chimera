// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module ALU (
    input [15:0] A, B,
    input [3:0] opcode,
    output reg [15:0] result
);

always @ (A, B, opcode) begin
    case (opcode)
        4'b0000: result <= A + B;       // 加法
        4'b0001: result <= A - B;       // 减法
        4'b0010: result <= A & B;       // 与操作
        4'b0011: result <= A | B;       // 或操作
        4'b0100: result <= A << B;      // 逻辑左移
        4'b0101: result <= A >> B;      // 逻辑右移
        default: result <= 16'b0;       // 默认输出为0
    endcase
end

endmodule
