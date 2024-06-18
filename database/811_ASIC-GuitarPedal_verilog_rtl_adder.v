// This program was cloned from: https://github.com/sdmay24-21/ASIC-GuitarPedal
// License: Apache License 2.0

module adder (
    input clk,
    input adc_clock, // Resets on adc_clock
    input [15:0] adder_input0,
    output reg [15:0] adder_out
);

reg [15:0] sum;
reg [15:0] carry;

always @(posedge clk or posedge adc_clock) begin
    if (adc_clock) begin
        sum <= 16'b0;
        carry <= 16'b0;
    end else begin
        {carry[0], sum[0]} <= adder_input0[0] + adder_out[0];
        {carry[1], sum[1]} <= adder_input0[1] + adder_out[1] + carry[0];
        {carry[2], sum[2]} <= adder_input0[2] + adder_out[2] + carry[1];
        {carry[3], sum[3]} <= adder_input0[3] + adder_out[3] + carry[2];
        {carry[4], sum[4]} <= adder_input0[4] + adder_out[4] + carry[3];
        {carry[5], sum[5]} <= adder_input0[5] + adder_out[5] + carry[4];
        {carry[6], sum[6]} <= adder_input0[6] + adder_out[6] + carry[5];
        {carry[7], sum[7]} <= adder_input0[7] + adder_out[7] + carry[6];
        {carry[8], sum[8]} <= adder_input0[8] + adder_out[8] + carry[7];
        {carry[9], sum[9]} <= adder_input0[9] + adder_out[9] + carry[8];
        {carry[10], sum[10]} <= adder_input0[10] + adder_out[10] + carry[9];
        {carry[11], sum[11]} <= adder_input0[11] + adder_out[11] + carry[10];
        {carry[12], sum[12]} <= adder_input0[12] + adder_out[12] + carry[11];
        {carry[13], sum[13]} <= adder_input0[13] + adder_out[13] + carry[12];
        {carry[14], sum[14]} <= adder_input0[14] + adder_out[14] + carry[13];
        {carry[15], sum[15]} <= adder_input0[15] + adder_out[15] + carry[14];
    end
end

assign adder_out = sum;

endmodule