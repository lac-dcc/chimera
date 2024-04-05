module cpu(
  input wire clk,
  input wire reset,
  output wire [7:0] addr_bus,
  output wire c_ri,
  output wire c_ro,
  output reg mem_clk,
  output wire mem_io,   // Select memory if low or I/O if high
  inout wire [7:0] bus
);

  `include "rtl/parameters.v"

  wire flag_zero;
  wire flag_carry;


  // ==========================
  // Clocks
  // ==========================

  reg cycle_clk = 0;
  reg internal_clk = 0;
  reg [2:0] cnt = 'b100;
  reg halted = 0;
  always @ (posedge clk & ~halted) begin
    {cycle_clk, mem_clk, internal_clk} <= cnt;

    case (cnt)
      'b100 : cnt = 'b010;
      'b010 : cnt = 'b001;
      'b001 : cnt = 'b100;
    endcase
  end


  // ==========================
  // Registers
  // ==========================

  // General Purpose Registers
  wire [2:0] sel_in;
  wire [2:0] sel_out;
  wire [7:0] rega_out;
  wire [7:0] regb_out;
  wire c_rfi, c_rfo;
  cpu_registers m_registers (
    .clk(internal_clk),
    .data_in(bus),
    .sel_in(sel_in),
    .sel_out(sel_out),
    .enable_write(c_rfi),
    .output_enable(c_rfo),
    .data_out(bus),
    .rega(rega_out),
    .regb(regb_out)
  );

  // Instruction Register
  wire [7:0] regi_out;
  wire c_ii;
  register m_regi (
    .in(bus),
    .clk(internal_clk),
    .enable(c_ii),
    .reset(reset),
    .out(regi_out)
  );

  // Memory Address Register
  wire c_mi;
  register m_mar (
    .in(bus),
    .clk(internal_clk),
    .enable(c_mi),
    .reset(reset),
    .out(addr_bus)
  );


  // ==========================
  // Program Counter
  // ==========================

  wire [7:0] pc_out;
  wire c_co, c_ci, c_j;
  counter m_pc (
    .clk(c_ci & internal_clk),
    .in(bus),
    .sel_in(c_j),
    .reset(reset),
    .down(1'b0),
    .out(pc_out)
  );
  tristate_buffer m_pc_buf (
    .in(pc_out),
    .enable(c_co),
    .out(bus)
  );


  // ==========================
  // Stack Pointer
  // ==========================

  wire [7:0] sp_out;
  wire c_si, c_sd, c_so;
  counter m_sp (
    .clk(reset | (c_si & internal_clk)),
    .in(8'hFF),
    .sel_in(reset),
    .reset(1'b0),
    .down(c_sd),
    .out(sp_out)
  );
  tristate_buffer m_sp_buf (
    .in(sp_out),
    .enable(c_so),
    .out(bus)
  );


  // ==========================
  // ALU
  // ==========================

  wire c_eo;
  wire c_ee;
  wire [7:0] alu_out;
  wire [2:0] alu_mode;
  alu m_alu (
    .clk(internal_clk),
    .enable(c_ee),
    .in_a(rega_out),
    .in_b(regb_out),
    .out(alu_out),
    .mode(alu_mode),
    .flag_zero(flag_zero),
    .flag_carry(flag_carry)
  );
  tristate_buffer m_alu_buf (
    .in(alu_out),
    .enable(c_eo),
    .out(bus)
  );


  // ==========================
  // Control logic
  // ==========================

  wire c_halt, next_state, mov_memory, jump_allowed;
  wire [7:0] state;
  wire [7:0] instruction;
  wire [7:0] opcode;
  wire [3:0] cycle;
  wire [2:0] operand1;
  wire [2:0] operand2;

  assign instruction = regi_out;
  assign operand1    = instruction[5:3];
  assign operand2    = instruction[2:0];
  assign next_state  = state == `STATE_NEXT | reset;

  assign mem_io = state == `STATE_OUT | state == `STATE_IN;

  assign mov_memory   = operand1 == 3'b111 | operand2 == 3'b111;
  assign jump_allowed = operand2 == `JMP_JMP
                      | ((operand2 == `JMP_JZ) & flag_zero)
                      | ((operand2 == `JMP_JNZ) & ~flag_zero)
                      | ((operand2 == `JMP_JC) & flag_carry)
                      | ((operand2 == `JMP_JNC) & ~flag_carry);
  assign alu_mode     = (opcode == `OP_ALU) ? operand1 :
                        (opcode == `OP_CMP) ? `ALU_SUB : 'bx;

  assign sel_in = (opcode == `OP_ALU | opcode == `OP_IN) ? `REG_A :
                  (opcode == `OP_MOV) ? operand1 :
                  (opcode == `OP_POP | opcode == `OP_LDI) ? operand2 :
                  (opcode == `OP_CALL) ? `REG_T :
                  'bx;

  assign sel_out = (opcode == `OP_OUT) ? `REG_A :
                   (opcode == `OP_PUSH | opcode == `OP_MOV) ? operand2 :
                   (opcode == `OP_CALL) ? `REG_T :
                   'bx;

  assign c_rfi  = state == `STATE_ALU_OUT |
                  state == `STATE_IN |
                  state == `STATE_SET_ADDR |
                  state == `STATE_SET_REG |
                  (state == `STATE_MOV_STORE & operand1 != 3'b111);
  assign c_rfo  = state == `STATE_OUT |
                  state == `STATE_TMP_JUMP |
                  state == `STATE_REG_STORE |
                  (state == `STATE_MOV_STORE & operand2 != 3'b111);
  assign c_ci   = state == `STATE_FETCH_PC |
                  state == `STATE_RET |
                  (state == `STATE_JUMP & jump_allowed) |
                  state == `STATE_TMP_JUMP |
                  (state == `STATE_MOV_FETCH & mov_memory);
  assign c_co   = state == `STATE_FETCH_PC |
                  state == `STATE_PC_STORE |
                  (state == `STATE_MOV_FETCH & mov_memory);
  assign c_eo   = state == `STATE_ALU_OUT;
  assign c_halt = state == `STATE_HALT;
  assign c_ii   = state == `STATE_FETCH_INST;
  assign c_j    = (state == `STATE_JUMP & jump_allowed) |
                  state == `STATE_RET |
                  state == `STATE_TMP_JUMP;
  assign c_mi   = state == `STATE_FETCH_PC |
                  state == `STATE_FETCH_SP |
                  state == `STATE_SET_ADDR |
                  ((state == `STATE_MOV_FETCH | state == `STATE_MOV_LOAD) & mov_memory);
  assign c_ro   = state == `STATE_FETCH_INST |
                  (state == `STATE_JUMP & jump_allowed) |
                  state == `STATE_RET |
                  state == `STATE_SET_ADDR |
                  state == `STATE_SET_REG |
                  (state == `STATE_MOV_LOAD & mov_memory) |
                  (state == `STATE_MOV_STORE & operand2 == 3'b111);
  assign c_ri   = (state == `STATE_MOV_STORE & operand1 == 3'b111) |
                  state == `STATE_REG_STORE |
                  state == `STATE_PC_STORE;
  assign c_so   = state == `STATE_FETCH_SP;
  assign c_sd   = state == `STATE_TMP_JUMP |
                  state == `STATE_REG_STORE;
  assign c_si   = state == `STATE_TMP_JUMP |
                  state == `STATE_REG_STORE |
                  state == `STATE_INC_SP;
  assign c_ee   = state == `STATE_ALU_EXEC;

  cpu_control m_ctrl (
    .instruction(instruction),
    .state(state),
    .reset_cycle(next_state),
    .clk(cycle_clk),
    .cycle(cycle),
    .opcode(opcode)
  );

  always @ (posedge c_halt) begin
    halted = 1;
  end

endmodule
