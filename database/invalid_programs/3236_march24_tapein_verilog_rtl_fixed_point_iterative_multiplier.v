// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//================================================
// Iterative Multiplier
// --------------------
// Unpipelined fixed point iterative multiplier
// using Val/Rdy interface. This is a simple
// unpipelined multiplier that takes `n` cycles
// to complete a multiplication.
//================================================
`default_nettype none
`ifndef fixed_point_iterative_MULTIPLIER
`define fixed_point_iterative_MULTIPLIER

`include "cmn/muxes.v"
`include "cmn/regs.v"

module fixed_point_iterative_Multiplier #(
  parameter int n = 32,  // bit width
  parameter int d = 16,  // number of decimal bits
  parameter bit sign = 1  // 1 if signed, 0 otherwise.
) (
  input logic clk,
  input logic reset,

  output logic recv_rdy,
  input logic recv_val,
  input logic [n - 1:0] a,
  input logic [n - 1:0] b,

  input logic send_rdy,
  output logic send_val,
  output logic [n - 1:0] c
);
  // performs the operation c = a*b
  // Equivalent to taking the integer representations of both numbers,
  // multiplying, and then shifting right
  logic do_carry, do_add, in_wait;

  FXPIterMultControl #(n, d) control (
    .clk(clk),
    .reset(reset),
    .recv_val(recv_val),
    .recv_rdy(recv_rdy),
    .send_val(send_val),
    .send_rdy(send_rdy),
    .in_wait(in_wait),
    .do_add(do_add),
    .do_carry(do_carry)
  );

  FXPIterMultDatapath #(n, d) datapath (
    .clk(clk),
    .reset(reset),
    .in_wait(in_wait),
    .do_add(do_add),
    .do_carry((sign != 0) & do_carry),
    .a({{d{(sign != 0) & a[n-1]}}, a}),
    .b(b),
    .c(c)
  );

endmodule

module FXPIterMultControl #(
  parameter int n = 32,
  parameter int d = 16
) (
  input  logic clk,
  input  logic reset,
  input  logic recv_val,
  output logic recv_rdy,
  output logic send_val,
  input  logic send_rdy,
  output logic in_wait,
  output logic do_add,
  output logic do_carry
);
  logic [1:0] IDLE = 2'd0, CALC = 2'd1, DONE = 2'd2;

  logic [1:0] state, next_state;
  logic [$clog2(n)-1:0] counter;
  logic counter_reset;

  // manage state
  always_comb begin
    case (state)
      IDLE: begin
        if (recv_val) next_state = CALC;
        else next_state = IDLE;
      end
      CALC: begin
        if (counter == ($clog2(n))'(n - 1)) next_state = DONE;
        else next_state = CALC;
      end
      DONE: begin
        if (send_rdy) next_state = IDLE;
        else next_state = DONE;
      end
      default: begin
        next_state = IDLE;
      end
    endcase
  end

  // manage datapath
  always_comb begin
    case (state)
      IDLE: begin
        in_wait = 1;
        do_add = 0;
        do_carry = 0;
        counter_reset = 0;
        recv_rdy = 1;
        send_val = 0;
      end
      CALC: begin
        in_wait = 0;
        do_add = 1;
        do_carry = (counter == ($clog2(n))'(n - 1));
        counter_reset = 0;
        recv_rdy = 0;
        send_val = 0;
      end
      DONE: begin
        in_wait = 0;
        do_add = 0;
        do_carry = 0;
        counter_reset = 1;
        recv_rdy = 0;
        send_val = 1;
      end
      default: begin
      end
    endcase
  end

  // reset logic
  always_ff @(posedge clk) begin
    if (reset) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  // counter logic
  always_ff @(posedge clk) begin
    if (reset || counter_reset) begin
      counter <= 0;
    end else if (state == CALC) begin
      counter <= counter + 1;
    end else begin
      counter <= counter;
    end
  end

endmodule

module FXPIterMultDatapath #(
  parameter int n = 32,
  parameter int d = 16
) (
  input logic clk,
  input logic reset,
  input logic in_wait,  // waiting for input
  input logic do_add,
  input logic do_carry,
  input logic [n+d-1:0] a,
  input logic [n-1:0] b,
  output logic [n-1:0] c
);
  // accumulator for the current product
  logic [(n+d)-1:0] acc_in;
  logic [(n+d)-1:0] acc_out;

  cmn_ResetReg #(n + d) acc_reg (
    .clk(clk),
    .reset(in_wait | reset),
    .d(acc_in),
    .q(acc_out)
  );

  // holds the `a` input in a register
  logic [(n+d)-1:0] a_const_out;

  cmn_EnResetReg #(n + d) a_const_reg (
    .clk(clk),
    .reset(reset),
    .en(in_wait),
    .d(a),
    .q(a_const_out)
  );

  // holds the shifting `a` input
  logic [(n+d)-1:0] a_in;
  logic [(n+d)-1:0] a_out;

  cmn_ResetReg #(n + d) a_reg (
    .clk(clk),
    .reset(reset),
    .d(a_in),
    .q(a_out)
  );

  // holds the shifting `b` input
  logic [n-1:0] b_in;
  logic [n-1:0] b_out;

  cmn_ResetReg #(n) b_reg (
    .clk(clk),
    .reset(reset),
    .d(b_in),
    .q(b_out)
  );

  // shifts `a` to the left every cycle during calculation
  cmn_Mux2 #(n + d) a_sel (
    .in0(a_out << 1),
    .in1(a),
    .sel(in_wait),
    .out(a_in)
  );

  // shifts `b` to the right every cycle during calculation
  cmn_Mux2 #(n) b_sel (
    .in0(b_out >> 1),
    .in1(b),
    .sel(in_wait),
    .out(b_in)
  );

  logic [n+d-1:0] add_tmp;

  // stores the extra carry information, which allows us to skip the additional
  // `d` cycles we would usually need.
  logic [2*n-1:0] carry_tmp;

  /* verilator lint_off UNUSED */
  // top n-d bits here will be unused.
  logic [2*n-1:0] carry_tmp2;
  /* verilator lint_on UNUSED */

  // a sign-extended to the right length
  assign carry_tmp  = {{(n - d) {a_const_out[n+d-1]}}, a_const_out};
  // left shift by n, then subtract to get the carry
  // this is equivalent to multiplying `a` by `d+1` ones, which is equivalent to the last
  // `d+1` cycles in the multiplication, because `b` is either one-extended or zero-extended
  // from `n` bits to `n+d` bits. This allows us to do the multiplication in `n` cycles only.
  assign carry_tmp2 = ((carry_tmp << (d + 1)) - carry_tmp) << (n - 1);


  // choose between the carry and the add
  cmn_Mux2 #(n + d) carry_sel (
    .in0(a_out),
    .in1(carry_tmp2[n+d-1:0]),
    .sel(do_carry),
    .out(add_tmp)
  );

  // add to the accumulator
  cmn_Mux2 #(n + d) add_sel (
    .in0(acc_out),
    .in1(acc_out + add_tmp),
    .sel(do_add & b_out[0]),
    .out(acc_in)
  );

  assign c = acc_out[n+d-1:d];
endmodule

`endif
