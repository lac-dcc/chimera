// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module PC (
    input wire clk,       // 时钟输入
    input wire reset,     // 复位输入
    output wire [7:0] pc   // 8位程序计数器输出
);

reg [7:0] pc_r;
assign pc = pc_r;

// 初始化计数器
always @ (posedge clk or posedge reset)
begin
    if (reset)        // 当复位信号为高电平时
        pc_r <= 8'b00000000;  // 将计数器复位为0
    else if (clk)    // 在每个时钟的上升沿
        pc_r <= pc_r + 1; // 计数器加1
end

endmodule
