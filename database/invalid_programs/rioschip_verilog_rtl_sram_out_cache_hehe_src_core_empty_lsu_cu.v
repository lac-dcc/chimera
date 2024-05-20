// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef CU_V
`define CU_V
`include "../params.vh"
module cu (
    input clk,
    input rstn,
    // <> s2 reg
    input opcode_i,
    input [1:0] size_i,
    input [VIRTUAL_ADDR_LEN - 1 : 0] addr_i,
    input [XLEN - 1 : 0] store_data_i,
    input valid_i,
    input exception_valid_i,
    // <> dcache
    output req_valid_o,
    output req_opcode_o, // 0 for load, 1 for store
    output [1:0] req_size_o, 
    output [VIRTUAL_ADDR_LEN - 1 : 0] req_addr_o,
    output [XLEN - 1 : 0] req_data_o,
    input req_ready_i,
    
    input resp_valid_i,
    input [XLEN - 1 : 0]resp_data_i,
    output resp_ready_o,
    // <> prf
    output load_data_valid_o,
    output [XLEN - 1 : 0] load_data_o,
    // <> ROB
    output lsu_ready_o,
    output ls_done_o
);
    reg stall_flag;

    reg reg_valid;
    reg opcode;
    reg [1:0] size;
    reg [VIRTUAL_ADDR_LEN - 1 : 0] addr;
    reg [XLEN - 1 : 0] store_data;

    wire lock;
    wire unlock;
    assign lsu_ready_o = ((stall_flag) ? (unlock ? 1 : 0) : (lock ? 0 : 1)) && ~exception_valid_i;
    assign load_data_o = resp_data_i;
    assign load_data_valid_o = resp_valid_i;
    assign ls_done_o = ((opcode_i ? req_ready_i : resp_valid_i) & valid_i) |
                        exception_valid_i; // when exception happens, done immediately without operation
                        
    assign lock = (valid_i &&  ~req_ready_i) | (valid_i && (opcode_i == 0) && ~resp_valid_i);
    assign unlock = (valid_i && (opcode_i == 1) && req_ready_i) | (valid_i && (opcode_i == 0) && resp_valid_i);

    assign req_valid_o = valid_i & ~exception_valid_i;
    assign req_addr_o = addr_i;
    assign req_data_o = store_data_i;
    assign resp_ready_o = opcode_i; // FIXME: boldly written, need check later.
    assign req_opcode_o = opcode_i;
    assign req_size_o = size_i;
    
    always @(posedge clk) begin
        // $display("lsu_ready_o: %h", lsu_ready_o);
        // $display("stall_flag: %h", stall_flag);
        // $display("valid_i: %h", valid_i);
        // $display("lock: %h", lock);
        // $display("unlock: %h", unlock);
        // $display("opcode_i: %h", opcode_i);
        if(~rstn) begin
            stall_flag <= '0;
        end
        else begin
            if(~stall_flag) begin 
                stall_flag <= lock;
            end
            else begin
                stall_flag <= unlock;
            end
        end
    end
endmodule
`endif //CU_V
