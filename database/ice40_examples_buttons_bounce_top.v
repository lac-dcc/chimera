// This program was cloned from: https://github.com/nesl/ice40_examples
// License: GNU General Public License v3.0

/* Top level module for button demo without debouncing
   (not a good way of doing things!)
   This uses button 1 of the keypad when installed correctly.
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

    /* LED register */
    reg ledval = 1'b0;

    /* Numpad pull-up settings for columns:
       PIN_TYPE: <output_type=0>_<input=1>
       PULLUP: <enable=1>
       PACKAGE_PIN: <user pad name>
       D_IN_0: <internal pin wire (data in)>
    */
    wire keypad_c1_din;
    SB_IO #(
        .PIN_TYPE(6'b0000_01),
        .PULLUP(1'b1)
    ) keypad_c1_config (
        .PACKAGE_PIN(keypad_c1),
        .D_IN_0(keypad_c1_din)
    );

    /* LED Wiring */
    assign led1=ledval;
    
    /* Toggle LED when button [1] pressed */
    always @ (negedge keypad_c1_din) begin
        ledval = ~ledval;
    end


endmodule