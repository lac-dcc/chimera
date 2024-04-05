`include "defines.v"
`include "video_modes.v"
import my_types::*;

module video_config(
    input clock,
    input [7:0] data_in,
    output VideoMode videoMode
);
//    `include "video_modes.v"

    reg [7:0] data_in_reg;

    VideoMode videoMode_reg;
    assign videoMode = videoMode_reg;

    always @(posedge clock) begin
        data_in_reg <= data_in;

        if (data_in_reg != data_in) begin
            case (data_in)
                `MODE_1080p: videoMode_reg <= VIDEO_MODE_1080P;
                `MODE_1080i: videoMode_reg <= VIDEO_MODE_1080I;
                `MODE_720p: videoMode_reg <= VIDEO_MODE_720P;
                `MODE_480p: videoMode_reg <= VIDEO_MODE_480P;
                `MODE_480i: videoMode_reg <= VIDEO_MODE_480I;
            endcase
        end
    end

endmodule