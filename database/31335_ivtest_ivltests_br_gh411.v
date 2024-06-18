// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

function void do_nothing();
  ;
endfunction

initial begin
  do_nothing();
  $display("PASSED");
end

endmodule
