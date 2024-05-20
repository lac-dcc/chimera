// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module core #(
    parameter START_PC = 32'h0,
    parameter ROM_ADDR_WIDTH = 5
)(
    input clk,
    input [31:0]instr_data,

    output [31:0]instr_addr,
    output [31:0]mem_addr,
    output [31:0]mem_data,
    output mem_we
);

localparam LAST_PC = START_PC + 2**ROM_ADDR_WIDTH - 1;

reg [31:0]pc = START_PC - 1;
wire [31:0]pc_target = branch_taken ? branch_target : pc + 1;
wire [31:0]pc_next = (pc == LAST_PC) ? pc : pc_target;

always @(posedge clk) begin
    pc <= pc_next;
`ifdef __ICARUS__
    $strobe("[pc = %h] %h", pc, instr);
`endif
end

wire [31:0]instr = instr_data;
assign instr_addr = pc_next;

wire [4:0]rd = instr[11:7];
wire [4:0]rs1 = instr[19:15];
wire [4:0]rs2 = instr[24:20];

wire [31:0]rf_rdata0;
wire [4:0]rf_raddr0 = rs1;

wire [31:0]rf_rdata1;
wire [4:0]rf_raddr1 = rs2;

wire [31:0]rf_wdata = alu_result;
wire [4:0]rf_waddr = rd;
wire rf_we;

assign mem_addr = alu_result;
assign mem_data = rf_rdata1;

wire has_imm;
wire [31:0]alu_result;
wire [31:0]alu_b_src = has_imm ? imm32 : rf_rdata1;
wire [2:0]alu_op;
wire alu_alt;
alu alu(
    .src_a(rf_rdata0), .src_b(alu_b_src),
    .op(alu_op), .alt(alu_alt),
    .res(alu_result)
);

reg_file rf(
    .clk(clk),
    .raddr0(rf_raddr0), .rdata0(rf_rdata0),
    .raddr1(rf_raddr1), .rdata1(rf_rdata1),
    .waddr(rf_waddr), .wdata(rf_wdata), .we(rf_we)
);

wire [11:0]imm12;
wire [31:0]imm32 = {{20{imm12[11]}}, imm12};

wire inv_cmp;
wire is_branch;
wire branch_taken = is_branch ? (inv_cmp ^ |alu_result) : 1'b0;
wire [31:0]branch_target = pc + imm32;
control control(
    .instr(instr),
    .imm12(imm12),
    .rf_we(rf_we),
    .alu_op(alu_op),
    .has_imm(has_imm),
    .mem_we(mem_we),
    .alu_alt(alu_alt),
    .inv_cmp(inv_cmp),
    .is_branch(is_branch)
);

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module core #(
    parameter START_PC = 32'h0,
    parameter ROM_ADDR_WIDTH = 5
)(
    input clk,
    input [31:0]instr_data,

    output [31:0]instr_addr,
    output [31:0]mem_addr,
    output [31:0]mem_data,
    output mem_we
);

localparam LAST_PC = START_PC + 2**ROM_ADDR_WIDTH - 1;

reg [31:0]pc = START_PC - 1;
wire [31:0]pc_target = branch_taken ? branch_target : pc + 1;
wire [31:0]pc_next = (pc == LAST_PC) ? pc : pc_target;

always @(posedge clk) begin
    pc <= pc_next;
`ifdef __ICARUS__
    $strobe("[pc = %h] %h", pc, instr);
`endif
end

wire [31:0]instr = instr_data;
assign instr_addr = pc_next;

wire [4:0]rd = instr[11:7];
wire [4:0]rs1 = instr[19:15];
wire [4:0]rs2 = instr[24:20];

wire [31:0]rf_rdata0;
wire [4:0]rf_raddr0 = rs1;

wire [31:0]rf_rdata1;
wire [4:0]rf_raddr1 = rs2;

wire [31:0]rf_wdata = alu_result;
wire [4:0]rf_waddr = rd;
wire rf_we;

assign mem_addr = alu_result;
assign mem_data = rf_rdata1;

wire has_imm;
wire [31:0]alu_result;
wire [31:0]alu_b_src = has_imm ? imm32 : rf_rdata1;
wire [2:0]alu_op;
wire alu_alt;
alu alu(
    .src_a(rf_rdata0), .src_b(alu_b_src),
    .op(alu_op), .alt(alu_alt),
    .res(alu_result)
);

reg_file rf(
    .clk(clk),
    .raddr0(rf_raddr0), .rdata0(rf_rdata0),
    .raddr1(rf_raddr1), .rdata1(rf_rdata1),
    .waddr(rf_waddr), .wdata(rf_wdata), .we(rf_we)
);

wire [11:0]imm12;
wire [31:0]imm32 = {{20{imm12[11]}}, imm12};

wire inv_cmp;
wire is_branch;
wire branch_taken = is_branch ? (inv_cmp ^ |alu_result) : 1'b0;
wire [31:0]branch_target = pc + imm32;
control control(
    .instr(instr),
    .imm12(imm12),
    .rf_we(rf_we),
    .alu_op(alu_op),
    .has_imm(has_imm),
    .mem_we(mem_we),
    .alu_alt(alu_alt),
    .inv_cmp(inv_cmp),
    .is_branch(is_branch)
);

endmodule
