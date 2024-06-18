// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top2
(
    input         clk,
    input  [ 3:0] key,
    input  [ 7:0] sw,
    output [11:0] led,
    output [ 7:0] abcdefgh,
    output [ 7:0] digit,
    output        buzzer
);

    wire rst_n = key [3];

    //------------------------------------------------------------------------

    /*

    I had to remove syncing and debouncing to fit the design into EPM240
    
    wire [3:0] key_db;
    wire [7:0] sw_db;

    sync_and_debounce # (.w (4)) i_sync_and_debounce_key
        (clk, ~ key, key_db);
    
    sync_and_debounce # (.w (8)) i_sync_and_debounce_sw
        (clk, ~ sw, sw_db);
    */
    
    wire [3:0] key_db = ~ key;
    wire [7:0] sw_db  = ~ sw;

    //------------------------------------------------------------------------

    wire shift_register_strobe;

    strobe_gen # (.w (23)) i_shift_strobe
        (clk, rst_n, shift_strobe);

    wire [11:0] out_reg;

    shift_register # (.w (12)) i_shift_reg
    (
        .clk     ( clk          ),
        .rst_n   ( rst_n        ),
        .en      ( shift_strobe ),
        .in      ( key_db [1]   ),
        .out_reg ( out_reg      )
    );

    assign led = ~ out_reg;

    //------------------------------------------------------------------------

    wire [15:0] shift_strobe_count;
    wire [ 7:0] moore_fsm_out_count;
    wire [ 7:0] mealy_fsm_out_count;
    
    wire [31:0] number_to_display =
    {
        shift_strobe_count,
        moore_fsm_out_count,
        mealy_fsm_out_count
    };

    //------------------------------------------------------------------------

    counter # (16) i_shift_strobe_counter
    (
        .clk   ( clk                ),
        .rst_n ( rst_n              ),
        .en    ( shift_strobe       ),
        .cnt   ( shift_strobe_count )
    );

    //------------------------------------------------------------------------

    moore_fsm i_moore_fsm
    (
        .clk   ( clk           ),
        .rst_n ( rst_n         ),
        .en    ( shift_strobe  ),
        .a     ( out_reg       ),
        .y     ( out_moore_fsm )
    );
    
    counter # (8) i_moore_fsm_out_counter
    (
        .clk   ( clk                          ),
        .rst_n ( rst_n                        ),
        .en    ( shift_strobe & out_moore_fsm ),
        .cnt   ( moore_fsm_out_count          )
    );

    //------------------------------------------------------------------------

    mealy_fsm i_mealy_fsm
    (
        .clk   ( clk           ),
        .rst_n ( rst_n         ),
        .en    ( shift_strobe  ),
        .a     ( out_reg       ),
        .y     ( out_mealy_fsm )
    );
    
    counter # (8) i_mealy_fsm_out_counter
    (
        .clk   ( clk                          ),
        .rst_n ( rst_n                        ),
        .en    ( shift_strobe & out_mealy_fsm ),
        .cnt   ( mealy_fsm_out_count          )
    );

    //------------------------------------------------------------------------

    wire seven_segment_strobe;

    strobe_gen # (.w (10)) i_seven_segment_strobe
        (clk, rst_n, seven_segment_strobe);

    seven_segment #(.w (32)) i_seven_segment
    (
        .clk     ( clk                  ),
        .rst_n   ( rst_n                ),
        .en      ( seven_segment_strobe ),
        .num     ( number_to_display    ),
        .dots    ( sw_db                ),
        .abcdefg ( abcdefgh [7:1]       ),
        .dot     ( abcdefgh [0]         ),
        .anodes  ( digit                )
    );

    //------------------------------------------------------------------------

    assign buzzer = ~ key_db [0];

endmodule
