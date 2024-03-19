/*
my_hdmi_device 

Copyright (C) 2021  Hirosh Dabui <hirosh@dabui.de>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/
module hdmi_device(
    input wire I_rgb_clk,
    input wire I_serial_clk, /* 5 times faster of I_rgb_clk */
    input wire I_rst_n,

    input wire [7:0] I_rgb_r,
    input wire [7:0] I_rgb_g,
    input wire [7:0] I_rgb_b,

    input wire I_rgb_de,
    input wire I_rgb_vs,
    input wire I_rgb_hs,

    output wire        O_tmds_clk_p,
    output wire        O_tmds_clk_n,
    output wire [2:0]  O_tmds_data_p,
    output wire [2:0]  O_tmds_data_n

);


localparam OUT_TMDS_MSB = 1;


   reg  [7:0] rgb_r;
   reg  [7:0] rgb_g;
   reg  [7:0] rgb_b;

   reg  rgb_de;
   reg  rgb_vs;
   reg  rgb_hs;

always @ (posedge I_rgb_clk) begin
    rgb_r <= I_rgb_r;
    rgb_g <= I_rgb_g;
    rgb_b <= I_rgb_b;

    rgb_de <= I_rgb_de;
    rgb_vs <= I_rgb_vs;
    rgb_hs <= I_rgb_hs;

end


wire [2:0] out_tmds_data;
wire out_tmds_clk;
wire [9:0] tmds_red;
wire [9:0] tmds_green;
wire [9:0] tmds_blue;
tmds_encoder tmsds_encoder_i0(I_rgb_clk, rgb_de, rgb_r,  1'b0,     1'b0,     tmds_red);
tmds_encoder tmsds_encoder_i1(I_rgb_clk, rgb_de, rgb_g,  1'b0,     1'b0,     tmds_green);
tmds_encoder tmsds_encoder_i2(I_rgb_clk, rgb_de, rgb_b,  rgb_vs, rgb_hs, tmds_blue);

wire [9:0] tmds_clk = 10'b00000_11111;

OSER10 #(
    .GSREN("false"),
    .LSREN("true")
) oser10_i [3:0] (
    .Q({out_tmds_clk, out_tmds_data}),
    .D0({tmds_clk[0], tmds_red[0], tmds_green[0], tmds_blue[0]}),
    .D1({tmds_clk[1], tmds_red[1], tmds_green[1], tmds_blue[1]}),
    .D2({tmds_clk[2], tmds_red[2], tmds_green[2], tmds_blue[2]}),
    .D3({tmds_clk[3], tmds_red[3], tmds_green[3], tmds_blue[3]}),
    .D4({tmds_clk[4], tmds_red[4], tmds_green[4], tmds_blue[4]}),
    .D5({tmds_clk[5], tmds_red[5], tmds_green[5], tmds_blue[5]}),
    .D6({tmds_clk[6], tmds_red[6], tmds_green[6], tmds_blue[6]}),
    .D7({tmds_clk[7], tmds_red[7], tmds_green[7], tmds_blue[7]}),
    .D8({tmds_clk[8], tmds_red[8], tmds_green[8], tmds_blue[8]}),
    .D9({tmds_clk[9], tmds_red[9], tmds_green[9], tmds_blue[9]}),
    .PCLK(I_rgb_clk),
    .FCLK(I_serial_clk),
    .RESET(~I_rst_n)
);

TLVDS_OBUF tlvds_obuf_i[3:0] (
    .O({O_tmds_clk_p,O_tmds_data_p}),
    .OB({O_tmds_clk_n,O_tmds_data_n}),
    .I({out_tmds_clk, out_tmds_data})
);


endmodule
