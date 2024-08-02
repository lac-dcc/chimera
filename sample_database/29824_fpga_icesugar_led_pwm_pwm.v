// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input       CLK,
    output      LED_R,
    output      LED_G,
    output      LED_B
);

    reg [23:0] counter;

    reg [7:0] r_pwm;
    reg [7:0] g_pwm;
    reg [7:0] b_pwm;

    reg [7:0] r_duty;
    reg [7:0] g_duty;
    reg [7:0] b_duty;

    reg r_dir;
    reg g_dir;
    reg b_dir;

    initial begin
        r_dir = 1;
        g_dir = 1;
        b_dir = 0;
    end

    always @(posedge CLK) begin
        r_pwm <= r_pwm + 1;
        g_pwm <= g_pwm + 1;
        b_pwm <= b_pwm + 1;

        counter <= counter + 1;

        r_duty <= 255;
        g_duty <= g_dir ? counter >> 16 : 255 - counter >> 16;
        b_duty <= b_dir ? counter >> 16 : 255 - counter >> 16;

        if (counter == 0) begin
            r_dir = ~r_dir;
            g_dir = ~g_dir;
            b_dir = ~b_dir;
        end
    end
    
    assign LED_R = r_duty < r_pwm;
    assign LED_G = g_duty < g_pwm;
    assign LED_B = b_duty < b_pwm;

endmodule
