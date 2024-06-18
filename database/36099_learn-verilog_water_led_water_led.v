// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// system clock: 50 MHz = 20 ns

// 0.5 s = 500 ms = 500_000 us = 500_000_000 ns

// counter = [0 ~ 25_000_000)

module water_led
#(
    parameter CNT_0 = 25'd0,
    parameter CNT_MAX = 25'd25_000_000 - 1
)
(
    input clk,
    input rst,
    output [3:0] out
);
    reg [24:0] cnt;
    reg move_flag;
    reg [3:0] out_reg;

    always @ (posedge clk or negedge rst) begin
        if (rst == 1'b0)
            cnt <= CNT_0;
        else
            if (cnt == CNT_MAX)
                cnt <= CNT_0;
            else
                cnt <= cnt + 1;
    end

    always @ (posedge clk or negedge rst) begin
        if (rst == 1'b0)
            out_reg <= 4'b1000;
        else
            if (move_flag == 1'b1)
                if (out_reg == 4'b0001)
                    out_reg <= 4'b1000;
                else
                    out_reg <= out_reg >> 1;
    end

    assign out = ~out_reg;

endmodule
