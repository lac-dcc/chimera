// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

module ShaderCore
    #(parameter WORD_WIDTH=32, ADDRESS_WIDTH=16, SDRAM_ADDRESS_WIDTH=24)
(
    input wire clock,
    input wire run,
    input wire reset_n,
    output reg halted,
    output reg exception,

    // Instruction RAM write control
    output reg [ADDRESS_WIDTH-1:0] inst_ram_address /* verilator public */,

    // Data RAM write control
    output reg [ADDRESS_WIDTH-1:0] data_ram_address /* verilator public */,
    output reg [WORD_WIDTH-1:0] data_ram_write_data /* verilator public */,
    output reg data_ram_write /* verilator public */,

    // Inst RAM read out
    input wire [WORD_WIDTH-1:0] inst_ram_read_result /* verilator public */,

    // Data RAM read out
    input wire [WORD_WIDTH-1:0] data_ram_read_result /* verilator public */,

    // SDRAM interface
    output reg [SDRAM_ADDRESS_WIDTH-1:0] sdram_address /* verilator public */,
    input wire sdram_waitrequest /* verilator public */,
    input wire [WORD_WIDTH-1:0] sdram_readdata /* verilator public */,
    input wire sdram_readdatavalid /* verilator public */,
    output reg sdram_read /* verilator public */,
    output reg [WORD_WIDTH-1:0] sdram_writedata /* verilator public */,
    output reg sdram_write /* verilator public */,

    output reg mem_request,
    input wire mem_authorized
);

    localparam REGISTER_ADDRESS_WIDTH = 5;

`undef ALTERA_FLOAT_TO_INT
`undef ALTERA_INT_TO_FLOAT
`undef ALTERA_FP_MULTIPLY
`undef ALTERA_FP_DIVIDE
`undef ALTERA_FP_ADD_SUB
`undef ALTERA_FP_COMPARE
`define NEED_OPENCORES_FPU // define if not using Altera div, mul or add_sub


    // CPU State Machine states -----------------------------------

    localparam STATE_INIT /* verilator public */ = 5'd00;
    localparam STATE_FETCH /* verilator public */ = 5'd01;
    localparam STATE_FETCH2 /* verilator public */ = 5'd02;
    localparam STATE_DECODE /* verilator public */ = 5'd03;
    localparam STATE_EXECUTE /* verilator public */ = 5'd04;
    localparam STATE_RETIRE /* verilator public */ = 5'd06;
    localparam STATE_LOAD /* verilator public */ = 5'd07;
    localparam STATE_LOAD2 /* verilator public */ = 5'd08;
    localparam STATE_STORE /* verilator public */ = 5'd09;
    localparam STATE_STORE_REQUEST /* verilator public */ = 5'd10;
    localparam STATE_STORE_STALL /* verilator public */ = 5'd11;
    localparam STATE_HALTED /* verilator public */ = 5'd12;
    localparam STATE_FP_WAIT /* verilator public */ = 5'd16;

    reg [4:0] state /* verilator public */;

    // ALU operations.  In Verilator, the syntax "alu.ALU_OP_ADD" pulls
    // this parameter from the submodule.  Quartus doesn't understand this,
    // so we mirror them from ALU.v here.
    localparam ALU_OP_ADD = 4'd1;
    localparam ALU_OP_SUB = 4'd2;
    localparam ALU_OP_SLL = 4'd3;
    localparam ALU_OP_SRL = 4'd4;
    localparam ALU_OP_SRA = 4'd5;
    localparam ALU_OP_XOR = 4'd6;
    localparam ALU_OP_AND = 4'd7;
    localparam ALU_OP_OR = 4'd8;
    localparam ALU_OP_SLT = 4'd9;
    localparam ALU_OP_SLTU = 4'd10;
    localparam ALU_OP_NONE = 4'd11;

    // Program Counter
    reg [WORD_WIDTH-1:0] PC /* verilator public */;

    // Instruction latched for instruction decoder
    reg [WORD_WIDTH-1:0] inst_to_decode /* verilator public */;


    // Output from decoder ----------------------------------------

    wire decode_opcode_is_branch /* verilator public */;
    wire decode_opcode_is_ALU_reg_imm /* verilator public */;
    wire decode_opcode_add_is_add /* verilator public */;
    wire decode_opcode_shift_is_logical /* verilator public */;
    wire decode_opcode_is_ALU_reg_reg /* verilator public */;
    wire decode_opcode_is_jal /* verilator public */;
    wire decode_opcode_is_jalr /* verilator public */;
    wire decode_opcode_is_lui /* verilator public */;
    wire decode_opcode_is_auipc /* verilator public */;
    wire decode_opcode_is_load /* verilator public */;
    wire decode_opcode_is_store /* verilator public */;
    wire decode_opcode_is_system /* verilator public */;
    wire decode_opcode_is_fadd /* verilator public */;
    wire decode_opcode_is_fsub /* verilator public */;
    wire decode_opcode_is_fmul /* verilator public */;
    wire decode_opcode_is_fdiv /* verilator public */;
    wire decode_opcode_is_fsgnj /* verilator public */;
    wire decode_opcode_is_fminmax /* verilator public */;
    wire decode_opcode_is_fsqrt /* verilator public */;
    wire decode_opcode_is_fcmp /* verilator public */;
    wire decode_opcode_is_fcvt_f2i /* verilator public */;
    wire decode_opcode_is_fmv_f2i /* verilator public */;
    wire decode_opcode_is_fcvt_i2f /* verilator public */;
    wire decode_opcode_is_fmv_i2f /* verilator public */;
    wire decode_opcode_is_flw /* verilator public */;
    wire decode_opcode_is_fsw /* verilator public */;
    wire decode_opcode_is_fmadd /* verilator public */;
    wire decode_opcode_is_fmsub /* verilator public */;
    wire decode_opcode_is_fnmsub /* verilator public */;
    wire decode_opcode_is_fnmadd /* verilator public */;
    wire [4:0] decode_rs1 /* verilator public */;
    wire [4:0] decode_rs2 /* verilator public */;
    /* verilator lint_off UNUSED */
    wire [4:0] decode_rs3 /* verilator public */;
    /* verilator lint_on UNUSED */
    wire [4:0] decode_rd /* verilator public */;
    wire [1:0] decode_fmt /* verilator public */;
    wire [2:0] decode_funct3_rm /* verilator public */;
    wire [6:0] decode_funct7 /* verilator public */;
    wire [4:0] decode_funct5 /* verilator public */;
    wire [4:0] decode_shamt_ftype /* verilator public */;
    wire signed [11:0] decode_imm_alu_load /* verilator public */;
    wire signed [11:0] decode_imm_store /* verilator public */;
    wire signed [12:0] decode_imm_branch /* verilator public */;
    wire signed [31:0] decode_imm_upper /* verilator public */;
    wire signed [20:0] decode_imm_jump /* verilator public */;

    wire [WORD_WIDTH-1:0] alu_result /* verilator public */ ;

    RISCVDecode #(.INSN_WIDTH(WORD_WIDTH))
        instDecode(
            .inst(inst_to_decode),
            .opcode_is_branch(decode_opcode_is_branch),
            .opcode_is_ALU_reg_imm(decode_opcode_is_ALU_reg_imm),
            .opcode_add_is_add(decode_opcode_add_is_add),
            .opcode_shift_is_logical(decode_opcode_shift_is_logical),
            .opcode_is_ALU_reg_reg(decode_opcode_is_ALU_reg_reg),
            .opcode_is_jal(decode_opcode_is_jal),
            .opcode_is_jalr(decode_opcode_is_jalr),
            .opcode_is_lui(decode_opcode_is_lui),
            .opcode_is_auipc(decode_opcode_is_auipc),
            .opcode_is_load(decode_opcode_is_load),
            .opcode_is_store(decode_opcode_is_store),
            .opcode_is_system(decode_opcode_is_system),
            .opcode_is_fadd(decode_opcode_is_fadd),
            .opcode_is_fsub(decode_opcode_is_fsub),
            .opcode_is_fmul(decode_opcode_is_fmul),
            .opcode_is_fdiv(decode_opcode_is_fdiv),
            .opcode_is_fsgnj(decode_opcode_is_fsgnj),
            .opcode_is_fminmax(decode_opcode_is_fminmax),
            .opcode_is_fsqrt(decode_opcode_is_fsqrt),
            .opcode_is_fcmp(decode_opcode_is_fcmp),
            .opcode_is_fcvt_f2i(decode_opcode_is_fcvt_f2i),
            .opcode_is_fmv_f2i(decode_opcode_is_fmv_f2i),
            .opcode_is_fcvt_i2f(decode_opcode_is_fcvt_i2f),
            .opcode_is_fmv_i2f(decode_opcode_is_fmv_i2f),
            .opcode_is_flw(decode_opcode_is_flw),
            .opcode_is_fsw(decode_opcode_is_fsw),
            .opcode_is_fmadd(decode_opcode_is_fmadd),
            .opcode_is_fmsub(decode_opcode_is_fmsub),
            .opcode_is_fnmsub(decode_opcode_is_fnmsub),
            .opcode_is_fnmadd(decode_opcode_is_fnmadd),
            .rs1(decode_rs1),
            .rs2(decode_rs2),
            .rs3(decode_rs3),
            .rd(decode_rd),
            .fmt(decode_fmt),
            .funct3_rm(decode_funct3_rm),
            .funct7(decode_funct7),
            .funct5(decode_funct5),
            .shamt_ftype(decode_shamt_ftype),
            .imm_alu_load(decode_imm_alu_load),
            .imm_store(decode_imm_store),
            .imm_branch(decode_imm_branch),
            .imm_upper(decode_imm_upper),
            .imm_jump(decode_imm_jump)
            );

    // Does the instruction have a float register destination?
    wire inst_has_float_dest =
        decode_opcode_is_fadd ||
        decode_opcode_is_fsub || 
        decode_opcode_is_fmul || 
        decode_opcode_is_fdiv || 
        decode_opcode_is_fsgnj || 
        decode_opcode_is_fminmax || 
        decode_opcode_is_fsqrt || 
        decode_opcode_is_fcvt_i2f ||
        decode_opcode_is_fmv_i2f || 
        decode_opcode_is_flw || 
        decode_opcode_is_fmadd || 
        decode_opcode_is_fmsub || 
        decode_opcode_is_fnmsub || 
        decode_opcode_is_fnmadd;


    // Register banks ---------------------------------------------

    // Integer register values for decoded integer register numbers
    // (i.e. registers[rs1] and registers[rs2])
    wire [WORD_WIDTH-1:0] rs1_value /* verilator public */;
    wire [WORD_WIDTH-1:0] rs2_value /* verilator public */;

    // Float register values for decoded integer register numbers
    // (i.e. float_registers[rs1] and float_registers[rs2])
    wire [WORD_WIDTH-1:0] float_rs1_value /* verilator public */;
    wire [WORD_WIDTH-1:0] float_rs2_value /* verilator public */;

    wire [WORD_WIDTH-1:0] final_rs2_value /* verilator public */ = decode_opcode_is_fsw ? float_rs2_value : rs2_value;

    // Destination register 
    reg [REGISTER_ADDRESS_WIDTH-1:0] rd_address;                // Number of destination register
    reg [WORD_WIDTH-1:0] rd_value /* verilator public */;       // Value to store in destination integer register
    reg [WORD_WIDTH-1:0] float_rd_value;                        // Value to store in destination float register
    reg enable_write_rd;                                        // Whether to write the destination integer register
    reg enable_write_float_rd;                                  // Whether to write the destination float register

    // Integer register bank.
    Registers registers(
        .clock(clock),

        .write_address(rd_address),
        .write(enable_write_rd),
        .write_data(rd_value),

        .read1_address(decode_rs1),
        .read1_data(rs1_value),

        .read2_address(decode_rs2),
        .read2_data(rs2_value));

    // Float register bank.
    Registers float_registers(
        .clock(clock),

        .write_address(rd_address),
        .write(enable_write_float_rd),
        .write_data(float_rd_value),

        .read1_address(decode_rs1),
        .read1_data(float_rs1_value),

        .read2_address(decode_rs2),
        .read2_data(float_rs2_value));


    // Comparison -------------------------------------------------

    // Slightly more human-readable decoded comparison
    wire decoded_beq = (decode_funct3_rm == 0);
    wire decoded_bne = (decode_funct3_rm == 1);
    wire decoded_blt = (decode_funct3_rm == 4);
    wire decoded_bge = (decode_funct3_rm == 5);
    wire decoded_bltu = (decode_funct3_rm == 6);
    wire decoded_bgeu = (decode_funct3_rm == 7);

    wire comparison_succeeded;

    Comparison
        comparison(
            .v1(rs1_value),
            .v2(rs2_value),
            .compare_equal(decoded_beq),
            .compare_not_equal(decoded_bne),
            .compare_less_than(decoded_blt),
            .compare_greater_equal(decoded_bge),
            .compare_less_than_unsigned(decoded_bltu),
            .compare_greater_equal_unsigned(decoded_bgeu),
            .result(comparison_succeeded)
            );


    // ALU operations ---------------------------------------------

    // ALU input wires
    wire signed [WORD_WIDTH-1:0] alu_op1 /* verilator public */ ;
    wire signed [WORD_WIDTH-1:0] alu_op2 /* verilator public */ ;
    wire signed [3:0] alu_operator /* verilator public */ ;

    // Choose ALU operand 1 from registers, instruction immediate field, or PC.
    // (If all parameters are signed, shorter parameters will be
    // sign-extended, but Verilator complains about smaller components)
    assign alu_op1 =
        (decode_opcode_is_ALU_reg_imm ||
           decode_opcode_is_ALU_reg_reg ||
           decode_opcode_is_jalr ||
           decode_opcode_is_load ||
           decode_opcode_is_flw ||
           decode_opcode_is_fsw ||
           decode_opcode_is_store) ? $signed(rs1_value) :
        decode_opcode_is_lui ? $signed(decode_imm_upper) :
        decode_opcode_is_jal ? $signed(PC) :
        decode_opcode_is_branch ? $signed(PC) :
        $signed(32'hdeadbeef);

    // Is ALU operation is a shift?
    wire alu_op_is_shift = (decode_funct3_rm == 1) || (decode_funct3_rm == 5);

/* verilator lint_off WIDTH */
    /* skip extension warnings in alu_op2 below by extending everything */

    wire signed [WORD_WIDTH-1:0] extended_shamt = decode_shamt_ftype;
    wire signed [WORD_WIDTH-1:0] extended_imm_alu_load /* verilator public */ = decode_imm_alu_load;
    wire signed [WORD_WIDTH-1:0] masked_rs2_value = rs2_value[4:0];
    wire signed [WORD_WIDTH-1:0] extended_imm_jump = decode_imm_jump;
    wire signed [WORD_WIDTH-1:0] extended_imm_store = decode_imm_store;
    wire signed [WORD_WIDTH-1:0] extended_imm_branch = decode_imm_branch;

/* verilator lint_on WIDTH */

    // Choose ALU operand 2 from registers or one of the instruction immediate fields
    assign alu_op2 =
        decode_opcode_is_ALU_reg_imm ? 
            (alu_op_is_shift ? extended_shamt : extended_imm_alu_load) :
        (decode_opcode_is_load ||
            decode_opcode_is_flw ||
            decode_opcode_is_jalr) ? extended_imm_alu_load :
        decode_opcode_is_ALU_reg_reg ? 
            (alu_op_is_shift ? masked_rs2_value : $signed(rs2_value)) :
        decode_opcode_is_lui ? 0 :
        decode_opcode_is_jal ? extended_imm_jump :
        (decode_opcode_is_store || decode_opcode_is_fsw) ? extended_imm_store :
        decode_opcode_is_branch ? extended_imm_branch :
        $signed(32'hcafebabe);

    // Set ALU operation between register and immediate value from decoded operation
    wire [3:0] alu_reg_imm_operator /* verilator public */ =
        (decode_funct3_rm == 0) ? ALU_OP_ADD :
        (decode_funct3_rm == 1) ? ALU_OP_SLL :
        (decode_funct3_rm == 2) ? ALU_OP_SLT :
        (decode_funct3_rm == 3) ? ALU_OP_SLTU :
        (decode_funct3_rm == 4) ? ALU_OP_XOR :
        (decode_funct3_rm == 5) ? (decode_opcode_shift_is_logical ? ALU_OP_SRL : ALU_OP_SRA) :
        (decode_funct3_rm == 6) ? ALU_OP_OR :
        /* (decode_funct3_rm == 7) ? */ ALU_OP_AND; // has to be AND

    // Set ALU operation between register and register value from decoded operation
    wire [3:0] alu_reg_reg_operator =
        (decode_funct3_rm == 0) ? (decode_opcode_add_is_add ? ALU_OP_ADD : ALU_OP_SUB) :
        (decode_funct3_rm == 1) ? ALU_OP_SLL :
        (decode_funct3_rm == 2) ? ALU_OP_SLT :
        (decode_funct3_rm == 3) ? ALU_OP_SLTU :
        (decode_funct3_rm == 4) ? ALU_OP_XOR :
        (decode_funct3_rm == 5) ? (decode_opcode_shift_is_logical ? ALU_OP_SRL : ALU_OP_SRA) :
        (decode_funct3_rm == 6) ? ALU_OP_OR :
        /* (decode_funct3_rm == 7) ? */ ALU_OP_AND; // has to be AND

    // Select between reg_imm and reg_reg ALU operation based on instruction
    assign alu_operator =
        decode_opcode_is_ALU_reg_imm ? alu_reg_imm_operator :
        decode_opcode_is_ALU_reg_reg ? alu_reg_reg_operator :
        (   decode_opcode_is_branch ||
            decode_opcode_is_jalr ||
            decode_opcode_is_jal ||
            decode_opcode_is_auipc ||
            decode_opcode_is_lui ||
            decode_opcode_is_load ||
            decode_opcode_is_flw ||
            decode_opcode_is_fsw ||
            decode_opcode_is_store ) ? ALU_OP_ADD :
        ALU_OP_NONE;

    ALU #(.WORD_WIDTH(WORD_WIDTH))
        alu 
        (
            .clock(clock),
            .operand1(alu_op1),
            .operand2(alu_op2),
            .operator(alu_operator),
            .result(alu_result)
        );


    // Floating point operations ----------------------------------

    wire fcmp_succeeded =
        (decode_funct3_rm == 0) ? (fcmp_altb || fcmp_aeqb) :
        (decode_funct3_rm == 1) ? (fcmp_altb) :
        (decode_funct3_rm == 2) ? (fcmp_aeqb) :
        1'b0;
    wire fminmax_choose_rs1 =
        (decode_funct3_rm == 0) ? fcmp_altb :
        /* (decode_funct3_rm == 1) ? */  !fcmp_altb;

    reg [5:0] fp_wait_count; // XXX MUST BE BIG ENOUGH TO HOLD ANY LATENCY COUNT

    reg [1:0] fpu_rmode;

    // Convert float to int ----------------------------

    reg fp_float_to_int_enable;
    wire [WORD_WIDTH-1:0] float_to_int_result;

`ifdef ALTERA_FLOAT_TO_INT

    // ALTFP_CONVERT float to int
    localparam FP_FLOAT_TO_INT_LATENCY = 6;
    float_to_int float_to_int ( 
	.clk_en(fp_float_to_int_enable),
	.clock(clock),
	.dataa(float_rs1_value),
	.result(float_to_int_result)
    );

`else

    localparam FP_FLOAT_TO_INT_LATENCY = 6;
    // TODO need unsigned variant and honor decode_shamt_ftype = {0,1}
    float_to_int float_to_int (
        .op(float_rs1_value),
        .rmode(fpu_rmode),
        .res(float_to_int_result)
    );

`endif

    // Convert int to float ----------------------------

    reg fp_int_to_float_enable;
    wire [WORD_WIDTH-1:0] int_to_float_result;

`ifdef ALTERA_INT_TO_FLOAT

    // ALTFP_CONVERT int to float
    localparam FP_INT_TO_FLOAT_LATENCY = 6;
    int_to_float int_to_float ( 
	.clk_en(fp_int_to_float_enable),
	.clock(clock),
	.dataa(float_rs1_value),
	.result(int_to_float_result)
    );

`else

    // TODO need unsigned variant and honor decode_shamt_ftype = {0,1}
    localparam FP_INT_TO_FLOAT_LATENCY = 4;
    int_to_float int_to_float (
        .op(rs1_value),
        .res(int_to_float_result)
    );

`endif

`ifdef NEED_OPENCORES_FPU

    // Verilog FPU from opencores; used in multiply, divide, and add_sub
    wire [WORD_WIDTH-1:0] fpu_result;
    wire [WORD_WIDTH-1:0] fpu_result_tmp;

    localparam MANTISSA_BITS_TO_DISCARD = 8;

    fpu fpu (
        .clk(clock),
        .rmode(fpu_rmode),
        .fpu_op(fpu_op),
        .opa({float_rs1_value[31:MANTISSA_BITS_TO_DISCARD],{MANTISSA_BITS_TO_DISCARD{1'b0}}}),
        .opb({float_rs2_value[31:MANTISSA_BITS_TO_DISCARD],{MANTISSA_BITS_TO_DISCARD{1'b0}}}),
        .out(fpu_result_tmp),
/* verilator lint_off PINCONNECTEMPTY */
        .ine(),
        .inf(),
        .snan(),
        .qnan(),
        .overflow(),
        .underflow(),
        .zero(),
        .div_by_zero()
/* verilator lint_on PINCONNECTEMPTY */
    );

    assign fpu_result = {fpu_result_tmp[31:MANTISSA_BITS_TO_DISCARD],{MANTISSA_BITS_TO_DISCARD{1'b0}}};

`endif

    reg [1:0] fpu_op;

    // Floating point multiply -------------------------

    reg fp_multiply_enable;
    wire [31:0] fp_multiply_result;

`ifdef ALTERA_FP_MULTIPLY

    // ALTFP_MULT
    localparam FP_MULTIPLY_LATENCY = 11;
    altfp_multiplier fp_multiplier ( 
	.clk_en(fp_multiply_enable),
	.clock(clock),
	.dataa(float_rs1_value),
	.datab(float_rs2_value),
	.result(fp_multiply_result)
    );

`else

    // Verilog FPU from opencores
    localparam FP_MULTIPLY_LATENCY = 4;
    assign fp_multiply_result = fpu_result;

`endif

    // Floating point divide -------------------------

    reg fp_divide_enable;
    wire [WORD_WIDTH-1:0] fp_divide_result;

`ifdef ALTERA_FP_DIVIDE

    localparam FP_DIVIDE_LATENCY = 14;
    fp_divide fp_divider (
        .clk_en(fp_divide_enable),
        .clock(clock),
        .dataa(float_rs1_value),
        .datab(float_rs2_value),
        .result(fp_divide_result)
    );

`else

    // Verilog FPU from opencores
    localparam FP_DIVIDE_LATENCY = 4;
    assign fp_divide_result = fpu_result;

`endif

    // Floating point add and subtract ---------------

    reg fp_add_sub_enable;
    reg fp_op_is_add;
    wire [WORD_WIDTH-1:0] fp_add_sub_result;

`ifdef ALTERA_FP_ADD_SUB

    localparam FP_ADD_SUB_LATENCY = 14;

    fp_add_sub fp_add_sub (
        .clk_en(fp_add_sub_enable),
        .clock(clock),
        .add_sub(fp_op_is_add),
        .dataa(float_rs1_value),
        .datab(float_rs2_value),
        .result(fp_add_sub_result)
    );

`else

    // Verilog FPU from opencores
    localparam FP_ADD_SUB_LATENCY = 4;
    assign fp_add_sub_result = fpu_result;

`endif

    // Floating point square root --------------------
    // ALTFP_SQRT
    localparam FP_SQRT_LATENCY = 28;
    reg fp_sqrt_enable;
    wire [31:0] fp_sqrt_result;
    fp_sqrt fp_sqrt (
	.clk_en(fp_sqrt_enable),
	.clock(clock),
	.data(float_rs1_value),
	.result(fp_sqrt_result)
    );

    // Floating point compare ------------------------

    reg fp_compare_enable;
    wire fcmp_altb;
    wire fcmp_aeqb;

`ifdef ALTERA_FP_COMPARE

    // ALTFP_COMPARE
    localparam FP_COMPARE_LATENCY = 6;
    fp_compare fp_compare ( 
	.clk_en(fp_multiply_enable),
	.clock(clock),
	.dataa(float_rs1_value),
	.datab(float_rs2_value),
	.aeb(fcmp_aeqb),
/* verilator lint_off PINCONNECTEMPTY */
	.agb(),
/* verilator lint_on PINCONNECTEMPTY */
	.alb(fcmp_altb)
    );
    
`else

    localparam FP_COMPARE_LATENCY = 1;
    fcmp fp_compare (
        .opa(float_rs1_value),
        .opb(float_rs2_value),
        .altb(fcmp_altb),
/* verilator lint_off PINCONNECTEMPTY */
        .blta(),
/* verilator lint_on PINCONNECTEMPTY */
        .aeqb(fcmp_aeqb),
/* verilator lint_off PINCONNECTEMPTY */
        .unordered(),
        .inf(),
        .zero()
/* verilator lint_on PINCONNECTEMPTY */
    );

`endif

    // Floating point classify -----------------------

    // https://blogs.msdn.microsoft.com/premk/2006/02/25/ieee-754-floating-point-special-values-and-ranges/
    // infinity is exponent all 1s and mantissa all 0s
    wire fclass_is_inf = &float_rs1_value[30:23] && !(|float_rs1_value[22:0]);
    // denorm is exponent all 0s and mantissa is not 0s
    wire fclass_is_denorm = !(|float_rs1_value[30:23]) && (|float_rs1_value[22:0]);
    // normal is exponent not all 1s and not all 0s.
    wire fclass_is_normal = !(&float_rs1_value[30:23]) && (|float_rs1_value[30:23]);
    // zero is every bit 0
    wire fclass_is_zero = !(|float_rs1_value[30:0]);
    // sign is bit 31
    wire fclass_is_negative = float_rs1_value[31];
    wire fclass_is_positive = !float_rs1_value[31];

    // signaling NaN has exponent all 1s and bit 22 = 0 and bit 21 = 1 and remaining mantissa bits 0s
    wire fclass_is_snan = &float_rs1_value[30:23] && (!float_rs1_value[22]) & (|float_rs1_value[21:0]);
    // quiet NaN has exponent all 1s and bit 22 1s and remaining mantissa bits 0
    wire fclass_is_qnan = float_rs1_value[22];

    wire fclass_is_pos_inf = fclass_is_inf && fclass_is_positive;
    wire fclass_is_pos_normal = fclass_is_normal && fclass_is_positive;
    wire fclass_is_pos_denorm = fclass_is_denorm && fclass_is_positive;
    wire fclass_is_pos_zero = fclass_is_zero && fclass_is_positive;
    wire fclass_is_neg_zero = fclass_is_zero && fclass_is_negative;
    wire fclass_is_neg_denorm = fclass_is_denorm && fclass_is_negative;
    wire fclass_is_neg_normal = fclass_is_normal && fclass_is_negative;
    wire fclass_is_neg_inf = fclass_is_inf && fclass_is_negative;

    wire [9:0] fclass_result = {
        fclass_is_snan,
        fclass_is_qnan,
        fclass_is_pos_inf,
        fclass_is_pos_normal,
        fclass_is_pos_denorm,
        fclass_is_pos_zero,
        fclass_is_neg_zero,
        fclass_is_neg_denorm,
        fclass_is_neg_normal,
        fclass_is_neg_inf
    };

    // Floating point sign transfer ------------------
   
    wire [31:0] fsgnj_result /* verilator public */ = {float_rs2_value[31], float_rs1_value[30:0]};
    wire [31:0] fsgnjn_result /* verilator public */ = {~float_rs2_value[31], float_rs1_value[30:0]};
    wire [31:0] fsgnjx_result /* verilator public */ = {float_rs1_value[31] ^ float_rs2_value[31], float_rs1_value[30:0]};

    // Does FPU operation require waiting?
    wire opcode_requires_fp_wait =
        decode_opcode_is_fsqrt ||
        decode_opcode_is_fminmax ||
        decode_opcode_is_fcmp ||
        decode_opcode_is_fcvt_f2i ||
	decode_opcode_is_fcvt_i2f ||
        decode_opcode_is_fmul ||
	decode_opcode_is_fsub ||
        decode_opcode_is_fadd ||
	decode_opcode_is_fdiv;


    // CPU State Machine ------------------------------------------

    // Detect ebreak opcode.
    wire halt = decode_opcode_is_system && (decode_imm_alu_load[11:0] == 12'd1);

    always @(posedge clock) begin
        if(!reset_n) begin

            // Initial values on RESET

            state <= STATE_INIT;
            PC <= 0;
            data_ram_write <= 0;
            enable_write_rd <= 0;
            enable_write_float_rd <= 0;

            fp_sqrt_enable <= 0;
            fp_multiply_enable <= 0;
            fp_add_sub_enable <= 0;
            fp_divide_enable <= 0;
            fp_int_to_float_enable <= 0;
            fp_float_to_int_enable <= 0;
            fp_compare_enable <= 0;

            halted <= 0;
            exception <= 0;

            sdram_address <= 0;
            sdram_read <= 1'h0;
            sdram_writedata <= 0;
            sdram_write <= 1'h0;

            mem_request <= 0;

            // reset registers?  Could assume they're junk in the compiler and save gates

        end else begin

            if(run) begin

                case (state)

                    STATE_INIT: begin
                        // XXX Do we need this?  Or just go straight from RESET to STATE_FETCH?
                        state <= STATE_FETCH;
                        PC <= 0;
                    end

                    // TODO: put result of PC calculation into
                    // inst_ram_address in RETIRE, and then memory result
                    // will be available here (or at least one clock
                    // earlier)
                    STATE_FETCH: begin
                        // Get instruction from memory[PC]
                        // We want PC to be settled here.
                        enable_write_rd <= 0;
                        enable_write_float_rd <= 0;
                        inst_ram_address <= PC[ADDRESS_WIDTH-1:0];
                        state <= STATE_FETCH2;
                    end

                    STATE_FETCH2: begin
                        // One wait state before trying to decode the output of FETCH
                        state <= STATE_DECODE;
                    end

                    STATE_DECODE: begin
                        // Clock the 32 bits of instruction into decoded signals
                        inst_to_decode <= inst_ram_read_result;
                        state <= STATE_EXECUTE;
                    end

                    STATE_EXECUTE: begin
                        // Perform the meat of the instruction
                        // We want decode of instruction and registers output to be settled here
                        // ALU operation occurs in alu instance

                        halted <= halt;
                            
                        // RISC-V rounding modes in order are RNE, RTZ, RDN, RUP
                        fpu_rmode <=
                            (decode_funct3_rm == 0) ? 2'd0 :
                            (decode_funct3_rm == 1) ? 2'd1 :
                            (decode_funct3_rm == 2) ? 2'd3 :
                            /* (decode_funct3_rm == 3) ? */ 2'd2;

                        state <= halt ? STATE_HALTED :
                            opcode_requires_fp_wait ? STATE_FP_WAIT :
                            (decode_opcode_is_load || decode_opcode_is_flw) ? STATE_LOAD :
                            (decode_opcode_is_store || decode_opcode_is_fsw) ? STATE_STORE :
                            STATE_RETIRE;

			fp_wait_count <= decode_opcode_is_fmul ? (FP_MULTIPLY_LATENCY - 1) : 
			    (decode_opcode_is_fadd |decode_opcode_is_fsub) ? (FP_ADD_SUB_LATENCY - 1) : 
                            decode_opcode_is_fcvt_f2i ? (FP_FLOAT_TO_INT_LATENCY - 1) :
                            (decode_opcode_is_fcmp || decode_opcode_is_fminmax) ? (FP_FLOAT_TO_INT_LATENCY - 1) :
                            decode_opcode_is_fcvt_i2f ? (FP_INT_TO_FLOAT_LATENCY - 1) :
                            decode_opcode_is_fsqrt ? (FP_SQRT_LATENCY - 1) :
			    /* decode_opcode_is_fdiv ? */ (FP_DIVIDE_LATENCY - 1);

			// XXX is this dangerous?  Is clk to the altera
			// float IP only active when clk_en has settled?
			// So it might be 11 cycles for mult, might be
			// 12, depending on whether first clock counts...
			fp_multiply_enable <= decode_opcode_is_fmul;
			fp_divide_enable <= decode_opcode_is_fdiv;
			fp_add_sub_enable <= decode_opcode_is_fadd || decode_opcode_is_fsub;
			fp_op_is_add <= decode_opcode_is_fadd;
			fp_float_to_int_enable <= decode_opcode_is_fcvt_f2i;
			fp_int_to_float_enable <= decode_opcode_is_fcvt_i2f;
			fp_compare_enable <= (decode_opcode_is_fminmax | decode_opcode_is_fcmp);
			fp_sqrt_enable <= decode_opcode_is_fsqrt;

                        fpu_op <=
                            decode_opcode_is_fmul ? 3'd2 :
                            decode_opcode_is_fdiv ? 3'd3 :
                            decode_opcode_is_fadd ? 3'd0 :
                            /* subtract */ 3'd1;

                        rd_address <= decode_rd;

                    end
						  
                    STATE_FP_WAIT: begin // {
                        // Wait on the floating point operation
			if(fp_wait_count == 0) begin // {
			    fp_sqrt_enable <= 0;
			    fp_multiply_enable <= 0;
			    fp_add_sub_enable <= 0;
			    fp_divide_enable <= 0;
			    fp_int_to_float_enable <= 0;
			    fp_float_to_int_enable <= 0;
			    fp_compare_enable <= 0;
			    state <= STATE_RETIRE;
			end else begin // } {
			    fp_wait_count <= fp_wait_count - 1;
			    state <= STATE_FP_WAIT;
			end // }
		    end // }

                    STATE_LOAD: begin
                        // Load memory using effective address calculated in ALU
                        // We want result of ALU to be settled here
                        data_ram_address <= alu_result[ADDRESS_WIDTH-1:0];
                        state <= STATE_LOAD2;
                    end

                    STATE_LOAD2: begin
                        // One wait state for loading memory
                        state <= STATE_RETIRE;
                    end

                    STATE_STORE: begin
                        // Store memory using effective address calculated in ALU
                        // We want result of ALU to be settled here
                        if (alu_result[WORD_WIDTH-1]) begin
                            // Write to SDRAM. Request access to the memory
                            // controller.
                            mem_request <= 1;
                            state <= STATE_STORE_REQUEST;
                        end else begin
                            // Write to internal data RAM.
                            data_ram_address <= alu_result[ADDRESS_WIDTH-1:0];
                            data_ram_write_data <= final_rs2_value;
                            data_ram_write <= 1;
                            state <= STATE_RETIRE;
                        end
                    end

                    STATE_STORE_REQUEST: begin
                        // Wait until the memory arbiter allows us to
                        // use the memory controller.
                        if (mem_authorized) begin
                            sdram_address <= alu_result[WORD_WIDTH-2:0];
                            sdram_writedata <= final_rs2_value;
                            sdram_write <= 1'h1;
                            state <= STATE_STORE_STALL;
                        end
                    end

                    STATE_STORE_STALL: begin
                        // Wait until our write is accepted. Note that this
                        // code can be moved to STATE_RETIRE to save a clock
                        // in most cases.
                        if (!sdram_waitrequest) begin
                            // Be sure to zero out all asserted signals
                            // because they may be wire-OR'ed with other
                            // cores' signals to the memory controller.
                            sdram_address <= 0;
                            sdram_writedata <= 0;
                            sdram_write <= 1'h0;
                            mem_request <= 0;
                            state <= STATE_RETIRE;
                        end
                    end

                    STATE_RETIRE: begin
                        // Finish operation by writing registers if necessary and updating PC
                        data_ram_write <= 0;
                        // want result of ALU to be settled here

                        enable_write_rd <= (decode_opcode_is_ALU_reg_imm ||
                            decode_opcode_is_ALU_reg_reg ||
                            decode_opcode_is_lui ||
                            decode_opcode_is_jalr ||
                            decode_opcode_is_jal ||
                            decode_opcode_is_load ||
                            decode_opcode_is_fcvt_f2i ||
                            decode_opcode_is_fmv_f2i ||
                            decode_opcode_is_fcmp) &&
                            (rd_address != 0);

                        rd_value <= 
                            (decode_opcode_is_jalr || decode_opcode_is_jal) ? (PC + 4) :
                            decode_opcode_is_fcmp ? (fcmp_succeeded ? 32'b1 : 32'b0) :
                            decode_opcode_is_fcvt_f2i ? float_to_int_result :
                            decode_opcode_is_fmv_f2i ?
                                ((decode_funct3_rm == 0) ? float_rs1_value : $unsigned(fclass_result)) :
                            decode_opcode_is_load ? data_ram_read_result :
                                $unsigned(alu_result);

                        enable_write_float_rd <= inst_has_float_dest;
                        float_rd_value <= 
                            decode_opcode_is_flw ? data_ram_read_result :
                            decode_opcode_is_fcvt_i2f ? int_to_float_result :
                            decode_opcode_is_fmv_i2f ? rs1_value :
                            decode_opcode_is_fminmax ? (
                                fminmax_choose_rs1 ? float_rs1_value : float_rs2_value
                            ) :
                            decode_opcode_is_fsgnj ? (
                                (decode_funct3_rm == 0) ? fsgnj_result :
                                (decode_funct3_rm == 1) ? fsgnjn_result :
                                /* (decode_funct3_rm == 2) ? */ fsgnjx_result
                            ) :
                            decode_opcode_is_fsqrt ? fp_sqrt_result :
                            decode_opcode_is_fmul ? fp_multiply_result :
                            decode_opcode_is_fdiv ? fp_divide_result :
                            /* (decode_opcode_is_fadd | decode_opcode_is_fsub) ? */ fp_add_sub_result;

                        // We know the result of ALU for jal has
                        // LSB 0, so just ignore LSB for both jal and
                        // jalr
                        PC <= 
                            (decode_opcode_is_jal ||
                                 decode_opcode_is_jalr) ? $unsigned({alu_result[WORD_WIDTH-1:1],1'b0}) :
                            (decode_opcode_is_branch && comparison_succeeded) ? $unsigned(alu_result) :
                            (PC + 4);

                        // load into registers?
                        // store from registers - need to stall reads from data, don't need to stall inst reads
                        state <= STATE_FETCH;
                    end

                    STATE_HALTED: begin
                    end

                    default: begin
                        // error, just reset
                        state <= STATE_INIT;
                    end

                endcase
            end
        end
    end

endmodule

