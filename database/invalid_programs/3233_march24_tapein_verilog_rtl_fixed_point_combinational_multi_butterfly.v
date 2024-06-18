// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

//================================================
// Iterative Butterfly Unit
// -----------------------------------------------
// This module performs the butterfly operation
// which is equivalent to the following matrix
// multiplication:
// | 1  w |   | a |   | c |
// | 1 -w | * | b | = | d |
// where w is the ith root of unity e^(-2*pi*i/n)
// and n/d is the fixed point specification`
// This module is used in the FFT module, and
// contains an area optimization parameter to
// save area by not including the complex
// multiplier in certain cases.
//================================================
`default_nettype none
`ifndef FIXED_POINT_MULTI_BUTTERFLY
`define FIXED_POINT_MULTI_BUTTERFLY
`include "fixed_point/combinational/complex_multiplier.v"

/* Parameterized Multi-Butterfly Unit.
 *
 * ************************** IMPORTANT ***************************
 * Depending on b, this module can take variable cycles.
 * ************************** IMPORTANT ***************************
 *
 * This modules is a buffered version of the butterfly unit and allows
 * multiple butterfly inputs. There is only one butterfly computation
 * pipeline, so the module computes one butterfly at a time and rotates
 * between the inputs until all are computed.
 * 
 * Params:
 * - n: bit width 
 * - d: number of decimal bits
 * - b: how many butterflies inputs and outputs this multi-butterfly contains
 * 
 * Inputs:
 * - val/rdy interface: [recv_val, recv_rdy]
 *   - ar[], ac[]: real and complex parts of the first number for each butterfly
 *   - br[], bc[]: real and complex parts of the second number for each butterfly
 *
 * Outputs:
 * - val/rdy interface: send_val, send_rdy
 *   - cr[], cc[]: real and complex parts of the result for each butterfly
 * 
 * Tests: NOT FULLY TESTED
 *  - tests/fixed_point/combinational/butterfly.py [PASSED]
 *  Butterflies with b more than 1 are not unit tested. Instead, they are used
 *  in the pease FFT module, which is tested.
 *
 * Used In:
 *  - Pease FFT Module: fft/pease/fft.v
 *  
 * Author: Barry Lyu.
 * Date: Feb 14th 2024
 */
module fixed_point_combinational_MultiButterfly #(
  parameter int n = 32,
  parameter int d = 16,
  parameter int b = 4    // Number of inputs to rotate around
) (
  input  logic clk,
  input  logic reset,
  input  logic recv_val,
  output logic recv_rdy,
  output logic send_val,
  input  logic send_rdy,

  input logic [n-1:0] ar[b],
  input logic [n-1:0] ac[b],
  input logic [n-1:0] br[b],
  input logic [n-1:0] bc[b],
  input logic [n-1:0] wr[b],
  input logic [n-1:0] wc[b],

  output logic [n-1:0] cr[b],
  output logic [n-1:0] cc[b],
  output logic [n-1:0] dr[b],
  output logic [n-1:0] dc[b]
);

  localparam int bb = b - 1;

  /* performs the butterfly operation, equivalent to doing
    | 1  w |   | a |   | c |
    | 1 -w | * | b | = | d |
  */

  // registers for storing the inputs
  logic [n-1:0] s_ar[b];
  logic [n-1:0] s_ac[b];
  logic [n-1:0] s_br[b];
  logic [n-1:0] s_bc[b];
  logic [n-1:0] s_cr[b];
  logic [n-1:0] s_cc[b];
  logic [n-1:0] s_dr[b];
  logic [n-1:0] s_dc[b];
  logic [n-1:0] s_wr[b];
  logic [n-1:0] s_wc[b];

  // state machine registers
  logic [2:0] IDLE = 3'd0, COMP = 3'd1, DONE = 3'd2;
  logic [2:0] state;
  logic [2:0] next_state;

  logic [((b == 1) ? 0 : $clog2(b)-1):0] comp_state;
  logic [((b == 1) ? 0 : $clog2(b)-1):0] next_comp_state;

  // wiring for the complex multipliers
  logic [n-1:0] m_ar;
  logic [n-1:0] m_ac;
  logic [n-1:0] m_br;
  logic [n-1:0] m_bc;
  logic [n-1:0] m_cr;
  logic [n-1:0] m_cc;

  logic mult_recv_rdy, mult_send_val;

  logic unused = &({IDLE, COMP, DONE, mult_recv_rdy, mult_send_val});

  // complex multiplier instantiation as combinatorial
  fixed_point_combinational_ComplexMultiplier #(
    .n(n),
    .d(d),
    .num_mults(3)  // with 3 mults, can output in same cycle
  ) mult (
    .recv_val(1'b1),
    .recv_rdy(mult_recv_rdy),
    .send_val(mult_send_val),
    .send_rdy(1'b1),
    .clk(clk),
    .reset(reset),
    .ar(m_ar),
    .ac(m_ac),
    .br(m_br),
    .bc(m_bc),
    .cr(m_cr),
    .cc(m_cc)
  );

  // val_rdy logic
  assign recv_rdy = (state == IDLE);
  assign send_val = (state == DONE);

  // registers for storing the inputs / outputs
  generate
    for (genvar i = 0; i < b; i++) begin : g_loop
      always_ff @(posedge clk) begin
        if (reset) begin
          s_ac[i] <= 0;
          s_ar[i] <= 0;
          s_bc[i] <= 0;
          s_br[i] <= 0;
          s_cr[i] <= 0;
          s_cc[i] <= 0;
          s_wr[i] <= 0;
          s_wc[i] <= 0;
        end else if (recv_rdy && recv_val) begin
          s_ar[i] <= ar[i];
          s_ac[i] <= ac[i];
          s_br[i] <= br[i];
          s_bc[i] <= bc[i];
          s_wr[i] <= wr[i];
          s_wc[i] <= wc[i];
          s_cc[i] <= 0;
          s_cr[i] <= 0;
        end else begin
        end
      end

      assign cr[i] = s_cr[i];
      assign cc[i] = s_cc[i];
      assign dr[i] = s_dr[i];
      assign dc[i] = s_dc[i];
    end
  endgenerate

  // update output storage regs
  always_ff @(posedge clk) begin
    state <= next_state;
    // $display("state: %d", state);
    // $display("comp_state: %d", comp_state);
    // $display("next_comp_state: %d\n", next_comp_state);
    comp_state <= next_comp_state;
    if (state == COMP) begin
      s_cr[comp_state] <= s_ar[comp_state] + m_cr;
      s_cc[comp_state] <= s_ac[comp_state] + m_cc;
      s_dr[comp_state] <= s_ar[comp_state] - m_cr;
      s_dc[comp_state] <= s_ac[comp_state] - m_cc;
    end else begin
    end
  end

  // state transition logic
  always_comb begin
    next_state = state;
    next_comp_state = 0;

    if (reset) begin
      next_state = IDLE;
      next_comp_state = 0;
    end else if (state == IDLE && recv_rdy) begin
      if (recv_val) begin
        next_state = COMP;
      end else begin
      end
    end else if (state == DONE && send_val) begin
      if (send_rdy) begin
        next_state = IDLE;
      end else begin
      end
    end else if (state == COMP) begin
      if (comp_state == bb[((b==1)?0 : $clog2(b)-1):0]) begin
        next_state = DONE;
        next_comp_state = 0;
      end else begin
        next_comp_state = comp_state + 1;
      end
    end else begin
    end

    m_ac = s_bc[comp_state];
    m_ar = s_br[comp_state];
    m_bc = s_wc[comp_state];
    m_br = s_wr[comp_state];
  end
endmodule
`endif
