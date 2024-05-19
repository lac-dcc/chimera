// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module top
# (
    parameter clk_mhz = 50,
              strobe_to_update_xy_counter_width = 20
)
(
    input         clk,
    input  [ 3:0] key,
    input  [ 3:0] sw,
    output [ 7:0] led,

    output [ 7:0] abcdefgh,
    output [ 7:0] digit,

    output        vsync,
    output        hsync,
    output [ 2:0] rgb,

    output        buzzer,
    inout  [15:0] gpio
);

    wire   reset  = ~ key [3];
    assign buzzer = ~ reset;

    //------------------------------------------------------------------------

    wire [15:0] value;

    pmod_als_spi_receiver i_light_sensor
    (
        .clock ( clk        ),
        .reset ( reset      ),
        .cs    ( gpio  [14] ),
        .sck   ( gpio  [ 8] ),
        .sdo   ( gpio  [10] ),
        .value ( value      )
    );

    assign gpio [4] = 1'b1;  // VCC
    assign gpio [6] = 1'b0;  // GND

    //------------------------------------------------------------------------

    seven_segment_8_digits i_display
    (
        .clock    ( clk      ),
        .reset    ( reset    ),
        .number   ( value    ),

        .abcdefgh ( abcdefgh ),
        .digit    ( digit    )
    );

    //------------------------------------------------------------------------

    assign led = ~ value [15:6];

endmodule
