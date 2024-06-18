// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef FU_V
`define FU_V

`include "../params.vh"
module new_fu (
    // global
    input clk,
    input rstn,
    input stall,
    input flush,

    // <> RCU
    input [XLEN - 1 : 0] rs1_data_i,
    input [XLEN - 1 : 0] rs2_data_i,
    input [ROB_INDEX_WIDTH - 1 : 0] rob_index_i,
    input [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_i,
    input branch_i, // if branch or jump, set 1
    input jump_i, // if jump, set 1
    input issue_valid_i,
    // alu & cmp
    input is_alu_i,
    input half_i,
    input [PC_WIDTH-1:0] pc_i,
    input [PC_WIDTH-1:0] next_pc_i, // for jal to wb
    input [1:0] alu_select_a_i,
    input [1:0] alu_select_b_i,
    input [31:0] imm_data_i,
    input [2:0] alu_function_i,
    input [2:0] cmp_function_i, 
    input alu_function_modifier_i,
    // exception 
    output lsu_exception_valid_o,
    output alu_exception_valid_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] lsu_ecause_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] alu_ecause_o,
    // csr
    input is_csr_i,
    input [CSR_ADDR_LEN - 1:0] csr_address_i,
    input [XLEN - 1 : 0] csr_data_i,
    input csr_read_i,
    input csr_write_i,
    input csr_readable_i,
    input csr_writeable_i,
    output csr_wb_valid_o,
    output [CSR_ADDR_LEN - 1:0]  csr_wb_addr_o,
    output [XLEN - 1 : 0] csr_wb_data_o,
    // lsu
    /*verilator lint_off UNUSED */
    input load_i,
    /*verilator lint_on UNUSED */
    input store_i,
    input [1:0] load_store_size_i,
    input load_signed_i,
    input is_load_store_i,
    // lsu => rob
    output lsu_ready_o,
    output lsu_done_o,  
    output [ROB_INDEX_WIDTH-1:0] lsu_wb_rob_index_o,
    // lsu => prf
    output lsu_wb_valid_o, 
    output [PHY_REG_ADDR_WIDTH-1:0] lsu_wb_rd_addr_o,
    output [XLEN - 1 : 0] lsu_wb_data_o,
    // lsu/alu => rob/prf
    output alu_ready_o,
    output alu_done_o,  
    output [ROB_INDEX_WIDTH-1:0] alu_wb_rob_index_o,
    output alu_wb_valid_o, 
    output [PHY_REG_ADDR_WIDTH-1:0] alu_wb_rd_addr_o,
    output [XLEN - 1 : 0] alu_wb_data_o,

    // <> btb
    output btb_valid_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] btb_pc_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] btb_next_pc_o,   // target pc

    // <> gshare
    output gshare_pred_valid_o,
    output gshare_pred_taken_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] gshare_pred_pc_o,

    // <> pc_gen
    output pc_valid_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0]pc_o,

    // // <> instr_buff
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
//lsu
wire lsu_ready;
wire lsu_exception_valid_forward;
// wire lsu_exception_valid;
// wire [EXCEPTION_CODE_WIDTH - 1 : 0] lsu_exception_code;
// alu 
reg [XLEN - 1 : 0] alu_input_a;
reg [XLEN - 1 : 0] alu_input_b;
wire [2 : 0] alu_function_select;
wire alu_function_modifier;
wire [XLEN - 1 : 0] pc_64;
wire [XLEN - 1 : 0] imm_64;

// alu => rcu
wire alu_ready;
wire [XLEN - 1 : 0] alu_result;
wire [PHY_REG_ADDR_WIDTH-1:0] alu_rd_addr;
wire done;
wire [ROB_INDEX_WIDTH - 1 : 0] alu_rob_index;
// wire alu_exception_valid;
// wire [EXCEPTION_CODE_WIDTH - 1 : 0] alu_exception_code;
// alu <> pc
wire alu_jump;
wire alu_branch;
wire [VIRTUAL_ADDR_LEN-1:0] alu_pc;
wire [VIRTUAL_ADDR_LEN-1:0] alu_next_pc;
// alu csr
wire [CSR_ADDR_LEN - 1:0] csr_address;
wire csr_valid;
wire csr_read;
wire csr_write;
wire [XLEN - 1 : 0] csr_data;

// cmp => rcu
/*verilator lint_off UNUSED */
// wire cmp_ready;
// wire [PHY_REG_ADDR_WIDTH-1:0] cmp_rd_addr;
// wire cmp_done;
// wire [ROB_INDEX_WIDTH - 1 : 0] cmp_rob_index;
wire cmp_valid;
wire cmp_result;

reg alu_exception_stall_ff;
reg lsu_exception_valid_forward_ff;
wire fu_exception_stall = alu_exception_stall_ff | alu_exception_valid_o | lsu_exception_valid_forward_ff;

assign lsu_ready_o = lsu_ready & ~fu_exception_stall;
assign alu_function_select = alu_function_i;
assign alu_function_modifier = alu_function_modifier_i;
assign pc_64 = {{32'b0}, pc_i};
assign imm_64 = {{32{imm_data_i[31]}}, imm_data_i}; 
assign alu_ready_o = alu_ready & ~fu_exception_stall ;
assign alu_done_o = done;
assign alu_wb_rob_index_o = alu_rob_index;
assign alu_wb_valid_o = 
                        (alu_branch & alu_jump) |   // jump
                        (~alu_branch & 
                            ((done & ~csr_valid) | // op 
                            (csr_valid & csr_read))); // csr
assign alu_wb_rd_addr_o =  alu_rd_addr;
assign alu_wb_data_o = (csr_read) ? csr_data :  // csr
                        (alu_jump) ? {{32'b0}, alu_next_pc} : // jal
                            alu_result;  //op
/*verilator lint_on UNUSED */
// assign exception_valid_o = alu_exception_valid | lsu_exception_valid;
// assign ecause_o = lsu_exception_valid ? lsu_exception_code : alu_exception_code; // lsu > alu, cuz lsu should be a ealier exception
// <> btb
assign btb_valid_o = done & alu_branch;
assign btb_pc_o = alu_pc;
assign btb_next_pc_o = alu_result[VIRTUAL_ADDR_LEN - 1 : 0];
// <> gshare
assign gshare_pred_valid_o = done & alu_branch;
assign gshare_pred_taken_o = (alu_branch & ~ alu_jump) ? cmp_result : alu_jump;
assign gshare_pred_pc_o = alu_result[VIRTUAL_ADDR_LEN - 1 : 0];
// <> PC_GEN   
assign pc_valid_o = done & alu_branch;
assign pc_o = alu_jump ? alu_result[VIRTUAL_ADDR_LEN - 1 : 0] :
            cmp_result ? alu_result[VIRTUAL_ADDR_LEN - 1 : 0] : 
                         alu_next_pc;
// // <> instr_buff
// assign instr_buff_nxt_pc_valid_o = alu_branch;
// assign instr_buff_nxt_pc_o = alu_result[VIRTUAL_ADDR_LEN - 1 : 0];
// <> branch
assign branch_done = done & alu_branch;
// alu csr
assign csr_wb_valid_o = csr_valid & csr_write;
assign csr_wb_addr_o = csr_address;
assign csr_wb_data_o = alu_result;

// cmp 
assign cmp_valid = branch_i & ~jump_i;

always @(*) begin
    if(is_alu_i | is_csr_i) begin
        case (alu_select_a_i)
            ALU_SEL_REG : alu_input_a = rs1_data_i;
            ALU_SEL_IMM : alu_input_a = (alu_select_b_i == 2'b11) ? imm_64 : '0; // FIXME: it seems that when this is 0, csrrxi and lui are settled
            ALU_SEL_PC  : alu_input_a = pc_64;
            ALU_SEL_CSR : alu_input_a = csr_data_i;
        endcase
        case (alu_select_b_i)
            ALU_SEL_REG : alu_input_b = rs2_data_i;
            ALU_SEL_IMM : alu_input_b = imm_64; 
            ALU_SEL_PC  : alu_input_b = pc_64;
            ALU_SEL_CSR : alu_input_b = csr_data_i;
        endcase
    end
    else if (cmp_valid) begin
        alu_input_a = rs1_data_i;
        alu_input_b = rs2_data_i;
    end
    else begin
        alu_input_a = '0;
        alu_input_b = '0;
    end
end

// wire fu_exception = alu_exception_valid_o | lsu_exception_valid_forward;
// wire fu_exception_stall = 0;

always @(posedge clk) begin 
    // $display("alu_exception_valid_o:%h\n", alu_exception_valid_o);
    // $display("lsu_exception_valid_forward:%h\n", lsu_exception_valid_forward);
    if(rstn | flush) begin
        lsu_exception_valid_forward_ff <= '0;
        alu_exception_stall_ff <= '0;
    end
    else begin 
        if(lsu_exception_valid_forward) begin
            lsu_exception_valid_forward_ff <= '1;
        end
        if(alu_exception_valid_o) begin
            alu_exception_stall_ff <= alu_exception_valid_o;
        end 
    end
end

new_alu fu_new_alu(
    .clk(clk),
    .rstn(rstn),
    .stall(stall),
    .flush(stall),

    .alu_input_a(alu_input_a),
    .alu_input_b(alu_input_b),
    .cmp_input_a(rs1_data_i),
    .cmp_input_b(rs2_data_i),
    .half(half_i),
    .alu_function_select(alu_function_select),  //alu_function_out要
    .function_modifier(alu_function_modifier),
    .cmp_function_select(cmp_function_i),

    .valid_i((is_alu_i | is_csr_i | cmp_valid) & issue_valid_i & ~fu_exception_stall),
    .rd_addr_i(rd_addr_i),
    .rob_index_i(rob_index_i),

    //btb/gshare
    .jump_i(jump_i),
    .branch_i(branch_i),
    .pc_i(pc_i),
    .next_pc_i(next_pc_i),
    .jump_o(alu_jump),
    .branch_o(alu_branch),
    .pc_o(alu_pc),
    .next_pc_o(alu_next_pc),

    // csr
    .is_csr_i(is_csr_i),
    .csr_address_i(csr_address_i),
    .csr_data_i(csr_data_i),
    .csr_read_i(csr_read_i),
    .csr_write_i(csr_write_i),
    .csr_readable_i(csr_readable_i),
    .csr_writeable_i(csr_writeable_i),
    .csr_valid_o(csr_valid),
    .csr_read_o(csr_read),
    .csr_write_o(csr_write),
    .csr_data_o(csr_data),
    .csr_address_o(csr_address),

    // exception
    .exception_valid_o(alu_exception_valid_o),
    .ecause_o(alu_ecause_o),

// 1st cycle output
// output [XLEN - 1:0] add_result,
    .ready_o(alu_ready),
    .done_o(done), 
    .rob_index_o(alu_rob_index),
    .rd_addr_o(alu_rd_addr),
// 2nd cycle output
    .alu_result(alu_result), 
    .cmp_result(cmp_result)
);


`ifndef USE_NBLSU
lsu fu_lsu(
    .clk(clk),
    .rstn(rstn),
    .stall(stall),
    .flush(flush),
    // <> PRF
    .rs1_data_i(rs1_data_i),
    .rs2_data_i(rs2_data_i),
    .load_data_valid_o(lsu_wb_valid_o),
    .load_data_o(lsu_wb_data_o),
    .rd_addr_o(lsu_wb_rd_addr_o),
    // lsu <> ROB
    .valid_i(is_load_store_i & issue_valid_i),
    .rob_index_i(rob_index_i), 
    .rd_addr_i(rd_addr_i),
    .imm_i(imm_64),
    .opcode_i(store_i), 
    .size_i(load_store_size_i),
    .load_sign_i(load_signed_i),

    .ROB_index_o(lsu_wb_rob_index_o),
    .ls_done_o(lsu_done_o),
    .lsu_ready_o(lsu_ready),

    .exception_valid_o(lsu_exception_valid_o),
    .ecause_o(lsu_ecause_o),
    // <> fu
    .exception_valid_forward_o(lsu_exception_valid_forward),
    // lsu <> dcache
    .req_valid_o(req_valid_o),
    .req_opcode_o(req_opcode_o), // 0 for load, 1 for store
    .req_size_o(req_size_o), 
    .req_addr_o(req_addr_o),
    .req_data_o(req_data_o),
    .req_ready_i(req_ready_i),

    .resp_valid_i(resp_valid_i),
    .resp_data_i(resp_data_i),
    .resp_ready_o(resp_ready_o)
);
`else // USE_NBLSU
nblsu fu_lsu(
    .clk(clk),
    .rstn(rstn),
    // .stall(stall),
    .flush(flush),
    // <> PRF
    .rs1_data_i(rs1_data_i),
    .rs2_data_i(rs2_data_i),
    .load_data_valid_o(lsu_wb_valid_o),
    .load_data_o(lsu_wb_data_o),
    .rd_addr_o(lsu_wb_rd_addr_o),
    // lsu <> ROB
    .valid_i(is_load_store_i & issue_valid_i),
    .rob_index_i(rob_index_i), 
    .rd_addr_i(rd_addr_i),
    .imm_i(imm_64),
    .opcode_i(store_i), 
    .size_i(load_store_size_i),
    .load_sign_i(load_signed_i),

    .rob_index_o(lsu_wb_rob_index_o),
    .ls_done_o(lsu_done_o),
    .lsu_ready_o(lsu_ready),

    .exception_valid_o(lsu_exception_valid_o),
    .ecause_o(lsu_ecause_o),
    // <> fu
    .exception_valid_forward_o(lsu_exception_valid_forward),
    // lsu <> dcache
    .req_valid_o(req_valid_o),
    .req_opcode_o(req_opcode_o), // 0 for load, 1 for store
    .req_size_o(req_size_o), 
    .req_addr_o(req_addr_o),
    .req_data_o(req_data_o),
    .req_sign_o(req_sign_o),
    // .req_rob_index_o(req_rob_index_o),
    .req_lsq_index_o(req_lsq_index_o),
`ifdef LSU_SELFCHECK
    .head_o(),
    .tail_o(),
    .req_pt_o(),
`endif // LSU_SELFCHECK
    .req_ready_i(req_ready_i),
    .resp_lsq_index_i(resp_lsq_index_i),

    .resp_valid_i(resp_valid_i),
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
`endif // USE_NBLSU
`ifdef LSU_ALU_SELFCHECK 
    always @(posedge clk) begin 
        $display("csr_read: %h", csr_read);
        $display("nxt pc in: %h", next_pc_i);
        $display("alu_jump: %h", alu_jump);
        $display("alu_next_pc: %h", alu_next_pc);
        $display("alu_wb_data_o: %h", alu_wb_data_o);
        
        

        // $display("alu_done_o: %h",alu_done_o );
        // $display("alu_wb_rob_index_o: %h", alu_wb_rob_index_o);
        // $display("alu_wb_valid_o: %h", alu_wb_valid_o);
        // $display("alu_wb_rd_addr_o: %h", alu_wb_rd_addr_o);
        // $display("alu_wb_data_o: %h", alu_wb_data_o);
        // $display("alu_done_o: %h",alu_done_o );
        // $display("alu_done: %h", alu_done);
        // $display("csr_valid: %h", csr_valid);
        // $display("csr_read: %h", csr_read);
        // $display(": %h", );
        // $display(": %h", );
        // $display(": %h", );
        // $display(": %h", );
        // $display(": %h", );
        // $display(": %h", );
    end 
`endif //LSU_ALU_SELFCHECK
endmodule

`endif // FU_V
