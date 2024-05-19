// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

`include "defines.v"

module measure(
    input clock,
    input reset_counter,
    input sensor_trigger, // ~prev_sensor_input && sensor_input
    input reset_bcdoutput, // prev_config_data != config_data

    output [19:0] bcd_current,
    output [19:0] bcd_minimum,
    output [19:0] bcd_maximum,
    output [19:0] bcd_average
);
    wire [23:0] bcdcount;
    wire [23:0] avg_counter_bcd;
    wire avg_counter_ready;

    reg waiting;
    reg [8:0] counter;
    reg [24:0] raw_counter;
    reg counter_trigger = 0;
    reg reset_bcdcounter = 0;
    reg [19:0] bcdcount_out = `MAX_BCDCOUNT;
    reg [19:0] bcdcount_min = `MAX_BCDCOUNT;
    reg [19:0] bcdcount_max = 0;
    reg [19:0] avg_counter;
    reg [31:0] avg_counter_reg;
    reg [31:0] avg_counter_reg_avg;
    reg [19:0] avg_counter_bcd_reg = `MAX_BCDCOUNT;
    reg avg_counter_start;
    reg [`AVERAGE_BITS-1:0] avg_loop;

    bcdcounter bcdcounter(
        .trigger(counter_trigger),
        .reset(reset_bcdcounter),
        .bcdcount(bcdcount)
    );

    Binary_to_BCD #(
        .INPUT_WIDTH(20),
        .DECIMAL_DIGITS(6)
    ) Binary_to_BCD (
        .i_Clock(clock),
        .i_Start(avg_counter_start),
        .i_Binary(avg_counter_reg_avg[19:0]),
        .o_BCD(avg_counter_bcd),
        .o_DV(avg_counter_ready)
    );

    /* 
        create trigger for the bcd counter,
        27MHz / 27, so trigger every 0.001 ms
    */
    always @(posedge clock) begin
        if (reset_counter) begin
            raw_counter <= 0;
            counter <= 0;
            counter_trigger <= 0;
            reset_bcdcounter <= 1;
        end else begin
            raw_counter <= raw_counter + 1'b1;
            reset_bcdcounter <= 0;
            if (counter < `CLOCK_DIVIDER - 1) begin
                counter <= counter + 1'b1;
                counter_trigger <= 0;
            end else begin
                counter <= 0;
                counter_trigger <= 1;
            end
        end
    end

    ///////////////////////////////////////////////////////

    always @(posedge counter_trigger or posedge reset_bcdcounter) begin
        if (reset_bcdcounter) begin
            avg_counter <= 0;
        end else begin
            avg_counter <= avg_counter + 1'b1;
        end
    end

    ///////////////////////////////////////////////////////

    always @(posedge clock) begin
        if (reset_counter) begin
            waiting <= 1;
        end else if (reset_bcdoutput) begin
            bcdcount_out <= `MAX_BCDCOUNT;
            bcdcount_max <= 0;
            bcdcount_min <= `MAX_BCDCOUNT;
            avg_counter_reg_avg <= 0;
            avg_counter_reg <= 0;
            avg_loop <= 0;
            avg_counter_bcd_reg <= `MAX_BCDCOUNT;
        end else if (waiting && sensor_trigger) begin
            bcdcount_out <= bcdcount[23:4];
            if (avg_loop == 0) begin
                // reset min and max at the start of the averaging period
                bcdcount_max <= bcdcount[23:4];
                bcdcount_min <= bcdcount[23:4];
            end else begin             
                if (bcdcount[23:4] < bcdcount_min) begin
                    bcdcount_min <= bcdcount[23:4];
                end
                if (bcdcount[23:4] > bcdcount_max) begin
                    bcdcount_max <= bcdcount[23:4];
                end
            end
            if (avg_counter != 0) begin
                if (avg_loop == (`AVERAGE_SIZE - 1)) begin
                    avg_counter_reg_avg <= (avg_counter_reg + avg_counter) >> `AVERAGE_BITS;
                    avg_counter_reg <= 0;
                    avg_loop <= 0;
                    avg_counter_start <= 1'b1;
                end else begin
                    avg_counter_reg <= avg_counter_reg + avg_counter;
                    avg_loop <= avg_loop + 1'b1;
                    avg_counter_start <= 1'b0;
                end
            end
            waiting <= 0;
        end
        if (avg_counter_ready) begin
            avg_counter_bcd_reg <= avg_counter_bcd[23:4];
        end
    end

    assign bcd_current = bcdcount_out;
    assign bcd_minimum = bcdcount_min;
    assign bcd_maximum = bcdcount_max;
    assign bcd_average = avg_counter_bcd_reg;

endmodule