// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// display word by FSM

module top (
    input clk,
    input rst_n,
    input key_in,
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
        S = 8'b01001001,
        U = 8'b10000011;

    wire key1;
    wire [1:0] state;

    reg [47:0] data;

    wire [7:0] seg;
    wire [5:0] sel;

    fsm fsm_inst (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key1),
        .out (state)
    );

    key_filter key_filter_inst (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in),
        .key_out (key1)
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

    digital_tube_data digital_tube_data_inst (
        .clk (clk),
        .rst_n (rst_n),
        .data (data),
        .seg (seg),
        .sel (sel)
    );

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            data <= { E, E, E, E, E, E };
        end else begin
            case (state)
                2'b00: data <= { C, H, O, O, S, E };
                2'b01: data <= { E, P, O, C, H, S };
                2'b10: data <= { P, U, L, S, E, S };
                2'b11: data <= { S, C, H, O, O, L };
            endcase
        end
    end

endmodule
