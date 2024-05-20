// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module i2s_data_interface (
    input clk,
    input [23:0] audio_l_in,
    input [23:0] audio_r_in,
    output reg [23:0] audio_l_out,
    output reg [23:0] audio_r_out,
    output reg new_sample,
    input i2s_bclk,
    output reg i2s_d_out,
    input i2s_d_in,
    input i2s_lr
);

    reg [5:0] bit_counter = 6'b0;
    reg [9:0] bclk_delay = 10'b0;
    reg [9:0] lr_delay = 10'b0;
    reg [126:0] sr_in = 127'b0;
    reg [63:0] sr_out = 64'b0;
    reg i2s_lr_last = 1'b0;
    reg i2s_d_in_last = 1'b0;

    always @(posedge clk) begin
        // Process to predict when the falling edge of i2s_bclk should be
        new_sample <= 1'b0;

        // Is there a rising edge 2 cycles ago? if so, the data bit is valid
        // And we can capture the bit
        if (bclk_delay[8:7] == 2'b10) begin
            sr_in <= {sr_in[125:0], i2s_d_in_last};
        end

        // Was there a rising edge on BCLK 9 cycles ago? 
        // If so, this shd be about the falling edge so the outut can change

        if (bclk_delay[1:0] == 2'b10) begin
            i2s_d_out <= sr_out[63];

            // If we are starting a new frame, then load samples into shift register
            if (i2s_lr == 1'b1 && i2s_lr_last == 1'b0) begin
                audio_l_out <= sr_in[126:103];
                audio_r_out <= sr_in[94:71];
                sr_out <= {audio_l_in, 8'b0, audio_r_in, 8'b0};
                new_sample <= 1'b1;
            end else begin
                sr_out <= {sr_out[62:0], 1'b0};
            end
            i2s_lr_last <= i2s_lr;
        end
        bclk_delay <= {i2s_bclk, bclk_delay[9:1]};
        i2s_d_in_last <= i2s_d_in;
    end
endmodule
