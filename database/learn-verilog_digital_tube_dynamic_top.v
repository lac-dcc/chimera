// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// display dynamic words

module top
(
    input clk,
    input rst_n,
    output shcp,
    output stcp,
    output ds,
    output oe
);
    localparam
        C = 8'b01100011,
        E = 8'b01100001,
        F = 8'b01110001,
        H = 8'b10010001,
        L = 8'b11100011,
        O = 8'b00000011,
        P = 8'b00110001,
        U = 8'b10000011,
        X = 8'b11111111;

    reg [47:0] data;

    reg [25:0] cnt26; // 0 ~ 67108863

    wire [7:0] seg;
    wire [5:0] sel;

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

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            cnt26 <= 26'b0;
        end else begin
            cnt26 <= cnt26 + 26'b1;
            // 每隔约1秒更新数据:
            if (cnt26[25] == 1'b1)
                data <= { H, E, L, L, O, X };
            else
                data <= { X, H, E, L, L, O };
        end
    end

endmodule
