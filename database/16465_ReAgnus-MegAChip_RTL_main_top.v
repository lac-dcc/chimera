// This program was cloned from: https://github.com/jbilander/ReAgnus-MegAChip
// License: Creative Commons Attribution Share Alike 4.0 International

`timescale 1ns / 1ps

module main_top(
    input C28M,
    output C14M,
    output C7M,
    output reg CDAC = 1'b1,
    output reg CCK = 1'b1,
    output reg CCKQ
);

Gowin_CLKDIV2 clkdiv2_gen_C14M(
    .clkout(C14M), //output clkout
    .hclkin(C28M), //input hclkin
    .resetn(1'b1) //input resetn
);

Gowin_CLKDIV4 clkdiv4_gen_C7M(
    .clkout(C7M), //output clkout
    .hclkin(C28M), //input hclkin
    .resetn(1'b1) //input resetn
);

always @ (negedge C14M) begin
    CDAC <= ~CDAC;
end

always @ (negedge C7M) begin
    CCK <= ~CCK;
end

always @ (posedge C7M) begin
    CCKQ <= ~CCKQ;
end

endmodule
