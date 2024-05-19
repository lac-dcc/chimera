// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

module LEDS #(
        parameter BASE_ADDR = 8'h 0A,
        data_width = 8
    ) (
        input wire clk,
        input wire [7:0] addr,
        input wire write_en,
        input wire rst,
        input wire [7:0] din,
        output wire [7:0] dout
    );

    reg [data_width-1:0] leds = 8'b 0;

    assign dout = leds;

    // leds register
    always @(posedge clk)
    begin
        if( rst ) leds <= 8'b 0;
        else if( write_en ) leds <= din;
        else leds <= leds;
    end

endmodule