// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

time t1;

initial begin
  t1 = 1000;
  $display("%0d", t1 + 1000 - 500);
end

endmodule
