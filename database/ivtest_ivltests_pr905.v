// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This test is based on PR#905
 */
module bug();

initial begin
  $displayh("", 99);
  $displayo("", 99);
  $displayb("", 99);
end

endmodule // bug
