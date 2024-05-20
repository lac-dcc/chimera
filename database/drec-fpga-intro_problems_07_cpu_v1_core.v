// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module core(
    input clk,
    input [31:0]instr_data,
    input [31:0]last_pc,

    output [31:0]instr_addr
);

reg [31:0]pc = 32'hFFFFFFFF;
wire [31:0]pc_next = (pc == last_pc) ? pc : pc + 1;

always @(posedge clk) begin
    pc <= pc_next;
    $strobe("CPUv1: [%h] %h", pc, instr);
end

wire [31:0]instr = instr_data;
assign instr_addr = pc_next;

wire [4:0]rd  = instr_data[11:7];
wire [4:0]rs1 = instr_data[19:15];
wire [4:0]rs2 = instr_data[24:20];

wire [31:0]rf_rdata0;
wire [4:0]rf_raddr0 = rs1;

wire [31:0]rf_rdata1;
wire [4:0]rf_raddr1 = rs2;

wire [31:0]rf_wdata = alu_result;
wire [4:0]rf_waddr = rd;
wire rf_we;

wire [31:0]alu_result;
wire is_r_type;
wire [31:0]alu_b_src = is_r_type ? rf_rdata1 : imm32;
wire [2:0]alu_op;
alu alu(
    .src_a(rf_rdata0), .src_b(alu_b_src),
    .op(alu_op),
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

control control(
    .instr(instr),
    .imm12(imm12),
    .rf_we(rf_we),
    .alu_op(alu_op),
    .is_r_type(is_r_type)
);

endmodule
