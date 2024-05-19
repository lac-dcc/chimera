// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module board_wrapper
(
    input         ADC_CLK_10,
    input         MAX10_CLK1_50,
    input         MAX10_CLK2_50,

    input  [ 1:0] KEY,
    input  [ 9:0] SW,

    output [ 9:0] LEDR,

    output [ 7:0] HEX0,
    output [ 7:0] HEX1,
    output [ 7:0] HEX2,
    output [ 7:0] HEX3,
    output [ 7:0] HEX4,
    output [ 7:0] HEX5,

    inout  [35:0] GPIO
);

    wire fast_clk = MAX10_CLK1_50;
    wire rst_n    = ~ SW [9];
    
    wire divided_clk, slow_clk;

    clk_divider # (.w (24)) i_clk_divider
    (
        .clk         ( fast_clk    ),
        .rst_n       ( rst_n       ),
        .divided_clk ( divided_clk )
    );

    global gclk (divided_clk, slow_clk);

    wire fast_clk_en;

    strobe_generator # (.w (24)) i_strobe_generator
    (
        .clk    ( fast_clk    ),
        .rst_n  ( rst_n       ),
        .strobe ( fast_clk_en )
    );

    wire   [ 7:0] disp_en;
    wire   [31:0] disp;
    wire   [ 7:0] disp_dot;

    board_independent_wrapper i_board_independent_wrapper
    (
        .fast_clk    ( fast_clk                    ),
        .slow_clk    ( slow_clk                    ),
        .rst_n       ( rst_n                       ),
        .fast_clk_en ( fast_clk_en                 ),

        .key         ( { 2'b0, ~ KEY      [ 1:0] } ),
        .sw          (           SW       [ 7:0]   ),
        .led         (           LEDR     [ 7:0]   ),
        .disp_en     (           disp_en  [ 7:0]   ),
        .disp        (           disp     [31:0]   ),
        .disp_dot    (           disp_dot [ 7:0]   )
    );

    wire unused =   ADC_CLK_10
                  & MAX10_CLK2_50
                  & SW [8]
                  & (GPIO == 36'b0);

    display_driver i_digit_5 (disp_en [5], disp [23:20], disp_dot [5] , HEX5);
    display_driver i_digit_4 (disp_en [4], disp [19:16], disp_dot [4] , HEX4);
    display_driver i_digit_3 (disp_en [3], disp [15:12], disp_dot [3] , HEX3);
    display_driver i_digit_2 (disp_en [2], disp [11: 8], disp_dot [2] , HEX2);
    display_driver i_digit_1 (disp_en [1], disp [ 7: 4], disp_dot [1] , HEX1);
    display_driver i_digit_0 (disp_en [0], disp [ 3: 0], disp_dot [0] , HEX0);

endmodule
