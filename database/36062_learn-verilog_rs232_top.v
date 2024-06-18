// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// receive and send data
// Baud = 9600, 14400, 19200, 38400, 57600, 115200

module top (
    input clk,
    input rst_n,
    input in_data,
    output out_data,
    output in_led_n,
    output out_led_n
);

    wire [7:0] data;
    wire data_en;
    wire out_en;

    // 接收数据指示灯计数器，>0时点亮LED，=0时熄灭:
    reg [23:0] cnt_in;
    // 发送数据指示灯计数器，>0时点亮LED，=0时熄灭:
    reg [23:0] cnt_out;

    assign in_led_n = cnt_in > 0 ? 1'b0 : 1'b1;
    assign out_led_n = cnt_out > 0 ? 1'b0 : 1'b1;

    uart_rx rx_instance (
        .clk (clk),
        .rst_n (rst_n),
        .in_data (in_data),
        .out_data (data),
        .out_en (data_en)
    );

     uart_tx tx_instance (
        .clk (clk),
        .rst_n (rst_n),
        .in_data (data),
        .in_en (data_en),
        .out_data (out_data),
        .out_en (out_en)
     );

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            cnt_in <= 24'd0;
            cnt_out <= 24'd0;
        end else begin
            if (data_en == 1'b1)
                cnt_in <= 24'd1;
            else if (cnt_in > 0)
                cnt_in <= cnt_in + 1'b1;
            else
                cnt_in <= 24'd0;

            if (out_data == 1'b0)
                cnt_out <= 24'd1;
            else if (cnt_out > 0)
                cnt_out <= cnt_out + 1'b1;
            else
                cnt_out <= 24'd0;
        end
    end

endmodule
