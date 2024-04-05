
module pipeWrap(
    input clk,
    input rst_n,

    input start,

    input in_valid,
    output in_ready,
    input [63:0] in_data,

    output out_valid,
    input out_ready,
    output [63:0] out_data

);
    
    reg sync_reset;
    `REG(clk, sync_reset, 1, start ? 0 : sync_reset)


    wire [64:0] pipe_out;
    hsfn #(.INSTANCE_NAME("stereo")) hsfna(.CLK(clk), .ready_downstream(out_ready), .ready(in_ready), .reset(sync_reset), .process_input({in_valid,in_data}), .process_output(pipe_out));

    assign out_valid = pipe_out[64];
    assign out_data = pipe_out[63:0];

endmodule : pipeWrap

/*
 frameControl frameControl_inst(
    .clk(XXX_clk),
    .rst_n(XXX_rst_n),

    .start(XXX_start),

    .in_valid(XXX_in_valid),
    .in_ready(XXX_in_ready),
    .in_data(XXX_in_data[63:0]),

    .out_valid(XXX_out_valid),
    .out_ready(XXX_out_ready),
    .out_data(XXX_out_data[63:0]),
);
*/
