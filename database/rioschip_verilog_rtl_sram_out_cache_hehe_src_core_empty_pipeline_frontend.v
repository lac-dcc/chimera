// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef FRONTEND_V
`define FRONTEND_V

`include "../params.vh"
//lint pass
module frontend (
    // global
    input clk,
    input rstn,

    //<>fetch 
    input is_req_pc_i,
    input [31:0] btb_req_pc_i,
    input [31:0] btb_predict_target_i,

    //gshare from fu
    input [31:0] prev_pc_i,
    input prev_branch_in_i,
    input prev_taken_i,

    // from fu
    input valid_real_branch_i,
    input [31:0] real_branch_i,

    // from csr
    input [31:0] trap_vector_i,
    input [31:0] mret_vector_i,

    // from exception ctrl
    input trap,
    input mret,
    input wfi,
    
    //from icache 
    input icache_ready_i,    //req
    input icache_valid_i,    //resp
    input [31:0] fetch_data_i,
    input [31:0] icache_resp_address_i,
    
    // to icache
    output ready_icache_request_o,
    output [31:0] fetch_address_o,
    output reg valid_give_icache_o,
 

    ////////////////////////////////////////////////////////////////////////////////////////
    //<>decode
    // from rob
    input ready_in_i,

    //from fu_i, maybe fu todo
    input branch_back_i,

    // to csr
    output [11:0] csr_address_o,

    // from csr
    input [63:0] csr_data_i,
    input csr_readable_i,
    input csr_writeable_i,

    // to rob
    output reg uses_rs1_o,
    output reg uses_rs2_o,
    output reg uses_rd_o,
    output reg uses_csr_o,
    output reg [31:0] d_pc_out_o,
    output reg [31:0] d_next_pc_out_o,
    output reg [4:0] rd1_address_out_o,
    output reg [4:0] rd2_address_out_o,
    output reg [4:0] rd_address_out_o,
    output reg [11:0] csr_address_out_o,
    output reg mret_out_o,
    output reg wfi_out_o,
    output reg [3:0] ecause_out_o,
    output reg exception_out_o,  //64 alu addition
    output reg half_o,
    output reg is_fence_o,

    //to rob (control)
    output reg valid_out_o,

    // to rob (csr)
    output reg csr_read_out_o,
    output reg csr_write_out_o,
    output reg csr_readable_out_o,
    output reg csr_writeable_out_o,

    // to rob (alu)
    output reg [63:0] csr_data_out_o,
    output reg [31:0] imm_data_out_o,
    output reg [2:0] alu_function_out_o,
    output reg alu_function_modifier_out_o,
    output reg [1:0] alu_select_a_out_o,
    output reg [1:0] alu_select_b_out_o,
    output reg [2:0] cmp_function_out_o,

    // to rob (branch)
    output reg jump_out_o,
    output reg branch_out_o,

    // to rob (lsu)
    output reg is_alu_out_o,
    output reg load_out_o,
    output reg store_out_o,
    output reg [1:0] load_store_size_out_o,
    output reg load_signed_out_o

);

// fecth<>decode
wire rd_en;
wire [31:0] pc;
wire [31:0] next_pc;
wire [31:0] instr;
wire ins_empty;

wire exception_valid_o;
wire [3:0] ecause_o;

fetch frontend_fetch (
    .clk(clk),
    .reset(rstn),
    //btb from fu
    .is_req_pc(is_req_pc_i),
    .btb_req_pc(btb_req_pc_i),
    .btb_predict_target(btb_predict_target_i),
    //gshare from fu
    .prev_pc(prev_pc_i),
    .prev_branch_in(prev_branch_in_i),
    .prev_taken(prev_taken_i),
    //instruction buffer
    .rd_en(rd_en),
    .pc_out(pc),
    .next_pc_out(next_pc),
    .instruction_out(instr),
    // from fu
    .valid_real_branch(valid_real_branch_i),
    .real_branch(real_branch_i),
    // from writeback
    .trap(trap),
    .mret(mret),
    // from csr
    .trap_vector(trap_vector_i),
    .mret_vector(mret_vector_i),
    // from hazard
    .wfi(wfi),
    //from icache 
    .icache_req_ready(icache_ready_i),
    .icache_resp_valid(icache_valid_i),
    .fetch_data(fetch_data_i),
    .icache_resp_address(icache_resp_address_i),

    // to icache
    .icache_resp_ready(ready_icache_request_o),
    .fetch_address(fetch_address_o),
    .icache_req_valid(valid_give_icache_o),

    //for test
    .ins_empty(ins_empty),
    // exceptions
    .exception_valid_o(exception_valid_o),
    .ecause_o(ecause_o)

);

decode frontend_decode (
    .clk(clk),
    .rstn(rstn),
    // from fetch
    .pc_in(pc),
    .next_pc_in(next_pc),
    .instruction_in(instr),
    .valid_in(!ins_empty),
    .exception_in(exception_valid_o),
    .ecause_in(ecause_o),

    // from rob
    .ready_in(ready_in_i),

    //from fu(), maybe fu todo
    .branch_back(branch_back_i),

    //pipeline control
    .trapped(trap),
    .wfi_in (wfi),

    // to csr
    .csr_address(csr_address_o),

    // from csr
    .csr_data(csr_data_i),
    .csr_readable(csr_readable_i),
    .csr_writeable(csr_writeable_i),

    // to rob
    .uses_rs1(uses_rs1_o),
    .uses_rs2(uses_rs2_o),
    .uses_rd(uses_rd_o),
    .uses_csr(uses_csr_o),
    .pc_out(d_pc_out_o),
    .next_pc_out(d_next_pc_out_o),
    .rs1_address_out(rd1_address_out_o),
    .rs2_address_out(rd2_address_out_o),
    .rd_address_out(rd_address_out_o),
    .csr_address_out(csr_address_out_o),
    .mret_out(mret_out_o),
    .wfi_out(wfi_out_o),
    .ecause_out(ecause_out_o),
    .exception_out(exception_out_o),  //64 alu addition
    .half(half_o),
    .is_fence(is_fence_o),

    //to rob (control)
    .valid_out(valid_out_o),

    // to fetch
    .ready_out(rd_en),

    // to rob (csr)
    .csr_read_out(csr_read_out_o),
    .csr_write_out(csr_write_out_o),
    .csr_readable_out(csr_readable_out_o),
    .csr_writeable_out(csr_writeable_out_o),

    // to rob (alu)
    .csr_data_out(csr_data_out_o),
    .imm_data_out(imm_data_out_o),
    .alu_function_out(alu_function_out_o),
    .alu_function_modifier_out(alu_function_modifier_out_o),
    .alu_select_a_out(alu_select_a_out_o),
    .alu_select_b_out(alu_select_b_out_o),
    .cmp_function_out(cmp_function_out_o),

    // to rob (branch)
    .jump_out  (jump_out_o),
    .branch_out(branch_out_o),

    // to rob (lsu)
    .is_alu_out(is_alu_out_o),
    .load_out(load_out_o),
    .store_out(store_out_o),
    .load_store_size_out(load_store_size_out_o),
    .load_signed_out(load_signed_out_o)
);

endmodule

`endif  // FRONTEND_V
