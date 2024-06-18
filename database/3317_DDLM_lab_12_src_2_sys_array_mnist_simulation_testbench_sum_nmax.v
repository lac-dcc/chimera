// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
module testbench_sum_nmax
#(parameter DATA_WIDTH=8,
parameter LENGTH=10);

reg [2*DATA_WIDTH*LENGTH-1:0] inputs_test;
wire [LENGTH-1:0] outputs_test;
reg [DATA_WIDTH*LENGTH-1:0] biases_test;
reg clk, reset_n, ready;

sum_and_max #(.DATA_WIDTH(DATA_WIDTH), .LENGTH(LENGTH)) dut
(
.clk(clk),
.reset_n(reset_n),
.ready(ready),
.input_data(inputs_test),
.biases(biases_test),
.maxi(outputs_test)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

integer ii;

initial
begin
reset_n=0; ready=0;
#80; reset_n=1;
#20;
for (ii=0; ii<LENGTH; ii=ii+1) begin
inputs_test[2*DATA_WIDTH*ii +: 2*DATA_WIDTH] = ii+1;
biases_test[DATA_WIDTH*ii +: DATA_WIDTH] = ii-1;
end
ready=1; #20;
for (ii=0; ii<LENGTH; ii=ii+1) begin
inputs_test[2*DATA_WIDTH*ii +: 2*DATA_WIDTH] = ii+2;
end
#20;
for (ii=0; ii<LENGTH; ii=ii+1) begin
inputs_test[2*DATA_WIDTH*ii +: 2*DATA_WIDTH] = ii-2;
end
#80;
end
endmodule