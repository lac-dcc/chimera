// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module top
#(
    parameter debounce_depth             = 8,
              shift_strobe_width         = 23,
              seven_segment_strobe_width = 10
)
(
    input           adc_clk_10,
    input           max10_clk1_50,
    input           max10_clk2_50,

    input   [ 1:0]  key,
    input   [ 9:0]  sw,
    output  [ 9:0]  led,

    output  [ 7:0]  hex0,
    output  [ 7:0]  hex1,
    output  [ 7:0]  hex2,
    output  [ 7:0]  hex3,
    output  [ 7:0]  hex4,
    output  [ 7:0]  hex5,

    output          vga_hs,
    output          vga_vs,
    output  [ 3:0]  vga_r,
    output  [ 3:0]  vga_g,
    output  [ 3:0]  vga_b,

    inout   [35:0]  gpio
);

    //------------------------------------------------------------------------

    wire clk   = max10_clk1_50;
    wire reset = ~ key [0];

    //------------------------------------------------------------------------

    wire [1:0] key_db;
    wire [9:0] sw_db;

    sync_and_debounce # (.w (2), .depth (debounce_depth))
        i_sync_and_debounce_key
            (clk, reset, ~ key, key_db);

    sync_and_debounce # (.w (10), .depth (debounce_depth))
        i_sync_and_debounce_sw
            (clk, reset, sw, sw_db);

    //------------------------------------------------------------------------

    wire shift_strobe;

    strobe_gen # (.w (shift_strobe_width)) i_shift_strobe
        (clk, reset, shift_strobe);

    wire [9:0] out_reg;

    shift_register # (.w (10)) i_shift_reg
    (
        .clk     ( clk          ),
        .reset   ( reset        ),
        .en      ( shift_strobe ),
        .in      ( key_db [1]   ),
        .out_reg ( out_reg      )
    );

    assign led = out_reg;

    //------------------------------------------------------------------------

    wire [15:0] shift_strobe_count;

    counter # (16) i_shift_strobe_counter
    (
        .clk   ( clk                ),
        .reset ( reset              ),
        .en    ( shift_strobe       ),
        .cnt   ( shift_strobe_count )
    );

    //------------------------------------------------------------------------

    wire out_moore_fsm;

    moore_fsm i_moore_fsm
    (
        .clk   ( clk           ),
        .reset ( reset         ),
        .en    ( shift_strobe  ),
        .a     ( out_reg [0]   ),
        .y     ( out_moore_fsm )
    );

    wire [7:0] moore_fsm_out_count;

    counter # (8) i_moore_fsm_out_counter
    (
        .clk   ( clk                          ),
        .reset ( reset                        ),
        .en    ( shift_strobe & out_moore_fsm ),
        .cnt   ( moore_fsm_out_count          )
    );

    //------------------------------------------------------------------------

    wire out_mealy_fsm;

    mealy_fsm i_mealy_fsm
    (
        .clk   ( clk           ),
        .reset ( reset         ),
        .en    ( shift_strobe  ),
        .a     ( out_reg [0]   ),
        .y     ( out_mealy_fsm )
    );

    wire [7:0] mealy_fsm_out_count;

    counter # (8) i_mealy_fsm_out_counter
    (
        .clk   ( clk                          ),
        .reset ( reset                        ),
        .en    ( shift_strobe & out_mealy_fsm ),
        .cnt   ( mealy_fsm_out_count          )
    );

    //------------------------------------------------------------------------

    wire [31:0] number_to_display =
    {
        shift_strobe_count,
        moore_fsm_out_count,
        mealy_fsm_out_count
    };

    //------------------------------------------------------------------------

    seven_segment_digit i_digit_0 ( number_to_display [ 3: 0], hex0 [6:0]);
    seven_segment_digit i_digit_1 ( number_to_display [ 7: 4], hex1 [6:0]);
    seven_segment_digit i_digit_2 ( number_to_display [11: 8], hex2 [6:0]);
    seven_segment_digit i_digit_3 ( number_to_display [15:12], hex3 [6:0]);
    seven_segment_digit i_digit_4 ( number_to_display [19:16], hex4 [6:0]);
    seven_segment_digit i_digit_5 ( number_to_display [23:20], hex5 [6:0]);

    assign { hex5 [7], hex4 [7], hex3 [7], hex2 [7], hex1 [7], hex0 [7] }
        = ~ sw_db [5:0];

endmodule
