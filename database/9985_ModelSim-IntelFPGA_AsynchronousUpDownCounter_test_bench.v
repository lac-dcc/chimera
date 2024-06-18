// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

module TB_up_down_Counter();
wire [3:0]out; reg reset, clk, mode;

up_down triggeringStatement(out, reset, clk, mode);

initial
begin

//initialize inputs
reset = 1;
clk = 1;
mode = 0;

#100;

reset = 0;
mode = 0;

#100;

reset = 0;
mode = 1;

end

always #25 clk = ~clk;

endmodule
