// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

reg [7:0] memory[1:0];

reg index;

initial begin
  index = 0;
  memory[~index] = 1;
  if (memory[1] === 1)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
