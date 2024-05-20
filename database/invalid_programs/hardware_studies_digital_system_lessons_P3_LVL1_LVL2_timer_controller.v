// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL3/counter_down10.v"
`include "./LVL3/counter_down6.v"

module timer(
    input wire clk, rst, enablen, load, 
    input wire [3:0] in,
    output reg [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens, 
    output reg finished 
);
    wire [3:0] second_unit_load, second_tens_load, minute_unit_load, minute_tens_load;
    wire [3:0] second_unit, second_tens, minute_unit, minute_tens;
    wire count_end_second_unit, count_end_second_ten, count_end_minute_unit, count_end_minute_ten;
    wire tc_second_unit, tc_second_tens, tc_minute_unit, tc_minute_tens;

    counter_down10 counter_down10_second_unit (
        .clk(clk),
        .clearn(rst),
        .en(enablen),
        .load(load),
        .in(in),
        .count_end(count_end_second_unit),
        .count(second_unit),
        .tc(tc_second_unit)
    );
    counter_down6 counter_down6_second_tens (
        .clk(clk),
        .clearn(rst),
        .en(tc_second_unit),
        .load(load),
        .in(second_unit),
        .count_end(count_end_second_ten),
        .count(second_tens),
        .tc(tc_second_tens)
    );
    counter_down10 counter_down10_minutes_unit (
        .clk(clk),
        .clearn(rst),
        .en(tc_second_tens),
        .load(load),
        .in(second_tens),
        .count_end(count_end_minute_unit),
        .count(minute_unit),
        .tc(tc_minute_unit)
    );
    counter_down6 counter_down6_minutes_tens (
        .clk(clk),
        .clearn(rst),
        .en(tc_minute_unit),
        .load(load),
        .in(minute_unit),
        .count(minute_tens),
        .count_end(count_end_minute_ten),
        .tc(tc_minute_tens)
    );
    parameter [3:0] S0 = 4'b0000;

    always @(*) begin
        if ( count_end_second_unit & count_end_second_ten & count_end_minute_unit & count_end_minute_ten ) begin
            finished = 1'b1;
        end else begin
            finished = 1'b0;
        end
        out_second_unit = second_unit;
        out_second_tens = second_tens;
        out_minute_unit = minute_unit;
        out_minute_tens = minute_tens;
    end

endmodule