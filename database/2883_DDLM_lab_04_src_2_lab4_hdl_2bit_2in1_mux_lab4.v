// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b2_mux_2_1_comb_incorrect
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output [1:0] y
);

    assign y = (sel & d1) | ((~sel) & d0);

endmodule

module b2_mux_2_1_comb_correct1
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output [1:0] y
);

    assign y[0] = (sel & d1[0]) | ((~sel) & d0[0]);
    assign y[1] = (sel & d1[1]) | ((~sel) & d0[1]);
    
endmodule

module b2_mux_2_1_comb_correct2
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output [1:0] y
);

    wire [1:0] select;
    assign select = {2{sel}};
    assign y = (select & d1) | (~select & d0);
    
endmodule

module b2_mux_2_1_sel
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output [1:0] y
);

    assign y = sel ? d1 : d0;

endmodule

module b2_mux_2_1_if
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output reg [1:0] y
);
    always@(*)
    begin
        if(sel)
            y = d1;
        else 
            y = d0;
    end

endmodule

module b2_mux_2_1_case
(
    input  [1:0] d0,
    input  [1:0] d1,
    input        sel,
    output reg [1:0] y
);
    always@(*)
    begin
        case (sel)
            0: y = d0;
            1: y = d1;
        endcase
    end

endmodule


module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    b2_mux_2_1_sel b2_mux_2_1_sel(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[1:0]));
    b2_mux_2_1_if b2_mux_2_1_if(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[3:2]));
    b2_mux_2_1_comb_correct1 b2_mux_2_1_comb_correct1(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[5:4]));
    b2_mux_2_1_comb_correct2 b2_mux_2_1_comb_correct2(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[7:6]));
    b2_mux_2_1_comb_incorrect b2_mux_2_1_comb_incorrect(.d0(SW[1:0]),.d1(SW[3:2]),.sel(KEY[0]),.y(LEDR[9:8]));
    
endmodule