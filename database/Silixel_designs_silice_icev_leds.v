/*

Copyright 2019, (C) Sylvain Lefebvre and contributors
List contributors with: git shortlog -n -s -- <filename>

MIT license

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(header_2_M)

*/
`define BARE 1
`define COLOR_DEPTH       6


module top(
`ifdef VGA
  // VGA
  output out_video_clock,
  output reg [`COLOR_DEPTH-1:0] out_video_r,
  output reg [`COLOR_DEPTH-1:0] out_video_g,
  output reg [`COLOR_DEPTH-1:0] out_video_b,
  output out_video_hs,
  output out_video_vs,
`endif
  // basic
  output [7:0] out_leds,
  input        clock
);

reg [2:0] ready = 3'b111;

always @(posedge clock) begin
  ready <= ready >> 1;
end

wire run_main;
assign run_main = 1'b1;

M_main __main(
  .clock(clock),
  .reset(ready[0]),
  .out_leds(out_leds),
`ifdef VGA
  .out_video_clock(out_video_clock),
  .out_video_r(out_video_r),
  .out_video_g(out_video_g),
  .out_video_b(out_video_b),
  .out_video_hs(out_video_hs),
  .out_video_vs(out_video_vs),
`endif
  .in_run(run_main)
);

endmodule

// SL 2019, MIT license
module M_main__mem_mem(
input      [11-1:0]                in_mem_addr,
output reg  [32-1:0]    out_mem_rdata,
input      [(32)/8-1:0]         in_mem_wenable,
input      [32-1:0]                in_mem_wdata,
input      clock
);
reg  [32-1:0] buffer[1536-1:0];
always @(posedge clock) begin
  out_mem_rdata <= buffer[in_mem_addr];
end
integer i;
always @(posedge clock) begin
  for (i = 0; i < (32)/8; i = i + 1) begin
    if (in_mem_wenable[i]) begin
      buffer[in_mem_addr][i*8+:8] <= in_mem_wdata[i*8+:8];
    end
  end
end
initial begin
 buffer[0] = 32'h00002137;
 buffer[1] = 32'h80010113;
 buffer[2] = 32'h00000097;
 buffer[3] = 32'h018080E7;
 buffer[4] = 32'h00000317;
 buffer[5] = 32'h00830067;
 buffer[6] = 32'h00000000;
 buffer[7] = 32'h00008067;
 buffer[8] = 32'hFF010113;
 buffer[9] = 32'h00012623;
 buffer[10] = 32'h000027B7;
 buffer[11] = 32'h00F00713;
 buffer[12] = 32'h00E7A223;
 buffer[13] = 32'h00200793;
 buffer[14] = 32'h000026B7;
 buffer[15] = 32'h00800713;
 buffer[16] = 32'h0080006F;
 buffer[17] = 32'h00100793;
 buffer[18] = 32'h00F6A223;
 buffer[19] = 32'h00179793;
 buffer[20] = 32'hFEF74AE3;
 buffer[21] = 32'hFF5FF06F;
 buffer[22] = 32'h00002040;
 buffer[23] = 32'h00002020;
 buffer[24] = 32'h00002010;
 buffer[25] = 32'h00002008;
 buffer[26] = 32'h00002004;
end

endmodule


// SL 2019, MIT license
module M_rv32i_cpu__cpu_mem_xregsA(
input                  [1-1:0] in_xregsA_wenable,
input      signed [32-1:0]    in_xregsA_wdata,
input                  [5-1:0]    in_xregsA_addr,
output reg signed [32-1:0]    out_xregsA_rdata,
input                                      clock
);
reg signed [32-1:0] buffer[32-1:0];
always @(posedge clock) begin
  if (in_xregsA_wenable) begin
    buffer[in_xregsA_addr] <= in_xregsA_wdata;
  end
  out_xregsA_rdata <= buffer[in_xregsA_addr];
end
initial begin
 buffer[0] = 0;
 buffer[1] = 0;
 buffer[2] = 0;
 buffer[3] = 0;
 buffer[4] = 0;
 buffer[5] = 0;
 buffer[6] = 0;
 buffer[7] = 0;
 buffer[8] = 0;
 buffer[9] = 0;
 buffer[10] = 0;
 buffer[11] = 0;
 buffer[12] = 0;
 buffer[13] = 0;
 buffer[14] = 0;
 buffer[15] = 0;
 buffer[16] = 0;
 buffer[17] = 0;
 buffer[18] = 0;
 buffer[19] = 0;
 buffer[20] = 0;
 buffer[21] = 0;
 buffer[22] = 0;
 buffer[23] = 0;
 buffer[24] = 0;
 buffer[25] = 0;
 buffer[26] = 0;
 buffer[27] = 0;
 buffer[28] = 0;
 buffer[29] = 0;
 buffer[30] = 0;
 buffer[31] = 0;
end

endmodule

// SL 2019, MIT license
module M_rv32i_cpu__cpu_mem_xregsB(
input                  [1-1:0] in_xregsB_wenable,
input      signed [32-1:0]    in_xregsB_wdata,
input                  [5-1:0]    in_xregsB_addr,
output reg signed [32-1:0]    out_xregsB_rdata,
input                                      clock
);
reg signed [32-1:0] buffer[32-1:0];
always @(posedge clock) begin
  if (in_xregsB_wenable) begin
    buffer[in_xregsB_addr] <= in_xregsB_wdata;
  end
  out_xregsB_rdata <= buffer[in_xregsB_addr];
end
initial begin
 buffer[0] = 0;
 buffer[1] = 0;
 buffer[2] = 0;
 buffer[3] = 0;
 buffer[4] = 0;
 buffer[5] = 0;
 buffer[6] = 0;
 buffer[7] = 0;
 buffer[8] = 0;
 buffer[9] = 0;
 buffer[10] = 0;
 buffer[11] = 0;
 buffer[12] = 0;
 buffer[13] = 0;
 buffer[14] = 0;
 buffer[15] = 0;
 buffer[16] = 0;
 buffer[17] = 0;
 buffer[18] = 0;
 buffer[19] = 0;
 buffer[20] = 0;
 buffer[21] = 0;
 buffer[22] = 0;
 buffer[23] = 0;
 buffer[24] = 0;
 buffer[25] = 0;
 buffer[26] = 0;
 buffer[27] = 0;
 buffer[28] = 0;
 buffer[29] = 0;
 buffer[30] = 0;
 buffer[31] = 0;
end

endmodule


module M_execute__cpu_exec (
in_instr,
in_pc,
in_xa,
in_xb,
in_trigger,
out_op,
out_write_rd,
out_no_rd,
out_jump,
out_load,
out_store,
out_val,
out_storeVal,
out_working,
out_n,
out_storeAddr,
out_intop,
out_r,
reset,
out_clock,
clock
);
input  [31:0] in_instr;
input  [11:0] in_pc;
input signed [31:0] in_xa;
input signed [31:0] in_xb;
input  [0:0] in_trigger;
output  [2:0] out_op;
output  [4:0] out_write_rd;
output  [0:0] out_no_rd;
output  [0:0] out_jump;
output  [0:0] out_load;
output  [0:0] out_store;
output signed [31:0] out_val;
output  [0:0] out_storeVal;
output  [0:0] out_working;
output  [31:0] out_n;
output  [0:0] out_storeAddr;
output  [0:0] out_intop;
output signed [31:0] out_r;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
reg signed [31:0] _t___block_1_shift;
reg  [0:0] _t___block_1_j;
wire signed [31:0] _w_imm_u;
wire signed [31:0] _w_imm_j;
wire signed [31:0] _w_imm_i;
wire signed [31:0] _w_imm_b;
wire signed [31:0] _w_imm_s;
wire  [4:0] _w_opcode;
wire  [0:0] _w_AUIPC;
wire  [0:0] _w_LUI;
wire  [0:0] _w_JAL;
wire  [0:0] _w_JALR;
wire  [0:0] _w_IntImm;
wire  [0:0] _w_IntReg;
wire  [0:0] _w_Cycles;
wire  [0:0] _w_branch;
wire  [0:0] _w_regOrImm;
wire  [0:0] _w_pcOrReg;
wire  [0:0] _w_sub;
wire  [0:0] _w_aluShift;
wire signed [31:0] _w_addr_a;
wire signed [31:0] _w_b;
wire signed [32:0] _w_a_minus_b;
wire  [0:0] _w_a_lt_b;
wire  [0:0] _w_a_lt_b_u;
wire  [0:0] _w_a_eq_b;
wire signed [31:0] _w_addr_imm;

reg  [4:0] _d_shamt = 0;
reg  [4:0] _q_shamt = 0;
reg  [31:0] _d_cycle = 0;
reg  [31:0] _q_cycle = 0;
reg  [2:0] _d_op;
reg  [2:0] _q_op;
reg  [4:0] _d_write_rd;
reg  [4:0] _q_write_rd;
reg  [0:0] _d_no_rd;
reg  [0:0] _q_no_rd;
reg  [0:0] _d_jump;
reg  [0:0] _q_jump;
reg  [0:0] _d_load;
reg  [0:0] _q_load;
reg  [0:0] _d_store;
reg  [0:0] _q_store;
reg signed [31:0] _d_val;
reg signed [31:0] _q_val;
reg  [0:0] _d_storeVal;
reg  [0:0] _q_storeVal;
reg  [0:0] _d_working = 0;
reg  [0:0] _q_working = 0;
reg  [31:0] _d_n;
reg  [31:0] _q_n;
reg  [0:0] _d_storeAddr;
reg  [0:0] _q_storeAddr;
reg  [0:0] _d_intop;
reg  [0:0] _q_intop;
reg signed [31:0] _d_r;
reg signed [31:0] _q_r;
assign out_op = _q_op;
assign out_write_rd = _q_write_rd;
assign out_no_rd = _q_no_rd;
assign out_jump = _q_jump;
assign out_load = _q_load;
assign out_store = _q_store;
assign out_val = _q_val;
assign out_storeVal = _q_storeVal;
assign out_working = _q_working;
assign out_n = _q_n;
assign out_storeAddr = _q_storeAddr;
assign out_intop = _q_intop;
assign out_r = _q_r;


assign _w_imm_u = {in_instr[12+:20],12'b0};
assign _w_imm_j = {{12{in_instr[31+:1]}},in_instr[12+:8],in_instr[20+:1],in_instr[21+:10],1'b0};
assign _w_imm_i = {{20{in_instr[31+:1]}},in_instr[20+:12]};
assign _w_imm_b = {{20{in_instr[31+:1]}},in_instr[7+:1],in_instr[25+:6],in_instr[8+:4],1'b0};
assign _w_imm_s = {{20{in_instr[31+:1]}},in_instr[25+:7],in_instr[7+:5]};
assign _w_opcode = in_instr[2+:5];
assign _w_AUIPC = _w_opcode==5'b00101;
assign _w_LUI = _w_opcode==5'b01101;
assign _w_JAL = _w_opcode==5'b11011;
assign _w_JALR = _w_opcode==5'b11001;
assign _w_IntImm = _w_opcode==5'b00100;
assign _w_IntReg = _w_opcode==5'b01100;
assign _w_Cycles = _w_opcode==5'b11100;
assign _w_branch = _w_opcode==5'b11000;
assign _w_regOrImm = _w_IntReg|_w_branch;
assign _w_pcOrReg = _w_AUIPC|_w_JAL|_w_branch;
assign _w_sub = _w_IntReg&in_instr[30+:1];
assign _w_aluShift = (_w_IntImm|_w_IntReg)&_d_op[0+:2]==2'b01;
assign _w_addr_a = _w_pcOrReg ? $signed({1'b0,in_pc[0+:10],2'b0}):in_xa;
assign _w_b = _w_regOrImm ? (in_xb):_w_imm_i;
assign _w_a_minus_b = {1'b1,~_w_b}+{1'b0,in_xa}+33'b1;
assign _w_a_lt_b = (in_xa[31+:1]^_w_b[31+:1]) ? in_xa[31+:1]:_w_a_minus_b[32+:1];
assign _w_a_lt_b_u = _w_a_minus_b[32+:1];
assign _w_a_eq_b = _w_a_minus_b[0+:32]==0;
assign _w_addr_imm = (_w_AUIPC ? _w_imm_u:32'b0)|(_w_JAL ? _w_imm_j:32'b0)|(_w_branch ? _w_imm_b:32'b0)|((_w_JALR|_d_load) ? _w_imm_i:32'b0)|(_d_store ? _w_imm_s:32'b0);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_shamt = _q_shamt;
_d_cycle = _q_cycle;
_d_op = _q_op;
_d_write_rd = _q_write_rd;
_d_no_rd = _q_no_rd;
_d_jump = _q_jump;
_d_load = _q_load;
_d_store = _q_store;
_d_val = _q_val;
_d_storeVal = _q_storeVal;
_d_working = _q_working;
_d_n = _q_n;
_d_storeAddr = _q_storeAddr;
_d_intop = _q_intop;
_d_r = _q_r;
// _always_pre
_d_load = _w_opcode==5'b00000;
_d_store = _w_opcode==5'b01000;
_d_op = in_instr[12+:3];
_d_write_rd = in_instr[7+:5];
_d_no_rd = _w_branch|_d_store|(in_instr[7+:5]==5'b0);
_d_intop = (_w_IntImm|_w_IntReg);
_d_storeAddr = _w_AUIPC;
_d_val = _w_LUI ? _w_imm_u:_q_cycle;
_d_storeVal = _w_LUI|_w_Cycles;
_d_cycle = _q_cycle+1;
// __block_1
if (_q_working) begin
// __block_2
// __block_4
_d_shamt = _q_shamt-1;
_t___block_1_shift = _d_op[2+:1] ? (in_instr[30+:1] ? {_q_r[31+:1],_q_r[1+:31]}:{$signed(1'b0),_q_r[1+:31]}):{_q_r[0+:31],$signed(1'b0)};
// __block_5
end else begin
// __block_3
// __block_6
_d_shamt = ((_w_aluShift&in_trigger) ? $unsigned(_w_b[0+:5]):0);
_t___block_1_shift = in_xa;
// __block_7
end
// __block_8
_d_working = (_d_shamt!=0);
  case (_d_op)
  3'b000: begin
// __block_10_case
// __block_11
_d_r = _w_sub ? _w_a_minus_b:in_xa+_w_b;
// __block_12
  end
  3'b010: begin
// __block_13_case
// __block_14
_d_r = _w_a_lt_b;
// __block_15
  end
  3'b011: begin
// __block_16_case
// __block_17
_d_r = _w_a_lt_b_u;
// __block_18
  end
  3'b100: begin
// __block_19_case
// __block_20
_d_r = in_xa^_w_b;
// __block_21
  end
  3'b110: begin
// __block_22_case
// __block_23
_d_r = in_xa|_w_b;
// __block_24
  end
  3'b001: begin
// __block_25_case
// __block_26
_d_r = _t___block_1_shift;
// __block_27
  end
  3'b101: begin
// __block_28_case
// __block_29
_d_r = _t___block_1_shift;
// __block_30
  end
  3'b111: begin
// __block_31_case
// __block_32
_d_r = in_xa&_w_b;
// __block_33
  end
  default: begin
// __block_34_case
// __block_35
_d_r = {32{1'bx}};
// __block_36
  end
endcase
// __block_9
  case (_d_op[1+:2])
  2'b00: begin
// __block_38_case
// __block_39
_t___block_1_j = _w_a_eq_b;
// __block_40
  end
  2'b10: begin
// __block_41_case
// __block_42
_t___block_1_j = _w_a_lt_b;
// __block_43
  end
  2'b11: begin
// __block_44_case
// __block_45
_t___block_1_j = _w_a_lt_b_u;
// __block_46
  end
  default: begin
// __block_47_case
// __block_48
_t___block_1_j = 1'bx;
// __block_49
  end
endcase
// __block_37
_d_jump = (_w_JAL|_w_JALR)|(_w_branch&(_t___block_1_j^_d_op[0+:1]));
_d_n = _w_addr_a+_w_addr_imm;
// __block_50
// _always_post
end

always @(posedge clock) begin
_q_shamt <= _d_shamt;
_q_cycle <= _d_cycle;
_q_op <= _d_op;
_q_write_rd <= _d_write_rd;
_q_no_rd <= _d_no_rd;
_q_jump <= _d_jump;
_q_load <= _d_load;
_q_store <= _d_store;
_q_val <= _d_val;
_q_storeVal <= _d_storeVal;
_q_working <= _d_working;
_q_n <= _d_n;
_q_storeAddr <= _d_storeAddr;
_q_intop <= _d_intop;
_q_r <= _d_r;
end

endmodule

module M_rv32i_cpu__cpu (
in_mem_rdata,
out_mem_addr,
out_mem_wenable,
out_mem_wdata,
in_run,
out_done,
reset,
out_clock,
clock
);
input  [32-1:0] in_mem_rdata;
output  [12-1:0] out_mem_addr;
output  [4-1:0] out_mem_wenable;
output  [32-1:0] out_mem_wdata;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [2:0] _w_exec_op;
wire  [4:0] _w_exec_write_rd;
wire  [0:0] _w_exec_no_rd;
wire  [0:0] _w_exec_jump;
wire  [0:0] _w_exec_load;
wire  [0:0] _w_exec_store;
wire signed [31:0] _w_exec_val;
wire  [0:0] _w_exec_storeVal;
wire  [0:0] _w_exec_working;
wire  [31:0] _w_exec_n;
wire  [0:0] _w_exec_storeAddr;
wire  [0:0] _w_exec_intop;
wire signed [31:0] _w_exec_r;
wire signed [31:0] _w_mem_xregsA_rdata;
wire signed [31:0] _w_mem_xregsB_rdata;
reg  [0:0] _t_xregsA_wenable;
reg signed [31:0] _t_xregsA_wdata;
reg  [4:0] _t_xregsA_addr;
reg  [0:0] _t_xregsB_wenable;
reg signed [31:0] _t_xregsB_wdata;
reg  [4:0] _t_xregsB_addr;
reg signed [31:0] _t_loaded;
reg  [4-1:0] _t_mem_wenable;
reg  [32-1:0] _t_mem_wdata;
wire  [11:0] _w_next_pc;
wire  [31:0] _w___block_1_aligned;
wire signed [31:0] _w___block_16_write_back;

reg  [31:0] _d_instr = 0;
reg  [31:0] _q_instr = 0;
reg  [11:0] _d_pc;
reg  [11:0] _q_pc;
reg  [12-1:0] _d_mem_addr;
reg  [12-1:0] _q_mem_addr;
reg  [0:0] _d_exec_trigger,_q_exec_trigger;
reg  [6:0] _d_index,_q_index = 64;
assign out_mem_addr = _d_mem_addr;
assign out_mem_wenable = _t_mem_wenable;
assign out_mem_wdata = _t_mem_wdata;
assign out_done = (_q_index == 64);
M_execute__cpu_exec exec (
.in_instr(_q_instr),
.in_pc(_q_pc),
.in_xa(_w_mem_xregsA_rdata),
.in_xb(_w_mem_xregsB_rdata),
.in_trigger(_d_exec_trigger),
.out_op(_w_exec_op),
.out_write_rd(_w_exec_write_rd),
.out_no_rd(_w_exec_no_rd),
.out_jump(_w_exec_jump),
.out_load(_w_exec_load),
.out_store(_w_exec_store),
.out_val(_w_exec_val),
.out_storeVal(_w_exec_storeVal),
.out_working(_w_exec_working),
.out_n(_w_exec_n),
.out_storeAddr(_w_exec_storeAddr),
.out_intop(_w_exec_intop),
.out_r(_w_exec_r),
.reset(reset),
.clock(clock));

M_rv32i_cpu__cpu_mem_xregsA __mem__xregsA(
.clock(clock),
.in_xregsA_wenable(_t_xregsA_wenable),
.in_xregsA_wdata(_t_xregsA_wdata),
.in_xregsA_addr(_t_xregsA_addr),
.out_xregsA_rdata(_w_mem_xregsA_rdata)
);
M_rv32i_cpu__cpu_mem_xregsB __mem__xregsB(
.clock(clock),
.in_xregsB_wenable(_t_xregsB_wenable),
.in_xregsB_wdata(_t_xregsB_wdata),
.in_xregsB_addr(_t_xregsB_addr),
.out_xregsB_rdata(_w_mem_xregsB_rdata)
);

assign _w_next_pc = _q_pc+1;
assign _w___block_1_aligned = in_mem_rdata>>{_w_exec_n[0+:2],3'b000};
assign _w___block_16_write_back = (_w_exec_jump ? (_w_next_pc<<2):32'b0)|(_w_exec_storeAddr ? _w_exec_n[0+:14]:32'b0)|(_w_exec_storeVal ? _w_exec_val:32'b0)|(_w_exec_load ? _t_loaded:32'b0)|(_w_exec_intop ? _w_exec_r:32'b0);

`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (in_run || out_done));
`endif
always @* begin
_d_instr = _q_instr;
_d_pc = _q_pc;
_d_mem_addr = _q_mem_addr;
_d_exec_trigger = _q_exec_trigger;
_d_index = _q_index;
_t_xregsA_wdata = 0;
_t_xregsA_addr = 0;
_t_xregsB_wenable = 0;
_t_xregsB_wdata = 0;
_t_xregsB_addr = 0;
// _always_pre
// __block_1
  case (_w_exec_op[0+:2])
  2'b00: begin
// __block_3_case
// __block_4
_t_loaded = {{24{(~_w_exec_op[2+:1])&_w___block_1_aligned[7+:1]}},_w___block_1_aligned[0+:8]};
// __block_5
  end
  2'b01: begin
// __block_6_case
// __block_7
_t_loaded = {{16{(~_w_exec_op[2+:1])&_w___block_1_aligned[15+:1]}},_w___block_1_aligned[0+:16]};
// __block_8
  end
  2'b10: begin
// __block_9_case
// __block_10
_t_loaded = _w___block_1_aligned;
// __block_11
  end
  default: begin
// __block_12_case
// __block_13
_t_loaded = {32{1'bx}};
// __block_14
  end
endcase
// __block_2
_t_mem_wdata = _w_mem_xregsB_rdata<<{_w_exec_n[0+:2],3'b000};
_t_mem_wenable = 4'b0000;
_d_exec_trigger = 0;
_t_xregsA_wenable = 0;
// __block_15
(* parallel_case, full_case *)
case (1'b1)
_q_index[0]: begin
// _top
_d_index = 2;
end
_q_index[1]: begin
// __while__block_18
if (1) begin
// __block_19
// __block_21
_d_instr = in_mem_rdata;
_d_pc = _q_mem_addr;
_d_index = 8;
end else begin
_d_index = 4;
end
end
_q_index[3]: begin
// __block_22
_d_exec_trigger = 1;
_d_index = 16;
end
_q_index[2]: begin
// __block_20
_d_index = 64;
end
_q_index[4]: begin
// __while__block_23
if (1) begin
// __block_24
// __block_26
if (_w_exec_load|_w_exec_store) begin
// __block_27
// __block_29
_d_mem_addr = _w_exec_n>>2;
_t_mem_wenable = ({4{_w_exec_store}}&{{2{_w_exec_op[0+:2]==2'b10}},_w_exec_op[0+:1]|_w_exec_op[1+:1],1'b1})<<_w_exec_n[0+:2];
_d_index = 32;
end else begin
// __block_28
// __block_33
_t_xregsA_wenable = ~_w_exec_no_rd;
_d_mem_addr = _w_exec_jump ? (_w_exec_n>>2):_w_next_pc;
if (_w_exec_working==0) begin
// __block_34
// __block_36
_d_index = 2;
end else begin
// __block_35
_d_index = 16;
end
end
end else begin
_d_index = 2;
end
end
_q_index[5]: begin
// __block_30
_t_xregsA_wenable = ~_w_exec_no_rd;
_d_mem_addr = _w_next_pc;
_d_index = 2;
end
_q_index[6]: begin // end of 
end
default: begin 
_d_index = {3{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
// __block_16
_t_xregsA_wdata = _w___block_16_write_back;
_t_xregsB_wdata = _w___block_16_write_back;
_t_xregsB_wenable = _t_xregsA_wenable;
_t_xregsA_addr = _t_xregsA_wenable ? _w_exec_write_rd:_d_instr[15+:5];
_t_xregsB_addr = _t_xregsA_wenable ? _w_exec_write_rd:_d_instr[20+:5];
// __block_17
end

always @(posedge clock) begin
_q_instr <= _d_instr;
_q_pc <= _d_pc;
_q_mem_addr <= (reset | ~in_run) ? 0 : _d_mem_addr;
_q_index <= reset ? 64 : ( ~in_run ? 1 : _d_index);
_q_exec_trigger <= _d_exec_trigger;
end

endmodule

module M_main (
out_leds,
in_run,
out_done,
reset,
out_clock,
clock
);
output  [4:0] out_leds;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [11:0] _w_cpu_mem_addr;
wire  [3:0] _w_cpu_mem_wenable;
wire  [31:0] _w_cpu_mem_wdata;
wire _w_cpu_done;
wire  [31:0] _w_mem_mem_rdata;
wire  [0:0] _c_reg_miso;
assign _c_reg_miso = 0;
reg  [0:0] _t_prev_mem_rw;
reg  [31:0] _t_memio_rdata;
reg  [31:0] _t_mem_wenable;
reg  [31:0] _t_mem_wdata;
reg  [10:0] _t_mem_addr;

reg  [11:0] _d_prev_mem_addr = 0;
reg  [11:0] _q_prev_mem_addr = 0;
reg  [31:0] _d_cycle = 0;
reg  [31:0] _q_cycle = 0;
reg  [4:0] _d_leds;
reg  [4:0] _q_leds;
reg  [1:0] _d_index,_q_index = 3;
reg  _autorun = 0;
reg  _cpu_run = 0;
assign out_leds = _q_leds;
assign out_done = (_q_index == 3) & _autorun;
M_rv32i_cpu__cpu cpu (
.in_mem_rdata(_t_memio_rdata),
.out_mem_addr(_w_cpu_mem_addr),
.out_mem_wenable(_w_cpu_mem_wenable),
.out_mem_wdata(_w_cpu_mem_wdata),
.out_done(_w_cpu_done),
.in_run(_cpu_run),
.reset(reset),
.clock(clock));

M_main__mem_mem __mem__mem(
.clock(clock),
.in_mem_wenable(_t_mem_wenable),
.in_mem_wdata(_t_mem_wdata),
.in_mem_addr(_t_mem_addr),
.out_mem_rdata(_w_mem_mem_rdata)
);


`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_prev_mem_addr = _q_prev_mem_addr;
_d_cycle = _q_cycle;
_d_leds = _q_leds;
_d_index = _q_index;
_cpu_run = 1;
// _always_pre
// __block_1
_t_mem_wenable = _w_cpu_mem_wenable&{4{~_w_cpu_mem_addr[11+:1]}};
_t_memio_rdata = (_q_prev_mem_addr[11+:1]&_q_prev_mem_addr[4+:1]) ? {31'b0,_c_reg_miso}:_w_mem_mem_rdata;
_d_prev_mem_addr = _w_cpu_mem_addr;
_t_prev_mem_rw = _w_cpu_mem_wenable[0+:1];
_t_mem_wdata = _w_cpu_mem_wdata;
_t_mem_addr = _w_cpu_mem_addr;
if (_w_cpu_mem_addr[11+:1]) begin
// __block_2
// __block_4
_d_leds = _t_mem_wdata[0+:5]&{5{_w_cpu_mem_addr[0+:1]}};
if (_w_cpu_mem_addr[0+:1]) begin
// __block_5
// __block_7
$display("[cycle %d] LEDs: %b",_q_cycle,_d_leds);
// __block_8
end else begin
// __block_6
end
// __block_9
if (_w_cpu_mem_addr[4+:1]) begin
// __block_10
// __block_12
$display("[cycle %d] SPI write %b",_q_cycle,_t_mem_wdata[0+:3]);
// __block_13
end else begin
// __block_11
end
// __block_14
// __block_15
end else begin
// __block_3
end
// __block_16
_d_cycle = _q_cycle+1;
// __block_17
(* full_case *)
case (_q_index)
0: begin
// _top
_cpu_run = 0;
_d_index = 1;
end
1: begin
// __block_18
if (_w_cpu_done == 1) begin
_d_index = 2;
end else begin
_d_index = 1;
end
end
2: begin
// __block_19
_d_index = 3;
end
3: begin // end of 
end
default: begin 
_d_index = {2{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_prev_mem_addr <= _d_prev_mem_addr;
_q_cycle <= _d_cycle;
_q_leds <= _d_leds;
_q_index <= reset ? 3 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

