module dff_with_en
(
    input       clk,
    input       en,
    input       d,
    output reg  q
);

    always @ (posedge clk)
        if (en)
            q <= d;
 
endmodule