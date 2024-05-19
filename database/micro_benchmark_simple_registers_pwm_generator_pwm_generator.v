// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

module pwm_generator(clk, reset, pwm);
    input clk, reset;
    output reg pwm;

    // Clock divider parameters

    reg [31:0] counter;

    // PWM parameters
    parameter PERIOD = 100;
    parameter DUTY_CYCLE = 80;
    // Logic to generate PWM signal
     always @(posedge clk or posedge reset) begin
         if (reset) begin
             pwm <= 1'b0;
         end else if (counter == 0) begin
             pwm <= 1'b1;
         end else if (counter == (PERIOD * DUTY_CYCLE / 100)) begin
             pwm <= 1'b0;
         end
     end

    // Clock divider
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
        end else if (counter == PERIOD -1) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end



endmodule
