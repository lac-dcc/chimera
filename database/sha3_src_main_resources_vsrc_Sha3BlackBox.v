module CtrlModule(
  input         clock,
  input         reset,
  input         io_rocc_req_val,
  output        io_rocc_req_rdy,
  input  [1:0]  io_rocc_funct,
  input  [63:0] io_rocc_rs1,
  input  [63:0] io_rocc_rs2,
  output        io_busy,
  output        io_dmem_req_val,
  input         io_dmem_req_rdy,
  output [5:0]  io_dmem_req_tag,
  output [39:0] io_dmem_req_addr,
  output [4:0]  io_dmem_req_cmd,
  input         io_dmem_resp_val,
  input  [6:0]  io_dmem_resp_tag,
  input  [63:0] io_dmem_resp_data,
  output [4:0]  io_round,
  output        io_absorb,
  output [4:0]  io_aindex,
  output        io_init,
  output        io_write,
  output [2:0]  io_windex,
  output [63:0] io_buffer_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] msg_addr; // @[ctrl.scala 64:21]
  reg [63:0] hash_addr; // @[ctrl.scala 65:21]
  reg [63:0] msg_len; // @[ctrl.scala 66:21]
  reg  busy; // @[ctrl.scala 68:17]
  reg  dmem_resp_val_reg; // @[ctrl.scala 79:30]
  reg [6:0] dmem_resp_tag_reg; // @[ctrl.scala 80:30]
  reg [2:0] mem_s; // @[ctrl.scala 84:18]
  reg [63:0] buffer_0; // @[ctrl.scala 90:19]
  reg [63:0] buffer_1; // @[ctrl.scala 90:19]
  reg [63:0] buffer_2; // @[ctrl.scala 90:19]
  reg [63:0] buffer_3; // @[ctrl.scala 90:19]
  reg [63:0] buffer_4; // @[ctrl.scala 90:19]
  reg [63:0] buffer_5; // @[ctrl.scala 90:19]
  reg [63:0] buffer_6; // @[ctrl.scala 90:19]
  reg [63:0] buffer_7; // @[ctrl.scala 90:19]
  reg [63:0] buffer_8; // @[ctrl.scala 90:19]
  reg [63:0] buffer_9; // @[ctrl.scala 90:19]
  reg [63:0] buffer_10; // @[ctrl.scala 90:19]
  reg [63:0] buffer_11; // @[ctrl.scala 90:19]
  reg [63:0] buffer_12; // @[ctrl.scala 90:19]
  reg [63:0] buffer_13; // @[ctrl.scala 90:19]
  reg [63:0] buffer_14; // @[ctrl.scala 90:19]
  reg [63:0] buffer_15; // @[ctrl.scala 90:19]
  reg [63:0] buffer_16; // @[ctrl.scala 90:19]
  reg  buffer_valid; // @[ctrl.scala 107:25]
  reg [4:0] buffer_count; // @[ctrl.scala 108:25]
  reg [31:0] read; // @[ctrl.scala 109:20]
  reg [31:0] hashed; // @[ctrl.scala 110:20]
  reg  areg; // @[ctrl.scala 111:20]
  reg [4:0] mindex; // @[ctrl.scala 112:20]
  reg [2:0] windex; // @[ctrl.scala 113:20]
  reg [4:0] aindex; // @[ctrl.scala 114:20]
  reg [4:0] pindex; // @[ctrl.scala 115:20]
  reg  writes_done_0; // @[ctrl.scala 116:25]
  reg  writes_done_1; // @[ctrl.scala 116:25]
  reg  writes_done_2; // @[ctrl.scala 116:25]
  reg  writes_done_3; // @[ctrl.scala 116:25]
  reg  next_buff_val; // @[ctrl.scala 117:26]
  wire  _next_buff_val_T = buffer_count >= mindex; // @[ctrl.scala 119:36]
  wire  _next_buff_val_T_1 = pindex >= 5'h10; // @[ctrl.scala 120:30]
  reg [4:0] io_aindex_REG; // @[ctrl.scala 128:23]
  wire [63:0] _GEN_1 = 5'h1 == io_aindex ? buffer_1 : buffer_0; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_2 = 5'h2 == io_aindex ? buffer_2 : _GEN_1; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_3 = 5'h3 == io_aindex ? buffer_3 : _GEN_2; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_4 = 5'h4 == io_aindex ? buffer_4 : _GEN_3; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_5 = 5'h5 == io_aindex ? buffer_5 : _GEN_4; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_6 = 5'h6 == io_aindex ? buffer_6 : _GEN_5; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_7 = 5'h7 == io_aindex ? buffer_7 : _GEN_6; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_8 = 5'h8 == io_aindex ? buffer_8 : _GEN_7; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_9 = 5'h9 == io_aindex ? buffer_9 : _GEN_8; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_10 = 5'ha == io_aindex ? buffer_10 : _GEN_9; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_11 = 5'hb == io_aindex ? buffer_11 : _GEN_10; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_12 = 5'hc == io_aindex ? buffer_12 : _GEN_11; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_13 = 5'hd == io_aindex ? buffer_13 : _GEN_12; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_14 = 5'he == io_aindex ? buffer_14 : _GEN_13; // @[ctrl.scala 142:{19,19}]
  wire [63:0] _GEN_15 = 5'hf == io_aindex ? buffer_15 : _GEN_14; // @[ctrl.scala 142:{19,19}]
  wire [4:0] _words_filled_T_2 = mindex - 5'h1; // @[ctrl.scala 152:34]
  wire [4:0] words_filled = mindex > 5'h0 ? _words_filled_T_2 : mindex; // @[ctrl.scala 152:8]
  wire [63:0] _GEN_0 = msg_len % 64'h8; // @[ctrl.scala 158:30]
  wire [3:0] byte_offset = _GEN_0[3:0]; // @[ctrl.scala 158:30]
  reg [2:0] state; // @[ctrl.scala 163:18]
  reg [4:0] rindex; // @[ctrl.scala 166:19]
  reg [4:0] rindex_reg; // @[ctrl.scala 183:23]
  wire  _io_rocc_req_rdy_T = ~busy; // @[ctrl.scala 188:24]
  wire  _GEN_17 = io_rocc_funct == 2'h1 | busy; // @[ctrl.scala 196:45 197:14 68:17]
  wire  _GEN_18 = io_rocc_funct == 2'h1 | ~busy; // @[ctrl.scala 188:21 196:45 198:25]
  wire [63:0] _GEN_19 = io_rocc_funct == 2'h1 ? io_rocc_rs1 : msg_len; // @[ctrl.scala 196:45 200:17 66:21]
  wire  _GEN_20 = io_rocc_funct == 2'h0 | _GEN_18; // @[ctrl.scala 190:38 191:25]
  wire [63:0] _GEN_21 = io_rocc_funct == 2'h0 ? io_rocc_rs1 : msg_addr; // @[ctrl.scala 190:38 192:19 64:21]
  wire [63:0] _GEN_22 = io_rocc_funct == 2'h0 ? io_rocc_rs2 : hash_addr; // @[ctrl.scala 190:38 193:19 65:21]
  wire  _GEN_23 = io_rocc_funct == 2'h0 | _GEN_17; // @[ctrl.scala 190:38 195:17]
  wire  _GEN_24 = io_rocc_funct == 2'h0 ? busy : _GEN_17; // @[ctrl.scala 190:38 68:17]
  wire [63:0] _GEN_25 = io_rocc_funct == 2'h0 ? msg_len : _GEN_19; // @[ctrl.scala 190:38 66:21]
  wire [63:0] _GEN_27 = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_21 : msg_addr; // @[ctrl.scala 189:35 64:21]
  wire [63:0] _GEN_28 = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_22 : hash_addr; // @[ctrl.scala 189:35 65:21]
  wire  _GEN_30 = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_24 : busy; // @[ctrl.scala 189:35 68:17]
  wire [63:0] _GEN_31 = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_25 : msg_len; // @[ctrl.scala 189:35 66:21]
  wire [63:0] _GEN_1008 = {{32'd0}, read}; // @[ctrl.scala 222:35]
  wire  _canRead_T = _GEN_1008 < msg_len; // @[ctrl.scala 222:35]
  wire  _canRead_T_2 = msg_len == 64'h0; // @[ctrl.scala 222:77]
  wire  _canRead_T_7 = ~buffer_valid & buffer_count == 5'h0; // @[ctrl.scala 223:34]
  wire  canRead = busy & ((_GEN_1008 < msg_len | _GEN_1008 == msg_len & msg_len == 64'h0) & _canRead_T_7); // @[ctrl.scala 222:24]
  wire [4:0] _GEN_38 = canRead ? 5'h0 : buffer_count; // @[ctrl.scala 224:18 226:20 108:25]
  wire  _io_dmem_req_val_T_1 = mindex < 5'h11; // @[ctrl.scala 237:51]
  wire  _T_8 = io_dmem_req_rdy & io_dmem_req_val; // @[ctrl.scala 243:28]
  wire [4:0] _mindex_T_1 = mindex + 5'h1; // @[ctrl.scala 244:26]
  wire [63:0] _msg_addr_T_1 = msg_addr + 64'h8; // @[ctrl.scala 245:30]
  wire [31:0] _read_T_1 = read + 32'h8; // @[ctrl.scala 246:22]
  wire [4:0] _GEN_41 = io_dmem_req_rdy & io_dmem_req_val ? _mindex_T_1 : mindex; // @[ctrl.scala 243:47 244:16 112:20]
  wire [63:0] _GEN_42 = io_dmem_req_rdy & io_dmem_req_val ? _msg_addr_T_1 : _GEN_27; // @[ctrl.scala 243:47 245:18]
  wire [31:0] _GEN_43 = io_dmem_req_rdy & io_dmem_req_val ? _read_T_1 : read; // @[ctrl.scala 243:47 246:14 109:20]
  wire [31:0] _GEN_44 = _canRead_T_2 ? 32'h1 : _GEN_43; // @[ctrl.scala 256:32 257:14]
  wire  _GEN_45 = state != 3'h4 & (_canRead_T & mindex < 5'h11); // @[ctrl.scala 176:18 236:28 237:23]
  wire [63:0] _GEN_46 = state != 3'h4 ? msg_addr : 64'h0; // @[ctrl.scala 178:19 236:28 238:24]
  wire [4:0] _GEN_47 = state != 3'h4 ? mindex : rindex; // @[ctrl.scala 177:18 236:28 239:23]
  wire [4:0] _GEN_50 = state != 3'h4 ? _GEN_41 : mindex; // @[ctrl.scala 112:20 236:28]
  wire [63:0] _GEN_51 = state != 3'h4 ? _GEN_42 : _GEN_27; // @[ctrl.scala 236:28]
  wire [31:0] _GEN_52 = state != 3'h4 ? _GEN_44 : read; // @[ctrl.scala 109:20 236:28]
  wire  _T_10 = mindex < 5'h10; // @[ctrl.scala 266:19]
  wire [63:0] _T_13 = msg_len + 64'h8; // @[ctrl.scala 271:24]
  wire  _GEN_53 = _T_13 < _GEN_1008 ? 1'h0 : buffer_valid; // @[ctrl.scala 107:25 271:41 272:26]
  wire [4:0] _GEN_55 = _T_13 < _GEN_1008 ? words_filled : pindex; // @[ctrl.scala 115:20 271:41 274:20]
  wire  _GEN_56 = msg_len > _GEN_1008 & _GEN_53; // @[ctrl.scala 268:29 279:24]
  wire [2:0] _GEN_57 = msg_len > _GEN_1008 ? 3'h1 : 3'h3; // @[ctrl.scala 268:29 276:17 280:17]
  wire [4:0] _GEN_58 = msg_len > _GEN_1008 ? _GEN_55 : words_filled; // @[ctrl.scala 268:29 281:20]
  wire  _T_17 = ~_T_8; // @[ctrl.scala 285:14]
  wire  _T_18 = _io_dmem_req_val_T_1 & _T_17; // @[ctrl.scala 284:46]
  wire [63:0] _GEN_1013 = {{32'd0}, _read_T_1}; // @[ctrl.scala 294:25]
  wire  _T_21 = msg_len < _GEN_1013; // @[ctrl.scala 294:25]
  wire  _GEN_59 = msg_len < _GEN_1013 ? 1'h0 : buffer_valid; // @[ctrl.scala 107:25 294:44 296:26]
  wire [2:0] _GEN_60 = msg_len < _GEN_1013 ? 3'h3 : 3'h0; // @[ctrl.scala 294:44 297:19 301:19]
  wire [4:0] _GEN_61 = msg_len < _GEN_1013 ? words_filled : pindex; // @[ctrl.scala 115:20 294:44 298:20]
  wire [2:0] _GEN_62 = _T_18 ? 3'h1 : _GEN_60; // @[ctrl.scala 285:52 287:17]
  wire [4:0] _GEN_63 = _T_18 ? _GEN_50 : _mindex_T_1; // @[ctrl.scala 285:52 290:18]
  wire [63:0] _GEN_64 = _T_18 ? _GEN_51 : _msg_addr_T_1; // @[ctrl.scala 285:52 291:20]
  wire [31:0] _GEN_65 = _T_18 ? _GEN_52 : _read_T_1; // @[ctrl.scala 285:52 292:16]
  wire  _GEN_66 = _T_18 ? buffer_valid : _GEN_59; // @[ctrl.scala 107:25 285:52]
  wire [4:0] _GEN_67 = _T_18 ? pindex : _GEN_61; // @[ctrl.scala 115:20 285:52]
  wire  _GEN_68 = mindex < 5'h10 ? _GEN_56 : _GEN_66; // @[ctrl.scala 266:48]
  wire [2:0] _GEN_69 = mindex < 5'h10 ? _GEN_57 : _GEN_62; // @[ctrl.scala 266:48]
  wire [4:0] _GEN_70 = mindex < 5'h10 ? _GEN_58 : _GEN_67; // @[ctrl.scala 266:48]
  wire [63:0] _GEN_72 = mindex < 5'h10 ? _GEN_51 : _GEN_64; // @[ctrl.scala 266:48]
  wire [31:0] _GEN_73 = mindex < 5'h10 ? _GEN_52 : _GEN_65; // @[ctrl.scala 266:48]
  wire [63:0] _GEN_74 = 5'h0 == _words_filled_T_2 ? io_dmem_resp_data : buffer_0; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_75 = 5'h1 == _words_filled_T_2 ? io_dmem_resp_data : buffer_1; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_76 = 5'h2 == _words_filled_T_2 ? io_dmem_resp_data : buffer_2; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_77 = 5'h3 == _words_filled_T_2 ? io_dmem_resp_data : buffer_3; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_78 = 5'h4 == _words_filled_T_2 ? io_dmem_resp_data : buffer_4; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_79 = 5'h5 == _words_filled_T_2 ? io_dmem_resp_data : buffer_5; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_80 = 5'h6 == _words_filled_T_2 ? io_dmem_resp_data : buffer_6; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_81 = 5'h7 == _words_filled_T_2 ? io_dmem_resp_data : buffer_7; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_82 = 5'h8 == _words_filled_T_2 ? io_dmem_resp_data : buffer_8; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_83 = 5'h9 == _words_filled_T_2 ? io_dmem_resp_data : buffer_9; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_84 = 5'ha == _words_filled_T_2 ? io_dmem_resp_data : buffer_10; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_85 = 5'hb == _words_filled_T_2 ? io_dmem_resp_data : buffer_11; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_86 = 5'hc == _words_filled_T_2 ? io_dmem_resp_data : buffer_12; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_87 = 5'hd == _words_filled_T_2 ? io_dmem_resp_data : buffer_13; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_88 = 5'he == _words_filled_T_2 ? io_dmem_resp_data : buffer_14; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_89 = 5'hf == _words_filled_T_2 ? io_dmem_resp_data : buffer_15; // @[ctrl.scala 316:{32,32} 90:19]
  wire [63:0] _GEN_90 = 5'h10 == _words_filled_T_2 ? io_dmem_resp_data : buffer_16; // @[ctrl.scala 316:{32,32} 90:19]
  wire [4:0] _buffer_count_T_1 = buffer_count + 5'h1; // @[ctrl.scala 318:36]
  wire [63:0] _msg_addr_T_5 = msg_addr + 64'h88; // @[ctrl.scala 348:32]
  wire  _GEN_97 = _T_21 ? 1'h0 : 1'h1; // @[ctrl.scala 349:44 351:26 356:26]
  wire [63:0] _GEN_101 = _T_18 ? _GEN_27 : _msg_addr_T_5; // @[ctrl.scala 340:52 348:20]
  wire  _GEN_102 = _T_18 ? buffer_valid : _GEN_97; // @[ctrl.scala 107:25 340:52]
  wire  _GEN_104 = _T_10 ? _GEN_56 : _GEN_102; // @[ctrl.scala 321:47]
  wire [63:0] _GEN_107 = _T_10 ? _GEN_27 : _GEN_101; // @[ctrl.scala 321:47]
  wire [63:0] _GEN_108 = io_dmem_resp_val ? _GEN_74 : buffer_0; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_109 = io_dmem_resp_val ? _GEN_75 : buffer_1; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_110 = io_dmem_resp_val ? _GEN_76 : buffer_2; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_111 = io_dmem_resp_val ? _GEN_77 : buffer_3; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_112 = io_dmem_resp_val ? _GEN_78 : buffer_4; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_113 = io_dmem_resp_val ? _GEN_79 : buffer_5; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_114 = io_dmem_resp_val ? _GEN_80 : buffer_6; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_115 = io_dmem_resp_val ? _GEN_81 : buffer_7; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_116 = io_dmem_resp_val ? _GEN_82 : buffer_8; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_117 = io_dmem_resp_val ? _GEN_83 : buffer_9; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_118 = io_dmem_resp_val ? _GEN_84 : buffer_10; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_119 = io_dmem_resp_val ? _GEN_85 : buffer_11; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_120 = io_dmem_resp_val ? _GEN_86 : buffer_12; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_121 = io_dmem_resp_val ? _GEN_87 : buffer_13; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_122 = io_dmem_resp_val ? _GEN_88 : buffer_14; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_123 = io_dmem_resp_val ? _GEN_89 : buffer_15; // @[ctrl.scala 309:28 90:19]
  wire [63:0] _GEN_124 = io_dmem_resp_val ? _GEN_90 : buffer_16; // @[ctrl.scala 309:28 90:19]
  wire [4:0] _GEN_125 = io_dmem_resp_val ? _buffer_count_T_1 : buffer_count; // @[ctrl.scala 309:28 318:20 108:25]
  wire  _GEN_126 = io_dmem_resp_val ? _GEN_104 : buffer_valid; // @[ctrl.scala 107:25 309:28]
  wire [2:0] _GEN_127 = io_dmem_resp_val ? _GEN_69 : mem_s; // @[ctrl.scala 309:28 84:18]
  wire [4:0] _GEN_128 = io_dmem_resp_val ? _GEN_70 : pindex; // @[ctrl.scala 115:20 309:28]
  wire [63:0] _GEN_129 = io_dmem_resp_val ? _GEN_107 : _GEN_27; // @[ctrl.scala 309:28]
  wire  _T_40 = buffer_count < mindex & pindex >= buffer_count; // @[ctrl.scala 370:35]
  wire  _T_45 = byte_offset == 4'h0; // @[ctrl.scala 375:26]
  wire [4:0] _T_47 = words_filled + 5'h1; // @[ctrl.scala 375:65]
  wire  _T_49 = byte_offset == 4'h0 & pindex == _T_47; // @[ctrl.scala 375:38]
  wire [63:0] _GEN_130 = 5'h0 == pindex ? 64'h6 : buffer_0; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_131 = 5'h1 == pindex ? 64'h6 : buffer_1; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_132 = 5'h2 == pindex ? 64'h6 : buffer_2; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_133 = 5'h3 == pindex ? 64'h6 : buffer_3; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_134 = 5'h4 == pindex ? 64'h6 : buffer_4; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_135 = 5'h5 == pindex ? 64'h6 : buffer_5; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_136 = 5'h6 == pindex ? 64'h6 : buffer_6; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_137 = 5'h7 == pindex ? 64'h6 : buffer_7; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_138 = 5'h8 == pindex ? 64'h6 : buffer_8; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_139 = 5'h9 == pindex ? 64'h6 : buffer_9; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_140 = 5'ha == pindex ? 64'h6 : buffer_10; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_141 = 5'hb == pindex ? 64'h6 : buffer_11; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_142 = 5'hc == pindex ? 64'h6 : buffer_12; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_143 = 5'hd == pindex ? 64'h6 : buffer_13; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_144 = 5'he == pindex ? 64'h6 : buffer_14; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_145 = 5'hf == pindex ? 64'h6 : buffer_15; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_146 = 5'h10 == pindex ? 64'h6 : buffer_16; // @[ctrl.scala 382:{28,28} 90:19]
  wire [63:0] _GEN_147 = 5'h0 == pindex ? 64'h0 : buffer_0; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_148 = 5'h1 == pindex ? 64'h0 : buffer_1; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_149 = 5'h2 == pindex ? 64'h0 : buffer_2; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_150 = 5'h3 == pindex ? 64'h0 : buffer_3; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_151 = 5'h4 == pindex ? 64'h0 : buffer_4; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_152 = 5'h5 == pindex ? 64'h0 : buffer_5; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_153 = 5'h6 == pindex ? 64'h0 : buffer_6; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_154 = 5'h7 == pindex ? 64'h0 : buffer_7; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_155 = 5'h8 == pindex ? 64'h0 : buffer_8; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_156 = 5'h9 == pindex ? 64'h0 : buffer_9; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_157 = 5'ha == pindex ? 64'h0 : buffer_10; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_158 = 5'hb == pindex ? 64'h0 : buffer_11; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_159 = 5'hc == pindex ? 64'h0 : buffer_12; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_160 = 5'hd == pindex ? 64'h0 : buffer_13; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_161 = 5'he == pindex ? 64'h0 : buffer_14; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_162 = 5'hf == pindex ? 64'h0 : buffer_15; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_163 = 5'h10 == pindex ? 64'h0 : buffer_16; // @[ctrl.scala 390:{28,28} 90:19]
  wire [63:0] _GEN_164 = _T_49 & mindex != 5'h0 ? _GEN_130 : _GEN_147; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_165 = _T_49 & mindex != 5'h0 ? _GEN_131 : _GEN_148; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_166 = _T_49 & mindex != 5'h0 ? _GEN_132 : _GEN_149; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_167 = _T_49 & mindex != 5'h0 ? _GEN_133 : _GEN_150; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_168 = _T_49 & mindex != 5'h0 ? _GEN_134 : _GEN_151; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_169 = _T_49 & mindex != 5'h0 ? _GEN_135 : _GEN_152; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_170 = _T_49 & mindex != 5'h0 ? _GEN_136 : _GEN_153; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_171 = _T_49 & mindex != 5'h0 ? _GEN_137 : _GEN_154; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_172 = _T_49 & mindex != 5'h0 ? _GEN_138 : _GEN_155; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_173 = _T_49 & mindex != 5'h0 ? _GEN_139 : _GEN_156; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_174 = _T_49 & mindex != 5'h0 ? _GEN_140 : _GEN_157; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_175 = _T_49 & mindex != 5'h0 ? _GEN_141 : _GEN_158; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_176 = _T_49 & mindex != 5'h0 ? _GEN_142 : _GEN_159; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_177 = _T_49 & mindex != 5'h0 ? _GEN_143 : _GEN_160; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_178 = _T_49 & mindex != 5'h0 ? _GEN_144 : _GEN_161; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_179 = _T_49 & mindex != 5'h0 ? _GEN_145 : _GEN_162; // @[ctrl.scala 376:36]
  wire [63:0] _GEN_180 = _T_49 & mindex != 5'h0 ? _GEN_146 : _GEN_163; // @[ctrl.scala 376:36]
  wire  _T_54 = byte_offset == 4'h7; // @[ctrl.scala 398:28]
  wire [63:0] _GEN_182 = 5'h1 == pindex ? buffer_1 : buffer_0; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_183 = 5'h2 == pindex ? buffer_2 : _GEN_182; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_184 = 5'h3 == pindex ? buffer_3 : _GEN_183; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_185 = 5'h4 == pindex ? buffer_4 : _GEN_184; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_186 = 5'h5 == pindex ? buffer_5 : _GEN_185; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_187 = 5'h6 == pindex ? buffer_6 : _GEN_186; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_188 = 5'h7 == pindex ? buffer_7 : _GEN_187; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_189 = 5'h8 == pindex ? buffer_8 : _GEN_188; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_190 = 5'h9 == pindex ? buffer_9 : _GEN_189; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_191 = 5'ha == pindex ? buffer_10 : _GEN_190; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_192 = 5'hb == pindex ? buffer_11 : _GEN_191; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_193 = 5'hc == pindex ? buffer_12 : _GEN_192; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_194 = 5'hd == pindex ? buffer_13 : _GEN_193; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_195 = 5'he == pindex ? buffer_14 : _GEN_194; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_196 = 5'hf == pindex ? buffer_15 : _GEN_195; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _GEN_197 = 5'h10 == pindex ? buffer_16 : _GEN_196; // @[ctrl.scala 407:{61,61}]
  wire [63:0] _buffer_T_2 = {8'h86,_GEN_197[55:0]}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_198 = 5'h0 == pindex ? _buffer_T_2 : buffer_0; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_199 = 5'h1 == pindex ? _buffer_T_2 : buffer_1; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_200 = 5'h2 == pindex ? _buffer_T_2 : buffer_2; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_201 = 5'h3 == pindex ? _buffer_T_2 : buffer_3; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_202 = 5'h4 == pindex ? _buffer_T_2 : buffer_4; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_203 = 5'h5 == pindex ? _buffer_T_2 : buffer_5; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_204 = 5'h6 == pindex ? _buffer_T_2 : buffer_6; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_205 = 5'h7 == pindex ? _buffer_T_2 : buffer_7; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_206 = 5'h8 == pindex ? _buffer_T_2 : buffer_8; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_207 = 5'h9 == pindex ? _buffer_T_2 : buffer_9; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_208 = 5'ha == pindex ? _buffer_T_2 : buffer_10; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_209 = 5'hb == pindex ? _buffer_T_2 : buffer_11; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_210 = 5'hc == pindex ? _buffer_T_2 : buffer_12; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_211 = 5'hd == pindex ? _buffer_T_2 : buffer_13; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_212 = 5'he == pindex ? _buffer_T_2 : buffer_14; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_213 = 5'hf == pindex ? _buffer_T_2 : buffer_15; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_214 = 5'h10 == pindex ? _buffer_T_2 : buffer_16; // @[ctrl.scala 407:{30,30} 90:19]
  wire [63:0] _GEN_215 = byte_offset == 4'h7 ? _GEN_198 : buffer_0; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_216 = byte_offset == 4'h7 ? _GEN_199 : buffer_1; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_217 = byte_offset == 4'h7 ? _GEN_200 : buffer_2; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_218 = byte_offset == 4'h7 ? _GEN_201 : buffer_3; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_219 = byte_offset == 4'h7 ? _GEN_202 : buffer_4; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_220 = byte_offset == 4'h7 ? _GEN_203 : buffer_5; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_221 = byte_offset == 4'h7 ? _GEN_204 : buffer_6; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_222 = byte_offset == 4'h7 ? _GEN_205 : buffer_7; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_223 = byte_offset == 4'h7 ? _GEN_206 : buffer_8; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_224 = byte_offset == 4'h7 ? _GEN_207 : buffer_9; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_225 = byte_offset == 4'h7 ? _GEN_208 : buffer_10; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_226 = byte_offset == 4'h7 ? _GEN_209 : buffer_11; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_227 = byte_offset == 4'h7 ? _GEN_210 : buffer_12; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_228 = byte_offset == 4'h7 ? _GEN_211 : buffer_13; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_229 = byte_offset == 4'h7 ? _GEN_212 : buffer_14; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_230 = byte_offset == 4'h7 ? _GEN_213 : buffer_15; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_231 = byte_offset == 4'h7 ? _GEN_214 : buffer_16; // @[ctrl.scala 398:56 90:19]
  wire [63:0] _GEN_232 = 5'h0 == pindex ? 64'h8000000000000000 : buffer_0; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_233 = 5'h1 == pindex ? 64'h8000000000000000 : buffer_1; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_234 = 5'h2 == pindex ? 64'h8000000000000000 : buffer_2; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_235 = 5'h3 == pindex ? 64'h8000000000000000 : buffer_3; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_236 = 5'h4 == pindex ? 64'h8000000000000000 : buffer_4; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_237 = 5'h5 == pindex ? 64'h8000000000000000 : buffer_5; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_238 = 5'h6 == pindex ? 64'h8000000000000000 : buffer_6; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_239 = 5'h7 == pindex ? 64'h8000000000000000 : buffer_7; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_240 = 5'h8 == pindex ? 64'h8000000000000000 : buffer_8; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_241 = 5'h9 == pindex ? 64'h8000000000000000 : buffer_9; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_242 = 5'ha == pindex ? 64'h8000000000000000 : buffer_10; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_243 = 5'hb == pindex ? 64'h8000000000000000 : buffer_11; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_244 = 5'hc == pindex ? 64'h8000000000000000 : buffer_12; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_245 = 5'hd == pindex ? 64'h8000000000000000 : buffer_13; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_246 = 5'he == pindex ? 64'h8000000000000000 : buffer_14; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_247 = 5'hf == pindex ? 64'h8000000000000000 : buffer_15; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _GEN_248 = 5'h10 == pindex ? 64'h8000000000000000 : buffer_16; // @[ctrl.scala 421:{30,30} 90:19]
  wire [63:0] _buffer_T_5 = {8'h80,_GEN_197[55:0]}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_249 = 5'h0 == pindex ? _buffer_T_5 : buffer_0; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_250 = 5'h1 == pindex ? _buffer_T_5 : buffer_1; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_251 = 5'h2 == pindex ? _buffer_T_5 : buffer_2; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_252 = 5'h3 == pindex ? _buffer_T_5 : buffer_3; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_253 = 5'h4 == pindex ? _buffer_T_5 : buffer_4; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_254 = 5'h5 == pindex ? _buffer_T_5 : buffer_5; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_255 = 5'h6 == pindex ? _buffer_T_5 : buffer_6; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_256 = 5'h7 == pindex ? _buffer_T_5 : buffer_7; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_257 = 5'h8 == pindex ? _buffer_T_5 : buffer_8; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_258 = 5'h9 == pindex ? _buffer_T_5 : buffer_9; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_259 = 5'ha == pindex ? _buffer_T_5 : buffer_10; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_260 = 5'hb == pindex ? _buffer_T_5 : buffer_11; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_261 = 5'hc == pindex ? _buffer_T_5 : buffer_12; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_262 = 5'hd == pindex ? _buffer_T_5 : buffer_13; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_263 = 5'he == pindex ? _buffer_T_5 : buffer_14; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_264 = 5'hf == pindex ? _buffer_T_5 : buffer_15; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_265 = 5'h10 == pindex ? _buffer_T_5 : buffer_16; // @[ctrl.scala 431:{30,30} 90:19]
  wire [63:0] _GEN_266 = words_filled < 5'h10 ? _GEN_232 : _GEN_249; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_267 = words_filled < 5'h10 ? _GEN_233 : _GEN_250; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_268 = words_filled < 5'h10 ? _GEN_234 : _GEN_251; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_269 = words_filled < 5'h10 ? _GEN_235 : _GEN_252; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_270 = words_filled < 5'h10 ? _GEN_236 : _GEN_253; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_271 = words_filled < 5'h10 ? _GEN_237 : _GEN_254; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_272 = words_filled < 5'h10 ? _GEN_238 : _GEN_255; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_273 = words_filled < 5'h10 ? _GEN_239 : _GEN_256; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_274 = words_filled < 5'h10 ? _GEN_240 : _GEN_257; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_275 = words_filled < 5'h10 ? _GEN_241 : _GEN_258; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_276 = words_filled < 5'h10 ? _GEN_242 : _GEN_259; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_277 = words_filled < 5'h10 ? _GEN_243 : _GEN_260; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_278 = words_filled < 5'h10 ? _GEN_244 : _GEN_261; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_279 = words_filled < 5'h10 ? _GEN_245 : _GEN_262; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_280 = words_filled < 5'h10 ? _GEN_246 : _GEN_263; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_281 = words_filled < 5'h10 ? _GEN_247 : _GEN_264; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_282 = words_filled < 5'h10 ? _GEN_248 : _GEN_265; // @[ctrl.scala 415:58]
  wire [63:0] _GEN_283 = words_filled == 5'h10 ? _GEN_215 : _GEN_266; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_284 = words_filled == 5'h10 ? _GEN_216 : _GEN_267; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_285 = words_filled == 5'h10 ? _GEN_217 : _GEN_268; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_286 = words_filled == 5'h10 ? _GEN_218 : _GEN_269; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_287 = words_filled == 5'h10 ? _GEN_219 : _GEN_270; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_288 = words_filled == 5'h10 ? _GEN_220 : _GEN_271; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_289 = words_filled == 5'h10 ? _GEN_221 : _GEN_272; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_290 = words_filled == 5'h10 ? _GEN_222 : _GEN_273; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_291 = words_filled == 5'h10 ? _GEN_223 : _GEN_274; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_292 = words_filled == 5'h10 ? _GEN_224 : _GEN_275; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_293 = words_filled == 5'h10 ? _GEN_225 : _GEN_276; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_294 = words_filled == 5'h10 ? _GEN_226 : _GEN_277; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_295 = words_filled == 5'h10 ? _GEN_227 : _GEN_278; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_296 = words_filled == 5'h10 ? _GEN_228 : _GEN_279; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_297 = words_filled == 5'h10 ? _GEN_229 : _GEN_280; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_298 = words_filled == 5'h10 ? _GEN_230 : _GEN_281; // @[ctrl.scala 397:58]
  wire [63:0] _GEN_299 = words_filled == 5'h10 ? _GEN_231 : _GEN_282; // @[ctrl.scala 397:58]
  wire [10:0] _buffer_T_7 = {3'h6,_GEN_197[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_7 = {{53'd0}, _buffer_T_7}; // @[ctrl.scala 449:{30,30}]
  wire [63:0] _GEN_300 = 5'h0 == pindex ? _buffer_pindex_7 : buffer_0; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_301 = 5'h1 == pindex ? _buffer_pindex_7 : buffer_1; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_302 = 5'h2 == pindex ? _buffer_pindex_7 : buffer_2; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_303 = 5'h3 == pindex ? _buffer_pindex_7 : buffer_3; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_304 = 5'h4 == pindex ? _buffer_pindex_7 : buffer_4; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_305 = 5'h5 == pindex ? _buffer_pindex_7 : buffer_5; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_306 = 5'h6 == pindex ? _buffer_pindex_7 : buffer_6; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_307 = 5'h7 == pindex ? _buffer_pindex_7 : buffer_7; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_308 = 5'h8 == pindex ? _buffer_pindex_7 : buffer_8; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_309 = 5'h9 == pindex ? _buffer_pindex_7 : buffer_9; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_310 = 5'ha == pindex ? _buffer_pindex_7 : buffer_10; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_311 = 5'hb == pindex ? _buffer_pindex_7 : buffer_11; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_312 = 5'hc == pindex ? _buffer_pindex_7 : buffer_12; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_313 = 5'hd == pindex ? _buffer_pindex_7 : buffer_13; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_314 = 5'he == pindex ? _buffer_pindex_7 : buffer_14; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_315 = 5'hf == pindex ? _buffer_pindex_7 : buffer_15; // @[ctrl.scala 449:{30,30} 90:19]
  wire [63:0] _GEN_316 = 5'h10 == pindex ? _buffer_pindex_7 : buffer_16; // @[ctrl.scala 449:{30,30} 90:19]
  wire [18:0] _buffer_T_9 = {3'h6,_GEN_197[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_9 = {{45'd0}, _buffer_T_9}; // @[ctrl.scala 459:{30,30}]
  wire [63:0] _GEN_317 = 5'h0 == pindex ? _buffer_pindex_9 : buffer_0; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_318 = 5'h1 == pindex ? _buffer_pindex_9 : buffer_1; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_319 = 5'h2 == pindex ? _buffer_pindex_9 : buffer_2; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_320 = 5'h3 == pindex ? _buffer_pindex_9 : buffer_3; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_321 = 5'h4 == pindex ? _buffer_pindex_9 : buffer_4; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_322 = 5'h5 == pindex ? _buffer_pindex_9 : buffer_5; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_323 = 5'h6 == pindex ? _buffer_pindex_9 : buffer_6; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_324 = 5'h7 == pindex ? _buffer_pindex_9 : buffer_7; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_325 = 5'h8 == pindex ? _buffer_pindex_9 : buffer_8; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_326 = 5'h9 == pindex ? _buffer_pindex_9 : buffer_9; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_327 = 5'ha == pindex ? _buffer_pindex_9 : buffer_10; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_328 = 5'hb == pindex ? _buffer_pindex_9 : buffer_11; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_329 = 5'hc == pindex ? _buffer_pindex_9 : buffer_12; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_330 = 5'hd == pindex ? _buffer_pindex_9 : buffer_13; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_331 = 5'he == pindex ? _buffer_pindex_9 : buffer_14; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_332 = 5'hf == pindex ? _buffer_pindex_9 : buffer_15; // @[ctrl.scala 459:{30,30} 90:19]
  wire [63:0] _GEN_333 = 5'h10 == pindex ? _buffer_pindex_9 : buffer_16; // @[ctrl.scala 459:{30,30} 90:19]
  wire [26:0] _buffer_T_11 = {3'h6,_GEN_197[23:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_11 = {{37'd0}, _buffer_T_11}; // @[ctrl.scala 469:{30,30}]
  wire [63:0] _GEN_334 = 5'h0 == pindex ? _buffer_pindex_11 : buffer_0; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_335 = 5'h1 == pindex ? _buffer_pindex_11 : buffer_1; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_336 = 5'h2 == pindex ? _buffer_pindex_11 : buffer_2; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_337 = 5'h3 == pindex ? _buffer_pindex_11 : buffer_3; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_338 = 5'h4 == pindex ? _buffer_pindex_11 : buffer_4; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_339 = 5'h5 == pindex ? _buffer_pindex_11 : buffer_5; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_340 = 5'h6 == pindex ? _buffer_pindex_11 : buffer_6; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_341 = 5'h7 == pindex ? _buffer_pindex_11 : buffer_7; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_342 = 5'h8 == pindex ? _buffer_pindex_11 : buffer_8; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_343 = 5'h9 == pindex ? _buffer_pindex_11 : buffer_9; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_344 = 5'ha == pindex ? _buffer_pindex_11 : buffer_10; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_345 = 5'hb == pindex ? _buffer_pindex_11 : buffer_11; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_346 = 5'hc == pindex ? _buffer_pindex_11 : buffer_12; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_347 = 5'hd == pindex ? _buffer_pindex_11 : buffer_13; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_348 = 5'he == pindex ? _buffer_pindex_11 : buffer_14; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_349 = 5'hf == pindex ? _buffer_pindex_11 : buffer_15; // @[ctrl.scala 469:{30,30} 90:19]
  wire [63:0] _GEN_350 = 5'h10 == pindex ? _buffer_pindex_11 : buffer_16; // @[ctrl.scala 469:{30,30} 90:19]
  wire [34:0] _buffer_T_13 = {3'h6,_GEN_197[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_13 = {{29'd0}, _buffer_T_13}; // @[ctrl.scala 479:{30,30}]
  wire [63:0] _GEN_351 = 5'h0 == pindex ? _buffer_pindex_13 : buffer_0; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_352 = 5'h1 == pindex ? _buffer_pindex_13 : buffer_1; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_353 = 5'h2 == pindex ? _buffer_pindex_13 : buffer_2; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_354 = 5'h3 == pindex ? _buffer_pindex_13 : buffer_3; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_355 = 5'h4 == pindex ? _buffer_pindex_13 : buffer_4; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_356 = 5'h5 == pindex ? _buffer_pindex_13 : buffer_5; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_357 = 5'h6 == pindex ? _buffer_pindex_13 : buffer_6; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_358 = 5'h7 == pindex ? _buffer_pindex_13 : buffer_7; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_359 = 5'h8 == pindex ? _buffer_pindex_13 : buffer_8; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_360 = 5'h9 == pindex ? _buffer_pindex_13 : buffer_9; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_361 = 5'ha == pindex ? _buffer_pindex_13 : buffer_10; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_362 = 5'hb == pindex ? _buffer_pindex_13 : buffer_11; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_363 = 5'hc == pindex ? _buffer_pindex_13 : buffer_12; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_364 = 5'hd == pindex ? _buffer_pindex_13 : buffer_13; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_365 = 5'he == pindex ? _buffer_pindex_13 : buffer_14; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_366 = 5'hf == pindex ? _buffer_pindex_13 : buffer_15; // @[ctrl.scala 479:{30,30} 90:19]
  wire [63:0] _GEN_367 = 5'h10 == pindex ? _buffer_pindex_13 : buffer_16; // @[ctrl.scala 479:{30,30} 90:19]
  wire [42:0] _buffer_T_15 = {3'h6,_GEN_197[39:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_15 = {{21'd0}, _buffer_T_15}; // @[ctrl.scala 489:{30,30}]
  wire [63:0] _GEN_368 = 5'h0 == pindex ? _buffer_pindex_15 : buffer_0; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_369 = 5'h1 == pindex ? _buffer_pindex_15 : buffer_1; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_370 = 5'h2 == pindex ? _buffer_pindex_15 : buffer_2; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_371 = 5'h3 == pindex ? _buffer_pindex_15 : buffer_3; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_372 = 5'h4 == pindex ? _buffer_pindex_15 : buffer_4; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_373 = 5'h5 == pindex ? _buffer_pindex_15 : buffer_5; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_374 = 5'h6 == pindex ? _buffer_pindex_15 : buffer_6; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_375 = 5'h7 == pindex ? _buffer_pindex_15 : buffer_7; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_376 = 5'h8 == pindex ? _buffer_pindex_15 : buffer_8; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_377 = 5'h9 == pindex ? _buffer_pindex_15 : buffer_9; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_378 = 5'ha == pindex ? _buffer_pindex_15 : buffer_10; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_379 = 5'hb == pindex ? _buffer_pindex_15 : buffer_11; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_380 = 5'hc == pindex ? _buffer_pindex_15 : buffer_12; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_381 = 5'hd == pindex ? _buffer_pindex_15 : buffer_13; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_382 = 5'he == pindex ? _buffer_pindex_15 : buffer_14; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_383 = 5'hf == pindex ? _buffer_pindex_15 : buffer_15; // @[ctrl.scala 489:{30,30} 90:19]
  wire [63:0] _GEN_384 = 5'h10 == pindex ? _buffer_pindex_15 : buffer_16; // @[ctrl.scala 489:{30,30} 90:19]
  wire [50:0] _buffer_T_17 = {3'h6,_GEN_197[47:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_17 = {{13'd0}, _buffer_T_17}; // @[ctrl.scala 499:{30,30}]
  wire [63:0] _GEN_385 = 5'h0 == pindex ? _buffer_pindex_17 : buffer_0; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_386 = 5'h1 == pindex ? _buffer_pindex_17 : buffer_1; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_387 = 5'h2 == pindex ? _buffer_pindex_17 : buffer_2; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_388 = 5'h3 == pindex ? _buffer_pindex_17 : buffer_3; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_389 = 5'h4 == pindex ? _buffer_pindex_17 : buffer_4; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_390 = 5'h5 == pindex ? _buffer_pindex_17 : buffer_5; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_391 = 5'h6 == pindex ? _buffer_pindex_17 : buffer_6; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_392 = 5'h7 == pindex ? _buffer_pindex_17 : buffer_7; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_393 = 5'h8 == pindex ? _buffer_pindex_17 : buffer_8; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_394 = 5'h9 == pindex ? _buffer_pindex_17 : buffer_9; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_395 = 5'ha == pindex ? _buffer_pindex_17 : buffer_10; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_396 = 5'hb == pindex ? _buffer_pindex_17 : buffer_11; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_397 = 5'hc == pindex ? _buffer_pindex_17 : buffer_12; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_398 = 5'hd == pindex ? _buffer_pindex_17 : buffer_13; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_399 = 5'he == pindex ? _buffer_pindex_17 : buffer_14; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_400 = 5'hf == pindex ? _buffer_pindex_17 : buffer_15; // @[ctrl.scala 499:{30,30} 90:19]
  wire [63:0] _GEN_401 = 5'h10 == pindex ? _buffer_pindex_17 : buffer_16; // @[ctrl.scala 499:{30,30} 90:19]
  wire [58:0] _buffer_T_19 = {3'h6,_GEN_197[55:0]}; // @[Cat.scala 31:58]
  wire [63:0] _buffer_pindex_19 = {{5'd0}, _buffer_T_19}; // @[ctrl.scala 509:{30,30}]
  wire [63:0] _GEN_402 = 5'h0 == pindex ? _buffer_pindex_19 : buffer_0; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_403 = 5'h1 == pindex ? _buffer_pindex_19 : buffer_1; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_404 = 5'h2 == pindex ? _buffer_pindex_19 : buffer_2; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_405 = 5'h3 == pindex ? _buffer_pindex_19 : buffer_3; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_406 = 5'h4 == pindex ? _buffer_pindex_19 : buffer_4; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_407 = 5'h5 == pindex ? _buffer_pindex_19 : buffer_5; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_408 = 5'h6 == pindex ? _buffer_pindex_19 : buffer_6; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_409 = 5'h7 == pindex ? _buffer_pindex_19 : buffer_7; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_410 = 5'h8 == pindex ? _buffer_pindex_19 : buffer_8; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_411 = 5'h9 == pindex ? _buffer_pindex_19 : buffer_9; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_412 = 5'ha == pindex ? _buffer_pindex_19 : buffer_10; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_413 = 5'hb == pindex ? _buffer_pindex_19 : buffer_11; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_414 = 5'hc == pindex ? _buffer_pindex_19 : buffer_12; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_415 = 5'hd == pindex ? _buffer_pindex_19 : buffer_13; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_416 = 5'he == pindex ? _buffer_pindex_19 : buffer_14; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_417 = 5'hf == pindex ? _buffer_pindex_19 : buffer_15; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_418 = 5'h10 == pindex ? _buffer_pindex_19 : buffer_16; // @[ctrl.scala 509:{30,30} 90:19]
  wire [63:0] _GEN_419 = _T_54 ? _GEN_402 : buffer_0; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_420 = _T_54 ? _GEN_403 : buffer_1; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_421 = _T_54 ? _GEN_404 : buffer_2; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_422 = _T_54 ? _GEN_405 : buffer_3; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_423 = _T_54 ? _GEN_406 : buffer_4; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_424 = _T_54 ? _GEN_407 : buffer_5; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_425 = _T_54 ? _GEN_408 : buffer_6; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_426 = _T_54 ? _GEN_409 : buffer_7; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_427 = _T_54 ? _GEN_410 : buffer_8; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_428 = _T_54 ? _GEN_411 : buffer_9; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_429 = _T_54 ? _GEN_412 : buffer_10; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_430 = _T_54 ? _GEN_413 : buffer_11; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_431 = _T_54 ? _GEN_414 : buffer_12; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_432 = _T_54 ? _GEN_415 : buffer_13; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_433 = _T_54 ? _GEN_416 : buffer_14; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_434 = _T_54 ? _GEN_417 : buffer_15; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_435 = _T_54 ? _GEN_418 : buffer_16; // @[ctrl.scala 501:46 90:19]
  wire [63:0] _GEN_436 = byte_offset == 4'h6 ? _GEN_385 : _GEN_419; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_437 = byte_offset == 4'h6 ? _GEN_386 : _GEN_420; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_438 = byte_offset == 4'h6 ? _GEN_387 : _GEN_421; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_439 = byte_offset == 4'h6 ? _GEN_388 : _GEN_422; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_440 = byte_offset == 4'h6 ? _GEN_389 : _GEN_423; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_441 = byte_offset == 4'h6 ? _GEN_390 : _GEN_424; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_442 = byte_offset == 4'h6 ? _GEN_391 : _GEN_425; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_443 = byte_offset == 4'h6 ? _GEN_392 : _GEN_426; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_444 = byte_offset == 4'h6 ? _GEN_393 : _GEN_427; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_445 = byte_offset == 4'h6 ? _GEN_394 : _GEN_428; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_446 = byte_offset == 4'h6 ? _GEN_395 : _GEN_429; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_447 = byte_offset == 4'h6 ? _GEN_396 : _GEN_430; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_448 = byte_offset == 4'h6 ? _GEN_397 : _GEN_431; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_449 = byte_offset == 4'h6 ? _GEN_398 : _GEN_432; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_450 = byte_offset == 4'h6 ? _GEN_399 : _GEN_433; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_451 = byte_offset == 4'h6 ? _GEN_400 : _GEN_434; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_452 = byte_offset == 4'h6 ? _GEN_401 : _GEN_435; // @[ctrl.scala 491:46]
  wire [63:0] _GEN_453 = byte_offset == 4'h5 ? _GEN_368 : _GEN_436; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_454 = byte_offset == 4'h5 ? _GEN_369 : _GEN_437; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_455 = byte_offset == 4'h5 ? _GEN_370 : _GEN_438; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_456 = byte_offset == 4'h5 ? _GEN_371 : _GEN_439; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_457 = byte_offset == 4'h5 ? _GEN_372 : _GEN_440; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_458 = byte_offset == 4'h5 ? _GEN_373 : _GEN_441; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_459 = byte_offset == 4'h5 ? _GEN_374 : _GEN_442; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_460 = byte_offset == 4'h5 ? _GEN_375 : _GEN_443; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_461 = byte_offset == 4'h5 ? _GEN_376 : _GEN_444; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_462 = byte_offset == 4'h5 ? _GEN_377 : _GEN_445; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_463 = byte_offset == 4'h5 ? _GEN_378 : _GEN_446; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_464 = byte_offset == 4'h5 ? _GEN_379 : _GEN_447; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_465 = byte_offset == 4'h5 ? _GEN_380 : _GEN_448; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_466 = byte_offset == 4'h5 ? _GEN_381 : _GEN_449; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_467 = byte_offset == 4'h5 ? _GEN_382 : _GEN_450; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_468 = byte_offset == 4'h5 ? _GEN_383 : _GEN_451; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_469 = byte_offset == 4'h5 ? _GEN_384 : _GEN_452; // @[ctrl.scala 481:46]
  wire [63:0] _GEN_470 = byte_offset == 4'h4 ? _GEN_351 : _GEN_453; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_471 = byte_offset == 4'h4 ? _GEN_352 : _GEN_454; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_472 = byte_offset == 4'h4 ? _GEN_353 : _GEN_455; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_473 = byte_offset == 4'h4 ? _GEN_354 : _GEN_456; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_474 = byte_offset == 4'h4 ? _GEN_355 : _GEN_457; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_475 = byte_offset == 4'h4 ? _GEN_356 : _GEN_458; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_476 = byte_offset == 4'h4 ? _GEN_357 : _GEN_459; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_477 = byte_offset == 4'h4 ? _GEN_358 : _GEN_460; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_478 = byte_offset == 4'h4 ? _GEN_359 : _GEN_461; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_479 = byte_offset == 4'h4 ? _GEN_360 : _GEN_462; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_480 = byte_offset == 4'h4 ? _GEN_361 : _GEN_463; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_481 = byte_offset == 4'h4 ? _GEN_362 : _GEN_464; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_482 = byte_offset == 4'h4 ? _GEN_363 : _GEN_465; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_483 = byte_offset == 4'h4 ? _GEN_364 : _GEN_466; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_484 = byte_offset == 4'h4 ? _GEN_365 : _GEN_467; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_485 = byte_offset == 4'h4 ? _GEN_366 : _GEN_468; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_486 = byte_offset == 4'h4 ? _GEN_367 : _GEN_469; // @[ctrl.scala 471:46]
  wire [63:0] _GEN_487 = byte_offset == 4'h3 ? _GEN_334 : _GEN_470; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_488 = byte_offset == 4'h3 ? _GEN_335 : _GEN_471; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_489 = byte_offset == 4'h3 ? _GEN_336 : _GEN_472; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_490 = byte_offset == 4'h3 ? _GEN_337 : _GEN_473; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_491 = byte_offset == 4'h3 ? _GEN_338 : _GEN_474; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_492 = byte_offset == 4'h3 ? _GEN_339 : _GEN_475; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_493 = byte_offset == 4'h3 ? _GEN_340 : _GEN_476; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_494 = byte_offset == 4'h3 ? _GEN_341 : _GEN_477; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_495 = byte_offset == 4'h3 ? _GEN_342 : _GEN_478; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_496 = byte_offset == 4'h3 ? _GEN_343 : _GEN_479; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_497 = byte_offset == 4'h3 ? _GEN_344 : _GEN_480; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_498 = byte_offset == 4'h3 ? _GEN_345 : _GEN_481; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_499 = byte_offset == 4'h3 ? _GEN_346 : _GEN_482; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_500 = byte_offset == 4'h3 ? _GEN_347 : _GEN_483; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_501 = byte_offset == 4'h3 ? _GEN_348 : _GEN_484; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_502 = byte_offset == 4'h3 ? _GEN_349 : _GEN_485; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_503 = byte_offset == 4'h3 ? _GEN_350 : _GEN_486; // @[ctrl.scala 461:46]
  wire [63:0] _GEN_504 = byte_offset == 4'h2 ? _GEN_317 : _GEN_487; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_505 = byte_offset == 4'h2 ? _GEN_318 : _GEN_488; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_506 = byte_offset == 4'h2 ? _GEN_319 : _GEN_489; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_507 = byte_offset == 4'h2 ? _GEN_320 : _GEN_490; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_508 = byte_offset == 4'h2 ? _GEN_321 : _GEN_491; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_509 = byte_offset == 4'h2 ? _GEN_322 : _GEN_492; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_510 = byte_offset == 4'h2 ? _GEN_323 : _GEN_493; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_511 = byte_offset == 4'h2 ? _GEN_324 : _GEN_494; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_512 = byte_offset == 4'h2 ? _GEN_325 : _GEN_495; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_513 = byte_offset == 4'h2 ? _GEN_326 : _GEN_496; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_514 = byte_offset == 4'h2 ? _GEN_327 : _GEN_497; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_515 = byte_offset == 4'h2 ? _GEN_328 : _GEN_498; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_516 = byte_offset == 4'h2 ? _GEN_329 : _GEN_499; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_517 = byte_offset == 4'h2 ? _GEN_330 : _GEN_500; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_518 = byte_offset == 4'h2 ? _GEN_331 : _GEN_501; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_519 = byte_offset == 4'h2 ? _GEN_332 : _GEN_502; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_520 = byte_offset == 4'h2 ? _GEN_333 : _GEN_503; // @[ctrl.scala 451:46]
  wire [63:0] _GEN_521 = byte_offset == 4'h1 ? _GEN_300 : _GEN_504; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_522 = byte_offset == 4'h1 ? _GEN_301 : _GEN_505; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_523 = byte_offset == 4'h1 ? _GEN_302 : _GEN_506; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_524 = byte_offset == 4'h1 ? _GEN_303 : _GEN_507; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_525 = byte_offset == 4'h1 ? _GEN_304 : _GEN_508; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_526 = byte_offset == 4'h1 ? _GEN_305 : _GEN_509; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_527 = byte_offset == 4'h1 ? _GEN_306 : _GEN_510; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_528 = byte_offset == 4'h1 ? _GEN_307 : _GEN_511; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_529 = byte_offset == 4'h1 ? _GEN_308 : _GEN_512; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_530 = byte_offset == 4'h1 ? _GEN_309 : _GEN_513; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_531 = byte_offset == 4'h1 ? _GEN_310 : _GEN_514; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_532 = byte_offset == 4'h1 ? _GEN_311 : _GEN_515; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_533 = byte_offset == 4'h1 ? _GEN_312 : _GEN_516; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_534 = byte_offset == 4'h1 ? _GEN_313 : _GEN_517; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_535 = byte_offset == 4'h1 ? _GEN_314 : _GEN_518; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_536 = byte_offset == 4'h1 ? _GEN_315 : _GEN_519; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_537 = byte_offset == 4'h1 ? _GEN_316 : _GEN_520; // @[ctrl.scala 439:40]
  wire [63:0] _GEN_555 = mindex == 5'h0 & _T_45 ? _GEN_130 : buffer_0; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_556 = mindex == 5'h0 & _T_45 ? _GEN_131 : buffer_1; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_557 = mindex == 5'h0 & _T_45 ? _GEN_132 : buffer_2; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_558 = mindex == 5'h0 & _T_45 ? _GEN_133 : buffer_3; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_559 = mindex == 5'h0 & _T_45 ? _GEN_134 : buffer_4; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_560 = mindex == 5'h0 & _T_45 ? _GEN_135 : buffer_5; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_561 = mindex == 5'h0 & _T_45 ? _GEN_136 : buffer_6; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_562 = mindex == 5'h0 & _T_45 ? _GEN_137 : buffer_7; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_563 = mindex == 5'h0 & _T_45 ? _GEN_138 : buffer_8; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_564 = mindex == 5'h0 & _T_45 ? _GEN_139 : buffer_9; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_565 = mindex == 5'h0 & _T_45 ? _GEN_140 : buffer_10; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_566 = mindex == 5'h0 & _T_45 ? _GEN_141 : buffer_11; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_567 = mindex == 5'h0 & _T_45 ? _GEN_142 : buffer_12; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_568 = mindex == 5'h0 & _T_45 ? _GEN_143 : buffer_13; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_569 = mindex == 5'h0 & _T_45 ? _GEN_144 : buffer_14; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_570 = mindex == 5'h0 & _T_45 ? _GEN_145 : buffer_15; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_571 = mindex == 5'h0 & _T_45 ? _GEN_146 : buffer_16; // @[ctrl.scala 514:62 90:19]
  wire [63:0] _GEN_572 = byte_offset != 4'h0 ? _GEN_521 : _GEN_555; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_573 = byte_offset != 4'h0 ? _GEN_522 : _GEN_556; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_574 = byte_offset != 4'h0 ? _GEN_523 : _GEN_557; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_575 = byte_offset != 4'h0 ? _GEN_524 : _GEN_558; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_576 = byte_offset != 4'h0 ? _GEN_525 : _GEN_559; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_577 = byte_offset != 4'h0 ? _GEN_526 : _GEN_560; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_578 = byte_offset != 4'h0 ? _GEN_527 : _GEN_561; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_579 = byte_offset != 4'h0 ? _GEN_528 : _GEN_562; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_580 = byte_offset != 4'h0 ? _GEN_529 : _GEN_563; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_581 = byte_offset != 4'h0 ? _GEN_530 : _GEN_564; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_582 = byte_offset != 4'h0 ? _GEN_531 : _GEN_565; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_583 = byte_offset != 4'h0 ? _GEN_532 : _GEN_566; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_584 = byte_offset != 4'h0 ? _GEN_533 : _GEN_567; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_585 = byte_offset != 4'h0 ? _GEN_534 : _GEN_568; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_586 = byte_offset != 4'h0 ? _GEN_535 : _GEN_569; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_587 = byte_offset != 4'h0 ? _GEN_536 : _GEN_570; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_588 = byte_offset != 4'h0 ? _GEN_537 : _GEN_571; // @[ctrl.scala 437:39]
  wire [63:0] _GEN_589 = pindex == words_filled ? _GEN_572 : buffer_0; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_590 = pindex == words_filled ? _GEN_573 : buffer_1; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_591 = pindex == words_filled ? _GEN_574 : buffer_2; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_592 = pindex == words_filled ? _GEN_575 : buffer_3; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_593 = pindex == words_filled ? _GEN_576 : buffer_4; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_594 = pindex == words_filled ? _GEN_577 : buffer_5; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_595 = pindex == words_filled ? _GEN_578 : buffer_6; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_596 = pindex == words_filled ? _GEN_579 : buffer_7; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_597 = pindex == words_filled ? _GEN_580 : buffer_8; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_598 = pindex == words_filled ? _GEN_581 : buffer_9; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_599 = pindex == words_filled ? _GEN_582 : buffer_10; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_600 = pindex == words_filled ? _GEN_583 : buffer_11; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_601 = pindex == words_filled ? _GEN_584 : buffer_12; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_602 = pindex == words_filled ? _GEN_585 : buffer_13; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_603 = pindex == words_filled ? _GEN_586 : buffer_14; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_604 = pindex == words_filled ? _GEN_587 : buffer_15; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_605 = pindex == words_filled ? _GEN_588 : buffer_16; // @[ctrl.scala 435:42 90:19]
  wire [63:0] _GEN_606 = pindex == 5'h10 ? _GEN_283 : _GEN_589; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_607 = pindex == 5'h10 ? _GEN_284 : _GEN_590; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_608 = pindex == 5'h10 ? _GEN_285 : _GEN_591; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_609 = pindex == 5'h10 ? _GEN_286 : _GEN_592; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_610 = pindex == 5'h10 ? _GEN_287 : _GEN_593; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_611 = pindex == 5'h10 ? _GEN_288 : _GEN_594; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_612 = pindex == 5'h10 ? _GEN_289 : _GEN_595; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_613 = pindex == 5'h10 ? _GEN_290 : _GEN_596; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_614 = pindex == 5'h10 ? _GEN_291 : _GEN_597; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_615 = pindex == 5'h10 ? _GEN_292 : _GEN_598; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_616 = pindex == 5'h10 ? _GEN_293 : _GEN_599; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_617 = pindex == 5'h10 ? _GEN_294 : _GEN_600; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_618 = pindex == 5'h10 ? _GEN_295 : _GEN_601; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_619 = pindex == 5'h10 ? _GEN_296 : _GEN_602; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_620 = pindex == 5'h10 ? _GEN_297 : _GEN_603; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_621 = pindex == 5'h10 ? _GEN_298 : _GEN_604; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_622 = pindex == 5'h10 ? _GEN_299 : _GEN_605; // @[ctrl.scala 393:55]
  wire [63:0] _GEN_623 = pindex > words_filled & pindex < 5'h10 ? _GEN_164 : _GEN_606; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_624 = pindex > words_filled & pindex < 5'h10 ? _GEN_165 : _GEN_607; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_625 = pindex > words_filled & pindex < 5'h10 ? _GEN_166 : _GEN_608; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_626 = pindex > words_filled & pindex < 5'h10 ? _GEN_167 : _GEN_609; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_627 = pindex > words_filled & pindex < 5'h10 ? _GEN_168 : _GEN_610; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_628 = pindex > words_filled & pindex < 5'h10 ? _GEN_169 : _GEN_611; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_629 = pindex > words_filled & pindex < 5'h10 ? _GEN_170 : _GEN_612; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_630 = pindex > words_filled & pindex < 5'h10 ? _GEN_171 : _GEN_613; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_631 = pindex > words_filled & pindex < 5'h10 ? _GEN_172 : _GEN_614; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_632 = pindex > words_filled & pindex < 5'h10 ? _GEN_173 : _GEN_615; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_633 = pindex > words_filled & pindex < 5'h10 ? _GEN_174 : _GEN_616; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_634 = pindex > words_filled & pindex < 5'h10 ? _GEN_175 : _GEN_617; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_635 = pindex > words_filled & pindex < 5'h10 ? _GEN_176 : _GEN_618; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_636 = pindex > words_filled & pindex < 5'h10 ? _GEN_177 : _GEN_619; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_637 = pindex > words_filled & pindex < 5'h10 ? _GEN_178 : _GEN_620; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_638 = pindex > words_filled & pindex < 5'h10 ? _GEN_179 : _GEN_621; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_639 = pindex > words_filled & pindex < 5'h10 ? _GEN_180 : _GEN_622; // @[ctrl.scala 372:71]
  wire [63:0] _GEN_640 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_623 : buffer_0; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_641 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_624 : buffer_1; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_642 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_625 : buffer_2; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_643 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_626 : buffer_3; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_644 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_627 : buffer_4; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_645 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_628 : buffer_5; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_646 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_629 : buffer_6; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_647 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_630 : buffer_7; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_648 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_631 : buffer_8; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_649 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_632 : buffer_9; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_650 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_633 : buffer_10; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_651 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_634 : buffer_11; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_652 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_635 : buffer_12; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_653 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_636 : buffer_13; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_654 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_637 : buffer_14; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_655 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_638 : buffer_15; // @[ctrl.scala 370:65 90:19]
  wire [63:0] _GEN_656 = ~(buffer_count < mindex & pindex >= buffer_count) ? _GEN_639 : buffer_16; // @[ctrl.scala 370:65 90:19]
  wire [4:0] _GEN_657 = areg ? 5'h0 : buffer_count; // @[ctrl.scala 531:17 533:22 108:25]
  wire [2:0] _GEN_659 = areg ? 3'h0 : 3'h4; // @[ctrl.scala 531:17 535:15 539:15]
  wire [4:0] _pindex_T_1 = pindex + 5'h1; // @[ctrl.scala 559:28]
  wire [4:0] _GEN_662 = _T_40 ? pindex : _pindex_T_1; // @[ctrl.scala 115:20 545:63 559:18]
  wire [4:0] _GEN_663 = next_buff_val ? 5'h0 : mindex; // @[ctrl.scala 112:20 528:24]
  wire [4:0] _GEN_664 = next_buff_val ? _GEN_657 : buffer_count; // @[ctrl.scala 528:24 108:25]
  wire [2:0] _GEN_665 = next_buff_val ? _GEN_659 : 3'h3; // @[ctrl.scala 528:24]
  wire [4:0] _GEN_666 = next_buff_val ? 5'h0 : _GEN_662; // @[ctrl.scala 528:24]
  wire [2:0] _GEN_668 = aindex >= 5'h10 ? 3'h0 : mem_s; // @[ctrl.scala 568:45 569:13 84:18]
  wire  _GEN_669 = 3'h4 == mem_s | buffer_valid; // @[ctrl.scala 216:16 566:18 107:25]
  wire [2:0] _GEN_670 = 3'h4 == mem_s ? _GEN_668 : mem_s; // @[ctrl.scala 216:16 84:18]
  wire  _GEN_671 = 3'h3 == mem_s ? next_buff_val : _GEN_669; // @[ctrl.scala 216:16 367:18]
  wire [63:0] _GEN_672 = 3'h3 == mem_s ? _GEN_640 : buffer_0; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_673 = 3'h3 == mem_s ? _GEN_641 : buffer_1; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_674 = 3'h3 == mem_s ? _GEN_642 : buffer_2; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_675 = 3'h3 == mem_s ? _GEN_643 : buffer_3; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_676 = 3'h3 == mem_s ? _GEN_644 : buffer_4; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_677 = 3'h3 == mem_s ? _GEN_645 : buffer_5; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_678 = 3'h3 == mem_s ? _GEN_646 : buffer_6; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_679 = 3'h3 == mem_s ? _GEN_647 : buffer_7; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_680 = 3'h3 == mem_s ? _GEN_648 : buffer_8; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_681 = 3'h3 == mem_s ? _GEN_649 : buffer_9; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_682 = 3'h3 == mem_s ? _GEN_650 : buffer_10; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_683 = 3'h3 == mem_s ? _GEN_651 : buffer_11; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_684 = 3'h3 == mem_s ? _GEN_652 : buffer_12; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_685 = 3'h3 == mem_s ? _GEN_653 : buffer_13; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_686 = 3'h3 == mem_s ? _GEN_654 : buffer_14; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_687 = 3'h3 == mem_s ? _GEN_655 : buffer_15; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_688 = 3'h3 == mem_s ? _GEN_656 : buffer_16; // @[ctrl.scala 216:16 90:19]
  wire [4:0] _GEN_689 = 3'h3 == mem_s ? _GEN_663 : mindex; // @[ctrl.scala 216:16 112:20]
  wire [4:0] _GEN_690 = 3'h3 == mem_s ? _GEN_664 : buffer_count; // @[ctrl.scala 216:16 108:25]
  wire [2:0] _GEN_691 = 3'h3 == mem_s ? _GEN_665 : _GEN_670; // @[ctrl.scala 216:16]
  wire [4:0] _GEN_692 = 3'h3 == mem_s ? _GEN_666 : pindex; // @[ctrl.scala 216:16 115:20]
  wire [63:0] _GEN_694 = 3'h2 == mem_s ? _GEN_108 : _GEN_672; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_695 = 3'h2 == mem_s ? _GEN_109 : _GEN_673; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_696 = 3'h2 == mem_s ? _GEN_110 : _GEN_674; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_697 = 3'h2 == mem_s ? _GEN_111 : _GEN_675; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_698 = 3'h2 == mem_s ? _GEN_112 : _GEN_676; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_699 = 3'h2 == mem_s ? _GEN_113 : _GEN_677; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_700 = 3'h2 == mem_s ? _GEN_114 : _GEN_678; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_701 = 3'h2 == mem_s ? _GEN_115 : _GEN_679; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_702 = 3'h2 == mem_s ? _GEN_116 : _GEN_680; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_703 = 3'h2 == mem_s ? _GEN_117 : _GEN_681; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_704 = 3'h2 == mem_s ? _GEN_118 : _GEN_682; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_705 = 3'h2 == mem_s ? _GEN_119 : _GEN_683; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_706 = 3'h2 == mem_s ? _GEN_120 : _GEN_684; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_707 = 3'h2 == mem_s ? _GEN_121 : _GEN_685; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_708 = 3'h2 == mem_s ? _GEN_122 : _GEN_686; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_709 = 3'h2 == mem_s ? _GEN_123 : _GEN_687; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_710 = 3'h2 == mem_s ? _GEN_124 : _GEN_688; // @[ctrl.scala 216:16]
  wire [4:0] _GEN_711 = 3'h2 == mem_s ? _GEN_125 : _GEN_690; // @[ctrl.scala 216:16]
  wire  _GEN_712 = 3'h2 == mem_s ? _GEN_126 : _GEN_671; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_715 = 3'h2 == mem_s ? _GEN_129 : _GEN_27; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_719 = 3'h1 == mem_s ? _GEN_46 : 64'h0; // @[ctrl.scala 216:16 178:19]
  wire [4:0] _GEN_720 = 3'h1 == mem_s ? _GEN_47 : rindex; // @[ctrl.scala 216:16 177:18]
  wire [63:0] _GEN_724 = 3'h1 == mem_s ? _GEN_72 : _GEN_715; // @[ctrl.scala 216:16]
  wire [31:0] _GEN_725 = 3'h1 == mem_s ? _GEN_73 : read; // @[ctrl.scala 216:16 109:20]
  wire  _GEN_726 = 3'h1 == mem_s ? _GEN_68 : _GEN_712; // @[ctrl.scala 216:16]
  wire [63:0] _GEN_729 = 3'h1 == mem_s ? buffer_0 : _GEN_694; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_730 = 3'h1 == mem_s ? buffer_1 : _GEN_695; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_731 = 3'h1 == mem_s ? buffer_2 : _GEN_696; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_732 = 3'h1 == mem_s ? buffer_3 : _GEN_697; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_733 = 3'h1 == mem_s ? buffer_4 : _GEN_698; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_734 = 3'h1 == mem_s ? buffer_5 : _GEN_699; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_735 = 3'h1 == mem_s ? buffer_6 : _GEN_700; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_736 = 3'h1 == mem_s ? buffer_7 : _GEN_701; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_737 = 3'h1 == mem_s ? buffer_8 : _GEN_702; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_738 = 3'h1 == mem_s ? buffer_9 : _GEN_703; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_739 = 3'h1 == mem_s ? buffer_10 : _GEN_704; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_740 = 3'h1 == mem_s ? buffer_11 : _GEN_705; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_741 = 3'h1 == mem_s ? buffer_12 : _GEN_706; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_742 = 3'h1 == mem_s ? buffer_13 : _GEN_707; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_743 = 3'h1 == mem_s ? buffer_14 : _GEN_708; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_744 = 3'h1 == mem_s ? buffer_15 : _GEN_709; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_745 = 3'h1 == mem_s ? buffer_16 : _GEN_710; // @[ctrl.scala 216:16 90:19]
  wire [4:0] _GEN_746 = 3'h1 == mem_s ? buffer_count : _GEN_711; // @[ctrl.scala 216:16 108:25]
  wire [4:0] _GEN_748 = 3'h0 == mem_s ? _GEN_38 : _GEN_746; // @[ctrl.scala 216:16]
  wire  _GEN_751 = 3'h0 == mem_s ? 1'h0 : 3'h1 == mem_s & _GEN_45; // @[ctrl.scala 216:16 176:18]
  wire [63:0] _GEN_752 = 3'h0 == mem_s ? 64'h0 : _GEN_719; // @[ctrl.scala 216:16 178:19]
  wire [4:0] _GEN_753 = 3'h0 == mem_s ? rindex : _GEN_720; // @[ctrl.scala 216:16 177:18]
  wire [63:0] _GEN_756 = 3'h0 == mem_s ? _GEN_27 : _GEN_724; // @[ctrl.scala 216:16]
  wire [31:0] _GEN_757 = 3'h0 == mem_s ? read : _GEN_725; // @[ctrl.scala 216:16 109:20]
  wire  _GEN_758 = 3'h0 == mem_s ? buffer_valid : _GEN_726; // @[ctrl.scala 216:16 107:25]
  wire [63:0] _GEN_760 = 3'h0 == mem_s ? buffer_0 : _GEN_729; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_761 = 3'h0 == mem_s ? buffer_1 : _GEN_730; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_762 = 3'h0 == mem_s ? buffer_2 : _GEN_731; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_763 = 3'h0 == mem_s ? buffer_3 : _GEN_732; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_764 = 3'h0 == mem_s ? buffer_4 : _GEN_733; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_765 = 3'h0 == mem_s ? buffer_5 : _GEN_734; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_766 = 3'h0 == mem_s ? buffer_6 : _GEN_735; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_767 = 3'h0 == mem_s ? buffer_7 : _GEN_736; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_768 = 3'h0 == mem_s ? buffer_8 : _GEN_737; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_769 = 3'h0 == mem_s ? buffer_9 : _GEN_738; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_770 = 3'h0 == mem_s ? buffer_10 : _GEN_739; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_771 = 3'h0 == mem_s ? buffer_11 : _GEN_740; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_772 = 3'h0 == mem_s ? buffer_12 : _GEN_741; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_773 = 3'h0 == mem_s ? buffer_13 : _GEN_742; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_774 = 3'h0 == mem_s ? buffer_14 : _GEN_743; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_775 = 3'h0 == mem_s ? buffer_15 : _GEN_744; // @[ctrl.scala 216:16 90:19]
  wire [63:0] _GEN_776 = 3'h0 == mem_s ? buffer_16 : _GEN_745; // @[ctrl.scala 216:16 90:19]
  wire [4:0] _GEN_812 = io_dmem_resp_tag[4:0] < 5'h11 ? _buffer_count_T_1 : _GEN_748; // @[ctrl.scala 576:59 585:22]
  wire [4:0] _GEN_830 = io_dmem_resp_val ? _GEN_812 : _GEN_748; // @[ctrl.scala 575:28]
  wire  _T_78 = mindex >= 5'h11; // @[ctrl.scala 589:18]
  wire  _T_79 = _next_buff_val_T & _T_78; // @[ctrl.scala 588:35]
  wire  _GEN_831 = _GEN_1008 > msg_len ? _GEN_758 : 1'h1; // @[ctrl.scala 591:27 595:22]
  wire  _GEN_832 = _T_79 ? _GEN_831 : _GEN_758; // @[ctrl.scala 589:45]
  wire [63:0] _GEN_1018 = {{32'd0}, hashed}; // @[ctrl.scala 604:81]
  wire  canAbsorb = busy & (rindex_reg >= 5'h18 & buffer_valid & _GEN_1018 <= msg_len); // @[ctrl.scala 604:24]
  wire  _GEN_833 = canAbsorb | _GEN_30; // @[ctrl.scala 605:20 606:13]
  wire [4:0] _aindex_T_1 = aindex + 5'h1; // @[ctrl.scala 615:22]
  wire [31:0] _hashed_T_1 = hashed + 32'h88; // @[ctrl.scala 624:24]
  wire [4:0] _rindex_T_1 = rindex + 5'h1; // @[ctrl.scala 645:24]
  wire [2:0] _GEN_848 = _GEN_1018 > msg_len | _GEN_1018 == msg_len & rindex == 5'h18 ? 3'h0 : windex; // @[ctrl.scala 652:80 653:16 113:20]
  wire [2:0] _GEN_849 = _GEN_1018 > msg_len | _GEN_1018 == msg_len & rindex == 5'h18 ? 3'h4 : 3'h0; // @[ctrl.scala 652:80 654:15 656:15]
  wire  _GEN_853 = rindex < 5'h18 ? 1'h0 : 1'h1; // @[ctrl.scala 636:32 651:16]
  wire [2:0] _GEN_854 = rindex < 5'h18 ? 3'h3 : _GEN_849; // @[ctrl.scala 636:32]
  wire [4:0] _GEN_855 = rindex < 5'h18 ? _rindex_T_1 : rindex; // @[ctrl.scala 166:19 636:32]
  wire [2:0] _GEN_856 = rindex < 5'h18 ? windex : _GEN_848; // @[ctrl.scala 113:20 636:32]
  wire [4:0] _GEN_1021 = {{2'd0}, windex}; // @[ctrl.scala 665:47]
  wire [4:0] _io_dmem_req_tag_T_1 = 5'h11 + _GEN_1021; // @[ctrl.scala 665:47]
  wire [2:0] _windex_T_1 = windex + 3'h1; // @[ctrl.scala 669:24]
  wire [63:0] _hash_addr_T_1 = hash_addr + 64'h8; // @[ctrl.scala 670:30]
  wire [2:0] _GEN_857 = io_dmem_req_rdy ? _windex_T_1 : windex; // @[ctrl.scala 668:26 669:14 113:20]
  wire [63:0] _GEN_858 = io_dmem_req_rdy ? _hash_addr_T_1 : _GEN_28; // @[ctrl.scala 668:26 670:17]
  wire [4:0] _T_98 = dmem_resp_tag_reg[4:0] - 5'h11; // @[ctrl.scala 678:43]
  wire  _GEN_859 = 2'h0 == _T_98[1:0] | writes_done_0; // @[ctrl.scala 116:25 678:{68,68}]
  wire  _GEN_860 = 2'h1 == _T_98[1:0] | writes_done_1; // @[ctrl.scala 116:25 678:{68,68}]
  wire  _GEN_861 = 2'h2 == _T_98[1:0] | writes_done_2; // @[ctrl.scala 116:25 678:{68,68}]
  wire  _GEN_862 = 2'h3 == _T_98[1:0] | writes_done_3; // @[ctrl.scala 116:25 678:{68,68}]
  wire  _GEN_863 = dmem_resp_tag_reg[4:0] >= 5'h11 ? _GEN_859 : writes_done_0; // @[ctrl.scala 116:25 676:62]
  wire  _GEN_864 = dmem_resp_tag_reg[4:0] >= 5'h11 ? _GEN_860 : writes_done_1; // @[ctrl.scala 116:25 676:62]
  wire  _GEN_865 = dmem_resp_tag_reg[4:0] >= 5'h11 ? _GEN_861 : writes_done_2; // @[ctrl.scala 116:25 676:62]
  wire  _GEN_866 = dmem_resp_tag_reg[4:0] >= 5'h11 ? _GEN_862 : writes_done_3; // @[ctrl.scala 116:25 676:62]
  wire  _GEN_867 = dmem_resp_val_reg ? _GEN_863 : writes_done_0; // @[ctrl.scala 116:25 674:28]
  wire  _GEN_868 = dmem_resp_val_reg ? _GEN_864 : writes_done_1; // @[ctrl.scala 116:25 674:28]
  wire  _GEN_869 = dmem_resp_val_reg ? _GEN_865 : writes_done_2; // @[ctrl.scala 116:25 674:28]
  wire  _GEN_870 = dmem_resp_val_reg ? _GEN_866 : writes_done_3; // @[ctrl.scala 116:25 674:28]
  wire  _T_102 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3; // @[ctrl.scala 681:30]
  wire  _GEN_871 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_30; // @[ctrl.scala 681:35 684:12]
  wire  _GEN_872 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_867; // @[ctrl.scala 681:35 686:19]
  wire  _GEN_873 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_868; // @[ctrl.scala 681:35 686:19]
  wire  _GEN_874 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_869; // @[ctrl.scala 681:35 686:19]
  wire  _GEN_875 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_870; // @[ctrl.scala 681:35 686:19]
  wire [2:0] _GEN_876 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 3'h4 : _GEN_857; // @[ctrl.scala 681:35 687:14]
  wire [4:0] _GEN_877 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 5'h19 : rindex; // @[ctrl.scala 681:35 688:14 166:19]
  wire [4:0] _GEN_878 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 5'h0 : _GEN_830; // @[ctrl.scala 681:35 689:20]
  wire [63:0] _GEN_879 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 64'h0 : _GEN_756; // @[ctrl.scala 681:35 690:16]
  wire [63:0] _GEN_880 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 64'h0 : _GEN_858; // @[ctrl.scala 681:35 691:17]
  wire [63:0] _GEN_881 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 64'h0 : _GEN_31; // @[ctrl.scala 681:35 692:15]
  wire [31:0] _GEN_882 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 32'h0 : hashed; // @[ctrl.scala 681:35 693:14 110:20]
  wire [31:0] _GEN_883 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 32'h0 : _GEN_757; // @[ctrl.scala 681:35 694:12]
  wire  _GEN_884 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 1'h0 : _GEN_832; // @[ctrl.scala 681:35 695:20]
  wire [2:0] _GEN_886 = writes_done_0 & writes_done_1 & writes_done_2 & writes_done_3 ? 3'h0 : 3'h4; // @[ctrl.scala 681:35 697:13 699:13]
  wire  _GEN_887 = 3'h4 == state ? windex < 3'h4 : _GEN_751; // @[ctrl.scala 602:17 663:21]
  wire [63:0] _GEN_888 = 3'h4 == state ? hash_addr : _GEN_752; // @[ctrl.scala 602:17 664:22]
  wire [4:0] _GEN_889 = 3'h4 == state ? _io_dmem_req_tag_T_1 : _GEN_753; // @[ctrl.scala 602:17 665:21]
  wire [2:0] _GEN_891 = 3'h4 == state ? _GEN_876 : windex; // @[ctrl.scala 602:17 113:20]
  wire [63:0] _GEN_892 = 3'h4 == state ? _GEN_880 : _GEN_28; // @[ctrl.scala 602:17]
  wire  _GEN_893 = 3'h4 == state ? _GEN_872 : writes_done_0; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_894 = 3'h4 == state ? _GEN_873 : writes_done_1; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_895 = 3'h4 == state ? _GEN_874 : writes_done_2; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_896 = 3'h4 == state ? _GEN_875 : writes_done_3; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_897 = 3'h4 == state ? _GEN_871 : _GEN_30; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_898 = 3'h4 == state ? _GEN_877 : rindex; // @[ctrl.scala 602:17 166:19]
  wire [4:0] _GEN_899 = 3'h4 == state ? _GEN_878 : _GEN_830; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_900 = 3'h4 == state ? _GEN_879 : _GEN_756; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_901 = 3'h4 == state ? _GEN_881 : _GEN_31; // @[ctrl.scala 602:17]
  wire [31:0] _GEN_902 = 3'h4 == state ? _GEN_882 : hashed; // @[ctrl.scala 602:17 110:20]
  wire [31:0] _GEN_903 = 3'h4 == state ? _GEN_883 : _GEN_757; // @[ctrl.scala 602:17]
  wire  _GEN_904 = 3'h4 == state ? _GEN_884 : _GEN_832; // @[ctrl.scala 602:17]
  wire [2:0] _GEN_906 = 3'h4 == state ? _GEN_886 : state; // @[ctrl.scala 602:17 163:18]
  wire  _GEN_910 = 3'h3 == state ? _GEN_853 : 1'h1; // @[ctrl.scala 602:17 175:18]
  wire [2:0] _GEN_911 = 3'h3 == state ? _GEN_854 : _GEN_906; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_912 = 3'h3 == state ? _GEN_855 : _GEN_898; // @[ctrl.scala 602:17]
  wire [2:0] _GEN_913 = 3'h3 == state ? _GEN_856 : _GEN_891; // @[ctrl.scala 602:17]
  wire  _GEN_914 = 3'h3 == state ? _GEN_751 : _GEN_887; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_915 = 3'h3 == state ? _GEN_752 : _GEN_888; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_916 = 3'h3 == state ? _GEN_753 : _GEN_889; // @[ctrl.scala 602:17]
  wire  _GEN_917 = 3'h3 == state ? 1'h0 : 3'h4 == state; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_918 = 3'h3 == state ? _GEN_28 : _GEN_892; // @[ctrl.scala 602:17]
  wire  _GEN_919 = 3'h3 == state ? writes_done_0 : _GEN_893; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_920 = 3'h3 == state ? writes_done_1 : _GEN_894; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_921 = 3'h3 == state ? writes_done_2 : _GEN_895; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_922 = 3'h3 == state ? writes_done_3 : _GEN_896; // @[ctrl.scala 602:17 116:25]
  wire  _GEN_923 = 3'h3 == state ? _GEN_30 : _GEN_897; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_924 = 3'h3 == state ? _GEN_830 : _GEN_899; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_925 = 3'h3 == state ? _GEN_756 : _GEN_900; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_926 = 3'h3 == state ? _GEN_31 : _GEN_901; // @[ctrl.scala 602:17]
  wire [31:0] _GEN_927 = 3'h3 == state ? hashed : _GEN_902; // @[ctrl.scala 602:17 110:20]
  wire [31:0] _GEN_928 = 3'h3 == state ? _GEN_757 : _GEN_903; // @[ctrl.scala 602:17]
  wire  _GEN_929 = 3'h3 == state ? _GEN_832 : _GEN_904; // @[ctrl.scala 602:17]
  wire  _GEN_930 = 3'h3 == state ? 1'h0 : 3'h4 == state & _T_102; // @[ctrl.scala 171:11 602:17]
  wire  _GEN_936 = 3'h2 == state | _GEN_910; // @[ctrl.scala 602:17 175:18]
  wire  _GEN_939 = 3'h2 == state ? _GEN_751 : _GEN_914; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_940 = 3'h2 == state ? _GEN_752 : _GEN_915; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_941 = 3'h2 == state ? _GEN_753 : _GEN_916; // @[ctrl.scala 602:17]
  wire  _GEN_942 = 3'h2 == state ? 1'h0 : _GEN_917; // @[ctrl.scala 602:17]
  wire  _GEN_955 = 3'h2 == state ? 1'h0 : _GEN_930; // @[ctrl.scala 171:11 602:17]
  wire  _GEN_956 = 3'h1 == state ? ~areg : _GEN_936; // @[ctrl.scala 602:17 613:14]
  wire  _GEN_968 = 3'h1 == state ? _GEN_751 : _GEN_939; // @[ctrl.scala 602:17]
  wire [63:0] _GEN_969 = 3'h1 == state ? _GEN_752 : _GEN_940; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_970 = 3'h1 == state ? _GEN_753 : _GEN_941; // @[ctrl.scala 602:17]
  wire  _GEN_971 = 3'h1 == state ? 1'h0 : _GEN_942; // @[ctrl.scala 602:17]
  wire  _GEN_981 = 3'h1 == state ? 1'h0 : _GEN_955; // @[ctrl.scala 171:11 602:17]
  wire [63:0] _GEN_996 = 3'h0 == state ? _GEN_752 : _GEN_969; // @[ctrl.scala 602:17]
  wire [4:0] _GEN_997 = 3'h0 == state ? _GEN_753 : _GEN_970; // @[ctrl.scala 602:17]
  wire  _GEN_998 = 3'h0 == state ? 1'h0 : _GEN_971; // @[ctrl.scala 602:17]
  assign io_rocc_req_rdy = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_20 : ~busy; // @[ctrl.scala 188:21 189:35]
  assign io_busy = io_rocc_req_val & _io_rocc_req_rdy_T ? _GEN_23 : busy; // @[ctrl.scala 172:11 189:35]
  assign io_dmem_req_val = 3'h0 == state ? _GEN_751 : _GEN_968; // @[ctrl.scala 602:17]
  assign io_dmem_req_tag = {{1'd0}, _GEN_997};
  assign io_dmem_req_addr = _GEN_996[39:0];
  assign io_dmem_req_cmd = {{4'd0}, _GEN_998};
  assign io_round = rindex; // @[ctrl.scala 602:17 173:18]
  assign io_absorb = areg; // @[ctrl.scala 129:17]
  assign io_aindex = io_aindex_REG; // @[ctrl.scala 128:17]
  assign io_init = 3'h0 == state ? 1'h0 : _GEN_981; // @[ctrl.scala 171:11 602:17]
  assign io_write = 3'h0 == state | _GEN_956; // @[ctrl.scala 602:17 175:18]
  assign io_windex = windex; // @[ctrl.scala 144:17]
  assign io_buffer_out = 5'h10 == io_aindex ? buffer_16 : _GEN_15; // @[ctrl.scala 142:{19,19}]
  always @(posedge clock) begin
    if (reset) begin // @[ctrl.scala 64:21]
      msg_addr <= 64'h0; // @[ctrl.scala 64:21]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      msg_addr <= _GEN_756;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      msg_addr <= _GEN_756;
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      msg_addr <= _GEN_756;
    end else begin
      msg_addr <= _GEN_925;
    end
    if (reset) begin // @[ctrl.scala 65:21]
      hash_addr <= 64'h0; // @[ctrl.scala 65:21]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      hash_addr <= _GEN_28;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      hash_addr <= _GEN_28;
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      hash_addr <= _GEN_28;
    end else begin
      hash_addr <= _GEN_918;
    end
    if (reset) begin // @[ctrl.scala 66:21]
      msg_len <= 64'h0; // @[ctrl.scala 66:21]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      msg_len <= _GEN_31;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      msg_len <= _GEN_31;
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      msg_len <= _GEN_31;
    end else begin
      msg_len <= _GEN_926;
    end
    if (reset) begin // @[ctrl.scala 68:17]
      busy <= 1'h0; // @[ctrl.scala 68:17]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      busy <= _GEN_833;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      busy <= _GEN_30;
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      busy <= _GEN_30;
    end else begin
      busy <= _GEN_923;
    end
    dmem_resp_val_reg <= io_dmem_resp_val; // @[ctrl.scala 79:30]
    dmem_resp_tag_reg <= io_dmem_resp_tag; // @[ctrl.scala 80:30]
    if (reset) begin // @[ctrl.scala 84:18]
      mem_s <= 3'h0; // @[ctrl.scala 84:18]
    end else if (3'h0 == mem_s) begin // @[ctrl.scala 216:16]
      if (canRead) begin // @[ctrl.scala 224:18]
        mem_s <= 3'h1; // @[ctrl.scala 228:13]
      end else begin
        mem_s <= 3'h0; // @[ctrl.scala 230:13]
      end
    end else if (3'h1 == mem_s) begin // @[ctrl.scala 216:16]
      if (mindex < 5'h10) begin // @[ctrl.scala 266:48]
        mem_s <= _GEN_57;
      end else begin
        mem_s <= _GEN_62;
      end
    end else if (3'h2 == mem_s) begin // @[ctrl.scala 216:16]
      mem_s <= _GEN_127;
    end else begin
      mem_s <= _GEN_691;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_0 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h0 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_0 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_0 <= _GEN_760;
        end
      end else begin
        buffer_0 <= _GEN_760;
      end
    end else begin
      buffer_0 <= _GEN_760;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_1 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h1 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_1 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_1 <= _GEN_761;
        end
      end else begin
        buffer_1 <= _GEN_761;
      end
    end else begin
      buffer_1 <= _GEN_761;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_2 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h2 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_2 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_2 <= _GEN_762;
        end
      end else begin
        buffer_2 <= _GEN_762;
      end
    end else begin
      buffer_2 <= _GEN_762;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_3 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h3 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_3 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_3 <= _GEN_763;
        end
      end else begin
        buffer_3 <= _GEN_763;
      end
    end else begin
      buffer_3 <= _GEN_763;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_4 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h4 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_4 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_4 <= _GEN_764;
        end
      end else begin
        buffer_4 <= _GEN_764;
      end
    end else begin
      buffer_4 <= _GEN_764;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_5 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h5 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_5 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_5 <= _GEN_765;
        end
      end else begin
        buffer_5 <= _GEN_765;
      end
    end else begin
      buffer_5 <= _GEN_765;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_6 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h6 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_6 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_6 <= _GEN_766;
        end
      end else begin
        buffer_6 <= _GEN_766;
      end
    end else begin
      buffer_6 <= _GEN_766;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_7 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h7 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_7 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_7 <= _GEN_767;
        end
      end else begin
        buffer_7 <= _GEN_767;
      end
    end else begin
      buffer_7 <= _GEN_767;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_8 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h8 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_8 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_8 <= _GEN_768;
        end
      end else begin
        buffer_8 <= _GEN_768;
      end
    end else begin
      buffer_8 <= _GEN_768;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_9 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h9 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_9 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_9 <= _GEN_769;
        end
      end else begin
        buffer_9 <= _GEN_769;
      end
    end else begin
      buffer_9 <= _GEN_769;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_10 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'ha == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_10 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_10 <= _GEN_770;
        end
      end else begin
        buffer_10 <= _GEN_770;
      end
    end else begin
      buffer_10 <= _GEN_770;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_11 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'hb == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_11 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_11 <= _GEN_771;
        end
      end else begin
        buffer_11 <= _GEN_771;
      end
    end else begin
      buffer_11 <= _GEN_771;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_12 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'hc == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_12 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_12 <= _GEN_772;
        end
      end else begin
        buffer_12 <= _GEN_772;
      end
    end else begin
      buffer_12 <= _GEN_772;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_13 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'hd == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_13 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_13 <= _GEN_773;
        end
      end else begin
        buffer_13 <= _GEN_773;
      end
    end else begin
      buffer_13 <= _GEN_773;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_14 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'he == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_14 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_14 <= _GEN_774;
        end
      end else begin
        buffer_14 <= _GEN_774;
      end
    end else begin
      buffer_14 <= _GEN_774;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_15 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'hf == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_15 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_15 <= _GEN_775;
        end
      end else begin
        buffer_15 <= _GEN_775;
      end
    end else begin
      buffer_15 <= _GEN_775;
    end
    if (reset) begin // @[ctrl.scala 90:19]
      buffer_16 <= 64'h0; // @[ctrl.scala 90:19]
    end else if (io_dmem_resp_val) begin // @[ctrl.scala 575:28]
      if (io_dmem_resp_tag[4:0] < 5'h11) begin // @[ctrl.scala 576:59]
        if (5'h10 == io_dmem_resp_tag[4:0]) begin // @[ctrl.scala 583:41]
          buffer_16 <= io_dmem_resp_data; // @[ctrl.scala 583:41]
        end else begin
          buffer_16 <= _GEN_776;
        end
      end else begin
        buffer_16 <= _GEN_776;
      end
    end else begin
      buffer_16 <= _GEN_776;
    end
    if (reset) begin // @[ctrl.scala 107:25]
      buffer_valid <= 1'h0; // @[ctrl.scala 107:25]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      buffer_valid <= _GEN_832;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
        buffer_valid <= 1'h0; // @[ctrl.scala 622:20]
      end else begin
        buffer_valid <= _GEN_832;
      end
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      buffer_valid <= _GEN_832;
    end else begin
      buffer_valid <= _GEN_929;
    end
    if (reset) begin // @[ctrl.scala 108:25]
      buffer_count <= 5'h0; // @[ctrl.scala 108:25]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      buffer_count <= _GEN_830;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
        buffer_count <= 5'h0; // @[ctrl.scala 623:20]
      end else begin
        buffer_count <= _GEN_830;
      end
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      buffer_count <= _GEN_830;
    end else begin
      buffer_count <= _GEN_924;
    end
    if (reset) begin // @[ctrl.scala 109:20]
      read <= 32'h0; // @[ctrl.scala 109:20]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      read <= _GEN_757;
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      read <= _GEN_757;
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      read <= _GEN_757;
    end else begin
      read <= _GEN_928;
    end
    if (reset) begin // @[ctrl.scala 110:20]
      hashed <= 32'h0; // @[ctrl.scala 110:20]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (3'h1 == state) begin // @[ctrl.scala 602:17]
        if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
          hashed <= _hashed_T_1; // @[ctrl.scala 624:14]
        end
      end else if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
        hashed <= _GEN_927;
      end
    end
    if (reset) begin // @[ctrl.scala 111:20]
      areg <= 1'h0; // @[ctrl.scala 111:20]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      areg <= 1'h0; // @[ctrl.scala 130:17]
    end else begin
      areg <= 3'h1 == state;
    end
    if (reset) begin // @[ctrl.scala 112:20]
      mindex <= 5'h0; // @[ctrl.scala 112:20]
    end else if (3'h0 == mem_s) begin // @[ctrl.scala 216:16]
      if (canRead) begin // @[ctrl.scala 224:18]
        mindex <= 5'h0; // @[ctrl.scala 227:14]
      end
    end else if (3'h1 == mem_s) begin // @[ctrl.scala 216:16]
      if (mindex < 5'h10) begin // @[ctrl.scala 266:48]
        mindex <= _GEN_50;
      end else begin
        mindex <= _GEN_63;
      end
    end else if (!(3'h2 == mem_s)) begin // @[ctrl.scala 216:16]
      mindex <= _GEN_689;
    end
    if (reset) begin // @[ctrl.scala 113:20]
      windex <= 3'h0; // @[ctrl.scala 113:20]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (!(3'h1 == state)) begin // @[ctrl.scala 602:17]
        if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
          windex <= _GEN_913;
        end
      end
    end
    if (reset) begin // @[ctrl.scala 114:20]
      aindex <= 5'h0; // @[ctrl.scala 114:20]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (3'h1 == state) begin // @[ctrl.scala 602:17]
        if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
          aindex <= 5'h0; // @[ctrl.scala 619:14]
        end else begin
          aindex <= _aindex_T_1; // @[ctrl.scala 615:12]
        end
      end
    end
    if (reset) begin // @[ctrl.scala 115:20]
      pindex <= 5'h0; // @[ctrl.scala 115:20]
    end else if (!(3'h0 == mem_s)) begin // @[ctrl.scala 216:16]
      if (3'h1 == mem_s) begin // @[ctrl.scala 216:16]
        if (mindex < 5'h10) begin // @[ctrl.scala 266:48]
          pindex <= _GEN_58;
        end else begin
          pindex <= _GEN_67;
        end
      end else if (3'h2 == mem_s) begin // @[ctrl.scala 216:16]
        pindex <= _GEN_128;
      end else begin
        pindex <= _GEN_692;
      end
    end
    if (reset) begin // @[ctrl.scala 116:25]
      writes_done_0 <= 1'h0; // @[ctrl.scala 116:25]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (!(3'h1 == state)) begin // @[ctrl.scala 602:17]
        if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
          writes_done_0 <= _GEN_919;
        end
      end
    end
    if (reset) begin // @[ctrl.scala 116:25]
      writes_done_1 <= 1'h0; // @[ctrl.scala 116:25]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (!(3'h1 == state)) begin // @[ctrl.scala 602:17]
        if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
          writes_done_1 <= _GEN_920;
        end
      end
    end
    if (reset) begin // @[ctrl.scala 116:25]
      writes_done_2 <= 1'h0; // @[ctrl.scala 116:25]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (!(3'h1 == state)) begin // @[ctrl.scala 602:17]
        if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
          writes_done_2 <= _GEN_921;
        end
      end
    end
    if (reset) begin // @[ctrl.scala 116:25]
      writes_done_3 <= 1'h0; // @[ctrl.scala 116:25]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (!(3'h1 == state)) begin // @[ctrl.scala 602:17]
        if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
          writes_done_3 <= _GEN_922;
        end
      end
    end
    if (reset) begin // @[ctrl.scala 117:26]
      next_buff_val <= 1'h0; // @[ctrl.scala 117:26]
    end else begin
      next_buff_val <= buffer_count >= mindex & _next_buff_val_T_1; // @[ctrl.scala 119:19]
    end
    io_aindex_REG <= aindex; // @[ctrl.scala 128:23]
    if (reset) begin // @[ctrl.scala 163:18]
      state <= 3'h0; // @[ctrl.scala 163:18]
    end else if (3'h0 == state) begin // @[ctrl.scala 602:17]
      if (canAbsorb) begin // @[ctrl.scala 605:20]
        state <= 3'h1; // @[ctrl.scala 607:13]
      end else begin
        state <= 3'h0; // @[ctrl.scala 609:13]
      end
    end else if (3'h1 == state) begin // @[ctrl.scala 602:17]
      if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
        state <= 3'h2; // @[ctrl.scala 625:13]
      end else begin
        state <= 3'h1; // @[ctrl.scala 627:13]
      end
    end else if (3'h2 == state) begin // @[ctrl.scala 602:17]
      state <= 3'h3; // @[ctrl.scala 633:11]
    end else begin
      state <= _GEN_911;
    end
    if (reset) begin // @[ctrl.scala 166:19]
      rindex <= 5'h19; // @[ctrl.scala 166:19]
    end else if (!(3'h0 == state)) begin // @[ctrl.scala 602:17]
      if (3'h1 == state) begin // @[ctrl.scala 602:17]
        if (io_aindex >= 5'h10) begin // @[ctrl.scala 616:48]
          rindex <= 5'h0; // @[ctrl.scala 617:14]
        end
      end else if (!(3'h2 == state)) begin // @[ctrl.scala 602:17]
        rindex <= _GEN_912;
      end
    end
    rindex_reg <= rindex; // @[ctrl.scala 183:23]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  msg_addr = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  hash_addr = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  msg_len = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  busy = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  dmem_resp_val_reg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dmem_resp_tag_reg = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  mem_s = _RAND_6[2:0];
  _RAND_7 = {2{`RANDOM}};
  buffer_0 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  buffer_1 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  buffer_2 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  buffer_3 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  buffer_4 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  buffer_5 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  buffer_6 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  buffer_7 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  buffer_8 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  buffer_9 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  buffer_10 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  buffer_11 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  buffer_12 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  buffer_13 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  buffer_14 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  buffer_15 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  buffer_16 = _RAND_23[63:0];
  _RAND_24 = {1{`RANDOM}};
  buffer_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  buffer_count = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  read = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  hashed = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  areg = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  mindex = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  windex = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  aindex = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  pindex = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  writes_done_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  writes_done_1 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  writes_done_2 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  writes_done_3 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  next_buff_val = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  io_aindex_REG = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  state = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  rindex = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  rindex_reg = _RAND_41[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ThetaModule(
  input  [63:0] io_state_i_0,
  input  [63:0] io_state_i_1,
  input  [63:0] io_state_i_2,
  input  [63:0] io_state_i_3,
  input  [63:0] io_state_i_4,
  input  [63:0] io_state_i_5,
  input  [63:0] io_state_i_6,
  input  [63:0] io_state_i_7,
  input  [63:0] io_state_i_8,
  input  [63:0] io_state_i_9,
  input  [63:0] io_state_i_10,
  input  [63:0] io_state_i_11,
  input  [63:0] io_state_i_12,
  input  [63:0] io_state_i_13,
  input  [63:0] io_state_i_14,
  input  [63:0] io_state_i_15,
  input  [63:0] io_state_i_16,
  input  [63:0] io_state_i_17,
  input  [63:0] io_state_i_18,
  input  [63:0] io_state_i_19,
  input  [63:0] io_state_i_20,
  input  [63:0] io_state_i_21,
  input  [63:0] io_state_i_22,
  input  [63:0] io_state_i_23,
  input  [63:0] io_state_i_24,
  output [63:0] io_state_o_0,
  output [63:0] io_state_o_1,
  output [63:0] io_state_o_2,
  output [63:0] io_state_o_3,
  output [63:0] io_state_o_4,
  output [63:0] io_state_o_5,
  output [63:0] io_state_o_6,
  output [63:0] io_state_o_7,
  output [63:0] io_state_o_8,
  output [63:0] io_state_o_9,
  output [63:0] io_state_o_10,
  output [63:0] io_state_o_11,
  output [63:0] io_state_o_12,
  output [63:0] io_state_o_13,
  output [63:0] io_state_o_14,
  output [63:0] io_state_o_15,
  output [63:0] io_state_o_16,
  output [63:0] io_state_o_17,
  output [63:0] io_state_o_18,
  output [63:0] io_state_o_19,
  output [63:0] io_state_o_20,
  output [63:0] io_state_o_21,
  output [63:0] io_state_o_22,
  output [63:0] io_state_o_23,
  output [63:0] io_state_o_24
);
  wire [63:0] _bc_0_T = io_state_i_0 ^ io_state_i_1; // @[theta.scala 21:32]
  wire [63:0] _bc_0_T_1 = _bc_0_T ^ io_state_i_2; // @[theta.scala 21:52]
  wire [63:0] _bc_0_T_2 = _bc_0_T_1 ^ io_state_i_3; // @[theta.scala 21:72]
  wire [63:0] bc_0 = _bc_0_T_2 ^ io_state_i_4; // @[theta.scala 21:92]
  wire [63:0] _bc_1_T = io_state_i_5 ^ io_state_i_6; // @[theta.scala 21:32]
  wire [63:0] _bc_1_T_1 = _bc_1_T ^ io_state_i_7; // @[theta.scala 21:52]
  wire [63:0] _bc_1_T_2 = _bc_1_T_1 ^ io_state_i_8; // @[theta.scala 21:72]
  wire [63:0] bc_1 = _bc_1_T_2 ^ io_state_i_9; // @[theta.scala 21:92]
  wire [63:0] _bc_2_T = io_state_i_10 ^ io_state_i_11; // @[theta.scala 21:32]
  wire [63:0] _bc_2_T_1 = _bc_2_T ^ io_state_i_12; // @[theta.scala 21:52]
  wire [63:0] _bc_2_T_2 = _bc_2_T_1 ^ io_state_i_13; // @[theta.scala 21:72]
  wire [63:0] bc_2 = _bc_2_T_2 ^ io_state_i_14; // @[theta.scala 21:92]
  wire [63:0] _bc_3_T = io_state_i_15 ^ io_state_i_16; // @[theta.scala 21:32]
  wire [63:0] _bc_3_T_1 = _bc_3_T ^ io_state_i_17; // @[theta.scala 21:52]
  wire [63:0] _bc_3_T_2 = _bc_3_T_1 ^ io_state_i_18; // @[theta.scala 21:72]
  wire [63:0] bc_3 = _bc_3_T_2 ^ io_state_i_19; // @[theta.scala 21:92]
  wire [63:0] _bc_4_T = io_state_i_20 ^ io_state_i_21; // @[theta.scala 21:32]
  wire [63:0] _bc_4_T_1 = _bc_4_T ^ io_state_i_22; // @[theta.scala 21:52]
  wire [63:0] _bc_4_T_2 = _bc_4_T_1 ^ io_state_i_23; // @[theta.scala 21:72]
  wire [63:0] bc_4 = _bc_4_T_2 ^ io_state_i_24; // @[theta.scala 21:92]
  wire [64:0] _t_T = {bc_1, 1'h0}; // @[common.scala 24:47]
  wire [6:0] _t_T_2 = 7'h40 - 7'h1; // @[common.scala 24:68]
  wire [63:0] _t_T_3 = bc_1 >> _t_T_2; // @[common.scala 24:62]
  wire [64:0] _GEN_0 = {{1'd0}, _t_T_3}; // @[common.scala 24:55]
  wire [64:0] _t_T_4 = _t_T | _GEN_0; // @[common.scala 24:55]
  wire [64:0] _GEN_1 = {{1'd0}, bc_4}; // @[theta.scala 26:22]
  wire [64:0] _t_T_5 = _GEN_1 ^ _t_T_4; // @[theta.scala 26:22]
  wire [63:0] t = _t_T_5[63:0]; // @[theta.scala 25:17 26:7]
  wire [64:0] _t_T_6 = {bc_2, 1'h0}; // @[common.scala 24:47]
  wire [63:0] _t_T_9 = bc_2 >> _t_T_2; // @[common.scala 24:62]
  wire [64:0] _GEN_2 = {{1'd0}, _t_T_9}; // @[common.scala 24:55]
  wire [64:0] _t_T_10 = _t_T_6 | _GEN_2; // @[common.scala 24:55]
  wire [64:0] _GEN_3 = {{1'd0}, bc_0}; // @[theta.scala 26:22]
  wire [64:0] _t_T_11 = _GEN_3 ^ _t_T_10; // @[theta.scala 26:22]
  wire [63:0] t_1 = _t_T_11[63:0]; // @[theta.scala 25:17 26:7]
  wire [64:0] _t_T_12 = {bc_3, 1'h0}; // @[common.scala 24:47]
  wire [63:0] _t_T_15 = bc_3 >> _t_T_2; // @[common.scala 24:62]
  wire [64:0] _GEN_4 = {{1'd0}, _t_T_15}; // @[common.scala 24:55]
  wire [64:0] _t_T_16 = _t_T_12 | _GEN_4; // @[common.scala 24:55]
  wire [64:0] _GEN_5 = {{1'd0}, bc_1}; // @[theta.scala 26:22]
  wire [64:0] _t_T_17 = _GEN_5 ^ _t_T_16; // @[theta.scala 26:22]
  wire [63:0] t_2 = _t_T_17[63:0]; // @[theta.scala 25:17 26:7]
  wire [64:0] _t_T_18 = {bc_4, 1'h0}; // @[common.scala 24:47]
  wire [63:0] _t_T_21 = bc_4 >> _t_T_2; // @[common.scala 24:62]
  wire [64:0] _GEN_6 = {{1'd0}, _t_T_21}; // @[common.scala 24:55]
  wire [64:0] _t_T_22 = _t_T_18 | _GEN_6; // @[common.scala 24:55]
  wire [64:0] _GEN_7 = {{1'd0}, bc_2}; // @[theta.scala 26:22]
  wire [64:0] _t_T_23 = _GEN_7 ^ _t_T_22; // @[theta.scala 26:22]
  wire [63:0] t_3 = _t_T_23[63:0]; // @[theta.scala 25:17 26:7]
  wire [64:0] _t_T_24 = {bc_0, 1'h0}; // @[common.scala 24:47]
  wire [63:0] _t_T_27 = bc_0 >> _t_T_2; // @[common.scala 24:62]
  wire [64:0] _GEN_8 = {{1'd0}, _t_T_27}; // @[common.scala 24:55]
  wire [64:0] _t_T_28 = _t_T_24 | _GEN_8; // @[common.scala 24:55]
  wire [64:0] _GEN_9 = {{1'd0}, bc_3}; // @[theta.scala 26:22]
  wire [64:0] _t_T_29 = _GEN_9 ^ _t_T_28; // @[theta.scala 26:22]
  wire [63:0] t_4 = _t_T_29[63:0]; // @[theta.scala 25:17 26:7]
  assign io_state_o_0 = io_state_i_0 ^ t; // @[theta.scala 28:46]
  assign io_state_o_1 = io_state_i_1 ^ t; // @[theta.scala 28:46]
  assign io_state_o_2 = io_state_i_2 ^ t; // @[theta.scala 28:46]
  assign io_state_o_3 = io_state_i_3 ^ t; // @[theta.scala 28:46]
  assign io_state_o_4 = io_state_i_4 ^ t; // @[theta.scala 28:46]
  assign io_state_o_5 = io_state_i_5 ^ t_1; // @[theta.scala 28:46]
  assign io_state_o_6 = io_state_i_6 ^ t_1; // @[theta.scala 28:46]
  assign io_state_o_7 = io_state_i_7 ^ t_1; // @[theta.scala 28:46]
  assign io_state_o_8 = io_state_i_8 ^ t_1; // @[theta.scala 28:46]
  assign io_state_o_9 = io_state_i_9 ^ t_1; // @[theta.scala 28:46]
  assign io_state_o_10 = io_state_i_10 ^ t_2; // @[theta.scala 28:46]
  assign io_state_o_11 = io_state_i_11 ^ t_2; // @[theta.scala 28:46]
  assign io_state_o_12 = io_state_i_12 ^ t_2; // @[theta.scala 28:46]
  assign io_state_o_13 = io_state_i_13 ^ t_2; // @[theta.scala 28:46]
  assign io_state_o_14 = io_state_i_14 ^ t_2; // @[theta.scala 28:46]
  assign io_state_o_15 = io_state_i_15 ^ t_3; // @[theta.scala 28:46]
  assign io_state_o_16 = io_state_i_16 ^ t_3; // @[theta.scala 28:46]
  assign io_state_o_17 = io_state_i_17 ^ t_3; // @[theta.scala 28:46]
  assign io_state_o_18 = io_state_i_18 ^ t_3; // @[theta.scala 28:46]
  assign io_state_o_19 = io_state_i_19 ^ t_3; // @[theta.scala 28:46]
  assign io_state_o_20 = io_state_i_20 ^ t_4; // @[theta.scala 28:46]
  assign io_state_o_21 = io_state_i_21 ^ t_4; // @[theta.scala 28:46]
  assign io_state_o_22 = io_state_i_22 ^ t_4; // @[theta.scala 28:46]
  assign io_state_o_23 = io_state_i_23 ^ t_4; // @[theta.scala 28:46]
  assign io_state_o_24 = io_state_i_24 ^ t_4; // @[theta.scala 28:46]
endmodule
module RhoPiModule(
  input  [63:0] io_state_i_0,
  input  [63:0] io_state_i_1,
  input  [63:0] io_state_i_2,
  input  [63:0] io_state_i_3,
  input  [63:0] io_state_i_4,
  input  [63:0] io_state_i_5,
  input  [63:0] io_state_i_6,
  input  [63:0] io_state_i_7,
  input  [63:0] io_state_i_8,
  input  [63:0] io_state_i_9,
  input  [63:0] io_state_i_10,
  input  [63:0] io_state_i_11,
  input  [63:0] io_state_i_12,
  input  [63:0] io_state_i_13,
  input  [63:0] io_state_i_14,
  input  [63:0] io_state_i_15,
  input  [63:0] io_state_i_16,
  input  [63:0] io_state_i_17,
  input  [63:0] io_state_i_18,
  input  [63:0] io_state_i_19,
  input  [63:0] io_state_i_20,
  input  [63:0] io_state_i_21,
  input  [63:0] io_state_i_22,
  input  [63:0] io_state_i_23,
  input  [63:0] io_state_i_24,
  output [63:0] io_state_o_0,
  output [63:0] io_state_o_1,
  output [63:0] io_state_o_2,
  output [63:0] io_state_o_3,
  output [63:0] io_state_o_4,
  output [63:0] io_state_o_5,
  output [63:0] io_state_o_6,
  output [63:0] io_state_o_7,
  output [63:0] io_state_o_8,
  output [63:0] io_state_o_9,
  output [63:0] io_state_o_10,
  output [63:0] io_state_o_11,
  output [63:0] io_state_o_12,
  output [63:0] io_state_o_13,
  output [63:0] io_state_o_14,
  output [63:0] io_state_o_15,
  output [63:0] io_state_o_16,
  output [63:0] io_state_o_17,
  output [63:0] io_state_o_18,
  output [63:0] io_state_o_19,
  output [63:0] io_state_o_20,
  output [63:0] io_state_o_21,
  output [63:0] io_state_o_22,
  output [63:0] io_state_o_23,
  output [63:0] io_state_o_24
);
  wire [64:0] temp_1 = {io_state_i_1[28:0],io_state_i_1[63:28]}; // @[Cat.scala 31:58]
  wire [64:0] temp_2 = {io_state_i_2[61:0],io_state_i_2[63:61]}; // @[Cat.scala 31:58]
  wire [64:0] temp_3 = {io_state_i_3[23:0],io_state_i_3[63:23]}; // @[Cat.scala 31:58]
  wire [64:0] temp_4 = {io_state_i_4[46:0],io_state_i_4[63:46]}; // @[Cat.scala 31:58]
  wire [64:0] temp_5 = {io_state_i_5,io_state_i_5[63]}; // @[Cat.scala 31:58]
  wire [64:0] temp_6 = {io_state_i_6[20:0],io_state_i_6[63:20]}; // @[Cat.scala 31:58]
  wire [64:0] temp_7 = {io_state_i_7[54:0],io_state_i_7[63:54]}; // @[Cat.scala 31:58]
  wire [64:0] temp_8 = {io_state_i_8[19:0],io_state_i_8[63:19]}; // @[Cat.scala 31:58]
  wire [64:0] temp_9 = {io_state_i_9[62:0],io_state_i_9[63:62]}; // @[Cat.scala 31:58]
  wire [64:0] temp_10 = {io_state_i_10[2:0],io_state_i_10[63:2]}; // @[Cat.scala 31:58]
  wire [64:0] temp_11 = {io_state_i_11[58:0],io_state_i_11[63:58]}; // @[Cat.scala 31:58]
  wire [64:0] temp_12 = {io_state_i_12[21:0],io_state_i_12[63:21]}; // @[Cat.scala 31:58]
  wire [64:0] temp_13 = {io_state_i_13[49:0],io_state_i_13[63:49]}; // @[Cat.scala 31:58]
  wire [64:0] temp_14 = {io_state_i_14[3:0],io_state_i_14[63:3]}; // @[Cat.scala 31:58]
  wire [64:0] temp_15 = {io_state_i_15[36:0],io_state_i_15[63:36]}; // @[Cat.scala 31:58]
  wire [64:0] temp_16 = {io_state_i_16[9:0],io_state_i_16[63:9]}; // @[Cat.scala 31:58]
  wire [64:0] temp_17 = {io_state_i_17[39:0],io_state_i_17[63:39]}; // @[Cat.scala 31:58]
  wire [64:0] temp_18 = {io_state_i_18[43:0],io_state_i_18[63:43]}; // @[Cat.scala 31:58]
  wire [64:0] temp_19 = {io_state_i_19[8:0],io_state_i_19[63:8]}; // @[Cat.scala 31:58]
  wire [64:0] temp_20 = {io_state_i_20[37:0],io_state_i_20[63:37]}; // @[Cat.scala 31:58]
  wire [64:0] temp_21 = {io_state_i_21[44:0],io_state_i_21[63:44]}; // @[Cat.scala 31:58]
  wire [64:0] temp_22 = {io_state_i_22[25:0],io_state_i_22[63:25]}; // @[Cat.scala 31:58]
  wire [64:0] temp_23 = {io_state_i_23[56:0],io_state_i_23[63:56]}; // @[Cat.scala 31:58]
  wire [64:0] temp_24 = {io_state_i_24[50:0],io_state_i_24[63:50]}; // @[Cat.scala 31:58]
  assign io_state_o_0 = io_state_i_0; // @[rhopi.scala 39:22 41:14]
  assign io_state_o_1 = temp_15[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_2 = temp_5[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_3 = temp_20[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_4 = temp_10[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_5 = temp_6[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_6 = temp_21[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_7 = temp_11[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_8 = temp_1[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_9 = temp_16[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_10 = temp_12[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_11 = temp_2[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_12 = temp_17[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_13 = temp_7[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_14 = temp_22[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_15 = temp_18[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_16 = temp_8[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_17 = temp_23[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_18 = temp_13[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_19 = temp_3[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_20 = temp_24[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_21 = temp_14[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_22 = temp_4[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_23 = temp_19[63:0]; // @[rhopi.scala 45:37]
  assign io_state_o_24 = temp_9[63:0]; // @[rhopi.scala 45:37]
endmodule
module ChiModule(
  input  [63:0] io_state_i_0,
  input  [63:0] io_state_i_1,
  input  [63:0] io_state_i_2,
  input  [63:0] io_state_i_3,
  input  [63:0] io_state_i_4,
  input  [63:0] io_state_i_5,
  input  [63:0] io_state_i_6,
  input  [63:0] io_state_i_7,
  input  [63:0] io_state_i_8,
  input  [63:0] io_state_i_9,
  input  [63:0] io_state_i_10,
  input  [63:0] io_state_i_11,
  input  [63:0] io_state_i_12,
  input  [63:0] io_state_i_13,
  input  [63:0] io_state_i_14,
  input  [63:0] io_state_i_15,
  input  [63:0] io_state_i_16,
  input  [63:0] io_state_i_17,
  input  [63:0] io_state_i_18,
  input  [63:0] io_state_i_19,
  input  [63:0] io_state_i_20,
  input  [63:0] io_state_i_21,
  input  [63:0] io_state_i_22,
  input  [63:0] io_state_i_23,
  input  [63:0] io_state_i_24,
  output [63:0] io_state_o_0,
  output [63:0] io_state_o_1,
  output [63:0] io_state_o_2,
  output [63:0] io_state_o_3,
  output [63:0] io_state_o_4,
  output [63:0] io_state_o_5,
  output [63:0] io_state_o_6,
  output [63:0] io_state_o_7,
  output [63:0] io_state_o_8,
  output [63:0] io_state_o_9,
  output [63:0] io_state_o_10,
  output [63:0] io_state_o_11,
  output [63:0] io_state_o_12,
  output [63:0] io_state_o_13,
  output [63:0] io_state_o_14,
  output [63:0] io_state_o_15,
  output [63:0] io_state_o_16,
  output [63:0] io_state_o_17,
  output [63:0] io_state_o_18,
  output [63:0] io_state_o_19,
  output [63:0] io_state_o_20,
  output [63:0] io_state_o_21,
  output [63:0] io_state_o_22,
  output [63:0] io_state_o_23,
  output [63:0] io_state_o_24
);
  wire [63:0] _T = ~io_state_i_5; // @[chi.scala 22:10]
  wire [63:0] _T_1 = _T & io_state_i_10; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_1_T = ~io_state_i_6; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_1_T_1 = _io_state_o_1_T & io_state_i_11; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_2_T = ~io_state_i_7; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_2_T_1 = _io_state_o_2_T & io_state_i_12; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_3_T = ~io_state_i_8; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_3_T_1 = _io_state_o_3_T & io_state_i_13; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_4_T = ~io_state_i_9; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_4_T_1 = _io_state_o_4_T & io_state_i_14; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_5_T = ~io_state_i_10; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_5_T_1 = _io_state_o_5_T & io_state_i_15; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_6_T = ~io_state_i_11; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_6_T_1 = _io_state_o_6_T & io_state_i_16; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_7_T = ~io_state_i_12; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_7_T_1 = _io_state_o_7_T & io_state_i_17; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_8_T = ~io_state_i_13; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_8_T_1 = _io_state_o_8_T & io_state_i_18; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_9_T = ~io_state_i_14; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_9_T_1 = _io_state_o_9_T & io_state_i_19; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_10_T = ~io_state_i_15; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_10_T_1 = _io_state_o_10_T & io_state_i_20; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_11_T = ~io_state_i_16; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_11_T_1 = _io_state_o_11_T & io_state_i_21; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_12_T = ~io_state_i_17; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_12_T_1 = _io_state_o_12_T & io_state_i_22; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_13_T = ~io_state_i_18; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_13_T_1 = _io_state_o_13_T & io_state_i_23; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_14_T = ~io_state_i_19; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_14_T_1 = _io_state_o_14_T & io_state_i_24; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_15_T = ~io_state_i_20; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_15_T_1 = _io_state_o_15_T & io_state_i_0; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_16_T = ~io_state_i_21; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_16_T_1 = _io_state_o_16_T & io_state_i_1; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_17_T = ~io_state_i_22; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_17_T_1 = _io_state_o_17_T & io_state_i_2; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_18_T = ~io_state_i_23; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_18_T_1 = _io_state_o_18_T & io_state_i_3; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_19_T = ~io_state_i_24; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_19_T_1 = _io_state_o_19_T & io_state_i_4; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_20_T = ~io_state_i_0; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_20_T_1 = _io_state_o_20_T & io_state_i_5; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_21_T = ~io_state_i_1; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_21_T_1 = _io_state_o_21_T & io_state_i_6; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_22_T = ~io_state_i_2; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_22_T_1 = _io_state_o_22_T & io_state_i_7; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_23_T = ~io_state_i_3; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_23_T_1 = _io_state_o_23_T & io_state_i_8; // @[chi.scala 22:44]
  wire [63:0] _io_state_o_24_T = ~io_state_i_4; // @[chi.scala 22:10]
  wire [63:0] _io_state_o_24_T_1 = _io_state_o_24_T & io_state_i_9; // @[chi.scala 22:44]
  assign io_state_o_0 = io_state_i_0 ^ _T_1; // @[chi.scala 21:46]
  assign io_state_o_1 = io_state_i_1 ^ _io_state_o_1_T_1; // @[chi.scala 21:46]
  assign io_state_o_2 = io_state_i_2 ^ _io_state_o_2_T_1; // @[chi.scala 21:46]
  assign io_state_o_3 = io_state_i_3 ^ _io_state_o_3_T_1; // @[chi.scala 21:46]
  assign io_state_o_4 = io_state_i_4 ^ _io_state_o_4_T_1; // @[chi.scala 21:46]
  assign io_state_o_5 = io_state_i_5 ^ _io_state_o_5_T_1; // @[chi.scala 21:46]
  assign io_state_o_6 = io_state_i_6 ^ _io_state_o_6_T_1; // @[chi.scala 21:46]
  assign io_state_o_7 = io_state_i_7 ^ _io_state_o_7_T_1; // @[chi.scala 21:46]
  assign io_state_o_8 = io_state_i_8 ^ _io_state_o_8_T_1; // @[chi.scala 21:46]
  assign io_state_o_9 = io_state_i_9 ^ _io_state_o_9_T_1; // @[chi.scala 21:46]
  assign io_state_o_10 = io_state_i_10 ^ _io_state_o_10_T_1; // @[chi.scala 21:46]
  assign io_state_o_11 = io_state_i_11 ^ _io_state_o_11_T_1; // @[chi.scala 21:46]
  assign io_state_o_12 = io_state_i_12 ^ _io_state_o_12_T_1; // @[chi.scala 21:46]
  assign io_state_o_13 = io_state_i_13 ^ _io_state_o_13_T_1; // @[chi.scala 21:46]
  assign io_state_o_14 = io_state_i_14 ^ _io_state_o_14_T_1; // @[chi.scala 21:46]
  assign io_state_o_15 = io_state_i_15 ^ _io_state_o_15_T_1; // @[chi.scala 21:46]
  assign io_state_o_16 = io_state_i_16 ^ _io_state_o_16_T_1; // @[chi.scala 21:46]
  assign io_state_o_17 = io_state_i_17 ^ _io_state_o_17_T_1; // @[chi.scala 21:46]
  assign io_state_o_18 = io_state_i_18 ^ _io_state_o_18_T_1; // @[chi.scala 21:46]
  assign io_state_o_19 = io_state_i_19 ^ _io_state_o_19_T_1; // @[chi.scala 21:46]
  assign io_state_o_20 = io_state_i_20 ^ _io_state_o_20_T_1; // @[chi.scala 21:46]
  assign io_state_o_21 = io_state_i_21 ^ _io_state_o_21_T_1; // @[chi.scala 21:46]
  assign io_state_o_22 = io_state_i_22 ^ _io_state_o_22_T_1; // @[chi.scala 21:46]
  assign io_state_o_23 = io_state_i_23 ^ _io_state_o_23_T_1; // @[chi.scala 21:46]
  assign io_state_o_24 = io_state_i_24 ^ _io_state_o_24_T_1; // @[chi.scala 21:46]
endmodule
module IotaModule(
  input  [63:0] io_state_i_0,
  input  [63:0] io_state_i_1,
  input  [63:0] io_state_i_2,
  input  [63:0] io_state_i_3,
  input  [63:0] io_state_i_4,
  input  [63:0] io_state_i_5,
  input  [63:0] io_state_i_6,
  input  [63:0] io_state_i_7,
  input  [63:0] io_state_i_8,
  input  [63:0] io_state_i_9,
  input  [63:0] io_state_i_10,
  input  [63:0] io_state_i_11,
  input  [63:0] io_state_i_12,
  input  [63:0] io_state_i_13,
  input  [63:0] io_state_i_14,
  input  [63:0] io_state_i_15,
  input  [63:0] io_state_i_16,
  input  [63:0] io_state_i_17,
  input  [63:0] io_state_i_18,
  input  [63:0] io_state_i_19,
  input  [63:0] io_state_i_20,
  input  [63:0] io_state_i_21,
  input  [63:0] io_state_i_22,
  input  [63:0] io_state_i_23,
  input  [63:0] io_state_i_24,
  output [63:0] io_state_o_0,
  output [63:0] io_state_o_1,
  output [63:0] io_state_o_2,
  output [63:0] io_state_o_3,
  output [63:0] io_state_o_4,
  output [63:0] io_state_o_5,
  output [63:0] io_state_o_6,
  output [63:0] io_state_o_7,
  output [63:0] io_state_o_8,
  output [63:0] io_state_o_9,
  output [63:0] io_state_o_10,
  output [63:0] io_state_o_11,
  output [63:0] io_state_o_12,
  output [63:0] io_state_o_13,
  output [63:0] io_state_o_14,
  output [63:0] io_state_o_15,
  output [63:0] io_state_o_16,
  output [63:0] io_state_o_17,
  output [63:0] io_state_o_18,
  output [63:0] io_state_o_19,
  output [63:0] io_state_o_20,
  output [63:0] io_state_o_21,
  output [63:0] io_state_o_22,
  output [63:0] io_state_o_23,
  output [63:0] io_state_o_24,
  input  [4:0]  io_round
);
  wire [63:0] _GEN_1 = 5'h1 == io_round ? 64'h8082 : 64'h1; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_2 = 5'h2 == io_round ? 64'h800000000000808a : _GEN_1; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_3 = 5'h3 == io_round ? 64'h8000000080008000 : _GEN_2; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_4 = 5'h4 == io_round ? 64'h808b : _GEN_3; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_5 = 5'h5 == io_round ? 64'h80000001 : _GEN_4; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_6 = 5'h6 == io_round ? 64'h8000000080008081 : _GEN_5; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_7 = 5'h7 == io_round ? 64'h8000000000008009 : _GEN_6; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_8 = 5'h8 == io_round ? 64'h8a : _GEN_7; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_9 = 5'h9 == io_round ? 64'h88 : _GEN_8; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_10 = 5'ha == io_round ? 64'h80008009 : _GEN_9; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_11 = 5'hb == io_round ? 64'h8000000a : _GEN_10; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_12 = 5'hc == io_round ? 64'h8000808b : _GEN_11; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_13 = 5'hd == io_round ? 64'h800000000000008b : _GEN_12; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_14 = 5'he == io_round ? 64'h8000000000008089 : _GEN_13; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_15 = 5'hf == io_round ? 64'h8000000000008003 : _GEN_14; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_16 = 5'h10 == io_round ? 64'h8000000000008002 : _GEN_15; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_17 = 5'h11 == io_round ? 64'h8000000000000080 : _GEN_16; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_18 = 5'h12 == io_round ? 64'h800a : _GEN_17; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_19 = 5'h13 == io_round ? 64'h800000008000000a : _GEN_18; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_20 = 5'h14 == io_round ? 64'h8000000080008081 : _GEN_19; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_21 = 5'h15 == io_round ? 64'h8000000000008080 : _GEN_20; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_22 = 5'h16 == io_round ? 64'h80000001 : _GEN_21; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_23 = 5'h17 == io_round ? 64'h8000000080008008 : _GEN_22; // @[iota.scala 27:{34,34}]
  wire [63:0] _GEN_24 = 5'h18 == io_round ? 64'h0 : _GEN_23; // @[iota.scala 27:{34,34}]
  assign io_state_o_0 = io_state_i_0 ^ _GEN_24; // @[iota.scala 27:34]
  assign io_state_o_1 = io_state_i_1; // @[iota.scala 22:27]
  assign io_state_o_2 = io_state_i_2; // @[iota.scala 22:27]
  assign io_state_o_3 = io_state_i_3; // @[iota.scala 22:27]
  assign io_state_o_4 = io_state_i_4; // @[iota.scala 22:27]
  assign io_state_o_5 = io_state_i_5; // @[iota.scala 22:27]
  assign io_state_o_6 = io_state_i_6; // @[iota.scala 22:27]
  assign io_state_o_7 = io_state_i_7; // @[iota.scala 22:27]
  assign io_state_o_8 = io_state_i_8; // @[iota.scala 22:27]
  assign io_state_o_9 = io_state_i_9; // @[iota.scala 22:27]
  assign io_state_o_10 = io_state_i_10; // @[iota.scala 22:27]
  assign io_state_o_11 = io_state_i_11; // @[iota.scala 22:27]
  assign io_state_o_12 = io_state_i_12; // @[iota.scala 22:27]
  assign io_state_o_13 = io_state_i_13; // @[iota.scala 22:27]
  assign io_state_o_14 = io_state_i_14; // @[iota.scala 22:27]
  assign io_state_o_15 = io_state_i_15; // @[iota.scala 22:27]
  assign io_state_o_16 = io_state_i_16; // @[iota.scala 22:27]
  assign io_state_o_17 = io_state_i_17; // @[iota.scala 22:27]
  assign io_state_o_18 = io_state_i_18; // @[iota.scala 22:27]
  assign io_state_o_19 = io_state_i_19; // @[iota.scala 22:27]
  assign io_state_o_20 = io_state_i_20; // @[iota.scala 22:27]
  assign io_state_o_21 = io_state_i_21; // @[iota.scala 22:27]
  assign io_state_o_22 = io_state_i_22; // @[iota.scala 22:27]
  assign io_state_o_23 = io_state_i_23; // @[iota.scala 22:27]
  assign io_state_o_24 = io_state_i_24; // @[iota.scala 22:27]
endmodule
module DpathModule(
  input         clock,
  input         reset,
  input         io_absorb,
  input         io_init,
  input         io_write,
  input  [4:0]  io_round,
  input  [4:0]  io_aindex,
  input  [63:0] io_message_in,
  output [63:0] io_hash_out_0,
  output [63:0] io_hash_out_1,
  output [63:0] io_hash_out_2,
  output [63:0] io_hash_out_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] ThetaModule_io_state_i_0; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_1; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_2; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_3; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_4; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_5; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_6; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_7; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_8; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_9; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_10; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_11; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_12; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_13; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_14; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_15; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_16; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_17; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_18; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_19; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_20; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_21; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_22; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_23; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_i_24; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_0; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_1; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_2; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_3; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_4; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_5; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_6; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_7; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_8; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_9; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_10; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_11; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_12; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_13; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_14; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_15; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_16; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_17; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_18; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_19; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_20; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_21; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_22; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_23; // @[dpath.scala 34:21]
  wire [63:0] ThetaModule_io_state_o_24; // @[dpath.scala 34:21]
  wire [63:0] RhoPiModule_io_state_i_0; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_1; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_2; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_3; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_4; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_5; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_6; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_7; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_8; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_9; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_10; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_11; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_12; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_13; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_14; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_15; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_16; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_17; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_18; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_19; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_20; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_21; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_22; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_23; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_i_24; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_0; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_1; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_2; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_3; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_4; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_5; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_6; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_7; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_8; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_9; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_10; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_11; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_12; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_13; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_14; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_15; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_16; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_17; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_18; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_19; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_20; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_21; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_22; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_23; // @[dpath.scala 35:21]
  wire [63:0] RhoPiModule_io_state_o_24; // @[dpath.scala 35:21]
  wire [63:0] ChiModule_io_state_i_0; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_1; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_2; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_3; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_4; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_5; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_6; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_7; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_8; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_9; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_10; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_11; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_12; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_13; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_14; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_15; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_16; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_17; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_18; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_19; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_20; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_21; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_22; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_23; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_i_24; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_0; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_1; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_2; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_3; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_4; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_5; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_6; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_7; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_8; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_9; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_10; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_11; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_12; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_13; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_14; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_15; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_16; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_17; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_18; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_19; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_20; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_21; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_22; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_23; // @[dpath.scala 36:21]
  wire [63:0] ChiModule_io_state_o_24; // @[dpath.scala 36:21]
  wire [63:0] iota_io_state_i_0; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_1; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_2; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_3; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_4; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_5; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_6; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_7; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_8; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_9; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_10; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_11; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_12; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_13; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_14; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_15; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_16; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_17; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_18; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_19; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_20; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_21; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_22; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_23; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_i_24; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_0; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_1; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_2; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_3; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_4; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_5; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_6; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_7; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_8; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_9; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_10; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_11; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_12; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_13; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_14; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_15; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_16; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_17; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_18; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_19; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_20; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_21; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_22; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_23; // @[dpath.scala 37:21]
  wire [63:0] iota_io_state_o_24; // @[dpath.scala 37:21]
  wire [4:0] iota_io_round; // @[dpath.scala 37:21]
  reg [63:0] state_0; // @[dpath.scala 31:18]
  reg [63:0] state_1; // @[dpath.scala 31:18]
  reg [63:0] state_2; // @[dpath.scala 31:18]
  reg [63:0] state_3; // @[dpath.scala 31:18]
  reg [63:0] state_4; // @[dpath.scala 31:18]
  reg [63:0] state_5; // @[dpath.scala 31:18]
  reg [63:0] state_6; // @[dpath.scala 31:18]
  reg [63:0] state_7; // @[dpath.scala 31:18]
  reg [63:0] state_8; // @[dpath.scala 31:18]
  reg [63:0] state_9; // @[dpath.scala 31:18]
  reg [63:0] state_10; // @[dpath.scala 31:18]
  reg [63:0] state_11; // @[dpath.scala 31:18]
  reg [63:0] state_12; // @[dpath.scala 31:18]
  reg [63:0] state_13; // @[dpath.scala 31:18]
  reg [63:0] state_14; // @[dpath.scala 31:18]
  reg [63:0] state_15; // @[dpath.scala 31:18]
  reg [63:0] state_16; // @[dpath.scala 31:18]
  reg [63:0] state_17; // @[dpath.scala 31:18]
  reg [63:0] state_18; // @[dpath.scala 31:18]
  reg [63:0] state_19; // @[dpath.scala 31:18]
  reg [63:0] state_20; // @[dpath.scala 31:18]
  reg [63:0] state_21; // @[dpath.scala 31:18]
  reg [63:0] state_22; // @[dpath.scala 31:18]
  reg [63:0] state_23; // @[dpath.scala 31:18]
  reg [63:0] state_24; // @[dpath.scala 31:18]
  wire [63:0] _GEN_0 = iota_io_state_o_0; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_1 = iota_io_state_o_1; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_2 = iota_io_state_o_2; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_3 = iota_io_state_o_3; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_4 = iota_io_state_o_4; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_5 = iota_io_state_o_5; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_6 = iota_io_state_o_6; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_7 = iota_io_state_o_7; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_8 = iota_io_state_o_8; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_9 = iota_io_state_o_9; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_10 = iota_io_state_o_10; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_11 = iota_io_state_o_11; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_12 = iota_io_state_o_12; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_13 = iota_io_state_o_13; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_14 = iota_io_state_o_14; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_15 = iota_io_state_o_15; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_16 = iota_io_state_o_16; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_17 = iota_io_state_o_17; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_18 = iota_io_state_o_18; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_19 = iota_io_state_o_19; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_20 = iota_io_state_o_20; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_21 = iota_io_state_o_21; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_22 = iota_io_state_o_22; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_23 = iota_io_state_o_23; // @[dpath.scala 74:19 77:17 49:21]
  wire [63:0] _GEN_24 = iota_io_state_o_24; // @[dpath.scala 74:19 77:17 49:21]
  wire [4:0] _GEN_25 = io_aindex % 5'h5; // @[dpath.scala 109:23]
  wire [2:0] _T_5 = _GEN_25[2:0]; // @[dpath.scala 109:23]
  wire [5:0] _T_6 = _T_5 * 3'h5; // @[dpath.scala 109:32]
  wire [4:0] _T_7 = io_aindex / 3'h5; // @[dpath.scala 109:51]
  wire [5:0] _GEN_200 = {{1'd0}, _T_7}; // @[dpath.scala 109:40]
  wire [5:0] _T_9 = _T_6 + _GEN_200; // @[dpath.scala 109:40]
  wire [63:0] _GEN_26 = 5'h1 == _T_9[4:0] ? state_1 : state_0; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_27 = 5'h2 == _T_9[4:0] ? state_2 : _GEN_26; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_28 = 5'h3 == _T_9[4:0] ? state_3 : _GEN_27; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_29 = 5'h4 == _T_9[4:0] ? state_4 : _GEN_28; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_30 = 5'h5 == _T_9[4:0] ? state_5 : _GEN_29; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_31 = 5'h6 == _T_9[4:0] ? state_6 : _GEN_30; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_32 = 5'h7 == _T_9[4:0] ? state_7 : _GEN_31; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_33 = 5'h8 == _T_9[4:0] ? state_8 : _GEN_32; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_34 = 5'h9 == _T_9[4:0] ? state_9 : _GEN_33; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_35 = 5'ha == _T_9[4:0] ? state_10 : _GEN_34; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_36 = 5'hb == _T_9[4:0] ? state_11 : _GEN_35; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_37 = 5'hc == _T_9[4:0] ? state_12 : _GEN_36; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_38 = 5'hd == _T_9[4:0] ? state_13 : _GEN_37; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_39 = 5'he == _T_9[4:0] ? state_14 : _GEN_38; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_40 = 5'hf == _T_9[4:0] ? state_15 : _GEN_39; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_41 = 5'h10 == _T_9[4:0] ? state_16 : _GEN_40; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_42 = 5'h11 == _T_9[4:0] ? state_17 : _GEN_41; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_43 = 5'h12 == _T_9[4:0] ? state_18 : _GEN_42; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_44 = 5'h13 == _T_9[4:0] ? state_19 : _GEN_43; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_45 = 5'h14 == _T_9[4:0] ? state_20 : _GEN_44; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_46 = 5'h15 == _T_9[4:0] ? state_21 : _GEN_45; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_47 = 5'h16 == _T_9[4:0] ? state_22 : _GEN_46; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_48 = 5'h17 == _T_9[4:0] ? state_23 : _GEN_47; // @[dpath.scala 110:{64,64}]
  wire [63:0] _GEN_49 = 5'h18 == _T_9[4:0] ? state_24 : _GEN_48; // @[dpath.scala 110:{64,64}]
  wire [63:0] _state_T_6 = _GEN_49 ^ io_message_in; // @[dpath.scala 110:64]
  wire [63:0] _GEN_50 = 5'h0 == _T_9[4:0] ? _state_T_6 : state_0; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_51 = 5'h1 == _T_9[4:0] ? _state_T_6 : state_1; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_52 = 5'h2 == _T_9[4:0] ? _state_T_6 : state_2; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_53 = 5'h3 == _T_9[4:0] ? _state_T_6 : state_3; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_54 = 5'h4 == _T_9[4:0] ? _state_T_6 : state_4; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_55 = 5'h5 == _T_9[4:0] ? _state_T_6 : state_5; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_56 = 5'h6 == _T_9[4:0] ? _state_T_6 : state_6; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_57 = 5'h7 == _T_9[4:0] ? _state_T_6 : state_7; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_58 = 5'h8 == _T_9[4:0] ? _state_T_6 : state_8; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_59 = 5'h9 == _T_9[4:0] ? _state_T_6 : state_9; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_60 = 5'ha == _T_9[4:0] ? _state_T_6 : state_10; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_61 = 5'hb == _T_9[4:0] ? _state_T_6 : state_11; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_62 = 5'hc == _T_9[4:0] ? _state_T_6 : state_12; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_63 = 5'hd == _T_9[4:0] ? _state_T_6 : state_13; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_64 = 5'he == _T_9[4:0] ? _state_T_6 : state_14; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_65 = 5'hf == _T_9[4:0] ? _state_T_6 : state_15; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_66 = 5'h10 == _T_9[4:0] ? _state_T_6 : state_16; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_67 = 5'h11 == _T_9[4:0] ? _state_T_6 : state_17; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_68 = 5'h12 == _T_9[4:0] ? _state_T_6 : state_18; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_69 = 5'h13 == _T_9[4:0] ? _state_T_6 : state_19; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_70 = 5'h14 == _T_9[4:0] ? _state_T_6 : state_20; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_71 = 5'h15 == _T_9[4:0] ? _state_T_6 : state_21; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_72 = 5'h16 == _T_9[4:0] ? _state_T_6 : state_22; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_73 = 5'h17 == _T_9[4:0] ? _state_T_6 : state_23; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_74 = 5'h18 == _T_9[4:0] ? _state_T_6 : state_24; // @[dpath.scala 104:11 109:{62,62}]
  wire [63:0] _GEN_75 = io_aindex < 5'h11 ? _GEN_50 : state_0; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_76 = io_aindex < 5'h11 ? _GEN_51 : state_1; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_77 = io_aindex < 5'h11 ? _GEN_52 : state_2; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_78 = io_aindex < 5'h11 ? _GEN_53 : state_3; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_79 = io_aindex < 5'h11 ? _GEN_54 : state_4; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_80 = io_aindex < 5'h11 ? _GEN_55 : state_5; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_81 = io_aindex < 5'h11 ? _GEN_56 : state_6; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_82 = io_aindex < 5'h11 ? _GEN_57 : state_7; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_83 = io_aindex < 5'h11 ? _GEN_58 : state_8; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_84 = io_aindex < 5'h11 ? _GEN_59 : state_9; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_85 = io_aindex < 5'h11 ? _GEN_60 : state_10; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_86 = io_aindex < 5'h11 ? _GEN_61 : state_11; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_87 = io_aindex < 5'h11 ? _GEN_62 : state_12; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_88 = io_aindex < 5'h11 ? _GEN_63 : state_13; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_89 = io_aindex < 5'h11 ? _GEN_64 : state_14; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_90 = io_aindex < 5'h11 ? _GEN_65 : state_15; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_91 = io_aindex < 5'h11 ? _GEN_66 : state_16; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_92 = io_aindex < 5'h11 ? _GEN_67 : state_17; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_93 = io_aindex < 5'h11 ? _GEN_68 : state_18; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_94 = io_aindex < 5'h11 ? _GEN_69 : state_19; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_95 = io_aindex < 5'h11 ? _GEN_70 : state_20; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_96 = io_aindex < 5'h11 ? _GEN_71 : state_21; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_97 = io_aindex < 5'h11 ? _GEN_72 : state_22; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_98 = io_aindex < 5'h11 ? _GEN_73 : state_23; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_99 = io_aindex < 5'h11 ? _GEN_74 : state_24; // @[dpath.scala 104:11 108:45]
  wire [63:0] _GEN_100 = io_absorb ? _GEN_75 : _GEN_0; // @[dpath.scala 103:18]
  wire [63:0] _GEN_101 = io_absorb ? _GEN_76 : _GEN_1; // @[dpath.scala 103:18]
  wire [63:0] _GEN_102 = io_absorb ? _GEN_77 : _GEN_2; // @[dpath.scala 103:18]
  wire [63:0] _GEN_103 = io_absorb ? _GEN_78 : _GEN_3; // @[dpath.scala 103:18]
  wire [63:0] _GEN_104 = io_absorb ? _GEN_79 : _GEN_4; // @[dpath.scala 103:18]
  wire [63:0] _GEN_105 = io_absorb ? _GEN_80 : _GEN_5; // @[dpath.scala 103:18]
  wire [63:0] _GEN_106 = io_absorb ? _GEN_81 : _GEN_6; // @[dpath.scala 103:18]
  wire [63:0] _GEN_107 = io_absorb ? _GEN_82 : _GEN_7; // @[dpath.scala 103:18]
  wire [63:0] _GEN_108 = io_absorb ? _GEN_83 : _GEN_8; // @[dpath.scala 103:18]
  wire [63:0] _GEN_109 = io_absorb ? _GEN_84 : _GEN_9; // @[dpath.scala 103:18]
  wire [63:0] _GEN_110 = io_absorb ? _GEN_85 : _GEN_10; // @[dpath.scala 103:18]
  wire [63:0] _GEN_111 = io_absorb ? _GEN_86 : _GEN_11; // @[dpath.scala 103:18]
  wire [63:0] _GEN_112 = io_absorb ? _GEN_87 : _GEN_12; // @[dpath.scala 103:18]
  wire [63:0] _GEN_113 = io_absorb ? _GEN_88 : _GEN_13; // @[dpath.scala 103:18]
  wire [63:0] _GEN_114 = io_absorb ? _GEN_89 : _GEN_14; // @[dpath.scala 103:18]
  wire [63:0] _GEN_115 = io_absorb ? _GEN_90 : _GEN_15; // @[dpath.scala 103:18]
  wire [63:0] _GEN_116 = io_absorb ? _GEN_91 : _GEN_16; // @[dpath.scala 103:18]
  wire [63:0] _GEN_117 = io_absorb ? _GEN_92 : _GEN_17; // @[dpath.scala 103:18]
  wire [63:0] _GEN_118 = io_absorb ? _GEN_93 : _GEN_18; // @[dpath.scala 103:18]
  wire [63:0] _GEN_119 = io_absorb ? _GEN_94 : _GEN_19; // @[dpath.scala 103:18]
  wire [63:0] _GEN_120 = io_absorb ? _GEN_95 : _GEN_20; // @[dpath.scala 103:18]
  wire [63:0] _GEN_121 = io_absorb ? _GEN_96 : _GEN_21; // @[dpath.scala 103:18]
  wire [63:0] _GEN_122 = io_absorb ? _GEN_97 : _GEN_22; // @[dpath.scala 103:18]
  wire [63:0] _GEN_123 = io_absorb ? _GEN_98 : _GEN_23; // @[dpath.scala 103:18]
  wire [63:0] _GEN_124 = io_absorb ? _GEN_99 : _GEN_24; // @[dpath.scala 103:18]
  ThetaModule ThetaModule ( // @[dpath.scala 34:21]
    .io_state_i_0(ThetaModule_io_state_i_0),
    .io_state_i_1(ThetaModule_io_state_i_1),
    .io_state_i_2(ThetaModule_io_state_i_2),
    .io_state_i_3(ThetaModule_io_state_i_3),
    .io_state_i_4(ThetaModule_io_state_i_4),
    .io_state_i_5(ThetaModule_io_state_i_5),
    .io_state_i_6(ThetaModule_io_state_i_6),
    .io_state_i_7(ThetaModule_io_state_i_7),
    .io_state_i_8(ThetaModule_io_state_i_8),
    .io_state_i_9(ThetaModule_io_state_i_9),
    .io_state_i_10(ThetaModule_io_state_i_10),
    .io_state_i_11(ThetaModule_io_state_i_11),
    .io_state_i_12(ThetaModule_io_state_i_12),
    .io_state_i_13(ThetaModule_io_state_i_13),
    .io_state_i_14(ThetaModule_io_state_i_14),
    .io_state_i_15(ThetaModule_io_state_i_15),
    .io_state_i_16(ThetaModule_io_state_i_16),
    .io_state_i_17(ThetaModule_io_state_i_17),
    .io_state_i_18(ThetaModule_io_state_i_18),
    .io_state_i_19(ThetaModule_io_state_i_19),
    .io_state_i_20(ThetaModule_io_state_i_20),
    .io_state_i_21(ThetaModule_io_state_i_21),
    .io_state_i_22(ThetaModule_io_state_i_22),
    .io_state_i_23(ThetaModule_io_state_i_23),
    .io_state_i_24(ThetaModule_io_state_i_24),
    .io_state_o_0(ThetaModule_io_state_o_0),
    .io_state_o_1(ThetaModule_io_state_o_1),
    .io_state_o_2(ThetaModule_io_state_o_2),
    .io_state_o_3(ThetaModule_io_state_o_3),
    .io_state_o_4(ThetaModule_io_state_o_4),
    .io_state_o_5(ThetaModule_io_state_o_5),
    .io_state_o_6(ThetaModule_io_state_o_6),
    .io_state_o_7(ThetaModule_io_state_o_7),
    .io_state_o_8(ThetaModule_io_state_o_8),
    .io_state_o_9(ThetaModule_io_state_o_9),
    .io_state_o_10(ThetaModule_io_state_o_10),
    .io_state_o_11(ThetaModule_io_state_o_11),
    .io_state_o_12(ThetaModule_io_state_o_12),
    .io_state_o_13(ThetaModule_io_state_o_13),
    .io_state_o_14(ThetaModule_io_state_o_14),
    .io_state_o_15(ThetaModule_io_state_o_15),
    .io_state_o_16(ThetaModule_io_state_o_16),
    .io_state_o_17(ThetaModule_io_state_o_17),
    .io_state_o_18(ThetaModule_io_state_o_18),
    .io_state_o_19(ThetaModule_io_state_o_19),
    .io_state_o_20(ThetaModule_io_state_o_20),
    .io_state_o_21(ThetaModule_io_state_o_21),
    .io_state_o_22(ThetaModule_io_state_o_22),
    .io_state_o_23(ThetaModule_io_state_o_23),
    .io_state_o_24(ThetaModule_io_state_o_24)
  );
  RhoPiModule RhoPiModule ( // @[dpath.scala 35:21]
    .io_state_i_0(RhoPiModule_io_state_i_0),
    .io_state_i_1(RhoPiModule_io_state_i_1),
    .io_state_i_2(RhoPiModule_io_state_i_2),
    .io_state_i_3(RhoPiModule_io_state_i_3),
    .io_state_i_4(RhoPiModule_io_state_i_4),
    .io_state_i_5(RhoPiModule_io_state_i_5),
    .io_state_i_6(RhoPiModule_io_state_i_6),
    .io_state_i_7(RhoPiModule_io_state_i_7),
    .io_state_i_8(RhoPiModule_io_state_i_8),
    .io_state_i_9(RhoPiModule_io_state_i_9),
    .io_state_i_10(RhoPiModule_io_state_i_10),
    .io_state_i_11(RhoPiModule_io_state_i_11),
    .io_state_i_12(RhoPiModule_io_state_i_12),
    .io_state_i_13(RhoPiModule_io_state_i_13),
    .io_state_i_14(RhoPiModule_io_state_i_14),
    .io_state_i_15(RhoPiModule_io_state_i_15),
    .io_state_i_16(RhoPiModule_io_state_i_16),
    .io_state_i_17(RhoPiModule_io_state_i_17),
    .io_state_i_18(RhoPiModule_io_state_i_18),
    .io_state_i_19(RhoPiModule_io_state_i_19),
    .io_state_i_20(RhoPiModule_io_state_i_20),
    .io_state_i_21(RhoPiModule_io_state_i_21),
    .io_state_i_22(RhoPiModule_io_state_i_22),
    .io_state_i_23(RhoPiModule_io_state_i_23),
    .io_state_i_24(RhoPiModule_io_state_i_24),
    .io_state_o_0(RhoPiModule_io_state_o_0),
    .io_state_o_1(RhoPiModule_io_state_o_1),
    .io_state_o_2(RhoPiModule_io_state_o_2),
    .io_state_o_3(RhoPiModule_io_state_o_3),
    .io_state_o_4(RhoPiModule_io_state_o_4),
    .io_state_o_5(RhoPiModule_io_state_o_5),
    .io_state_o_6(RhoPiModule_io_state_o_6),
    .io_state_o_7(RhoPiModule_io_state_o_7),
    .io_state_o_8(RhoPiModule_io_state_o_8),
    .io_state_o_9(RhoPiModule_io_state_o_9),
    .io_state_o_10(RhoPiModule_io_state_o_10),
    .io_state_o_11(RhoPiModule_io_state_o_11),
    .io_state_o_12(RhoPiModule_io_state_o_12),
    .io_state_o_13(RhoPiModule_io_state_o_13),
    .io_state_o_14(RhoPiModule_io_state_o_14),
    .io_state_o_15(RhoPiModule_io_state_o_15),
    .io_state_o_16(RhoPiModule_io_state_o_16),
    .io_state_o_17(RhoPiModule_io_state_o_17),
    .io_state_o_18(RhoPiModule_io_state_o_18),
    .io_state_o_19(RhoPiModule_io_state_o_19),
    .io_state_o_20(RhoPiModule_io_state_o_20),
    .io_state_o_21(RhoPiModule_io_state_o_21),
    .io_state_o_22(RhoPiModule_io_state_o_22),
    .io_state_o_23(RhoPiModule_io_state_o_23),
    .io_state_o_24(RhoPiModule_io_state_o_24)
  );
  ChiModule ChiModule ( // @[dpath.scala 36:21]
    .io_state_i_0(ChiModule_io_state_i_0),
    .io_state_i_1(ChiModule_io_state_i_1),
    .io_state_i_2(ChiModule_io_state_i_2),
    .io_state_i_3(ChiModule_io_state_i_3),
    .io_state_i_4(ChiModule_io_state_i_4),
    .io_state_i_5(ChiModule_io_state_i_5),
    .io_state_i_6(ChiModule_io_state_i_6),
    .io_state_i_7(ChiModule_io_state_i_7),
    .io_state_i_8(ChiModule_io_state_i_8),
    .io_state_i_9(ChiModule_io_state_i_9),
    .io_state_i_10(ChiModule_io_state_i_10),
    .io_state_i_11(ChiModule_io_state_i_11),
    .io_state_i_12(ChiModule_io_state_i_12),
    .io_state_i_13(ChiModule_io_state_i_13),
    .io_state_i_14(ChiModule_io_state_i_14),
    .io_state_i_15(ChiModule_io_state_i_15),
    .io_state_i_16(ChiModule_io_state_i_16),
    .io_state_i_17(ChiModule_io_state_i_17),
    .io_state_i_18(ChiModule_io_state_i_18),
    .io_state_i_19(ChiModule_io_state_i_19),
    .io_state_i_20(ChiModule_io_state_i_20),
    .io_state_i_21(ChiModule_io_state_i_21),
    .io_state_i_22(ChiModule_io_state_i_22),
    .io_state_i_23(ChiModule_io_state_i_23),
    .io_state_i_24(ChiModule_io_state_i_24),
    .io_state_o_0(ChiModule_io_state_o_0),
    .io_state_o_1(ChiModule_io_state_o_1),
    .io_state_o_2(ChiModule_io_state_o_2),
    .io_state_o_3(ChiModule_io_state_o_3),
    .io_state_o_4(ChiModule_io_state_o_4),
    .io_state_o_5(ChiModule_io_state_o_5),
    .io_state_o_6(ChiModule_io_state_o_6),
    .io_state_o_7(ChiModule_io_state_o_7),
    .io_state_o_8(ChiModule_io_state_o_8),
    .io_state_o_9(ChiModule_io_state_o_9),
    .io_state_o_10(ChiModule_io_state_o_10),
    .io_state_o_11(ChiModule_io_state_o_11),
    .io_state_o_12(ChiModule_io_state_o_12),
    .io_state_o_13(ChiModule_io_state_o_13),
    .io_state_o_14(ChiModule_io_state_o_14),
    .io_state_o_15(ChiModule_io_state_o_15),
    .io_state_o_16(ChiModule_io_state_o_16),
    .io_state_o_17(ChiModule_io_state_o_17),
    .io_state_o_18(ChiModule_io_state_o_18),
    .io_state_o_19(ChiModule_io_state_o_19),
    .io_state_o_20(ChiModule_io_state_o_20),
    .io_state_o_21(ChiModule_io_state_o_21),
    .io_state_o_22(ChiModule_io_state_o_22),
    .io_state_o_23(ChiModule_io_state_o_23),
    .io_state_o_24(ChiModule_io_state_o_24)
  );
  IotaModule iota ( // @[dpath.scala 37:21]
    .io_state_i_0(iota_io_state_i_0),
    .io_state_i_1(iota_io_state_i_1),
    .io_state_i_2(iota_io_state_i_2),
    .io_state_i_3(iota_io_state_i_3),
    .io_state_i_4(iota_io_state_i_4),
    .io_state_i_5(iota_io_state_i_5),
    .io_state_i_6(iota_io_state_i_6),
    .io_state_i_7(iota_io_state_i_7),
    .io_state_i_8(iota_io_state_i_8),
    .io_state_i_9(iota_io_state_i_9),
    .io_state_i_10(iota_io_state_i_10),
    .io_state_i_11(iota_io_state_i_11),
    .io_state_i_12(iota_io_state_i_12),
    .io_state_i_13(iota_io_state_i_13),
    .io_state_i_14(iota_io_state_i_14),
    .io_state_i_15(iota_io_state_i_15),
    .io_state_i_16(iota_io_state_i_16),
    .io_state_i_17(iota_io_state_i_17),
    .io_state_i_18(iota_io_state_i_18),
    .io_state_i_19(iota_io_state_i_19),
    .io_state_i_20(iota_io_state_i_20),
    .io_state_i_21(iota_io_state_i_21),
    .io_state_i_22(iota_io_state_i_22),
    .io_state_i_23(iota_io_state_i_23),
    .io_state_i_24(iota_io_state_i_24),
    .io_state_o_0(iota_io_state_o_0),
    .io_state_o_1(iota_io_state_o_1),
    .io_state_o_2(iota_io_state_o_2),
    .io_state_o_3(iota_io_state_o_3),
    .io_state_o_4(iota_io_state_o_4),
    .io_state_o_5(iota_io_state_o_5),
    .io_state_o_6(iota_io_state_o_6),
    .io_state_o_7(iota_io_state_o_7),
    .io_state_o_8(iota_io_state_o_8),
    .io_state_o_9(iota_io_state_o_9),
    .io_state_o_10(iota_io_state_o_10),
    .io_state_o_11(iota_io_state_o_11),
    .io_state_o_12(iota_io_state_o_12),
    .io_state_o_13(iota_io_state_o_13),
    .io_state_o_14(iota_io_state_o_14),
    .io_state_o_15(iota_io_state_o_15),
    .io_state_o_16(iota_io_state_o_16),
    .io_state_o_17(iota_io_state_o_17),
    .io_state_o_18(iota_io_state_o_18),
    .io_state_o_19(iota_io_state_o_19),
    .io_state_o_20(iota_io_state_o_20),
    .io_state_o_21(iota_io_state_o_21),
    .io_state_o_22(iota_io_state_o_22),
    .io_state_o_23(iota_io_state_o_23),
    .io_state_o_24(iota_io_state_o_24),
    .io_round(iota_io_round)
  );
  assign io_hash_out_0 = state_0; // @[dpath.scala 116:20]
  assign io_hash_out_1 = state_5; // @[dpath.scala 116:20]
  assign io_hash_out_2 = state_10; // @[dpath.scala 116:20]
  assign io_hash_out_3 = state_15; // @[dpath.scala 116:20]
  assign ThetaModule_io_state_i_0 = state_0; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_1 = state_1; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_2 = state_2; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_3 = state_3; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_4 = state_4; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_5 = state_5; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_6 = state_6; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_7 = state_7; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_8 = state_8; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_9 = state_9; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_10 = state_10; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_11 = state_11; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_12 = state_12; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_13 = state_13; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_14 = state_14; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_15 = state_15; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_16 = state_16; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_17 = state_17; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_18 = state_18; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_19 = state_19; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_20 = state_20; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_21 = state_21; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_22 = state_22; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_23 = state_23; // @[dpath.scala 45:21]
  assign ThetaModule_io_state_i_24 = state_24; // @[dpath.scala 45:21]
  assign RhoPiModule_io_state_i_0 = ThetaModule_io_state_o_0; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_1 = ThetaModule_io_state_o_1; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_2 = ThetaModule_io_state_o_2; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_3 = ThetaModule_io_state_o_3; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_4 = ThetaModule_io_state_o_4; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_5 = ThetaModule_io_state_o_5; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_6 = ThetaModule_io_state_o_6; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_7 = ThetaModule_io_state_o_7; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_8 = ThetaModule_io_state_o_8; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_9 = ThetaModule_io_state_o_9; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_10 = ThetaModule_io_state_o_10; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_11 = ThetaModule_io_state_o_11; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_12 = ThetaModule_io_state_o_12; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_13 = ThetaModule_io_state_o_13; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_14 = ThetaModule_io_state_o_14; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_15 = ThetaModule_io_state_o_15; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_16 = ThetaModule_io_state_o_16; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_17 = ThetaModule_io_state_o_17; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_18 = ThetaModule_io_state_o_18; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_19 = ThetaModule_io_state_o_19; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_20 = ThetaModule_io_state_o_20; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_21 = ThetaModule_io_state_o_21; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_22 = ThetaModule_io_state_o_22; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_23 = ThetaModule_io_state_o_23; // @[dpath.scala 46:21]
  assign RhoPiModule_io_state_i_24 = ThetaModule_io_state_o_24; // @[dpath.scala 46:21]
  assign ChiModule_io_state_i_0 = RhoPiModule_io_state_o_0; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_1 = RhoPiModule_io_state_o_1; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_2 = RhoPiModule_io_state_o_2; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_3 = RhoPiModule_io_state_o_3; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_4 = RhoPiModule_io_state_o_4; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_5 = RhoPiModule_io_state_o_5; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_6 = RhoPiModule_io_state_o_6; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_7 = RhoPiModule_io_state_o_7; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_8 = RhoPiModule_io_state_o_8; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_9 = RhoPiModule_io_state_o_9; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_10 = RhoPiModule_io_state_o_10; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_11 = RhoPiModule_io_state_o_11; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_12 = RhoPiModule_io_state_o_12; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_13 = RhoPiModule_io_state_o_13; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_14 = RhoPiModule_io_state_o_14; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_15 = RhoPiModule_io_state_o_15; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_16 = RhoPiModule_io_state_o_16; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_17 = RhoPiModule_io_state_o_17; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_18 = RhoPiModule_io_state_o_18; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_19 = RhoPiModule_io_state_o_19; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_20 = RhoPiModule_io_state_o_20; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_21 = RhoPiModule_io_state_o_21; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_22 = RhoPiModule_io_state_o_22; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_23 = RhoPiModule_io_state_o_23; // @[dpath.scala 47:21]
  assign ChiModule_io_state_i_24 = RhoPiModule_io_state_o_24; // @[dpath.scala 47:21]
  assign iota_io_state_i_0 = ChiModule_io_state_o_0; // @[dpath.scala 48:24]
  assign iota_io_state_i_1 = ChiModule_io_state_o_1; // @[dpath.scala 48:24]
  assign iota_io_state_i_2 = ChiModule_io_state_o_2; // @[dpath.scala 48:24]
  assign iota_io_state_i_3 = ChiModule_io_state_o_3; // @[dpath.scala 48:24]
  assign iota_io_state_i_4 = ChiModule_io_state_o_4; // @[dpath.scala 48:24]
  assign iota_io_state_i_5 = ChiModule_io_state_o_5; // @[dpath.scala 48:24]
  assign iota_io_state_i_6 = ChiModule_io_state_o_6; // @[dpath.scala 48:24]
  assign iota_io_state_i_7 = ChiModule_io_state_o_7; // @[dpath.scala 48:24]
  assign iota_io_state_i_8 = ChiModule_io_state_o_8; // @[dpath.scala 48:24]
  assign iota_io_state_i_9 = ChiModule_io_state_o_9; // @[dpath.scala 48:24]
  assign iota_io_state_i_10 = ChiModule_io_state_o_10; // @[dpath.scala 48:24]
  assign iota_io_state_i_11 = ChiModule_io_state_o_11; // @[dpath.scala 48:24]
  assign iota_io_state_i_12 = ChiModule_io_state_o_12; // @[dpath.scala 48:24]
  assign iota_io_state_i_13 = ChiModule_io_state_o_13; // @[dpath.scala 48:24]
  assign iota_io_state_i_14 = ChiModule_io_state_o_14; // @[dpath.scala 48:24]
  assign iota_io_state_i_15 = ChiModule_io_state_o_15; // @[dpath.scala 48:24]
  assign iota_io_state_i_16 = ChiModule_io_state_o_16; // @[dpath.scala 48:24]
  assign iota_io_state_i_17 = ChiModule_io_state_o_17; // @[dpath.scala 48:24]
  assign iota_io_state_i_18 = ChiModule_io_state_o_18; // @[dpath.scala 48:24]
  assign iota_io_state_i_19 = ChiModule_io_state_o_19; // @[dpath.scala 48:24]
  assign iota_io_state_i_20 = ChiModule_io_state_o_20; // @[dpath.scala 48:24]
  assign iota_io_state_i_21 = ChiModule_io_state_o_21; // @[dpath.scala 48:24]
  assign iota_io_state_i_22 = ChiModule_io_state_o_22; // @[dpath.scala 48:24]
  assign iota_io_state_i_23 = ChiModule_io_state_o_23; // @[dpath.scala 48:24]
  assign iota_io_state_i_24 = ChiModule_io_state_o_24; // @[dpath.scala 48:24]
  assign iota_io_round = io_round; // @[dpath.scala 71:20]
  always @(posedge clock) begin
    if (reset) begin // @[dpath.scala 31:18]
      state_0 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_0 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_0 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_0 <= _GEN_100;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_1 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_1 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_1 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_1 <= _GEN_101;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_2 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_2 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_2 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_2 <= _GEN_102;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_3 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_3 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_3 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_3 <= _GEN_103;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_4 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_4 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_4 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_4 <= _GEN_104;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_5 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_5 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_5 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_5 <= _GEN_105;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_6 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_6 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_6 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_6 <= _GEN_106;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_7 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_7 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_7 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_7 <= _GEN_107;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_8 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_8 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_8 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_8 <= _GEN_108;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_9 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_9 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_9 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_9 <= _GEN_109;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_10 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_10 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_10 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_10 <= _GEN_110;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_11 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_11 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_11 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_11 <= _GEN_111;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_12 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_12 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_12 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_12 <= _GEN_112;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_13 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_13 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_13 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_13 <= _GEN_113;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_14 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_14 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_14 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_14 <= _GEN_114;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_15 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_15 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_15 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_15 <= _GEN_115;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_16 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_16 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_16 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_16 <= _GEN_116;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_17 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_17 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_17 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_17 <= _GEN_117;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_18 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_18 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_18 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_18 <= _GEN_118;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_19 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_19 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_19 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_19 <= _GEN_119;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_20 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_20 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_20 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_20 <= _GEN_120;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_21 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_21 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_21 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_21 <= _GEN_121;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_22 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_22 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_22 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_22 <= _GEN_122;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_23 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_23 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_23 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_23 <= _GEN_123;
    end
    if (reset) begin // @[dpath.scala 31:18]
      state_24 <= 64'h0; // @[dpath.scala 31:18]
    end else if (reset) begin // @[dpath.scala 129:14]
      state_24 <= 64'h0; // @[dpath.scala 130:11]
    end else if (io_init) begin // @[dpath.scala 125:16]
      state_24 <= 64'h0; // @[dpath.scala 126:11]
    end else if (!(io_write)) begin // @[dpath.scala 120:17]
      state_24 <= _GEN_124;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  state_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  state_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  state_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  state_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  state_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  state_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  state_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  state_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  state_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  state_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  state_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  state_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  state_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  state_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  state_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  state_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  state_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  state_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  state_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  state_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  state_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  state_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  state_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  state_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  state_24 = _RAND_24[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Sha3BlackBox(
  input         clock,
  input         reset,
  output        io_cmd_ready,
  input         io_cmd_valid,
  input  [6:0]  io_cmd_bits_inst_funct,
  input  [4:0]  io_cmd_bits_inst_rs2,
  input  [4:0]  io_cmd_bits_inst_rs1,
  input         io_cmd_bits_inst_xd,
  input         io_cmd_bits_inst_xs1,
  input         io_cmd_bits_inst_xs2,
  input  [4:0]  io_cmd_bits_inst_rd,
  input  [6:0]  io_cmd_bits_inst_opcode,
  input  [63:0] io_cmd_bits_rs1,
  input  [63:0] io_cmd_bits_rs2,
  input         io_cmd_bits_status_debug,
  input         io_cmd_bits_status_cease,
  input         io_cmd_bits_status_wfi,
  input  [31:0] io_cmd_bits_status_isa,
  input  [1:0]  io_cmd_bits_status_dprv,
  input         io_cmd_bits_status_dv,
  input  [1:0]  io_cmd_bits_status_prv,
  input         io_cmd_bits_status_v,
  input         io_cmd_bits_status_sd,
  input  [22:0] io_cmd_bits_status_zero2,
  input         io_cmd_bits_status_mpv,
  input         io_cmd_bits_status_gva,
  input         io_cmd_bits_status_mbe,
  input         io_cmd_bits_status_sbe,
  input  [1:0]  io_cmd_bits_status_sxl,
  input  [1:0]  io_cmd_bits_status_uxl,
  input         io_cmd_bits_status_sd_rv32,
  input  [7:0]  io_cmd_bits_status_zero1,
  input         io_cmd_bits_status_tsr,
  input         io_cmd_bits_status_tw,
  input         io_cmd_bits_status_tvm,
  input         io_cmd_bits_status_mxr,
  input         io_cmd_bits_status_sum,
  input         io_cmd_bits_status_mprv,
  input  [1:0]  io_cmd_bits_status_xs,
  input  [1:0]  io_cmd_bits_status_fs,
  input  [1:0]  io_cmd_bits_status_mpp,
  input  [1:0]  io_cmd_bits_status_vs,
  input         io_cmd_bits_status_spp,
  input         io_cmd_bits_status_mpie,
  input         io_cmd_bits_status_ube,
  input         io_cmd_bits_status_spie,
  input         io_cmd_bits_status_upie,
  input         io_cmd_bits_status_mie,
  input         io_cmd_bits_status_hie,
  input         io_cmd_bits_status_sie,
  input         io_cmd_bits_status_uie,
  input         io_resp_ready,
  output        io_resp_valid,
  output [4:0]  io_resp_bits_rd,
  output [63:0] io_resp_bits_data,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output [7:0]  io_mem_req_bits_tag,
  output [4:0]  io_mem_req_bits_cmd,
  output [1:0]  io_mem_req_bits_size,
  output        io_mem_req_bits_signed,
  output [1:0]  io_mem_req_bits_dprv,
  output        io_mem_req_bits_dv,
  output        io_mem_req_bits_phys,
  output        io_mem_req_bits_no_alloc,
  output        io_mem_req_bits_no_xcpt,
  output [63:0] io_mem_req_bits_data,
  output [7:0]  io_mem_req_bits_mask,
  output        io_mem_s1_kill,
  output [63:0] io_mem_s1_data_data,
  output [7:0]  io_mem_s1_data_mask,
  input         io_mem_s2_nack,
  input         io_mem_s2_nack_cause_raw,
  output        io_mem_s2_kill,
  input         io_mem_s2_uncached,
  input  [31:0] io_mem_s2_paddr,
  input         io_mem_resp_valid,
  input  [39:0] io_mem_resp_bits_addr,
  input  [7:0]  io_mem_resp_bits_tag,
  input  [4:0]  io_mem_resp_bits_cmd,
  input  [1:0]  io_mem_resp_bits_size,
  input         io_mem_resp_bits_signed,
  input  [1:0]  io_mem_resp_bits_dprv,
  input         io_mem_resp_bits_dv,
  input  [63:0] io_mem_resp_bits_data,
  input  [7:0]  io_mem_resp_bits_mask,
  input         io_mem_resp_bits_replay,
  input         io_mem_resp_bits_has_data,
  input  [63:0] io_mem_resp_bits_data_word_bypass,
  input  [63:0] io_mem_resp_bits_data_raw,
  input  [63:0] io_mem_resp_bits_store_data,
  input         io_mem_replay_next,
  input         io_mem_s2_xcpt_ma_ld,
  input         io_mem_s2_xcpt_ma_st,
  input         io_mem_s2_xcpt_pf_ld,
  input         io_mem_s2_xcpt_pf_st,
  input         io_mem_s2_xcpt_gf_ld,
  input         io_mem_s2_xcpt_gf_st,
  input         io_mem_s2_xcpt_ae_ld,
  input         io_mem_s2_xcpt_ae_st,
  input  [39:0] io_mem_s2_gpa,
  input         io_mem_s2_gpa_is_pte,
  input         io_mem_ordered,
  input         io_mem_perf_acquire,
  input         io_mem_perf_release,
  input         io_mem_perf_grant,
  input         io_mem_perf_tlbMiss,
  input         io_mem_perf_blocked,
  input         io_mem_perf_canAcceptStoreThenLoad,
  input         io_mem_perf_canAcceptStoreThenRMW,
  input         io_mem_perf_canAcceptLoadThenLoad,
  input         io_mem_perf_storeBufferEmptyAfterLoad,
  input         io_mem_perf_storeBufferEmptyAfterStore,
  output        io_mem_keep_clock_enabled,
  input         io_mem_clock_enabled,
  output        io_busy,
  output        io_interrupt,
  input         io_exception,
  input         io_fpu_req_ready,
  output        io_fpu_req_valid,
  output        io_fpu_req_bits_ldst,
  output        io_fpu_req_bits_wen,
  output        io_fpu_req_bits_ren1,
  output        io_fpu_req_bits_ren2,
  output        io_fpu_req_bits_ren3,
  output        io_fpu_req_bits_swap12,
  output        io_fpu_req_bits_swap23,
  output [1:0]  io_fpu_req_bits_typeTagIn,
  output [1:0]  io_fpu_req_bits_typeTagOut,
  output        io_fpu_req_bits_fromint,
  output        io_fpu_req_bits_toint,
  output        io_fpu_req_bits_fastpipe,
  output        io_fpu_req_bits_fma,
  output        io_fpu_req_bits_div,
  output        io_fpu_req_bits_sqrt,
  output        io_fpu_req_bits_wflags,
  output [2:0]  io_fpu_req_bits_rm,
  output [1:0]  io_fpu_req_bits_fmaCmd,
  output [1:0]  io_fpu_req_bits_typ,
  output [1:0]  io_fpu_req_bits_fmt,
  output [64:0] io_fpu_req_bits_in1,
  output [64:0] io_fpu_req_bits_in2,
  output [64:0] io_fpu_req_bits_in3,
  output        io_fpu_resp_ready,
  input         io_fpu_resp_valid,
  input  [64:0] io_fpu_resp_bits_data,
  input  [4:0]  io_fpu_resp_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  ctrl_clock; // @[sha3.scala 109:22]
  wire  ctrl_reset; // @[sha3.scala 109:22]
  wire  ctrl_io_rocc_req_val; // @[sha3.scala 109:22]
  wire  ctrl_io_rocc_req_rdy; // @[sha3.scala 109:22]
  wire [1:0] ctrl_io_rocc_funct; // @[sha3.scala 109:22]
  wire [63:0] ctrl_io_rocc_rs1; // @[sha3.scala 109:22]
  wire [63:0] ctrl_io_rocc_rs2; // @[sha3.scala 109:22]
  wire  ctrl_io_busy; // @[sha3.scala 109:22]
  wire  ctrl_io_dmem_req_val; // @[sha3.scala 109:22]
  wire  ctrl_io_dmem_req_rdy; // @[sha3.scala 109:22]
  wire [5:0] ctrl_io_dmem_req_tag; // @[sha3.scala 109:22]
  wire [39:0] ctrl_io_dmem_req_addr; // @[sha3.scala 109:22]
  wire [4:0] ctrl_io_dmem_req_cmd; // @[sha3.scala 109:22]
  wire  ctrl_io_dmem_resp_val; // @[sha3.scala 109:22]
  wire [6:0] ctrl_io_dmem_resp_tag; // @[sha3.scala 109:22]
  wire [63:0] ctrl_io_dmem_resp_data; // @[sha3.scala 109:22]
  wire [4:0] ctrl_io_round; // @[sha3.scala 109:22]
  wire  ctrl_io_absorb; // @[sha3.scala 109:22]
  wire [4:0] ctrl_io_aindex; // @[sha3.scala 109:22]
  wire  ctrl_io_init; // @[sha3.scala 109:22]
  wire  ctrl_io_write; // @[sha3.scala 109:22]
  wire [2:0] ctrl_io_windex; // @[sha3.scala 109:22]
  wire [63:0] ctrl_io_buffer_out; // @[sha3.scala 109:22]
  wire  dpath_clock; // @[sha3.scala 152:23]
  wire  dpath_reset; // @[sha3.scala 152:23]
  wire  dpath_io_absorb; // @[sha3.scala 152:23]
  wire  dpath_io_init; // @[sha3.scala 152:23]
  wire  dpath_io_write; // @[sha3.scala 152:23]
  wire [4:0] dpath_io_round; // @[sha3.scala 152:23]
  wire [4:0] dpath_io_aindex; // @[sha3.scala 152:23]
  wire [63:0] dpath_io_message_in; // @[sha3.scala 152:23]
  wire [63:0] dpath_io_hash_out_0; // @[sha3.scala 152:23]
  wire [63:0] dpath_io_hash_out_1; // @[sha3.scala 152:23]
  wire [63:0] dpath_io_hash_out_2; // @[sha3.scala 152:23]
  wire [63:0] dpath_io_hash_out_3; // @[sha3.scala 152:23]
  wire  _status_T = io_cmd_ready & io_cmd_valid; // @[Decoupled.scala 50:35]
  reg [1:0] status_dprv; // @[Reg.scala 16:16]
  reg  status_dv; // @[Reg.scala 16:16]
  wire [63:0] _GEN_37 = dpath_io_hash_out_0; // @[sha3.scala 155:{15,15}]
  wire [63:0] _GEN_38 = 2'h1 == ctrl_io_windex[1:0] ? dpath_io_hash_out_1 : _GEN_37; // @[sha3.scala 155:{15,15}]
  wire [63:0] _GEN_39 = 2'h2 == ctrl_io_windex[1:0] ? dpath_io_hash_out_2 : _GEN_38; // @[sha3.scala 155:{15,15}]
  CtrlModule ctrl ( // @[sha3.scala 109:22]
    .clock(ctrl_clock),
    .reset(ctrl_reset),
    .io_rocc_req_val(ctrl_io_rocc_req_val),
    .io_rocc_req_rdy(ctrl_io_rocc_req_rdy),
    .io_rocc_funct(ctrl_io_rocc_funct),
    .io_rocc_rs1(ctrl_io_rocc_rs1),
    .io_rocc_rs2(ctrl_io_rocc_rs2),
    .io_busy(ctrl_io_busy),
    .io_dmem_req_val(ctrl_io_dmem_req_val),
    .io_dmem_req_rdy(ctrl_io_dmem_req_rdy),
    .io_dmem_req_tag(ctrl_io_dmem_req_tag),
    .io_dmem_req_addr(ctrl_io_dmem_req_addr),
    .io_dmem_req_cmd(ctrl_io_dmem_req_cmd),
    .io_dmem_resp_val(ctrl_io_dmem_resp_val),
    .io_dmem_resp_tag(ctrl_io_dmem_resp_tag),
    .io_dmem_resp_data(ctrl_io_dmem_resp_data),
    .io_round(ctrl_io_round),
    .io_absorb(ctrl_io_absorb),
    .io_aindex(ctrl_io_aindex),
    .io_init(ctrl_io_init),
    .io_write(ctrl_io_write),
    .io_windex(ctrl_io_windex),
    .io_buffer_out(ctrl_io_buffer_out)
  );
  DpathModule dpath ( // @[sha3.scala 152:23]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_absorb(dpath_io_absorb),
    .io_init(dpath_io_init),
    .io_write(dpath_io_write),
    .io_round(dpath_io_round),
    .io_aindex(dpath_io_aindex),
    .io_message_in(dpath_io_message_in),
    .io_hash_out_0(dpath_io_hash_out_0),
    .io_hash_out_1(dpath_io_hash_out_1),
    .io_hash_out_2(dpath_io_hash_out_2),
    .io_hash_out_3(dpath_io_hash_out_3)
  );
  assign io_cmd_ready = ctrl_io_rocc_req_rdy; // @[sha3.scala 112:18]
  assign io_resp_valid = 1'h0; // @[sha3.scala 97:17]
  assign io_resp_bits_rd = 5'h0;
  assign io_resp_bits_data = 64'h0;
  assign io_mem_req_valid = ctrl_io_dmem_req_val; // @[sha3.scala 122:17]
  assign io_mem_req_bits_addr = ctrl_io_dmem_req_addr; // @[sha3.scala 125:21]
  assign io_mem_req_bits_tag = {{2'd0}, ctrl_io_dmem_req_tag}; // @[sha3.scala 124:20]
  assign io_mem_req_bits_cmd = ctrl_io_dmem_req_cmd; // @[sha3.scala 126:20]
  assign io_mem_req_bits_size = 2'h3; // @[sha3.scala 127:21]
  assign io_mem_req_bits_signed = 1'h0; // @[sha3.scala 129:23]
  assign io_mem_req_bits_dprv = status_dprv; // @[sha3.scala 130:21]
  assign io_mem_req_bits_dv = status_dv; // @[sha3.scala 131:19]
  assign io_mem_req_bits_phys = 1'h0; // @[sha3.scala 132:21]
  assign io_mem_req_bits_no_alloc = 1'h0;
  assign io_mem_req_bits_no_xcpt = 1'h0;
  assign io_mem_req_bits_data = 2'h3 == ctrl_io_windex[1:0] ? dpath_io_hash_out_3 : _GEN_39; // @[sha3.scala 155:{15,15}]
  assign io_mem_req_bits_mask = 8'h0;
  assign io_mem_s1_kill = 1'h0;
  assign io_mem_s1_data_data = 64'h0;
  assign io_mem_s1_data_mask = 8'h0;
  assign io_mem_s2_kill = 1'h0;
  assign io_mem_keep_clock_enabled = 1'h0;
  assign io_busy = ctrl_io_busy; // @[sha3.scala 117:13]
  assign io_interrupt = 1'h0;
  assign io_fpu_req_valid = 1'h0;
  assign io_fpu_req_bits_ldst = 1'h0;
  assign io_fpu_req_bits_wen = 1'h0;
  assign io_fpu_req_bits_ren1 = 1'h0;
  assign io_fpu_req_bits_ren2 = 1'h0;
  assign io_fpu_req_bits_ren3 = 1'h0;
  assign io_fpu_req_bits_swap12 = 1'h0;
  assign io_fpu_req_bits_swap23 = 1'h0;
  assign io_fpu_req_bits_typeTagIn = 2'h0;
  assign io_fpu_req_bits_typeTagOut = 2'h0;
  assign io_fpu_req_bits_fromint = 1'h0;
  assign io_fpu_req_bits_toint = 1'h0;
  assign io_fpu_req_bits_fastpipe = 1'h0;
  assign io_fpu_req_bits_fma = 1'h0;
  assign io_fpu_req_bits_div = 1'h0;
  assign io_fpu_req_bits_sqrt = 1'h0;
  assign io_fpu_req_bits_wflags = 1'h0;
  assign io_fpu_req_bits_rm = 3'h0;
  assign io_fpu_req_bits_fmaCmd = 2'h0;
  assign io_fpu_req_bits_typ = 2'h0;
  assign io_fpu_req_bits_fmt = 2'h0;
  assign io_fpu_req_bits_in1 = 65'h0;
  assign io_fpu_req_bits_in2 = 65'h0;
  assign io_fpu_req_bits_in3 = 65'h0;
  assign io_fpu_resp_ready = 1'h0;
  assign ctrl_clock = clock;
  assign ctrl_reset = reset;
  assign ctrl_io_rocc_req_val = io_cmd_valid; // @[sha3.scala 111:28]
  assign ctrl_io_rocc_funct = io_cmd_bits_inst_funct[1:0]; // @[sha3.scala 113:28]
  assign ctrl_io_rocc_rs1 = io_cmd_bits_rs1; // @[sha3.scala 114:28]
  assign ctrl_io_rocc_rs2 = io_cmd_bits_rs2; // @[sha3.scala 115:28]
  assign ctrl_io_dmem_req_rdy = io_mem_req_ready; // @[sha3.scala 123:28]
  assign ctrl_io_dmem_resp_val = io_mem_resp_valid; // @[sha3.scala 148:28]
  assign ctrl_io_dmem_resp_tag = io_mem_resp_bits_tag[6:0]; // @[sha3.scala 149:28]
  assign ctrl_io_dmem_resp_data = io_mem_resp_bits_data; // @[sha3.scala 150:28]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_absorb = ctrl_io_absorb; // @[sha3.scala 158:21]
  assign dpath_io_init = ctrl_io_init; // @[sha3.scala 159:19]
  assign dpath_io_write = ctrl_io_write; // @[sha3.scala 160:20]
  assign dpath_io_round = ctrl_io_round; // @[sha3.scala 161:20]
  assign dpath_io_aindex = ctrl_io_aindex; // @[sha3.scala 163:21]
  assign dpath_io_message_in = ctrl_io_buffer_out; // @[sha3.scala 154:25]
  always @(posedge clock) begin
    if (_status_T) begin // @[Reg.scala 17:18]
      status_dprv <= io_cmd_bits_status_dprv; // @[Reg.scala 17:22]
    end
    if (_status_T) begin // @[Reg.scala 17:18]
      status_dv <= io_cmd_bits_status_dv; // @[Reg.scala 17:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  status_dprv = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  status_dv = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
