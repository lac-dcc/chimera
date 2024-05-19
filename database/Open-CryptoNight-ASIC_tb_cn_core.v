// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

module cn_core(
  clk,
  reset_l,
  s_in,
  s_out,
  cfg
  );

parameter ADDR_WIDTH = 17;

`include "cn.vh"
`include "io_link_symbols.vh"

input  clk;
input  reset_l;
input  [8:0] s_in;
output reg [8:0] s_out;
input      [CFG_BITS-1:0] cfg; // Static configuration settings

reg init, ctrl_start;
reg data_symbol_in;
reg command_symbol_in;
reg send_symbol_SOF, send_symbol_EOF;

always @(*) begin
  init = 0;
  ctrl_start = 0;
  data_symbol_in = !s_in[8];
  command_symbol_in = !data_symbol_in;
  send_symbol_SOF = 0;
  send_symbol_EOF = 0;
  if (command_symbol_in) case (s_in)
  symbol_idle   : ; // nop
  symbol_init  : init = 1;
  symbol_start : ctrl_start = 1;
  symbol_SOF, symbol_SOF_no_RX : send_symbol_SOF = 1;
  symbol_EOF : send_symbol_EOF = 1;
  endcase
end

reg [3:0] state, next_state;
reg [127:0] SR_in, SR_out;

reg [11:0] byte_addr;
// wire [127:0] reg_wrdata = {s_in, SR_in} >> 8;
wire [127:0] reg_wrdata = {s_in, SR_in} >> 8;
wire reg_write = data_symbol_in && byte_addr[3:0]==15;
wire [127:0] reg_rddata;
reg [4:0] out_count;
reg send_symbol_finished;

reg send_symbol_EOF1;
always @(posedge clk or negedge reset_l)
  if (!reset_l)
    send_symbol_EOF1 <= 0;
  else if (send_symbol_EOF)
    send_symbol_EOF1 <= 1;
  else if (s_out == symbol_EOF)
    send_symbol_EOF1 <= 0;


always @(posedge clk or negedge reset_l)
  if (!reset_l) begin
    state <= 0;
    SR_in <= 0;
    byte_addr <= 0;
    out_count <= 'h10;
    SR_out <= 0;
  end else if (init) begin
    state <= 0;
    byte_addr <= 0;
    out_count <= 'h10;
  end else begin
    state <= next_state;
    if (data_symbol_in) begin
      SR_in <= reg_wrdata;
      byte_addr <= byte_addr + 1;
    end
    if (data_symbol_in && byte_addr[3:0]==1) begin
      SR_out <= reg_rddata;
      out_count <= 0;
    end else if (send_symbol_finished); // NOP
    else if (out_count < 'h10) begin
      SR_out <= SR_out >> 8;
      out_count <= out_count + 1;
    end
  end

always @(*)
  if (send_symbol_finished)
    s_out = symbol_finished; // Finish
  else if (send_symbol_SOF)
    s_out = symbol_SOF;
  else if (out_count < 'h10)
    s_out = {1'b0, SR_out[7:0]};
  else if (send_symbol_EOF1)
    s_out = symbol_EOF;
  else
    s_out = symbol_idle; // NOP

wire sts_finished;

always @(*) begin
  next_state = state + 1;
  send_symbol_finished = 0;
  case (state)
  0: if (!ctrl_start) next_state = state;
  1: if (!sts_finished) next_state = state;
     else send_symbol_finished = 1;
  2: if (sts_finished || ctrl_start) next_state = state;
  default: ;
  endcase
end

cn_top #(.ADDR_WIDTH(ADDR_WIDTH)) t(
  .clk(clk),
  .reset_n(reset_l),
  .ctrl_start(ctrl_start),
  .sts_finished(sts_finished),
  // .sts_running(sts_running),

  .sts_il_fl_running(),
  .sts_ml_running(),
  .sts_int(),

  .reg_address(byte_addr[11:4]),
  .reg_write(reg_write),
  .reg_wrdata(reg_wrdata),
  .reg_rddata(reg_rddata),
  .cfg(cfg)
  );

endmodule
