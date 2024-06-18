// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL2/timer/controller.v"
`include "./LVL2/magnetron/controller.v"
`include "./LVL2/input_control/controller.v"
`include "./LVL2/7-segment/controller.v"

module MWcontroller(
    input wire clk, startn, stopn, clearn, door_closed, 
    input wire [9:0] keypad,
    output reg mag_on,
    output reg [6:0] sec_ones_segs, sec_tens_segs, min_ones_segs, min_tens_segs
);
    wire load, pgt_1hz, timer_done, counter_out;
    wire mag_on_;
    wire [3:0] digit;
    wire [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens;
    wire [6:0] display_second_unit, display_second_tens, display_minute_unit, display_minute_tens;

    input_encoder input_encoder_inst (
        .clk(clk), .enablen(mag_on), .keypad(keypad),
        .load(load), .pgt_1hz(pgt_1hz), .digit(digit)
    );

    timer timer_inst (
        .clk(pgt_1hz), .rst(clearn), .enablen(mag_on), .load(load), .in(digit),
        .out_second_unit(out_second_unit), .out_second_tens(out_second_tens),
        .out_minute_unit(out_minute_unit), .out_minute_tens(out_minute_tens),
        .finished(timer_done)
    );

    magnetron magnetron_inst (
        .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
        .mag_on(mag_on_)
    );

    SevenSegmentsDecoder_4digits seven_segment_inst (
        .second_unit(out_second_unit), .second_tens(out_second_tens),
        .minute_unit(out_minute_unit), .minute_tens(out_minute_tens),
        .out_second_unit(display_second_unit), .out_second_tens(display_second_tens),
        .out_minute_unit(display_minute_unit), .out_minute_tens(display_minute_tens)
    );

    always @(*) begin
        mag_on = !mag_on_;
        sec_ones_segs = display_second_unit;
        sec_tens_segs = display_second_tens;
        min_ones_segs = display_minute_unit;
        min_tens_segs = display_minute_tens;
    end

endmodule