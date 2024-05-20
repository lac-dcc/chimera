// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module adau1761_izedboard (
    input wire clk_48,
    output  AC_ADR0,
    output  AC_ADR1,
    output  AC_GPIO0,  // I2S MISO
    input wire AC_GPIO1,  // I2S MOSI
    input wire AC_GPIO2,  // I2S BCLK
    input wire AC_GPIO3,  // I2S LRCLK
    output  AC_MCLK,
    output  AC_SCK,
    inout wire AC_SDA,
    input wire [23:0] hphone_l,
    input wire [23:0] hphone_r,
    output reg [23:0] line_in_l,
    output reg [23:0] line_in_r,
    output reg new_sample,
    input wire [1:0] sw,
    output reg [1:0] active
);

wire audio_l [15:0];
wire audio_r [15:0];
wire codec_master_clk;


wire i2c_scl;
wire i2c_sda_i, i2c_sda_o, i2c_sda_t;
wire i2s_bclk, i2s_lr;
wire i2s_MOSI, i2s_MISO;

// Connection assignments
assign AC_GPIO0 = i2s_MISO;
assign i2s_MOSI = AC_GPIO1;
assign i2s_bclk = AC_GPIO2;
assign i2s_lr = AC_GPIO3;
assign AC_MCLK = codec_master_clk;
assign AC_SCK = i2c_scl;
assign AC_ADR0 = 1'b1;
assign AC_ADR1 = 1'b1;

// IOBUF for bidirectional SDA. I'm not sure if this works?
assign AC_SDA = i2c_sda_t ? 1'bz : i2c_sda_o;
assign i2c_sda_i = AC_SDA;

// Instantiate components
i2c Inst_i2c (
    .clk(clk_48),
    .i2c_sda_i(i2c_sda_i),
    .i2c_sda_o(i2c_sda_o),
    .i2c_sda_t(i2c_sda_t),
    .i2c_scl(i2c_scl),
    .sw(sw),
    .active(active)
);

ADAU1761_interface i_ADAU1761_interface (
    .clk_48(clk_48),
    .codec_master_clk(codec_master_clk)
);

i2s_data_interface Inst_i2s_data_interface (
    .clk(clk_48),
    .audio_l_out(line_in_l),
    .audio_r_out(line_in_r),
    .audio_l_in(hphone_l),
    .audio_r_in(hphone_r),
    .new_sample(new_sample),
    .i2s_bclk(i2s_bclk),
    .i2s_d_out(i2s_MISO),
    .i2s_d_in(i2s_MOSI),
    .i2s_lr(i2s_lr)
);

endmodule
