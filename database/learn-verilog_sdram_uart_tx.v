// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/******************************************************************************

串口发送数据 (8bit, 不带奇偶校验, 停止位1)

Baud = 9600, 14400, 19200, 38400, 57600, 115200

输出波形在计数器计数点变化:

   │     │     │     │     │     │     │     │     │     │     │
   ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼     ▼
───┐  0  ┌─────┐  0     0  ┌─────┐  0  ┌─────┐  0     0  ┌──────
   └─────┘  1  └───────────┘  1  └─────┘  1  └───────────┘  1

******************************************************************************/

module uart_tx #(
    parameter BAUD = 9600, // 波特率, 默认值 9600
    parameter SYS_CLK = 50_000_000 // 时钟频率, 默认值 50MHz
)
(
    input clk,
    input rst_n,
    input [7:0] in_data, // 待发送数据
    input in_en, // 发送信号=1有效
    output reg out_data, // 输出串口数据信号
    output out_en // 输出信号=1有效, 0=空闲
);
    localparam
        MAX = SYS_CLK / BAUD - 1, // 计数器最大值
        WIDTH = $clog2(MAX + 1); // 计数器位宽

    localparam [WIDTH-1:0] CNT_0 = 0;
    localparam [WIDTH-1:0] CNT_MAX = MAX;

    localparam
        IDLE = 1'b0,
        TRANSFER = 1'b1;

    reg status;
    reg [3:0] bps_cnt; // count for 0, 1, 2, ..., 7, 8
    reg [WIDTH-1:0] cnt;
    reg [7:0] data;

    assign out_en = status;

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            status <= IDLE;
            bps_cnt <= 4'd0;
            cnt <= CNT_0;
            data <= 8'b0;
            out_data <= 1'b1;
        end else begin
            if (status == IDLE) begin
                if (in_en == 1'b1) begin
                    // 输入数据有效时准备传输:
                    status <= TRANSFER;
                    bps_cnt <= 4'd1;
                    cnt <= CNT_MAX;
                    data <= in_data;
                    out_data <= 1'b1;
                end
            end else begin
                // transfer data:
                status <= TRANSFER;
                if (cnt == CNT_MAX) begin
                    cnt <= CNT_0;
                    case (bps_cnt)
                        4'd1: begin
                            // start 0:
                            out_data <= 1'b0;
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd2: begin
                            out_data <= data[0];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd3: begin
                            out_data <= data[1];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd4: begin
                            out_data <= data[2];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd5: begin
                            out_data <= data[3];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd6: begin
                            out_data <= data[4];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd7: begin
                            out_data <= data[5];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd8: begin
                            out_data <= data[6];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd9: begin
                            out_data <= data[7];
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        4'd10: begin
                            // end 1:
                            out_data <= 1'b1;
                            bps_cnt <= bps_cnt + 1'b1;
                            status <= TRANSFER;
                        end
                        4'd11: begin
                            // done:
                            out_data <= 1'b1;
                            bps_cnt <= 4'd0;
                            status <= IDLE;
                        end
                        default: begin
                            out_data <= 1'b1;
                            bps_cnt <= 4'd0;
                            status <= IDLE;
                        end
                    endcase
                end else begin
                    cnt <= cnt + 1;
                end
            end
        end
    end

endmodule
