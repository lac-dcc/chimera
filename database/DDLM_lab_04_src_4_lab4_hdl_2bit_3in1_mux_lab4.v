// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b2_mux_3_1_case_latch
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        endcase

endmodule

module b2_mux_3_1_case_correct
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
        2'b00: y = d0;
        2'b01: y = d1;
        default: y = d2;
        endcase

endmodule

module b2_mux_3_1_casex_correct
(
    input      [1:0] d0, d1, d2, 
    input      [1:0] sel,
    output reg [1:0] y
);

    always @(*)
        case (sel)
        2'b00: y = d0;
        2'b01: y = d1;
        2'b10: y = d2;
        default: y=2'bxx;
        endcase

endmodule

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    b2_mux_3_1_case_latch b2_mux_3_1_case_latch(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[1:0]));
    b2_mux_3_1_case_correct b2_mux_3_1_case_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[3:2]));
    b2_mux_3_1_casex_correct b2_mux_3_1_casex_correct(.d0(SW[1:0]),.d1(SW[3:2]),.d2(SW[5:4]),.sel(KEY[1:0]),.y(LEDR[5:4]));
    
endmodule