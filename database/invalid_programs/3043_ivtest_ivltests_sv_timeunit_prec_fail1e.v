// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Check a local timeprecision that is too large.
`resetall
module ltp_large;
  timeunit 1ns;
  timeprecision 10ns;
endmodule

