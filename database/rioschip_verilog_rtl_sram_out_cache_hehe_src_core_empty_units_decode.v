// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef DECODE_V
`define DECODE_V

`include "../params.vh"
module decode (
    input clk,
    input rstn,
    // from fetch
    input [31:0] pc_in,
    input [31:0] next_pc_in,
    input [31:0] instruction_in,
    input valid_in,

    input exception_in,
    input [EXCEPTION_CODE_WIDTH-1:0] ecause_in,

    // from rob
    input ready_in,

    //from fu, maybe fu todo
    input branch_back,

    //pipeline control
    input trapped,
    input wfi_in,

    // to csr
    output [11:0] csr_address,

    // from csr
    input [63:0] csr_data,
    input csr_readable,
    input csr_writeable,

    // to rob
    output reg uses_rs1,
    output reg uses_rs2,
    output reg uses_rd,
    output reg uses_csr,
    output reg [VIRTUAL_ADDR_LEN-1 :0] pc_out,
    output reg [VIRTUAL_ADDR_LEN-1 :0] next_pc_out,
    output reg [VIR_REG_ADDR_WIDTH-1:0] rs1_address_out,
    output reg [VIR_REG_ADDR_WIDTH-1:0] rs2_address_out,
    output reg [VIR_REG_ADDR_WIDTH-1:0] rd_address_out,
    output reg [CSR_ADDR_LEN-1:0] csr_address_out,
    output reg mret_out,
    output reg wfi_out,
    output reg [3:0] ecause_out,
    output reg exception_out,  //64 alu addition
    output reg half,
    output reg is_fence,

    //to rob (control)
    output reg valid_out,

    // to fetch
    output reg ready_out,

    // to rob (csr)
    output reg csr_read_out,
    output reg csr_write_out,
    output reg csr_readable_out,
    output reg csr_writeable_out,

    // to rob (alu)
    output reg [63:0] csr_data_out,
    output reg [31:0] imm_data_out,
    output reg [2:0] alu_function_out,
    output reg alu_function_modifier_out,
    output reg [1:0] alu_select_a_out,
    output reg [1:0] alu_select_b_out,
    output reg [2:0] cmp_function_out,

    // to rob (branch)
    output reg jump_out,
    output reg branch_out,

    // to rob (lsu)
    output reg is_alu_out,
    output reg load_out,
    output reg store_out,
    output reg [1:0] load_store_size_out,
    output reg load_signed_out

);
wire [VIR_REG_ADDR_WIDTH-1:0] rs1_address;
wire [VIR_REG_ADDR_WIDTH-1:0] rs2_address;

  wire [31:0] instr = instruction_in;
  assign rs1_address = instr[19:15];
  assign rs2_address = instr[24:20];
  assign csr_address = instr[31:20];
  wire [4:0] rd_address;
  assign rd_address  = instr[11:7];

  wire [4:0] rs1_address_out_w;
  wire [4:0] rs2_address_out_w;
  reg uses_rs1_w;
  reg uses_rs2_w;
  reg uses_csr_w;

  assign rs1_address_out_w = rs1_address;
  assign rs2_address_out_w = rs2_address;
  

  

  always @(*) begin
    case (instr[6:0])
      7'b1100111,  // JALR
      7'b0000011,  // LOAD
      7'b0010011,  // OP-IMM
      7'b0011011: // OP-IMM half
        begin
        uses_rs1_w = 1;
        uses_rs2_w = 0;
        uses_csr_w = 0;
      end
      7'b1100011,  // Branch
      7'b0100011,  // STORE
      7'b0110011,  // OP
      7'b0111011: // OP half
        begin
        uses_rs1_w = 1;
        uses_rs2_w = 1;
        uses_csr_w = 0;
      end
      7'b1110011: begin  // SYSTEM
        uses_rs2_w = 0;
        case (instr[14:12])
          3'b001: begin  // CSRRW
            uses_rs1_w = 1;
            uses_csr_w = 1 && (rd_address != 0);
          end
          3'b010,  // CSRRS
          3'b011: // CSRRC
                begin
            uses_rs1_w = 1;
            uses_csr_w = 1;
          end
          3'b101: begin  // CSRRWI
            uses_rs1_w = 0;
            uses_csr_w = 1 && (rd_address != 0);
          end
          3'b110,  // CSRRSI
          3'b111: // CSRRCI
                begin
            uses_rs1_w = 0;
            uses_csr_w = 1;
          end
          default: begin
            uses_rs1_w = 0;
            uses_csr_w = 0;
          end
        endcase
      end
      default: begin
        uses_rs1_w = 0;
        uses_rs2_w = 0;
        uses_csr_w = 0;
      end
    endcase
  end

always @(posedge clk) begin
    if (rstn) begin
        uses_rs1 <= 0; 
        uses_rs2 <= 0;
        uses_csr <= 0;
        rs1_address_out <= 0;
        rs2_address_out <= 0;
    end else if (valid_in & ready_out) begin
        uses_rs1 <= uses_rs1_w; 
        uses_rs2 <= uses_rs2_w;
        uses_csr <= uses_csr_w;
        rs1_address_out <= rs1_address_out_w;
        rs2_address_out <= rs2_address_out_w;
    end
end

  // possible immediate values
  wire [31:0] u_type_imm_data = {instr[31:12], 12'b0};
  wire [31:0] j_type_imm_data = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
  wire [31:0] i_type_imm_data = {{20{instr[31]}}, instr[31:20]};
  wire [31:0] s_type_imm_data = {{20{instr[31]}}, instr[31:25], instr[11:7]};
  wire [31:0] b_type_imm_data = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
  wire [31:0] csr_type_imm_data = {27'b0, rs1_address};

  // wire signals 
  reg [31:0] pc_out_w;
  reg [31:0] next_pc_out_w;
  reg [63:0] csr_data_out_w;
  reg [31:0] imm_data_out_w;
  reg [11:0] csr_address_out_w;
  reg csr_readable_out_w;
  reg csr_writeable_out_w;
  reg [2:0] alu_function_out_w;
  reg alu_function_modifier_out_w;
  reg [1:0] alu_select_a_out_w;
  reg [1:0] alu_select_b_out_w;
  reg jump_out_w;
  reg branch_out_w;
  reg is_alu_out_w;
  reg load_out_w;
  reg store_out_w;
  reg uses_rd_w;
  reg [4:0] rd_address_out_w;
  reg csr_read_out_w;
  reg csr_write_out_w;
  reg mret_out_w;
  reg wfi_out_w;
  reg [3:0] ecause_out_w;
  reg exception_out_w;
  reg [2:0] cmp_function_out_w;
  reg [1:0] load_store_size_out_w;
  reg load_signed_out_w;
  reg half_w;
  reg is_fence_w;

  reg rff_branch;
/*verilator lint_off LATCH*/
  always @(*) begin
    if (rstn) begin
      rff_branch = 0;
    end else if (branch_back) begin
      rff_branch = 0;
    end else if (branch_out_w & valid_in) begin
      rff_branch = 1;
    end
  end
/*verilator lint_on LATCH*/

  always @(*) begin
    pc_out_w = pc_in;
    next_pc_out_w = next_pc_in;
    csr_data_out_w = csr_data;
    imm_data_out_w = 0;
    csr_address_out_w = csr_address;
    csr_readable_out_w = csr_readable;
    csr_writeable_out_w = csr_writeable;
    alu_function_out_w = ALU_OR;
    alu_function_modifier_out_w = 0;
    alu_select_a_out_w = ALU_SEL_IMM;
    alu_select_b_out_w = ALU_SEL_IMM;
    jump_out_w = 0;
    branch_out_w = 0;
    is_alu_out_w = 1;
    load_out_w = 0;
    store_out_w = 0;
    uses_rd_w = 0;
    rd_address_out_w = 0;
    csr_read_out_w = 0;
    csr_write_out_w = 0;
    mret_out_w = 0;
    wfi_out_w = 0;
    ecause_out_w = ecause_in;
    exception_out_w = exception_in;
    cmp_function_out_w = instr[14:12];
    load_store_size_out_w = instr[13:12];
    load_signed_out_w = !instr[14];
    half_w = 0;
    is_fence_w = 0;
    case (instr[6:0])
      7'b0110111: begin  // LUI
        uses_rd_w = 1;
        imm_data_out_w = u_type_imm_data;
        rd_address_out_w = rd_address;
      end
      7'b0010111: begin  // AUIPC
        uses_rd_w = 1;
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_PC;
        imm_data_out_w = u_type_imm_data;
        rd_address_out_w = rd_address;
      end
      7'b1101111: begin  // JAL
        uses_rd_w = 1;
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_PC;
        imm_data_out_w = j_type_imm_data;
        branch_out_w = 1;
        jump_out_w = 1;
        rd_address_out_w = rd_address;
      end
      7'b1100111: begin  // JALR
        uses_rd_w = 1;
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_REG;
        imm_data_out_w = i_type_imm_data;
        
        branch_out_w = 1;
        jump_out_w = 1;
        rd_address_out_w = rd_address;
        if (instr[14:12] != 0) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b1100011: begin  // Branch
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_PC;
        imm_data_out_w = b_type_imm_data;
        branch_out_w = 1;
        if (instr[14:13] == 2'b01) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0000011: begin  // LOAD
        uses_rd_w = 1;
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_REG;
        imm_data_out_w = i_type_imm_data;
        
        is_alu_out_w = 0;  //because of AGU
        load_out_w = 1;
        rd_address_out_w = rd_address;
        if ((instr[14] && instr[13:12] == 2'b11)) begin  // ldu
          ecause_out_w = 2;
          exception_out_w = 1;
        end
      end
      7'b0100011: begin  // STORE
        alu_function_out_w = ALU_ADD_SUB;
        alu_select_a_out_w = ALU_SEL_REG;
        imm_data_out_w = s_type_imm_data;
        is_alu_out_w = 0;  //because of AGU
        store_out_w = 1;

        if (instr[14]) begin  // risc64i support sd
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0010011: begin  // OP-IMM 64
        uses_rd_w = 1;
        alu_function_out_w = instr[14:12];
        alu_function_modifier_out_w = (instr[14:12] == 3'b101 && instr[30]);
        alu_select_a_out_w = ALU_SEL_REG;
        imm_data_out_w = i_type_imm_data;
        rd_address_out_w = rd_address;
        if ((instr[14:12] == 3'b001 && instr[31:26] != 0)  // slli 
            || (instr[14:12] == 3'b101 && (instr[31] != 0 || instr[29:26] != 0))  // srai & srli 
            ) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0011011: begin  // OP-IMM 64 half_w
        uses_rd_w = 1;
        alu_function_out_w = instr[14:12];
        alu_function_modifier_out_w = (instr[14:12] == 3'b101 && instr[30]);
        alu_select_a_out_w = ALU_SEL_REG;
        imm_data_out_w = i_type_imm_data;
        rd_address_out_w = rd_address;
        half_w = 1;
        if (
                (instr[14:12] == 3'b001 && instr[31:25] != 0)
                || (instr[14:12] == 3'b101 && (instr[31] != 0 || instr[29:25] != 0))
            ) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0110011: begin  // OP 64
        uses_rd_w = 1;
        alu_function_out_w = instr[14:12];
        alu_function_modifier_out_w = instr[30];
        alu_select_a_out_w = ALU_SEL_REG;
        alu_select_b_out_w = ALU_SEL_REG;
        rd_address_out_w = rd_address;
        if (instr[31:25] != 0 && (instr[31:25] != 7'b0100000 || (instr[14:12] != 0 && instr[14:12] != 3'b101))) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0111011: begin  // OP 64 half_w
        uses_rd_w = 1;
        alu_function_out_w = instr[14:12];
        alu_function_modifier_out_w = instr[30];
        alu_select_a_out_w = ALU_SEL_REG;
        alu_select_b_out_w = ALU_SEL_REG;
        rd_address_out_w = rd_address;
        half_w = 1;
        if (instr[31:25] != 0 && (instr[31:25] != 7'b0100000 || (instr[14:12] != 0 && instr[14:12] != 3'b101))) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b0001111: begin  // FENCE / FENCE.I
        is_alu_out_w = 0;
        is_fence_w = 1;
        if (instr[14:13] != 0) begin
          ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
          exception_out_w = 1;
        end
      end
      7'b1110011: begin  // SYSTEM
        case (instr[14:12])
          3'b000: begin  // PRIV
            case (instr[24:20])
              5'b00000: begin  // ECALL
                is_alu_out_w = 0;
                ecause_out_w = EXCEPTION_ENV_CALL_M;
                exception_out_w = 1;
                if (instr[31:25] != 0 || instr[19:15] != 0 || instr[11:7] != 0) begin
                  ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
                end
              end
              5'b00001: begin  // EBREAK
                is_alu_out_w = 0;
                ecause_out_w = EXCEPTION_BREAKPOINT;
                exception_out_w = 1;
                if (instr[31:25] != 0 || instr[19:15] != 0 || instr[11:7] != 0) begin
                  ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
                end
              end
              5'b00010: begin  // MRET
                is_alu_out_w = 0;
                mret_out_w   = 1;
                if (instr[31:25] != 7'b0011000 || instr[19:15] != 0 || instr[11:7] != 0) begin
                  ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
                  exception_out_w = 1;
                end
              end
              5'b00101: begin  // WFI
                is_alu_out_w = 0;
                wfi_out_w = 1;
                if (instr[31:25] != 7'b0001000 || instr[19:15] != 0 || instr[11:7] != 0) begin
                  ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
                  exception_out_w = 1;
                end
              end
              default: begin
                is_alu_out_w = 0;
                ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
                exception_out_w = 1;
              end
            endcase
          end
          3'b001: begin  // CSRRW
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            alu_select_a_out_w = ALU_SEL_REG;
            csr_read_out_w = (rd_address != 0);
            csr_write_out_w = 1;
          end
          3'b010: begin  // CSRRS
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            alu_select_a_out_w = ALU_SEL_REG;
            alu_select_b_out_w = ALU_SEL_CSR;
            csr_read_out_w = 1;
            csr_write_out_w = (rs1_address != 0);
          end
          3'b011: begin  // CSRRC
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            alu_function_out_w = ALU_AND_CLR;
            alu_function_modifier_out_w = 1;
            alu_select_a_out_w = ALU_SEL_REG;
            alu_select_b_out_w = ALU_SEL_CSR;
            csr_read_out_w = 1;
            csr_write_out_w = (rs1_address != 0);
          end
          3'b101: begin  // CSRRWI
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            imm_data_out_w = csr_type_imm_data;
            csr_read_out_w = (rd_address != 0);
            csr_write_out_w = 1;
          end
          3'b110: begin  // CSRRSI
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            alu_select_b_out_w = ALU_SEL_CSR;
            imm_data_out_w = csr_type_imm_data;
            csr_read_out_w = 1;
            csr_write_out_w = (rs1_address != 0);
          end
          3'b111: begin  // CSRRCI
            uses_rd_w = 1;
            rd_address_out_w = rd_address;
            alu_function_out_w = ALU_AND_CLR;
            alu_function_modifier_out_w = 1;
            alu_select_b_out_w = ALU_SEL_CSR;
            imm_data_out_w = csr_type_imm_data;
            csr_read_out_w = 1;
            csr_write_out_w = (rs1_address != 0);
          end
          default: begin
            is_alu_out_w = 0;
            ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
            exception_out_w = 1;
          end
        endcase
      end
      default: begin
        is_alu_out_w = 0;
        ecause_out_w = EXCEPTION_ILLEGAL_INSTRUCTION;
        exception_out_w = 1;
      end
    endcase
  end

  always @(posedge clk) begin
    if (rstn) begin
      valid_out <= 0;
      ready_out <= 0;
      pc_out <= 0;
      next_pc_out <= 0;
      csr_data_out <= 0;
      imm_data_out <= 0;
      csr_address_out <= 0;
      csr_readable_out <= 0;
      csr_writeable_out <= 0;
      alu_function_out <= 0;
      alu_function_modifier_out <= 0;
      alu_select_a_out <= 0;
      alu_select_b_out <= 0;
      jump_out <= 0;
      branch_out <= 0;
      is_alu_out <= 0;
      load_out <= 0;
      store_out <= 0;
      uses_rd <= 0;
      rd_address_out <= 0;
      csr_read_out <= 0;
      csr_write_out <= 0;
      mret_out <= 0;
      wfi_out <= 0;
      ecause_out <= 0;
      exception_out <= 0;
      cmp_function_out <= 0;
      load_store_size_out <= 0;
      load_signed_out <= 0;
      half <= 0;
      is_fence <= 0;
    end else begin
        valid_out <= wfi_in ? valid_out: valid_in & ready_out & !trapped;
        ready_out <= !wfi_in & !rff_branch & ready_in;
        if (valid_in & ready_out) begin 
            pc_out <= pc_out_w;
            next_pc_out <= next_pc_out_w;
            csr_data_out <= csr_data_out_w;
            imm_data_out <= imm_data_out_w;
            csr_address_out <= csr_address_out_w;
            csr_readable_out <= csr_readable_out_w;
            csr_writeable_out <= csr_writeable_out_w;
            alu_function_out <= alu_function_out_w;
            alu_function_modifier_out <= alu_function_modifier_out_w;
            alu_select_a_out <= alu_select_a_out_w;
            alu_select_b_out <= alu_select_b_out_w;
            jump_out <= jump_out_w;
            branch_out <= branch_out_w;
            is_alu_out <= is_alu_out_w;
            load_out <= load_out_w;
            store_out <= store_out_w;
            uses_rd <= uses_rd_w;
            rd_address_out <= rd_address_out_w;
            csr_read_out <= csr_read_out_w;
            csr_write_out <= csr_write_out_w;
            mret_out <= mret_out_w;
            wfi_out <= wfi_out_w;
            ecause_out <= ecause_out_w;
            exception_out <= exception_out_w;
            cmp_function_out <= cmp_function_out_w;
            load_store_size_out <= load_store_size_out_w;
            load_signed_out <= load_signed_out_w;
            half <= half_w;
            is_fence <= is_fence_w;
        end
    end
  end

endmodule

`endif  // DECODE_V
