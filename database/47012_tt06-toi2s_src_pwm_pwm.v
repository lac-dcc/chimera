// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

module pwm(
    input clock_in,         // Input clock on FPGA
    input reset,            // Reset signal
    input [7:0] duty_cycle, // Duty cycle of the output clock
    output pwm_out          // pwm_output signal  
);
// Divide clok by 256
// and apply duty cycle to the output 
// tangnano has 27 MHz input clock 
// so 27 MHz / 256 = 105.46875 kHz
   
 
reg [7:0] counter;

reg pwm_r;

always @(posedge clock_in) begin
    if (reset) begin
        counter <= 0;
        pwm_r     <= 0;
    end else begin
        if (counter < 255) begin
            counter <= counter + 1;
            pwm_r <= !(counter < duty_cycle);
        end else begin
            counter <= 0;
            pwm_r <= 0;
        end
    end
end

assign pwm_out = !pwm_r;

endmodule
