// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module ALU (
    input [15:0] A, B,
    input [3:0] opcode,
    output wire [15:0] result
);

reg [15:0] result_r;
assign result = result_r;

always @ (A, B, opcode) begin
    case (opcode)
        4'b0000: result_r <= A + B;       // 加法
        4'b0001: result_r <= A - B;       // 减法
        4'b0010: result_r <= A & B;       // 与操作
        4'b0011: result_r <= A | B;       // 或操作
        4'b0100: result_r <= A << B;      // 逻辑左移
        4'b0101: result_r <= A >> B;      // 逻辑右移
        default: result_r <= 16'b0;       // 默认输出为0
    endcase
end

endmodule
