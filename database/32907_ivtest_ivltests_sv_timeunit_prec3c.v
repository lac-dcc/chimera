// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// A global timeprecision and local time units.

timeprecision 10ps;

module gtp_ltu1;
  timeunit 1ns;
endmodule

module gtp_ltu2;
  timeunit 1us;
endmodule

`timescale 1s/1s
module check3;

initial begin
  $printtimescale(gtp_ltu1);
  $printtimescale(gtp_ltu2);
end

endmodule
