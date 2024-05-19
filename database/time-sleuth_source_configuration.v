// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

`include "defines.v"

module configuration(
    input clock,
    input [4:0] config_in,
    output reg [7:0] config_data,
    output config_changed
);
    reg [7:0] prev_config_data;

    always @(posedge clock) begin
        prev_config_data <= config_data;
        case (config_in)
            5'b_11110: config_data <= `MODE_1080p; // switch 1
            5'b_11101: config_data <= `MODE_1080i; // switch 2
            5'b_11011: config_data <= `MODE_720p;  // switch 3
            5'b_10111: config_data <= `MODE_480p;  // switch 4
            5'b_01111: config_data <= `MODE_480i;  // switch 5
            default: config_data <= `DEFAULT_FB_MODE;
        endcase
    end

    assign config_changed = (prev_config_data != config_data);

endmodule