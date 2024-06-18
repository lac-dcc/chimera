// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

reg [7:0] array[3:0][3:0];

initial begin
  $dumpvars(0, array[0][0][0]);
end

endmodule
