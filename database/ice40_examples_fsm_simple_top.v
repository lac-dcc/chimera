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
    led2,
    led3,
    // Keypad lines
    keypad_r1,
    keypad_c1,
    keypad_c2,
    );

    /* Clock input */
    input hwclk;

    /* LED outputs */
    output led1;
    output led2;
    output led3;
    reg [2:0] ledvals = 3'b0;

    /* Numpad I/O */
    output keypad_r1=0;
    input keypad_c1;
    input keypad_c2;

    /* Button Modules */
    wire press1, press2;
    button button1 (
        .clk (hwclk),
        .pin_in (keypad_c1),
        .press (press1),
    );
    button button2 (
        .clk (hwclk),
        .pin_in (keypad_c2),
        .press (press2),
    );

    /* State variables */
    parameter STATE_RST = 8'd0;
    parameter STATE_1    = 8'd1;
    parameter STATE_12   = 8'd2;
    parameter STATE_121  = 8'd3;
    parameter STATE_1211 = 8'd4;
    reg [7:0] state = STATE_RST;
    assign led1 = ledvals[0];
    assign led2 = ledvals[1];
    assign led3 = ledvals[2];

    wire button_pressed = press1 | press2;

    /* Our high speed clock will deal with the simple FSM */
    always @ (posedge button_pressed) begin
        // toggle LEDs
        if (press1) begin
            ledvals[0] <= ~ledvals[0];
        end else begin
            ledvals[1] <= ~ledvals[1];
        end
        case (state)
            STATE_RST : begin
                if (press1) begin
                    state <= STATE_1;
                    ledvals[2] <= 0;
                end else begin
                    state <= STATE_RST;
                    ledvals[2] <= 0;
                end
                end     

            STATE_1 : begin
                if (press1) begin
                    state <= STATE_1;
                    ledvals[2] <= 0;
                end else begin
                    state <= STATE_12;
                    ledvals[2] <= 0;
                end 
                end
            STATE_12 : begin
                if (press1) begin
                    state <= STATE_121;
                    ledvals[2] <= 0;
                end else begin
                    state <= STATE_RST;
                    ledvals[2] <= 0;
                end
                end
            STATE_121 : begin
                if (press1) begin
                    state <= STATE_1211;
                    ledvals[2] <= 1;
                end else begin
                    state <= STATE_12;
                    ledvals[2] <= 0;
                end
                end
            STATE_1211 : begin
                if (press1) begin
                    state <= STATE_1;
                    ledvals[2] <= 0;
                end else begin
                    state <= STATE_12;
                    ledvals[2] <= 0;
                end
                end
            default : begin
                state <= STATE_RST;
                ledvals[2] <= 0;
            end
        endcase
    end

endmodule