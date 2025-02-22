// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

// Hybrid PWM / Sigma Delta converter
//
// Uses 5-bit PWM, wrapped within a 10-bit Sigma Delta, with the intention of
// increasing the pulse width, since narrower pulses seem to equate to more noise

module hybrid_pwm_sd
(
    input        clk,
    input        clk_ena,
    input        reset,
    input [15:0] pcm_in,
    output       dac_out
);

reg [4:0] pwmcounter;
reg [4:0] pwmthreshold;
reg [33:0] scaledin;
reg [15:0] sigma;
reg out;

assign dac_out=out;

always @(posedge clk, posedge reset) begin
    if(reset) begin
        sigma<=16'b00000100_00000000;
        pwmthreshold<=5'b10000;
    end else if(clk_ena) begin
        pwmcounter<=pwmcounter+1'b1;

        if(pwmcounter==pwmthreshold)
            out<=1'b0;

        if(pwmcounter==5'b11111) // Update threshold when pwmcounter reaches zero
        begin
            // Pick a new PWM threshold using a Sigma Delta
            scaledin<=33'd134217728 // (1<<(16-5))<<16, offset to keep centre aligned.
                +({1'b0,pcm_in}*61440); // 30<<(16-5)-1;
            sigma<=scaledin[31:16]+{4'b0,sigma[10:0]};  // Will use previous iteration's scaledin value
            pwmthreshold<=sigma[15:11]; // Will lag 2 cycles behind, but shouldn't matter.
            out<=1'b1;
        end
    end
end

endmodule
