// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module sub_module();

parameter Value1 = 0;

endmodule

module top_module();

integer Value2;

sub_module sub_module();

defparam sub_module.Value1 = Value2;

endmodule
