// This program was cloned from: https://github.com/nesl/ice40_examples
// License: GNU General Public License v3.0

// Blink an LED provided an input clock
/* module */
module top (hwclk, led1, led2, led3, led4, led5, led6, led7, led8 );
    /* I/O */
    input hwclk;
    output led1;
    output led2;
    output led3;
    output led4;
    output led5;
    output led6;
    output led7;
    output led8;

    /* Counter register */
    reg [31:0] counter = 32'b0;

    /* LED drivers */
    assign led1 = counter[18];
    assign led2 = counter[19];
    assign led3 = counter[20];
    assign led4 = counter[21];
    assign led5 = counter[22];
    assign led6 = counter[23];
    assign led7 = counter[24];
    assign led8 = counter[25];

    /* always */
    always @ (posedge hwclk) begin
        counter <= counter + 1;
    end

endmodule