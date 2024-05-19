// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/******************************************************************************

串口接收数据 (8bit, 不带奇偶校验, 停止位1)

Baud = 9600, 14400, 19200, 38400, 57600, 115200

计数器采样点: 在上下沿的中点采样

   │  │  │  │  │  │  │  │  │  │  │  │  │  │  │  │  │  │  │  │
   ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼  ▼
───┐  0  ┌─────┐  0     0  ┌─────┐  0  ┌───────────┐  0  ┌─────
   └─────┘  1  └───────────┘  1  └─────┘  1     1  └─────┘  1

******************************************************************************/

module uart_rx #(
    parameter BAUD = 9600, // 波特率, 默认值 9600
    parameter SYS_CLK = 50_000_000 // 时钟频率, 默认值 50MHz
)
(
    input clk,
    input rst_n,
    input in_data, // 输入串口数据
    output [7:0] out_data, // 输出接收数据
    output reg out_en // 输出=1有效
);

    localparam
        MAX = SYS_CLK / BAUD / 2 - 1, // 计数器最大值
        WIDTH = $clog2(MAX + 1); // 计数器位宽

    localparam [WIDTH-1:0] CNT_0 = 0;
    localparam [WIDTH-1:0] CNT_MAX = MAX;

    localparam
        IDLE = 1'b0,
        RECEIVING = 1'b1;

    reg status;
    reg [WIDTH-1:0] cnt;
    reg [4:0] bps_cnt; // count for 0, 1, 2, ..., 15, 16, 17
    reg [7:0] data;
    reg [2:0] rx_detect; // 延迟两拍采样

    assign out_data = out_en == 1'b1 ? data : 8'd0;

    always @ (posedge clk) begin
        rx_detect[0] <= in_data;
        rx_detect[1] <= rx_detect[0];
        rx_detect[2] <= rx_detect[1];
    end

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            status <= IDLE;
            cnt <= CNT_0;
            bps_cnt <= 5'd0;
            data <= 8'd0;
            out_en <= 1'b0;
        end else begin
            if (status == IDLE) begin
                data <= 8'd0;
                out_en <= 1'b0;
                cnt <= CNT_0;
                if (rx_detect[2:1] == 2'b10) begin
                    // start receiving:
                    status <= RECEIVING;
                    bps_cnt <= 5'd1;
                end else begin
                    // keep IDEL status:
                    status <= IDLE;
                    bps_cnt <= 5'd0;
                end
            end else begin
                // receiving data:
                if (cnt == CNT_MAX) begin
                    cnt <= CNT_0;
                    case (bps_cnt)
                        5'd1: begin
                            // start 0 sample point:
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        5'd2, 5'd4, 5'd6, 5'd8, 5'd10, 5'd12, 5'd14, 5'd16, 5'd18: begin
                            // ignore sampling near at edge:
                            bps_cnt <= bps_cnt + 1'b1;
                        end
                        5'd3, 5'd5, 5'd7, 5'd9, 5'd11, 5'd13, 5'd15, 5'd17: begin
                            bps_cnt <= bps_cnt + 1'b1;
                            data <= { rx_detect[2], data[7:1] };
                        end
                        5'd19: begin
                            // end 1 sample point:
                            bps_cnt <= 5'd0;
                            status <= IDLE;
                            data <= data;
                            out_en <= 1'b1;
                        end
                        default: begin
                            bps_cnt <= 1'b0;
                            status <= IDLE;
                        end
                    endcase
                end else begin
                    cnt <= cnt + 1;
                    bps_cnt <= bps_cnt;
                    status <= RECEIVING;
                end
            end
        end
    end

endmodule
