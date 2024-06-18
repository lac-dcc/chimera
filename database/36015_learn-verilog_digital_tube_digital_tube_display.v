// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/******************************************************************************

Digital Tube Display 数码管动态显示

位选信号 a ~ h: 0点亮

┌───────────────┐
│       a       │
├───┬───────┬───┤
│   │       │   │
│ f │       │ b │
│   │       │   │
├───┴───────┴───┤
│       g       │
├───┬───────┬───┤
│   │       │   │
│ e │       │ c │
│   │       │   │
├───┴───────┴───┤  ┌───┐
│       d       │  │ h │
└───────────────┘  └───┘

******************************************************************************/

module digital_tube_display
(
    input clk,
    input rst_n,
    input [7:0] seg, // 数码管位选信号
    input [5:0] sel, // 数码管段选信号
    output reg shcp, // 移位寄存器时钟
    output reg stcp, // 存储寄存器时钟
    output reg ds, // 串行数据输出至 74HC595 芯片
    output oe // 始能信号 =0 有效
);

    reg [1:0] cnt;
    reg [3:0] cnt_bit;

    wire [15:0] data;

    assign data = {seg[7:0], sel[5:0]};

    always @ (posedge clk) begin
        if (! rst_n) begin
            cnt <= 2'b0;
            cnt_bit <= 4'b0;
            ds <= 1'b0;
            shcp <= 1'b0;
            stcp <= 1'b0;
        end else begin
            cnt <= cnt + 2'h1;

            if (cnt == 2'h3) begin
                if (cnt_bit == 4'hd)
                    cnt_bit <= 4'h0;
                else
                    cnt_bit <= cnt_bit + 4'h1;
            end else
                cnt_bit <= cnt_bit;

            // output ds:
            if (cnt == 2'b0)
                ds <= data[cnt_bit];
            else
                ds <= ds;

            // output shcp:
            if (cnt == 2'h2)
                shcp <= 1'b1;
            else if (cnt == 2'h0)
                shcp <= 1'b0;
            else
                shcp <= shcp;

            // output stcp:
            if (cnt == 2'h0 && cnt_bit == 4'h0)
                stcp <= 1'b1;
            else if (cnt == 2'h2 && cnt_bit == 4'h0)
                stcp <= 1'b0;
            else
                stcp <= stcp;
        end
    end

    assign oe = 1'b0;

endmodule
