// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define MACRO(_param_,_def_) \
`ifdef _def_ \
module _param_ (); \
endmodule \
`endif

`MACRO(FOFO, CFG_FOFO)
