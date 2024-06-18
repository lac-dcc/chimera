// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

//Stopwatch_Level3.v
//stopwatch level 3

module stopwatch (
    input wire clk,
    input wire reset,
    input wire start,
    input wire stop,
    input wire clear,
    input wire countdown,
    input wire lap,
    output reg [3:0] minutes_bcd,
    output reg [3:0] seconds_bcd,
    output reg [3:0] tenths_bcd,
    output reg [6:0] seven_segment_display
);

// Synchronous reset
always @(posedge clk) begin
    if (reset) begin
        minutes_bcd <= 4'b0000;
        seconds_bcd <= 4'b0000;
        tenths_bcd <= 4'b0000;
        flashing <= 1'b0;
        lap_mode <= 1'b0;
    end
end

// Counter
reg [11:0] count_bcd;
always @(posedge clk) begin
    if (reset) begin
        count_bcd <= 12'b0000_0000_0000;
    end else if (start && !stop && !flashing) begin
        count_bcd <= count_bcd + 1'b1;
    end
end

// Time display
reg [3:0] tenths_bcd_next, seconds_bcd_next, minutes_bcd_next;
reg flashing;
always @(posedge clk) begin
    if (reset) begin
        tenths_bcd_next <= 4'b0000;
        seconds_bcd_next <= 4'b0000;
        minutes_bcd_next <= 4'b0000;
        flashing <= 1'b0;
    end else if (start && !stop && !flashing) begin
        tenths_bcd_next <= count_bcd[3:0];
        seconds_bcd_next <= count_bcd[7:4];
        minutes_bcd_next <= count_bcd[11:8];
    end else if (count_bcd == 12'b0000_0000_0000 && !flashing) begin
        flashing <= 1'b1;
    end
    if (tenths_bcd_next != tenths_bcd) begin
        tenths_bcd <= tenths_bcd_next;
    end
    if (seconds_bcd_next != seconds_bcd) begin
        seconds_bcd <= seconds_bcd_next;
    end
    if (minutes_bcd_next != minutes_bcd) begin
        minutes_bcd <= minutes_bcd_next;
    end
end

// Countdown
always @(posedge clk) begin
    if (clear && !stop) begin
        count_bcd <= 12'b0000_0000_0000;
        flashing <= 1'b0;
    end else if (countdown && !stop && !flashing) begin
        count_bcd <= count_bcd - 1'b1;
    end
end

// Lap mode
reg lap_mode;
always @(posedge clk) begin
    if (lap) begin
        lap_mode <= ~lap_mode;
    end
end

// Seven segment display
reg [6:0] seven_segment_display_next;
always @(posedge clk) begin
    if (flashing) begin
        seven_segment_display_next <= 7'b1111111; // Flashing off
    end else if (lap_mode) begin
        seven_segment_display_next <= 7'b1111111; // Lap mode: display off
    end else if (minutes_bcd == 4'b0000 && seconds_bcd == 4'b0000 && tenths_bcd == 4'b0000) begin
        seven_segment_display_next <= 7'b1111111; // Flashing off
    end else begin
        // Convert BCD to seven segment display
       reg [3:0] digit_1, digit_2, digit_3;
        digit_1 <= minutes_bcd[3:0];
        digit_2 <= seconds_bcd[3:0];
        digit_3 <= tenths_bcd[3:0];
        seven_segment_display_next <= {digit_3, digit_2, digit_1};
    end
end

endmodule
