// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

`timescale 1ns / 10ps

/*
	top level wrapper for a 5 stage RISC-V pipeline

  to consume a value in stage q(n), sample the q(n-1) signal

	q1 (assumed)
	q2 instruction decode / register file
	q3 execute / ALU
	q4 memory access
	q5 write back
*/

module core (
    input clk,
    input rst_n
);

  localparam CTRL_WIDTH = 16;
  localparam CTRL_ALUOP1 = 7;
  localparam CTRL_ALUOP0 = 6;
  localparam CTRL_ALUSRC = 5;
  localparam CTRL_IS_BRANCH = 4;
  localparam CTRL_MEM_REN = 3;
  localparam CTRL_MEM_WREN = 2;
  localparam CTRL_REG_WR_EN = 1;
  localparam CTRL_IS_MEM_TO_REG = 0;

  localparam OP_RTYPE = 7'b0110011;
  localparam OP_ITYPE = 7'b0010011;
  localparam OP_LOAD = 7'b0000011;
  localparam OP_STORE = 7'b0100011;
  localparam OP_JAL = 7'b1101111;
  localparam OP_JALR = 7'b1100111;
  localparam OP_BRANCH = 7'b1100011;

  localparam FORWARD_Q2 = 2'b00;  // use value read from regfile
  localparam FORWARD_Q4 = 2'b01;  // use value from prev alu_out
  localparam FORWARD_Q5 = 2'b10;  // use value from prev prev alu_out or mem_rdata

  /* instruction fetch q1 */
  wire [31:0] instr_q1;  // from instrmem (q1)
  wire [4:0] rs1_q1 = instr_q1[19:15];
  wire [4:0] rs2_q1 = instr_q1[24:20];

  /* instruction decode, register file q1 out, q2 in */
  wire [31:0] instr_q2;
  wire [4:0] rd_q2 = instr_q2[11:7];
  wire [4:0] rs1_q2 = instr_q2[19:15];
  wire [4:0] rs2_q2 = instr_q2[24:20];
  wire [6:0] opcode_q2 = instr_q2[6:0];
  wire [19:0] imm_jal_q2 = instr_q2[31:12];

  wire [31:0] pc_q2;
  wire [31:0] pc_incr_q2;

  /* q2 out, q3 in */
  wire [31:0] instr_q3;
  wire [6:0] opcode_q3 = instr_q3[6:0];
  wire [4:0] rd_q3 = instr_q3[11:7];
  wire [4:0] rs1_q3 = instr_q3[19:15];
  wire [4:0] rs2_q3 = instr_q3[24:20];
  wire [2:0] funct3_q3 = instr_q3[14:12];
  wire [6:0] funct7_q3 = instr_q3[31:25];
  wire [3:0] funct_q3 = {funct7_q3[5], funct3_q3};  // this can be cleaned up
  wire [11:0] imm_q3 = ctrl_q3[CTRL_MEM_WREN] ? {imm_upper_q3, imm_lower_q3} : instr_q3[31:20];
  wire [6:0] imm_upper_q3 = instr_q3[31:25];
  wire [4:0] imm_lower_q3 = instr_q3[11:7];

  wire [31:0] imm_se_q3;
  wire [31:0] alu_out_q3 = alu_out;
  wire [31:0] pc_q3;
  wire [31:0] pc_incr_q3;

  /* q3 out, q4 in */
  wire [31:0] mem_rdata_q4 = mem_rdata;
  wire [31:0] instr_q4;
  wire [6:0] opcode_q4 = instr_q4[6:0];
  wire [4:0] rd_q4 = instr_q4[11:7];
  wire [4:0] rs1_q4 = instr_q4[19:15];
  wire [4:0] rs2_q4 = instr_q4[24:20];
  wire [31:0] pc_next_q3 = (imm_se_q3 << 2) | pc_q3;  // this looks dodgy
  wire [31:0] pc_next_q4;
  wire [31:0] alu_out_q4;

  /* q4 out, q5 in */
  wire [31:0] alu_out_q5;
  wire [31:0] instr_q5;
  wire [6:0] opcode_q5 = instr_q5[6:0];
  wire [4:0] rd_q5 = instr_q5[11:7];
  wire [4:0] rs1_q5 = instr_q5[19:15];
  wire [4:0] rs2_q5 = instr_q5[24:20];
  wire [31:0] mem_rdata_q5;

  /* register file  */
  wire [4:0] reg_rd_port1 = rs1_q1;  // decode from q1, pipeline register "absorbed"
  wire [4:0] reg_rd_port2 = rs2_q1;
  wire [31:0] reg_rd_data1;
  wire [31:0] reg_rd_data2;
  wire [4:0] reg_wr_port = reg_wr_port_q4;
  wire [31:0] reg_wr_data = reg_wr_data_q4;

  wire [31:0] reg_rd_data1_q2 = reg_rd_data1;  // alu ops
  wire [31:0] reg_rd_data2_q2 = reg_rd_data2;  // alu ops or memory address
  wire [31:0] reg_rd_data1_q3;
  wire [31:0] reg_rd_data2_q3;
  wire [31:0] reg_rd_data2_q4;
  wire [4:0] reg_wr_port_q2 = rd_q2;  // pipelined to q5
  wire [4:0] reg_wr_port_q3;
  wire [4:0] reg_wr_port_q4;
  wire [4:0] reg_wr_port_q5;
  wire [31:0] reg_wr_data_q4 = ctrl_q4[CTRL_IS_MEM_TO_REG] ? mem_rdata : alu_out_q4;

  /* alu & ctrl */
  wire [31:0] alu_in1 = alu_in1_forwarded;
  wire [31:0] alu_in2 = alu_in2_forwarded;
  wire [3:0] aluctrl_ctrl;
  wire [31:0] alu_out;
  wire [31:0] alu_in1_pre = reg_rd_data1_q3;
  wire [31:0] alu_in2_pre = ctrl_q3[CTRL_ALUSRC] ? reg_rd_data2_q3 : imm_se_q3;
  wire [1:0] ctrl_aluop = {ctrl_q3[CTRL_ALUOP1], ctrl_q3[CTRL_ALUOP0]};

  /* data memory */
  wire ctrl_mem_ren = ctrl_q3[CTRL_MEM_REN];
  wire ctrl_mem_wren = ctrl_q3[CTRL_MEM_WREN];
  wire [31:0] mem_addr = alu_out_q3;
  wire [31:0] mem_wdata = mem_wdata_forwarded;
  wire [31:0] mem_rdata;
  reg [31:0] mem_wdata_forwarded;

  /* main control unit */
  wire [CTRL_WIDTH-1:0] ctrl_q2;
  wire [CTRL_WIDTH-1:0] ctrl_q3;
  wire [CTRL_WIDTH-1:0] ctrl_q4;
  wire [CTRL_WIDTH-1:0] ctrl_q5;

  /* forwarding unit */
  reg [1:0] forward_alu_in1;
  reg [1:0] forward_alu_in2;
  reg [1:0] forward_mem_wdata;

  reg [31:0] alu_in1_forwarded;
  reg [31:0] alu_in2_forwarded;

  instrmem #(
      .PRELOAD(1),
      .PRELOAD_FILE("build/core.hex")
  ) instrmem_u (
      .clk    (clk),
      .rst_n  (rst_n),
      .pc_i   (pc),
      .instr_o(instr_q1)
  );

  alu alu_u (
      .alu_a_i       (alu_in1),
      .alu_b_i       (alu_in2),
      .aluctrl_ctrl_i(aluctrl_ctrl),
      .alu_out_o     (alu_out)
  );

  regfile regfile_u (
      .clk             (clk),
      .rst_n           (rst_n),
      .rd_port1_i      (reg_rd_port1),
      .rd_port2_i      (reg_rd_port2),
      .rd_data1_o      (reg_rd_data1),
      .rd_data2_o      (reg_rd_data2),
      .wr_port_i       (reg_wr_port),
      .wr_data_i       (reg_wr_data),
      .ctrl_reg_wr_en_i(ctrl_q5[CTRL_REG_WR_EN])
  );

  control #(
      .CTRL_WIDTH(CTRL_WIDTH)
  ) control_u (
      .opcode_i(opcode_q2),
      .ctrl_o  (ctrl_q2)
  );

  aluctrl alucontrol_u (
      .ctrl_aluop_i  (ctrl_aluop),
      .funct_i       (funct_q3),
      .aluctrl_ctrl_o(aluctrl_ctrl)
  );

  memory #(
      .PRELOAD     (1),
      .PRELOAD_FILE("sim/dmem.hex")
  ) memory_u (
      .rst_n          (rst_n),
      .clk            (clk),
      .ctrl_mem_ren_i (ctrl_mem_ren),
      .ctrl_mem_wren_i(ctrl_mem_wren),
      .mem_addr_i     (mem_addr),
      .mem_wdata_i    (mem_wdata),
      .mem_rdata_o    (mem_rdata)
  );


  /* pipeline registers */

  q1q2 q1q2_u (
      .clk      (clk),
      .rst_n    (rst_n),
      .pc_i     (pc),
      .pc_o     (pc_q2),
      .pc_incr_i(pc_incr),
      .pc_incr_o(pc_incr_q2),
      .instr_i  (instr_q1),
      .instr_o  (instr_q2)
  );

  q2q3 #(
      .CTRL_WIDTH(CTRL_WIDTH)
  ) q2q3_u (
      .clk           (clk),
      .rst_n         (rst_n),
      .pc_i          (pc_q2),
      .pc_o          (pc_q3),
      .pc_incr_i     (pc_incr_q2),
      .pc_incr_o     (pc_incr_q3),
      .reg_rd_data1_i(reg_rd_data1_q2),
      .reg_rd_data1_o(reg_rd_data1_q3),
      .reg_rd_data2_i(reg_rd_data2_q2),
      .reg_rd_data2_o(reg_rd_data2_q3),
      .reg_wr_port_i (reg_wr_port_q2),
      .reg_wr_port_o (reg_wr_port_q3),
      .ctrl_q2_i     (ctrl_q2),
      .ctrl_q2_o     (ctrl_q3),
      .instr_i       (instr_q2),
      .instr_o       (instr_q3)
  );

  q3q4 #(
      .CTRL_WIDTH(CTRL_WIDTH)
  ) q3q4_u (
      .clk           (clk),
      .rst_n         (rst_n),
      .pc_next_i     (pc_next_q3),
      .pc_next_o     (pc_next_q4),
      .reg_wr_port_i (reg_wr_port_q3),
      .reg_wr_port_o (reg_wr_port_q4),
      .reg_rd_data2_i(reg_rd_data2_q3),
      .reg_rd_data2_o(reg_rd_data2_q4),
      .alu_out_i     (alu_out_q3),
      .alu_out_o     (alu_out_q4),
      .ctrl_q3_i     (ctrl_q3),
      .ctrl_q3_o     (ctrl_q4),
      .instr_i       (instr_q3),
      .instr_o       (instr_q4)
  );

  q4q5 #(
      .CTRL_WIDTH(CTRL_WIDTH)
  ) q4q5_u (
      .clk          (clk),
      .rst_n        (rst_n),
      .alu_out_i    (alu_out_q4),
      .alu_out_o    (alu_out_q5),
      .reg_wr_port_i(reg_wr_port_q4),
      .reg_wr_port_o(reg_wr_port_q5),
      .mem_rdata_i  (mem_rdata_q4),
      .mem_rdata_o  (mem_rdata_q5),
      .ctrl_q4_i    (ctrl_q4),
      .ctrl_q4_o    (ctrl_q5),
      .instr_i      (instr_q4),
      .instr_o      (instr_q5)
  );

  /*
sign extension
note to self: SRLI, SLLI, SRAI use a specialization of the I-format
but this does not affect our logic as a sign extension
does not affect the lower 5 bits of the immediate
which is what we actually care about
*/
  assign imm_se_q3 = {{20{imm_q3[11]}}, imm_q3};
  wire [31:0] pc_incr = pc + 4;
  wire pc_jal_q2;
  reg  [31:0] pc;  // need PC immediately in fetch
  reg  [31:0] pc_incr_last;
  always @(*) begin
    pc = pc_incr_last;
    if (ctrl_q4[CTRL_IS_BRANCH]) begin
      pc = pc_next_q4;
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      pc_incr_last <= 0;
    end else begin
      pc_incr_last <= pc_incr;
    end
  end

  // simple forwarding logic (forwarding unit)
  // hazards a and b occur in the execution stage
  reg hazard_a_in1, hazard_b_in1, hazard_a_in2, hazard_b_in2;
  reg hazard_c, hazard_d;
  always @(*) begin
    forward_alu_in1 = FORWARD_Q2;
    forward_alu_in2 = FORWARD_Q2;
    forward_mem_wdata = FORWARD_Q2;
    /*
  		add x1, x2, x3
  		add x4, x1, x5 // hazard a)
  		add x6, x7, x1 // hazard b)

  		add x1, x1, x2
  		add x1, x1, x3 // hazard a)
  		add x1, x1, x4 // hazard b.2) requires values of x1 from 2nd instr
  	
		add x1, x2, x3
		sw x1, x3 // x3: hazard a, x1: hazard c, result required for MEM but not available until WB
		sw x1, x4 // x1: hazard d, result required for MEM but only available after WB

		lw x1, x2
		sw x1, x3 // hazard c: x1 forwarded from MEM/WB(q5) regs

    hazard b: do not forward ALU for sw op, hazard_b_in2 will go high without last condition
  	*/
    hazard_a_in1 = ctrl_q4[CTRL_REG_WR_EN] && rd_q4 === rs1_q3 && rd_q4 !== 5'b0;  // EX/MEM hazard
    hazard_b_in1 = ctrl_q5[CTRL_REG_WR_EN] && rd_q5 === rs1_q3 && rd_q5 !== 5'b0;  // MEM/WB hazard
    hazard_a_in2 = ctrl_q4[CTRL_REG_WR_EN] && rd_q4 === rs2_q3 && rd_q4 !== 5'b0;
    hazard_b_in2 = ctrl_q5[CTRL_REG_WR_EN] && rd_q5 === rs2_q3 && rd_q5 !== 5'b0 && !ctrl_q3[CTRL_MEM_WREN];
    hazard_c = ctrl_q4[CTRL_REG_WR_EN] && rd_q4 === rs2_q3 && rd_q4 !== 5'b0;
    hazard_d = ctrl_q5[CTRL_REG_WR_EN] && rd_q5 === rs2_q3 && rd_q5 !== 5'b0;
    if (hazard_a_in1) forward_alu_in1 = FORWARD_Q4;
    if (hazard_b_in1 && !hazard_a_in1)
      forward_alu_in1 = FORWARD_Q5;  // always forward most recent value
    if (hazard_a_in2) forward_alu_in2 = FORWARD_Q4;
    if (hazard_b_in2 && !hazard_a_in2) forward_alu_in2 = FORWARD_Q5;
    if (hazard_c) forward_mem_wdata = FORWARD_Q4;
    if (hazard_d) forward_mem_wdata = FORWARD_Q5;
  end

  always @(*) begin
    case (forward_alu_in1)
      FORWARD_Q2: alu_in1_forwarded = alu_in1_pre;
      FORWARD_Q4: alu_in1_forwarded = alu_out_q4;
      FORWARD_Q5: alu_in1_forwarded = alu_out_q5;
    endcase
  end

  always @(*) begin
    case (forward_alu_in2)
      FORWARD_Q2: alu_in2_forwarded = alu_in2_pre;
      FORWARD_Q4: alu_in2_forwarded = alu_out_q4;
      FORWARD_Q5: alu_in2_forwarded = alu_out_q5;
    endcase
  end

  always @(*) begin
    // MEM is clocked so we must make the forwarded data immediately available (before clock edge)
    case (forward_mem_wdata)
      FORWARD_Q2: mem_wdata_forwarded = reg_rd_data2_q3;
      FORWARD_Q4: mem_wdata_forwarded = alu_out_q4;
      FORWARD_Q5: mem_wdata_forwarded = alu_out_q5;
    endcase
  end

  // hazard detection unit
endmodule
