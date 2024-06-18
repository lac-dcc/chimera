// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

`default_nettype none
`ifndef FIXED_POINT_COMB_COMPLEX_MULTIPLIER
`define FIXED_POINT_COMB_COMPLEX_MULTIPLIER

`include "multiplier.v"

/* Fully Combinational Complex Multipler.
 *
 * This modules contains three combinational multipliers, and 
 * performs a complex multiplication combinationally.
 *
 * 
 * 
 * Params:
 *  n: bit width 
 *  d: number of decimal bits
 * 
 * Inputs:
 *  ar, ac: real and complex parts of the first number
 *  br, bc: real and complex parts of the second number
 *
 * Outputs:
 *  cr, cc: real and complex parts of the result
 *
 * Tests: UNTESTED
 * Used In: N/A
 *
 * Author: Barry Lyu.
 * Date: Feb 14th 2024
 */
module fixed_point_combinational_ComplexMultiplierS #(
  parameter int n = 32,  // bit width
  parameter int d = 16   // number of decimal bits
) (
  input  logic [n-1:0] ar,
  input  logic [n-1:0] ac,
  input  logic [n-1:0] br,
  input  logic [n-1:0] bc,
  output logic [n-1:0] cr,
  output logic [n-1:0] cc
);

  // cr = (ar * br) - (ac * bc)
  // cc = (ar * bc) + (br * ac) = (ar + ac)(br + bc) - (ac * bc) - (ar * br)
  logic [n-1:0] c_ar, c_ac, c_br, c_bc;
  logic [n-1:0] arXbr, acXbc, arcXbrc;

  assign c_ar = ar;
  assign c_ac = ac;
  assign c_br = br;
  assign c_bc = bc;

  fixed_point_combinational_Multiplier #(
    .n(n),
    .d(d),
    .sign(1)
  ) arXbrMult (
    .a(c_ar),
    .b(c_br),
    .c(arXbr)
  );

  fixed_point_combinational_Multiplier #(
    .n(n),
    .d(d),
    .sign(1)
  ) acXbcMult (
    .a(c_ac),
    .b(c_bc),
    .c(acXbc)
  );

  fixed_point_combinational_Multiplier #(
    .n(n),
    .d(d),
    .sign(1)
  ) arXbrcMult (
    .a(c_ar + c_ac),
    .b(c_br + c_bc),
    .c(arcXbrc)
  );

  assign cr = arXbr - acXbc;
  assign cc = arcXbrc - arXbr - acXbc;

endmodule

/* Parameterized Complex Multipler.
 *
 * ************************** IMPORTANT ***************************
 * Depending on num_mults, this module can be single or multi-cycle.
 * ************************** IMPORTANT ***************************
 *
 * This modules contains three combinational multipliers, and 
 * performs a complex multiplication combinationally.
 * 
 * Params:
 * - n: bit width 
 * - d: number of decimal bits
 * - num_mults: number of multipliers to use (1 or 3)
 *   - 1: single multiplier, multi-cycle (3 cycles with val/rdy)
 *   - 3: three multipliers, single-cycle (val/rdy connection optional)
 * 
 * Inputs:
 * - val/rdy interface: [recv_val, recv_rdy]
 *   - ar, ac: real and complex parts of the first number
 *   - br, bc: real and complex parts of the second number
 *
 * Outputs:
 * - val/rdy interface: send_val, send_rdy
 *   - cr, cc: real and complex parts of the result
 * 
 * Tests: FULLY_TESTED
 *  - tests/fixed_point/combinational/complex_multiplier_test.py [PASSED]
 *
 * Used In:
 *  - Combinational Multi-Butterfly Module: fixed_point/combinational/butterfly.v 
 *  
 * Author: Barry Lyu.
 * Date: Feb 14th 2024
 */
module fixed_point_combinational_ComplexMultiplier #(
  parameter int n = 32,  // bit width
  parameter int d = 16,  // number of decimal bits
  parameter int num_mults = 1  // number of multipliers
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

  logic [n-1:0] c_ar, c_ac, c_br, c_bc;

  logic [n-1:0] arXbr, acXbc, arcXbrc;

  generate
    // 3 multiplier implementation, completes computations in a single cycle, no sequential logic required.
    if (num_mults == 3) begin
      assign c_ar = ar;
      assign c_ac = ac;
      assign c_br = br;
      assign c_bc = bc;

      fixed_point_combinational_Multiplier #(
        .n(n),
        .d(d),
        .sign(1)
      ) arXbrMult (
        .a(c_ar),
        .b(c_br),
        .c(arXbr)
      );

      fixed_point_combinational_Multiplier #(
        .n(n),
        .d(d),
        .sign(1)
      ) acXbcMult (
        .a(c_ac),
        .b(c_bc),
        .c(acXbc)
      );

      fixed_point_combinational_Multiplier #(
        .n(n),
        .d(d),
        .sign(1)
      ) arXbrcMult (
        .a(c_ar + c_ac),
        .b(c_br + c_bc),
        .c(arcXbrc)
      );

      assign cr = arXbr - acXbc;
      assign cc = arcXbrc - arXbr - acXbc;
      assign recv_rdy = send_rdy;
      assign send_val = recv_val;

      logic unused = &({clk, reset});

      // 1 multiplier implementation, completes computations in three cycles.
    end else if (num_mults == 1) begin
      // State machine to control the 3-cycle computation
      logic [2:0] IDLE = 3'd0, MUL1 = 3'd1, MUL2 = 3'd2, MUL3 = 3'd3, DONE = 3'd4;
      logic [2:0] state;
      logic [2:0] next_state;

      // Intermediate results
      logic [n-1:0] mul_a, mul_b, mul_c;

      logic unused = &({IDLE, MUL1, MUL2, MUL3, DONE});

      always_ff @(posedge clk) begin
        if (reset) begin
          state <= IDLE;
          c_ar <= 0;
          c_ac <= 0;
          c_br <= 0;
          c_bc <= 0;
          arXbr <= 0;
          acXbc <= 0;
          arcXbrc <= 0;
        end else begin
          state <= next_state;
          if (state == IDLE && recv_val) begin
            // Store inputs in registers.
            c_ar <= ar;
            c_ac <= ac;
            c_br <= br;
            c_bc <= bc;
            arXbr <= 0;
            acXbc <= 0;
            arcXbrc <= 0;
          end else if (state == MUL1) begin
            arXbr <= mul_c;
          end else if (state == MUL2) begin
            acXbc <= mul_c;
          end else if (state == MUL3) begin
            arcXbrc <= mul_c;
          end else begin
          end
        end
      end

      always_comb begin
        // Combinational logic for the next state.
        next_state = state;
        recv_rdy = 0;
        send_val = 0;
        mul_a = 0;
        mul_b = 0;

        case (state)
          IDLE: begin
            recv_rdy = 1;
            if (recv_val) next_state = MUL1;
            else next_state = IDLE;
          end
          MUL1: begin
            next_state = MUL2;
            mul_a = c_ar;
            mul_b = c_br;
          end
          MUL2: begin
            next_state = MUL3;
            mul_a = c_ac;
            mul_b = c_bc;
          end
          MUL3: begin
            next_state = DONE;
            mul_a = c_ar + c_ac;
            mul_b = c_br + c_bc;
          end
          DONE: begin
            send_val = 1;
            if (send_rdy) next_state = IDLE;
            else next_state = state;
          end
          default: begin
          end
        endcase
      end

      fixed_point_combinational_Multiplier #(
        .n(n),
        .d(d),
        .sign(1)
      ) arXbrMult (
        .a(mul_a),
        .b(mul_b),
        .c(mul_c)
      );

      assign cr = arXbr - acXbc;
      assign cc = arcXbrc - arXbr - acXbc;
    end
  endgenerate
endmodule

`endif
