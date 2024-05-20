// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL3/comb_logic.v"
`include "./LVL3/sr_latch.v"

module magnetron (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output reg mag_on
);
    wire set, reset, mag_on_;

    mag_comb_logic mag_comb_logic_inst (
        .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
        .set(set), .reset(reset)
    );

    srlatch srlatch_inst (
        .rst(reset), .set(set),
        .mag_on(mag_on_)
    );

    always @(*) begin
        mag_on = mag_on_;
    end
endmodule