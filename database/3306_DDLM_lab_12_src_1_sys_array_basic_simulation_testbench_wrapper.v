// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
module testbench_wrapper
#(parameter DATA_WIDTH=8,
parameter ARRAY_W=5, //j
parameter ARRAY_L=2, //i
parameter CLOCK_DIVIDE=2);

reg clk, reset_n, param_load, start_comp;
wire [4*DATA_WIDTH-1:0] hex_output;

sys_array_wrapper #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L), .CLOCK_DIVIDE(CLOCK_DIVIDE)) wrappper
(
.clk(clk),
.reset_n(reset_n),
.load_params(param_load),
.start_comp(start_comp),
.hex_connect(hex_output)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

initial
begin
reset_n=0; param_load = 0; start_comp = 0;
#80; reset_n=1;
#20;
param_load = 1;
#20; param_load = 0; #10; start_comp = 1; #20; start_comp = 0; #100;
end
endmodule