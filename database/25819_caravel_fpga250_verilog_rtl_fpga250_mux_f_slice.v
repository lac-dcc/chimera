// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

///////// Mux system for the F7MUX and F8MUX equivalents ////

module mux_f_slice #(
    parameter NUM_LUTS=2, 
    parameter MUX_LEVEL=1
) (
    input  [NUM_LUTS-1:0] luts_out,
    input  [MUX_LEVEL-1:0] addr,
    output [NUM_LUTS-1:0] out,

    // Block Style Configuration
    input clk,
    input comb_set,
    input [MUX_LEVEL-1:0] config_in
);

reg [MUX_LEVEL-1:0] config_state;

generate
    if (MUX_LEVEL==1) begin
        assign out[0] = config_state[0] ? (addr[0] ? luts_out[1] : luts_out[0]) : luts_out[0];
        assign out[1] = luts_out[1];
    end else begin
        wire [NUM_LUTS-1:0] intermediate_out;
        localparam HALF_LUTS = NUM_LUTS/2;
        assign out[0] = config_state[MUX_LEVEL-1] ? (addr[MUX_LEVEL-1] ? intermediate_out[HALF_LUTS] : intermediate_out[0]) : intermediate_out[0];
        assign out[NUM_LUTS-1:1] = intermediate_out[NUM_LUTS-1:1];
        mux_f_slice #(
            .NUM_LUTS(HALF_LUTS), .MUX_LEVEL(MUX_LEVEL-1)
        ) mux_lower (
            .luts_out(luts_out[HALF_LUTS-1:0]),
            .addr(addr[MUX_LEVEL-2:0]),
            .out(intermediate_out[HALF_LUTS-1:0]),
            .clk(clk),
            .comb_set(comb_set),
            .config_in(config_in[MUX_LEVEL-2:0])
        );
        mux_f_slice #(
            .NUM_LUTS(HALF_LUTS), .MUX_LEVEL(MUX_LEVEL-1)
        ) mux_higher (
            .luts_out(luts_out[NUM_LUTS-1:HALF_LUTS]),
            .addr(addr[MUX_LEVEL-2:0]),
            .out(intermediate_out[NUM_LUTS-1:HALF_LUTS]),
            .clk(clk),
            .comb_set(comb_set),
            .config_in(config_in[MUX_LEVEL-2:0])
        );
    end
endgenerate

always @(posedge clk) begin
    if (comb_set) begin
        config_state <= config_in;
    end
end

endmodule
