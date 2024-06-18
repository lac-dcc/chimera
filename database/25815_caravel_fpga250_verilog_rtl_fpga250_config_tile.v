// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module config_tile #(
    parameter COMB_N = 4236,
    parameter MEM_N = 132
) (
    input clk,
    input rst,
    input shift_enable,

    output [COMB_N-1:0] comb_config,
    output [MEM_N-1:0] mem_config,
    output comb_set,  // Set signal from set_soft or set_hard depending on which one you're using.
    output mem_set,   // Gated by second configuration bit, controls whether you set configuration values.

    input set_soft,   // From fabric.
    input set_hard,   // From tile/column.
    input shift_in_hard,
    input shift_in_soft,

    output shift_out
);
    wire set_internal;
    wire shift_in_internal;

    wire mem_ctrl;
    wire input_mux;

    assign shift_in_internal = input_mux ? shift_in_soft : shift_in_hard;
    assign set_internal = input_mux ? set_soft : set_hard;

    assign mem_set = (~mem_ctrl) & set_internal;
    assign comb_set = set_internal;

    wire [1:0] internal_config_inter;

    config_latch #(.LENGTH(2)) internal_config (
        .clk(clk),
        .rst(rst),
        .set(set_internal),

        .shifter_data(internal_config_inter),
        .config_bits({input_mux, mem_ctrl})
    );

    wire comb_mem_bridge;

    shift_chain #(.LENGTH(COMB_N + 2)) comb_shifter (
        .clk(clk),
        .rst(rst),
        .shift_enable(shift_enable),
        .shift_in(shift_in_internal),
        .shift_out(comb_mem_bridge),
        .config_data({internal_config_inter, comb_config})
    );

    shift_chain #(.LENGTH(MEM_N)) mem_shifter (
        .clk(clk),
        .rst(rst),
        .shift_enable(shift_enable),
        .shift_in(comb_mem_bridge),
        .shift_out(shift_out),
        .config_data(mem_config)
    );
endmodule
