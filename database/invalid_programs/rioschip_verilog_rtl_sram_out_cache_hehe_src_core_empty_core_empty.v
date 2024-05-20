// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`include "params.vh"
module core_empty #(
    parameter XLEN = 64,
    parameter VIRTUAL_ADDR_LEN = 32,
    parameter EXCEPTION_CODE_WIDTH = 4
) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	
`endif
    input clk,
    input reset,
    
    // others ports
    output others_wb_cyc_o,
    output others_wb_stb_o,
    output others_wb_we_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] others_wb_adr_o,
    output [WB_DATA_LEN-1:0] others_wb_dat_o,
    output [WB_DATA_LEN/8-1:0] others_wb_sel_o,
    input  others_wb_ack_i,
    input  [WB_DATA_LEN -1:0] others_wb_dat_i,

    // Dcache interface
    output  dcache_req_valid_o,
    output dcache_opcode,
    output [VIRTUAL_ADDR_LEN-1:0] dcache_req_addr,
    output [2:0] dcache_type_o,  //4*2(s/u)
    output [XLEN-1:0] dcache_st_data_o,
    output dcache_resp_ready_o,
    input dcache2back_resp_valid_i,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] back2dcache_lsq_index_o,
    input [XLEN-1:0] dcache2back_resp_data_i, 
    input dcache_req_ready_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] dcache2back_rob_index_i,

    // Icache interface
    output icache_req_valid_o,
    input icache_req_ready_i,
    output [VIRTUAL_ADDR_LEN-1:0] icache_req_addr,
    output icache_resp_ready_o,
    input icache_resp_valid_i,
    input [31:0] icache_resp_address_i,
    input [31:0] insn_i,

    // CSR interupt controller
    input meip

);

wire [LSU_LSQ_SIZE_WIDTH - 1:0] back2dcache_lsq_index;
assign back2dcache_lsq_index_o = back2dcache_lsq_index;
wire back2dcache_req_valid;
assign dcache_req_valid_o = back2dcache_req_valid;
wire back2dcache_req_opcode;
assign dcache_opcode = back2dcache_req_opcode;
wire [VIRTUAL_ADDR_LEN-1:0] back2dcache_req_addr;
assign dcache_req_addr = back2dcache_req_addr;
wire [1:0] back2dcache_req_size;
wire back2dcache_req_sign;
assign dcache_type_o = {back2dcache_req_sign, back2dcache_req_size};
wire [XLEN-1:0] back2dcache_req_data; // lsu发给dcache要store 的data
assign dcache_st_data_o = back2dcache_req_data;
wire back2dcache_resp_reday;
assign dcache_resp_ready_o = back2dcache_resp_reday;
wire [LSU_LSQ_SIZE_WIDTH - 1:0] dcache2back_rob_index;
assign dcache2back_rob_index = dcache2back_rob_index_i;
// wire back2front_buff_nxt_pc_valid;
// wire back2front_instr_buff_nxt_pc;


//frontend<>backend
wire front2back_valid;
wire [3:0] front2back_ecause;
wire front2back_exception;
wire front2back_uses_rs1;
wire front2back_uses_rs2;  //标记是否使用，1 bit
wire  front2back_uses_rd;
wire front2back_uses_csr;
wire [VIRTUAL_ADDR_LEN-1:0] front2back_pc;
wire [VIRTUAL_ADDR_LEN-1:0] front2back_next_pc;
wire front2back_is_alu;
wire [1:0] front2back_alu_select_a;
wire [1:0] front2back_alu_select_b;
wire [2:0] front2back_cmp_function;
wire [IMM_LEN-1:0] front2back_imm_data;
wire front2back_half;
wire front2back_is_fence;
wire [2:0] front2back_alu_function;
wire front2back_alu_function_modifier;
wire front2back_branch;
wire front2back_jump;
wire front2back_load;
wire front2back_store;
wire [1:0] front2back_load_store_size;
wire front2back_load_signed;
wire [4:0] front2back_rs1_address;
wire [4:0] front2back_rs2_address;
wire [4:0] front2back_rd_address;
wire [CSR_ADDR_LEN-1:0] front2back_csr_address;
wire [XLEN-1:0] front2back_csr_data;
wire front2back_read;
wire front2back_write;
wire front2back_csr_readable;
wire front2back_csr_writeable;
wire front2back_wfi;
wire front2back_mret;
wire back2front_branch_valid;
//fetch<>back
wire back2front_btb_valid;
wire [VIRTUAL_ADDR_LEN-1:0] back2front_btb_pc;
wire [VIRTUAL_ADDR_LEN-1:0] back2front_btb_next_pc_o;
wire back2front_gshare_pred_valid;
wire back2front_gshare_taken;
wire [VIRTUAL_ADDR_LEN-1:0] back2front_gshare_pred_pc;
wire back2front_pc_valid;
wire [VIRTUAL_ADDR_LEN-1:0] back2front_pc;
wire [31:0] csr2front_trap_vector;
wire [31:0] csr2front_mret_vector;
wire [CSR_ADDR_LEN-1:0] front2csr_address;
wire front2back_is_csr = front2back_read | front2back_write; 
//todo:some bugs here!!!
// wire [EXCEPTION_CODE_WIDTH-1:0] front2exp_ecause;

wire back2exp_cm_valid;
wire back2exp_wfi;
wire back2exp_mret;
wire back2exp_exp_valid;
wire back2csr_wb_valid;
wire [XLEN-1:0] back2csr_wb_data;
wire [CSR_ADDR_LEN-1:0] back2csr_wb_addr;
wire [EXCEPTION_CODE_WIDTH-1:0] back2exp_cm_ecause;
wire front2back_rob_ready;
wire global_trapped;
wire global_wfi;
wire global_mret;
wire exp2back_wfi_ctrl;
assign exp2back_wfi_ctrl = global_wfi;
wire exp2back_trapped;
assign exp2back_trapped = global_trapped;
wire [VIRTUAL_ADDR_LEN-1:0] back2excp_pc;
wire csr2exp_eip;
wire csr2exp_tip;
wire csr2exp_sip;
wire exp2csr_retired;
wire [VIRTUAL_ADDR_LEN-1:0] exp2csr_ecp;
wire [EXCEPTION_CODE_WIDTH-1:0] exp2csr_ecause;
wire exp2csr_interupt;
// wire [31:0] exp2csr_data;
// wire [CSR_ADDR_LEN-1:0] exp2csr_address;
// wire exp2csr_write;
wire csr2front_writeable;
wire csr2front_readable;
wire [XLEN-1:0] csr2front_data;
wire back2csr_wr_valid;
assign back2csr_wr_valid = !global_trapped && back2csr_wb_valid;


frontend hehe_frontend(
    .clk(clk),
    .rstn(reset),
    .is_req_pc_i(back2front_btb_valid),
    .btb_req_pc_i(back2front_btb_pc),
    .btb_predict_target_i(back2front_btb_next_pc_o),
    //gshare from fu
    .prev_pc_i(back2front_gshare_pred_pc),
    .prev_branch_in_i(back2front_gshare_pred_valid),
    .prev_taken_i(back2front_gshare_taken),
    // from fu
    .valid_real_branch_i(back2front_pc_valid),
    .real_branch_i(back2front_pc),
    // from exception ctrl
    .trap(global_trapped),
    .mret(global_mret),
    .wfi(global_wfi),
    // from csr
    .trap_vector_i(csr2front_trap_vector),
    .mret_vector_i(csr2front_mret_vector),
    //from icache 
    .icache_ready_i(icache_req_ready_i),
    .icache_valid_i(icache_resp_valid_i),
    .fetch_data_i(insn_i),
    .icache_resp_address_i(icache_resp_address_i),
    // to icache
    .ready_icache_request_o(icache_resp_ready_o),
    .fetch_address_o(icache_req_addr),
    .valid_give_icache_o(icache_req_valid_o),
    // // exceptions
    // .exception_valid_o(front2back_exception),
    // .ecause_o(front2back_ecause),
    ////////////////////////////////////////////////////////////////////////////////////////
    //<>decode
    // from rob
    .ready_in_i(front2back_rob_ready),
    //from fu_i(), maybe fu todo
    .branch_back_i(back2front_branch_valid),
    // to csr todo
    .csr_address_o(front2csr_address),
    // from csr
    .csr_data_i(csr2front_data),
    .csr_readable_i(csr2front_readable),
    .csr_writeable_i(csr2front_writeable),
    // to rob
    .uses_rs1_o(front2back_uses_rs1),
    .uses_rs2_o(front2back_uses_rs2),
    .uses_rd_o(front2back_uses_rd),
    .uses_csr_o(front2back_uses_csr),
    .d_pc_out_o(front2back_pc),
    .d_next_pc_out_o(front2back_next_pc),
    .rd1_address_out_o(front2back_rs1_address),
    .rd2_address_out_o(front2back_rs2_address),
    .rd_address_out_o(front2back_rd_address),
    .csr_address_out_o(front2back_csr_address),
    .mret_out_o(front2back_mret),
    .wfi_out_o(front2back_wfi),
    .ecause_out_o(front2back_ecause),  //from decode
    .exception_out_o(front2back_exception),  //64 alu addition
    .half_o(front2back_half),
    .is_fence_o(front2back_is_fence),
    // .is_csr_o(front2back_is_csr),
    //to rob (control)
    .valid_out_o(front2back_valid),
    // to rob (csr)
    .csr_read_out_o(front2back_read),
    .csr_write_out_o(front2back_write),
    .csr_readable_out_o(front2back_csr_readable),
    .csr_writeable_out_o(front2back_csr_writeable),
    // to rob (alu)
    .csr_data_out_o(front2back_csr_data),
    .imm_data_out_o(front2back_imm_data),
    .alu_function_out_o(front2back_alu_function),
    .alu_function_modifier_out_o(front2back_alu_function_modifier),
    .alu_select_a_out_o(front2back_alu_select_a),
    .alu_select_b_out_o(front2back_alu_select_b),
    .cmp_function_out_o(front2back_cmp_function),
    // to rob (branch)
    .jump_out_o(front2back_jump),
    .branch_out_o(front2back_branch),
    // to rob (lsu)
    .is_alu_out_o(front2back_is_alu),
    .load_out_o(front2back_load),
    .store_out_o(front2back_store),
    .load_store_size_out_o(front2back_load_store_size),
    .load_signed_out_o(front2back_load_signed)
);

backend hehe_backend(
    // global
    .clk(clk),
    .rstn(reset),

    //related to excp
    .wfi_ctrl_in(exp2back_wfi_ctrl),
    .trapped(exp2back_trapped),
    .mret_ctrl(global_mret),
    .commit_valid_o(back2exp_cm_valid),
    .wfi_o(back2exp_wfi),
    .mret_o(back2exp_mret),
    .exception_valid_o(back2exp_exp_valid),
    .csr_pc_o(back2excp_pc),
    .ecause_o(back2exp_cm_ecause),

    //related to decode
    .rob_ready_out(front2back_rob_ready),
    .valid_i(front2back_valid),
    .ecause_i(front2back_ecause),
    .exception_i(front2back_exception),
    .wfi_i(front2back_wfi),
    .mret_i(front2back_mret),
    .uses_rs1_i(front2back_uses_rs1),
    .uses_rs2_i(front2back_uses_rs2),
    .uses_csr_i(front2back_uses_csr),
    .uses_rd_i(front2back_uses_rd),
    .pc_i(front2back_pc),
    .next_pc_i(front2back_next_pc),
    .is_alu_i(front2back_is_alu),
    .deco_alu_select_a_i(front2back_alu_select_a),
    .deco_alu_select_b_i(front2back_alu_select_b),
    .cmp_function_i(front2back_cmp_function),
    .imm_data_i(front2back_imm_data),
    .half_i(front2back_half),
    .is_fence_i(front2back_is_fence),
    .alu_function_i(front2back_alu_function),
    .alu_function_modifier_i(front2back_alu_function_modifier),
    .branch_i(front2back_branch),
    .jump_i(front2back_jump),
        //<decode> lsu
    .load_i(front2back_load),
    .store_i(front2back_store),
    .load_store_size_i(front2back_load_store_size),
    .load_signed_i(front2back_load_signed),
    .rs1_address_i(front2back_rs1_address),
    .rs2_address_i(front2back_rs2_address),
    .rd_address_i(front2back_rd_address),
        // <decode> csr
    .is_csr_i(front2back_is_csr),
    .csr_address_i(front2back_csr_address),
    .csr_data_i(front2back_csr_data),
    .csr_read_i(front2back_read),
    .csr_write_i(front2back_write),
    .csr_readable_i(front2back_csr_readable),
    .csr_writeable_i(front2back_csr_writeable),

    //related to csr.v
    .csr_wb_valid_o(back2csr_wb_valid),
    .csr_wb_data_o(back2csr_wb_data),
    .csr_wb_addr_o(back2csr_wb_addr),

    //to btb
    .btb_valid_o(back2front_btb_valid),
    .btb_pc_o(back2front_btb_pc),
    .btb_next_pc_o(back2front_btb_next_pc_o),
    //to gshare
    .gshare_pred_valid_o(back2front_gshare_pred_valid),
    .gshare_pred_taken_o(back2front_gshare_taken),
    .gshare_pred_pc_o(back2front_gshare_pred_pc),
    //to pc_gen
    .pc_valid_o(back2front_pc_valid),
    .pc_o(back2front_pc),
    //to decode 
    .branch_done(back2front_branch_valid),
    //dcache
    .req_valid_o(back2dcache_req_valid),
    .req_opcode_o(back2dcache_req_opcode), 
    .req_size_o(back2dcache_req_size), 
    .req_sign_o(back2dcache_req_sign),
    .req_lsq_index_o(back2dcache_lsq_index),
    .req_addr_o(back2dcache_req_addr),
    .req_data_o(back2dcache_req_data), // lsu发给dcache要store 的data
    .req_ready_i(dcache_req_ready_i),
    .resp_valid_i(dcache2back_resp_valid_i),
    .resp_data_i(dcache2back_resp_data_i), 
    .resp_ready_o(back2dcache_resp_reday),
    .resp_lsq_index_i(dcache2back_rob_index),

    // <> bus
    .wb_cyc_o(others_wb_cyc_o),
    .wb_stb_o(others_wb_stb_o),
    .wb_we_o(others_wb_we_o),
    .wb_adr_o(others_wb_adr_o),
    .wb_dat_o(others_wb_dat_o),
    .wb_sel_o(others_wb_sel_o),
    .wb_ack_i(others_wb_ack_i),
    .wb_dat_i(others_wb_dat_i)
    
);

excep_ctrl hehe_excp(
    //from rob
    .rob_commit_valid(back2exp_cm_valid),
    .rob_cm_exp_pc(back2excp_pc),   //? 
    .rob_cm_mret(back2exp_mret),
    .rob_cm_wfi(back2exp_wfi),
    .rob_cm_ecause(back2exp_cm_ecause), //?
    .rob_cm_exp(back2exp_exp_valid),

    // from csr
    .sip(csr2exp_sip),
    .tip(csr2exp_tip),
    .eip(csr2exp_eip),

    // control pipeline signal
    .trapped(global_trapped),
    .mret(global_mret),   //?
    .wfi(global_wfi),

    // to csr
    .retired(exp2csr_retired),
    .ecp(exp2csr_ecp),
    .ecause(exp2csr_ecause),
    .interupt(exp2csr_interupt)
);

csr hehe_csr(
    .clk(clk),
    .reset(reset),
    .meip(meip),
    .read_address(front2csr_address),
    .read_data(csr2front_data),
    .readable(csr2front_readable),
    .writeable(csr2front_writeable),
    .write_enable(back2csr_wr_valid),
    .write_address(back2csr_wb_addr),
    .write_data(back2csr_wb_data),

    //from excption
    .retired(exp2csr_retired),
    .traped(global_trapped),
    .mret(global_mret),
    .ecp(exp2csr_ecp),
    .trap_cause(exp2csr_ecause),
    .interupt(exp2csr_interupt),

    //to exception
    .eip(csr2exp_eip),
    .tip(csr2exp_tip),
    .sip(csr2exp_sip),

    .trap_vector(csr2front_trap_vector),
    .mret_vector(csr2front_mret_vector)

    //.csr_wb_valid(back2csr_wb_valid)
);

endmodule
