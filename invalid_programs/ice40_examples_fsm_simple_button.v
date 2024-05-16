/* Simple button module */
module button (
    // input clock
    clk,
    // I/O pins
    pin_in,
    press,
    );

    input clk;
    input pin_in;
    output press;

    /* Pull-up settings for input:
       PIN_TYPE: <output_type=0>_<input=1>
       PULLUP: <enable=1>
       PACKAGE_PIN: <user pad name>
       D_IN_0: <internal pin wire (data in)>
    */
    wire pin_din;
    SB_IO #(
        .PIN_TYPE(6'b0000_01),
        .PULLUP(1'b1)
    ) pin_in_config (
        .PACKAGE_PIN(pin_in),
        .D_IN_0(pin_din)
    );

    /* Debouncing timer and period = 10 ms */
    reg [31:0] debounce_timer = 32'b0;
    parameter DEBOUNCE_PERIOD = 32'd120000;
    reg debouncing = 1'b0;
    reg buttonpress = 1'b0;
    assign press = buttonpress;

    /* Our high speed clock will deal with debounce timing */
    always @ (posedge clk) begin
        // check for button presses
        if (~debouncing && ~pin_din) begin
            buttonpress <= 1;
            debouncing <= 1;
        // reset debouncing if button is held low
        end else if (debouncing && ~pin_din) begin
            debounce_timer <= 32'b0;
        // or if it's high, increment debounce timer
        end else if (debouncing && debounce_timer < DEBOUNCE_PERIOD) begin
            debounce_timer <= debounce_timer + 1;
        // finally, if it's high and timer expired, debouncing done!
        end else if (debouncing) begin
            debounce_timer <= 32'b0;
            debouncing <= 1'b0;
            buttonpress <= 0;
        end
    end


endmodule