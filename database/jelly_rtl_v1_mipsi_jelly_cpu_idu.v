// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2009 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// opcode
`define OP_SPECIAL      6'b000000
`define OP_ADDI         6'b001000
`define OP_ADDIU        6'b001001
`define OP_SLTI         6'b001010
`define OP_SLTIU        6'b001011
`define OP_BEQ          6'b000100
`define OP_BNE          6'b000101
`define OP_REGIMM       6'b000001
`define OP_BGTZ         6'b000111
`define OP_BLEZ         6'b000110
`define OP_J            6'b000010
`define OP_JAL          6'b000011
`define OP_LB           6'b100000
`define OP_LBU          6'b100100
`define OP_LH           6'b100001
`define OP_LHU          6'b100101
`define OP_LW           6'b100011
`define OP_LWL          6'b100010
`define OP_LWR          6'b100110
`define OP_SB           6'b101000
`define OP_SH           6'b101001
`define OP_SW           6'b101011
`define OP_SWL          6'b101010
`define OP_SWR          6'b101110
`define OP_ANDI         6'b001100
`define OP_LUI          6'b001111
`define OP_ORI          6'b001101
`define OP_XORI         6'b001110
`define OP_COP0         6'b010000
`define OP_SPECIAL2     6'b011100

// func
`define FUNC_ADD        6'b100000
`define FUNC_ADDU       6'b100001
`define FUNC_DIV        6'b011010
`define FUNC_DIVU       6'b011011
`define FUNC_MULT       6'b011000
`define FUNC_MULTU      6'b011001
`define FUNC_SLT        6'b101010
`define FUNC_SLTU       6'b101011
`define FUNC_SUB        6'b100010
`define FUNC_SUBU       6'b100011
`define FUNC_JALR       6'b001001
`define FUNC_JR         6'b001000
`define FUNC_AND        6'b100100
`define FUNC_NOR        6'b100111
`define FUNC_OR         6'b100101
`define FUNC_XOR        6'b100110
`define FUNC_MFHI       6'b010000
`define FUNC_MFLO       6'b010010
`define FUNC_MTHI       6'b010001
`define FUNC_MTLO       6'b010011
`define FUNC_SLL        6'b000000
`define FUNC_SLLV       6'b000100
`define FUNC_SRA        6'b000011
`define FUNC_SRAV       6'b000111
`define FUNC_SRL        6'b000010
`define FUNC_SRLV       6'b000110
`define FUNC_BREAK      6'b001101
`define FUNC_SYSCALL    6'b001100

`define FUNC_RFE        6'b010000
`define FUNC_ERET       6'b011000

`define FUNC_SDBBP      6'b111111



// Instruction Decode Unit
module jelly_cpu_idu
        #(
            parameter                   USE_INST_LSWLR  = 1'b1,
            parameter                   USE_EXC_SYSCALL = 1'b1,
            parameter                   USE_EXC_BREAK   = 1'b1,
            parameter                   USE_EXC_RI      = 1'b1
        )
        (
            input   wire    [31:0]      instruction,
            
            output  wire    [4:0]       rs_addr,
            output  wire    [4:0]       rt_addr,
            output  wire    [4:0]       rd_addr,
            output  wire    [31:0]      immediate_data,
            
            output  wire                branch_en,
            output  wire    [3:0]       branch_func,
            output  wire    [27:0]      branch_index,
            output  wire                branch_index_en,
            output  wire                branch_imm_en,
            output  wire                branch_rs_en,
            
            output  wire                alu_adder_en,
            output  wire    [1:0]       alu_adder_func,
            output  wire                alu_logic_en,
            output  wire    [1:0]       alu_logic_func,
            output  wire                alu_comp_en,
            output  wire                alu_comp_func,
            output  wire                alu_imm_en,
            
            output  wire                shifter_en,
            output  wire    [1:0]       shifter_func,
            output  wire                shifter_sa_en,
            output  wire    [4:0]       shifter_sa_data,
            
            output  wire                muldiv_en,
            output  wire                muldiv_mul,
            output  wire                muldiv_div,
            output  wire                muldiv_mthi,
            output  wire                muldiv_mtlo,
            output  wire                muldiv_mfhi,
            output  wire                muldiv_mflo,
            output  wire                muldiv_signed,
            
            output  wire                cop0_mfc0,
            output  wire                cop0_mtc0,
            output  wire                cop0_rfe,
            
            output  wire                exc_syscall,
            output  wire                exc_break,
            output  wire                exc_ri,
            
            output  wire                dbg_sdbbp,
            
            output  wire                mem_en,
            output  wire                mem_we,
            output  wire    [1:0]       mem_size,
            output  wire                mem_unsigned,
            
            output  wire                dst_reg_en,
            output  wire    [4:0]       dst_reg_addr,
            output  wire                dst_src_alu,
            output  wire                dst_src_shifter,
            output  wire                dst_src_mem,
            output  wire                dst_src_pc,
            output  wire                dst_src_hi,
            output  wire                dst_src_lo,
            output  wire                dst_src_cop0
        );
    
    
    // -----------------------------
    //  Field
    // -----------------------------
    
    wire    [5:0]           field_op;
    wire    [4:0]           field_rs;
    wire    [4:0]           field_rt;
    wire    [4:0]           field_rd;
    wire    [4:0]           field_sa;
    wire    [5:0]           field_func;
    wire    [15:0]          field_immediate;
    wire    [25:0]          field_target;
    
    assign field_op        = instruction[31:26];
    assign field_rs        = instruction[25:21];
    assign field_rt        = instruction[20:16];
    assign field_rd        = instruction[15:11];
    assign field_sa        = instruction[10:6];
    assign field_func      = instruction[5:0];
    assign field_immediate = instruction[15:0];
    assign field_target    = instruction[25:0];
    
    
    
    // -----------------------------
    //  Instruction
    // -----------------------------
    
    // special
    wire    op_special;
    assign op_special = (field_op == `OP_SPECIAL);
    
    
    // ADD
    wire    inst_add;
    assign inst_add   = op_special & (field_func == `FUNC_ADD);
    
    // ADDI
    wire    inst_addi;
    assign inst_addi  = (field_op == `OP_ADDI);
    
    // ADDU
    wire    inst_addu;
    assign inst_addu = op_special & (field_func == `FUNC_ADDU);
    
    // ADDIU
    wire    inst_addiu;
    assign inst_addiu = (field_op == `OP_ADDIU);
    
    // DIV
    wire    inst_div;
    assign inst_div  = op_special & (field_func == `FUNC_DIV);
    
    // DIVU
    wire    inst_divu;
    assign inst_divu  = op_special & (field_func == `FUNC_DIVU);
    
    // MULT
    wire    inst_mult;
    assign inst_mult = op_special & (field_func == `FUNC_MULT);
    
    // MULTU
    wire    inst_multu;
    assign inst_multu = op_special & (field_func == `FUNC_MULTU);
    
    // SLT
    wire    inst_slt;
    assign inst_slt = op_special & (field_func == `FUNC_SLT);
    
    // SLTI
    wire    inst_slti;
    assign inst_slti = (field_op == `OP_SLTI);
    
    // SLTU
    wire    inst_sltu;
    assign inst_sltu = op_special & (field_func == `FUNC_SLTU);
    
    // SLTIU
    wire    inst_sltiu;
    assign inst_sltiu = (field_op == `OP_SLTIU);
    
    // SUB
    wire    inst_sub;
    assign inst_sub = op_special & (field_func == `FUNC_SUB);
    
    // SUBU
    wire    inst_subu;
    assign inst_subu = op_special & (field_func == `FUNC_SUBU);
    
    // BEQ
    wire    inst_beq;
    assign inst_beq = (field_op == `OP_BEQ);
    
    // BNE
    wire    inst_bne;
    assign inst_bne = (field_op == `OP_BNE);
    
    // BGEZ
    wire    inst_bgez;
    assign inst_bgez = (field_op == `OP_REGIMM) & (field_rt == 5'b00001);
    
    // BGEZAL
    wire    inst_bgezal;
    assign inst_bgezal = (field_op == `OP_REGIMM) & (field_rt == 5'b10001);
    
    // BGTZ
    wire    inst_bgtz;
    assign inst_bgtz = (field_op == `OP_BGTZ);
    
    // BLEZ
    wire    inst_blez;
    assign inst_blez = (field_op == `OP_BLEZ);
    
    // BLTZ
    wire    inst_bltz;
    assign inst_bltz = ((field_op == `OP_REGIMM ) & (field_rt == 5'b00000));
    
    // BLTZAL
    wire    inst_bltzal;
    assign inst_bltzal = ((field_op == `OP_REGIMM ) & (field_rt == 5'b10000));
    
    // J
    wire    inst_j;
    assign inst_j = (field_op == `OP_J);
    
    // JAL
    wire    inst_jal;
    assign inst_jal = (field_op == `OP_JAL);
    
    // JALR
    wire    inst_jalr;
    assign inst_jalr = op_special & (field_func == `FUNC_JALR);
    
    // JR
    wire    inst_jr;
    assign inst_jr = op_special & (field_func == `FUNC_JR);
    
    // LB
    wire    inst_lb;
    assign inst_lb = (field_op == `OP_LB);
    
    // LBU
    wire    inst_lbu;
    assign inst_lbu = (field_op == `OP_LBU);
    
    // LH
    wire    inst_lh;
    assign inst_lh = (field_op == `OP_LH);
    
    // LHU
    wire    inst_lhu;
    assign inst_lhu = (field_op == `OP_LHU);
    
    // LW
    wire    inst_lw;
    assign inst_lw = (field_op == `OP_LW);

    // LWL
    wire    inst_lwl;
    assign inst_lwl = (field_op == `OP_LWL) & USE_INST_LSWLR;
    
    // LWR
    wire    inst_lwr;
    assign inst_lwr = (field_op == `OP_LWR) & USE_INST_LSWLR;
    
    // SB
    wire    inst_sb;
    assign inst_sb = (field_op == `OP_SB);
    
    // SH
    wire    inst_sh;
    assign inst_sh = (field_op == `OP_SH);
    
    // SW
    wire    inst_sw;
    assign inst_sw = (field_op == `OP_SW);

    // SWL
    wire    inst_swl;
    assign inst_swl = (field_op == `OP_SWL) & USE_INST_LSWLR;

    // SWR
    wire    inst_swr;
    assign inst_swr = (field_op == `OP_SWR) & USE_INST_LSWLR;
    
    // AND
    wire    inst_and;
    assign inst_and = op_special & (field_func == `FUNC_AND);
    
    // ANDI
    wire    inst_andi;
    assign inst_andi = (field_op == `OP_ANDI);
    
    // LUI
    wire    inst_lui;
    assign inst_lui = (field_op == `OP_LUI);
    
    // NOR
    wire    inst_nor;
    assign inst_nor = op_special & (field_func == `FUNC_NOR);
    
    // OR
    wire    inst_or;
    assign inst_or = op_special & (field_func == `FUNC_OR);
    
    // ORI
    wire    inst_ori;
    assign inst_ori = (field_op == `OP_ORI);
    
    // XOR
    wire    inst_xor;
    assign inst_xor = op_special & (field_func == `FUNC_XOR);
    
    // XORI
    wire    inst_xori;
    assign inst_xori = (field_op == `OP_XORI);
    
    // MFHI
    wire    inst_mfhi;
    assign inst_mfhi = op_special & (field_func == `FUNC_MFHI);
    
    // MFLO
    wire    inst_mflo;
    assign inst_mflo = op_special & (field_func == `FUNC_MFLO);
    
    // MTHI
    wire    inst_mthi;
    assign inst_mthi = op_special & (field_func == `FUNC_MTHI);
    
    // MTLO
    wire    inst_mtlo;
    assign inst_mtlo = op_special & (field_func == `FUNC_MTLO);
    
    // SLL
    wire    inst_sll;
    assign inst_sll = op_special & (field_func == `FUNC_SLL);
    
    // SLLV
    wire    inst_sllv;
    assign inst_sllv = op_special & (field_func == `FUNC_SLLV);
    
    // SRA
    wire    inst_sra;
    assign inst_sra = op_special & (field_func == `FUNC_SRA);
    
    // SRAV
    wire    inst_srav;
    assign inst_srav = op_special & (field_func == `FUNC_SRAV);
    
    // SRL
    wire    inst_srl;
    assign inst_srl = op_special & (field_func == `FUNC_SRL);
    
    // SRLV
    wire    inst_srlv;
    assign inst_srlv = op_special & (field_func == `FUNC_SRLV);
    
    // BREAK
    wire    inst_break;
    assign inst_break = op_special & (field_func == `FUNC_BREAK);
    
    // SYSCALL
    wire    inst_syscall;
    assign inst_syscall = op_special & (field_func == `FUNC_SYSCALL);
    
    // RFE
    wire    inst_rfe;
    assign inst_rfe = (field_op == `OP_COP0) & (instruction[25] == 1'b1) & (field_func == `FUNC_RFE);
        
    // ERET
    wire    inst_eret;
    assign inst_eret = (field_op == `OP_COP0) & (instruction[25] == 1'b1) & (field_func == `FUNC_ERET);
    
    // MFC0
    wire    inst_mfc0;
    assign inst_mfc0 = (field_op == `OP_COP0) & (instruction[25:21] == 5'b00000);
    
    // MTC0
    wire    inst_mtc0;
    assign inst_mtc0 = (field_op == `OP_COP0) & (instruction[25:21] == 5'b00100);
    
    // SDBBP
    wire    inst_sdbbp;
    assign inst_sdbbp = (field_op == `OP_SPECIAL2) & (field_func == `FUNC_SDBBP);
    
    
    
    // -----------------------------
    //  Immidiate
    // -----------------------------
    
    wire                    immediate_unsigned;
    wire                    immediate_lui;
    
    
    assign immediate_unsigned = inst_andi | inst_ori | inst_xori;
    assign immediate_lui      = inst_lui;
    
    assign immediate_data[31:16] = immediate_lui ? ~instruction[15:0] : (immediate_unsigned ? {16{1'b0}} : {16{instruction[15]}});
    assign immediate_data[15:0]  = immediate_lui ? ~16'h0000          : instruction[15:0];
    
    
    
    // -----------------------------
    //  Register address
    // -----------------------------
    
    assign rs_addr = field_rs;
    assign rt_addr = field_rt;
    assign rd_addr = field_rd;
    
    
    
    // -----------------------------
    //  Branch
    // -----------------------------
    
    // branch enable
    assign branch_en = inst_beq | inst_bne |
                        inst_bgez | inst_bgezal | inst_bgtz | inst_blez | inst_bltz | inst_bltzal |
                        inst_j | inst_jal | inst_jalr | inst_jr;
    
    // branch function
    assign branch_func   = {instruction[16], instruction[28:26]};
    
    // branch address
    assign branch_imm_en   = inst_beq | inst_bne |
                                inst_bgez | inst_bgezal | inst_bgtz | inst_blez | inst_bltz | inst_bltzal;
    assign branch_index_en = inst_j | inst_jal;
    assign branch_rs_en    = inst_jr | inst_jalr;
    
    // branch index value
    assign branch_index  = (field_target << 2);
    
    
    
    // -----------------------------
    //  ALU operation
    // -----------------------------
    
    // adder
    assign alu_adder_en = inst_add | inst_addi | inst_addu | inst_addiu | inst_sub | inst_subu |
                            inst_lb | inst_lbu | inst_lh | inst_lhu | inst_lw | inst_lwl | inst_lwr |
                            inst_sb | inst_sh | inst_sw | inst_swl | inst_swr;
    
    // adder function (2'b00:add, 2'b01:sub, 2'b1x:comp-zero)
    assign alu_adder_func[0] = inst_sub | inst_subu | inst_beq | inst_bne | alu_comp_en;
    assign alu_adder_func[1] = inst_blez | inst_bgtz | inst_bltz | inst_bltzal | inst_bgez | inst_bgezal;
    
    
    // logic enable
    assign alu_logic_en   = inst_and | inst_andi | inst_lui | inst_nor | inst_or | inst_ori | inst_xor | inst_xori;
    
    
    // logic function (2'b00:AND, 2'b01:OR, 2'b10:XOR, 2'b11:NOR)
    assign alu_logic_func = (instruction[28] == 1'b0) ? instruction[1:0] : instruction[27:26];
    
    
    // comparator enable
    assign alu_comp_en   = inst_slt | inst_slti | inst_sltu | inst_sltiu;
    
    // comparator function (1'b0: unsigned , 1'b1: signed)
    assign alu_comp_func = inst_slt | inst_slti;
    
    // ALU immediate input enable
    assign alu_imm_en = ~(op_special | inst_beq | inst_bne);

    
    // -----------------------------
    //  Shifter operation
    // -----------------------------
    
    // shifter enable
    assign shifter_en = inst_sll | inst_sllv | inst_sra | inst_srav | inst_srl | inst_srlv;
    
    // shifter function (2'bx0:SLL, 2'b01:SRL, 2'b11:SRA)
    assign shifter_func[0]  = instruction[1];
    assign shifter_func[1]  = instruction[0];
    
    // sa
    assign shifter_sa_en   = ~instruction[2];
    assign shifter_sa_data = field_sa;
    
    
    
    // -----------------------------
    //  Multiplier / Devider
    // -----------------------------
    
    assign muldiv_mul    = inst_mult | inst_multu;
    assign muldiv_div    = inst_div | inst_divu;
    assign muldiv_mthi   = inst_mthi;
    assign muldiv_mtlo   = inst_mtlo;
    assign muldiv_mfhi   = inst_mfhi;
    assign muldiv_mflo   = inst_mflo;
    assign muldiv_signed = ~instruction[0];
    
    assign muldiv_en     = muldiv_mul | muldiv_div | muldiv_mthi | muldiv_mtlo | muldiv_mfhi | muldiv_mflo;
    
    
    
    // -----------------------------
    //  Coprocessor-0
    // -----------------------------

    assign cop0_mfc0   = inst_mfc0;
    assign cop0_mtc0   = inst_mtc0;
    assign cop0_rfe    = inst_rfe | inst_eret;
    
    
    
    // -----------------------------
    //  Memory
    // -----------------------------
    
    assign mem_en       = inst_lb | inst_lbu | inst_lh | inst_lhu | inst_lw | inst_lwl | inst_lwr | inst_sb | inst_sh | inst_sw | inst_swl | inst_swr;
    assign mem_we       = instruction[29];
    assign mem_size     = instruction[27:26];
    assign mem_unsigned = instruction[28];
    
    
    
    // -----------------------------
    //  Destination register
    // -----------------------------
    
    wire    dst_reg_rt;
    wire    dst_reg_rd;
    wire    dst_reg_r31;
    
    assign dst_reg_rt = inst_addi | inst_addiu |
                        inst_slti | inst_sltiu | inst_andi | inst_ori | inst_xori |
                        inst_lb | inst_lbu | inst_lh | inst_lhu | inst_lw | inst_lwl | inst_lwr | inst_lui |
                        inst_mfc0;
    
    assign dst_reg_rd = inst_add | inst_addu | inst_slt | inst_sltu | inst_sub | inst_subu |
                        inst_and | inst_nor | inst_or | inst_xor |
                        inst_mfhi | inst_mflo | 
                        inst_sll | inst_sllv | inst_sra | inst_srav | inst_srl | inst_srlv |
                        inst_jalr;
        
    assign dst_reg_r31 = inst_bgezal | inst_bltzal | inst_jal;
    
    // destination register write-back enable
    assign dst_reg_en      = (dst_reg_addr != 5'b00000);
    
    // destination register address
    assign dst_reg_addr    = (dst_reg_rt  ? instruction[20:16] : 5'b00000) |
                             (dst_reg_rd  ? instruction[15:11] : 5'b00000) |
                             (dst_reg_r31 ? 5'b11111           : 5'b00000);
    
    // write-back source unit
    assign dst_src_alu     = alu_adder_en | alu_logic_en | alu_comp_en;
    assign dst_src_shifter = shifter_en;
    assign dst_src_mem     = mem_en & ~mem_we;
    assign dst_src_pc      = dst_reg_r31 | inst_jalr;
    assign dst_src_hi      = inst_mfhi;
    assign dst_src_lo      = inst_mflo;
    assign dst_src_cop0    = inst_mfc0;
    
    
    
    // -----------------------------
    //  Exception
    // -----------------------------
    
    // syscall
    assign exc_syscall = USE_EXC_SYSCALL & inst_syscall;
    
    // break
    assign exc_break   = USE_EXC_BREAK & inst_break;
    
    // reserve instruction
    assign exc_ri = !(inst_add
                    | inst_addi
                    | inst_addu
                    | inst_addiu
                    | inst_div
                    | inst_divu
                    | inst_mult
                    | inst_multu
                    | inst_slt
                    | inst_slti
                    | inst_sltu
                    | inst_sltiu
                    | inst_sub
                    | inst_subu
                    | inst_beq
                    | inst_bne
                    | inst_bgez
                    | inst_bgezal
                    | inst_bgtz
                    | inst_blez
                    | inst_bltz
                    | inst_bltzal
                    | inst_j
                    | inst_jal
                    | inst_jalr
                    | inst_jr
                    | inst_lb
                    | inst_lbu
                    | inst_lh
                    | inst_lhu
                    | inst_lw
                    | inst_lwl
                    | inst_lwr
                    | inst_sb
                    | inst_sh
                    | inst_sw
                    | inst_swl
                    | inst_swr
                    | inst_and
                    | inst_andi
                    | inst_lui
                    | inst_nor
                    | inst_or
                    | inst_ori
                    | inst_xor
                    | inst_xori
                    | inst_mfhi
                    | inst_mflo
                    | inst_mthi
                    | inst_mtlo
                    | inst_sll
                    | inst_sllv
                    | inst_sra
                    | inst_srav
                    | inst_srl
                    | inst_srlv
                    | inst_break
                    | inst_syscall
                    | inst_rfe
                    | inst_eret
                    | inst_mfc0
                    | inst_mtc0
                    | inst_sdbbp) & USE_EXC_RI;

    // -----------------------------
    //  Debbuger
    // -----------------------------
    
    assign dbg_sdbbp   = inst_sdbbp;
    
    
endmodule



`default_nettype wire



// end of file
