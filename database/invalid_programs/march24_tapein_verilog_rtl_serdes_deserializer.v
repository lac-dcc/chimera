// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`default_nettype none
`ifndef serdes_DESERIALIZER
`define serdes_DESERIALIZER 
`include "../cmn/regs.v"

module serdes_Deserializer #(
  parameter int N_SAMPLES = 8,
  parameter int BIT_WIDTH = 32
) (

  input logic recv_val,
  output logic recv_rdy,
  input logic [BIT_WIDTH - 1:0] recv_msg,

  output logic send_val,
  input logic send_rdy,
  output logic [BIT_WIDTH - 1:0] send_msg[N_SAMPLES],

  input logic clk,
  input logic reset
);

  generate
    if (N_SAMPLES == 1) begin
      assign recv_rdy = send_rdy;
      assign send_val = recv_val;
      assign send_msg[0] = recv_msg;

      logic unused = {1'b0, clk, reset, 1'b0};
    end else begin
      logic [N_SAMPLES - 1:0] en_sel;

      //body of code
      DeserializerControl #(
        .N_SAMPLES(N_SAMPLES)
      ) c (
        .recv_val(recv_val),
        .send_rdy(send_rdy),

        .send_val(send_val),
        .recv_rdy(recv_rdy),

        .reset(reset),
        .clk  (clk),

        .en_sel(en_sel)
      );

      for (genvar i = 0; i < N_SAMPLES; i++) begin : l_regs
        cmn_EnResetReg #(BIT_WIDTH) register (
          .clk(clk),
          .reset(reset),
          .en(recv_rdy & en_sel[i]),
          .d(recv_msg),
          .q(send_msg[i])
        );
      end
    end
  endgenerate

endmodule

module DeserializerControl #(
  parameter int N_SAMPLES = 8
) (
  input logic recv_val,
  input logic send_rdy,

  output logic send_val,
  output logic recv_rdy,

  output logic [N_SAMPLES - 1:0] en_sel,

  input logic reset,
  input logic clk
);
  logic INIT = 1'b0, DONE = 1'b1;

  localparam int C_WIDTH = $clog2(N_SAMPLES) - 1;
  // Necessary because counter_next can go up to (including) N_SAMPLES
  // so we need an extra bit to avoid overflow.
  localparam int C_NXT_WIDTH = $clog2(N_SAMPLES + 1) - 1;
  logic [C_WIDTH:0] count;  //counter
  logic [C_NXT_WIDTH:0] count_next;

  logic next_state;
  logic state;

  Decoder #($clog2(
      N_SAMPLES
  )) decoder (
    .in (count),
    .out(en_sel)
  );

  always_comb begin
    case (state)
      INIT: begin
        if (count_next == N_SAMPLES[C_NXT_WIDTH:0]) begin
          next_state = DONE;
        end else begin
          next_state = INIT;
        end
      end
      DONE: begin
        if (send_rdy == 1) begin
          next_state = INIT;
        end else begin
          next_state = DONE;
        end
      end
      default: next_state = INIT;
    endcase
  end

  always_comb begin
    case (state)
      INIT: begin
        if (recv_val == 1) begin
          count_next = {{(C_NXT_WIDTH - C_WIDTH) {1'b0}}, count} + 1;
        end else begin
          count_next = {{(C_NXT_WIDTH - C_WIDTH) {1'b0}}, count};
        end

        recv_rdy = 1'b1;
        send_val = 1'b0;
      end

      DONE: begin
        count_next = 0;
        recv_rdy   = 1'b0;
        send_val   = 1'b1;
      end

      default: begin
        count_next = 0;
        recv_rdy   = 1'b1;
        send_val   = 1'b0;
      end

    endcase

  end

  always_ff @(posedge clk) begin
    if (reset) begin
      count <= 0;
      state <= INIT;
    end else begin
      count <= count_next[$clog2(N_SAMPLES)-1:0];
      state <= next_state;
    end
  end
endmodule

module Decoder #(
  parameter int BIT_WIDTH = 3
) (
  input logic [BIT_WIDTH - 1:0] in,
  output logic [(1 << BIT_WIDTH) - 1:0] out
);
  assign out = {{(1 << BIT_WIDTH) - 1{1'b0}}, 1'b1} << in;
endmodule
`endif
