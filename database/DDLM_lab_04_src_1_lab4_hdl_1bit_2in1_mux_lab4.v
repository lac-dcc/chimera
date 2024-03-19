module b1_mux_2_1_comb
(
    input  d0,
    input  d1,
    input  sel,
    output y
);

    assign y = (sel & d1) | ((~sel) & d0);

endmodule

module b1_mux_2_1_sel
(
    input  d0,
    input  d1,
    input  sel,
    output y
);

    assign y = sel ? d1 : d0;

endmodule

module b1_mux_2_1_if
(
    input  d0,
    input  d1,
    input  sel,
    output reg y
);
    always@(*)
    begin
        if(sel)
            y = d1;
        else 
            y = d0;
    end

endmodule

module b1_mux_2_1_case
(
    input  d0,
    input  d1,
    input  sel,
    output reg y
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

    b1_mux_2_1_comb b1_mux_2_1_comb  (SW[0], SW[1], KEY[0], LEDR[0]);
    b1_mux_2_1_sel b1_mux_2_1_sel    (SW[0], SW[1], KEY[0], LEDR[1]);
    b1_mux_2_1_if b1_mux_2_1_if      (SW[0], SW[1], KEY[0], LEDR[2]);
    b1_mux_2_1_case b1_mux_2_1_case  (SW[0], SW[1], KEY[0], LEDR[3]);

endmodule