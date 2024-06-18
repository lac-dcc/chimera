// This program was cloned from: https://github.com/ChipFlow/amaranth-vexriscv
// License: MIT License

// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : VexRiscv
// Git hash  : 3eec596f6493514bed3697021644c2318795e55d

`timescale 1ns/1ps 

module VexRiscv (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               softwareInterrupt,
  input      [31:0]   externalInterruptArray,
  output              debug_resetOut,
  output              iBusWishbone_CYC,
  output              iBusWishbone_STB,
  input               iBusWishbone_ACK,
  output              iBusWishbone_WE,
  output     [29:0]   iBusWishbone_ADR,
  input      [31:0]   iBusWishbone_DAT_MISO,
  output     [31:0]   iBusWishbone_DAT_MOSI,
  output     [3:0]    iBusWishbone_SEL,
  input               iBusWishbone_ERR,
  output     [2:0]    iBusWishbone_CTI,
  output     [1:0]    iBusWishbone_BTE,
  output              dBusWishbone_CYC,
  output              dBusWishbone_STB,
  input               dBusWishbone_ACK,
  output              dBusWishbone_WE,
  output     [29:0]   dBusWishbone_ADR,
  input      [31:0]   dBusWishbone_DAT_MISO,
  output     [31:0]   dBusWishbone_DAT_MOSI,
  output reg [3:0]    dBusWishbone_SEL,
  input               dBusWishbone_ERR,
  output     [2:0]    dBusWishbone_CTI,
  output     [1:0]    dBusWishbone_BTE,
  input               jtag_tms,
  input               jtag_tdi,
  output              jtag_tdo,
  input               jtag_tck,
  input               clk,
  input               reset,
  input               debugReset
);
  localparam ShiftCtrlEnum_DISABLE_1 = 2'd0;
  localparam ShiftCtrlEnum_SLL_1 = 2'd1;
  localparam ShiftCtrlEnum_SRL_1 = 2'd2;
  localparam ShiftCtrlEnum_SRA_1 = 2'd3;
  localparam EnvCtrlEnum_NONE = 2'd0;
  localparam EnvCtrlEnum_XRET = 2'd1;
  localparam EnvCtrlEnum_ECALL = 2'd2;
  localparam BranchCtrlEnum_INC = 2'd0;
  localparam BranchCtrlEnum_B = 2'd1;
  localparam BranchCtrlEnum_JAL = 2'd2;
  localparam BranchCtrlEnum_JALR = 2'd3;
  localparam AluBitwiseCtrlEnum_XOR_1 = 2'd0;
  localparam AluBitwiseCtrlEnum_OR_1 = 2'd1;
  localparam AluBitwiseCtrlEnum_AND_1 = 2'd2;
  localparam Src2CtrlEnum_RS = 2'd0;
  localparam Src2CtrlEnum_IMI = 2'd1;
  localparam Src2CtrlEnum_IMS = 2'd2;
  localparam Src2CtrlEnum_PC = 2'd3;
  localparam AluCtrlEnum_ADD_SUB = 2'd0;
  localparam AluCtrlEnum_SLT_SLTU = 2'd1;
  localparam AluCtrlEnum_BITWISE = 2'd2;
  localparam Src1CtrlEnum_RS = 2'd0;
  localparam Src1CtrlEnum_IMU = 2'd1;
  localparam Src1CtrlEnum_PC_INCREMENT = 2'd2;
  localparam Src1CtrlEnum_URS1 = 2'd3;

  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [12:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [6:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [2:0]    _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusSimplePlugin_jump_pcLoad_payload_4;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_5;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [11:0]   _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_2;
  wire       [11:0]   _zz__zz_4;
  wire       [31:0]   _zz__zz_6;
  wire       [31:0]   _zz__zz_6_1;
  wire       [19:0]   _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_4;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_6;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3;
  wire       [2:0]    _zz_DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   _zz__zz_decode_IS_DIV;
  wire       [0:0]    _zz__zz_decode_IS_DIV_1;
  wire       [1:0]    _zz__zz_decode_IS_DIV_2;
  wire       [0:0]    _zz__zz_decode_IS_DIV_3;
  wire                _zz__zz_decode_IS_DIV_4;
  wire       [31:0]   _zz__zz_decode_IS_DIV_5;
  wire       [0:0]    _zz__zz_decode_IS_DIV_6;
  wire       [31:0]   _zz__zz_decode_IS_DIV_7;
  wire       [31:0]   _zz__zz_decode_IS_DIV_8;
  wire       [23:0]   _zz__zz_decode_IS_DIV_9;
  wire       [0:0]    _zz__zz_decode_IS_DIV_10;
  wire       [31:0]   _zz__zz_decode_IS_DIV_11;
  wire       [0:0]    _zz__zz_decode_IS_DIV_12;
  wire       [31:0]   _zz__zz_decode_IS_DIV_13;
  wire       [1:0]    _zz__zz_decode_IS_DIV_14;
  wire       [31:0]   _zz__zz_decode_IS_DIV_15;
  wire       [31:0]   _zz__zz_decode_IS_DIV_16;
  wire                _zz__zz_decode_IS_DIV_17;
  wire       [31:0]   _zz__zz_decode_IS_DIV_18;
  wire       [31:0]   _zz__zz_decode_IS_DIV_19;
  wire       [0:0]    _zz__zz_decode_IS_DIV_20;
  wire       [0:0]    _zz__zz_decode_IS_DIV_21;
  wire       [31:0]   _zz__zz_decode_IS_DIV_22;
  wire       [0:0]    _zz__zz_decode_IS_DIV_23;
  wire       [31:0]   _zz__zz_decode_IS_DIV_24;
  wire       [19:0]   _zz__zz_decode_IS_DIV_25;
  wire       [2:0]    _zz__zz_decode_IS_DIV_26;
  wire       [31:0]   _zz__zz_decode_IS_DIV_27;
  wire       [31:0]   _zz__zz_decode_IS_DIV_28;
  wire                _zz__zz_decode_IS_DIV_29;
  wire                _zz__zz_decode_IS_DIV_30;
  wire                _zz__zz_decode_IS_DIV_31;
  wire       [31:0]   _zz__zz_decode_IS_DIV_32;
  wire       [31:0]   _zz__zz_decode_IS_DIV_33;
  wire       [0:0]    _zz__zz_decode_IS_DIV_34;
  wire                _zz__zz_decode_IS_DIV_35;
  wire       [16:0]   _zz__zz_decode_IS_DIV_36;
  wire       [0:0]    _zz__zz_decode_IS_DIV_37;
  wire                _zz__zz_decode_IS_DIV_38;
  wire       [31:0]   _zz__zz_decode_IS_DIV_39;
  wire       [31:0]   _zz__zz_decode_IS_DIV_40;
  wire       [31:0]   _zz__zz_decode_IS_DIV_41;
  wire       [31:0]   _zz__zz_decode_IS_DIV_42;
  wire       [0:0]    _zz__zz_decode_IS_DIV_43;
  wire                _zz__zz_decode_IS_DIV_44;
  wire                _zz__zz_decode_IS_DIV_45;
  wire       [13:0]   _zz__zz_decode_IS_DIV_46;
  wire       [0:0]    _zz__zz_decode_IS_DIV_47;
  wire       [31:0]   _zz__zz_decode_IS_DIV_48;
  wire       [1:0]    _zz__zz_decode_IS_DIV_49;
  wire       [31:0]   _zz__zz_decode_IS_DIV_50;
  wire       [31:0]   _zz__zz_decode_IS_DIV_51;
  wire       [0:0]    _zz__zz_decode_IS_DIV_52;
  wire       [31:0]   _zz__zz_decode_IS_DIV_53;
  wire                _zz__zz_decode_IS_DIV_54;
  wire       [31:0]   _zz__zz_decode_IS_DIV_55;
  wire       [31:0]   _zz__zz_decode_IS_DIV_56;
  wire       [0:0]    _zz__zz_decode_IS_DIV_57;
  wire       [0:0]    _zz__zz_decode_IS_DIV_58;
  wire       [3:0]    _zz__zz_decode_IS_DIV_59;
  wire       [31:0]   _zz__zz_decode_IS_DIV_60;
  wire       [31:0]   _zz__zz_decode_IS_DIV_61;
  wire                _zz__zz_decode_IS_DIV_62;
  wire       [31:0]   _zz__zz_decode_IS_DIV_63;
  wire       [0:0]    _zz__zz_decode_IS_DIV_64;
  wire       [31:0]   _zz__zz_decode_IS_DIV_65;
  wire       [31:0]   _zz__zz_decode_IS_DIV_66;
  wire       [0:0]    _zz__zz_decode_IS_DIV_67;
  wire       [31:0]   _zz__zz_decode_IS_DIV_68;
  wire       [31:0]   _zz__zz_decode_IS_DIV_69;
  wire       [9:0]    _zz__zz_decode_IS_DIV_70;
  wire       [5:0]    _zz__zz_decode_IS_DIV_71;
  wire                _zz__zz_decode_IS_DIV_72;
  wire       [31:0]   _zz__zz_decode_IS_DIV_73;
  wire       [0:0]    _zz__zz_decode_IS_DIV_74;
  wire       [31:0]   _zz__zz_decode_IS_DIV_75;
  wire       [31:0]   _zz__zz_decode_IS_DIV_76;
  wire       [2:0]    _zz__zz_decode_IS_DIV_77;
  wire                _zz__zz_decode_IS_DIV_78;
  wire       [0:0]    _zz__zz_decode_IS_DIV_79;
  wire       [31:0]   _zz__zz_decode_IS_DIV_80;
  wire       [0:0]    _zz__zz_decode_IS_DIV_81;
  wire       [31:0]   _zz__zz_decode_IS_DIV_82;
  wire                _zz__zz_decode_IS_DIV_83;
  wire                _zz__zz_decode_IS_DIV_84;
  wire       [31:0]   _zz__zz_decode_IS_DIV_85;
  wire       [0:0]    _zz__zz_decode_IS_DIV_86;
  wire       [0:0]    _zz__zz_decode_IS_DIV_87;
  wire       [0:0]    _zz__zz_decode_IS_DIV_88;
  wire       [31:0]   _zz__zz_decode_IS_DIV_89;
  wire       [31:0]   _zz__zz_decode_IS_DIV_90;
  wire       [6:0]    _zz__zz_decode_IS_DIV_91;
  wire       [0:0]    _zz__zz_decode_IS_DIV_92;
  wire       [31:0]   _zz__zz_decode_IS_DIV_93;
  wire       [31:0]   _zz__zz_decode_IS_DIV_94;
  wire                _zz__zz_decode_IS_DIV_95;
  wire                _zz__zz_decode_IS_DIV_96;
  wire       [0:0]    _zz__zz_decode_IS_DIV_97;
  wire       [3:0]    _zz__zz_decode_IS_DIV_98;
  wire       [31:0]   _zz__zz_decode_IS_DIV_99;
  wire       [31:0]   _zz__zz_decode_IS_DIV_100;
  wire       [0:0]    _zz__zz_decode_IS_DIV_101;
  wire       [31:0]   _zz__zz_decode_IS_DIV_102;
  wire       [0:0]    _zz__zz_decode_IS_DIV_103;
  wire       [31:0]   _zz__zz_decode_IS_DIV_104;
  wire       [3:0]    _zz__zz_decode_IS_DIV_105;
  wire                _zz__zz_decode_IS_DIV_106;
  wire       [31:0]   _zz__zz_decode_IS_DIV_107;
  wire       [31:0]   _zz__zz_decode_IS_DIV_108;
  wire       [0:0]    _zz__zz_decode_IS_DIV_109;
  wire       [0:0]    _zz__zz_decode_IS_DIV_110;
  wire       [31:0]   _zz__zz_decode_IS_DIV_111;
  wire       [1:0]    _zz__zz_decode_IS_DIV_112;
  wire       [31:0]   _zz__zz_decode_IS_DIV_113;
  wire       [31:0]   _zz__zz_decode_IS_DIV_114;
  wire       [31:0]   _zz__zz_decode_IS_DIV_115;
  wire       [31:0]   _zz__zz_decode_IS_DIV_116;
  wire       [1:0]    _zz__zz_decode_IS_DIV_117;
  wire       [1:0]    _zz__zz_decode_IS_DIV_118;
  wire       [31:0]   _zz__zz_decode_IS_DIV_119;
  wire       [31:0]   _zz__zz_decode_IS_DIV_120;
  wire       [1:0]    _zz__zz_decode_IS_DIV_121;
  wire       [31:0]   _zz__zz_decode_IS_DIV_122;
  wire       [31:0]   _zz__zz_decode_IS_DIV_123;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_execute_SRC1;
  wire       [4:0]    _zz__zz_execute_SRC1_1;
  wire       [11:0]   _zz__zz_execute_SRC2_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_5;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_6;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_4;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire                _zz_execute_BranchPlugin_branch_src2_6;
  wire                _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_mul_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_2;
  wire       [33:0]   _zz_memory_MulDivIterativePlugin_accumulator_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_4;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_accumulator_5;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_2;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_4;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_result_5;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_rs1_3;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs1_4;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_rs2;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs2_1;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire                decode_IS_DIV;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_MUL;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL;
  wire       [1:0]    _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL;
  wire       [1:0]    _zz_execute_to_memory_ENV_CTRL_1;
  wire       [1:0]    decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       [1:0]    decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       [1:0]    decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [1:0]    decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC2_CTRL_1;
  wire       [1:0]    decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL;
  wire       [1:0]    _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_ENABLE;
  wire       [1:0]    decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL;
  wire       [1:0]    _zz_decode_to_execute_SRC1_CTRL_1;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_MUL;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       [1:0]    memory_ENV_CTRL;
  wire       [1:0]    _zz_memory_ENV_CTRL;
  wire       [1:0]    execute_ENV_CTRL;
  wire       [1:0]    _zz_execute_ENV_CTRL;
  wire       [1:0]    writeBack_ENV_CTRL;
  wire       [1:0]    _zz_writeBack_ENV_CTRL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       [31:0]   execute_RS1;
  wire                execute_BRANCH_COND_RESULT;
  wire       [1:0]    execute_BRANCH_CTRL;
  wire       [1:0]    _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_decode_RS2;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [1:0]    memory_SHIFT_CTRL;
  wire       [1:0]    _zz_memory_SHIFT_CTRL;
  wire       [1:0]    execute_SHIFT_CTRL;
  wire       [1:0]    _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_execute_SRC2;
  wire       [1:0]    execute_SRC2_CTRL;
  wire       [1:0]    _zz_execute_SRC2_CTRL;
  wire       [1:0]    execute_SRC1_CTRL;
  wire       [1:0]    _zz_execute_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       [1:0]    execute_ALU_CTRL;
  wire       [1:0]    _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       [1:0]    execute_ALU_BITWISE_CTRL;
  wire       [1:0]    _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       [1:0]    _zz_decode_ENV_CTRL_1;
  wire       [1:0]    _zz_decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_1;
  wire       [1:0]    _zz_decode_SRC2_CTRL_1;
  wire       [1:0]    _zz_decode_ALU_CTRL_1;
  wire       [1:0]    _zz_decode_SRC1_CTRL_1;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       [1:0]    decode_BRANCH_CTRL;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_1;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                iBus_cmd_valid;
  reg                 iBus_cmd_ready;
  wire       [31:0]   iBus_cmd_payload_pc;
  wire                iBus_rsp_valid;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   iBus_rsp_payload_inst;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  wire                CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                externalInterrupt;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                debug_bus_cmd_valid;
  reg                 debug_bus_cmd_ready;
  wire                debug_bus_cmd_payload_wr;
  wire       [7:0]    debug_bus_cmd_payload_address;
  wire       [31:0]   debug_bus_cmd_payload_data;
  reg        [31:0]   debug_bus_rsp_data;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusSimplePlugin_jump_pcLoad_payload_3;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l131;
  wire                IBusSimplePlugin_fetchPc_output_fire_1;
  wire                when_Fetcher_l131_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l158;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  wire                when_Fetcher_l320;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l329;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l329_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l329_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l329_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l329_4;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  wire                _zz_4;
  reg        [18:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusSimplePlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusSimplePlugin_predictionJumpInterface_payload_3;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                when_IBusSimplePlugin_l305;
  wire                IBusSimplePlugin_cmd_fire;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l376;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                IBusSimplePlugin_rspJoin_join_fire_1;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [1:0]    dBus_cmd_payload_size;
  wire                dBus_rsp_ready;
  wire                dBus_rsp_error;
  wire       [31:0]   dBus_rsp_data;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l428;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l481;
  wire                when_DBusSimplePlugin_l488;
  wire                when_DBusSimplePlugin_l514;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l204;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_1;
  wire                _zz_writeBack_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l560;
  wire       [30:0]   _zz_decode_IS_DIV;
  wire                _zz_decode_IS_DIV_1;
  wire                _zz_decode_IS_DIV_2;
  wire                _zz_decode_IS_DIV_3;
  wire                _zz_decode_IS_DIV_4;
  wire                _zz_decode_IS_DIV_5;
  wire                _zz_decode_IS_DIV_6;
  wire                _zz_decode_IS_DIV_7;
  wire       [1:0]    _zz_decode_SRC1_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_CTRL_2;
  wire       [1:0]    _zz_decode_SRC2_CTRL_2;
  wire       [1:0]    _zz_decode_ALU_BITWISE_CTRL_2;
  wire       [1:0]    _zz_decode_SHIFT_CTRL_2;
  wire       [1:0]    _zz_decode_BRANCH_CTRL_2;
  wire       [1:0]    _zz_decode_ENV_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_7;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_execute_SRC1;
  wire                _zz_execute_SRC2_1;
  reg        [19:0]   _zz_execute_SRC2_2;
  wire                _zz_execute_SRC2_3;
  reg        [19:0]   _zz_execute_SRC2_4;
  reg        [31:0]   _zz_execute_SRC2_5;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l204_1;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget;
  reg        [19:0]   _zz_execute_BranchPlugin_missAlignedTarget_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_2;
  reg        [10:0]   _zz_execute_BranchPlugin_missAlignedTarget_3;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_4;
  reg        [18:0]   _zz_execute_BranchPlugin_missAlignedTarget_5;
  reg                 _zz_execute_BranchPlugin_missAlignedTarget_6;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_when_CsrPlugin_l952;
  wire                _zz_when_CsrPlugin_l952_1;
  wire                _zz_when_CsrPlugin_l952_2;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l909;
  wire                when_CsrPlugin_l909_1;
  wire                when_CsrPlugin_l909_2;
  wire                when_CsrPlugin_l909_3;
  wire                when_CsrPlugin_l922;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l946;
  wire                when_CsrPlugin_l952;
  wire                when_CsrPlugin_l952_1;
  wire                when_CsrPlugin_l952_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l980;
  wire                when_CsrPlugin_l980_1;
  wire                when_CsrPlugin_l980_2;
  wire                when_CsrPlugin_l985;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l991;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                when_CsrPlugin_l1019;
  wire                when_CsrPlugin_l1064;
  wire       [1:0]    switch_CsrPlugin_l1068;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1116;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1136;
  wire                when_CsrPlugin_l1137;
  wire                when_CsrPlugin_l1144;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l204_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1176;
  wire                when_CsrPlugin_l1180;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_mul_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_mul_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_value;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflow;
  wire                when_MulDivIterativePlugin_l96;
  wire                when_MulDivIterativePlugin_l97;
  wire                when_MulDivIterativePlugin_l100;
  wire                when_MulDivIterativePlugin_l110;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_MulDivIterativePlugin_rs1;
  wire                _zz_memory_MulDivIterativePlugin_rs1_1;
  reg        [32:0]   _zz_memory_MulDivIterativePlugin_rs1_2;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l225;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l244;
  wire                when_DebugPlugin_l244;
  wire       [5:0]    switch_DebugPlugin_l267;
  wire                when_DebugPlugin_l271;
  wire                when_DebugPlugin_l271_1;
  wire                when_DebugPlugin_l272;
  wire                when_DebugPlugin_l272_1;
  wire                when_DebugPlugin_l273;
  wire                when_DebugPlugin_l274;
  wire                when_DebugPlugin_l275;
  wire                when_DebugPlugin_l275_1;
  wire                when_DebugPlugin_l295;
  wire                when_DebugPlugin_l298;
  wire                when_DebugPlugin_l311;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l327;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg        [1:0]    decode_to_execute_SRC1_CTRL;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_12;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg        [1:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_15;
  reg        [1:0]    decode_to_execute_SRC2_CTRL;
  wire                when_Pipeline_l124_16;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_22;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_23;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_24;
  reg                 memory_to_writeBack_MEMORY_STORE;
  wire                when_Pipeline_l124_25;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_26;
  reg        [1:0]    decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_27;
  reg        [1:0]    decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_28;
  reg        [1:0]    execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_29;
  reg        [1:0]    decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_30;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_31;
  reg        [1:0]    decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_32;
  reg        [1:0]    execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_33;
  reg        [1:0]    memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_34;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_37;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_38;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_39;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_40;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_41;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_42;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_43;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  wire                when_Pipeline_l124_44;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_45;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_46;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_47;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  wire                when_Pipeline_l124_48;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_49;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_52;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_53;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    switch_Fetcher_l362;
  wire                when_Fetcher_l378;
  wire                when_Fetcher_l398;
  wire                when_CsrPlugin_l1264;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1264_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1264_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1264_3;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1264_4;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1264_5;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1264_6;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1264_7;
  reg                 execute_CsrPlugin_csr_3008;
  wire                when_CsrPlugin_l1264_8;
  reg                 execute_CsrPlugin_csr_4032;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  wire                when_CsrPlugin_l1297;
  wire                when_CsrPlugin_l1302;
  wire                iBus_cmd_m2sPipe_valid;
  wire                iBus_cmd_m2sPipe_ready;
  wire       [31:0]   iBus_cmd_m2sPipe_payload_pc;
  reg                 iBus_cmd_rValid;
  reg        [31:0]   iBus_cmd_rData_pc;
  wire                when_Stream_l342;
  wire                dBus_cmd_halfPipe_valid;
  wire                dBus_cmd_halfPipe_ready;
  wire                dBus_cmd_halfPipe_payload_wr;
  wire       [31:0]   dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    dBus_cmd_halfPipe_payload_size;
  reg                 dBus_cmd_rValid;
  wire                dBus_cmd_halfPipe_fire;
  reg                 dBus_cmd_rData_wr;
  reg        [31:0]   dBus_cmd_rData_address;
  reg        [31:0]   dBus_cmd_rData_data;
  reg        [1:0]    dBus_cmd_rData_size;
  reg        [3:0]    _zz_dBusWishbone_SEL;
  wire                when_DBusSimplePlugin_l189;
  wire                debug_bus_cmd_fire;
  reg                 debug_bus_cmd_fire_regNext;
  `ifndef SYNTHESIS
  reg [39:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [39:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [39:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_decode_ENV_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_string;
  reg [23:0] _zz_decode_to_execute_SRC2_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_string;
  reg [95:0] _zz_decode_to_execute_SRC1_CTRL_1_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_memory_ENV_CTRL_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_execute_ENV_CTRL_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_writeBack_ENV_CTRL_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_execute_SRC2_CTRL_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_execute_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ENV_CTRL_1_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [39:0] _zz_decode_ENV_CTRL_2_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = ({BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid} != 2'b00);
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == ShiftCtrlEnum_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 3'b001);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_6 = {{_zz_3,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_6_1 = {{_zz_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2 = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_3};
  assign _zz_DBusSimplePlugin_memoryExceptionPort_payload_code = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_execute_SRC1 = 3'b100;
  assign _zz__zz_execute_SRC1_1 = execute_INSTRUCTION[19 : 15];
  assign _zz__zz_execute_SRC2_3 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? _zz_execute_SrcPlugin_addSub_5 : _zz_execute_SrcPlugin_addSub_6);
  assign _zz_execute_SrcPlugin_addSub_5 = 32'h00000001;
  assign _zz_execute_SrcPlugin_addSub_6 = 32'h0;
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6 = {_zz_execute_BranchPlugin_missAlignedTarget_1,execute_INSTRUCTION[31 : 20]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1 = {{_zz_execute_BranchPlugin_missAlignedTarget_3,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2 = {{_zz_execute_BranchPlugin_missAlignedTarget_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_9 = 3'b100;
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1 = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_mul_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_mul_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_accumulator = (_zz_memory_MulDivIterativePlugin_accumulator_1 + _zz_memory_MulDivIterativePlugin_accumulator_3);
  assign _zz_memory_MulDivIterativePlugin_accumulator_2 = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_memory_MulDivIterativePlugin_accumulator_1 = {{1{_zz_memory_MulDivIterativePlugin_accumulator_2[32]}}, _zz_memory_MulDivIterativePlugin_accumulator_2};
  assign _zz_memory_MulDivIterativePlugin_accumulator_4 = _zz_memory_MulDivIterativePlugin_accumulator_5;
  assign _zz_memory_MulDivIterativePlugin_accumulator_3 = {{1{_zz_memory_MulDivIterativePlugin_accumulator_4[32]}}, _zz_memory_MulDivIterativePlugin_accumulator_4};
  assign _zz_memory_MulDivIterativePlugin_accumulator_5 = (memory_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator = {_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_MulDivIterativePlugin_div_result_1 = _zz_memory_MulDivIterativePlugin_div_result_2;
  assign _zz_memory_MulDivIterativePlugin_div_result_2 = _zz_memory_MulDivIterativePlugin_div_result_3;
  assign _zz_memory_MulDivIterativePlugin_div_result_3 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_memory_MulDivIterativePlugin_div_result) : _zz_memory_MulDivIterativePlugin_div_result)} + _zz_memory_MulDivIterativePlugin_div_result_4);
  assign _zz_memory_MulDivIterativePlugin_div_result_5 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_memory_MulDivIterativePlugin_div_result_4 = {32'd0, _zz_memory_MulDivIterativePlugin_div_result_5};
  assign _zz_memory_MulDivIterativePlugin_rs1_4 = _zz_memory_MulDivIterativePlugin_rs1_1;
  assign _zz_memory_MulDivIterativePlugin_rs1_3 = {32'd0, _zz_memory_MulDivIterativePlugin_rs1_4};
  assign _zz_memory_MulDivIterativePlugin_rs2_1 = _zz_memory_MulDivIterativePlugin_rs1;
  assign _zz_memory_MulDivIterativePlugin_rs2 = {31'd0, _zz_memory_MulDivIterativePlugin_rs2_1};
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_5 = {_zz_IBusSimplePlugin_jump_pcLoad_payload_3,_zz_IBusSimplePlugin_jump_pcLoad_payload_2};
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000505f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000063;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00305f) == 32'h00001013),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00005033),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hbe00707f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00000033;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[31];
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_DIV = 32'h02004064;
  assign _zz__zz_decode_IS_DIV_1 = _zz_decode_IS_DIV_7;
  assign _zz__zz_decode_IS_DIV_2 = {_zz_decode_IS_DIV_5,_zz_decode_IS_DIV_6};
  assign _zz__zz_decode_IS_DIV_3 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz__zz_decode_IS_DIV_4 = (|((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_5) == 32'h00000050));
  assign _zz__zz_decode_IS_DIV_6 = (|(_zz__zz_decode_IS_DIV_7 == _zz__zz_decode_IS_DIV_8));
  assign _zz__zz_decode_IS_DIV_9 = {(|{_zz__zz_decode_IS_DIV_10,_zz__zz_decode_IS_DIV_12}),{(|_zz__zz_decode_IS_DIV_14),{_zz__zz_decode_IS_DIV_17,{_zz__zz_decode_IS_DIV_20,_zz__zz_decode_IS_DIV_25}}}};
  assign _zz__zz_decode_IS_DIV_5 = 32'h10103050;
  assign _zz__zz_decode_IS_DIV_7 = (decode_INSTRUCTION & 32'h10403050);
  assign _zz__zz_decode_IS_DIV_8 = 32'h10000050;
  assign _zz__zz_decode_IS_DIV_10 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_11) == 32'h00001050);
  assign _zz__zz_decode_IS_DIV_12 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_13) == 32'h00002050);
  assign _zz__zz_decode_IS_DIV_14 = {_zz_decode_IS_DIV_4,(_zz__zz_decode_IS_DIV_15 == _zz__zz_decode_IS_DIV_16)};
  assign _zz__zz_decode_IS_DIV_17 = (|(_zz__zz_decode_IS_DIV_18 == _zz__zz_decode_IS_DIV_19));
  assign _zz__zz_decode_IS_DIV_20 = (|{_zz__zz_decode_IS_DIV_21,_zz__zz_decode_IS_DIV_23});
  assign _zz__zz_decode_IS_DIV_25 = {(|_zz__zz_decode_IS_DIV_26),{_zz__zz_decode_IS_DIV_31,{_zz__zz_decode_IS_DIV_34,_zz__zz_decode_IS_DIV_36}}};
  assign _zz__zz_decode_IS_DIV_11 = 32'h00001050;
  assign _zz__zz_decode_IS_DIV_13 = 32'h00002050;
  assign _zz__zz_decode_IS_DIV_15 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_DIV_16 = 32'h00000004;
  assign _zz__zz_decode_IS_DIV_18 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_DIV_19 = 32'h00000040;
  assign _zz__zz_decode_IS_DIV_21 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_22) == 32'h00005010);
  assign _zz__zz_decode_IS_DIV_23 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_24) == 32'h00005020);
  assign _zz__zz_decode_IS_DIV_26 = {(_zz__zz_decode_IS_DIV_27 == _zz__zz_decode_IS_DIV_28),{_zz__zz_decode_IS_DIV_29,_zz__zz_decode_IS_DIV_30}};
  assign _zz__zz_decode_IS_DIV_31 = (|(_zz__zz_decode_IS_DIV_32 == _zz__zz_decode_IS_DIV_33));
  assign _zz__zz_decode_IS_DIV_34 = (|_zz__zz_decode_IS_DIV_35);
  assign _zz__zz_decode_IS_DIV_36 = {(|_zz__zz_decode_IS_DIV_37),{_zz__zz_decode_IS_DIV_38,{_zz__zz_decode_IS_DIV_43,_zz__zz_decode_IS_DIV_46}}};
  assign _zz__zz_decode_IS_DIV_22 = 32'h00007034;
  assign _zz__zz_decode_IS_DIV_24 = 32'h02007064;
  assign _zz__zz_decode_IS_DIV_27 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz__zz_decode_IS_DIV_28 = 32'h40001010;
  assign _zz__zz_decode_IS_DIV_29 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz__zz_decode_IS_DIV_30 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz__zz_decode_IS_DIV_32 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_DIV_33 = 32'h00000024;
  assign _zz__zz_decode_IS_DIV_35 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz__zz_decode_IS_DIV_37 = _zz_decode_IS_DIV_5;
  assign _zz__zz_decode_IS_DIV_38 = (|{(_zz__zz_decode_IS_DIV_39 == _zz__zz_decode_IS_DIV_40),(_zz__zz_decode_IS_DIV_41 == _zz__zz_decode_IS_DIV_42)});
  assign _zz__zz_decode_IS_DIV_43 = (|{_zz__zz_decode_IS_DIV_44,_zz__zz_decode_IS_DIV_45});
  assign _zz__zz_decode_IS_DIV_46 = {(|{_zz__zz_decode_IS_DIV_47,_zz__zz_decode_IS_DIV_49}),{(|_zz__zz_decode_IS_DIV_52),{_zz__zz_decode_IS_DIV_54,{_zz__zz_decode_IS_DIV_57,_zz__zz_decode_IS_DIV_70}}}};
  assign _zz__zz_decode_IS_DIV_39 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_DIV_40 = 32'h00002000;
  assign _zz__zz_decode_IS_DIV_41 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz__zz_decode_IS_DIV_42 = 32'h00001000;
  assign _zz__zz_decode_IS_DIV_44 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz__zz_decode_IS_DIV_45 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz__zz_decode_IS_DIV_47 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_48) == 32'h00000040);
  assign _zz__zz_decode_IS_DIV_49 = {_zz_decode_IS_DIV_2,(_zz__zz_decode_IS_DIV_50 == _zz__zz_decode_IS_DIV_51)};
  assign _zz__zz_decode_IS_DIV_52 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_53) == 32'h00000020);
  assign _zz__zz_decode_IS_DIV_54 = (|(_zz__zz_decode_IS_DIV_55 == _zz__zz_decode_IS_DIV_56));
  assign _zz__zz_decode_IS_DIV_57 = (|{_zz__zz_decode_IS_DIV_58,_zz__zz_decode_IS_DIV_59});
  assign _zz__zz_decode_IS_DIV_70 = {(|_zz__zz_decode_IS_DIV_71),{_zz__zz_decode_IS_DIV_83,{_zz__zz_decode_IS_DIV_86,_zz__zz_decode_IS_DIV_91}}};
  assign _zz__zz_decode_IS_DIV_48 = 32'h00000050;
  assign _zz__zz_decode_IS_DIV_50 = (decode_INSTRUCTION & 32'h00103040);
  assign _zz__zz_decode_IS_DIV_51 = 32'h00000040;
  assign _zz__zz_decode_IS_DIV_53 = 32'h00000020;
  assign _zz__zz_decode_IS_DIV_55 = (decode_INSTRUCTION & 32'h00000010);
  assign _zz__zz_decode_IS_DIV_56 = 32'h00000010;
  assign _zz__zz_decode_IS_DIV_58 = _zz_decode_IS_DIV_3;
  assign _zz__zz_decode_IS_DIV_59 = {(_zz__zz_decode_IS_DIV_60 == _zz__zz_decode_IS_DIV_61),{_zz__zz_decode_IS_DIV_62,{_zz__zz_decode_IS_DIV_64,_zz__zz_decode_IS_DIV_67}}};
  assign _zz__zz_decode_IS_DIV_71 = {_zz_decode_IS_DIV_4,{_zz__zz_decode_IS_DIV_72,{_zz__zz_decode_IS_DIV_74,_zz__zz_decode_IS_DIV_77}}};
  assign _zz__zz_decode_IS_DIV_83 = (|{_zz_decode_IS_DIV_3,_zz__zz_decode_IS_DIV_84});
  assign _zz__zz_decode_IS_DIV_86 = (|{_zz__zz_decode_IS_DIV_87,_zz__zz_decode_IS_DIV_88});
  assign _zz__zz_decode_IS_DIV_91 = {(|_zz__zz_decode_IS_DIV_92),{_zz__zz_decode_IS_DIV_95,{_zz__zz_decode_IS_DIV_97,_zz__zz_decode_IS_DIV_105}}};
  assign _zz__zz_decode_IS_DIV_60 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_IS_DIV_61 = 32'h00002010;
  assign _zz__zz_decode_IS_DIV_62 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_63) == 32'h00000010);
  assign _zz__zz_decode_IS_DIV_64 = (_zz__zz_decode_IS_DIV_65 == _zz__zz_decode_IS_DIV_66);
  assign _zz__zz_decode_IS_DIV_67 = (_zz__zz_decode_IS_DIV_68 == _zz__zz_decode_IS_DIV_69);
  assign _zz__zz_decode_IS_DIV_72 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_73) == 32'h00001010);
  assign _zz__zz_decode_IS_DIV_74 = (_zz__zz_decode_IS_DIV_75 == _zz__zz_decode_IS_DIV_76);
  assign _zz__zz_decode_IS_DIV_77 = {_zz__zz_decode_IS_DIV_78,{_zz__zz_decode_IS_DIV_79,_zz__zz_decode_IS_DIV_81}};
  assign _zz__zz_decode_IS_DIV_84 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_85) == 32'h00000020);
  assign _zz__zz_decode_IS_DIV_87 = _zz_decode_IS_DIV_3;
  assign _zz__zz_decode_IS_DIV_88 = (_zz__zz_decode_IS_DIV_89 == _zz__zz_decode_IS_DIV_90);
  assign _zz__zz_decode_IS_DIV_92 = (_zz__zz_decode_IS_DIV_93 == _zz__zz_decode_IS_DIV_94);
  assign _zz__zz_decode_IS_DIV_95 = (|_zz__zz_decode_IS_DIV_96);
  assign _zz__zz_decode_IS_DIV_97 = (|_zz__zz_decode_IS_DIV_98);
  assign _zz__zz_decode_IS_DIV_105 = {_zz__zz_decode_IS_DIV_106,{_zz__zz_decode_IS_DIV_109,_zz__zz_decode_IS_DIV_117}};
  assign _zz__zz_decode_IS_DIV_63 = 32'h00001030;
  assign _zz__zz_decode_IS_DIV_65 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz__zz_decode_IS_DIV_66 = 32'h00002020;
  assign _zz__zz_decode_IS_DIV_68 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_IS_DIV_69 = 32'h00000020;
  assign _zz__zz_decode_IS_DIV_73 = 32'h00001010;
  assign _zz__zz_decode_IS_DIV_75 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_DIV_76 = 32'h00002010;
  assign _zz__zz_decode_IS_DIV_78 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz__zz_decode_IS_DIV_79 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_80) == 32'h00000004);
  assign _zz__zz_decode_IS_DIV_81 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_82) == 32'h0);
  assign _zz__zz_decode_IS_DIV_85 = 32'h00000070;
  assign _zz__zz_decode_IS_DIV_89 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_DIV_90 = 32'h0;
  assign _zz__zz_decode_IS_DIV_93 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_IS_DIV_94 = 32'h00004010;
  assign _zz__zz_decode_IS_DIV_96 = ((decode_INSTRUCTION & 32'h00006014) == 32'h00002010);
  assign _zz__zz_decode_IS_DIV_98 = {(_zz__zz_decode_IS_DIV_99 == _zz__zz_decode_IS_DIV_100),{_zz_decode_IS_DIV_2,{_zz__zz_decode_IS_DIV_101,_zz__zz_decode_IS_DIV_103}}};
  assign _zz__zz_decode_IS_DIV_106 = (|(_zz__zz_decode_IS_DIV_107 == _zz__zz_decode_IS_DIV_108));
  assign _zz__zz_decode_IS_DIV_109 = (|{_zz__zz_decode_IS_DIV_110,_zz__zz_decode_IS_DIV_112});
  assign _zz__zz_decode_IS_DIV_117 = {(|_zz__zz_decode_IS_DIV_118),(|_zz__zz_decode_IS_DIV_121)};
  assign _zz__zz_decode_IS_DIV_80 = 32'h0000000c;
  assign _zz__zz_decode_IS_DIV_82 = 32'h00000028;
  assign _zz__zz_decode_IS_DIV_99 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_DIV_100 = 32'h0;
  assign _zz__zz_decode_IS_DIV_101 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_102) == 32'h00002000);
  assign _zz__zz_decode_IS_DIV_103 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_104) == 32'h00001000);
  assign _zz__zz_decode_IS_DIV_107 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_DIV_108 = 32'h0;
  assign _zz__zz_decode_IS_DIV_110 = ((decode_INSTRUCTION & _zz__zz_decode_IS_DIV_111) == 32'h00000040);
  assign _zz__zz_decode_IS_DIV_112 = {(_zz__zz_decode_IS_DIV_113 == _zz__zz_decode_IS_DIV_114),(_zz__zz_decode_IS_DIV_115 == _zz__zz_decode_IS_DIV_116)};
  assign _zz__zz_decode_IS_DIV_118 = {(_zz__zz_decode_IS_DIV_119 == _zz__zz_decode_IS_DIV_120),_zz_decode_IS_DIV_1};
  assign _zz__zz_decode_IS_DIV_121 = {(_zz__zz_decode_IS_DIV_122 == _zz__zz_decode_IS_DIV_123),_zz_decode_IS_DIV_1};
  assign _zz__zz_decode_IS_DIV_102 = 32'h00006004;
  assign _zz__zz_decode_IS_DIV_104 = 32'h00005004;
  assign _zz__zz_decode_IS_DIV_111 = 32'h00000044;
  assign _zz__zz_decode_IS_DIV_113 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_IS_DIV_114 = 32'h00002010;
  assign _zz__zz_decode_IS_DIV_115 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz__zz_decode_IS_DIV_116 = 32'h40000030;
  assign _zz__zz_decode_IS_DIV_119 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz__zz_decode_IS_DIV_120 = 32'h00000004;
  assign _zz__zz_decode_IS_DIV_122 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz__zz_decode_IS_DIV_123 = 32'h00000004;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[7];
  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready               ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (1'b0                                                            ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                       (jtag_tms                                           ), //i
    .io_jtag_tdi                       (jtag_tdi                                           ), //i
    .io_jtag_tdo                       (jtagBridge_1_io_jtag_tdo                           ), //o
    .io_jtag_tck                       (jtag_tck                                           ), //i
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .clk                               (clk                                                ), //i
    .debugReset                        (debugReset                                         )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (debug_bus_cmd_ready                                ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (debug_bus_cmd_fire_regNext                         ), //i
    .io_mem_rsp_payload                (debug_bus_rsp_data[31:0]                           ), //i
    .clk                               (clk                                                ), //i
    .debugReset                        (debugReset                                         )  //i
  );
  always @(*) begin
    case(_zz_IBusSimplePlugin_jump_pcLoad_payload_5)
      2'b00 : begin
        _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_IBusSimplePlugin_jump_pcLoad_payload_4 = IBusSimplePlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL";
      default : _zz_execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : decode_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_string = "ECALL";
      default : _zz_decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL";
      default : _zz_decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_to_execute_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_to_execute_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_to_execute_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_to_execute_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_to_execute_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_to_execute_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_to_execute_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_to_execute_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_to_execute_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : memory_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_memory_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_memory_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_memory_ENV_CTRL_string = "ECALL";
      default : _zz_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : execute_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_execute_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_execute_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_execute_ENV_CTRL_string = "ECALL";
      default : _zz_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : writeBack_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : writeBack_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : _zz_writeBack_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_writeBack_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL";
      default : _zz_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : _zz_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : _zz_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : _zz_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : _zz_execute_SRC2_CTRL_string = "PC ";
      default : _zz_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : _zz_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_execute_SRC1_CTRL_string = "URS1        ";
      default : _zz_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_1_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_1_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL";
      default : _zz_decode_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      Src1CtrlEnum_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      Src1CtrlEnum_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      AluCtrlEnum_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      Src2CtrlEnum_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      Src2CtrlEnum_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      Src2CtrlEnum_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      Src2CtrlEnum_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      AluBitwiseCtrlEnum_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      ShiftCtrlEnum_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      BranchCtrlEnum_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      BranchCtrlEnum_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      BranchCtrlEnum_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      BranchCtrlEnum_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      EnvCtrlEnum_NONE : _zz_decode_ENV_CTRL_2_string = "NONE ";
      EnvCtrlEnum_XRET : _zz_decode_ENV_CTRL_2_string = "XRET ";
      EnvCtrlEnum_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL";
      default : _zz_decode_ENV_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      Src1CtrlEnum_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      Src1CtrlEnum_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      Src1CtrlEnum_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      Src1CtrlEnum_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      AluCtrlEnum_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      AluCtrlEnum_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      AluCtrlEnum_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      Src2CtrlEnum_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      Src2CtrlEnum_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      Src2CtrlEnum_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      Src2CtrlEnum_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      AluBitwiseCtrlEnum_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      AluBitwiseCtrlEnum_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      ShiftCtrlEnum_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      ShiftCtrlEnum_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      ShiftCtrlEnum_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      ShiftCtrlEnum_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      BranchCtrlEnum_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      BranchCtrlEnum_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      BranchCtrlEnum_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      EnvCtrlEnum_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      EnvCtrlEnum_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      EnvCtrlEnum_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      EnvCtrlEnum_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      EnvCtrlEnum_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_IS_DIV = _zz_decode_IS_DIV[29];
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_DIV[28];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_DIV[27];
  assign decode_IS_MUL = _zz_decode_IS_DIV[26];
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_DIV[23];
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_DIV[15];
  assign decode_MEMORY_STORE = _zz_decode_IS_DIV[12];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_DIV[11];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_DIV[10];
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL = _zz_decode_to_execute_SRC2_CTRL_1;
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_DIV[3];
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign _zz_decode_to_execute_SRC1_CTRL = _zz_decode_to_execute_SRC1_CTRL_1;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_DIV[30];
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_DIV[14];
  assign decode_RS1_USE = _zz_decode_IS_DIV[4];
  always @(*) begin
    _zz_decode_RS2 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1176) begin
      _zz_decode_RS2 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        ShiftCtrlEnum_SLL_1 : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        ShiftCtrlEnum_SRL_1, ShiftCtrlEnum_SRA_1 : begin
          _zz_decode_RS2_1 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l96) begin
      _zz_decode_RS2_1 = ((memory_INSTRUCTION[13 : 12] == 2'b00) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2_1 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_execute_SRC2 = execute_PC;
  assign execute_SRC2_CTRL = _zz_execute_SRC2_CTRL;
  assign execute_SRC1_CTRL = _zz_execute_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_DIV[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_DIV[18];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = _zz_execute_SRC2_5;
  assign execute_SRC1 = _zz_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_DIV[9];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = (|{((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}}});
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l560) begin
      _zz_decode_RS2_2 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1116) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(decodeExceptionPort_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l428) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1180) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DebugPlugin_l295) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l481) begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l97) begin
        memory_arbitration_haltItself = 1'b1;
      end
      if(when_MulDivIterativePlugin_l100) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1019) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l922) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1019) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l295) begin
      if(when_DebugPlugin_l298) begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l311) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1064) begin
      case(switch_CsrPlugin_l1068)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l327) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != 3'b000);
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz__zz_IBusSimplePlugin_jump_pcLoad_payload_1));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = _zz_IBusSimplePlugin_jump_pcLoad_payload_1[1];
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_3 = _zz_IBusSimplePlugin_jump_pcLoad_payload_1[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_IBusSimplePlugin_jump_pcLoad_payload_4;
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l131 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign IBusSimplePlugin_fetchPc_output_fire_1 = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign when_Fetcher_l131_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l158 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if(when_IBusSimplePlugin_l305) begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1 = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if(when_Fetcher_l320) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l320 = (! IBusSimplePlugin_pcValids_0);
  assign when_Fetcher_l329 = (! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l329_1 = (! (! IBusSimplePlugin_injector_decodeInput_ready));
  assign when_Fetcher_l329_2 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l329_3 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l329_4 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  end

  always @(*) begin
    IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) || ((decode_BRANCH_CTRL == BranchCtrlEnum_B) && _zz_IBusSimplePlugin_decodePrediction_cmd_hadBranch_2[31]));
    if(_zz_6) begin
      IBusSimplePlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_2 = _zz__zz_2[19];
  always @(*) begin
    _zz_3[10] = _zz_2;
    _zz_3[9] = _zz_2;
    _zz_3[8] = _zz_2;
    _zz_3[7] = _zz_2;
    _zz_3[6] = _zz_2;
    _zz_3[5] = _zz_2;
    _zz_3[4] = _zz_2;
    _zz_3[3] = _zz_2;
    _zz_3[2] = _zz_2;
    _zz_3[1] = _zz_2;
    _zz_3[0] = _zz_2;
  end

  assign _zz_4 = _zz__zz_4[11];
  always @(*) begin
    _zz_5[18] = _zz_4;
    _zz_5[17] = _zz_4;
    _zz_5[16] = _zz_4;
    _zz_5[15] = _zz_4;
    _zz_5[14] = _zz_4;
    _zz_5[13] = _zz_4;
    _zz_5[12] = _zz_4;
    _zz_5[11] = _zz_4;
    _zz_5[10] = _zz_4;
    _zz_5[9] = _zz_4;
    _zz_5[8] = _zz_4;
    _zz_5[7] = _zz_4;
    _zz_5[6] = _zz_4;
    _zz_5[5] = _zz_4;
    _zz_5[4] = _zz_4;
    _zz_5[3] = _zz_4;
    _zz_5[2] = _zz_4;
    _zz_5[1] = _zz_4;
    _zz_5[0] = _zz_4;
  end

  always @(*) begin
    case(decode_BRANCH_CTRL)
      BranchCtrlEnum_JAL : begin
        _zz_6 = _zz__zz_6[1];
      end
      default : begin
        _zz_6 = _zz__zz_6_1[1];
      end
    endcase
  end

  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload = _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[10] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[9] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[8] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[7] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[6] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[5] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[4] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[3] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[2] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[1] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_1[0] = _zz_IBusSimplePlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusSimplePlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusSimplePlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[18] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[17] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[16] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[15] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[14] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[13] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[12] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[11] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[10] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[9] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[8] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[7] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[6] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[5] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[4] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[3] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[2] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[1] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
    _zz_IBusSimplePlugin_predictionJumpInterface_payload_3[0] = _zz_IBusSimplePlugin_predictionJumpInterface_payload_2;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_IBusSimplePlugin_predictionJumpInterface_payload_1,{{{_zz_IBusSimplePlugin_predictionJumpInterface_payload_4,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusSimplePlugin_predictionJumpInterface_payload_3,{{{_zz_IBusSimplePlugin_predictionJumpInterface_payload_5,_zz_IBusSimplePlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign when_IBusSimplePlugin_l305 = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmd_fire;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l376) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l376 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_join_fire_1 = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire_1;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l428 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l481 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(when_DBusSimplePlugin_l488) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(when_DBusSimplePlugin_l514) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(when_DBusSimplePlugin_l488) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_DBusSimplePlugin_memoryExceptionPort_payload_code};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  assign when_DBusSimplePlugin_l488 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign when_DBusSimplePlugin_l514 = (! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers))));
  always @(*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l204 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusSimplePlugin_rspFormated = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[31] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[30] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[29] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[28] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[27] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[26] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[25] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[24] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[23] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[22] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[21] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[20] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[19] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[18] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[17] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[16] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[15] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[14] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[13] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[12] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[11] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[10] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[9] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[8] = _zz_writeBack_DBusSimplePlugin_rspFormated;
    _zz_writeBack_DBusSimplePlugin_rspFormated_1[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_writeBack_DBusSimplePlugin_rspFormated_2 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[31] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[30] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[29] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[28] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[27] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[26] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[25] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[24] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[23] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[22] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[21] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[20] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[19] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[18] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[17] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[16] = _zz_writeBack_DBusSimplePlugin_rspFormated_2;
    _zz_writeBack_DBusSimplePlugin_rspFormated_3[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l204)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_writeBack_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l560 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_decode_IS_DIV_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_DIV_2 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_decode_IS_DIV_3 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_DIV_4 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_DIV_5 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_decode_IS_DIV_6 = ((decode_INSTRUCTION & 32'h00007000) == 32'h00001000);
  assign _zz_decode_IS_DIV_7 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00004000);
  assign _zz_decode_IS_DIV = {(|((decode_INSTRUCTION & 32'h10103050) == 32'h00100050)),{(|((decode_INSTRUCTION & _zz__zz_decode_IS_DIV) == 32'h02004020)),{(|{_zz_decode_IS_DIV_7,_zz_decode_IS_DIV_6}),{(|{_zz__zz_decode_IS_DIV_1,_zz__zz_decode_IS_DIV_2}),{(|_zz__zz_decode_IS_DIV_3),{_zz__zz_decode_IS_DIV_4,{_zz__zz_decode_IS_DIV_6,_zz__zz_decode_IS_DIV_9}}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_DIV[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_DIV[6 : 5];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_DIV[8 : 7];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_DIV[17 : 16];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_DIV[20 : 19];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_DIV[22 : 21];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_DIV[25 : 24];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_7) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_7) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_7) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      AluBitwiseCtrlEnum_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      AluBitwiseCtrlEnum_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      AluCtrlEnum_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      AluCtrlEnum_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(execute_SRC1_CTRL)
      Src1CtrlEnum_RS : begin
        _zz_execute_SRC1 = execute_RS1;
      end
      Src1CtrlEnum_PC_INCREMENT : begin
        _zz_execute_SRC1 = {29'd0, _zz__zz_execute_SRC1};
      end
      Src1CtrlEnum_IMU : begin
        _zz_execute_SRC1 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_execute_SRC1 = {27'd0, _zz__zz_execute_SRC1_1};
      end
    endcase
  end

  assign _zz_execute_SRC2_1 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_SRC2_2[19] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[18] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[17] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[16] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[15] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[14] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[13] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[12] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[11] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[10] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[9] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[8] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[7] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[6] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[5] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[4] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[3] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[2] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[1] = _zz_execute_SRC2_1;
    _zz_execute_SRC2_2[0] = _zz_execute_SRC2_1;
  end

  assign _zz_execute_SRC2_3 = _zz__zz_execute_SRC2_3[11];
  always @(*) begin
    _zz_execute_SRC2_4[19] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[18] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[17] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[16] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[15] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[14] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[13] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[12] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[11] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[10] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[9] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[8] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[7] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[6] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[5] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[4] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[3] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[2] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[1] = _zz_execute_SRC2_3;
    _zz_execute_SRC2_4[0] = _zz_execute_SRC2_3;
  end

  always @(*) begin
    case(execute_SRC2_CTRL)
      Src2CtrlEnum_RS : begin
        _zz_execute_SRC2_5 = execute_RS2;
      end
      Src2CtrlEnum_IMI : begin
        _zz_execute_SRC2_5 = {_zz_execute_SRC2_2,execute_INSTRUCTION[31 : 20]};
      end
      Src2CtrlEnum_IMS : begin
        _zz_execute_SRC2_5 = {_zz_execute_SRC2_4,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_execute_SRC2_5 = _zz_execute_SRC2;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == ShiftCtrlEnum_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l204_1 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    casez(switch_Misc_l204_1)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b1?1 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      BranchCtrlEnum_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_1[19] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[18] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[17] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[16] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[15] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[14] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[13] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[12] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[11] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[10] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[9] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[8] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[7] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[6] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[5] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[4] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[3] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[2] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[1] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[0] = _zz_execute_BranchPlugin_missAlignedTarget;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_2 = _zz__zz_execute_BranchPlugin_missAlignedTarget_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_3[10] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[9] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[8] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[7] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[6] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[5] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[4] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[3] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[2] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[1] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[0] = _zz_execute_BranchPlugin_missAlignedTarget_2;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_4 = _zz__zz_execute_BranchPlugin_missAlignedTarget_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_5[18] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[17] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[16] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[15] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[14] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[13] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[12] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[11] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[10] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[9] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[8] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[7] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[6] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[5] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[4] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[3] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[2] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[1] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[0] = _zz_execute_BranchPlugin_missAlignedTarget_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = (_zz__zz_execute_BranchPlugin_missAlignedTarget_6[1] ^ execute_RS1[1]);
      end
      BranchCtrlEnum_JAL : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1[1];
      end
      default : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_execute_BranchPlugin_missAlignedTarget_6);
  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      BranchCtrlEnum_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == BranchCtrlEnum_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_7,_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_9};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_when_CsrPlugin_l952 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l952_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l952_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l909 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l909_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l909_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l909_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l922 = ({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000);
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l946 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l952 = ((_zz_when_CsrPlugin_l952 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_1 = ((_zz_when_CsrPlugin_l952_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_2 = ((_zz_when_CsrPlugin_l952_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l980 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l980_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l980_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l985 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l991) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l991 = ({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000);
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1019 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1064 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET));
  assign switch_CsrPlugin_l1068 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1116 = (|{(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == EnvCtrlEnum_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == EnvCtrlEnum_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET))}});
  assign execute_CsrPlugin_blockedBySideEffects = ((|{writeBack_arbitration_isValid,memory_arbitration_isValid}) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3008) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_4032) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1302) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1136) begin
      if(when_CsrPlugin_l1137) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1144) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1144) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1136 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_XRET));
  assign when_CsrPlugin_l1137 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1144 = (execute_arbitration_isValid && (execute_ENV_CTRL == EnvCtrlEnum_ECALL));
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l204_2 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l204_2)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1176 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1180 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l100) begin
        memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_mul_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l110) begin
      memory_MulDivIterativePlugin_mul_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_mul_counter_value == 6'h20);
  assign memory_MulDivIterativePlugin_mul_counter_willOverflow = (memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc && memory_MulDivIterativePlugin_mul_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_mul_counter_willOverflow) begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_memory_MulDivIterativePlugin_mul_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear) begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l96 = (memory_arbitration_isValid && memory_IS_MUL);
  assign when_MulDivIterativePlugin_l97 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign when_MulDivIterativePlugin_l100 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign when_MulDivIterativePlugin_l110 = (! memory_arbitration_isStuck);
  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_memory_MulDivIterativePlugin_div_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder : _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign _zz_memory_MulDivIterativePlugin_div_result = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_MulDivIterativePlugin_rs1 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_MulDivIterativePlugin_rs1_1 = ((execute_IS_MUL && _zz_memory_MulDivIterativePlugin_rs1) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_MulDivIterativePlugin_rs1_2[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_MulDivIterativePlugin_rs1_2[31 : 0] = execute_RS1;
  end

  assign _zz_CsrPlugin_csrMapping_readDataInit_1 = (_zz_CsrPlugin_csrMapping_readDataInit & externalInterruptArray_regNext);
  assign externalInterrupt = (|_zz_CsrPlugin_csrMapping_readDataInit_1);
  assign when_DebugPlugin_l225 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l267)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l244) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l244 = (! _zz_when_DebugPlugin_l244);
  always @(*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l267)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l267 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l271 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l271_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l272 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l272_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l273 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l274 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l275 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l275_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l295 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l298 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign when_DebugPlugin_l311 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l327 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_SRC1_CTRL_1 = decode_SRC1_CTRL;
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC1_CTRL = decode_to_execute_SRC1_CTRL;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_14 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_to_execute_SRC2_CTRL_1 = decode_SRC2_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign _zz_execute_SRC2_CTRL = decode_to_execute_SRC2_CTRL;
  assign when_Pipeline_l124_16 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_26 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_28 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_33 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(switch_Fetcher_l362)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l378 = (! decode_arbitration_isStuck);
  assign when_Fetcher_l398 = (switch_Fetcher_l362 != 3'b000);
  assign when_CsrPlugin_l1264 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_8 = (! execute_arbitration_isStuck);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_3[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_3[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_4[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_6[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_3008) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h0;
    if(execute_CsrPlugin_csr_4032) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 0] = _zz_CsrPlugin_csrMapping_readDataInit_1;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3) | (_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5)) | ((_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7) | (_zz_CsrPlugin_csrMapping_readDataInit_8 | _zz_CsrPlugin_csrMapping_readDataInit_9)));
  assign when_CsrPlugin_l1297 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1302 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(*) begin
    iBus_cmd_ready = iBus_cmd_m2sPipe_ready;
    if(when_Stream_l342) begin
      iBus_cmd_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! iBus_cmd_m2sPipe_valid);
  assign iBus_cmd_m2sPipe_valid = iBus_cmd_rValid;
  assign iBus_cmd_m2sPipe_payload_pc = iBus_cmd_rData_pc;
  assign iBusWishbone_ADR = (iBus_cmd_m2sPipe_payload_pc >>> 2);
  assign iBusWishbone_CTI = 3'b000;
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign iBusWishbone_CYC = iBus_cmd_m2sPipe_valid;
  assign iBusWishbone_STB = iBus_cmd_m2sPipe_valid;
  assign iBus_cmd_m2sPipe_ready = (iBus_cmd_m2sPipe_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = (iBusWishbone_CYC && iBusWishbone_ACK);
  assign iBus_rsp_payload_inst = iBusWishbone_DAT_MISO;
  assign iBus_rsp_payload_error = 1'b0;
  assign dBus_cmd_halfPipe_fire = (dBus_cmd_halfPipe_valid && dBus_cmd_halfPipe_ready);
  assign dBus_cmd_ready = (! dBus_cmd_rValid);
  assign dBus_cmd_halfPipe_valid = dBus_cmd_rValid;
  assign dBus_cmd_halfPipe_payload_wr = dBus_cmd_rData_wr;
  assign dBus_cmd_halfPipe_payload_address = dBus_cmd_rData_address;
  assign dBus_cmd_halfPipe_payload_data = dBus_cmd_rData_data;
  assign dBus_cmd_halfPipe_payload_size = dBus_cmd_rData_size;
  assign dBusWishbone_ADR = (dBus_cmd_halfPipe_payload_address >>> 2);
  assign dBusWishbone_CTI = 3'b000;
  assign dBusWishbone_BTE = 2'b00;
  always @(*) begin
    case(dBus_cmd_halfPipe_payload_size)
      2'b00 : begin
        _zz_dBusWishbone_SEL = 4'b0001;
      end
      2'b01 : begin
        _zz_dBusWishbone_SEL = 4'b0011;
      end
      default : begin
        _zz_dBusWishbone_SEL = 4'b1111;
      end
    endcase
  end

  always @(*) begin
    dBusWishbone_SEL = (_zz_dBusWishbone_SEL <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
    if(when_DBusSimplePlugin_l189) begin
      dBusWishbone_SEL = 4'b1111;
    end
  end

  assign when_DBusSimplePlugin_l189 = (! dBus_cmd_halfPipe_payload_wr);
  assign dBusWishbone_WE = dBus_cmd_halfPipe_payload_wr;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_halfPipe_payload_data;
  assign dBus_cmd_halfPipe_ready = (dBus_cmd_halfPipe_valid && dBusWishbone_ACK);
  assign dBusWishbone_CYC = dBus_cmd_halfPipe_valid;
  assign dBusWishbone_STB = dBus_cmd_halfPipe_valid;
  assign dBus_rsp_ready = ((dBus_cmd_halfPipe_valid && (! dBusWishbone_WE)) && dBusWishbone_ACK);
  assign dBus_rsp_data = dBusWishbone_DAT_MISO;
  assign dBus_rsp_error = 1'b0;
  assign debug_bus_cmd_valid = systemDebugger_1_io_mem_cmd_valid;
  assign debug_bus_cmd_payload_wr = systemDebugger_1_io_mem_cmd_payload_wr;
  assign debug_bus_cmd_payload_data = systemDebugger_1_io_mem_cmd_payload_data;
  assign debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign debug_bus_cmd_fire = (debug_bus_cmd_valid && debug_bus_cmd_ready);
  assign jtag_tdo = jtagBridge_1_io_jtag_tdo;
  always @(posedge clk) begin
    if(reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      _zz_7 <= 1'b1;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      memory_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_CsrPlugin_csrMapping_readDataInit <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      switch_Fetcher_l362 <= 3'b000;
      iBus_cmd_rValid <= 1'b0;
      dBus_cmd_rValid <= 1'b0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l131) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l131_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l158) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      end
      if(_zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l329) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l329_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l329_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l329_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l329_4) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_2);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      _zz_7 <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if(when_CsrPlugin_l909) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l909_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l909_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l909_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l946) begin
        if(when_CsrPlugin_l952) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l980) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l980_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l980_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l985) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1019) begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(when_CsrPlugin_l1064) begin
        case(switch_CsrPlugin_l1068)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_when_CsrPlugin_l952_2,{_zz_when_CsrPlugin_l952_1,_zz_when_CsrPlugin_l952}} != 3'b000) || CsrPlugin_thirdPartyWake);
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(switch_Fetcher_l362)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid) begin
            switch_Fetcher_l362 <= 3'b001;
          end
        end
        3'b001 : begin
          switch_Fetcher_l362 <= 3'b010;
        end
        3'b010 : begin
          switch_Fetcher_l362 <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l378) begin
            switch_Fetcher_l362 <= 3'b100;
          end
        end
        3'b100 : begin
          switch_Fetcher_l362 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPP <= CsrPlugin_csrMapping_writeDataSignal[12 : 11];
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_3008) begin
        if(execute_CsrPlugin_writeEnable) begin
          _zz_CsrPlugin_csrMapping_readDataInit <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
        end
      end
      if(iBus_cmd_ready) begin
        iBus_cmd_rValid <= iBus_cmd_valid;
      end
      if(dBus_cmd_valid) begin
        dBus_cmd_rValid <= 1'b1;
      end
      if(dBus_cmd_halfPipe_fire) begin
        dBus_cmd_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(IBusSimplePlugin_iBusRsp_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring) begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(decodeExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? DBusSimplePlugin_memoryExceptionPort_payload_code : BranchPlugin_branchExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? DBusSimplePlugin_memoryExceptionPort_payload_badAddr : BranchPlugin_branchExceptionPort_payload_badAddr);
    end
    if(when_CsrPlugin_l946) begin
      if(when_CsrPlugin_l952) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1019) begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException) begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l96) begin
      if(when_MulDivIterativePlugin_l100) begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_memory_MulDivIterativePlugin_accumulator,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if(when_MulDivIterativePlugin_l126) begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_MulDivIterativePlugin_div_result <= _zz_memory_MulDivIterativePlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_memory_MulDivIterativePlugin_rs1_1 ? (~ _zz_memory_MulDivIterativePlugin_rs1_2) : _zz_memory_MulDivIterativePlugin_rs1_2) + _zz_memory_MulDivIterativePlugin_rs1_3);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_memory_MulDivIterativePlugin_rs1 ? (~ execute_RS2) : execute_RS2) + _zz_memory_MulDivIterativePlugin_rs2);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_memory_MulDivIterativePlugin_rs1_1 ^ (_zz_memory_MulDivIterativePlugin_rs1 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= _zz_execute_SRC2;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_SRC1_CTRL <= _zz_decode_to_execute_SRC1_CTRL;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_12) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_SRC2_CTRL <= _zz_decode_to_execute_SRC2_CTRL;
    end
    if(when_Pipeline_l124_16) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_22) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_23) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_24) begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if(when_Pipeline_l124_25) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_26) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_28) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_33) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_34) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_37) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_39) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l124_42) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_43) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_47) begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if(when_Pipeline_l124_48) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_49) begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_50) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_51) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_52) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_53) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_55) begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if(when_Fetcher_l398) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_injectionPort_payload;
    end
    if(when_CsrPlugin_l1264) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1264_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1264_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1264_3) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1264_4) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1264_5) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1264_6) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1264_7) begin
      execute_CsrPlugin_csr_3008 <= (decode_INSTRUCTION[31 : 20] == 12'hbc0);
    end
    if(when_CsrPlugin_l1264_8) begin
      execute_CsrPlugin_csr_4032 <= (decode_INSTRUCTION[31 : 20] == 12'hfc0);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(iBus_cmd_ready) begin
      iBus_cmd_rData_pc <= iBus_cmd_payload_pc;
    end
    if(dBus_cmd_ready) begin
      dBus_cmd_rData_wr <= dBus_cmd_payload_wr;
      dBus_cmd_rData_address <= dBus_cmd_payload_address;
      dBus_cmd_rData_data <= dBus_cmd_payload_data;
      dBus_cmd_rData_size <= dBus_cmd_payload_size;
    end
  end

  always @(posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l244 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l295) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge clk) begin
    if(debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      if(when_DebugPlugin_l225) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l267)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l271) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l271_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l272) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l272_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l273) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l274) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l275) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l275_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l295) begin
        if(when_DebugPlugin_l298) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l311) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      debug_bus_cmd_fire_regNext <= debug_bus_cmd_fire;
    end
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               clk,
  input               debugReset
);

  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l346;
  wire                when_Fragment_l349;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l372;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l346 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l349 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l372 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge clk) begin
    if(debugReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l346) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l349) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l372) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l346) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridge (
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               clk,
  input               debugReset
);
  localparam JtagState_RESET = 4'd0;
  localparam JtagState_IDLE = 4'd1;
  localparam JtagState_IR_SELECT = 4'd2;
  localparam JtagState_IR_CAPTURE = 4'd3;
  localparam JtagState_IR_SHIFT = 4'd4;
  localparam JtagState_IR_EXIT1 = 4'd5;
  localparam JtagState_IR_PAUSE = 4'd6;
  localparam JtagState_IR_EXIT2 = 4'd7;
  localparam JtagState_IR_UPDATE = 4'd8;
  localparam JtagState_DR_SELECT = 4'd9;
  localparam JtagState_DR_CAPTURE = 4'd10;
  localparam JtagState_DR_SHIFT = 4'd11;
  localparam JtagState_DR_EXIT1 = 4'd12;
  localparam JtagState_DR_PAUSE = 4'd13;
  localparam JtagState_DR_EXIT2 = 4'd14;
  localparam JtagState_DR_UPDATE = 4'd15;

  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [3:0]    _zz_jtag_tap_isBypass;
  wire       [3:0]    _zz_jtag_tap_isBypass_1;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire       [3:0]    jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_fsm_state = JtagState_RESET;
  reg        [3:0]    _zz_jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  wire                jtag_tap_isBypass;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_ctrl_tdi;
  wire                jtag_idcodeArea_ctrl_enable;
  wire                jtag_idcodeArea_ctrl_capture;
  wire                jtag_idcodeArea_ctrl_shift;
  wire                jtag_idcodeArea_ctrl_update;
  wire                jtag_idcodeArea_ctrl_reset;
  wire                jtag_idcodeArea_ctrl_tdo;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                when_JtagTap_l120;
  wire                jtag_writeArea_ctrl_tdi;
  wire                jtag_writeArea_ctrl_enable;
  wire                jtag_writeArea_ctrl_capture;
  wire                jtag_writeArea_ctrl_shift;
  wire                jtag_writeArea_ctrl_update;
  wire                jtag_writeArea_ctrl_reset;
  wire                jtag_writeArea_ctrl_tdo;
  wire                jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  reg                 jtag_writeArea_valid;
  reg                 jtag_writeArea_data;
  wire                jtag_readArea_ctrl_tdi;
  wire                jtag_readArea_ctrl_enable;
  wire                jtag_readArea_ctrl_capture;
  wire                jtag_readArea_ctrl_shift;
  wire                jtag_readArea_ctrl_update;
  wire                jtag_readArea_ctrl_reset;
  wire                jtag_readArea_ctrl_tdo;
  reg        [33:0]   jtag_readArea_full_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  `endif


  assign _zz_jtag_tap_isBypass = jtag_tap_instruction;
  assign _zz_jtag_tap_isBypass_1 = 4'b1111;
  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (jtag_writeArea_source_valid                  ), //i
    .io_input_payload_last         (jtag_writeArea_source_payload_last           ), //i
    .io_input_payload_fragment     (jtag_writeArea_source_payload_fragment       ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                  ), //i
    .clk                           (clk                                          ), //i
    .debugReset                    (debugReset                                   )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      JtagState_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_RESET : jtag_tap_fsm_state_string = "RESET     ";
      JtagState_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      JtagState_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      JtagState_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      JtagState_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      JtagState_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      JtagState_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      JtagState_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      JtagState_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      JtagState_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      JtagState_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      JtagState_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      JtagState_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      JtagState_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      JtagState_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      JtagState_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      JtagState_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      JtagState_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      JtagState_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      JtagState_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  always @(*) begin
    case(jtag_tap_fsm_state)
      JtagState_IDLE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      JtagState_IR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IR_CAPTURE);
      end
      JtagState_IR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
      end
      JtagState_IR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT1 : JtagState_IR_SHIFT);
      end
      JtagState_IR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_PAUSE);
      end
      JtagState_IR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_EXIT2 : JtagState_IR_PAUSE);
      end
      JtagState_IR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_UPDATE : JtagState_IR_SHIFT);
      end
      JtagState_IR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      JtagState_DR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_IR_SELECT : JtagState_DR_CAPTURE);
      end
      JtagState_DR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
      end
      JtagState_DR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT1 : JtagState_DR_SHIFT);
      end
      JtagState_DR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_PAUSE);
      end
      JtagState_DR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_EXIT2 : JtagState_DR_PAUSE);
      end
      JtagState_DR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_UPDATE : JtagState_DR_SHIFT);
      end
      JtagState_DR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_DR_SELECT : JtagState_IDLE);
      end
      default : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? JtagState_RESET : JtagState_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      JtagState_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      JtagState_DR_SHIFT : begin
        if(jtag_tap_isBypass) begin
          jtag_tap_tdoUnbufferd = jtag_tap_bypass;
        end else begin
          jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(jtag_idcodeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_idcodeArea_ctrl_tdo;
    end
    if(jtag_writeArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_writeArea_ctrl_tdo;
    end
    if(jtag_readArea_ctrl_enable) begin
      jtag_tap_tdoDr = jtag_readArea_ctrl_tdo;
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign jtag_tap_isBypass = ($signed(_zz_jtag_tap_isBypass) == $signed(_zz_jtag_tap_isBypass_1));
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_ctrl_tdo = jtag_idcodeArea_shifter[0];
  assign jtag_idcodeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_idcodeArea_ctrl_enable = (jtag_tap_instruction == 4'b0001);
  assign jtag_idcodeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_idcodeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_idcodeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_idcodeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign when_JtagTap_l120 = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_writeArea_source_valid = jtag_writeArea_valid;
  assign jtag_writeArea_source_payload_last = (! (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift));
  assign jtag_writeArea_source_payload_fragment[0] = jtag_writeArea_data;
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign jtag_writeArea_ctrl_tdo = 1'b0;
  assign jtag_writeArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_writeArea_ctrl_enable = (jtag_tap_instruction == 4'b0010);
  assign jtag_writeArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_writeArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_writeArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_writeArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  assign jtag_readArea_ctrl_tdo = jtag_readArea_full_shifter[0];
  assign jtag_readArea_ctrl_tdi = io_jtag_tdi;
  assign jtag_readArea_ctrl_enable = (jtag_tap_instruction == 4'b0011);
  assign jtag_readArea_ctrl_capture = (jtag_tap_fsm_state == JtagState_DR_CAPTURE);
  assign jtag_readArea_ctrl_shift = (jtag_tap_fsm_state == JtagState_DR_SHIFT);
  assign jtag_readArea_ctrl_update = (jtag_tap_fsm_state == JtagState_DR_UPDATE);
  assign jtag_readArea_ctrl_reset = (jtag_tap_fsm_state == JtagState_RESET);
  always @(posedge clk) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      JtagState_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      JtagState_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      JtagState_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      JtagState_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_ctrl_enable) begin
      if(jtag_idcodeArea_ctrl_shift) begin
        jtag_idcodeArea_shifter <= ({jtag_idcodeArea_ctrl_tdi,jtag_idcodeArea_shifter} >>> 1);
      end
    end
    if(jtag_idcodeArea_ctrl_capture) begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
    end
    if(when_JtagTap_l120) begin
      jtag_tap_instruction <= 4'b0001;
    end
    jtag_writeArea_valid <= (jtag_writeArea_ctrl_enable && jtag_writeArea_ctrl_shift);
    jtag_writeArea_data <= jtag_writeArea_ctrl_tdi;
    if(jtag_readArea_ctrl_enable) begin
      if(jtag_readArea_ctrl_capture) begin
        jtag_readArea_full_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(jtag_readArea_ctrl_shift) begin
        jtag_readArea_full_shifter <= ({jtag_readArea_ctrl_tdi,jtag_readArea_full_shifter} >>> 1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);

  reg                 when_Phase_l623;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                readed_error;
  wire       [31:0]   readed_inst;
  wire       [32:0]   _zz_readed_error;
  wire                when_Stream_l1011;
  wire                when_Stream_l1024;
  wire       [32:0]   _zz_readed_error_1;
  reg        [32:0]   _zz_readed_error_2;

  always @(*) begin
    when_Phase_l623 = 1'b0;
    if(pushing) begin
      when_Phase_l623 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign _zz_readed_error = _zz_readed_error_1;
  assign readed_error = _zz_readed_error[0];
  assign readed_inst = _zz_readed_error[32 : 1];
  assign when_Stream_l1011 = (! empty);
  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_payload_error = readed_error;
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    if(when_Stream_l1011) begin
      io_pop_payload_inst = readed_inst;
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign when_Stream_l1024 = (pushing != popping);
  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_readed_error_1 = _zz_readed_error_2;
  always @(posedge clk) begin
    if(reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if(when_Stream_l1024) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(when_Phase_l623) begin
      _zz_readed_error_2 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               io_jtag_tck,
  input               clk,
  input               debugReset
);

  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_m2sPipe_valid;
  reg                 outputArea_flow_m2sPipe_payload_last;
  reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  BufferCC inputArea_target_buffercc (
    .io_dataIn     (inputArea_target                      ), //i
    .io_dataOut    (inputArea_target_buffercc_io_dataOut  ), //o
    .clk           (clk                                   ), //i
    .debugReset    (debugReset                            )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge clk) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge clk) begin
    if(debugReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               debugReset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
