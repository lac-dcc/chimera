// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef AGU_V
`define AGU_V
`include "../params.vh"
/*verilator lint_off UNUSED */
module agu (

    input [XLEN - 1 : 0] base_i,
    input [XLEN - 1 : 0] offset_i,

    output [VIRTUAL_ADDR_LEN - 1 : 0] addr_o
);
    assign addr_o = base_i[VIRTUAL_ADDR_LEN - 1 : 0] + offset_i[VIRTUAL_ADDR_LEN - 1 : 0];
endmodule
/*verilator lint_on UNUSED */
`endif // AGU_V
