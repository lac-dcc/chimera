// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input       CLK,
    output      LED_R,
    output      LED_G,
    output      LED_B
);

    reg [23:0] counter;

    initial begin
        LED_R <= 1;
        LED_G <= 0;
        LED_B <= 1;
    end

    // Increment counter on rising edge of clock
    always @(posedge CLK) begin
        counter <= counter + 1;

        if (counter == 12000000) begin
            counter <= 0;
            LED_R <= ~ LED_R;
            LED_G <= ~ LED_G;
        end
    end

endmodule
