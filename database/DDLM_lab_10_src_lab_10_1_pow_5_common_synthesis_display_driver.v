module display_driver
(
    input        en,
    input  [3:0] dig,
    input        dot,
    output [7:0] _gfedcba
);

    // . g f e d c b a   // Letter from the diagram below
    // 7 6 5 4 3 2 1 0   // Bit in _gfedcba

    //   --a--
    //  |     |
    //  f     b
    //  |     |
    //   --g--
    //  |     |
    //  e     c
    //  |     |
    //   --d-- 

    reg [6:0] gfedcba;

    always @*
        if (! en)
            gfedcba = 7'b1111111;
        else
            case (dig)
            4'h0: gfedcba = 7'b1000000;
            4'h1: gfedcba = 7'b1111001;
            4'h2: gfedcba = 7'b0100100;
            4'h3: gfedcba = 7'b0110000;
            4'h4: gfedcba = 7'b0011001;
            4'h5: gfedcba = 7'b0010010;
            4'h6: gfedcba = 7'b0000010;
            4'h7: gfedcba = 7'b1111000;
            4'h8: gfedcba = 7'b0000000;
            4'h9: gfedcba = 7'b0010000;
            4'ha: gfedcba = 7'b0001000;
            4'hb: gfedcba = 7'b0000011;
            4'hc: gfedcba = 7'b1000110;
            4'hd: gfedcba = 7'b0100001;
            4'he: gfedcba = 7'b0000110;
            4'hf: gfedcba = 7'b0001110;
            endcase

    assign _gfedcba = { ~ dot, gfedcba };

endmodule
