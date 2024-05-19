// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef NBLSU_V
`define NBLSU_V
`include "../params.vh"
module nblsu (
    // global input 
    input clk,
    input rstn,
    // input stall,
    input flush,

    // <> PRF
    input [XLEN - 1 : 0] rs1_data_i,
    input [XLEN - 1 : 0] rs2_data_i,
    output load_data_valid_o,
    output [XLEN - 1 : 0] load_data_o,
    output [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_o,

    // lsu <> ROB
    input valid_i,
    input [ROB_INDEX_WIDTH - 1 : 0] rob_index_i, 
    input [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_i,
    input [XLEN - 1 : 0] imm_i,
    input opcode_i,
    input [1:0] size_i,
    input load_sign_i,
    output [ROB_INDEX_WIDTH - 1 : 0] rob_index_o,
    output ls_done_o,
    output lsu_ready_o,
    output exception_valid_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o,

     // lsu <> dcache
    input req_ready_i,

    output req_valid_o,
    output req_opcode_o, // 0 for load, 1 for store
    output req_sign_o,
    output [1:0] req_size_o, 
    output [VIRTUAL_ADDR_LEN - 1 : 0] req_addr_o,
    output [XLEN - 1 : 0] req_data_o,
    // output [ROB_INDEX_WIDTH - 1 : 0] req_rob_index_o,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] req_lsq_index_o,
// `ifdef LSU_SELFCHECK
//     // debug
//     output [LSU_LSQ_SIZE_WIDTH - 1 : 0] head_o,
//     output [LSU_LSQ_SIZE_WIDTH - 1 : 0] tail_o,
//     output [LSU_LSQ_SIZE_WIDTH - 1 : 0] req_pt_o,
// `endif // LSU_SELFCHECK

    input resp_valid_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] resp_lsq_index_i,
    input [XLEN - 1 : 0]resp_data_i,

    output resp_ready_o,

    output exception_valid_forward_o,

    // wishbone bus
    output wb_cyc_o,
    output wb_stb_o,
    output wb_we_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] wb_adr_o,
    output [WB_DATA_LEN-1:0] wb_dat_o,
    output [WB_DATA_LEN/8-1:0] wb_sel_o,
    input  wb_ack_i,
    input  [WB_DATA_LEN -1:0] wb_dat_i
);
// S1 
wire [VIRTUAL_ADDR_LEN - 1 : 0] s1_address;
wire [EXCEPTION_CODE_WIDTH - 1 : 0] s1_ecause;
wire s1_exception_valid;

assign exception_valid_forward_o = s1_exception_valid; //FIXME: need to solve this, add reg in fu

agu lsu_agu(
    .base_i(rs1_data_i),
    .offset_i(imm_i),
    .addr_o(s1_address)
);

ac lsu_ac(
    .valid_i(valid_i),
    .rd_addr_i(rd_addr_i),
    .opcode_i(opcode_i),
    .size_i(size_i),
    .addr_i(s1_address),

    .exception_valid_o(s1_exception_valid),
    .ecause_o(s1_ecause)
);
wire lsq_req_ready;
wire lsq_req_valid;
wire lsq_req_opcode; // 0 for load, 1 for store
wire lsq_req_sign;
wire [1:0] lsq_req_size; 
wire [VIRTUAL_ADDR_LEN - 1 : 0] lsq_req_addr;
wire [XLEN - 1 : 0] lsq_req_data;
wire [LSU_LSQ_SIZE_WIDTH - 1: 0] lsq_req_lsq_index;

wire lsq_resp_valid;
wire [LSU_LSQ_SIZE_WIDTH - 1: 0] lsq_resp_lsq_index;
wire [XLEN - 1 : 0]lsq_resp_data;
wire lsq_resp_ready;             

lsq nblsu_lsq(
    .clk(clk),
    .rstn(rstn),
    .flush(flush),
    // <> s0 
    .address_i(s1_address),
    .rob_index_i(rob_index_i),
    .rs2_data_i(rs2_data_i),
    .opcode_i(opcode_i),
    .size_i(size_i),
    .load_sign_i(~load_sign_i),
    .valid_i(valid_i),
    .rd_addr_i(rd_addr_i),
    .ecause_i(s1_ecause),
    .exception_valid_i(s1_exception_valid),

    // <> rob 
    .load_data_valid_o(load_data_valid_o),
    .load_data_o(load_data_o),
    .rd_addr_o(rd_addr_o),
    .rob_index_o(rob_index_o),
    .ls_done_o(ls_done_o),
    .lsu_ready_o(lsu_ready_o),
    .exception_valid_o(exception_valid_o),
    .ecause_o(ecause_o),

    // lsu <> dcache
    .req_ready_i(lsq_req_ready),
    .req_valid_o(lsq_req_valid),
    .req_opcode_o(lsq_req_opcode), // 0 for load, 1 for store
    .req_sign_o(lsq_req_sign),
    .req_size_o(lsq_req_size), 
    .req_addr_o(lsq_req_addr),
    .req_data_o(lsq_req_data),
    // .req_rob_index_o(req_rob_index_o),
    .req_lsq_index_o(lsq_req_lsq_index),
// `ifdef LSU_SELFCHECK
//     .head_o(head_o),
//     .tail_o(tail_o),
//     .req_pt_o(req_pt_o),
// `endif // LSU_SELFCHECK
    // debug
    

    .resp_valid_i(lsq_resp_valid),
    .resp_lsq_index_i(lsq_resp_lsq_index),
    .resp_data_i(lsq_resp_data),
    .resp_ready_o(lsq_resp_ready)
);

lr nblsu_lr(
    .clk(clk), 
    .rstn(rstn), 
    .flush(flush),
    // <> lsq
    .lsq_req_ready_o(lsq_req_ready),
    .lsq_req_valid_i(lsq_req_valid),
    .lsq_req_opcode_i(lsq_req_opcode), // 0 for load, 1 for store
    .lsq_req_sign_i(lsq_req_sign),
    .lsq_req_size_i(lsq_req_size), 
    .lsq_req_addr_i(lsq_req_addr),
    .lsq_req_data_i(lsq_req_data),
    .lsq_req_lsq_index_i(lsq_req_lsq_index),

    .lsq_resp_valid_o(lsq_resp_valid),
    .lsq_resp_lsq_index_o(lsq_resp_lsq_index),
    .lsq_resp_data_o(lsq_resp_data),
    .lsq_resp_ready_i(lsq_resp_ready),
    // <> dcache
    .dcache_req_ready_i(req_ready_i),
    .dcache_req_valid_o(req_valid_o),
    .dcache_req_opcode_o(req_opcode_o), // 0 for load, 1 for store
    .dcache_req_sign_o(req_sign_o),
    .dcache_req_size_o(req_size_o), 
    .dcache_req_addr_o(req_addr_o),
    .dcache_req_data_o(req_data_o),
    .dcache_req_lsq_index_o(req_lsq_index_o),

    .dcache_resp_valid_i(resp_valid_i),
    .dcache_resp_lsq_index_i(resp_lsq_index_i),
    .dcache_resp_data_i(resp_data_i),
    .dcache_resp_ready_o(resp_ready_o),


    // <> bus
    .wb_cyc_o(wb_cyc_o),
    .wb_stb_o(wb_stb_o),
    .wb_we_o(wb_we_o),
    .wb_adr_o(wb_adr_o),
    .wb_dat_o(wb_dat_o),
    .wb_sel_o(wb_sel_o),
    .wb_ack_i(wb_ack_i),
    .wb_dat_i(wb_dat_i)
);

endmodule
`endif // NBLSU_V
