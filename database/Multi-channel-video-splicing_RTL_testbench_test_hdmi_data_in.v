// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale 1ns/1ps
module test_hdmi_data_in(

);

reg         clk_hdmi_sync;
reg         hdmi_pix_clk_in;
reg         rst;

wire        vs_out;
wire        de_out;

parameter CLK1_PERIOD = 14;
parameter CLK2_PERIOD = 20;

hdmi_data_in u_hdmi_data_in(
    .clk_hdmi_sync      (clk_hdmi_sync),
    .hdmi_pix_clk_in    (hdmi_pix_clk_in),
    .rst                (rst),

    .vs_out             (vs_out),
    .de_out             (de_out)
);

// 初始化复位和时钟
initial begin
    hdmi_pix_clk_in <= 0;
    clk_hdmi_sync <= 0;
    rst <= 0;
    #1000;
    rst <= 1;
end

always #(CLK1_PERIOD/2) hdmi_pix_clk_in = ~hdmi_pix_clk_in;
always #(CLK2_PERIOD/2) clk_hdmi_sync = ~clk_hdmi_sync;

endmodule