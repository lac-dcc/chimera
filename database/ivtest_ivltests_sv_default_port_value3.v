// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

reg [7:0] v;

module dut(input wire [7:0] i = v, output wire [7:0] o);

assign o = i;

endmodule

module tb();

wire [7:0] result;

dut dut(,result);

initial begin
  #1;
  if (result === 10)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
