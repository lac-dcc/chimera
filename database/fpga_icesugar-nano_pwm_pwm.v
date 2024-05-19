// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input       CLK,
    output      LED
);

    reg [21:0] counter;
    reg [7:0]  pwm;
    reg [7:0]  duty;
    reg        dir;

    always @(posedge CLK) begin
        // Increment counters
        pwm <= pwm + 1;
        counter <= counter + 1;

        // Ramp up/down breathing effect using the top 8-bits of `counter`
        duty <= dir ? counter >> 14 : 255 - counter >> 14;

        // Invert ramp direction on counter reset
        if (counter == 0) dir = ~dir;
    end
    
    // Enable LED if PWM counter is less than the duty cycle value
    assign LED = duty > pwm;

endmodule
