// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`default_nettype none
`ifndef serdes_SERIALIZER
`define serdes_SERIALIZER
`include "regs.v"

module serdes_Serializer #(
  parameter int BIT_WIDTH = 32,
  parameter int N_SAMPLES = 8
) (
  input logic [BIT_WIDTH - 1:0] recv_msg[N_SAMPLES],
  input logic recv_val,
  output logic recv_rdy,

  output logic [BIT_WIDTH - 1:0] send_msg,
  output logic send_val,
  input logic send_rdy,

  input logic reset,
  input logic clk
);
  generate
    if (N_SAMPLES == 1) begin
      assign recv_rdy = send_rdy;
      assign send_val = recv_val;
      assign send_msg = recv_msg[0];

      logic unused = {1'b0, clk, reset, 1'b0};
    end else begin
      logic [$clog2(N_SAMPLES) - 1:0] mux_sel;
      logic reg_en;
      logic [BIT_WIDTH - 1:0] reg_out[N_SAMPLES - 1:0];

      for (genvar i = 0; i < N_SAMPLES; i++) begin : l_regs
        cmn_EnResetReg #(BIT_WIDTH) register (
          .clk(clk),
          .reset(reset),
          .en(reg_en),
          .d(recv_msg[i]),
          .q(reg_out[i])
        );
      end

      assign send_msg = reg_out[mux_sel];

      SerializerControl #(
        .N_SAMPLES(N_SAMPLES)
      ) ctrl (
        .clk(clk),
        .reset(reset),
        .recv_val(recv_val),
        .recv_rdy(recv_rdy),
        .send_val(send_val),
        .send_rdy(send_rdy),
        .mux_sel(mux_sel),
        .reg_en(reg_en)
      );
    end
  endgenerate
endmodule


module SerializerControl #(
  parameter int N_SAMPLES = 8
) (
  input  logic recv_val,
  output logic recv_rdy,

  output logic send_val,
  input  logic send_rdy,

  output logic [$clog2(N_SAMPLES) - 1:0] mux_sel,
  output logic reg_en,

  input logic clk,
  input logic reset
);

  logic INIT = 1'b0, OUTPUT_START = 1'b1;

  logic next_state;
  logic state;

  // Number of bits to represent N_SAMPLES-1
  localparam int NS_EXC_W = $clog2(N_SAMPLES);
  // Number of bits to represent N_SAMPLES
  localparam int NS_W = $clog2(N_SAMPLES + 1);
  logic [NS_W-1:0] mux_sel_next;

  always_comb begin
    case (state)
      INIT: begin
        if (reset == 1) next_state = INIT;
        else if (recv_val == 1) next_state = OUTPUT_START;
        else next_state = INIT;
      end
      OUTPUT_START: begin
        if (mux_sel_next != N_SAMPLES[NS_W-1:0]) next_state = OUTPUT_START;
        else next_state = INIT;
      end
      default: next_state = INIT;
    endcase
  end

  always_comb begin
    case (state)
      INIT: begin
        reg_en = 1;
        send_val = 0;
        recv_rdy = 1;
        mux_sel_next = 0;
      end
      OUTPUT_START: begin
        reg_en   = 0;
        send_val = 1;
        recv_rdy = 0;
        if (send_rdy == 1) mux_sel_next = {{(NS_W - NS_EXC_W) {1'b0}}, mux_sel} + 1;
        else mux_sel_next = {{(NS_W - NS_EXC_W) {1'b0}}, mux_sel};
      end
      default: begin
        reg_en = 1;
        send_val = 0;
        recv_rdy = 1;
        mux_sel_next = 0;
      end
    endcase
  end

  always_ff @(posedge clk) begin
    if (reset) begin
      state   <= INIT;
      mux_sel <= 0;
    end else begin
      mux_sel <= mux_sel_next[NS_EXC_W-1:0];
      state   <= next_state;
    end
  end
endmodule
`endif
