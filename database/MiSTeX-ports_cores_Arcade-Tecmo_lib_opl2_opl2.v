// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

/*
 * Copyright (c) 2014 Greg Taylor <gtaylor@sonic.net>
 *
 * This file is part of OPL3 FPGA.
 *
 * OPL3 FPGA is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OPL3 FPGA is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with OPL3 FPGA.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Original Java Code:
 * Copyright (c) 2008 Robson Cozendey <robson@cozendey.com>
 *
 * Original C++ Code:
 * Copyright (c) 2012  Steffen Ohrendorf <steffen.ohrendorf@gmx.de>
 *
 * Some code based on forum posts in:
 * http://forums.submarine.org.uk/phpBB/viewforum.php?f=9,
 * Copyright (c) 2010-2013 by carbon14 and opl3
 *
 * Converted to Verilog and reduced to the OPL2 subset:
 * Copyright (c) 2018 Magnus Karlsson <magnus@saanlima.com>
 *
 * Fixed and refactored:
 * Copyright (c) 2020 Josh Bassett
 */

`include "opl.vh"

module opl2 #(
  parameter real CLK_FREQ = 50000000 // MHz
) (
  input rst, // reset
  input clk, // clock

  // data bus
  input  [7:0] din,
  output [7:0] dout,

  // control signals
  input cs_n,
  input wr_n,
  input a0,

  // interrupt signal sent from either of two timers
  output reg irq_n,

  // audio output
  output reg signed [15:0] sample
);

localparam OPERATOR_PIPELINE_DELAY = 7;
// 18 operators + idle state
localparam NUM_OPERATOR_UPDATE_STATES = `NUM_OPERATORS_PER_BANK + 1;

localparam IDLE = 0, CALC_OUTPUTS = 1;

reg [7:0] opl2_reg[255:0];

reg [11:0] cntr;
reg sample_clk_en;

reg nts;

reg [17:0] am;
reg [17:0] vib;
reg [17:0] egt;
reg [17:0] ksr;
reg [3:0] mult[17:0];

reg [1:0] ksl[17:0];
reg [5:0] tl[17:0];

reg [3:0] ar[17:0];
reg [3:0] dr[17:0];

reg [3:0] sl[17:0];
reg [3:0] rr[17:0];

reg [9:0] fnum[8:0];

reg [8:0] kon;
reg [2:0] block[8:0];

reg dam;
reg dvb;
reg ryt;
reg bd;
reg sd;
reg tom;
reg tc;
reg hh;

reg [8:0] chb;
reg [8:0] cha;
reg [2:0] fb[8:0];
reg [8:0] cnt;

reg [1:0] ws[17:0];

reg [9:0] fnum_tmp[17:0];
reg [2:0] block_tmp[17:0];
reg [2:0] fb_tmp[17:0];
reg [2:0] op_type_tmp[17:0];
reg [17:0] kon_tmp;
reg [17:0] use_feedback;
reg signed [12:0] modulation[17:0];

reg [`CLOG2(OPERATOR_PIPELINE_DELAY)-1:0] delay_counter;

reg [`CLOG2(NUM_OPERATOR_UPDATE_STATES)-1:0] delay_state;
reg [`CLOG2(NUM_OPERATOR_UPDATE_STATES)-1:0] next_delay_state;

reg [`CLOG2(`NUM_OPERATORS_PER_BANK)-1:0] op_num;

wire signed [12:0] operator_out_tmp;
reg signed [12:0] operator_out[17:0];

wire latch_feedback_pulse;

reg calc_state = IDLE;
reg next_calc_state;

reg [3:0] channel;

reg signed [`SAMPLE_WIDTH-1:0] channel_2_op[8:0];

reg signed [`CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_acc_pre_clamp = 0;
reg signed [`CHANNEL_ACCUMULATOR_WIDTH-1:0] channel_acc_pre_clamp_p[8:0];

wire read  = !cs_n && !a0;
wire write = !cs_n && !wr_n;

wire addr_write = (!a0 && write);
wire reg_write = (a0 && write);

/*
 * set data out if we're reading
 */
assign dout = read ? {timer1_overflow | timer2_overflow, timer1_overflow, timer2_overflow, 5'd0} : 8'h00;

/*
 * set register index
 */
reg [7:0] index;
always @(posedge clk, posedge rst) begin
  if (rst) index <= 0;
  else if (addr_write) index <= {din};
end

genvar i;
generate
  for (i = 0; i < 256; i = i + 1) begin: named
    always @ (posedge clk, posedge rst)
      if (rst)
        opl2_reg[i] <= 8'd0;
      else if (reg_write && index == i)
        opl2_reg[i] <= din;
  end
endgenerate

localparam integer CNTR_MAX = CLK_FREQ/`SAMPLE_CLK_FREQ;

always @(posedge clk, posedge rst)
  if (rst) begin
    cntr <= 12'd0;
    sample_clk_en <= 1'b0;
  end else begin
    // NOTE: A "real" opl3 uses a sampling rate of 49.7159kHz.
    cntr <= cntr == CNTR_MAX-1 ? 12'd0 : cntr + 1'b1;
    sample_clk_en <= cntr == 12'd0;
  end

/*
 * Registers that are not specific to a particular bank
 */
always @(posedge clk, posedge rst)
  if (rst) begin
    nts <= 1'b0;
    dam <= 1'b0;
    dvb <= 1'b0;
    ryt <= 1'b0;
    bd  <= 1'b0;
    sd  <= 1'b0;
    tom <= 1'b0;
    tc  <= 1'b0;
    hh  <= 1'b0;
  end else if (sample_clk_en) begin
    nts <= opl2_reg[8][6];
    dam <= opl2_reg['hBD][7];
    dvb <= opl2_reg['hBD][6];
    ryt <= opl2_reg['hBD][5];
    bd  <= opl2_reg['hBD][4];
    sd  <= opl2_reg['hBD][3];
    tom <= opl2_reg['hBD][2];
    tc  <= opl2_reg['hBD][1];
    hh  <= opl2_reg['hBD][0];
  end

generate
  for (i = 0; i < 6; i = i + 1) begin: name1
    always @(posedge clk, posedge rst) begin
      if (rst) begin
        am[i]   <= 1'b0;
        vib[i]  <= 1'b0;
        egt[i]  <= 1'b0;
        ksr[i]  <= 1'b0;
        mult[i] <= 4'd0;

        ksl[i] <= 2'd0;
        tl[i]  <= 6'd0;

        ar[i] <= 4'd0;
        dr[i] <= 4'd0;

        sl[i] <= 4'd0;
        rr[i] <= 4'd0;

        ws[i] <= 2'd0;
      end else if (sample_clk_en) begin
        am[i]   <= opl2_reg['h20+i][7];
        vib[i]  <= opl2_reg['h20+i][6];
        egt[i]  <= opl2_reg['h20+i][5];
        ksr[i]  <= opl2_reg['h20+i][4];
        mult[i] <= opl2_reg['h20+i][3:0];

        ksl[i] <= opl2_reg['h40+i][7:6];
        tl[i]  <= opl2_reg['h40+i][5:0];

        ar[i] <= opl2_reg['h60+i][7:4];
        dr[i] <= opl2_reg['h60+i][3:0];

        sl[i] <= opl2_reg['h80+i][7:4];
        rr[i] <= opl2_reg['h80+i][3:0];

        ws[i] <= opl2_reg['hE0+i][1:0];
      end
    end
  end
endgenerate

generate
  for (i = 6; i < 12; i = i + 1) begin: name2
    always @(posedge clk, posedge rst) begin
      if (rst) begin
        am[i]   <= 1'b0;
        vib[i]  <= 1'b0;
        egt[i]  <= 1'b0;
        ksr[i]  <= 1'b0;
        mult[i] <= 4'd0;

        ksl[i] <= 2'd0;
        tl[i]  <= 6'd0;

        ar[i] <= 4'd0;
        dr[i] <= 4'd0;

        sl[i] <= 4'd0;
        rr[i] <= 4'd0;

        ws[i] <= 2'd0;
      end else if (sample_clk_en) begin
        am[i]   <= opl2_reg['h22+i][7];
        vib[i]  <= opl2_reg['h22+i][6];
        egt[i]  <= opl2_reg['h22+i][5];
        ksr[i]  <= opl2_reg['h22+i][4];
        mult[i] <= opl2_reg['h22+i][3:0];

        ksl[i] <= opl2_reg['h42+i][7:6];
        tl[i]  <= opl2_reg['h42+i][5:0];

        ar[i] <= opl2_reg['h62+i][7:4];
        dr[i] <= opl2_reg['h62+i][3:0];

        sl[i] <= opl2_reg['h82+i][7:4];
        rr[i] <= opl2_reg['h82+i][3:0];

        ws[i] <= opl2_reg['hE2+i][1:0];
      end
    end
  end
endgenerate

generate
  for (i = 12; i < 18; i = i + 1) begin: name3
    always @(posedge clk, posedge rst) begin
      if (rst) begin
        am[i]   <= 1'b0;
        vib[i]  <= 1'b0;
        egt[i]  <= 1'b0;
        ksr[i]  <= 1'b0;
        mult[i] <= 4'd0;

        ksl[i] <= 2'd0;
        tl[i]  <= 6'd0;

        ar[i] <= 4'd0;
        dr[i] <= 4'd0;

        sl[i] <= 4'd0;
        rr[i] <= 4'd0;

        ws[i] <= 2'd0;
      end else if (sample_clk_en) begin
        am[i]   <= opl2_reg['h24+i][7];
        vib[i]  <= opl2_reg['h24+i][6];
        egt[i]  <= opl2_reg['h24+i][5];
        ksr[i]  <= opl2_reg['h24+i][4];
        mult[i] <= opl2_reg['h24+i][3:0];

        ksl[i] <= opl2_reg['h44+i][7:6];
        tl[i]  <= opl2_reg['h44+i][5:0];

        ar[i] <= opl2_reg['h64+i][7:4];
        dr[i] <= opl2_reg['h64+i][3:0];

        sl[i] <= opl2_reg['h84+i][7:4];
        rr[i] <= opl2_reg['h84+i][3:0];

        ws[i] <= opl2_reg['hE4+i][1:0];
      end
    end
  end
endgenerate

generate
  for (i = 0; i < 9; i = i + 1) begin: name4
    always @(posedge clk, posedge rst) begin
      if (rst) begin
        fnum[i] <= 10'd0;

        kon[i] <= 1'b0;
        block[i] <= 3'd0;

        chb[i] <= 1'b0;
        cha[i] <= 1'b0;
        fb[i]  <= 3'd0;
        cnt[i] <= 1'b0;
      end else if (sample_clk_en) begin
        fnum[i][7:0] <= opl2_reg['hA0+i];
        fnum[i][9:8] <= opl2_reg['hB0+i][1:0];

        kon[i] <= opl2_reg['hB0+i][5];
        block[i] <= opl2_reg['hB0+i][4:2];

        chb[i] <= opl2_reg['hC0+i][5];
        cha[i] <= opl2_reg['hC0+i][4];
        fb[i]  <= opl2_reg['hC0+i][3:1];
        cnt[i] <= opl2_reg['hC0+i][0];
      end
    end
  end
endgenerate

always @ (*) begin
  /*
   * Operator input mappings
   *
   */
  fnum_tmp[0] = fnum[0];
  block_tmp[0] = block[0];
  kon_tmp[0] = kon[0];
  fb_tmp[0] = fb[0];
  op_type_tmp[0] = `OP_NORMAL;
  use_feedback[0] = 1;
  modulation[0] = 0;

  fnum_tmp[3] = fnum[0];
  block_tmp[3] = block[0];
  kon_tmp[3] = kon[0];
  fb_tmp[3] = 0;
  op_type_tmp[3] = `OP_NORMAL;
  use_feedback[3] = 0;
  modulation[3] = cnt[0] ? 0 : operator_out[0];

  fnum_tmp[1] = fnum[1];
  block_tmp[1] = block[1];
  kon_tmp[1] = kon[1];
  fb_tmp[1] = fb[1];
  op_type_tmp[1] = `OP_NORMAL;
  use_feedback[1] = 1;
  modulation[1] = 0;

  fnum_tmp[4] = fnum[1];
  block_tmp[4] = block[1];
  kon_tmp[4] = kon[1];
  fb_tmp[4] = 0;
  op_type_tmp[4] = `OP_NORMAL;
  use_feedback[4] = 0;
  modulation[4] = cnt[1] ? 0 : operator_out[1];

  fnum_tmp[2] = fnum[2];
  block_tmp[2] = block[2];
  kon_tmp[2] = kon[2];
  fb_tmp[2] = fb[2];
  op_type_tmp[2] = `OP_NORMAL;
  use_feedback[2] = 1;
  modulation[2] = 0;

  fnum_tmp[5] = fnum[2];
  block_tmp[5] = block[2];
  kon_tmp[5] = kon[2];
  fb_tmp[5] = 0;
  op_type_tmp[5] = `OP_NORMAL;
  use_feedback[5] = 0;
  modulation[5] = cnt[2] ? 0 : operator_out[2];

  fnum_tmp[6] = fnum[3];
  block_tmp[6] = block[3];
  kon_tmp[6] = kon[3];
  fb_tmp[6] = fb[3];
  op_type_tmp[6] = `OP_NORMAL;
  use_feedback[6] = 1;
  modulation[6] = 0;

  fnum_tmp[9] = fnum[3];
  block_tmp[9] = block[3];
  kon_tmp[9] = kon[3];
  fb_tmp[9] = 0;
  op_type_tmp[9] = `OP_NORMAL;
  use_feedback[9] = 0;
  modulation[9] = cnt[3] ? 0 : operator_out[6];

  fnum_tmp[7] = fnum[4];
  block_tmp[7] = block[4];
  kon_tmp[7] = kon[4];
  fb_tmp[7] = fb[4];
  op_type_tmp[7] = `OP_NORMAL;
  use_feedback[7] = 1;
  modulation[7] = 0;

  fnum_tmp[10] = fnum[4];
  block_tmp[10] = block[4];
  kon_tmp[10] = kon[4];
  fb_tmp[10] = 0;
  op_type_tmp[10] = `OP_NORMAL;
  use_feedback[10] = 0;
  modulation[10] = cnt[4] ? 0 : operator_out[7];

  fnum_tmp[8] = fnum[5];
  block_tmp[8] = block[5];
  kon_tmp[8] = kon[5];
  fb_tmp[8] = fb[5];
  op_type_tmp[8] = `OP_NORMAL;
  use_feedback[8] = 1;
  modulation[8] = 0;

  fnum_tmp[11] = fnum[5];
  block_tmp[11] = block[5];
  kon_tmp[11] = kon[5];
  fb_tmp[11] = 0;
  op_type_tmp[11] = `OP_NORMAL;
  use_feedback[11] = 0;
  modulation[11] = cnt[5] ? 0 : operator_out[8];

  // aka bass drum operator 1
  fnum_tmp[12] = fnum[6];
  block_tmp[12] = block[6];
  kon_tmp[12] = kon[6];
  fb_tmp[12] = fb[6];
  op_type_tmp[12] = ryt ? `OP_BASS_DRUM : `OP_NORMAL;
  use_feedback[12] = 1;
  modulation[12] = 0;

  // aka bass drum operator 2
  fnum_tmp[15] = fnum[6];
  block_tmp[15] = block[6];
  kon_tmp[15] = kon[6];
  fb_tmp[15] = 0;
  op_type_tmp[15] = ryt ? `OP_BASS_DRUM : `OP_NORMAL;
  use_feedback[15] = 0;
  modulation[15] = cnt[6] ? 0 : operator_out[12];

  // aka hi hat operator
  fnum_tmp[13] = fnum[7];
  block_tmp[13] = block[7];
  kon_tmp[13] = kon[7];
  fb_tmp[13] = ryt ? 0 : fb[7];
  op_type_tmp[13] = ryt ? `OP_HI_HAT : `OP_NORMAL;
  use_feedback[13] = ryt ? 0 : 1;
  modulation[13] = 0;

  // aka snare drum operator
  fnum_tmp[16] = fnum[7];
  block_tmp[16] = block[7];
  kon_tmp[16] = kon[7];
  fb_tmp[16] = 0;
  op_type_tmp[16] = ryt ? `OP_SNARE_DRUM : `OP_NORMAL;
  use_feedback[16] = 0;
  modulation[16] = cnt[7] || ryt ? 0 : operator_out[13];

  // aka tom tom operator
  fnum_tmp[14] = fnum[8];
  block_tmp[14] = block[8];
  kon_tmp[14] = kon[8];
  fb_tmp[14] = ryt ? 0 : fb[8];
  op_type_tmp[14] = ryt ? `OP_TOM_TOM : `OP_NORMAL;
  use_feedback[14] = ryt ? 0 : 1;
  modulation[14] = 0;

  // aka top cymbal operator
  fnum_tmp[17] = fnum[8];
  block_tmp[17] = block[8];
  kon_tmp[17] = kon[8];
  fb_tmp[17] = 0;
  op_type_tmp[17] = ryt ? `OP_TOP_CYMBAL : `OP_NORMAL;
  use_feedback[17] = 0;
  modulation[17] = cnt[8] || ryt ? 0 : operator_out[14];
end

always @(posedge clk, posedge rst)
  if (rst)
    delay_state <= 5'd0;
  else
    delay_state <= next_delay_state;

always @ (*)
  if (delay_state == 0)
    next_delay_state = sample_clk_en ? 1 : 0;
  else if (delay_counter == OPERATOR_PIPELINE_DELAY - 1)
    if (delay_state == NUM_OPERATOR_UPDATE_STATES - 1)
      next_delay_state = 0;
    else
      next_delay_state = delay_state + 1;
  else
    next_delay_state = delay_state;

always @(posedge clk, posedge rst)
  if (rst)
    delay_counter <= 0;
  else begin
    if (next_delay_state != delay_state)
      delay_counter <= 0;
    else if (delay_counter == OPERATOR_PIPELINE_DELAY - 1)
      delay_counter <= 0;
    else
      delay_counter <= delay_counter + 1;
  end

always @ (*)
  if (delay_state == 0)
    op_num = 0;
  else
    op_num = delay_state - 1;

/*
 * One operator is instantiated; it replicates the necessary registers for
 * all operator slots (phase accumulation, envelope state and value, etc).
 */
operator operator_inst(
  .rst(rst),
  .clk(clk),
  .sample_clk_en(delay_state != 0 && delay_counter == 0),
  .op_num(op_num),
  .fnum(fnum_tmp[op_num]),
  .mult(mult[op_num]),
  .block(block_tmp[op_num]),
  .ws(ws[op_num]),
  .vib(vib[op_num]),
  .kon(kon_tmp),
  .ar(ar[op_num]),
  .dr(dr[op_num]),
  .sl(sl[op_num]),
  .rr(rr[op_num]),
  .tl(tl[op_num]),
  .ksr(ksr[op_num]),
  .ksl(ksl[op_num]),
  .egt(egt[op_num]),
  .am(am[op_num]),
  .dam(dam),
  .dvb(dvb),
  .nts(nts),
  .bd(bd),
  .sd(sd),
  .tom(tom),
  .tc(tc),
  .hh(hh),
  .use_feedback(use_feedback[op_num]),
  .fb(fb_tmp[op_num]),
  .modulation(modulation[op_num]),
  .op_type(op_type_tmp[op_num]),
  .latch_feedback_pulse(latch_feedback_pulse),
  .out(operator_out_tmp)
);

always @(posedge clk)
  if (delay_counter == OPERATOR_PIPELINE_DELAY - 1)
    operator_out[op_num] <= operator_out_tmp;

/*
 * Signals to operator to latch output for feedback register
 */
assign latch_feedback_pulse = delay_counter == OPERATOR_PIPELINE_DELAY - 1;

always @(posedge clk, posedge rst)
  if (rst)
    calc_state <= IDLE;
  else
    calc_state <= next_calc_state;

always @ (*)
  case (calc_state)
  IDLE: next_calc_state = sample_clk_en ? CALC_OUTPUTS : IDLE;
  CALC_OUTPUTS: next_calc_state = channel == 8 ? IDLE : CALC_OUTPUTS;
  endcase

always @(posedge clk)
  if (calc_state == IDLE || channel == 8)
    channel <= 0;
  else
    channel <= channel + 1;

always @ (*) begin
  channel_2_op[0] = cnt[0] ? operator_out[0] + operator_out[ 3] : operator_out[ 3];
  channel_2_op[1] = cnt[1] ? operator_out[1] + operator_out[ 4] : operator_out[ 4];
  channel_2_op[2] = cnt[2] ? operator_out[2] + operator_out[ 5] : operator_out[ 5];
  channel_2_op[3] = cnt[3] ? operator_out[6] + operator_out[ 9] : operator_out[ 9];
  channel_2_op[4] = cnt[4] ? operator_out[7] + operator_out[10] : operator_out[10];
  channel_2_op[5] = cnt[5] ? operator_out[8] + operator_out[11] : operator_out[11];

  if (ryt)
    // bass drum is special
    channel_2_op[6] = cnt[6] ? operator_out[15] : operator_out[12];
  else
    channel_2_op[6] = cnt[6] ? operator_out[12] + operator_out[15] : operator_out[15];

  // aka hi hat and snare drum
  channel_2_op[7] = cnt[7] || (ryt) ? operator_out[13] + operator_out[16] : operator_out[16];

  // aka tom tom and top cymbal
  channel_2_op[8] = cnt[8] || (ryt)  ? operator_out[14] + operator_out[17] : operator_out[17];
end

always @(posedge clk) begin
  channel_acc_pre_clamp_p[0] <= channel_2_op[0];
  channel_acc_pre_clamp_p[1] <= channel_2_op[1];
  channel_acc_pre_clamp_p[2] <= channel_2_op[2];
  channel_acc_pre_clamp_p[3] <= channel_2_op[3];
  channel_acc_pre_clamp_p[4] <= channel_2_op[4];
  channel_acc_pre_clamp_p[5] <= channel_2_op[5];
  channel_acc_pre_clamp_p[6] <= channel_2_op[6];
  channel_acc_pre_clamp_p[7] <= channel_2_op[7];
  channel_acc_pre_clamp_p[8] <= channel_2_op[8];
end

/*
 * Each channel is accumulated (can be up to 19 bits) and then clamped to
 * 16-bits.
 */
always @(posedge clk)
  if (sample_clk_en)
    channel_acc_pre_clamp <= 0;
  else if (calc_state == CALC_OUTPUTS)
    channel_acc_pre_clamp <= channel_acc_pre_clamp +
     channel_acc_pre_clamp_p[channel];

/*
 * Clamp output channels
 */
always @(posedge clk)
  if (sample_clk_en)
    if (channel_acc_pre_clamp > 2**15 - 1)
      sample <= 2**15 - 1;
    else if (channel_acc_pre_clamp < -2**15)
      sample <= -2**15;
    else
      sample <= channel_acc_pre_clamp;

//------------------------------------------------------------------------------ timer 1

reg [7:0] timer1_preset;
always @(posedge clk, posedge rst) begin
  if (rst)                  timer1_preset <= 0;
  else if (reg_write && index == 2) timer1_preset <= din;
end

reg timer1_mask;
reg timer1_active;
always @(posedge clk, posedge rst) begin
  if (rst) {timer1_mask, timer1_active} <= 0;
  else if (reg_write && index == 4 && ~din[7]) {timer1_mask, timer1_active} <= {din[6], din[0]};
end

localparam integer TIMER1_MAX = CLK_FREQ*`TIMER1_TICK_INTERVAL;
localparam integer TIMER2_MAX = CLK_FREQ*`TIMER2_TICK_INTERVAL;

wire timer1_pulse;

timer #(
  .MAX_VALUE(TIMER1_MAX)
) timer1(
  .clk(clk),
  .init(timer1_preset),
  .start(timer1_active),
  .overflow(timer1_pulse)
);

reg timer1_overflow;
always @(posedge clk, posedge rst) begin
  if (rst) timer1_overflow <= 0;
  else begin
    if (reg_write && index == 4 && din[7]) timer1_overflow <= 0;
    if (timer1_pulse)                 		 timer1_overflow <= 1;
  end
end


//------------------------------------------------------------------------------ timer 2

reg [7:0] timer2_preset;
always @(posedge clk, posedge rst) begin
  if (rst) timer2_preset <= 0;
  else if (reg_write && index == 3) timer2_preset <= din;
end

reg timer2_mask;
reg timer2_active;
always @(posedge clk, posedge rst) begin
  if (rst) {timer2_mask, timer2_active} <= 0;
  else if (reg_write && index == 4 && ~din[7]) {timer2_mask, timer2_active} <= {din[5], din[1]};
end

wire timer2_pulse;

timer #(.MAX_VALUE(TIMER2_MAX)) timer2 (
  .clk(clk),
  .init(timer2_preset),
  .start(timer2_active),
  .overflow(timer2_pulse)
);

reg timer2_overflow;
always @(posedge clk, posedge rst) begin
  if (rst) timer2_overflow <= 0;
  else begin
    if (reg_write && index == 4 && din[7]) timer2_overflow <= 0;
    if (timer2_pulse)                      timer2_overflow <= 1;
  end
end


//------------------------------------------------------------------------------ IRQ

always @(posedge clk, posedge rst) begin
  if (rst) irq_n <= 1;
  else begin
    if (reg_write && index == 4 && din[7]) irq_n <= 1;
    if (~timer1_mask && timer1_pulse)      irq_n <= 0;
    if (~timer2_mask && timer2_pulse)      irq_n <= 0;
  end
end

endmodule
