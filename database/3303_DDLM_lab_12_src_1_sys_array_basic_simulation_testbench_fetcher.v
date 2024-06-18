// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
module testbench_fetcher
#(parameter DATA_WIDTH=8,
parameter ARRAY_W=4, //j
parameter ARRAY_L=4);//i

localparam ARRAY_SIZE=ARRAY_L*ARRAY_W;

reg [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] parameters_test;
reg [DATA_WIDTH*ARRAY_W*ARRAY_L - 1:0] inputs_test;
wire [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] outputs_test;
reg clk, reset_n, param_load, start_comp;
wire ready;

sys_array_fetcher #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L)) fetching_unit
(
.clock(clk),
.reset_n(reset_n),
.load_params(param_load),
.start_comp(start_comp),
.input_data_b(parameters_test),
.input_data_a(inputs_test),
.ready(ready),
.out_data(outputs_test)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

integer ii;

initial
begin
reset_n=0; param_load = 0; start_comp = 0;
#80; reset_n=1;
#20;
for (ii=0; ii<ARRAY_SIZE; ii=ii+1) begin
parameters_test[DATA_WIDTH*ii +: DATA_WIDTH] = ii+1;
inputs_test[DATA_WIDTH*ii +: DATA_WIDTH] = ii+1;
end
param_load = 1;
#20; param_load = 0; #10; start_comp = 1; #20; start_comp = 0; #100;
end
endmodule