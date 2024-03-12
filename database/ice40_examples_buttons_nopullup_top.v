/* Top level module for button demo without debouncing and with no
   pull-up resistor (not a good way of doing things!)
   */
module top (
    // input hardware clock (12 MHz)
    hwclk, 
    // LED
    led1,
    // Keypad lines
    keypad_r1,
    keypad_c1,
    );

    /* Clock input */
    input hwclk;

    /* LED outputs */
    output led1;

    /* Numpad I/O */
    output keypad_r1=0;
    input keypad_c1;

    // Note: Left as is, keypad_c1 is a floating value, meaning
    // it has an undetermined voltage. It will trigger edges when
    // we don't want it to.

    /* LED register */
    reg ledval = 1'b0;

    /* LED Wiring */
    assign led1=ledval;
    
    /* Toggle LED when button [1] pressed */
    always @ (negedge keypad_c1) begin
        ledval = ~ledval;
    end


endmodule