// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
module testbench_sys_array
#(parameter DATA_WIDTH=8,
parameter ARRAY_W=4, //j
parameter ARRAY_L=4);//i

reg [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] parameters_test;
reg [DATA_WIDTH*ARRAY_L-1:0] inputs_test;
wire [2*DATA_WIDTH*ARRAY_W-1:0] outputs_test;
reg clk, reset_n, param_load;

sys_array_basic #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L)) systolic_array
(
.clk(clk),
.reset_n(reset_n),
.param_load(param_load),
.parameter_data(parameters_test),
.input_module(inputs_test),
.out_module(outputs_test)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

integer ii;

initial
begin
reset_n=0; param_load = 0;
#80; reset_n=1;
#20;
for (ii=0; ii<16; ii=ii+1) begin
parameters_test[DATA_WIDTH*ii +: DATA_WIDTH] = ii+1;
end
param_load = 1;
#20; param_load = 0; #10; inputs_test[7:0] = 8'd1; //1st clk cycle
#20; inputs_test[7:0] = 8'd5; inputs_test[15:8] = 8'd2; //2nd clk cycle
#20; inputs_test[7:0] = 8'd9; inputs_test[15:8] = 8'd6; inputs_test[23:16] = 8'd3; //3rd clk cycle
#20; inputs_test[7:0] = 8'd13; inputs_test[15:8] = 8'd10; inputs_test[23:16] = 8'd7; inputs_test[31:24] = 8'd4; //4th clock cycle
#20; inputs_test[15:8] = 8'd14; inputs_test[23:16] = 8'd11; inputs_test[31:24] = 8'd8; //5th clock cycle
#20; inputs_test[23:16] = 8'd15; inputs_test[31:24] = 8'd12; //6th clock cycle
#20; inputs_test[31:24] = 8'd16; //7th clk cycle
end
endmodule