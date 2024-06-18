// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

// PWM audio for NES260
// Feng Zhou, 2022-7
//
// Module is IceSugar PMOD_audio 1.2 (IC: PAM8403)
// Schematic: https://github.com/wuxx/icesugar/tree/master/schematic
// Example: https://github.com/wuxx/icesugar/tree/master/src/basic/verilog/music

module pmod_audio (
	input clk,     // 21.477 Mhz
	input [15:0] sample,       // sampling rate is 21477 / 512 = 42 Khz  
	output [7:0] output_pmod
//    input wire clk,     // 14 Mhz
);

reg [8:0] counter = 0;
reg [15:0] audio_latched = 0;
reg aud_pwm;

assign output_pmod[0] = aud_pwm;
assign output_pmod[1] = aud_pwm;

always @(posedge clk) begin
    if (counter == 0)
        audio_latched <= sample;
    if (counter < 1 || ({counter,7'b0} < audio_latched && counter < 511) )
        aud_pwm <= 1;
    else
        aud_pwm <= 0;
    counter <= counter + 1;
end

endmodule