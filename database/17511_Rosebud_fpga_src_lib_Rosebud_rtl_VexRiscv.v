// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : cd00ab368913c5c186dfe32fd326118c9fa38e66


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11


module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk,
  input               reset
);
  wire                _zz_121;
  wire                _zz_122;
  wire       [31:0]   _zz_123;
  wire       [31:0]   _zz_124;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  wire                _zz_131;
  wire       [1:0]    _zz_132;
  wire                _zz_133;
  wire                _zz_134;
  wire                _zz_135;
  wire                _zz_136;
  wire                _zz_137;
  wire                _zz_138;
  wire                _zz_139;
  wire                _zz_140;
  wire                _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire       [1:0]    _zz_145;
  wire                _zz_146;
  wire       [32:0]   _zz_147;
  wire       [31:0]   _zz_148;
  wire       [32:0]   _zz_149;
  wire       [0:0]    _zz_150;
  wire       [0:0]    _zz_151;
  wire       [0:0]    _zz_152;
  wire       [0:0]    _zz_153;
  wire       [0:0]    _zz_154;
  wire       [0:0]    _zz_155;
  wire       [0:0]    _zz_156;
  wire       [0:0]    _zz_157;
  wire       [0:0]    _zz_158;
  wire       [0:0]    _zz_159;
  wire       [0:0]    _zz_160;
  wire       [1:0]    _zz_161;
  wire       [1:0]    _zz_162;
  wire       [2:0]    _zz_163;
  wire       [31:0]   _zz_164;
  wire       [2:0]    _zz_165;
  wire       [0:0]    _zz_166;
  wire       [2:0]    _zz_167;
  wire       [0:0]    _zz_168;
  wire       [2:0]    _zz_169;
  wire       [0:0]    _zz_170;
  wire       [2:0]    _zz_171;
  wire       [0:0]    _zz_172;
  wire       [2:0]    _zz_173;
  wire       [2:0]    _zz_174;
  wire       [0:0]    _zz_175;
  wire       [2:0]    _zz_176;
  wire       [4:0]    _zz_177;
  wire       [11:0]   _zz_178;
  wire       [11:0]   _zz_179;
  wire       [31:0]   _zz_180;
  wire       [31:0]   _zz_181;
  wire       [31:0]   _zz_182;
  wire       [31:0]   _zz_183;
  wire       [31:0]   _zz_184;
  wire       [31:0]   _zz_185;
  wire       [31:0]   _zz_186;
  wire       [19:0]   _zz_187;
  wire       [11:0]   _zz_188;
  wire       [11:0]   _zz_189;
  wire       [0:0]    _zz_190;
  wire       [0:0]    _zz_191;
  wire       [0:0]    _zz_192;
  wire       [0:0]    _zz_193;
  wire       [0:0]    _zz_194;
  wire       [0:0]    _zz_195;
  wire       [31:0]   _zz_196;
  wire       [31:0]   _zz_197;
  wire       [31:0]   _zz_198;
  wire                _zz_199;
  wire       [0:0]    _zz_200;
  wire       [10:0]   _zz_201;
  wire       [31:0]   _zz_202;
  wire       [31:0]   _zz_203;
  wire       [31:0]   _zz_204;
  wire                _zz_205;
  wire       [0:0]    _zz_206;
  wire       [4:0]    _zz_207;
  wire       [31:0]   _zz_208;
  wire       [31:0]   _zz_209;
  wire       [31:0]   _zz_210;
  wire       [31:0]   _zz_211;
  wire       [31:0]   _zz_212;
  wire       [31:0]   _zz_213;
  wire       [31:0]   _zz_214;
  wire       [31:0]   _zz_215;
  wire       [31:0]   _zz_216;
  wire                _zz_217;
  wire       [1:0]    _zz_218;
  wire       [1:0]    _zz_219;
  wire                _zz_220;
  wire       [0:0]    _zz_221;
  wire       [18:0]   _zz_222;
  wire       [31:0]   _zz_223;
  wire       [31:0]   _zz_224;
  wire       [31:0]   _zz_225;
  wire       [31:0]   _zz_226;
  wire       [31:0]   _zz_227;
  wire       [31:0]   _zz_228;
  wire                _zz_229;
  wire       [0:0]    _zz_230;
  wire       [0:0]    _zz_231;
  wire                _zz_232;
  wire       [0:0]    _zz_233;
  wire       [15:0]   _zz_234;
  wire       [31:0]   _zz_235;
  wire       [31:0]   _zz_236;
  wire       [31:0]   _zz_237;
  wire       [31:0]   _zz_238;
  wire       [31:0]   _zz_239;
  wire       [31:0]   _zz_240;
  wire       [0:0]    _zz_241;
  wire       [0:0]    _zz_242;
  wire       [1:0]    _zz_243;
  wire       [1:0]    _zz_244;
  wire                _zz_245;
  wire       [0:0]    _zz_246;
  wire       [11:0]   _zz_247;
  wire       [31:0]   _zz_248;
  wire       [31:0]   _zz_249;
  wire       [31:0]   _zz_250;
  wire       [31:0]   _zz_251;
  wire       [31:0]   _zz_252;
  wire       [31:0]   _zz_253;
  wire                _zz_254;
  wire       [0:0]    _zz_255;
  wire       [0:0]    _zz_256;
  wire                _zz_257;
  wire       [0:0]    _zz_258;
  wire       [0:0]    _zz_259;
  wire                _zz_260;
  wire       [0:0]    _zz_261;
  wire       [8:0]    _zz_262;
  wire       [31:0]   _zz_263;
  wire       [31:0]   _zz_264;
  wire       [31:0]   _zz_265;
  wire       [0:0]    _zz_266;
  wire       [0:0]    _zz_267;
  wire       [0:0]    _zz_268;
  wire       [4:0]    _zz_269;
  wire       [1:0]    _zz_270;
  wire       [1:0]    _zz_271;
  wire                _zz_272;
  wire       [0:0]    _zz_273;
  wire       [5:0]    _zz_274;
  wire       [31:0]   _zz_275;
  wire       [31:0]   _zz_276;
  wire       [31:0]   _zz_277;
  wire       [31:0]   _zz_278;
  wire                _zz_279;
  wire       [0:0]    _zz_280;
  wire       [1:0]    _zz_281;
  wire       [31:0]   _zz_282;
  wire       [31:0]   _zz_283;
  wire                _zz_284;
  wire                _zz_285;
  wire       [0:0]    _zz_286;
  wire       [0:0]    _zz_287;
  wire                _zz_288;
  wire       [0:0]    _zz_289;
  wire       [2:0]    _zz_290;
  wire       [31:0]   _zz_291;
  wire       [31:0]   _zz_292;
  wire       [31:0]   _zz_293;
  wire                _zz_294;
  wire                _zz_295;
  wire       [31:0]   _zz_296;
  wire       [31:0]   _zz_297;
  wire       [31:0]   _zz_298;
  wire       [31:0]   _zz_299;
  wire       [0:0]    _zz_300;
  wire       [2:0]    _zz_301;
  wire       [0:0]    _zz_302;
  wire       [0:0]    _zz_303;
  wire                _zz_304;
  wire       [0:0]    _zz_305;
  wire       [0:0]    _zz_306;
  wire       [31:0]   _zz_307;
  wire       [31:0]   _zz_308;
  wire       [31:0]   _zz_309;
  wire                _zz_310;
  wire                _zz_311;
  wire       [31:0]   _zz_312;
  wire                _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [0:0]    _zz_316;
  wire       [0:0]    _zz_317;
  wire       [0:0]    _zz_318;
  wire       [0:0]    _zz_319;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_5;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_6;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_7;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_8;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_12;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_13;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_15;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_16;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_17;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_18;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_19;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_21;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire                decode_MEMORY_ENABLE;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_27;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_28;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_29;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_30;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_31;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_32;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_33;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_34;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_35;
  wire       [31:0]   _zz_36;
  wire       [31:0]   _zz_37;
  wire                _zz_38;
  reg                 _zz_39;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_40;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_41;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_42;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_43;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_44;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_45;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_46;
  reg        [31:0]   _zz_47;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_48;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_49;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_50;
  reg        [31:0]   _zz_51;
  wire       [31:0]   memory_INSTRUCTION;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
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
  reg        [31:0]   _zz_52;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
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
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_53;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
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
  wire                _zz_54;
  wire                _zz_55;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_56;
  wire                _zz_57;
  reg                 _zz_58;
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
  reg                 _zz_59;
  reg        [31:0]   _zz_60;
  reg                 _zz_61;
  reg        [31:0]   _zz_62;
  reg                 _zz_63;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_64;
  wire                _zz_65;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_66;
  reg        [3:0]    _zz_67;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   memory_DBusSimplePlugin_rspShifted;
  wire                _zz_68;
  reg        [31:0]   _zz_69;
  wire                _zz_70;
  reg        [31:0]   _zz_71;
  reg        [31:0]   memory_DBusSimplePlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
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
  wire                _zz_72;
  wire                _zz_73;
  wire                _zz_74;
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
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [24:0]   _zz_75;
  wire                _zz_76;
  wire                _zz_77;
  wire                _zz_78;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_79;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_80;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_81;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_82;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_83;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_84;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_85;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_86;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_87;
  reg        [31:0]   _zz_88;
  wire                _zz_89;
  reg        [19:0]   _zz_90;
  wire                _zz_91;
  reg        [19:0]   _zz_92;
  reg        [31:0]   _zz_93;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_94;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_95;
  reg                 _zz_96;
  reg                 _zz_97;
  reg                 _zz_98;
  reg        [4:0]    _zz_99;
  reg        [31:0]   _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire                _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire                _zz_106;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_107;
  reg                 _zz_108;
  reg                 _zz_109;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_110;
  reg        [10:0]   _zz_111;
  wire                _zz_112;
  reg        [19:0]   _zz_113;
  wire                _zz_114;
  reg        [18:0]   _zz_115;
  reg        [31:0]   _zz_116;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_834;
  reg        [31:0]   _zz_117;
  reg        [31:0]   _zz_118;
  reg        [31:0]   _zz_119;
  reg        [31:0]   _zz_120;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [31:0] _zz_3_string;
  reg [71:0] _zz_4_string;
  reg [71:0] _zz_5_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_6_string;
  reg [71:0] _zz_7_string;
  reg [71:0] _zz_8_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [39:0] _zz_11_string;
  reg [31:0] _zz_12_string;
  reg [31:0] _zz_13_string;
  reg [31:0] _zz_14_string;
  reg [31:0] _zz_15_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_16_string;
  reg [31:0] _zz_17_string;
  reg [31:0] _zz_18_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_19_string;
  reg [23:0] _zz_20_string;
  reg [23:0] _zz_21_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_22_string;
  reg [63:0] _zz_23_string;
  reg [63:0] _zz_24_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_25_string;
  reg [95:0] _zz_26_string;
  reg [95:0] _zz_27_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_28_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_29_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_30_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_32_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_33_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_34_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_35_string;
  reg [31:0] _zz_40_string;
  reg [71:0] _zz_41_string;
  reg [39:0] _zz_42_string;
  reg [31:0] _zz_43_string;
  reg [23:0] _zz_44_string;
  reg [63:0] _zz_45_string;
  reg [95:0] _zz_46_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_48_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_49_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_50_string;
  reg [95:0] _zz_79_string;
  reg [63:0] _zz_80_string;
  reg [23:0] _zz_81_string;
  reg [31:0] _zz_82_string;
  reg [39:0] _zz_83_string;
  reg [71:0] _zz_84_string;
  reg [31:0] _zz_85_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  (* ram_style = "distributed" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_125 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_126 = 1'b1;
  assign _zz_127 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_128 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_129 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_130 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_131 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_132 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_133 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign _zz_134 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_135 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_136 = (1'b0 || (! 1'b1));
  assign _zz_137 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_138 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_139 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_140 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_141 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_142 = ((_zz_72 && 1'b1) && (! 1'b0));
  assign _zz_143 = ((_zz_73 && 1'b1) && (! 1'b0));
  assign _zz_144 = ((_zz_74 && 1'b1) && (! 1'b0));
  assign _zz_145 = memory_INSTRUCTION[13 : 12];
  assign _zz_146 = execute_INSTRUCTION[13];
  assign _zz_147 = ($signed(_zz_149) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_148 = _zz_147[31 : 0];
  assign _zz_149 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_150 = _zz_75[17 : 17];
  assign _zz_151 = _zz_75[15 : 15];
  assign _zz_152 = _zz_75[12 : 12];
  assign _zz_153 = _zz_75[11 : 11];
  assign _zz_154 = _zz_75[10 : 10];
  assign _zz_155 = _zz_75[3 : 3];
  assign _zz_156 = _zz_75[14 : 14];
  assign _zz_157 = _zz_75[4 : 4];
  assign _zz_158 = _zz_75[2 : 2];
  assign _zz_159 = _zz_75[20 : 20];
  assign _zz_160 = _zz_75[9 : 9];
  assign _zz_161 = (_zz_53 & (~ _zz_162));
  assign _zz_162 = (_zz_53 - 2'b01);
  assign _zz_163 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_164 = {29'd0, _zz_163};
  assign _zz_165 = (IBusSimplePlugin_pending_value + _zz_167);
  assign _zz_166 = IBusSimplePlugin_pending_inc;
  assign _zz_167 = {2'd0, _zz_166};
  assign _zz_168 = IBusSimplePlugin_pending_dec;
  assign _zz_169 = {2'd0, _zz_168};
  assign _zz_170 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_171 = {2'd0, _zz_170};
  assign _zz_172 = IBusSimplePlugin_pending_dec;
  assign _zz_173 = {2'd0, _zz_172};
  assign _zz_174 = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz_175 = execute_SRC_LESS;
  assign _zz_176 = 3'b100;
  assign _zz_177 = execute_INSTRUCTION[19 : 15];
  assign _zz_178 = execute_INSTRUCTION[31 : 20];
  assign _zz_179 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_180 = ($signed(_zz_181) + $signed(_zz_184));
  assign _zz_181 = ($signed(_zz_182) + $signed(_zz_183));
  assign _zz_182 = execute_SRC1;
  assign _zz_183 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_184 = (execute_SRC_USE_SUB_LESS ? _zz_185 : _zz_186);
  assign _zz_185 = 32'h00000001;
  assign _zz_186 = 32'h0;
  assign _zz_187 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_188 = execute_INSTRUCTION[31 : 20];
  assign _zz_189 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_190 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_191 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_192 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_193 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_194 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_195 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_196 = 32'h0000107f;
  assign _zz_197 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_198 = 32'h00002073;
  assign _zz_199 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_200 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_201 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_202) == 32'h00000003),{(_zz_203 == _zz_204),{_zz_205,{_zz_206,_zz_207}}}}}};
  assign _zz_202 = 32'h0000505f;
  assign _zz_203 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_204 = 32'h00000063;
  assign _zz_205 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_206 = ((decode_INSTRUCTION & 32'hfe00007f) == 32'h00000033);
  assign _zz_207 = {((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & 32'hfc00307f) == 32'h00001013),{((decode_INSTRUCTION & _zz_208) == 32'h00005033),{(_zz_209 == _zz_210),(_zz_211 == _zz_212)}}}};
  assign _zz_208 = 32'hbe00707f;
  assign _zz_209 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_210 = 32'h00000033;
  assign _zz_211 = (decode_INSTRUCTION & 32'hdfffffff);
  assign _zz_212 = 32'h10200073;
  assign _zz_213 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_214 = 32'h00000004;
  assign _zz_215 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_216 = 32'h00000040;
  assign _zz_217 = ((decode_INSTRUCTION & 32'h00007054) == 32'h00005010);
  assign _zz_218 = {(_zz_223 == _zz_224),(_zz_225 == _zz_226)};
  assign _zz_219 = 2'b00;
  assign _zz_220 = ((_zz_227 == _zz_228) != 1'b0);
  assign _zz_221 = (_zz_229 != 1'b0);
  assign _zz_222 = {(_zz_230 != _zz_231),{_zz_232,{_zz_233,_zz_234}}};
  assign _zz_223 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_224 = 32'h40001010;
  assign _zz_225 = (decode_INSTRUCTION & 32'h00007054);
  assign _zz_226 = 32'h00001010;
  assign _zz_227 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_228 = 32'h00000024;
  assign _zz_229 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_230 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_231 = 1'b0;
  assign _zz_232 = ({(_zz_235 == _zz_236),(_zz_237 == _zz_238)} != 2'b00);
  assign _zz_233 = ((_zz_239 == _zz_240) != 1'b0);
  assign _zz_234 = {({_zz_241,_zz_242} != 2'b00),{(_zz_243 != _zz_244),{_zz_245,{_zz_246,_zz_247}}}};
  assign _zz_235 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_236 = 32'h00002000;
  assign _zz_237 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_238 = 32'h00001000;
  assign _zz_239 = (decode_INSTRUCTION & 32'h00003050);
  assign _zz_240 = 32'h00000050;
  assign _zz_241 = ((decode_INSTRUCTION & _zz_248) == 32'h00001050);
  assign _zz_242 = ((decode_INSTRUCTION & _zz_249) == 32'h00002050);
  assign _zz_243 = {(_zz_250 == _zz_251),(_zz_252 == _zz_253)};
  assign _zz_244 = 2'b00;
  assign _zz_245 = ({_zz_254,{_zz_255,_zz_256}} != 3'b000);
  assign _zz_246 = (_zz_257 != 1'b0);
  assign _zz_247 = {(_zz_258 != _zz_259),{_zz_260,{_zz_261,_zz_262}}};
  assign _zz_248 = 32'h00001050;
  assign _zz_249 = 32'h00002050;
  assign _zz_250 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_251 = 32'h00000020;
  assign _zz_252 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_253 = 32'h00000020;
  assign _zz_254 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_255 = ((decode_INSTRUCTION & _zz_263) == 32'h00000040);
  assign _zz_256 = ((decode_INSTRUCTION & _zz_264) == 32'h0);
  assign _zz_257 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_258 = ((decode_INSTRUCTION & _zz_265) == 32'h0);
  assign _zz_259 = 1'b0;
  assign _zz_260 = ({_zz_77,{_zz_266,_zz_267}} != 3'b000);
  assign _zz_261 = ({_zz_268,_zz_269} != 6'h0);
  assign _zz_262 = {(_zz_270 != _zz_271),{_zz_272,{_zz_273,_zz_274}}};
  assign _zz_263 = 32'h00003040;
  assign _zz_264 = 32'h00000038;
  assign _zz_265 = 32'h0;
  assign _zz_266 = ((decode_INSTRUCTION & _zz_275) == 32'h00002010);
  assign _zz_267 = ((decode_INSTRUCTION & _zz_276) == 32'h00000010);
  assign _zz_268 = _zz_78;
  assign _zz_269 = {(_zz_277 == _zz_278),{_zz_279,{_zz_280,_zz_281}}};
  assign _zz_270 = {_zz_77,(_zz_282 == _zz_283)};
  assign _zz_271 = 2'b00;
  assign _zz_272 = ({_zz_77,_zz_284} != 2'b00);
  assign _zz_273 = (_zz_285 != 1'b0);
  assign _zz_274 = {(_zz_286 != _zz_287),{_zz_288,{_zz_289,_zz_290}}};
  assign _zz_275 = 32'h00002050;
  assign _zz_276 = 32'h00001050;
  assign _zz_277 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_278 = 32'h00001010;
  assign _zz_279 = ((decode_INSTRUCTION & _zz_291) == 32'h00002010);
  assign _zz_280 = (_zz_292 == _zz_293);
  assign _zz_281 = {_zz_294,_zz_295};
  assign _zz_282 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_283 = 32'h00000020;
  assign _zz_284 = ((decode_INSTRUCTION & _zz_296) == 32'h0);
  assign _zz_285 = ((decode_INSTRUCTION & _zz_297) == 32'h00004010);
  assign _zz_286 = (_zz_298 == _zz_299);
  assign _zz_287 = 1'b0;
  assign _zz_288 = ({_zz_300,_zz_301} != 4'b0000);
  assign _zz_289 = (_zz_302 != _zz_303);
  assign _zz_290 = {_zz_304,{_zz_305,_zz_306}};
  assign _zz_291 = 32'h00002010;
  assign _zz_292 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_293 = 32'h00000010;
  assign _zz_294 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_295 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_296 = 32'h00000020;
  assign _zz_297 = 32'h00004014;
  assign _zz_298 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_299 = 32'h00002010;
  assign _zz_300 = ((decode_INSTRUCTION & _zz_307) == 32'h0);
  assign _zz_301 = {(_zz_308 == _zz_309),{_zz_310,_zz_311}};
  assign _zz_302 = ((decode_INSTRUCTION & _zz_312) == 32'h0);
  assign _zz_303 = 1'b0;
  assign _zz_304 = ({_zz_313,{_zz_314,_zz_315}} != 3'b000);
  assign _zz_305 = ({_zz_316,_zz_317} != 2'b00);
  assign _zz_306 = ({_zz_318,_zz_319} != 2'b00);
  assign _zz_307 = 32'h00000044;
  assign _zz_308 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_309 = 32'h0;
  assign _zz_310 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_311 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_312 = 32'h00000058;
  assign _zz_313 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_314 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_315 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz_316 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_317 = _zz_76;
  assign _zz_318 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_319 = _zz_76;
  assign _zz_123 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign _zz_124 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @ (posedge clk) begin
    if(_zz_39) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_121                                                         ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_122                                                         ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1_string = "JALR";
      default : _zz_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2_string = "JALR";
      default : _zz_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_3_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_3_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_3_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_3_string = "JALR";
      default : _zz_3_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4_string = "SRA_1    ";
      default : _zz_4_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5_string = "SRA_1    ";
      default : _zz_5_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_6_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_6_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_6_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_6_string = "SRA_1    ";
      default : _zz_6_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_7_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_7_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_7_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_7_string = "SRA_1    ";
      default : _zz_7_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_8_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_8_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_8_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_8_string = "SRA_1    ";
      default : _zz_8_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_9_string = "AND_1";
      default : _zz_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10_string = "AND_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11_string = "AND_1";
      default : _zz_11_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12_string = "XRET";
      default : _zz_12_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13_string = "XRET";
      default : _zz_13_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_14_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_14_string = "XRET";
      default : _zz_14_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15_string = "XRET";
      default : _zz_15_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16_string = "XRET";
      default : _zz_16_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17_string = "XRET";
      default : _zz_17_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18_string = "XRET";
      default : _zz_18_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_19_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_19_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_19_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_19_string = "PC ";
      default : _zz_19_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_20_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_20_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_20_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_20_string = "PC ";
      default : _zz_20_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_21_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_21_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_21_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_21_string = "PC ";
      default : _zz_21_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_22_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_22_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_22_string = "BITWISE ";
      default : _zz_22_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_23_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_23_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_23_string = "BITWISE ";
      default : _zz_23_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_24_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_24_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_24_string = "BITWISE ";
      default : _zz_24_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_25_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_25_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_25_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_25_string = "URS1        ";
      default : _zz_25_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_26_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_26_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_26_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_26_string = "URS1        ";
      default : _zz_26_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_27_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_27_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_27_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_27_string = "URS1        ";
      default : _zz_27_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_28_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_28_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_28_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_28_string = "JALR";
      default : _zz_28_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_29)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_29_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_29_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_29_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_29_string = "SRA_1    ";
      default : _zz_29_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_30)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_30_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_30_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_30_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_30_string = "SRA_1    ";
      default : _zz_30_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_32)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_32_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_32_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_32_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_32_string = "PC ";
      default : _zz_32_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_33_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_33_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_33_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_33_string = "URS1        ";
      default : _zz_33_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_34_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_34_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_34_string = "BITWISE ";
      default : _zz_34_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_35_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_35_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_35_string = "AND_1";
      default : _zz_35_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_40_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_40_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_40_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_40_string = "JALR";
      default : _zz_40_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_41_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_41_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_41_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_41_string = "SRA_1    ";
      default : _zz_41_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_42_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_42_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_42_string = "AND_1";
      default : _zz_42_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_43_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_43_string = "XRET";
      default : _zz_43_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_44_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_44_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_44_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_44_string = "PC ";
      default : _zz_44_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_45_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_45_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_45_string = "BITWISE ";
      default : _zz_45_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_46_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_46_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_46_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_46_string = "URS1        ";
      default : _zz_46_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_48_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_48_string = "XRET";
      default : _zz_48_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_49_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_49_string = "XRET";
      default : _zz_49_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_50_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_50_string = "XRET";
      default : _zz_50_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_79)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_79_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_79_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_79_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_79_string = "URS1        ";
      default : _zz_79_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_80)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_80_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_80_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_80_string = "BITWISE ";
      default : _zz_80_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_81)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_81_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_81_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_81_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_81_string = "PC ";
      default : _zz_81_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_82)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_82_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_82_string = "XRET";
      default : _zz_82_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_83)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_83_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_83_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_83_string = "AND_1";
      default : _zz_83_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_84)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_84_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_84_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_84_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_84_string = "SRA_1    ";
      default : _zz_84_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_85)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_85_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_85_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_85_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_85_string = "JALR";
      default : _zz_85_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign execute_SHIFT_RIGHT = _zz_148;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_87;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_BRANCH_CTRL = _zz_1;
  assign _zz_2 = _zz_3;
  assign _zz_4 = _zz_5;
  assign decode_SHIFT_CTRL = _zz_6;
  assign _zz_7 = _zz_8;
  assign decode_ALU_BITWISE_CTRL = _zz_9;
  assign _zz_10 = _zz_11;
  assign decode_SRC_LESS_UNSIGNED = _zz_150[0];
  assign _zz_12 = _zz_13;
  assign _zz_14 = _zz_15;
  assign decode_ENV_CTRL = _zz_16;
  assign _zz_17 = _zz_18;
  assign decode_IS_CSR = _zz_151[0];
  assign decode_MEMORY_STORE = _zz_152[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_153[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_154[0];
  assign decode_SRC2_CTRL = _zz_19;
  assign _zz_20 = _zz_21;
  assign decode_ALU_CTRL = _zz_22;
  assign _zz_23 = _zz_24;
  assign decode_MEMORY_ENABLE = _zz_155[0];
  assign decode_SRC1_CTRL = _zz_25;
  assign _zz_26 = _zz_27;
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_109;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_28;
  assign decode_RS2_USE = _zz_156[0];
  assign decode_RS1_USE = _zz_157[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_98)begin
      if((_zz_99 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_100;
      end
    end
    if(_zz_125)begin
      if(_zz_126)begin
        if(_zz_102)begin
          decode_RS2 = _zz_36;
        end
      end
    end
    if(_zz_127)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_104)begin
          decode_RS2 = _zz_51;
        end
      end
    end
    if(_zz_128)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_106)begin
          decode_RS2 = _zz_47;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_98)begin
      if((_zz_99 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_100;
      end
    end
    if(_zz_125)begin
      if(_zz_126)begin
        if(_zz_101)begin
          decode_RS1 = _zz_36;
        end
      end
    end
    if(_zz_127)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_103)begin
          decode_RS1 = _zz_51;
        end
      end
    end
    if(_zz_128)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_105)begin
          decode_RS1 = _zz_47;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  assign memory_SHIFT_CTRL = _zz_29;
  assign execute_SHIFT_CTRL = _zz_30;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_31 = execute_PC;
  assign execute_SRC2_CTRL = _zz_32;
  assign execute_SRC1_CTRL = _zz_33;
  assign decode_SRC_USE_SUB_LESS = _zz_158[0];
  assign decode_SRC_ADD_ZERO = _zz_159[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_34;
  assign execute_SRC2 = _zz_93;
  assign execute_ALU_BITWISE_CTRL = _zz_35;
  assign _zz_36 = writeBack_REGFILE_WRITE_DATA;
  assign _zz_37 = writeBack_INSTRUCTION;
  assign _zz_38 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_39 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_39 = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_160[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_196) == 32'h00001073),{(_zz_197 == _zz_198),{_zz_199,{_zz_200,_zz_201}}}}}}} != 18'h0);
  always @ (*) begin
    _zz_47 = execute_REGFILE_WRITE_DATA;
    if(_zz_129)begin
      _zz_47 = execute_CsrPlugin_readData;
    end
  end

  assign execute_SRC1 = _zz_88;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_48;
  assign execute_ENV_CTRL = _zz_49;
  assign writeBack_ENV_CTRL = _zz_50;
  always @ (*) begin
    _zz_51 = memory_REGFILE_WRITE_DATA;
    if((memory_arbitration_isValid && memory_MEMORY_ENABLE))begin
      _zz_51 = memory_DBusSimplePlugin_rspFormated;
    end
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_51 = _zz_95;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_51 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
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
  always @ (*) begin
    _zz_52 = execute_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_52 = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_96 || _zz_97)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_65)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_129)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_130)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_131)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_130)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_131)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_130)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_131)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_130)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_131)begin
      case(_zz_132)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != 2'b00);
  assign _zz_53 = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_161[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_164);
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_54 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_55 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_56;
  assign _zz_56 = ((1'b0 && (! _zz_57)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_57 = _zz_58;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_57;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_59;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_60;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_61;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_62;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_63;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_165 - _zz_169);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_121 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_121);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_64 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_64);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_64);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_65 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_65));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_66 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_66 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_66 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_66;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_67 = 4'b0001;
      end
      2'b01 : begin
        _zz_67 = 4'b0011;
      end
      default : begin
        _zz_67 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_67 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(_zz_133)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(_zz_133)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_174};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  always @ (*) begin
    memory_DBusSimplePlugin_rspShifted = memory_MEMORY_READ_DATA;
    case(memory_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        memory_DBusSimplePlugin_rspShifted[15 : 0] = memory_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_68 = (memory_DBusSimplePlugin_rspShifted[7] && (! memory_INSTRUCTION[14]));
  always @ (*) begin
    _zz_69[31] = _zz_68;
    _zz_69[30] = _zz_68;
    _zz_69[29] = _zz_68;
    _zz_69[28] = _zz_68;
    _zz_69[27] = _zz_68;
    _zz_69[26] = _zz_68;
    _zz_69[25] = _zz_68;
    _zz_69[24] = _zz_68;
    _zz_69[23] = _zz_68;
    _zz_69[22] = _zz_68;
    _zz_69[21] = _zz_68;
    _zz_69[20] = _zz_68;
    _zz_69[19] = _zz_68;
    _zz_69[18] = _zz_68;
    _zz_69[17] = _zz_68;
    _zz_69[16] = _zz_68;
    _zz_69[15] = _zz_68;
    _zz_69[14] = _zz_68;
    _zz_69[13] = _zz_68;
    _zz_69[12] = _zz_68;
    _zz_69[11] = _zz_68;
    _zz_69[10] = _zz_68;
    _zz_69[9] = _zz_68;
    _zz_69[8] = _zz_68;
    _zz_69[7 : 0] = memory_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_70 = (memory_DBusSimplePlugin_rspShifted[15] && (! memory_INSTRUCTION[14]));
  always @ (*) begin
    _zz_71[31] = _zz_70;
    _zz_71[30] = _zz_70;
    _zz_71[29] = _zz_70;
    _zz_71[28] = _zz_70;
    _zz_71[27] = _zz_70;
    _zz_71[26] = _zz_70;
    _zz_71[25] = _zz_70;
    _zz_71[24] = _zz_70;
    _zz_71[23] = _zz_70;
    _zz_71[22] = _zz_70;
    _zz_71[21] = _zz_70;
    _zz_71[20] = _zz_70;
    _zz_71[19] = _zz_70;
    _zz_71[18] = _zz_70;
    _zz_71[17] = _zz_70;
    _zz_71[16] = _zz_70;
    _zz_71[15 : 0] = memory_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_145)
      2'b00 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_69;
      end
      2'b01 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_71;
      end
      default : begin
        memory_DBusSimplePlugin_rspFormated = memory_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h00000001;
  assign _zz_72 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_73 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_74 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_134)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_134)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_134)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_146)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_76 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_77 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_78 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_75 = {({_zz_78,(_zz_213 == _zz_214)} != 2'b00),{((_zz_215 == _zz_216) != 1'b0),{(_zz_217 != 1'b0),{(_zz_218 != _zz_219),{_zz_220,{_zz_221,_zz_222}}}}}};
  assign _zz_79 = _zz_75[1 : 0];
  assign _zz_46 = _zz_79;
  assign _zz_80 = _zz_75[6 : 5];
  assign _zz_45 = _zz_80;
  assign _zz_81 = _zz_75[8 : 7];
  assign _zz_44 = _zz_81;
  assign _zz_82 = _zz_75[16 : 16];
  assign _zz_43 = _zz_82;
  assign _zz_83 = _zz_75[19 : 18];
  assign _zz_42 = _zz_83;
  assign _zz_84 = _zz_75[22 : 21];
  assign _zz_41 = _zz_84;
  assign _zz_85 = _zz_75[24 : 23];
  assign _zz_40 = _zz_85;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_123;
  assign decode_RegFilePlugin_rs2Data = _zz_124;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_38 && writeBack_arbitration_isFiring);
    if(_zz_86)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_37[11 : 7];
    if(_zz_86)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_36;
    if(_zz_86)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_87 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_87 = {31'd0, _zz_175};
      end
      default : begin
        _zz_87 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_88 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_88 = {29'd0, _zz_176};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_88 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_88 = {27'd0, _zz_177};
      end
    endcase
  end

  assign _zz_89 = _zz_178[11];
  always @ (*) begin
    _zz_90[19] = _zz_89;
    _zz_90[18] = _zz_89;
    _zz_90[17] = _zz_89;
    _zz_90[16] = _zz_89;
    _zz_90[15] = _zz_89;
    _zz_90[14] = _zz_89;
    _zz_90[13] = _zz_89;
    _zz_90[12] = _zz_89;
    _zz_90[11] = _zz_89;
    _zz_90[10] = _zz_89;
    _zz_90[9] = _zz_89;
    _zz_90[8] = _zz_89;
    _zz_90[7] = _zz_89;
    _zz_90[6] = _zz_89;
    _zz_90[5] = _zz_89;
    _zz_90[4] = _zz_89;
    _zz_90[3] = _zz_89;
    _zz_90[2] = _zz_89;
    _zz_90[1] = _zz_89;
    _zz_90[0] = _zz_89;
  end

  assign _zz_91 = _zz_179[11];
  always @ (*) begin
    _zz_92[19] = _zz_91;
    _zz_92[18] = _zz_91;
    _zz_92[17] = _zz_91;
    _zz_92[16] = _zz_91;
    _zz_92[15] = _zz_91;
    _zz_92[14] = _zz_91;
    _zz_92[13] = _zz_91;
    _zz_92[12] = _zz_91;
    _zz_92[11] = _zz_91;
    _zz_92[10] = _zz_91;
    _zz_92[9] = _zz_91;
    _zz_92[8] = _zz_91;
    _zz_92[7] = _zz_91;
    _zz_92[6] = _zz_91;
    _zz_92[5] = _zz_91;
    _zz_92[4] = _zz_91;
    _zz_92[3] = _zz_91;
    _zz_92[2] = _zz_91;
    _zz_92[1] = _zz_91;
    _zz_92[0] = _zz_91;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_93 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_93 = {_zz_90,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_93 = {_zz_92,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_93 = _zz_31;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_180;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_94[0] = execute_SRC1[31];
    _zz_94[1] = execute_SRC1[30];
    _zz_94[2] = execute_SRC1[29];
    _zz_94[3] = execute_SRC1[28];
    _zz_94[4] = execute_SRC1[27];
    _zz_94[5] = execute_SRC1[26];
    _zz_94[6] = execute_SRC1[25];
    _zz_94[7] = execute_SRC1[24];
    _zz_94[8] = execute_SRC1[23];
    _zz_94[9] = execute_SRC1[22];
    _zz_94[10] = execute_SRC1[21];
    _zz_94[11] = execute_SRC1[20];
    _zz_94[12] = execute_SRC1[19];
    _zz_94[13] = execute_SRC1[18];
    _zz_94[14] = execute_SRC1[17];
    _zz_94[15] = execute_SRC1[16];
    _zz_94[16] = execute_SRC1[15];
    _zz_94[17] = execute_SRC1[14];
    _zz_94[18] = execute_SRC1[13];
    _zz_94[19] = execute_SRC1[12];
    _zz_94[20] = execute_SRC1[11];
    _zz_94[21] = execute_SRC1[10];
    _zz_94[22] = execute_SRC1[9];
    _zz_94[23] = execute_SRC1[8];
    _zz_94[24] = execute_SRC1[7];
    _zz_94[25] = execute_SRC1[6];
    _zz_94[26] = execute_SRC1[5];
    _zz_94[27] = execute_SRC1[4];
    _zz_94[28] = execute_SRC1[3];
    _zz_94[29] = execute_SRC1[2];
    _zz_94[30] = execute_SRC1[1];
    _zz_94[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_94 : execute_SRC1);
  always @ (*) begin
    _zz_95[0] = memory_SHIFT_RIGHT[31];
    _zz_95[1] = memory_SHIFT_RIGHT[30];
    _zz_95[2] = memory_SHIFT_RIGHT[29];
    _zz_95[3] = memory_SHIFT_RIGHT[28];
    _zz_95[4] = memory_SHIFT_RIGHT[27];
    _zz_95[5] = memory_SHIFT_RIGHT[26];
    _zz_95[6] = memory_SHIFT_RIGHT[25];
    _zz_95[7] = memory_SHIFT_RIGHT[24];
    _zz_95[8] = memory_SHIFT_RIGHT[23];
    _zz_95[9] = memory_SHIFT_RIGHT[22];
    _zz_95[10] = memory_SHIFT_RIGHT[21];
    _zz_95[11] = memory_SHIFT_RIGHT[20];
    _zz_95[12] = memory_SHIFT_RIGHT[19];
    _zz_95[13] = memory_SHIFT_RIGHT[18];
    _zz_95[14] = memory_SHIFT_RIGHT[17];
    _zz_95[15] = memory_SHIFT_RIGHT[16];
    _zz_95[16] = memory_SHIFT_RIGHT[15];
    _zz_95[17] = memory_SHIFT_RIGHT[14];
    _zz_95[18] = memory_SHIFT_RIGHT[13];
    _zz_95[19] = memory_SHIFT_RIGHT[12];
    _zz_95[20] = memory_SHIFT_RIGHT[11];
    _zz_95[21] = memory_SHIFT_RIGHT[10];
    _zz_95[22] = memory_SHIFT_RIGHT[9];
    _zz_95[23] = memory_SHIFT_RIGHT[8];
    _zz_95[24] = memory_SHIFT_RIGHT[7];
    _zz_95[25] = memory_SHIFT_RIGHT[6];
    _zz_95[26] = memory_SHIFT_RIGHT[5];
    _zz_95[27] = memory_SHIFT_RIGHT[4];
    _zz_95[28] = memory_SHIFT_RIGHT[3];
    _zz_95[29] = memory_SHIFT_RIGHT[2];
    _zz_95[30] = memory_SHIFT_RIGHT[1];
    _zz_95[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_96 = 1'b0;
    if(_zz_135)begin
      if(_zz_136)begin
        if(_zz_101)begin
          _zz_96 = 1'b1;
        end
      end
    end
    if(_zz_137)begin
      if(_zz_138)begin
        if(_zz_103)begin
          _zz_96 = 1'b1;
        end
      end
    end
    if(_zz_139)begin
      if(_zz_140)begin
        if(_zz_105)begin
          _zz_96 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_96 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_97 = 1'b0;
    if(_zz_135)begin
      if(_zz_136)begin
        if(_zz_102)begin
          _zz_97 = 1'b1;
        end
      end
    end
    if(_zz_137)begin
      if(_zz_138)begin
        if(_zz_104)begin
          _zz_97 = 1'b1;
        end
      end
    end
    if(_zz_139)begin
      if(_zz_140)begin
        if(_zz_106)begin
          _zz_97 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_97 = 1'b0;
    end
  end

  assign _zz_101 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_102 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_103 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_104 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_105 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_106 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_107 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_107 == 3'b000)) begin
        _zz_108 = execute_BranchPlugin_eq;
    end else if((_zz_107 == 3'b001)) begin
        _zz_108 = (! execute_BranchPlugin_eq);
    end else if((((_zz_107 & 3'b101) == 3'b101))) begin
        _zz_108 = (! execute_SRC_LESS);
    end else begin
        _zz_108 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_109 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_109 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_109 = 1'b1;
      end
      default : begin
        _zz_109 = _zz_108;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_110 = _zz_187[19];
  always @ (*) begin
    _zz_111[10] = _zz_110;
    _zz_111[9] = _zz_110;
    _zz_111[8] = _zz_110;
    _zz_111[7] = _zz_110;
    _zz_111[6] = _zz_110;
    _zz_111[5] = _zz_110;
    _zz_111[4] = _zz_110;
    _zz_111[3] = _zz_110;
    _zz_111[2] = _zz_110;
    _zz_111[1] = _zz_110;
    _zz_111[0] = _zz_110;
  end

  assign _zz_112 = _zz_188[11];
  always @ (*) begin
    _zz_113[19] = _zz_112;
    _zz_113[18] = _zz_112;
    _zz_113[17] = _zz_112;
    _zz_113[16] = _zz_112;
    _zz_113[15] = _zz_112;
    _zz_113[14] = _zz_112;
    _zz_113[13] = _zz_112;
    _zz_113[12] = _zz_112;
    _zz_113[11] = _zz_112;
    _zz_113[10] = _zz_112;
    _zz_113[9] = _zz_112;
    _zz_113[8] = _zz_112;
    _zz_113[7] = _zz_112;
    _zz_113[6] = _zz_112;
    _zz_113[5] = _zz_112;
    _zz_113[4] = _zz_112;
    _zz_113[3] = _zz_112;
    _zz_113[2] = _zz_112;
    _zz_113[1] = _zz_112;
    _zz_113[0] = _zz_112;
  end

  assign _zz_114 = _zz_189[11];
  always @ (*) begin
    _zz_115[18] = _zz_114;
    _zz_115[17] = _zz_114;
    _zz_115[16] = _zz_114;
    _zz_115[15] = _zz_114;
    _zz_115[14] = _zz_114;
    _zz_115[13] = _zz_114;
    _zz_115[12] = _zz_114;
    _zz_115[11] = _zz_114;
    _zz_115[10] = _zz_114;
    _zz_115[9] = _zz_114;
    _zz_115[8] = _zz_114;
    _zz_115[7] = _zz_114;
    _zz_115[6] = _zz_114;
    _zz_115[5] = _zz_114;
    _zz_115[4] = _zz_114;
    _zz_115[3] = _zz_114;
    _zz_115[2] = _zz_114;
    _zz_115[1] = _zz_114;
    _zz_115[0] = _zz_114;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_116 = {{_zz_111,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_116 = {_zz_113,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_116 = {{_zz_115,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_116;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    BranchPlugin_branchExceptionPort_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
    if(1'b0)begin
      BranchPlugin_branchExceptionPort_valid = 1'b0;
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  assign _zz_27 = decode_SRC1_CTRL;
  assign _zz_25 = _zz_46;
  assign _zz_33 = decode_to_execute_SRC1_CTRL;
  assign _zz_24 = decode_ALU_CTRL;
  assign _zz_22 = _zz_45;
  assign _zz_34 = decode_to_execute_ALU_CTRL;
  assign _zz_21 = decode_SRC2_CTRL;
  assign _zz_19 = _zz_44;
  assign _zz_32 = decode_to_execute_SRC2_CTRL;
  assign _zz_18 = decode_ENV_CTRL;
  assign _zz_15 = execute_ENV_CTRL;
  assign _zz_13 = memory_ENV_CTRL;
  assign _zz_16 = _zz_43;
  assign _zz_49 = decode_to_execute_ENV_CTRL;
  assign _zz_48 = execute_to_memory_ENV_CTRL;
  assign _zz_50 = memory_to_writeBack_ENV_CTRL;
  assign _zz_11 = decode_ALU_BITWISE_CTRL;
  assign _zz_9 = _zz_42;
  assign _zz_35 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_8 = decode_SHIFT_CTRL;
  assign _zz_5 = execute_SHIFT_CTRL;
  assign _zz_6 = _zz_41;
  assign _zz_30 = decode_to_execute_SHIFT_CTRL;
  assign _zz_29 = execute_to_memory_SHIFT_CTRL;
  assign _zz_3 = decode_BRANCH_CTRL;
  assign _zz_1 = _zz_40;
  assign _zz_28 = decode_to_execute_BRANCH_CTRL;
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
  always @ (*) begin
    _zz_117 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_117[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_117[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_117[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_118 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_118[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_118[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_118[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_119 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_119[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_119[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_119[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_120 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_120[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_120[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  assign execute_CsrPlugin_readData = ((_zz_117 | _zz_118) | (_zz_119 | _zz_120));
  assign _zz_122 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h0;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_58 <= 1'b0;
      _zz_59 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
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
      _zz_86 <= 1'b1;
      _zz_98 <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_58 <= 1'b0;
      end
      if(_zz_56)begin
        _zz_58 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(decode_arbitration_removeIt)begin
        _zz_59 <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready)begin
        _zz_59 <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_171);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_173);
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
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_141)begin
        if(_zz_142)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_143)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_144)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_130)begin
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
      if(_zz_131)begin
        case(_zz_132)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_74,{_zz_73,_zz_72}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_86 <= 1'b0;
      _zz_98 <= (_zz_38 && writeBack_arbitration_isFiring);
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_190[0];
          CsrPlugin_mstatus_MIE <= _zz_191[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_193[0];
          CsrPlugin_mie_MTIE <= _zz_194[0];
          CsrPlugin_mie_MSIE <= _zz_195[0];
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_iBusRsp_output_ready)begin
      _zz_60 <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_61 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_62 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_63 <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusSimplePlugin_memoryExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
    end
    if(_zz_141)begin
      if(_zz_142)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_143)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_144)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_130)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    _zz_99 <= _zz_37[11 : 7];
    _zz_100 <= _zz_36;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_31;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_52;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_26;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_23;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_20;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_17;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_14;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_12;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_10;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_7;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_4;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_47;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_51;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_192[0];
      end
    end
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
  wire                _zz_4;
  wire       [0:0]    _zz_5;
  reg                 _zz_1;
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
  wire       [32:0]   _zz_2;
  reg        [32:0]   _zz_3;

  assign _zz_4 = (! empty);
  assign _zz_5 = _zz_2[0 : 0];
  always @ (*) begin
    _zz_1 = 1'b0;
    if(pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
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
  always @ (*) begin
    if(_zz_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2 = _zz_3;
  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_error = _zz_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_inst = _zz_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1)begin
      _zz_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule
