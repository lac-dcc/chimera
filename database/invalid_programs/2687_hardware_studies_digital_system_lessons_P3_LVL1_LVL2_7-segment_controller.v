// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL3/7_segments_decoder.v"

module SevenSegmentsDecoder_4digits(
    input [3:0] second_unit, second_tens, minute_unit, minute_tens,
    output reg [6:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens
);

    wire [6:0] display_second_unit, display_second_tens, display_minute_unit, display_minute_tens;
    
    SevenSegmentsDecoder sevenSegmentsDecoder_second_unit (
        .in(second_unit),
        .out(display_second_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_second_tens (
        .in(second_tens),
        .out(display_second_tens)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_unit (
        .in(minute_unit),
        .out(display_minute_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_tens (
        .in(minute_tens),
        .out(display_minute_tens)
    );

    always @(*) begin
        out_second_unit = display_second_unit;
        out_second_tens = display_second_tens;
        out_minute_unit = display_minute_unit;
        out_minute_tens = display_minute_tens;
    end
    
endmodule