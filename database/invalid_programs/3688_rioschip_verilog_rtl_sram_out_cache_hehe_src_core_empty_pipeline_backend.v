// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

//gpc改一下backend哈，参照着core_empty改
`ifndef BACKEND_V
`define BACKEND_V

`include "../params.vh"

module backend (
    // global
    input clk,
    input rstn,

    //related to excp.v
    input wfi_ctrl_in,  //rcu里缺逻辑20220825
    input trapped,
    input mret_ctrl,
    output [PC_WIDTH - 1 : 0] csr_pc_o, 
    output commit_valid_o,
    output mret_o,
    output wfi_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o,
    output exception_valid_o,

    // decode
    output rob_ready_out, // to decode
    input valid_i,
    input [3:0] ecause_i,
    input exception_i,
    input wfi_i,
    input mret_i,
        // rs valid
    input uses_rs1_i,
    input uses_rs2_i,
    input uses_csr_i,
        // rd valid
    input uses_rd_i,// remaining input uses_rd,
        //rob op
    input [PC_WIDTH-1:0] pc_i, //PC_WIDTH = 32
    input [PC_WIDTH-1:0] next_pc_i,
    input is_alu_i, //to choose which pipe of function unit
            //alu
    input [1:0] deco_alu_select_a_i,
    input [1:0] deco_alu_select_b_i,
    input [2:0] cmp_function_i,
    input [IMM_LEN - 1:0] imm_data_i,
    input half_i,
    input is_fence_i,
    input [2:0] alu_function_i,
    input alu_function_modifier_i,
    input branch_i,
    input jump_i,
            //lsu
    input load_i,
    input store_i,
    input [1:0] load_store_size_i,
    input load_signed_i,
        // rs address
    input [VIR_REG_ADDR_WIDTH - 1:0] rs1_address_i,
    input [VIR_REG_ADDR_WIDTH - 1:0] rs2_address_i,
    input [VIR_REG_ADDR_WIDTH - 1:0] rd_address_i,
        // <decode> csr
    input is_csr_i,
    input [CSR_ADDR_LEN - 1:0] csr_address_i,
    input [XLEN - 1:0] csr_data_i,
    input csr_read_i,
    input csr_write_i,
    input csr_readable_i,
    input csr_writeable_i,

    // related to csr.v
    output csr_wb_valid_o,
    output [CSR_ADDR_LEN - 1:0]  csr_wb_addr_o,
    output [XLEN - 1 : 0] csr_wb_data_o,
   
    // btb
    output btb_valid_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] btb_pc_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] btb_next_pc_o,
    // gshare
    output gshare_pred_valid_o,
    output gshare_pred_taken_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] gshare_pred_pc_o, // 当前这条指令的pc
    // pc_gen
    output pc_valid_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0]pc_o,
    // // instr_buff
    // output instr_buff_nxt_pc_valid_o,
    // output [VIRTUAL_ADDR_LEN - 1 : 0] instr_buff_nxt_pc_o,
    // <> decode 
    output branch_done,
    // <> dcache
    output req_valid_o,
    output req_opcode_o, // 0 for load, 1 for store
    output req_sign_o,
    // output [ROB_INDEX_WIDTH - 1 : 0] req_rob_index_o,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] req_lsq_index_o,
    output [1:0] req_size_o, 
    output [VIRTUAL_ADDR_LEN - 1 : 0] req_addr_o,
    output [XLEN - 1 : 0] req_data_o,
    input req_ready_i,
    input resp_valid_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] resp_lsq_index_i,
    input [XLEN - 1 : 0]resp_data_i,
    output resp_ready_o,


    output wb_cyc_o,
    output wb_stb_o,
    output wb_we_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] wb_adr_o,
    output [WB_DATA_LEN-1:0] wb_dat_o,
    output [WB_DATA_LEN/8-1:0] wb_sel_o,
    input  wb_ack_i,
    input  [WB_DATA_LEN -1:0] wb_dat_i

);
// wire func_wrb_valid; //may both alu and lsu finish their work and write back simultanously
// wire [63:0] func_wrb_rd_data;
// wire [PHY_REG_ADDR_WIDTH-1:0] func_wrb_rd_address;
// wire [ROB_INDEX_WIDTH-1:0] func_wrb_rob_line;

/*verilator lint_off UNUSED */
wire func_load_store_ready;
wire func_alu_ready;

wire [67:0] iss_rob_op_basic;
wire [4:0] iss_rob_op_lsu;
wire [44:0] iss_rob_op_alu;
wire [79:0] iss_rob_op_csr;
wire [3:0] iss_rob_op_bran_exp;
wire rob_iss_valid;
wire [ROB_INDEX_WIDTH - 1 : 0] iss_rob_line;
wire [63:0] phyreg_rs1_data_out;
wire [63:0] phyreg_rs2_data_out;

wire [PHY_REG_ADDR_WIDTH - 1 : 0] prd_address_out;

// lsu => rob
wire lsu_ready_o;
wire lsu_done_o; 
wire [ROB_INDEX_WIDTH-1:0] lsu_wb_rob_index_o;
wire lsu_exception_valid_o;
wire alu_exception_valid_o;
wire [EXCEPTION_CODE_WIDTH - 1 : 0] lsu_ecause_o;
wire [EXCEPTION_CODE_WIDTH - 1 : 0] alu_ecause_o;
// lsu => prf
wire lsu_wb_valid_o;
wire [PHY_REG_ADDR_WIDTH-1:0] lsu_wb_rd_addr_o;
wire [XLEN - 1 : 0] lsu_wb_data_o;
// lsu/alu => rob/prf
wire alu_ready_o;
wire alu_done_o;
wire [ROB_INDEX_WIDTH-1:0] alu_wb_rob_index_o;
wire alu_wb_valid_o;
wire [PHY_REG_ADDR_WIDTH-1:0] alu_wb_rd_addr_o;
wire [XLEN - 1 : 0] alu_wb_data_o;

wire uses_rs1;
wire uses_rs2;
wire uses_csr;
wire uses_rd;// remaining wire uses_rd,
wire [PC_WIDTH-1:0] pc_in;
wire [PC_WIDTH-1:0] next_pc_in;
wire is_alu; //to choose which pipe of function unit
wire [1:0] deco_alu_select_a_in;
wire [1:0] deco_alu_select_b_in;
wire [2:0] cmp_function_in;
wire [31:0] imm_data_in;
wire half;
wire [2:0] alu_function_in;
wire alu_function_modifier_in;
wire branch_in;
wire jump_in;
wire load_in;
wire store_in;
wire [1:0] load_store_size_in;
wire load_signed_in;
wire [4:0] rs1_address;
wire [4:0] rs2_address;
wire [4:0] rd_address;
wire [11:0] csr_address_in;
wire [63:0] csr_data_in;
wire csr_read_in;
wire csr_write_in;
wire csr_readable_in;
wire csr_writeable_in;
wire [3:0] ecause_in;
wire exception_in;
wire wfi_in;
wire mret_in;

assign {pc_in, next_pc_in, uses_rs1, uses_rs2, uses_rd, uses_csr} = iss_rob_op_basic;
assign {load_in, store_in, load_store_size_in, load_signed_in} = iss_rob_op_lsu;
assign {imm_data_in, is_alu, deco_alu_select_a_in, deco_alu_select_b_in, cmp_function_in, 
                    alu_function_in, alu_function_modifier_in, half} = iss_rob_op_alu;
assign {csr_data_in, csr_address_in, csr_read_in, csr_write_in, 
                csr_readable_in, csr_writeable_in} = iss_rob_op_csr;
assign {branch_in, jump_in, wfi_in, mret_in} = iss_rob_op_bran_exp;

rcu backend_rcu(
    //input
    .clk(clk),
    .reset(rstn),
    .wfi_ctrl_in(wfi_ctrl_in),
    .trapped(trapped),
    .mret_ctrl(mret_ctrl),
    //from decode
    .valid_in(valid_i),
    .ecause_in(ecause_i),
    .exception_in(exception_i),
        // rs valid
    .uses_rs1(uses_rs1_i),
    .uses_rs2(uses_rs2_i),
    .uses_csr(uses_csr_i),
        // rd valid
    .uses_rd(uses_rd_i),// remaining input uses_rd,
        //rob op
    .pc_in(pc_i),
    .next_pc_in(next_pc_i),
    .is_alu(is_alu_i), //to choose which pipe of function unit
            //alu
    .deco_alu_select_a_in(deco_alu_select_a_i),
    .deco_alu_select_b_in(deco_alu_select_b_i),
    .cmp_function_in(cmp_function_i),
    .imm_data_in(imm_data_i),
    .half(half_i),
    .is_fence(is_fence_i),
  //input [63:0] csr_data_in,
    .alu_function_in(alu_function_i),
    .alu_function_modifier_in(alu_function_modifier_i),
    .branch_in(branch_i),
    .jump_in(jump_i),
            //lsu
    .load_in(load_i),
    .store_in(store_i),
    .load_store_size_in(load_store_size_i),
    .load_signed_in(load_signed_i),
        // rs address
    .rs1_address_in(rs1_address_i),
    .rs2_address_in(rs2_address_i),
    .rd_address_in(rd_address_i),
        // to csr
    .csr_address_in(csr_address_i),
    .csr_data_in(csr_data_i),
    .csr_read_in(csr_read_i),
    .csr_write_in(csr_write_i),
    .csr_readable_in(csr_readable_i),
    .csr_writeable_in(csr_writeable_i),
    
    .wfi_in(wfi_i),
    .mret_in(mret_i),
    //from FU
        //function unit finish signal
    .func_wrb_alu_done(alu_done_o), 
    .func_wrb_lsu_done(lsu_done_o),
    .func_wrb_valid_alu(alu_wb_valid_o), //may both alu and lsu finish their work and write back simultanously
    .func_wrb_valid_lsu(lsu_wb_valid_o), 
    .func_wrb_rd_data_alu(alu_wb_data_o),
    .func_wrb_rd_data_lsu(lsu_wb_data_o),
    .func_wrb_rd_address_lsu(lsu_wb_rd_addr_o),
    .func_wrb_rd_address_alu(alu_wb_rd_addr_o),
    .func_wrb_rob_line_alu(alu_wb_rob_index_o),
    .func_wrb_rob_line_lsu(lsu_wb_rob_index_o),
    .func_wrb_rob_alu_exp(alu_exception_valid_o),   //exception hanlder
    .func_wrb_rob_lsu_exp(lsu_exception_valid_o),
    .func_wrb_rob_alu_ecause(alu_ecause_o),
    .func_wrb_rob_lsu_ecause(lsu_ecause_o),
    .func_load_store_ready(lsu_ready_o),
    .func_alu_ready(alu_ready_o),
    //output
    //to decode for handshake
    .rob_ready_out(rob_ready_out),
    //output
    //when issue
    .iss_rob_op_basic(iss_rob_op_basic),
    .iss_rob_op_lsu(iss_rob_op_lsu),
    .iss_rob_op_alu(iss_rob_op_alu),
    .iss_rob_op_csr(iss_rob_op_csr),
    .iss_rob_op_bran_exp(iss_rob_op_bran_exp),
    .rob_iss_valid(rob_iss_valid),
    .iss_rob_line(iss_rob_line), 
        //to FU
    .phyreg_rs1_data_out(phyreg_rs1_data_out),
    .phyreg_rs2_data_out(phyreg_rs2_data_out),
    .prd_address_out(prd_address_out),
        //for exception
    .rob_commit_valid(commit_valid_o),
    .rob_cm_mret(mret_o),
    .rob_cm_wfi(wfi_o),
    .rob_cm_exp(exception_valid_o),
    .rob_cm_ecause(ecause_o),
    .rob_cm_exp_pc(csr_pc_o)
);

new_fu backend_new_fu(
    // global
    .clk(clk),
    .rstn(rstn),
    .stall(wfi_ctrl_in),
    .flush(trapped),

    // <> RCU
    .rs1_data_i(phyreg_rs1_data_out),
    .rs2_data_i(phyreg_rs2_data_out),
    .rob_index_i(iss_rob_line),
    .rd_addr_i(prd_address_out),
    .branch_i(branch_in), // if branch or jump, set 1
    .jump_i(jump_in), // if jump, set 1
    .issue_valid_i(rob_iss_valid),
    // alu & cmp
    .is_alu_i(is_alu),
    // .is_cmp_i,  //no need because cmp_out is used by branch instr 
    .half_i(half),
    .pc_i(pc_in),
    .next_pc_i(next_pc_in), // for jal to wb
    .alu_select_a_i(deco_alu_select_a_in),
    .alu_select_b_i(deco_alu_select_b_in),
    .imm_data_i(imm_data_in),
    .alu_function_i(alu_function_in),
    .cmp_function_i(cmp_function_in), 
    .alu_function_modifier_i(alu_function_modifier_in),
    // csr
    .is_csr_i(is_csr_i),
    .csr_address_i(csr_address_in),
    .csr_data_i(csr_data_in),
    .csr_read_i(csr_read_in),
    .csr_write_i(csr_write_in),
    .csr_readable_i(csr_readable_in),
    .csr_writeable_i(csr_writeable_in),
    .csr_wb_valid_o(csr_wb_valid_o),
    .csr_wb_addr_o(csr_wb_addr_o),
    .csr_wb_data_o(csr_wb_data_o),
    // lsu
    .load_i(load_in),
    .store_i(store_in),
    .load_store_size_i(load_store_size_in),
    .load_signed_i(load_signed_in),
    .is_load_store_i(load_in | store_in), //FIXME: redundance
    // lsu => rob
    .lsu_ready_o(lsu_ready_o),
    .lsu_done_o(lsu_done_o),  
    .lsu_wb_rob_index_o(lsu_wb_rob_index_o),
    .lsu_exception_valid_o(lsu_exception_valid_o),
    .lsu_ecause_o(lsu_ecause_o),
    .lsu_wb_valid_o(lsu_wb_valid_o), 
    .lsu_wb_rd_addr_o(lsu_wb_rd_addr_o),
    .lsu_wb_data_o(lsu_wb_data_o),
    // alu => rob/prf
    .alu_ready_o(alu_ready_o),
    .alu_done_o(alu_done_o),  
    .alu_wb_rob_index_o(alu_wb_rob_index_o),
    .alu_wb_valid_o(alu_wb_valid_o), 
    .alu_wb_rd_addr_o(alu_wb_rd_addr_o),
    .alu_wb_data_o(alu_wb_data_o),
    .alu_exception_valid_o(alu_exception_valid_o),
    .alu_ecause_o(alu_ecause_o),

    // <> btb
    .btb_valid_o(btb_valid_o),
    .btb_pc_o(btb_pc_o),
    .btb_next_pc_o(btb_next_pc_o),

    // <> gshare
    .gshare_pred_valid_o(gshare_pred_valid_o),
    .gshare_pred_taken_o(gshare_pred_taken_o),
    .gshare_pred_pc_o(gshare_pred_pc_o),

    // <> pc_gen
    .pc_valid_o(pc_valid_o),
    .pc_o(pc_o),

    // // <> instr_buff
    // .instr_buff_nxt_pc_valid_o(instr_buff_nxt_pc_valid_o),
    // .instr_buff_nxt_pc_o(instr_buff_nxt_pc_o),

    // decode 
    .branch_done(branch_done),

    
    // <> dcache
    .req_valid_o(req_valid_o),
    .req_opcode_o(req_opcode_o), // 0 for load, 1 for store
    .req_size_o(req_size_o), 
    .req_sign_o(req_sign_o),
    .req_addr_o(req_addr_o),
    // .req_rob_index_o(req_rob_index_o),
    .req_lsq_index_o(req_lsq_index_o),
    .req_data_o(req_data_o),
    .req_ready_i(req_ready_i),
    .resp_valid_i(resp_valid_i),
    .resp_lsq_index_i(resp_lsq_index_i),
    .resp_data_i(resp_data_i),
    .resp_ready_o(resp_ready_o),

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
/*verilator lint_on UNUSED */
`endif // BACKEND_V
