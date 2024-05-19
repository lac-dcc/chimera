// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`timescale 1 ns / 1 ns

module ROM_topTestBench();

reg clk,rst, display_on, fifofull;

ROM_top DUT(.clk(clk),.rst(~rst),.display_on(display_on),.fifofull(fifofull));

always #5 clk=~clk;

initial begin
clk=0;
rst=0;
display_on=1;
fifofull=0;
#10
rst=1;
display_on=1;
#10;
display_on=0;
end
endmodule