// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

parameter MAXPERFOOCLK = 40000;
time fooclk_period;

initial
  #50 $display("max foo period( posedge FOOCLK:%0.3f", $time/1000.0, "ns, %0d", MAXPERFOOCLK, " : %0.3f", fooclk_period/1000.0, "ns );");

endmodule
