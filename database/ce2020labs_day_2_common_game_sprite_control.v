// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "game_config.vh"

module game_sprite_control
#(
    parameter DX_WIDTH = 2,  // X speed width in bits
              DY_WIDTH = 2,  // Y speed width in bits

              strobe_to_update_xy_counter_width = 20
)

//----------------------------------------------------------------------------

(
    input                    clk,
    input                    reset,

    input                    sprite_write_xy,
    input                    sprite_write_dxy,

    input  [`X_WIDTH  - 1:0] sprite_write_x,
    input  [`Y_WIDTH  - 1:0] sprite_write_y,

    input  [ DX_WIDTH - 1:0] sprite_write_dx,
    input  [ DY_WIDTH - 1:0] sprite_write_dy,

    input                    sprite_enable_update,

    output [`X_WIDTH  - 1:0] sprite_x,
    output [`Y_WIDTH  - 1:0] sprite_y
);

    wire strobe_to_update_xy;

    game_strobe
    # (.width (strobe_to_update_xy_counter_width))
    strobe_generator
    (clk, reset, strobe_to_update_xy);

    reg [`X_WIDTH  - 1:0] x;
    reg [`Y_WIDTH  - 1:0] y;

    reg [ DX_WIDTH - 1:0] dx;
    reg [ DY_WIDTH - 1:0] dy;

    always @ (posedge clk or posedge reset)
        if (reset)
        begin
            x  <= 1'b0;
            y  <= 1'b0;
        end
        else if (sprite_write_xy)
        begin
            x  <= sprite_write_x;
            y  <= sprite_write_y;
        end
        else if (sprite_enable_update && strobe_to_update_xy)
        begin
            // Add with signed-extended dx and dy

            x <= x + { { `X_WIDTH - DX_WIDTH { dx [DX_WIDTH - 1] } }, dx };
            y <= y + { { `Y_WIDTH - DY_WIDTH { dy [DY_WIDTH - 1] } }, dy };
        end

    always @ (posedge clk or posedge reset)
        if (reset)
        begin
            dx <= 1'b0;
            dy <= 1'b0;
        end
        else if (sprite_write_dxy)
        begin
            dx <= sprite_write_dx;
            dy <= sprite_write_dy;
        end


    assign sprite_x = x;
    assign sprite_y = y;

endmodule
