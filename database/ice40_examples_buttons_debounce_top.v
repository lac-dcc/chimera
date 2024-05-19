// This program was cloned from: https://github.com/nesl/ice40_examples
// License: GNU General Public License v3.0

/* Top level module for button demo WITH debouncing
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

    /* Debouncing timer and period = 10 ms */
    reg [31:0] debounce_timer = 32'b0;
    parameter DEBOUNCE_PERIOD = 32'd120000;
    reg debouncing = 1'b0;

    /* LED Wiring */
    assign led1=ledval;

    /* Our high speed clock will deal with debounce timing */
    always @ (posedge hwclk) begin
        // check for button presses
        if (~debouncing && ~keypad_c1_din) begin
            ledval <= ~ledval;
            debouncing <= 1;
        // reset debouncing if button is held low
        end else if (debouncing && ~keypad_c1_din) begin
            debounce_timer <= 32'b0;
        // or if it's high, increment debounce timer
        end else if (debouncing && debounce_timer < DEBOUNCE_PERIOD) begin
            debounce_timer <= debounce_timer + 1;
        // finally, if it's high and timer expired, debouncing done!
        end else if (debouncing) begin
            debounce_timer <= 32'b0;
            debouncing <= 1'b0;
        end
    end


endmodule