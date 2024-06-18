// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

`timescale 1ns/100ps
`define cycle_period 10
`define End_CYCLE  25

module test_tpu;
always #(`cycle_period/2) clock = ~clock;
initial begin
    clock = 1;
    reset = 1;
    #(`cycle_period*3.5) 
	reset = 0;
end
initial begin
  $dumpfile("tpu.vcd");
  $dumpvars(0,test_tpu);
end
initial begin
    #(`End_CYCLE*`cycle_period)
    $finish;
end
reg clock, reset;
top top0(
    .clock(clock),
    .reset(reset)
);
endmodule
