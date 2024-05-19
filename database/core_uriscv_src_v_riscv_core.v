// This program was cloned from: https://github.com/ultraembedded/core_uriscv
// License: Apache License 2.0

//-----------------------------------------------------------------
//                          uRISC-V CPU
//                            V0.5.0
//               github.com/ultraembedded/core_uriscv
//                     Copyright 2015-2021
//
//                   admin@ultra-embedded.com
//
//                     License: Apache 2.0
//-----------------------------------------------------------------
// Copyright 2015-2021 github.com/ultraembedded
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

module riscv_core
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter SUPPORT_MUL      = 1
    ,parameter SUPPORT_DIV      = 1
    ,parameter SUPPORT_CSR      = 1
    ,parameter SUPPORT_TRAP_LSU_ALIGN = 1
    ,parameter SUPPORT_MTVEC    = 0
    ,parameter SUPPORT_MTVAL    = 0
    ,parameter SUPPORT_MIP_MIE  = 0
    ,parameter SUPPORT_MSCRATCH = 0
    ,parameter SUPPORT_MCYCLE   = 1
    ,parameter SUPPORT_MTIMECMP = 0
    ,parameter SUPPORT_TRAP_INVALID_OPC = 1
    ,parameter SUPPORT_BRAM_REGFILE = 0
    ,parameter ISR_VECTOR       = 32'h00000010
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Clock
     input           clk_i

    // Reset (active high)
    ,input           rst_i

    // External interrupt (M_EXT)
    ,input           intr_i

    // Initial boot address
    ,input  [ 31:0]  reset_vector_i

    // MHARTID value
    ,input  [ 31:0]  cpu_id_i

    // Instruction Fetch
    ,output          mem_i_rd_o
    ,output [ 31:0]  mem_i_pc_o
    ,input           mem_i_accept_i
    ,input           mem_i_valid_i
    ,input  [ 31:0]  mem_i_inst_i

    // Instruction fetch: Unused on this core
    ,output          mem_i_flush_o
    ,output          mem_i_invalidate_o

    // Instruction fetch: Unused (tie low)
    ,input           mem_i_error_i

    // Data Access
    ,output [ 31:0]  mem_d_addr_o
    ,output [ 31:0]  mem_d_data_wr_o
    ,output          mem_d_rd_o
    ,output [  3:0]  mem_d_wr_o
    ,input  [ 31:0]  mem_d_data_rd_i
    ,input           mem_d_accept_i
    ,input           mem_d_ack_i

    // Instruction fetch: Unused on this core
    ,output          mem_d_cacheable_o
    ,output [ 10:0]  mem_d_req_tag_o
    ,output          mem_d_invalidate_o
    ,output          mem_d_writeback_o
    ,output          mem_d_flush_o

    // Data Access: Unused (tie low)
    ,input           mem_d_error_i
    ,input  [ 10:0]  mem_d_resp_tag_i
);



`include "uriscv_defs.v"

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
`define PC_W        32
`define ADDR_W      32

localparam           PC_W                = `PC_W;
localparam           PC_PAD_W            = 0;
localparam           PC_EXT_W            = 0;

localparam           ADDR_W              = `ADDR_W;
localparam           ADDR_PAD_W          = 0;

// Current state
localparam           STATE_W           = 3;
localparam           STATE_RESET       = 0;
localparam           STATE_FETCH_WB    = 1;
localparam           STATE_EXEC        = 2;
localparam           STATE_MEM         = 3;
localparam           STATE_DECODE      = 4; // Only if SUPPORT_BRAM_REGFILE = 1

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------

// Current state
reg [STATE_W-1:0] state_q;

// Executing PC
reg [PC_W-1:0]  pc_q;

// Destination register
reg [4:0]       rd_q;

// Destination writeback enable
reg             rd_wr_en_q;

// ALU inputs
reg [31:0]      alu_a_q;
reg [31:0]      alu_b_q;

// ALU operation selection
reg [3:0]       alu_func_q;

// CSR read data
wire [31:0]     csr_data_w;

// Instruction decode fault
reg             invalid_inst_r;

// Register indexes
wire [4:0]      rd_w;
wire [4:0]      rs1_w;
wire [4:0]      rs2_w;

// Operand values
wire [31:0]     rs1_val_w;
wire [31:0]     rs2_val_w;

// Opcode (memory bus)
wire [31:0]     opcode_w;

wire            opcode_valid_w;
wire            opcode_fetch_w = mem_i_rd_o & mem_i_accept_i;

// Execute exception (or interrupt)
wire            exception_w;
wire [5:0]      exception_type_w;
wire [31:0]     exception_target_w;

wire [31:0]     csr_mepc_w;

// Load result (formatted based on load type)
reg [31:0]      load_result_r;

// Writeback enable / value
wire            rd_writeen_w;
wire [31:0]     rd_val_w;

// Memory interface
wire             mem_misaligned_w;
reg [ADDR_W-1:0] mem_addr_q;
reg [31:0]       mem_data_q;
reg [3:0]        mem_wr_q;
reg              mem_rd_q;

// Load type / byte / half index
reg [1:0]       load_offset_q;
reg             load_signed_q;
reg             load_byte_q;
reg             load_half_q;

wire            enable_w = 1'b1;

wire [31:0]     muldiv_result_w;
wire            muldiv_ready_w;
wire            muldiv_inst_w;

//-----------------------------------------------------------------
// ALU
//-----------------------------------------------------------------
uriscv_alu alu
(
    // ALU operation select
    .op_i(alu_func_q),

    // Operands
    .a_i(alu_a_q),
    .b_i(alu_b_q),

    // Result
    .p_o(rd_val_w)
);

//-----------------------------------------------------------------
// Register file
//-----------------------------------------------------------------
reg [31:0] reg_file[0:31];

always @ (posedge clk_i)
if (rd_writeen_w)
    reg_file[rd_q] <= rd_val_w;

wire [31:0] rs1_val_gpr_w = reg_file[mem_i_inst_i[19:15]];
wire [31:0] rs2_val_gpr_w = reg_file[mem_i_inst_i[24:20]];

reg [31:0] rs1_val_gpr_q;
reg [31:0] rs2_val_gpr_q;

always @ (posedge clk_i)
begin
    rs1_val_gpr_q <= rs1_val_gpr_w;
    rs2_val_gpr_q <= rs2_val_gpr_w;
end

assign rs1_val_w = SUPPORT_BRAM_REGFILE ? rs1_val_gpr_q : rs1_val_gpr_w;
assign rs2_val_w = SUPPORT_BRAM_REGFILE ? rs2_val_gpr_q : rs2_val_gpr_w;

// Writeback enable
assign rd_writeen_w  = rd_wr_en_q & (state_q == STATE_FETCH_WB);


`ifdef verilator
`define HAS_REGFILE_WIRES
`endif
`ifdef verilog_sim
`define HAS_REGFILE_WIRES
`endif

// Simulation friendly names
`ifdef HAS_REGFILE_WIRES
wire [31:0] x0_zero_w = reg_file[0];
wire [31:0] x1_ra_w   = reg_file[1];
wire [31:0] x2_sp_w   = reg_file[2];
wire [31:0] x3_gp_w   = reg_file[3];
wire [31:0] x4_tp_w   = reg_file[4];
wire [31:0] x5_t0_w   = reg_file[5];
wire [31:0] x6_t1_w   = reg_file[6];
wire [31:0] x7_t2_w   = reg_file[7];
wire [31:0] x8_s0_w   = reg_file[8];
wire [31:0] x9_s1_w   = reg_file[9];
wire [31:0] x10_a0_w  = reg_file[10];
wire [31:0] x11_a1_w  = reg_file[11];
wire [31:0] x12_a2_w  = reg_file[12];
wire [31:0] x13_a3_w  = reg_file[13];
wire [31:0] x14_a4_w  = reg_file[14];
wire [31:0] x15_a5_w  = reg_file[15];
wire [31:0] x16_a6_w  = reg_file[16];
wire [31:0] x17_a7_w  = reg_file[17];
wire [31:0] x18_s2_w  = reg_file[18];
wire [31:0] x19_s3_w  = reg_file[19];
wire [31:0] x20_s4_w  = reg_file[20];
wire [31:0] x21_s5_w  = reg_file[21];
wire [31:0] x22_s6_w  = reg_file[22];
wire [31:0] x23_s7_w  = reg_file[23];
wire [31:0] x24_s8_w  = reg_file[24];
wire [31:0] x25_s9_w  = reg_file[25];
wire [31:0] x26_s10_w = reg_file[26];
wire [31:0] x27_s11_w = reg_file[27];
wire [31:0] x28_t3_w  = reg_file[28];
wire [31:0] x29_t4_w  = reg_file[29];
wire [31:0] x30_t5_w  = reg_file[30];
wire [31:0] x31_t6_w  = reg_file[31];
`endif

//-----------------------------------------------------------------
// Next State Logic
//-----------------------------------------------------------------
reg [STATE_W-1:0] next_state_r;
always @ *
begin
    next_state_r = state_q;

    case (state_q)
    // RESET - First cycle after reset
    STATE_RESET:
    begin
        next_state_r = STATE_FETCH_WB;
    end
    // FETCH_WB - Writeback / Fetch next isn
    STATE_FETCH_WB :
    begin
        if (opcode_fetch_w)
            next_state_r    = SUPPORT_BRAM_REGFILE ? STATE_DECODE : STATE_EXEC;
    end
    // DECODE - Used to access register file if SUPPORT_BRAM_REGFILE=1
    STATE_DECODE:
    begin
        if (mem_i_valid_i)
            next_state_r = STATE_EXEC;
    end
    // EXEC - Execute instruction (when ready)
    STATE_EXEC :
    begin
        // Instruction ready
        if (opcode_valid_w)
        begin
            if (exception_w)
                next_state_r    = STATE_FETCH_WB;
            else if (type_load_w || type_store_w)
                next_state_r    = STATE_MEM;
            // Multiplication / division - stay in exec state until result ready
            else if (muldiv_inst_w)
                ;
            else
                next_state_r    = STATE_FETCH_WB;
        end
        else if (muldiv_ready_w)
            next_state_r    = STATE_FETCH_WB;
    end
    // MEM - Perform load or store
    STATE_MEM :
    begin
        // Memory access complete
        if (mem_d_ack_i)
            next_state_r = STATE_FETCH_WB;
    end
    default:
        ;
    endcase

    if (!enable_w)
        next_state_r = STATE_RESET;
end

// Update state
always @ (posedge clk_i )
if (rst_i)
    state_q   <= STATE_RESET;
else
    state_q   <= next_state_r;

//-----------------------------------------------------------------
// Instruction Decode
//-----------------------------------------------------------------
reg [31:0] opcode_q;

always @ (posedge clk_i )
if (rst_i)
    opcode_q <= 32'b0;
else if (state_q == STATE_DECODE)
    opcode_q <= mem_i_inst_i;

reg opcode_valid_q;

always @ (posedge clk_i )
if (rst_i)
    opcode_valid_q <= 1'b0;
else if (state_q == STATE_DECODE)
    opcode_valid_q <= mem_i_valid_i;
else
    opcode_valid_q <= 1'b0;

assign opcode_w       = SUPPORT_BRAM_REGFILE ? opcode_q : mem_i_inst_i;
assign opcode_valid_w = SUPPORT_BRAM_REGFILE ? opcode_valid_q : mem_i_valid_i;

assign rs1_w        = opcode_w[19:15];
assign rs2_w        = opcode_w[24:20];
assign rd_w         = opcode_w[11:7];

wire type_rvc_w     = (opcode_w[1:0] != 2'b11);

wire type_load_w    = (opcode_w[6:2] == 5'b00000);
wire type_opimm_w   = (opcode_w[6:2] == 5'b00100);
wire type_auipc_w   = (opcode_w[6:2] == 5'b00101);
wire type_store_w   = (opcode_w[6:2] == 5'b01000);
wire type_op_w      = (opcode_w[6:2] == 5'b01100);
wire type_lui_w     = (opcode_w[6:2] == 5'b01101);
wire type_branch_w  = (opcode_w[6:2] == 5'b11000);
wire type_jalr_w    = (opcode_w[6:2] == 5'b11001);
wire type_jal_w     = (opcode_w[6:2] == 5'b11011);
wire type_system_w  = (opcode_w[6:2] == 5'b11100);
wire type_miscm_w   = (opcode_w[6:2] == 5'b00011);

wire [2:0] func3_w  = opcode_w[14:12]; // R, I, S
wire [6:0] func7_w  = opcode_w[31:25]; // R

// ALU operations excluding mul/div
wire type_alu_op_w  = (type_op_w && (func7_w == 7'b0000000)) ||
                      (type_op_w && (func7_w == 7'b0100000));

// Loose decoding - gate with type_load_w on use
wire inst_lb_w       = (func3_w == 3'b000);
wire inst_lh_w       = (func3_w == 3'b001);
wire inst_lbu_w      = (func3_w == 3'b100);
wire inst_lhu_w      = (func3_w == 3'b101);

wire inst_ecall_w    = SUPPORT_CSR && type_system_w && (opcode_w[31:7] == 25'h000000);
wire inst_ebreak_w   = SUPPORT_CSR && type_system_w && (opcode_w[31:7] == 25'h002000);
wire inst_mret_w     = SUPPORT_CSR && type_system_w && (opcode_w[31:7] == 25'h604000);

wire inst_csr_w      = SUPPORT_CSR && type_system_w && (func3_w != 3'b000 && func3_w != 3'b100);

wire mul_inst_w      = SUPPORT_MUL && type_op_w && (func7_w == 7'b0000001) && ~func3_w[2];
wire div_inst_w      = SUPPORT_DIV && type_op_w && (func7_w == 7'b0000001) &&  func3_w[2];
wire inst_mul_w      = mul_inst_w && (func3_w == 3'b000);
wire inst_mulh_w     = mul_inst_w && (func3_w == 3'b001);
wire inst_mulhsu_w   = mul_inst_w && (func3_w == 3'b010);
wire inst_mulhu_w    = mul_inst_w && (func3_w == 3'b011);
wire inst_div_w      = div_inst_w && (func3_w == 3'b100);
wire inst_divu_w     = div_inst_w && (func3_w == 3'b101);
wire inst_rem_w      = div_inst_w && (func3_w == 3'b110);
wire inst_remu_w     = div_inst_w && (func3_w == 3'b111);
wire inst_nop_w      = (type_miscm_w && (func3_w == 3'b000)) | // fence
                       (type_miscm_w && (func3_w == 3'b001));  // fence.i

assign muldiv_inst_w = mul_inst_w | div_inst_w;

reg [31:0]  imm20_r;
reg [31:0]  imm12_r;

always @ *
begin
    imm20_r     = {opcode_w[31:12], 12'b0};
    imm12_r     = {{20{opcode_w[31]}}, opcode_w[31:20]};
end

//-----------------------------------------------------------------
// ALU inputs
//-----------------------------------------------------------------
// ALU operation selection
reg [3:0]  alu_func_r;

// ALU operands
reg [31:0] alu_input_a_r;
reg [31:0] alu_input_b_r;
reg        write_rd_r;

always @ *
begin
    alu_func_r     = `RV_ALU_NONE;
    alu_input_a_r  = rs1_val_w;
    alu_input_b_r  = rs2_val_w;
    write_rd_r     = 1'b0;

    case (1'b1)
    type_alu_op_w:
    begin
        alu_input_a_r  = rs1_val_w;
        alu_input_b_r  = rs2_val_w;
    end
    type_opimm_w:
    begin
        alu_input_a_r  = rs1_val_w;
        alu_input_b_r  = imm12_r;
    end
    type_lui_w:
    begin
        alu_input_a_r  = 32'b0;
        alu_input_b_r  = imm20_r;
    end
    type_auipc_w:
    begin
        alu_input_a_r[PC_W-1:0]  = pc_q;
        alu_input_b_r  = imm20_r;
    end
    type_jal_w,
    type_jalr_w:
    begin
        alu_input_a_r[PC_W-1:0]  = pc_q;
        alu_input_b_r  = 32'd4;
    end
    default : ;
    endcase

    if (muldiv_inst_w)
        write_rd_r     = 1'b1;
    else if (type_opimm_w || type_alu_op_w)
    begin
        case (func3_w)
        3'b000:  alu_func_r =  (type_op_w & opcode_w[30]) ? 
                              `RV_ALU_SUB:              // SUB
                              `RV_ALU_ADD;              // ADD  / ADDI
        3'b001:  alu_func_r = `RV_ALU_SHIFTL;           // SLL  / SLLI
        3'b010:  alu_func_r = `RV_ALU_LESS_THAN_SIGNED; // SLT  / SLTI
        3'b011:  alu_func_r = `RV_ALU_LESS_THAN;        // SLTU / SLTIU
        3'b100:  alu_func_r = `RV_ALU_XOR;              // XOR  / XORI
        3'b101:  alu_func_r = opcode_w[30] ? 
                              `RV_ALU_SHIFTR_ARITH:     // SRA  / SRAI
                              `RV_ALU_SHIFTR;           // SRL  / SRLI
        3'b110:  alu_func_r = `RV_ALU_OR;               // OR   / ORI
        3'b111:  alu_func_r = `RV_ALU_AND;              // AND  / ANDI
        endcase

        write_rd_r = 1'b1;
    end
    else if (inst_csr_w)
    begin
        alu_func_r     = `RV_ALU_ADD;
        alu_input_a_r  = 32'b0;
        alu_input_b_r  = csr_data_w;
        write_rd_r     = 1'b1;
    end
    else if (type_auipc_w || type_lui_w || type_jalr_w || type_jal_w)
    begin
        write_rd_r     = 1'b1;
        alu_func_r     = `RV_ALU_ADD;
    end
    else if (type_load_w)
        write_rd_r     = 1'b1;
end

//-------------------------------------------------------------------
// Load result resolve
//-------------------------------------------------------------------
always @ *
begin
    load_result_r = 32'b0;

    if (load_byte_q)
    begin
        case (load_offset_q[1:0])
            2'h3:
                load_result_r = {24'b0, mem_d_data_rd_i[31:24]};
            2'h2:
                load_result_r = {24'b0, mem_d_data_rd_i[23:16]};
            2'h1:
                load_result_r = {24'b0, mem_d_data_rd_i[15:8]};
            2'h0:
                load_result_r = {24'b0, mem_d_data_rd_i[7:0]};
        endcase

        if (load_signed_q && load_result_r[7])
            load_result_r = {24'hFFFFFF, load_result_r[7:0]};
    end
    else if (load_half_q)
    begin
        if (load_offset_q[1])
            load_result_r = {16'b0, mem_d_data_rd_i[31:16]};
        else
            load_result_r = {16'b0, mem_d_data_rd_i[15:0]};

        if (load_signed_q && load_result_r[15])
            load_result_r = {16'hFFFF, load_result_r[15:0]};
    end
    else
        load_result_r = mem_d_data_rd_i;
end

//-----------------------------------------------------------------
// Branches
//-----------------------------------------------------------------
wire        branch_w;
wire [31:0] branch_target_w;
wire [31:0] pc_ext_w = {{PC_EXT_W{1'b0}}, pc_q};

uriscv_branch
u_branch
(
     .pc_i(pc_ext_w)
    ,.opcode_i(opcode_w)
    ,.rs1_val_i(rs1_val_w)
    ,.rs2_val_i(rs2_val_w)
    ,.branch_o(branch_w)
    ,.branch_target_o(branch_target_w)
);

//-----------------------------------------------------------------
// Invalid instruction
//-----------------------------------------------------------------
always @ *
begin
    invalid_inst_r = SUPPORT_TRAP_INVALID_OPC;

    if (   type_load_w
         | type_opimm_w
         | type_auipc_w
         | type_store_w
         | type_alu_op_w
         | type_lui_w
         | type_branch_w
         | type_jalr_w
         | type_jal_w
         | inst_ecall_w 
         | inst_ebreak_w 
         | inst_mret_w 
         | inst_csr_w
         | inst_nop_w
         | muldiv_inst_w)
        invalid_inst_r = SUPPORT_TRAP_INVALID_OPC && type_rvc_w;
end

//-----------------------------------------------------------------
// Execute: ALU control
//-----------------------------------------------------------------
always @ (posedge clk_i )
if (rst_i)
begin      
    alu_func_q   <= `RV_ALU_NONE;
    alu_a_q      <= 32'h00000000;
    alu_b_q      <= 32'h00000000;
    rd_q         <= 5'b00000;

    // Reset x0 in-case of RAM
    rd_wr_en_q   <= 1'b1;
end
// Load result ready
else if ((state_q == STATE_MEM) && mem_d_ack_i)
begin
    // Update ALU input with load result
    alu_func_q   <= `RV_ALU_NONE;
    alu_a_q      <= load_result_r;
    alu_b_q      <= 32'b0;
end
// Multiplier / Divider result
else if (muldiv_ready_w)
begin
    // Update ALU input with load result
    alu_func_q   <= `RV_ALU_NONE;
    alu_a_q      <= muldiv_result_w;
    alu_b_q      <= 32'b0;
end
// Execute instruction
else if (opcode_valid_w)
begin
    // Update ALU input flops
    alu_func_q   <= alu_func_r;
    alu_a_q      <= alu_input_a_r;
    alu_b_q      <= alu_input_b_r;

    // Take exception
    if (exception_w)
    begin
        // No register writeback
        rd_q         <= 5'b0;
        rd_wr_en_q   <= 1'b0;
    end   
    // Valid instruction
    else
    begin
        // Instruction with register writeback
        rd_q         <= rd_w;
        rd_wr_en_q   <= write_rd_r & (rd_w != 5'b0);
    end
end
else if (state_q == STATE_FETCH_WB)
   rd_wr_en_q   <= 1'b0;

//-----------------------------------------------------------------
// Execute: Branch / exceptions
//-----------------------------------------------------------------
wire [31:0] boot_vector_w = reset_vector_i;

always @ (posedge clk_i )
if (rst_i)
    pc_q        <= boot_vector_w[PC_W-1:0];
else if (state_q == STATE_RESET)
    pc_q        <= boot_vector_w[PC_W-1:0];
else if (opcode_valid_w)
begin
    // Exception / Break / ecall (branch to ISR)
    if (exception_w || inst_ebreak_w || inst_ecall_w) 
        pc_q    <= exception_target_w[PC_W-1:0];
    // MRET (branch to EPC)
    else if (inst_mret_w) 
        pc_q    <= csr_mepc_w;
    // Branch
    else if (branch_w)
        pc_q    <= branch_target_w[PC_W-1:0];
    else
        pc_q    <= pc_q + `PC_W'd4;
end


//-----------------------------------------------------------------
// Writeback/Fetch: Instruction Fetch
//-----------------------------------------------------------------
assign mem_i_rd_o = (state_q == STATE_FETCH_WB);
assign mem_i_pc_o = pc_ext_w;

//-----------------------------------------------------------------
// Execute: Memory operations
//-----------------------------------------------------------------
wire         mem_rd_w;
wire [3:0]   mem_wr_w;
wire [31:0]  mem_addr_w;
wire [31:0]  mem_data_w;

uriscv_lsu
#( .SUPPORT_TRAP_LSU_ALIGN(SUPPORT_TRAP_LSU_ALIGN) )
u_lsu
(
     .opcode_i(opcode_w)
    ,.rs1_val_i(rs1_val_w)
    ,.rs2_val_i(rs2_val_w)

    ,.mem_rd_o(mem_rd_w)
    ,.mem_wr_o(mem_wr_w)
    ,.mem_addr_o(mem_addr_w)
    ,.mem_data_o(mem_data_w)
    ,.mem_misaligned_o(mem_misaligned_w)
);

always @ (posedge clk_i )
if (rst_i)
begin
    mem_addr_q  <= {ADDR_W{1'b0}};
    mem_data_q  <= 32'h00000000;
    mem_wr_q    <= 4'b0000;
    mem_rd_q    <= 1'b0;
end
// Valid instruction to execute
else if (opcode_valid_w && !exception_w)
begin
    mem_addr_q  <= {mem_addr_w[ADDR_W-1:2], 2'b0};
    mem_data_q  <= mem_data_w;
    mem_wr_q    <= mem_wr_w;
    mem_rd_q    <= mem_rd_w;
end
// No instruction, clear memory request
else if (mem_d_accept_i)
begin
    mem_wr_q    <= 4'b0000;
    mem_rd_q    <= 1'b0;
end

always @ (posedge clk_i )
if (rst_i)
begin
    load_signed_q  <= 1'b0;
    load_byte_q    <= 1'b0;
    load_half_q    <= 1'b0;
    load_offset_q  <= 2'b0;
end
// Valid instruction to execute
else if (opcode_valid_w)
begin
    load_signed_q  <= inst_lh_w | inst_lb_w;
    load_byte_q    <= inst_lb_w | inst_lbu_w;
    load_half_q    <= inst_lh_w | inst_lhu_w;
    load_offset_q  <= mem_addr_w[1:0];
end

assign mem_d_addr_o    = {{ADDR_PAD_W{1'b0}}, mem_addr_q};
assign mem_d_data_wr_o = mem_data_q;
assign mem_d_wr_o      = mem_wr_q;
assign mem_d_rd_o      = mem_rd_q;

//-----------------------------------------------------------------
// Execute: CSR Access
//-----------------------------------------------------------------
uriscv_csr
#(
     .SUPPORT_CSR(SUPPORT_CSR)
    ,.SUPPORT_MCYCLE(SUPPORT_MCYCLE)
    ,.SUPPORT_MTIMECMP(SUPPORT_MTIMECMP)
    ,.SUPPORT_MSCRATCH(SUPPORT_MSCRATCH)
    ,.SUPPORT_MIP_MIE(SUPPORT_MIP_MIE)
    ,.SUPPORT_MTVEC(SUPPORT_MTVEC)
    ,.SUPPORT_MTVAL(SUPPORT_MTVAL)
    ,.SUPPORT_MULDIV(SUPPORT_MUL || SUPPORT_DIV)
)
u_csr
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    // Reset vector (only used if SUPPORT_MTVEC=0)
    ,.isr_vector_i(reset_vector_i + ISR_VECTOR)

    // HartID
    ,.cpu_id_i(cpu_id_i)

    // External interrupt
    ,.intr_i(intr_i)

    // Executing instruction
    ,.valid_i(opcode_valid_w)
    ,.opcode_i(opcode_w)
    ,.pc_i(pc_q)
    ,.rs1_val_i(rs1_val_w)
    ,.rs2_val_i(rs2_val_w)

    // CSR read result
    ,.csr_rdata_o(csr_data_w)

    // Exception sources
    ,.excpn_invalid_inst_i(invalid_inst_r)
    ,.excpn_lsu_align_i(mem_misaligned_w)

    // Used on memory alignment errors
    ,.mem_addr_i(mem_addr_w)

    // CSR registers
    ,.csr_mepc_o(csr_mepc_w)

    // Exception entry
    ,.exception_o(exception_w)
    ,.exception_type_o(exception_type_w)
    ,.exception_pc_o(exception_target_w)
);

//-----------------------------------------------------------------
// Multiplier / Divider
//-----------------------------------------------------------------
generate
if (SUPPORT_MUL != 0 || SUPPORT_DIV != 0)
begin
    uriscv_muldiv
    u_muldiv
    (
        .clk_i(clk_i),
        .rst_i(rst_i),

        // Operation select
        .valid_i(opcode_valid_w & ~exception_w),
        .inst_mul_i(inst_mul_w),
        .inst_mulh_i(inst_mulh_w),
        .inst_mulhsu_i(inst_mulhsu_w),
        .inst_mulhu_i(inst_mulhu_w),
        .inst_div_i(inst_div_w),
        .inst_divu_i(inst_divu_w),
        .inst_rem_i(inst_rem_w),
        .inst_remu_i(inst_remu_w),

        // Operands
        .operand_ra_i(rs1_val_w),
        .operand_rb_i(rs2_val_w),

        // Result
        .stall_o(),
        .ready_o(muldiv_ready_w),
        .result_o(muldiv_result_w)
    );
end
else
begin
    assign muldiv_ready_w  = 1'b0;
    assign muldiv_result_w = 32'b0;
end
endgenerate

//-----------------------------------------------------------------
// Unused
//-----------------------------------------------------------------
assign mem_i_flush_o      = 1'b0;
assign mem_i_invalidate_o = 1'b0;

assign mem_d_flush_o      = 1'b0;
assign mem_d_cacheable_o  = 1'b0;
assign mem_d_req_tag_o    = 11'b0;
assign mem_d_invalidate_o = 1'b0;
assign mem_d_writeback_o  = 1'b0;

//-------------------------------------------------------------------
// Hooks for debug
//-------------------------------------------------------------------
`ifdef verilator
reg        v_dbg_valid_q;
reg [31:0] v_dbg_pc_q;

always @ (posedge clk_i )
if (rst_i)
begin
    v_dbg_valid_q  <= 1'b0;
    v_dbg_pc_q     <= 32'b0;
end
else
begin
    v_dbg_valid_q  <= opcode_valid_w;
    v_dbg_pc_q     <= pc_ext_w;
end

//-------------------------------------------------------------------
// get_valid: Instruction valid
//-------------------------------------------------------------------
function [0:0] get_valid; /*verilator public*/
begin
    get_valid = v_dbg_valid_q;
end
endfunction
//-------------------------------------------------------------------
// get_pc: Get executed instruction PC
//-------------------------------------------------------------------
function [31:0] get_pc; /*verilator public*/
begin
    get_pc = v_dbg_pc_q;
end
endfunction
//-------------------------------------------------------------------
// get_reg_valid: Register contents valid
//-------------------------------------------------------------------
function [0:0] get_reg_valid; /*verilator public*/
    input [4:0] r;
begin    
    get_reg_valid = opcode_valid_w;
end
endfunction
//-------------------------------------------------------------------
// get_register: Read register file
//-------------------------------------------------------------------
function [31:0] get_register; /*verilator public*/
    input [4:0] r;
begin
    get_register = reg_file[r];
end
endfunction
`endif



endmodule
