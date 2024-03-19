
module ledblink
(
    clock_in,
    reset_in,
    led_out
);

    input clock_in;
    input reset_in;
    output [7:0]led_out;

    lsa_top lsa_top0
    (
        .in_clock(clock_in),
        .in_reset(reset_in),
        .out_led_out(led_out)
    );

endmodule
