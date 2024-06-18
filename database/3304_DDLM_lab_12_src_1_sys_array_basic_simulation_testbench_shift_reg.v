// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
module testbench_shift_reg
#(parameter DATA_WIDTH=8,
parameter LENGTH=4);

reg [DATA_WIDTH*LENGTH-1:0] parameters_test;
reg [DATA_WIDTH-1:0] inputs_test;
wire [DATA_WIDTH*LENGTH-1:0] data_test;
wire [DATA_WIDTH-1:0] outputs_test;
reg [1:0] control;
reg clk, reset_n;

shift_reg #(.DATA_WIDTH(DATA_WIDTH), .LENGTH(LENGTH)) shift_register
(
.clock(clk),
.reset_n(reset_n),
.ctrl_code(control),
.data_in(parameters_test),
.data_read(outputs_test),
.data_write(inputs_test),
.data_out(data_test)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

integer ii;

initial
begin
reset_n=0; control=0;
#80; reset_n=1;
#20;
for (ii=0; ii<LENGTH; ii=ii+1) begin
parameters_test[DATA_WIDTH*ii +: DATA_WIDTH] = ii+1;
end
control=1;
#20; control=3; #80; control=2; inputs_test=5; #20; inputs_test=6; #20; inputs_test=7; #20; control=0; #20; control=3; #80;
end
endmodule