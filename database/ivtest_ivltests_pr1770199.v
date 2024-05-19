// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire net;

  assign (pull1, strong0) net = 1'b1;

  initial begin
    #1;
// You can get the correct result by uncommenting the following line.
//    $display("The value is: %b.", net);
    $display("The strength is: %v:", net);
  end
endmodule
