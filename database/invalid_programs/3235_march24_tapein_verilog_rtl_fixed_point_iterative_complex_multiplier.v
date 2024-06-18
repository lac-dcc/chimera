// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//================================================
// Iterative Complex Multiplier
// -----------------------------------------------
// This module performs complex multiplication
// using an iterative approach, using three
// fixed-point multipliers.
// One multiplication takes 3*n cycles.
//================================================
`default_nettype none
`ifndef fixed_point_iterative_COMPLEX_MULTIPLIER
`define fixed_point_iterative_COMPLEX_MULTIPLIER
`include "fixed_point/iterative/multiplier.v"
`include "cmn/regs.v"
`include "cmn/muxes.v"

module fixed_point_iterative_ComplexMultiplier #(
  parameter int n = 32,  // bit width
  parameter int d = 16   // number of decimal bits
) (
  input logic clk,
  input logic reset,
  input logic recv_val,
  output logic recv_rdy,
  output logic send_val,
  input logic send_rdy,
  input logic [n-1:0] ar,
  input logic [n-1:0] ac,
  input logic [n-1:0] br,
  input logic [n-1:0] bc,
  output logic [n-1:0] cr,
  output logic [n-1:0] cc
);
  // performs c = a * b on complex a and b

  // cr = (ar * br) - (ac * bc)
  // cc = (ar * bc) + (br * ac) = (ar + ac)(br + bc) - (ac * bc) - (ar * br)

  logic mul_send_val, in_wait;
  logic [1:0] mul_stage;

  fpcmult_control #(n, d) control (
    .clk(clk),
    .reset(reset),
    .recv_val(recv_val),
    .recv_rdy(recv_rdy),
    .send_val(send_val),
    .send_rdy(send_rdy),
    .mul_send_val(mul_send_val),
    .in_wait(in_wait),
    .mul_stage(mul_stage)
  );

  fpcmult_datapath #(n, d) datapath (
    .clk(clk),
    .reset(reset),
    .ar(ar),
    .ac(ac),
    .br(br),
    .bc(bc),
    .cr(cr),
    .cc(cc),
    .mul_send_val(mul_send_val),
    .in_wait(in_wait),
    .mul_stage(mul_stage)
  );
endmodule

module fpcmult_control #(
  parameter int n = 32,
  parameter int d = 16
) (
  input logic clk,
  input logic reset,
  input logic recv_val,
  output logic recv_rdy,
  output logic send_val,
  input logic send_rdy,
  input logic mul_send_val,
  output logic [1:0] mul_stage,
  output logic in_wait
);

  logic [2:0]
      IDLE = 3'd0,
      DONE = 3'd1,
      ARBR = 3'd2,  // calculating a * c (in the multiplication (a + bi) * (c + di))
      ACBC = 3'd3,  // calculating b * d
      AABB = 3'd4;  // calculating (a + b)(c + d)

  logic [2:0] state, next_state;

  // stateflow graph
  always_comb begin
    case (state)
      IDLE: begin
        if (recv_val) next_state = AABB;
        else begin
          next_state = IDLE;
        end
      end
      ARBR: begin
        if (mul_send_val) begin
          next_state = ACBC;
        end else begin
          next_state = ARBR;
        end
      end
      ACBC: begin
        if (mul_send_val) next_state = DONE;
        else next_state = ACBC;
      end
      AABB: begin
        if (mul_send_val) begin
          next_state = ARBR;
        end else next_state = AABB;
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

  // set ports for each state
  always_comb begin
    case (state)
      IDLE: begin
        in_wait   = 1;
        mul_stage = 3;
        recv_rdy  = 1;
        send_val  = 0;
      end
      AABB: begin
        in_wait   = 0;
        mul_stage = 0;
        recv_rdy  = 0;
        send_val  = 0;
      end
      ARBR: begin
        in_wait   = 0;
        mul_stage = 1;
        recv_rdy  = 0;
        send_val  = 0;
      end
      ACBC: begin
        in_wait   = 0;
        mul_stage = 2;
        recv_rdy  = 0;
        send_val  = 0;
      end
      DONE: begin
        in_wait   = 0;
        mul_stage = 3;
        recv_rdy  = 0;
        send_val  = 1;
      end
      default: begin
        in_wait   = 0;
        mul_stage = 3;
        recv_rdy  = 0;
        send_val  = 0;
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
endmodule


module fpcmult_datapath #(
  parameter int n = 32,
  parameter int d = 16
) (
  input logic clk,
  input logic reset,
  input logic [n-1:0] ar,
  input logic [n-1:0] ac,
  input logic [n-1:0] br,
  input logic [n-1:0] bc,
  output logic [n-1:0] cr,
  output logic [n-1:0] cc,
  input logic in_wait,
  input logic [1:0] mul_stage,
  output logic mul_send_val
);
  logic [n-1:0] c_ar, c_ac, c_br, c_bc, c_arac;
  logic [n-1:0] i_ar, i_ac;
  logic [n-1:0] mul_a, mul_b, mul_c;

  // real part = ac - bd
  assign cr = c_ar - c_ac;
  // imaginary part = (a+c)(b+d) - ac - bd
  assign cc = c_arac - c_ar - c_ac;

  // stores either a or the output of ac
  cmn_EnResetReg #(n) reg_c_ar (
    .clk(clk),
    .reset(reset),
    .en(in_wait || mul_stage == 1),
    .d(i_ar),
    .q(c_ar)
  );

  // stores c (b real)
  cmn_EnResetReg #(n) reg_c_br (
    .clk(clk),
    .reset(reset),
    .en(in_wait),
    .d(br),
    .q(c_br)
  );

  // stores either b (a imag) or the output of bd
  cmn_EnResetReg #(n) reg_c_ac (
    .clk(clk),
    .reset(reset),
    .en(in_wait || mul_stage == 2),
    .d(i_ac),
    .q(c_ac)
  );

  // stores d (b imag)
  cmn_EnResetReg #(n) reg_c_bc (
    .clk(clk),
    .reset(reset),
    .en(in_wait),
    .d(bc),
    .q(c_bc)
  );

  // stores the output of (a + c)(b + d)
  cmn_EnResetReg #(n) reg_c_arac (
    .clk(clk),
    .reset(reset),
    .en(mul_stage == 0),
    .d(mul_c),
    .q(c_arac)
  );

  fixed_point_iterative_Multiplier #(n, d, 1) multiplier (
    .clk(clk),
    .reset(reset),
    .a(mul_a),
    .b(mul_b),
    .c(mul_c),
    .recv_val(mul_stage != 3),
    // no need to check `recv_rdy` here because valid held high until `send_val`
    /* verilator lint_off PINCONNECTEMPTY */
    .recv_rdy(),
    /* verilator lint_on PINCONNECTEMPTY */
    .send_val(mul_send_val),
    .send_rdy(1'b1)
  );

  // Used to select between storing arbr multiplication output and input
  cmn_Mux2 #(n) iomul_ar_sel (
    .in0(ar),
    .in1(mul_c),
    .sel(~in_wait),
    .out(i_ar)
  );

  // Used to select between storing acbc multiplication output and input
  cmn_Mux2 #(n) iomul_ac_sel (
    .in0(ac),
    .in1(mul_c),
    .sel(~in_wait),
    .out(i_ac)
  );

  // Used to select between the inputs to the multiplier
  cmn_Mux3 #(n) mul_a_sel (
    .in0(c_ar + c_ac),  // a + b
    .in1(c_ar),  // a
    .in2(c_ac),  // b
    .sel(mul_stage),
    .out(mul_a)
  );

  cmn_Mux3 #(n) mul_b_sel (
    .in0(c_br + c_bc),  // c + d
    .in1(c_br),  // c
    .in2(c_bc),  // d
    .sel(mul_stage),
    .out(mul_b)
  );
endmodule
`endif
