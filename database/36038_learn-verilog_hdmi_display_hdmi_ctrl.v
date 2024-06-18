// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0


module hdmi_ctrl
(
    input clk_1x,
    input clk_5x,
    input rst_n,

    input [7:0] rgb_r,
    input [7:0] rgb_g,
    input [7:0] rgb_b,

    input hsync,
    input vsync,
    input de,

    output hdmi_clk_p,
    output hdmi_clk_n,
    output hdmi_r_p,
    output hdmi_r_n,
    output hdmi_g_p,
    output hdmi_g_n,
    output hdmi_b_p,
    output hdmi_b_n
);

    wire [9:0] tmds_r;
    wire [9:0] tmds_g;
    wire [9:0] tmds_b;

    encode encode_r (
        .clk (clk_1x),
        .rst_n (rst_n),
        .c0 (hsync),
        .c1 (vsync),
        .de (de),
        .data_in (rgb_r),
        .data_out (tmds_r)
    );

    encode encode_g (
        .clk (clk_1x),
        .rst_n (rst_n),
        .c0 (hsync),
        .c1 (vsync),
        .de (de),
        .data_in (rgb_g),
        .data_out (tmds_g)
    );

    encode encode_b (
        .clk (clk_1x),
        .rst_n (rst_n),
        .c0 (hsync),
        .c1 (vsync),
        .de (de),
        .data_in (rgb_b),
        .data_out (tmds_b)
    );

    par_to_ser par_to_ser_r (
        .clk_5x (clk_5x),
        .par_data (tmds_r),
        .ser_data_p (hdmi_r_p),
        .ser_data_n (hdmi_r_n)
    );

    par_to_ser par_to_ser_g (
        .clk_5x (clk_5x),
        .par_data (tmds_g),
        .ser_data_p (hdmi_g_p),
        .ser_data_n (hdmi_g_n)
    );

    par_to_ser par_to_ser_b (
        .clk_5x (clk_5x),
        .par_data (tmds_b),
        .ser_data_p (hdmi_b_p),
        .ser_data_n (hdmi_b_n)
    );

    par_to_ser par_to_ser_clk (
        .clk_5x (clk_5x),
        .par_data (10'b1111100000),
        .ser_data_p (hdmi_clk_p),
        .ser_data_n (hdmi_clk_n)
    );

endmodule
