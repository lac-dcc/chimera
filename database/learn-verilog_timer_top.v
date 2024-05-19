// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// timer

module top (
    input wire clk,
    input wire rst_n,
    output wire shcp,
    output wire stcp,
    output wire ds,
    output wire oe
);
    wire [47:0] data;
    wire [7:0] seg;
    wire [5:0] sel;
    wire [23:0] cnt;

    counter #(10000) counter_inst(
        .clk (clk),
        .rst_n (rst_n),
        .cnt (cnt)
    );

    convert convert_0(
        .in (cnt[3:0]),
        .out (data[7:0])
    );

    convert convert_1(
        .in (cnt[7:4]),
        .out (data[15:8])
    );

    convert convert_2(
        .in (cnt[11:8]),
        .out (data[23:16])
    );

    convert convert_3(
        .in (cnt[15:12]),
        .out (data[31:24])
    );

    convert convert_4(
        .in (cnt[19:16]),
        .out (data[39:32])
    );

    convert convert_5(
        .in (cnt[23:20]),
        .out (data[47:40])
    );

    digital_tube_data digital_tube_data_inst (
        .clk (clk),
        .rst_n (rst_n),
        .data (data),
        .seg (seg),
        .sel (sel)
    );

    digital_tube_display digital_tube_display_inst (
        .clk (clk),
        .rst_n (rst_n),
        .seg (seg),
        .sel (sel),
        .shcp (shcp),
        .stcp (stcp),
        .ds (ds),
        .oe (oe)
    );

endmodule
