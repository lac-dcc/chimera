// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

///////// SOFTCODED SXX LUT /////////

module lut_sXX_softcode #(
    parameter INPUTS=4, 
    parameter MEM_SIZE=2**INPUTS
) (
    input [INPUTS*2-1:0] addr,
    output [1:0] out,

    // Block Style Configuration
    // NOTE: MOST SIGNIFICANT BIT OF CFG DETERMINES FRACTURING
    // config_in = {use_fracture, first_lut, second_lut}
    input clk,
    input comb_set,
    input [2*MEM_SIZE:0] config_in
);

wire second_in, out_upper, out_lower;
reg split = 1'b0;
assign second_in = split ? addr[INPUTS-1] : out_upper;
assign out = {out_upper, out_lower}; // had to split out because of verilator's optimization strategy giving unoptflat errors

always @(posedge clk) begin
    if (comb_set) begin
        split <= config_in[2*MEM_SIZE];
    end
end

lut #(.INPUTS(INPUTS)) first_lut (
    .addr(addr[INPUTS*2-1:INPUTS]),
    .out(out_upper),
    .clk(clk),
    .comb_set(comb_set),
    .config_in(config_in[2*MEM_SIZE-1:MEM_SIZE])
);

lut #(.INPUTS(INPUTS)) second_lut (
    .addr({second_in, addr[INPUTS-2:0]}),
    .out(out_lower),
    .clk(clk),
    .comb_set(comb_set),
    .config_in(config_in[MEM_SIZE-1:0])
);

endmodule
