// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module loopback_test (
    input wire clk_100,
    output wire AC_ADR0,
    output wire AC_ADR1,
    output wire AC_SCK,
    inout wire AC_SDA,
    output wire AC_GPIO0,
    input wire AC_GPIO1,
    input wire AC_GPIO2,
    input wire AC_GPIO3
);

    reg [5:0] counter;
    reg [23:0] hphone_l, hphone_r;
    reg hphone_valid;
    wire new_sample;
    wire sample_clk_48k;
    wire [23:0] line_in_l, line_in_r;

    audio_top i_audio (
        .clk_100(clk_100),
        .AC_ADR0(AC_ADR0),
        .AC_ADR1(AC_ADR1),
        .AC_GPIO0(AC_GPIO0),
        .AC_GPIO1(AC_GPIO1),
        .AC_GPIO2(AC_GPIO2),
        .AC_GPIO3(AC_GPIO3),
        .AC_MCLK(),
        .AC_SCK(AC_SCK),
        .AC_SDA(AC_SDA),
        .hphone_l(hphone_l),
        .hphone_l_valid(hphone_valid),
        .hphone_r(hphone_r),
        .hphone_r_valid_dummy(hphone_valid),
        .line_in_l(line_in_l),
        .line_in_r(line_in_r),
        .new_sample(new_sample),
        .sample_clk_48k(sample_clk_48k)
    );

    always @(posedge clk_100) begin
        hphone_valid <= 1'b0;
        hphone_l <= 24'b0;
        hphone_r <= 24'b0;

        if (new_sample) begin
            counter <= counter + 1;
            hphone_valid <= 1'b1;
            hphone_l <= line_in_l;
            hphone_r <= line_in_r;
        end
    end

endmodule