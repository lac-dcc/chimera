// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// 按键消抖

module key_filter
#(
    parameter SYS_CLK = 50_000_000, // default to 50 MHz
    parameter FILTER_TIME = 50 // 毫秒, default to 50 ms
)
(
    input clk,
    input rst_n,
    input key_in,
    output reg key_out
);

    // 根据时钟频率计算指定时间内计数器最大值:
    localparam
        CLK_TIME = 1_000_000_000 / SYS_CLK, // 一个时钟周期的耗时ns
        CLK_MAX = FILTER_TIME * 1_000_000 / CLK_TIME, // 计数器最大值
        CNT_WIDTH = $clog2(CLK_MAX + 1); // 计数器位宽

    localparam [CNT_WIDTH-1:0] CNT_0 = 0;
    localparam [CNT_WIDTH-1:0] CNT_MAX = CLK_MAX;

    reg [CNT_WIDTH-1:0] cnt;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            cnt <= CNT_0;
        end else begin
            if (key_in == 1'b1) begin
                // key unpressed, keep 0:
                cnt <= CNT_0;
            end else begin
                // key pressed, cnt = 0, 1, 2, ... , MAX-1, MAX, MAX, ... 计数到最大值后保持
                cnt <= (cnt == CNT_MAX) ? CLK_MAX : cnt + 1;
            end
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            key_out <= 1'b1;
        end else begin
            // key out is triggered at MAX-1:
            key_out <= (cnt == CNT_MAX - 1) ? 1'b0 : 1'b1;
        end
    end
endmodule
