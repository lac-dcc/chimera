// This program was cloned from: https://github.com/Shofuuu/tt06-timer_counter-UGM
// License: Apache License 2.0

`default_nettype none
// `timescale 1ns/1ns

module timer_counter(
    input wire clk, inv, rst,
    input wire mode, start, stop,
    output wire [7:0] segment,
    output wire [3:0] digit
);

    // 1 Hz source from 1KHz
    reg [9:0] clk_div_1Hz;
    reg clk_1Hz;

    // Counter register and clock source
    reg [3:0] count0, count1, count2, count3; // value for every counter
    wire rst_count0, rst_count1, rst_count2, rst_count3; // reset trigger for counter
    wire clk_source; // select clock source for the counter, tick or timer
    wire start_bounced, stop_bounced, mode_bounced;

    // 0: manual tick, 1: auto 1Hz tick
    reg mode_reg; // toggle, select clock soure
    reg mode_lock; // lock after single button press (remove bouncing on mode_reg if mode_bounced == 1)

    // enable clock after start button pressed
    reg enclock_1Hz; // start the auto counter

    // mux and selector for segment display
    wire [3:0] number; // number format in BCD
    reg [1:0] selector; // mux selector

    // blink display while on idle (or manual count)
    wire stop_blink; // blink if in idle (no counting)
    assign stop_blink = ~(~mode_reg & clk_1Hz); // must be in manual mode

    always @ (posedge clk or negedge rst) begin
        if (~rst) begin
            // reset clock dividers
            clk_div_1Hz <= 10'd0;
            clk_1Hz <= 1'b0;

            // reset mode
            mode_reg <= 1'b0;
            mode_lock <= 1'b0;

            // reset enable clock 1 Hz
            enclock_1Hz <= 1'b0;

            // reset selector (display switch)
            selector <= 2'd0;
        end
        else if (stop_bounced)
            enclock_1Hz <= 1'b0;
        else begin
            // Clock divider handler
            if (clk_div_1Hz > 10'd500) begin
                clk_div_1Hz <= 10'd0;
                clk_1Hz <= ~clk_1Hz;
            end
            else
                clk_div_1Hz <= clk_div_1Hz + 10'd1;

            // check mode and toggle mode value
            if (mode_bounced & ~mode_lock) begin
                if (mode_reg)
                    mode_reg <= 1'b0;
                else
                    mode_reg <= 1'b1;

                mode_lock <= 1'b1;
            end
            else if (~mode_bounced)
                mode_lock <= 1'b0;
            else begin
                mode_reg <= mode_reg;
            end

            // if mode_reg in auto mode (1) then enable the clock 1 Hz
            if (mode_reg) // if mode == 1 (auto)
                enclock_1Hz <= 1'b1;
            else
                enclock_1Hz <= 1'b0;

            // continuously counting to switch the segment display
            // schedule the segment digit to show individual number
            selector <= selector + 2'b1;
        end
    end

    debounce #(.SREG_SIZE(8)) d0(.clk(clk), .btn(start), .rst(rst), .q(start_bounced));
    debounce #(.SREG_SIZE(8)) d1(.clk(clk), .btn(stop), .rst(rst), .q(stop_bounced));
    debounce #(.SREG_SIZE(8)) d2(.clk(clk), .btn(mode), .rst(rst), .q(mode_bounced));

    assign clk_source = (mode_reg ? (clk_1Hz & enclock_1Hz) : start_bounced);

    /*** Counter Register ***/
    assign rst_count0 = ((count0 == 10) | ~rst) ? 1'b0 : 1'b1;
    assign rst_count1 = ((count1 == 10) | ~rst) ? 1'b0 : 1'b1;
    assign rst_count2 = ((count2 == 10) | ~rst) ? 1'b0 : 1'b1;
    assign rst_count3 = ((count3 == 10) | ~rst) ? 1'b0 : 1'b1;

    counter c0(.clk(clk_source), .rst(rst_count0), .q(count0));
    counter c1(.clk(count0 == 10), .rst(rst_count1), .q(count1));
    counter c2(.clk(count1 == 10), .rst(rst_count2), .q(count2));
    counter c3(.clk(count2 == 10), .rst(rst_count3), .q(count3));
    /*** Counter Register ***/

    mux #(.DATA(4)) m0(
        .seg0(count0), .seg1(count1),
        .seg2(count2), .seg3(count3),
        .sel(selector),
        .y(number)
    );

    bcd b0(
        .a(number[3]), .b(number[2]), .c(number[1]), .d(number[0]),
        .inv(inv), .en(stop_blink),
        .digit(segment)
    );

    assign digit = (inv ? (1 << selector) : ~(1 << selector));

endmodule



