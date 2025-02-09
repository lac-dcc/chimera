// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

// See LICENSE.SiFive for license details.

//VCS coverage exclude_file

// No default parameter values are intended, nor does IEEE 1800-2012 require them (clause A.2.4 param_assignment),
// but Incisive demands them. These default values should never be used.

`define SYNTHESIS

module plusarg_reader #(parameter FORMAT="borked=%d", DEFAULT=0) (
   output [31:0] out
);

`ifdef SYNTHESIS
assign out = DEFAULT;
`else
reg [31:0] myplus;
assign out = myplus;

// mask by daisy
//initial begin
//   if (!$value$plusargs(FORMAT, myplus)) myplus = DEFAULT;
//end

`endif

endmodule
