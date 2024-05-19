// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

typedef bit [3:0] array_t[];

array_t array;

initial begin
  array = 8'd1 << 4;
end

endmodule
