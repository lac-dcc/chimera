// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "game_config.vh"

module game_mixer
(
    input            clk,
    input            reset,

    input            display_on,

    input            sprite_target_rgb_en,
    input      [2:0] sprite_target_rgb,

    input            sprite_torpedo_rgb_en,
    input      [2:0] sprite_torpedo_rgb,

    input            game_won,
    input            end_of_game_timer_running,
    input            random,

    output reg [2:0] rgb
);

    always @ (posedge clk or posedge reset)
        if (reset)
            rgb <= 3'b000;
        else if (! display_on)
            rgb <= 3'b000;
        else if (end_of_game_timer_running)
            rgb <= { 1'b1, ~ game_won, random };
        else if (sprite_torpedo_rgb_en)
            rgb <= sprite_torpedo_rgb;
        else if (sprite_target_rgb_en)
            rgb <= sprite_target_rgb;
        else
            rgb <= 3'b000;

endmodule
