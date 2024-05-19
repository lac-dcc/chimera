// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module new_alu(
input clk,
input rstn,
input stall,
input flush,

input [XLEN - 1:0] alu_input_a,
input [XLEN - 1:0] alu_input_b,
input [XLEN - 1:0] cmp_input_a,
input [XLEN - 1:0] cmp_input_b,
input half,
input [2:0] alu_function_select,  //alu_function_out要
input function_modifier,
input [2:0] cmp_function_select,

input valid_i,
input [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_i,
input [ROB_INDEX_WIDTH - 1:0] rob_index_i,

//btb/gshare
input jump_i,
input branch_i,
input [VIRTUAL_ADDR_LEN-1 : 0] pc_i,
input [VIRTUAL_ADDR_LEN - 1 : 0] next_pc_i,
output reg jump_o,
output reg branch_o,
output reg [VIRTUAL_ADDR_LEN - 1 : 0] pc_o,
output reg [VIRTUAL_ADDR_LEN - 1 : 0] next_pc_o,

// csr
input is_csr_i,
input [CSR_ADDR_LEN - 1 : 0] csr_address_i,
input [XLEN - 1 : 0] csr_data_i,
input csr_read_i,
input csr_write_i,
input csr_readable_i,
input csr_writeable_i,

output reg csr_valid_o,
output reg csr_read_o,
output reg csr_write_o,
output reg [XLEN - 1 : 0] csr_data_o,
output reg [CSR_ADDR_LEN - 1 : 0] csr_address_o,

// exception
output reg exception_valid_o,
output reg [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o,

// 1st cycle output
// output [XLEN - 1:0] add_result,
output ready_o,
output reg done_o,
output reg [PHY_REG_ADDR_WIDTH-1:0] rd_addr_o,
output reg [ROB_INDEX_WIDTH - 1:0] rob_index_o,
// 2nd cycle output
output reg [XLEN - 1:0] alu_result, 
output reg cmp_result
);

assign ready_o = ~stall;

reg quasi_result;
reg negate;
reg usign;
reg less;
reg is_equal;
reg is_less;
reg [XLEN - 1 : 0] alu_result_add_sub_half_w;
reg [XLEN - 1 : 0] alu_result_add_sub_w;
reg [XLEN - 1 : 0] alu_result_sll_half_w;
reg [XLEN - 1 : 0] alu_result_sll_w;
reg [XLEN - 1 : 0] alu_result_slt_w;
reg [XLEN - 1 : 0] alu_result_xor_w;
reg [XLEN - 1 : 0] alu_result_srl_sra_half_w;
reg [XLEN - 1 : 0] alu_result_srl_sra_w;
reg [XLEN - 1 : 0] alu_result_and_clr_w;
reg [XLEN - 1 : 0] alu_result_or_w;
reg branch_w;
reg jump_w;
reg valid_w;
reg csr_exception_w;
reg exception_valid_w;
reg cmp_result_w;
reg [64:0] tmp_shifted;
reg [32:0] tmp_shiftedw;
reg [XLEN - 1 : 0] sllw_w;
reg [EXCEPTION_CODE_WIDTH - 1 : 0] exception_code_w;
// reg csr_exception;

always @(*) begin
    //control logic wire
    valid_w = !flush & valid_i;
    csr_exception_w = is_csr_i & ((csr_read_i & ~csr_readable_i) || (csr_write_i & ~csr_writeable_i));
    exception_valid_w = csr_exception_w & valid_w;
    exception_code_w = csr_exception_w ? 2 : 0;
    jump_w = jump_i & valid_i;
    branch_w = branch_i & valid_i;
    //cmp result(wire)
    less = cmp_function_select[2];
    usign = cmp_function_select[1];
    negate = cmp_function_select[0];
    is_equal = (cmp_input_a == cmp_input_b);
    is_less = ($signed({usign ? 1'b0 : cmp_input_a[63], cmp_input_a}) < $signed({usign ? 1'b0 : cmp_input_b[63], cmp_input_b}));
    quasi_result = less ? is_less : is_equal;
    cmp_result_w = negate ? !quasi_result : quasi_result;
    //alu result(wire)
    alu_result_add_sub_w = alu_input_a + (function_modifier ? -alu_input_b : alu_input_b);
    alu_result_add_sub_half_w = {{32{alu_result_add_sub_w[31]}}, alu_result_add_sub_w[31:0]}; //64 modified

    alu_result_sll_w = alu_input_a << alu_input_b[5:0];
    sllw_w = alu_input_a << alu_input_b[4:0];
    alu_result_sll_half_w = {{32{sllw_w[31]}}, sllw_w[31:0]};
    
    alu_result_slt_w = {
        {63{1'b0}},
        (
            $signed({alu_function_select[0] ? 1'b0 : alu_input_a[63], alu_input_a})
            < $signed({alu_function_select[0] ? 1'b0 : alu_input_b[63], alu_input_b})
        )
    }; 
    
    tmp_shifted = ($signed({function_modifier ? alu_input_a[63] : 1'b0, alu_input_a}) >>> alu_input_b[5:0]);
    tmp_shiftedw = ($signed({function_modifier ? alu_input_a[31] : 1'b0, alu_input_a[31:0]}) >>> alu_input_b[4:0]);
    alu_result_srl_sra_w = tmp_shifted[63:0];
    alu_result_srl_sra_half_w = {{32{tmp_shiftedw[31]}}, tmp_shiftedw[31:0]};
    alu_result_xor_w = alu_input_a ^ alu_input_b;
    alu_result_or_w = alu_input_a | alu_input_b;
    alu_result_and_clr_w = (function_modifier ? ~alu_input_a : alu_input_a) & alu_input_b;
end

always @(posedge clk) begin
    if (rstn | flush) begin
        jump_o <= '0;
        branch_o <= '0;
        pc_o <= '0;
        next_pc_o <= '0;
        csr_valid_o <= '0;
        csr_read_o <= '0;
        csr_write_o <= '0;
        csr_data_o <= '0;
        csr_address_o <= '0;
        exception_valid_o <= '0;
        ecause_o <= '0;
        done_o <= '0;
        rd_addr_o <= '0;
        rob_index_o <= '0;
        alu_result <= '0; 
        cmp_result <= '0;
    end
    else if (!stall) begin
        done_o <= valid_w;
        rd_addr_o <= rd_addr_i;
        jump_o <= jump_w;
        branch_o <= branch_w;
        pc_o <= pc_i;
        next_pc_o <= next_pc_i;
        csr_valid_o <= is_csr_i & valid_i;;
        csr_read_o <= csr_read_i;
        csr_write_o <= csr_write_i;
        csr_data_o <= csr_data_i;
        csr_address_o <= csr_address_i;
        exception_valid_o <= exception_valid_w;
        ecause_o <= exception_code_w;
        rob_index_o <= rob_index_i;
        case (alu_function_select)
            ALU_ADD_SUB: if(half) begin
                alu_result <= alu_result_add_sub_half_w; //64 modified
            end else begin
                alu_result <= alu_result_add_sub_w;
            end
            ALU_SLL:     if(half) begin
                alu_result <= alu_result_sll_half_w;
            end else begin 
                alu_result <= alu_result_sll_w;
            end
            ALU_SLT,
            ALU_SLTU:    alu_result <= alu_result_slt_w; 
            ALU_XOR:     alu_result <= alu_result_xor_w;
            ALU_SRL_SRA: if( half) begin
                alu_result <= alu_result_srl_sra_half_w;
            end else begin
                alu_result <= alu_result_srl_sra_w;
            end
            ALU_OR:      alu_result <= alu_result_or_w;
            ALU_AND_CLR: alu_result <= alu_result_and_clr_w;
        endcase
        cmp_result <= cmp_result_w;
    end
end

endmodule
