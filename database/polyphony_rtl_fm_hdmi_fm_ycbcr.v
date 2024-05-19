// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

module fm_ycbcr(
    clk_v,
    rst_x,
    i_r,
    i_g,
    i_b,
    o_y,
    o_cb,
    o_cr
);

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_v;     // 27MHz
    input          rst_x;
    input  [7:0]   i_r;
    input  [7:0]   i_g;
    input  [7:0]   i_b;
    output [7:0]   o_y;
    output [7:0]   o_cb;
    output [7:0]   o_cr;


//////////////////////////////////
// module instantiation
//////////////////////////////////
 csc_top csc_top (
    .Clock(clk_v),
    .ClockEnable(1'b1),
    .Reset(~rst_x),
    .Red(i_r),
    .Green(i_g),
    .Blue(i_b),
    .Y(o_y),
    .Cb(o_cb),
    .Cr(o_cr)
);

endmodule
