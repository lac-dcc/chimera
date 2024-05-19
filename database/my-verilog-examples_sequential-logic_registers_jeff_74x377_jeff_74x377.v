// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit register, clock enable.
// Based on the 7400-series integrated circuits used in my programable-8-bit-microprocessor.

// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
// `include "../../../basic-code/sequential-logic/d_flip_flop_pos_edge_sync_en/d_flip_flop_pos_edge_sync_en.v"

module jeff_74x377_structural (
    input           en_bar,             // ENABLE
    input           clk,                // CLOCK
    input           d0,                 // DATA IN 
    input           d1,                 // 
    input           d2,                 // 
    input           d3,                 // 
    input           d4,                 // 
    input           d5,                 // 
    input           d6,                 // 
    input           d7,                 // 
    output          q0,                 // DATA OUT
    output          q1,                 // 
    output          q2,                 // 
    output          q3,                 // 
    output          q4,                 // 
    output          q5,                 // 
    output          q6,                 // 
    output          q7);                //

    wire  NOTHING;

    // EN AND FEEDBACK
    // assign clk_feedback = (clk & ~en_feedback);
    // assign en_feedback = (~en_bar & ~clk_feedback);

    // d_flip_flop_pos_edge_sync_en_behavioral DFF7 (.clk(clk), .en(en_feedback), .d(d7), .q(q7), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF6 (.clk(clk), .en(en_feedback), .d(d6), .q(q6), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF5 (.clk(clk), .en(en_feedback), .d(d5), .q(q5), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF4 (.clk(clk), .en(en_feedback), .d(d4), .q(q4), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF3 (.clk(clk), .en(en_feedback), .d(d3), .q(q3), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF2 (.clk(clk), .en(en_feedback), .d(d2), .q(q2), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF1 (.clk(clk), .en(en_feedback), .d(d1), .q(q1), .qbar(NOTHING));
    // d_flip_flop_pos_edge_sync_en_behavioral DFF0 (.clk(clk), .en(en_feedback), .d(d0), .q(q0), .qbar(NOTHING));

    assign en = ~en_bar;
    assign high = 1'b1;

    assign from_d7 = ((d7 & en) | (en_bar & q7));
    assign from_d6 = ((d6 & en) | (en_bar & q6));
    assign from_d5 = ((d5 & en) | (en_bar & q5));
    assign from_d4 = ((d4 & en) | (en_bar & q4));
    assign from_d3 = ((d3 & en) | (en_bar & q3));
    assign from_d2 = ((d2 & en) | (en_bar & q2));
    assign from_d1 = ((d1 & en) | (en_bar & q1));
    assign from_d0 = ((d0 & en) | (en_bar & q0));

    d_flip_flop_pos_edge_sync_en_behavioral DFF7 (.clk(clk), .en(high), .d(from_d7), .q(q7), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF6 (.clk(clk), .en(high), .d(from_d6), .q(q6), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF5 (.clk(clk), .en(high), .d(from_d5), .q(q5), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF4 (.clk(clk), .en(high), .d(from_d4), .q(q4), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF3 (.clk(clk), .en(high), .d(from_d3), .q(q3), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF2 (.clk(clk), .en(high), .d(from_d2), .q(q2), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF1 (.clk(clk), .en(high), .d(from_d1), .q(q1), .qbar(NOTHING));
    d_flip_flop_pos_edge_sync_en_behavioral DFF0 (.clk(clk), .en(high), .d(from_d0), .q(q0), .qbar(NOTHING));

endmodule
