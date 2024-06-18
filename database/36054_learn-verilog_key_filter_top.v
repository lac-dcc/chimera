// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// 按键消抖测试
// key0 无消抖, key1 ~ key3 带消抖, 计数循环 0 ~ 9

module top (
    input clk,
    input rst_n,
    input key_in3,
    input key_in2,
    input key_in1,
    input key_in0,
    output shcp,
    output stcp,
    output ds,
    output oe
);

    localparam
        N0 = 8'b00000011,
        N1 = 8'b10011111,
        N2 = 8'b00100101,
        N3 = 8'b00001101,
        N4 = 8'b10011001,
        N5 = 8'b01001001,
        N6 = 8'b01000001,
        N7 = 8'b00011111,
        N8 = 8'b00000001,
        N9 = 8'b00001001,
        E = 8'b01100001;

    wire key3;
    wire key2;
    wire key1;
    wire key0;

    reg [3:0] cnt3;
    reg [3:0] cnt2;
    reg [3:0] cnt1;
    reg [3:0] cnt0;

    reg [47:0] data;

    wire [7:0] seg;
    wire [5:0] sel;

    key_filter key_filter_3 (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in3),
        .key_out (key3)
    );

    key_filter key_filter_2 (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in2),
        .key_out (key2)
    );

    key_filter key_filter_1 (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in1),
        .key_out (key1)
    );

    // not using key_filter for key 0:
    assign key0 = key_in0;

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

    digital_tube_data digital_tube_data_inst (
        .clk (clk),
        .rst_n (rst_n),
        .data (data),
        .seg (seg),
        .sel (sel)
    );

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            cnt3 <= 4'd0;
            cnt2 <= 4'd0;
            cnt1 <= 4'd0;
            cnt0 <= 4'd0;
        end else begin
            cnt3 <= key3 == 1'b0 ? (cnt3 == 4'd9 ? 4'd0 : cnt3 + 1'b1) : cnt3;
            cnt2 <= key2 == 1'b0 ? (cnt2 == 4'd9 ? 4'd0 : cnt2 + 1'b1) : cnt2;
            cnt1 <= key1 == 1'b0 ? (cnt1 == 4'd9 ? 4'd0 : cnt1 + 1'b1) : cnt1;
            cnt0 <= key0 == 1'b0 ? (cnt0 == 4'd9 ? 4'd0 : cnt0 + 1'b1) : cnt0;
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0)
            data <= { E, E, E, E, E, E };
        else begin
            case (cnt0)
                4'd0: data[7:0] <= N0;
                4'd1: data[7:0] <= N1;
                4'd2: data[7:0] <= N2;
                4'd3: data[7:0] <= N3;
                4'd4: data[7:0] <= N4;
                4'd5: data[7:0] <= N5;
                4'd6: data[7:0] <= N6;
                4'd7: data[7:0] <= N7;
                4'd8: data[7:0] <= N8;
                4'd9: data[7:0] <= N9;
                default: data[7:0] <= E;
            endcase
            case (cnt1)
                4'd0: data[15:8] <= N0;
                4'd1: data[15:8] <= N1;
                4'd2: data[15:8] <= N2;
                4'd3: data[15:8] <= N3;
                4'd4: data[15:8] <= N4;
                4'd5: data[15:8] <= N5;
                4'd6: data[15:8] <= N6;
                4'd7: data[15:8] <= N7;
                4'd8: data[15:8] <= N8;
                4'd9: data[15:8] <= N9;
                default: data[15:8] <= E;
            endcase
            case (cnt2)
                4'd0: data[23:16] <= N0;
                4'd1: data[23:16] <= N1;
                4'd2: data[23:16] <= N2;
                4'd3: data[23:16] <= N3;
                4'd4: data[23:16] <= N4;
                4'd5: data[23:16] <= N5;
                4'd6: data[23:16] <= N6;
                4'd7: data[23:16] <= N7;
                4'd8: data[23:16] <= N8;
                4'd9: data[23:16] <= N9;
                default: data[23:16] <= E;
            endcase
            case (cnt3)
                4'd0: data[31:24] <= N0;
                4'd1: data[31:24] <= N1;
                4'd2: data[31:24] <= N2;
                4'd3: data[31:24] <= N3;
                4'd4: data[31:24] <= N4;
                4'd5: data[31:24] <= N5;
                4'd6: data[31:24] <= N6;
                4'd7: data[31:24] <= N7;
                4'd8: data[31:24] <= N8;
                4'd9: data[31:24] <= N9;
                default: data[31:24] <= E;
            endcase
            data[47:32] <= { E, E };
        end
    end

endmodule
