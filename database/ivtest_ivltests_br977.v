// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define DECLAREINT(name, i) integer name=i

module foo();

`DECLAREINT(bar, 2);

initial begin
  if (bar === 2)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
