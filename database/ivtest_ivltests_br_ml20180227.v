// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

string str;
reg [127:0] bitstr;

initial begin
  str = "hello";
  bitstr = str;
end

endmodule
