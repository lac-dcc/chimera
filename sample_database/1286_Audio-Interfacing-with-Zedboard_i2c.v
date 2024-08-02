// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module i2c (
    input clk,
    input i2c_sda_i,
    output reg i2c_sda_o,
    output reg i2c_sda_t,
    output i2c_scl,
    input [1:0] sw,
    output [1:0] active
);

    wire [9:0] inst_address;
    wire [8:0] inst_data;
    wire [15:0] sw_full;
    wire [15:0] active_full;

    adau1761_configuration_data Inst_adau1761_configuration_data (
        .clk(clk),
        .address(inst_address),
        .data(inst_data)
    );

    i3c2 #(
        .clk_divide("01111000") // 120 (48,000/120 = 400kHz I2C clock)
    ) Inst_i3c2 (
        .clk(clk),
        .inst_address(inst_address),
        .inst_data(inst_data),
        .i2c_scl(i2c_scl),
        .i2c_sda_i(i2c_sda_i),
        .i2c_sda_o(i2c_sda_o),
        .i2c_sda_t(i2c_sda_t),
        .inputs(sw_full),
        .outputs(active_full),
        .reg_addr(), // You may need to remove these lines, check once for errors
        .reg_data(),
        .reg_write(),
        .debug_scl(),
        .debug_sda(),
        .error()
    );

    assign sw_full = {sw[1:0], 14'b0};
    assign active = active_full[1:0];

endmodule
