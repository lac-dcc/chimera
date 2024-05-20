// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// Beep buzzer if input is HIGH.
// author:yukinagata3184

module gpio_ctrl(
    input state,
    output reg GPIO0_D
);

always @* begin
    if(state)
        GPIO0_D <= 1'b1;
    else
        GPIO0_D <= 1'b0;
end

endmodule