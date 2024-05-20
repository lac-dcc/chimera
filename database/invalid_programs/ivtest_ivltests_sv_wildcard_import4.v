// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

package my_package;

parameter  p1 = 1;
localparam p2 = 2;

typedef logic [1:0] word;

word v;

event e;

endpackage

module test();

import my_package::*;

word my_v;

initial begin
  @(e) v = p1 + p2;
end

parameter  p1 = 3;
localparam p2 = 4;

typedef logic [7:0] word;

word v;

event e;

endmodule
