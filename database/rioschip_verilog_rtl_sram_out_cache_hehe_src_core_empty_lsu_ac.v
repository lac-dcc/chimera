// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef AC_V
`define AC_V
`include "../params.vh"
/* verilator lint_off UNUSED */
module ac (
    input valid_i,
    input [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_i,
    input opcode_i,
    input [1:0] size_i,
    input [VIRTUAL_ADDR_LEN - 1 : 0] addr_i,

    output [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o,
    output exception_valid_o
);
    wire misalign_fault;
    wire access_fault;
    
    assign misalign_fault = 
        (size_i == 2'b01 && addr_i[0] != 0) || // hw
        (size_i == 2'b10 && addr_i[1:0] != 0) || // w
        (size_i == 2'b11 && addr_i[2:0] != 0); // dw
    assign access_fault = (rd_addr_i == '0);

    assign ecause_o = 
        access_fault ? (opcode_i ? EXCEPTION_STORE_ACCESS_FAULT : EXCEPTION_LOAD_ACCESS_FAULT) :
        misalign_fault ? (opcode_i ? EXCEPTION_STORE_ADDR_MISALIGNED : EXCEPTION_LOAD_ADDR_MISALIGNED) :
        0; 
    assign exception_valid_o = valid_i & 
                                (misalign_fault);
endmodule
/* verilator lint_on UNUSED */
`endif // AC_V
