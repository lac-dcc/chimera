// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b2_mux_2_1_sel
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output [1:0] y
);

    assign y = sel ? d1 : d0;

endmodule

module b2_mux_4_1_sel
(
    input  [1:0] d0, d1, d2, d3,
    input  [1:0] sel,
    output [1:0] y
);

    assign y = sel [1] ? (sel [0] ? d3 : d2)
            : (sel [0] ? d1 : d0);

endmodule

//----------------------------------------------------------------------------

module b2_mux_4_1_case
(
    input      [1:0] d0, d1, d2, d3,
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        2'b11: y = d3;
        endcase

endmodule

module b2_mux_4_1_block
(
    input  [1:0] d0, d1, d2, d3,
    input  [1:0] sel,
    output [1:0] y
);

    wire [1:0] w01, w23;

    b2_mux_2_1_sel mux0(.d0(d0), .d1(d1), .sel(sel[0]), .y(w01));
    b2_mux_2_1_sel mux1(.d0(d2),.d1(d3), .sel(sel[0]), .y(w23));
    b2_mux_2_1_sel mux2(.d0(w01), .d1(w23), .sel(sel[1]), .y(y));

endmodule


module b1_mux_4_1_case
(
    input      d0, d1, d2, d3,
    input      [1:0] sel,
    output reg y
);

    always @(*)
        case (sel)
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        2'b11: y = d3;
        endcase

endmodule

module b2_mux_4_1_block_alt
(
    input  [1:0] d0, d1, d2, d3,
    input  [1:0] sel,
    output [1:0] y
);

    b1_mux_4_1_case hi(.d0(d0[1]), .d1(d1[1]), .d2(d2[1]), .d3(d3[1]), .sel(sel), .y(y[1]));
    b1_mux_4_1_case lo(.d0(d0[0]), .d1(d1[0]), .d2(d2[0]), .d3(d3[0]), .sel(sel), .y(y[0]));

endmodule

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    b2_mux_4_1_case b2_mux_4_1_case(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[1:0]));
    b2_mux_4_1_sel b2_mux_4_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[3:2]));
    b2_mux_4_1_block b2_mux_4_1_block(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[5:4]));
    b2_mux_4_1_block_alt b2_mux_4_1_block_alt(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.d3(SW[7:6]),.sel(KEY[1:0]),.y(LEDR[7:6]));
    
endmodule