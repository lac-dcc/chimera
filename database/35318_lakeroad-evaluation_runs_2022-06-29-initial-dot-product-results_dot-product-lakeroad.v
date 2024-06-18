// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

/* verilator lint_off MULTITOP */
/// =================== Unsigned, Fixed Point =========================
module std_fp_add #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left + right;
endmodule

module std_fp_sub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left - right;
endmodule

module std_fp_mult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16,
    parameter SIGNED = 0
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             go,
    input  logic             clk,
    input  logic             reset,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  logic [WIDTH-1:0]          rtmp;
  logic [WIDTH-1:0]          ltmp;
  logic [(WIDTH << 1) - 1:0] out_tmp;
  // Buffer used to walk through the 3 cycles of the pipeline.
  logic done_buf[2:0];

  assign done = done_buf[2];

  assign out = out_tmp[(WIDTH << 1) - INT_WIDTH - 1 : WIDTH - INT_WIDTH];

  // If the done buffer is completely empty and go is high then execution
  // just started.
  logic start;
  assign start = go & done_buf[0] == 0 & done_buf[1] == 0;

  // Start sending the done signal.
  always_ff @(posedge clk) begin
    if (start)
      done_buf[0] <= 1;
    else
      done_buf[0] <= 0;
  end

  // Push the done signal through the pipeline.
  always_ff @(posedge clk) begin
    if (go) begin
      done_buf[2] <= done_buf[1];
      done_buf[1] <= done_buf[0];
    end else begin
      done_buf[2] <= 0;
      done_buf[1] <= 0;
    end
  end

  // Move the multiplication computation through the pipeline.
  always_ff @(posedge clk) begin
    if (reset) begin
      rtmp <= 0;
      ltmp <= 0;
      out_tmp <= 0;
    end else if (go) begin
      if (SIGNED) begin
        rtmp <= $signed(right);
        ltmp <= $signed(left);
        out_tmp <= $signed(
          { {WIDTH{ltmp[WIDTH-1]}}, ltmp} *
          { {WIDTH{rtmp[WIDTH-1]}}, rtmp}
        );
      end else begin
        rtmp <= right;
        ltmp <= left;
        out_tmp <= ltmp * rtmp;
      end
    end else begin
      rtmp <= 0;
      ltmp <= 0;
      out_tmp <= out_tmp;
    end
  end
endmodule

/* verilator lint_off WIDTH */
module std_fp_div_pipe #(
  parameter WIDTH = 32,
  parameter INT_WIDTH = 16,
  parameter FRAC_WIDTH = 16
) (
    input  logic             go,
    input  logic             clk,
    input  logic             reset,
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);
    localparam ITERATIONS = WIDTH + FRAC_WIDTH;

    logic [WIDTH-1:0] quotient, quotient_next;
    logic [WIDTH:0] acc, acc_next;
    logic [$clog2(ITERATIONS)-1:0] idx;
    logic start, running, finished, dividend_is_zero;

    assign start = go && !running;
    assign dividend_is_zero = start && left == 0;
    assign finished = idx == ITERATIONS - 1 && running;

    always_ff @(posedge clk) begin
      if (reset || finished || dividend_is_zero)
        running <= 0;
      else if (start)
        running <= 1;
      else
        running <= running;
    end

    always_comb begin
      if (acc >= {1'b0, right}) begin
        acc_next = acc - right;
        {acc_next, quotient_next} = {acc_next[WIDTH-1:0], quotient, 1'b1};
      end else begin
        {acc_next, quotient_next} = {acc, quotient} << 1;
      end
    end

    // `done` signaling
    always_ff @(posedge clk) begin
      if (dividend_is_zero || finished)
        done <= 1;
      else
        done <= 0;
    end

    always_ff @(posedge clk) begin
      if (running)
        idx <= idx + 1;
      else
        idx <= 0;
    end

    always_ff @(posedge clk) begin
      if (reset) begin
        out_quotient <= 0;
        out_remainder <= 0;
      end else if (start) begin
        out_quotient <= 0;
        out_remainder <= left;
      end else if (go == 0) begin
        out_quotient <= out_quotient;
        out_remainder <= out_remainder;
      end else if (dividend_is_zero) begin
        out_quotient <= 0;
        out_remainder <= 0;
      end else if (finished) begin
        out_quotient <= quotient_next;
        out_remainder <= out_remainder;
      end else begin
        out_quotient <= out_quotient;
        if (right <= out_remainder)
          out_remainder <= out_remainder - right;
        else
          out_remainder <= out_remainder;
      end
    end

    always_ff @(posedge clk) begin
      if (reset) begin
        acc <= 0;
        quotient <= 0;
      end else if (start) begin
        {acc, quotient} <= {{WIDTH{1'b0}}, left, 1'b0};
      end else begin
        acc <= acc_next;
        quotient <= quotient_next;
      end
    end
endmodule

module std_fp_gt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic             out
);
  assign out = left > right;
endmodule

/// =================== Signed, Fixed Point =========================
module std_fp_sadd #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_fp_ssub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);

  assign out = $signed(left - right);
endmodule

module std_fp_smult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  [WIDTH-1:0]              left,
    input  [WIDTH-1:0]              right,
    input  logic                    reset,
    input  logic                    go,
    input  logic                    clk,
    output logic [WIDTH-1:0]        out,
    output logic                    done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(INT_WIDTH),
    .FRAC_WIDTH(FRAC_WIDTH),
    .SIGNED(1)
  ) comp (
    .clk(clk),
    .done(done),
    .reset(reset),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

module std_fp_sdiv_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input                     clk,
    input                     go,
    input                     reset,
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out_quotient,
    output signed [WIDTH-1:0] out_remainder,
    output logic              done
);

  logic signed [WIDTH-1:0] left_abs, right_abs, comp_out_q, comp_out_r, right_save, out_rem_intermediate;

  // Registers to figure out how to transform outputs.
  logic different_signs, left_sign, right_sign;

  // Latch the value of control registers so that their available after
  // go signal becomes low.
  always_ff @(posedge clk) begin
    if (go) begin
      right_save <= right_abs;
      left_sign <= left[WIDTH-1];
      right_sign <= right[WIDTH-1];
    end else begin
      left_sign <= left_sign;
      right_save <= right_save;
      right_sign <= right_sign;
    end
  end

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;

  assign different_signs = left_sign ^ right_sign;
  assign out_quotient = different_signs ? -comp_out_q : comp_out_q;

  // Remainder is computed as:
  //  t0 = |left| % |right|
  //  t1 = if left * right < 0 and t0 != 0 then |right| - t0 else t0
  //  rem = if right < 0 then -t1 else t1
  assign out_rem_intermediate = different_signs & |comp_out_r ? $signed(right_save - comp_out_r) : comp_out_r;
  assign out_remainder = right_sign ? -out_rem_intermediate : out_rem_intermediate;

  std_fp_div_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(INT_WIDTH),
    .FRAC_WIDTH(FRAC_WIDTH)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );
endmodule

module std_fp_sgt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic signed [WIDTH-1:0] left,
    input  logic signed [WIDTH-1:0] right,
    output logic signed             out
);
  assign out = $signed(left > right);
endmodule

module std_fp_slt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
   input logic signed [WIDTH-1:0] left,
   input logic signed [WIDTH-1:0] right,
   output logic signed            out
);
  assign out = $signed(left < right);
endmodule

/// =================== Unsigned, Bitnum =========================
module std_mult_pipe #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             reset,
    input  logic             go,
    input  logic             clk,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0),
    .SIGNED(0)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

module std_div_pipe #(
    parameter WIDTH = 32
) (
    input                    reset,
    input                    clk,
    input                    go,
    input        [WIDTH-1:0] left,
    input        [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);

  logic [WIDTH-1:0] dividend;
  logic [(WIDTH-1)*2:0] divisor;
  logic [WIDTH-1:0] quotient;
  logic [WIDTH-1:0] quotient_msk;
  logic start, running, finished, dividend_is_zero;

  assign start = go && !running;
  assign finished = quotient_msk == 0 && running;
  assign dividend_is_zero = start && left == 0;

  always_ff @(posedge clk) begin
    // Early return if the divisor is zero.
    if (finished || dividend_is_zero)
      done <= 1;
    else
      done <= 0;
  end

  always_ff @(posedge clk) begin
    if (reset || finished || dividend_is_zero)
      running <= 0;
    else if (start)
      running <= 1;
    else
      running <= running;
  end

  // Outputs
  always_ff @(posedge clk) begin
    if (dividend_is_zero || start) begin
      out_quotient <= 0;
      out_remainder <= 0;
    end else if (finished) begin
      out_quotient <= quotient;
      out_remainder <= dividend;
    end else begin
      // Otherwise, explicitly latch the values.
      out_quotient <= out_quotient;
      out_remainder <= out_remainder;
    end
  end

  // Calculate the quotient mask.
  always_ff @(posedge clk) begin
    if (start)
      quotient_msk <= 1 << WIDTH - 1;
    else if (running)
      quotient_msk <= quotient_msk >> 1;
    else
      quotient_msk <= quotient_msk;
  end

  // Calculate the quotient.
  always_ff @(posedge clk) begin
    if (start)
      quotient <= 0;
    else if (divisor <= dividend)
      quotient <= quotient | quotient_msk;
    else
      quotient <= quotient;
  end

  // Calculate the dividend.
  always_ff @(posedge clk) begin
    if (start)
      dividend <= left;
    else if (divisor <= dividend)
      dividend <= dividend - divisor;
    else
      dividend <= dividend;
  end

  always_ff @(posedge clk) begin
    if (start) begin
      divisor <= right << WIDTH - 1;
    end else if (finished) begin
      divisor <= 0;
    end else begin
      divisor <= divisor >> 1;
    end
  end

  // Simulation self test against unsynthesizable implementation.
  `ifdef VERILATOR
    logic [WIDTH-1:0] l, r;
    always_ff @(posedge clk) begin
      if (go) begin
        l <= left;
        r <= right;
      end else begin
        l <= l;
        r <= r;
      end
    end

    always @(posedge clk) begin
      if (done && $unsigned(out_remainder) != $unsigned(l % r))
        $error(
          "\nstd_div_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(l),
          "  right: %0d\n", $unsigned(r),
          "expected: %0d", $unsigned(l % r),
          "  computed: %0d", $unsigned(out_remainder)
        );

      if (done && $unsigned(out_quotient) != $unsigned(l / r))
        $error(
          "\nstd_div_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(l),
          "  right: %0d\n", $unsigned(r),
          "expected: %0d", $unsigned(l / r),
          "  computed: %0d", $unsigned(out_quotient)
        );
    end
  `endif
endmodule

/// =================== Signed, Bitnum =========================
module std_sadd #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_ssub #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left - right);
endmodule

module std_smult_pipe #(
    parameter WIDTH = 32
) (
    input  logic                    reset,
    input  logic                    go,
    input  logic                    clk,
    input  signed       [WIDTH-1:0] left,
    input  signed       [WIDTH-1:0] right,
    output logic signed [WIDTH-1:0] out,
    output logic                    done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0),
    .SIGNED(1)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

/* verilator lint_off WIDTH */
module std_sdiv_pipe #(
    parameter WIDTH = 32
) (
    input                           reset,
    input                           clk,
    input                           go,
    input  logic signed [WIDTH-1:0] left,
    input  logic signed [WIDTH-1:0] right,
    output logic signed [WIDTH-1:0] out_quotient,
    output logic signed [WIDTH-1:0] out_remainder,
    output logic                    done
);

  logic signed [WIDTH-1:0] left_abs, right_abs, comp_out_q, comp_out_r, right_save, out_rem_intermediate;

  // Registers to figure out how to transform outputs.
  logic different_signs, left_sign, right_sign;

  // Latch the value of control registers so that their available after
  // go signal becomes low.
  always_ff @(posedge clk) begin
    if (go) begin
      right_save <= right_abs;
      left_sign <= left[WIDTH-1];
      right_sign <= right[WIDTH-1];
    end else begin
      left_sign <= left_sign;
      right_save <= right_save;
      right_sign <= right_sign;
    end
  end

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;

  assign different_signs = left_sign ^ right_sign;
  assign out_quotient = different_signs ? -comp_out_q : comp_out_q;

  // Remainder is computed as:
  //  t0 = |left| % |right|
  //  t1 = if left * right < 0 and t0 != 0 then |right| - t0 else t0
  //  rem = if right < 0 then -t1 else t1
  assign out_rem_intermediate = different_signs & |comp_out_r ? $signed(right_save - comp_out_r) : comp_out_r;
  assign out_remainder = right_sign ? -out_rem_intermediate : out_rem_intermediate;

  std_div_pipe #(
    .WIDTH(WIDTH)
  ) comp (
    .reset(reset),
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );

  // Simulation self test against unsynthesizable implementation.
  `ifdef VERILATOR
    logic signed [WIDTH-1:0] l, r;
    always_ff @(posedge clk) begin
      if (go) begin
        l <= left;
        r <= right;
      end else begin
        l <= l;
        r <= r;
      end
    end

    always @(posedge clk) begin
      if (done && out_quotient != $signed(l / r))
        $error(
          "\nstd_sdiv_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", l,
          "  right: %0d\n", r,
          "expected: %0d", $signed(l / r),
          "  computed: %0d", $signed(out_quotient),
        );
      if (done && out_remainder != $signed(((l % r) + r) % r))
        $error(
          "\nstd_sdiv_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", l,
          "  right: %0d\n", r,
          "expected: %0d", $signed(((l % r) + r) % r),
          "  computed: %0d", $signed(out_remainder),
        );
    end
  `endif
endmodule

module std_sgt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left > right);
endmodule

module std_slt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left < right);
endmodule

module std_seq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left == right);
endmodule

module std_sneq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left != right);
endmodule

module std_sge #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left >= right);
endmodule

module std_sle #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left <= right);
endmodule

module std_slsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left <<< right;
endmodule

module std_srsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left >>> right;
endmodule
/**
 * Core primitives for Calyx.
 * Implements core primitives used by the compiler.
 *
 * Conventions:
 * - All parameter names must be SNAKE_CASE and all caps.
 * - Port names must be snake_case, no caps.
 */
`default_nettype none

// BEGIN GENERATED LAKEROAD CODE
/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_and1(a, b, out0);
  input a;
  wire a;
  input b;
  wire b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output out0;
  wire out0;
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-0  (
    .I0(a),
    .I1(b),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-1  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-2  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-3  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI({ luts_O5_0[7:1], out0 }),
    .O(o_2),
    .S(luts_O6_1)
  );
  assign luts_O5_0[0] = out0;
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_and8(a, b, out0);
  input [7:0] a;
  wire [7:0] a;
  input [7:0] b;
  wire [7:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [7:0] out0;
  wire [7:0] out0;
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \G_LUT-6  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h0000000080000000)
  ) \H_LUT-7  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(out0),
    .O(o_2),
    .S(luts_O6_1)
  );
  assign luts_O5_0[7] = out0[7];
  assign luts_O5_0[6] = out0[6];
  assign luts_O5_0[5] = out0[5];
  assign luts_O5_0[4] = out0[4];
  assign luts_O5_0[3] = out0[3];
  assign luts_O5_0[2] = out0[2];
  assign luts_O5_0[1] = out0[1];
  assign luts_O5_0[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_and32(a, b, out0);
  input [31:0] a;
  wire [31:0] a;
  input [31:0] b;
  wire [31:0] b;
  wire [7:0] co_11;
  wire [7:0] co_15;
  wire [7:0] co_19;
  wire [7:0] co_23;
  wire [7:0] co_27;
  wire [7:0] co_3;
  wire [7:0] co_31;
  wire [7:0] co_35;
  wire [7:0] co_39;
  wire [7:0] co_7;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O5_12;
  wire [7:0] luts_O5_16;
  wire [7:0] luts_O5_20;
  wire [7:0] luts_O5_24;
  wire [7:0] luts_O5_28;
  wire [7:0] luts_O5_32;
  wire [7:0] luts_O5_36;
  wire [7:0] luts_O5_4;
  wire [7:0] luts_O5_8;
  wire [7:0] luts_O6_1;
  wire [7:0] luts_O6_13;
  wire [7:0] luts_O6_17;
  wire [7:0] luts_O6_21;
  wire [7:0] luts_O6_25;
  wire [7:0] luts_O6_29;
  wire [7:0] luts_O6_33;
  wire [7:0] luts_O6_37;
  wire [7:0] luts_O6_5;
  wire [7:0] luts_O6_9;
  wire [7:0] o_10;
  wire [7:0] o_14;
  wire [7:0] o_18;
  wire [7:0] o_2;
  wire [7:0] o_22;
  wire [7:0] o_26;
  wire [7:0] o_30;
  wire [7:0] o_34;
  wire [7:0] o_38;
  wire [7:0] o_6;
  output [31:0] out0;
  wire [31:0] out0;
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-18  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[8]),
    .O6(luts_O6_9[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-27  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[0]),
    .O6(luts_O6_13[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-36  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[0]),
    .O6(luts_O6_17[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-45  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[16]),
    .O6(luts_O6_21[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-54  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[0]),
    .O6(luts_O6_25[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-63  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[0]),
    .O6(luts_O6_29[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-72  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[0]),
    .O6(luts_O6_33[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-81  (
    .I0(a[24]),
    .I1(b[24]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[24]),
    .O6(luts_O6_37[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \A_LUT-9  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[0]),
    .O6(luts_O6_5[0])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-10  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[1]),
    .O6(luts_O6_5[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-19  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[9]),
    .O6(luts_O6_9[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-28  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[1]),
    .O6(luts_O6_13[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-37  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[1]),
    .O6(luts_O6_17[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-46  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[17]),
    .O6(luts_O6_21[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-55  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[1]),
    .O6(luts_O6_25[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-64  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[1]),
    .O6(luts_O6_29[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-73  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[1]),
    .O6(luts_O6_33[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \B_LUT-82  (
    .I0(a[25]),
    .I1(b[25]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[25]),
    .O6(luts_O6_37[1])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-11  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[2]),
    .O6(luts_O6_5[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-20  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[10]),
    .O6(luts_O6_9[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-29  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[2]),
    .O6(luts_O6_13[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-38  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[2]),
    .O6(luts_O6_17[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-47  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[18]),
    .O6(luts_O6_21[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-56  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[2]),
    .O6(luts_O6_25[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-65  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[2]),
    .O6(luts_O6_29[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-74  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[2]),
    .O6(luts_O6_33[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \C_LUT-83  (
    .I0(a[26]),
    .I1(b[26]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[26]),
    .O6(luts_O6_37[2])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-12  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[3]),
    .O6(luts_O6_5[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-21  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[11]),
    .O6(luts_O6_9[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-30  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[3]),
    .O6(luts_O6_13[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-39  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[3]),
    .O6(luts_O6_17[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-48  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[19]),
    .O6(luts_O6_21[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-57  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[3]),
    .O6(luts_O6_25[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-66  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[3]),
    .O6(luts_O6_29[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-75  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[3]),
    .O6(luts_O6_33[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \D_LUT-84  (
    .I0(a[27]),
    .I1(b[27]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[27]),
    .O6(luts_O6_37[3])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-13  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[4]),
    .O6(luts_O6_5[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-22  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[12]),
    .O6(luts_O6_9[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-31  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[4]),
    .O6(luts_O6_13[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-40  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[4]),
    .O6(luts_O6_17[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-49  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[20]),
    .O6(luts_O6_21[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-58  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[4]),
    .O6(luts_O6_25[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-67  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[4]),
    .O6(luts_O6_29[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-76  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[4]),
    .O6(luts_O6_33[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \E_LUT-85  (
    .I0(a[28]),
    .I1(b[28]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[28]),
    .O6(luts_O6_37[4])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-14  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[5]),
    .O6(luts_O6_5[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-23  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[13]),
    .O6(luts_O6_9[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-32  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[5]),
    .O6(luts_O6_13[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-41  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[5]),
    .O6(luts_O6_17[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-50  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[21]),
    .O6(luts_O6_21[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-59  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[5]),
    .O6(luts_O6_25[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-68  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[5]),
    .O6(luts_O6_29[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-77  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[5]),
    .O6(luts_O6_33[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \F_LUT-86  (
    .I0(a[29]),
    .I1(b[29]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[29]),
    .O6(luts_O6_37[5])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-15  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[6]),
    .O6(luts_O6_5[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-24  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[14]),
    .O6(luts_O6_9[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-33  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[6]),
    .O6(luts_O6_13[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-42  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[6]),
    .O6(luts_O6_17[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-51  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[22]),
    .O6(luts_O6_21[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-6  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-60  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[6]),
    .O6(luts_O6_25[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-69  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[6]),
    .O6(luts_O6_29[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-78  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[6]),
    .O6(luts_O6_33[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \G_LUT-87  (
    .I0(a[30]),
    .I1(b[30]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[30]),
    .O6(luts_O6_37[6])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-16  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[7]),
    .O6(luts_O6_5[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-25  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[15]),
    .O6(luts_O6_9[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-34  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[7]),
    .O6(luts_O6_13[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-43  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[7]),
    .O6(luts_O6_17[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-52  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[23]),
    .O6(luts_O6_21[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-61  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[7]),
    .O6(luts_O6_25[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-7  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[7]),
    .O6(luts_O6_1[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-70  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[7]),
    .O6(luts_O6_29[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-79  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[7]),
    .O6(luts_O6_33[7])
  );
  LUT6_2 #(
    .INIT(64'h8000000080000000)
  ) \H_LUT-88  (
    .I0(a[31]),
    .I1(b[31]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0[31]),
    .O6(luts_O6_37[7])
  );
  CARRY8 \carry-17  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_7),
    .DI(luts_O5_4),
    .O(o_6),
    .S(luts_O6_5)
  );
  CARRY8 \carry-26  (
    .CI(co_7[7]),
    .CI_TOP(1'h0),
    .CO(co_11),
    .DI(out0[15:8]),
    .O(o_10),
    .S(luts_O6_9)
  );
  CARRY8 \carry-35  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_15),
    .DI(luts_O5_12),
    .O(o_14),
    .S(luts_O6_13)
  );
  CARRY8 \carry-44  (
    .CI(co_15[7]),
    .CI_TOP(1'h0),
    .CO(co_19),
    .DI(luts_O5_16),
    .O(o_18),
    .S(luts_O6_17)
  );
  CARRY8 \carry-53  (
    .CI(co_19[7]),
    .CI_TOP(1'h0),
    .CO(co_23),
    .DI(out0[23:16]),
    .O(o_22),
    .S(luts_O6_21)
  );
  CARRY8 \carry-62  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_27),
    .DI(luts_O5_24),
    .O(o_26),
    .S(luts_O6_25)
  );
  CARRY8 \carry-71  (
    .CI(co_27[7]),
    .CI_TOP(1'h0),
    .CO(co_31),
    .DI(luts_O5_28),
    .O(o_30),
    .S(luts_O6_29)
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(out0[7:0]),
    .O(o_2),
    .S(luts_O6_1)
  );
  CARRY8 \carry-80  (
    .CI(co_31[7]),
    .CI_TOP(1'h0),
    .CO(co_35),
    .DI(luts_O5_32),
    .O(o_34),
    .S(luts_O6_33)
  );
  CARRY8 \carry-89  (
    .CI(co_35[7]),
    .CI_TOP(1'h0),
    .CO(co_39),
    .DI(out0[31:24]),
    .O(o_38),
    .S(luts_O6_37)
  );
  assign luts_O5_0[7] = out0[7];
  assign luts_O5_0[6] = out0[6];
  assign luts_O5_0[5] = out0[5];
  assign luts_O5_0[4] = out0[4];
  assign luts_O5_0[3] = out0[3];
  assign luts_O5_0[2] = out0[2];
  assign luts_O5_0[1] = out0[1];
  assign luts_O5_0[0] = out0[0];
  assign luts_O5_20[7] = out0[23];
  assign luts_O5_20[6] = out0[22];
  assign luts_O5_20[5] = out0[21];
  assign luts_O5_20[4] = out0[20];
  assign luts_O5_20[3] = out0[19];
  assign luts_O5_20[2] = out0[18];
  assign luts_O5_20[1] = out0[17];
  assign luts_O5_20[0] = out0[16];
  assign luts_O5_36[7] = out0[31];
  assign luts_O5_36[6] = out0[30];
  assign luts_O5_36[5] = out0[29];
  assign luts_O5_36[4] = out0[28];
  assign luts_O5_36[3] = out0[27];
  assign luts_O5_36[2] = out0[26];
  assign luts_O5_36[1] = out0[25];
  assign luts_O5_36[0] = out0[24];
  assign luts_O5_8[7] = out0[15];
  assign luts_O5_8[6] = out0[14];
  assign luts_O5_8[5] = out0[13];
  assign luts_O5_8[4] = out0[12];
  assign luts_O5_8[3] = out0[11];
  assign luts_O5_8[2] = out0[10];
  assign luts_O5_8[1] = out0[9];
  assign luts_O5_8[0] = out0[8];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_or1(a, b, out0);
  input a;
  wire a;
  input b;
  wire b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output out0;
  wire out0;
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \A_LUT-0  (
    .I0(a),
    .I1(b),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \B_LUT-1  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \C_LUT-2  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \D_LUT-3  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000e0000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI({ luts_O5_0[7:1], out0 }),
    .O(o_2),
    .S(luts_O6_1)
  );
  assign luts_O5_0[0] = out0;
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_add2(a, b, out0);
  input [1:0] a;
  wire [1:0] a;
  input [1:0] b;
  wire [1:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [1:0] out0;
  wire [1:0] out0;
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-2  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-3  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O({ o_2[7:2], out0 }),
    .S(luts_O6_1)
  );
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_add3(a, b, out0);
  input [2:0] a;
  wire [2:0] a;
  input [2:0] b;
  wire [2:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [2:0] out0;
  wire [2:0] out0;
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \D_LUT-3  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000c0000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O({ o_2[7:3], out0 }),
    .S(luts_O6_1)
  );
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_add4(a, b, out0);
  input [3:0] a;
  wire [3:0] a;
  input [3:0] b;
  wire [3:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [3:0] out0;
  wire [3:0] out0;
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O({ o_2[7:4], out0 }),
    .S(luts_O6_1)
  );
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_add8(a, b, out0);
  input [7:0] a;
  wire [7:0] a;
  input [7:0] b;
  wire [7:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [7:0] out0;
  wire [7:0] out0;
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \G_LUT-6  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h6000000080000000)
  ) \H_LUT-7  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O(out0),
    .S(luts_O6_1)
  );
  assign o_2[7] = out0[7];
  assign o_2[6] = out0[6];
  assign o_2[5] = out0[5];
  assign o_2[4] = out0[4];
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_add32(a, b, out0);
  input [31:0] a;
  wire [31:0] a;
  input [31:0] b;
  wire [31:0] b;
  wire [7:0] co_11;
  wire [7:0] co_15;
  wire [7:0] co_19;
  wire [7:0] co_23;
  wire [7:0] co_27;
  wire [7:0] co_3;
  wire [7:0] co_31;
  wire [7:0] co_35;
  wire [7:0] co_39;
  wire [7:0] co_7;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O5_12;
  wire [7:0] luts_O5_16;
  wire [7:0] luts_O5_20;
  wire [7:0] luts_O5_24;
  wire [7:0] luts_O5_28;
  wire [7:0] luts_O5_32;
  wire [7:0] luts_O5_36;
  wire [7:0] luts_O5_4;
  wire [7:0] luts_O5_8;
  wire [7:0] luts_O6_1;
  wire [7:0] luts_O6_13;
  wire [7:0] luts_O6_17;
  wire [7:0] luts_O6_21;
  wire [7:0] luts_O6_25;
  wire [7:0] luts_O6_29;
  wire [7:0] luts_O6_33;
  wire [7:0] luts_O6_37;
  wire [7:0] luts_O6_5;
  wire [7:0] luts_O6_9;
  wire [7:0] o_10;
  wire [7:0] o_14;
  wire [7:0] o_18;
  wire [7:0] o_2;
  wire [7:0] o_22;
  wire [7:0] o_26;
  wire [7:0] o_30;
  wire [7:0] o_34;
  wire [7:0] o_38;
  wire [7:0] o_6;
  output [31:0] out0;
  wire [31:0] out0;
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-18  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[0]),
    .O6(luts_O6_9[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-27  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[0]),
    .O6(luts_O6_13[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-36  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[0]),
    .O6(luts_O6_17[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-45  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[0]),
    .O6(luts_O6_21[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-54  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[0]),
    .O6(luts_O6_25[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-63  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[0]),
    .O6(luts_O6_29[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-72  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[0]),
    .O6(luts_O6_33[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-81  (
    .I0(a[24]),
    .I1(b[24]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[0]),
    .O6(luts_O6_37[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \A_LUT-9  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[0]),
    .O6(luts_O6_5[0])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-10  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[1]),
    .O6(luts_O6_5[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-19  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[1]),
    .O6(luts_O6_9[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-28  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[1]),
    .O6(luts_O6_13[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-37  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[1]),
    .O6(luts_O6_17[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-46  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[1]),
    .O6(luts_O6_21[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-55  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[1]),
    .O6(luts_O6_25[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-64  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[1]),
    .O6(luts_O6_29[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-73  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[1]),
    .O6(luts_O6_33[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \B_LUT-82  (
    .I0(a[25]),
    .I1(b[25]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[1]),
    .O6(luts_O6_37[1])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-11  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[2]),
    .O6(luts_O6_5[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-20  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[2]),
    .O6(luts_O6_9[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-29  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[2]),
    .O6(luts_O6_13[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-38  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[2]),
    .O6(luts_O6_17[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-47  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[2]),
    .O6(luts_O6_21[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-56  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[2]),
    .O6(luts_O6_25[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-65  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[2]),
    .O6(luts_O6_29[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-74  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[2]),
    .O6(luts_O6_33[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \C_LUT-83  (
    .I0(a[26]),
    .I1(b[26]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[2]),
    .O6(luts_O6_37[2])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-12  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[3]),
    .O6(luts_O6_5[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-21  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[3]),
    .O6(luts_O6_9[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-30  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[3]),
    .O6(luts_O6_13[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-39  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[3]),
    .O6(luts_O6_17[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-48  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[3]),
    .O6(luts_O6_21[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-57  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[3]),
    .O6(luts_O6_25[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-66  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[3]),
    .O6(luts_O6_29[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-75  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[3]),
    .O6(luts_O6_33[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \D_LUT-84  (
    .I0(a[27]),
    .I1(b[27]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[3]),
    .O6(luts_O6_37[3])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-13  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[4]),
    .O6(luts_O6_5[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-22  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[4]),
    .O6(luts_O6_9[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-31  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[4]),
    .O6(luts_O6_13[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-40  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[4]),
    .O6(luts_O6_17[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-49  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[4]),
    .O6(luts_O6_21[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-58  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[4]),
    .O6(luts_O6_25[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-67  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[4]),
    .O6(luts_O6_29[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-76  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[4]),
    .O6(luts_O6_33[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \E_LUT-85  (
    .I0(a[28]),
    .I1(b[28]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[4]),
    .O6(luts_O6_37[4])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-14  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[5]),
    .O6(luts_O6_5[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-23  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[5]),
    .O6(luts_O6_9[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-32  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[5]),
    .O6(luts_O6_13[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-41  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[5]),
    .O6(luts_O6_17[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-50  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[5]),
    .O6(luts_O6_21[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-59  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[5]),
    .O6(luts_O6_25[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-68  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[5]),
    .O6(luts_O6_29[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-77  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[5]),
    .O6(luts_O6_33[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \F_LUT-86  (
    .I0(a[29]),
    .I1(b[29]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[5]),
    .O6(luts_O6_37[5])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-15  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[6]),
    .O6(luts_O6_5[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-24  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[6]),
    .O6(luts_O6_9[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-33  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[6]),
    .O6(luts_O6_13[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-42  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[6]),
    .O6(luts_O6_17[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-51  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[6]),
    .O6(luts_O6_21[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-6  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-60  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[6]),
    .O6(luts_O6_25[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-69  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[6]),
    .O6(luts_O6_29[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-78  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[6]),
    .O6(luts_O6_33[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \G_LUT-87  (
    .I0(a[30]),
    .I1(b[30]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[6]),
    .O6(luts_O6_37[6])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-16  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[7]),
    .O6(luts_O6_5[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-25  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[7]),
    .O6(luts_O6_9[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-34  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[7]),
    .O6(luts_O6_13[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-43  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[7]),
    .O6(luts_O6_17[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-52  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[7]),
    .O6(luts_O6_21[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-61  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[7]),
    .O6(luts_O6_25[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-7  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-70  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[7]),
    .O6(luts_O6_29[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-79  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[7]),
    .O6(luts_O6_33[7])
  );
  LUT6_2 #(
    .INIT(64'h60000000a0000000)
  ) \H_LUT-88  (
    .I0(a[31]),
    .I1(b[31]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[7]),
    .O6(luts_O6_37[7])
  );
  CARRY8 \carry-17  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_7),
    .DI(luts_O5_4),
    .O(o_6),
    .S(luts_O6_5)
  );
  CARRY8 \carry-26  (
    .CI(co_7[7]),
    .CI_TOP(1'h0),
    .CO(co_11),
    .DI(luts_O5_8),
    .O(out0[15:8]),
    .S(luts_O6_9)
  );
  CARRY8 \carry-35  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_15),
    .DI(luts_O5_12),
    .O(o_14),
    .S(luts_O6_13)
  );
  CARRY8 \carry-44  (
    .CI(co_15[7]),
    .CI_TOP(1'h0),
    .CO(co_19),
    .DI(luts_O5_16),
    .O(o_18),
    .S(luts_O6_17)
  );
  CARRY8 \carry-53  (
    .CI(co_19[7]),
    .CI_TOP(1'h0),
    .CO(co_23),
    .DI(luts_O5_20),
    .O(out0[23:16]),
    .S(luts_O6_21)
  );
  CARRY8 \carry-62  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_27),
    .DI(luts_O5_24),
    .O(o_26),
    .S(luts_O6_25)
  );
  CARRY8 \carry-71  (
    .CI(co_27[7]),
    .CI_TOP(1'h0),
    .CO(co_31),
    .DI(luts_O5_28),
    .O(o_30),
    .S(luts_O6_29)
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O(out0[7:0]),
    .S(luts_O6_1)
  );
  CARRY8 \carry-80  (
    .CI(co_31[7]),
    .CI_TOP(1'h0),
    .CO(co_35),
    .DI(luts_O5_32),
    .O(o_34),
    .S(luts_O6_33)
  );
  CARRY8 \carry-89  (
    .CI(co_35[7]),
    .CI_TOP(1'h0),
    .CO(co_39),
    .DI(luts_O5_36),
    .O(out0[31:24]),
    .S(luts_O6_37)
  );
  assign o_10[7] = out0[15];
  assign o_10[6] = out0[14];
  assign o_10[5] = out0[13];
  assign o_10[4] = out0[12];
  assign o_10[3] = out0[11];
  assign o_10[2] = out0[10];
  assign o_10[1] = out0[9];
  assign o_10[0] = out0[8];
  assign o_2[7] = out0[7];
  assign o_2[6] = out0[6];
  assign o_2[5] = out0[5];
  assign o_2[4] = out0[4];
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
  assign o_22[7] = out0[23];
  assign o_22[6] = out0[22];
  assign o_22[5] = out0[21];
  assign o_22[4] = out0[20];
  assign o_22[3] = out0[19];
  assign o_22[2] = out0[18];
  assign o_22[1] = out0[17];
  assign o_22[0] = out0[16];
  assign o_38[7] = out0[31];
  assign o_38[6] = out0[30];
  assign o_38[5] = out0[29];
  assign o_38[4] = out0[28];
  assign o_38[3] = out0[27];
  assign o_38[2] = out0[26];
  assign o_38[1] = out0[25];
  assign o_38[0] = out0[24];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_not1(a, out0);
  input a;
  wire a;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output out0;
  wire out0;
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \A_LUT-0  (
    .I0(a),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(out0),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \B_LUT-1  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \C_LUT-2  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \D_LUT-3  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \E_LUT-4  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h4000000040000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h1),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h0),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI({ luts_O5_0[7:1], out0 }),
    .O(o_2),
    .S(luts_O6_1)
  );
  assign luts_O5_0[0] = out0;
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_sub5(a, b, out0);
  input [4:0] a;
  wire [4:0] a;
  input [4:0] b;
  wire [4:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [4:0] out0;
  wire [4:0] out0;
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \F_LUT-5  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h9000000030000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O({ o_2[7:5], out0 }),
    .S(luts_O6_1)
  );
  assign o_2[4] = out0[4];
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_sub6(a, b, out0);
  input [5:0] a;
  wire [5:0] a;
  input [5:0] b;
  wire [5:0] b;
  wire [7:0] co_3;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O6_1;
  wire [7:0] o_2;
  output [5:0] out0;
  wire [5:0] out0;
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \G_LUT-6  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000b0000000)
  ) \H_LUT-7  (
    .I0(1'h0),
    .I1(1'h0),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  CARRY8 \carry-8  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O({ o_2[7:6], out0 }),
    .S(luts_O6_1)
  );
  assign o_2[5] = out0[5];
  assign o_2[4] = out0[4];
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
endmodule

/* Generated by Yosys 0.15+50 (git sha1 6318db615, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module lakeroad_xilinx_ultrascale_plus_sub32(a, b, out0);
  input [31:0] a;
  wire [31:0] a;
  input [31:0] b;
  wire [31:0] b;
  wire [7:0] co_11;
  wire [7:0] co_15;
  wire [7:0] co_19;
  wire [7:0] co_23;
  wire [7:0] co_27;
  wire [7:0] co_3;
  wire [7:0] co_31;
  wire [7:0] co_35;
  wire [7:0] co_39;
  wire [7:0] co_7;
  wire [7:0] luts_O5_0;
  wire [7:0] luts_O5_12;
  wire [7:0] luts_O5_16;
  wire [7:0] luts_O5_20;
  wire [7:0] luts_O5_24;
  wire [7:0] luts_O5_28;
  wire [7:0] luts_O5_32;
  wire [7:0] luts_O5_36;
  wire [7:0] luts_O5_4;
  wire [7:0] luts_O5_8;
  wire [7:0] luts_O6_1;
  wire [7:0] luts_O6_13;
  wire [7:0] luts_O6_17;
  wire [7:0] luts_O6_21;
  wire [7:0] luts_O6_25;
  wire [7:0] luts_O6_29;
  wire [7:0] luts_O6_33;
  wire [7:0] luts_O6_37;
  wire [7:0] luts_O6_5;
  wire [7:0] luts_O6_9;
  wire [7:0] o_10;
  wire [7:0] o_14;
  wire [7:0] o_18;
  wire [7:0] o_2;
  wire [7:0] o_22;
  wire [7:0] o_26;
  wire [7:0] o_30;
  wire [7:0] o_34;
  wire [7:0] o_38;
  wire [7:0] o_6;
  output [31:0] out0;
  wire [31:0] out0;
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-0  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[0]),
    .O6(luts_O6_1[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-18  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[0]),
    .O6(luts_O6_9[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-27  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[0]),
    .O6(luts_O6_13[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-36  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[0]),
    .O6(luts_O6_17[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-45  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[0]),
    .O6(luts_O6_21[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-54  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[0]),
    .O6(luts_O6_25[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-63  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[0]),
    .O6(luts_O6_29[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-72  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[0]),
    .O6(luts_O6_33[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-81  (
    .I0(a[24]),
    .I1(b[24]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[0]),
    .O6(luts_O6_37[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \A_LUT-9  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[0]),
    .O6(luts_O6_5[0])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[1]),
    .O6(luts_O6_1[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-10  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[1]),
    .O6(luts_O6_5[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-19  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[1]),
    .O6(luts_O6_9[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-28  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[1]),
    .O6(luts_O6_13[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-37  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[1]),
    .O6(luts_O6_17[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-46  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[1]),
    .O6(luts_O6_21[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-55  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[1]),
    .O6(luts_O6_25[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-64  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[1]),
    .O6(luts_O6_29[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-73  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[1]),
    .O6(luts_O6_33[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \B_LUT-82  (
    .I0(a[25]),
    .I1(b[25]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[1]),
    .O6(luts_O6_37[1])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-11  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[2]),
    .O6(luts_O6_5[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-2  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[2]),
    .O6(luts_O6_1[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-20  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[2]),
    .O6(luts_O6_9[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-29  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[2]),
    .O6(luts_O6_13[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-38  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[2]),
    .O6(luts_O6_17[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-47  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[2]),
    .O6(luts_O6_21[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-56  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[2]),
    .O6(luts_O6_25[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-65  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[2]),
    .O6(luts_O6_29[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-74  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[2]),
    .O6(luts_O6_33[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \C_LUT-83  (
    .I0(a[26]),
    .I1(b[26]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[2]),
    .O6(luts_O6_37[2])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-12  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[3]),
    .O6(luts_O6_5[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-21  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[3]),
    .O6(luts_O6_9[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-3  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[3]),
    .O6(luts_O6_1[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-30  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[3]),
    .O6(luts_O6_13[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-39  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[3]),
    .O6(luts_O6_17[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-48  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[3]),
    .O6(luts_O6_21[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-57  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[3]),
    .O6(luts_O6_25[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-66  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[3]),
    .O6(luts_O6_29[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-75  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[3]),
    .O6(luts_O6_33[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \D_LUT-84  (
    .I0(a[27]),
    .I1(b[27]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[3]),
    .O6(luts_O6_37[3])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-13  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[4]),
    .O6(luts_O6_5[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-22  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[4]),
    .O6(luts_O6_9[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-31  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[4]),
    .O6(luts_O6_13[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-4  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[4]),
    .O6(luts_O6_1[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-40  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[4]),
    .O6(luts_O6_17[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-49  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[4]),
    .O6(luts_O6_21[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-58  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[4]),
    .O6(luts_O6_25[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-67  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[4]),
    .O6(luts_O6_29[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-76  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[4]),
    .O6(luts_O6_33[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \E_LUT-85  (
    .I0(a[28]),
    .I1(b[28]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[4]),
    .O6(luts_O6_37[4])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-14  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[5]),
    .O6(luts_O6_5[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-23  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[5]),
    .O6(luts_O6_9[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-32  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[5]),
    .O6(luts_O6_13[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-41  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[5]),
    .O6(luts_O6_17[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-5  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[5]),
    .O6(luts_O6_1[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-50  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[5]),
    .O6(luts_O6_21[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-59  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[5]),
    .O6(luts_O6_25[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-68  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[5]),
    .O6(luts_O6_29[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-77  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[5]),
    .O6(luts_O6_33[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \F_LUT-86  (
    .I0(a[29]),
    .I1(b[29]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[5]),
    .O6(luts_O6_37[5])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-15  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[6]),
    .O6(luts_O6_5[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-24  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[6]),
    .O6(luts_O6_9[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-33  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[6]),
    .O6(luts_O6_13[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-42  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[6]),
    .O6(luts_O6_17[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-51  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[6]),
    .O6(luts_O6_21[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-6  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[6]),
    .O6(luts_O6_1[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-60  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[6]),
    .O6(luts_O6_25[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-69  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[6]),
    .O6(luts_O6_29[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-78  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[6]),
    .O6(luts_O6_33[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \G_LUT-87  (
    .I0(a[30]),
    .I1(b[30]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[6]),
    .O6(luts_O6_37[6])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-16  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_4[7]),
    .O6(luts_O6_5[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-25  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_8[7]),
    .O6(luts_O6_9[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-34  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_12[7]),
    .O6(luts_O6_13[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-43  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_16[7]),
    .O6(luts_O6_17[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-52  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_20[7]),
    .O6(luts_O6_21[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-61  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_24[7]),
    .O6(luts_O6_25[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-7  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_0[7]),
    .O6(luts_O6_1[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-70  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_28[7]),
    .O6(luts_O6_29[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-79  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_32[7]),
    .O6(luts_O6_33[7])
  );
  LUT6_2 #(
    .INIT(64'h90000000a0000000)
  ) \H_LUT-88  (
    .I0(a[31]),
    .I1(b[31]),
    .I2(1'h1),
    .I3(1'h1),
    .I4(1'h1),
    .I5(1'h1),
    .O5(luts_O5_36[7]),
    .O6(luts_O6_37[7])
  );
  CARRY8 \carry-17  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_7),
    .DI(luts_O5_4),
    .O(o_6),
    .S(luts_O6_5)
  );
  CARRY8 \carry-26  (
    .CI(co_7[7]),
    .CI_TOP(1'h0),
    .CO(co_11),
    .DI(luts_O5_8),
    .O(out0[15:8]),
    .S(luts_O6_9)
  );
  CARRY8 \carry-35  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_15),
    .DI(luts_O5_12),
    .O(o_14),
    .S(luts_O6_13)
  );
  CARRY8 \carry-44  (
    .CI(co_15[7]),
    .CI_TOP(1'h0),
    .CO(co_19),
    .DI(luts_O5_16),
    .O(o_18),
    .S(luts_O6_17)
  );
  CARRY8 \carry-53  (
    .CI(co_19[7]),
    .CI_TOP(1'h0),
    .CO(co_23),
    .DI(luts_O5_20),
    .O(out0[23:16]),
    .S(luts_O6_21)
  );
  CARRY8 \carry-62  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_27),
    .DI(luts_O5_24),
    .O(o_26),
    .S(luts_O6_25)
  );
  CARRY8 \carry-71  (
    .CI(co_27[7]),
    .CI_TOP(1'h0),
    .CO(co_31),
    .DI(luts_O5_28),
    .O(o_30),
    .S(luts_O6_29)
  );
  CARRY8 \carry-8  (
    .CI(1'h1),
    .CI_TOP(1'h0),
    .CO(co_3),
    .DI(luts_O5_0),
    .O(out0[7:0]),
    .S(luts_O6_1)
  );
  CARRY8 \carry-80  (
    .CI(co_31[7]),
    .CI_TOP(1'h0),
    .CO(co_35),
    .DI(luts_O5_32),
    .O(o_34),
    .S(luts_O6_33)
  );
  CARRY8 \carry-89  (
    .CI(co_35[7]),
    .CI_TOP(1'h0),
    .CO(co_39),
    .DI(luts_O5_36),
    .O(out0[31:24]),
    .S(luts_O6_37)
  );
  assign o_10[7] = out0[15];
  assign o_10[6] = out0[14];
  assign o_10[5] = out0[13];
  assign o_10[4] = out0[12];
  assign o_10[3] = out0[11];
  assign o_10[2] = out0[10];
  assign o_10[1] = out0[9];
  assign o_10[0] = out0[8];
  assign o_2[7] = out0[7];
  assign o_2[6] = out0[6];
  assign o_2[5] = out0[5];
  assign o_2[4] = out0[4];
  assign o_2[3] = out0[3];
  assign o_2[2] = out0[2];
  assign o_2[1] = out0[1];
  assign o_2[0] = out0[0];
  assign o_22[7] = out0[23];
  assign o_22[6] = out0[22];
  assign o_22[5] = out0[21];
  assign o_22[4] = out0[20];
  assign o_22[3] = out0[19];
  assign o_22[2] = out0[18];
  assign o_22[1] = out0[17];
  assign o_22[0] = out0[16];
  assign o_38[7] = out0[31];
  assign o_38[6] = out0[30];
  assign o_38[5] = out0[29];
  assign o_38[4] = out0[28];
  assign o_38[3] = out0[27];
  assign o_38[2] = out0[26];
  assign o_38[1] = out0[25];
  assign o_38[0] = out0[24];
endmodule

// END GENERATED LAKEROAD CODE

module std_const #(
    parameter WIDTH = 32,
    parameter VALUE = 0
) (
   output logic [WIDTH - 1:0] out
);
  assign out = VALUE;
endmodule

module std_wire #(
  parameter WIDTH = 32
) (
  input wire logic [WIDTH - 1:0] in,
  output logic [WIDTH - 1:0] out
);
  assign out = in;
endmodule

module std_slice #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire                   logic [ IN_WIDTH-1:0] in,
   output logic [OUT_WIDTH-1:0] out
);
  assign out = in[OUT_WIDTH-1:0];

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH < OUT_WIDTH)
        $error(
          "std_slice: Input width less than output width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_pad #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire logic [IN_WIDTH-1:0]  in,
   output logic     [OUT_WIDTH-1:0] out
);
  localparam EXTEND = OUT_WIDTH - IN_WIDTH;
  assign out = { {EXTEND {1'b0}}, in};

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH > OUT_WIDTH)
        $error(
          "std_pad: Output width less than input width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_not #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] in,
   output logic [WIDTH-1:0] out
);

  if (WIDTH == 1) begin
    lakeroad_xilinx_ultrascale_plus_not1 _impl(in, out);
  end
  else if (WIDTH == 8) begin
    lakeroad_xilinx_ultrascale_plus_not8 _impl(in, out);
  end
  else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  end

endmodule

module std_and #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  if (WIDTH == 1) begin
    lakeroad_xilinx_ultrascale_plus_and1 _impl(left, right, out);
  end
  else if (WIDTH == 32) begin
    lakeroad_xilinx_ultrascale_plus_and32 _impl(left, right, out);
  end
  else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  end
endmodule

module std_or #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  if (WIDTH == 1) begin
   lakeroad_xilinx_ultrascale_plus_or1 _impl(left, right, out);
  end
  else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  end
endmodule

module std_xor #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  // if (WIDTH == x) begin
  //   lakeroad_xilinx_ultrascale_plus_op _impl(in, out);
  // end
  // //else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  // end
endmodule

module std_add #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);

  if (WIDTH == 2) begin
    lakeroad_xilinx_ultrascale_plus_add2 _impl(left, right, out);
  end
  else if (WIDTH == 3) begin
    lakeroad_xilinx_ultrascale_plus_add3 _impl(left, right, out);
  end
  else if (WIDTH == 4) begin
    lakeroad_xilinx_ultrascale_plus_add4 _impl(left, right, out);
  end
  else if (WIDTH == 8) begin
    lakeroad_xilinx_ultrascale_plus_add8 _impl(left, right, out);
  end
  else if (WIDTH == 32) begin
    lakeroad_xilinx_ultrascale_plus_add32 _impl(left, right, out);
  end
  else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  end

endmodule

module std_sub #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  if (WIDTH == 5) begin
    lakeroad_xilinx_ultrascale_plus_sub5 _impl(left, right , out);
  end
  else if (WIDTH == 6) begin
    lakeroad_xilinx_ultrascale_plus_sub6 _impl(left, right , out);
  end
  else if (WIDTH == 32) begin
    lakeroad_xilinx_ultrascale_plus_sub32 _impl(left, right , out);
  end
  else begin
    $error("Unsupported bitwidth %0d", WIDTH);
  end
endmodule

module std_gt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left > right;
endmodule

module std_lt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left < right;
endmodule

module std_eq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left == right;
endmodule

module std_neq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left != right;
endmodule

module std_ge #(
    parameter WIDTH = 32
) (
    input wire   logic [WIDTH-1:0] left,
    input wire   logic [WIDTH-1:0] right,
    output logic out
);
  assign out = left >= right;
endmodule

module std_le #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left <= right;
endmodule

module std_lsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left << right;
endmodule

module std_rsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left >> right;
endmodule

/// this primitive is intended to be used
/// for lowering purposes (not in source programs)
module std_mux #(
    parameter WIDTH = 32
) (
   input wire               logic cond,
   input wire               logic [WIDTH-1:0] tru,
   input wire               logic [WIDTH-1:0] fal,
   output logic [WIDTH-1:0] out
);
  assign out = cond ? tru : fal;
endmodule

/// Memories
module std_reg #(
    parameter WIDTH = 32
) (
   input wire [ WIDTH-1:0]    in,
   input wire                 write_en,
   input wire                 clk,
   input wire                 reset,
    // output
   output logic [WIDTH - 1:0] out,
   output logic               done
);

  always_ff @(posedge clk) begin
    if (reset) begin
       out <= 0;
       done <= 0;
    end else if (write_en) begin
      out <= in;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d1 #(
    parameter WIDTH = 32,
    parameter SIZE = 16,
    parameter IDX_SIZE = 4
) (
   input wire                logic [IDX_SIZE-1:0] addr0,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  logic [WIDTH-1:0] mem[SIZE-1:0];

  /* verilator lint_off WIDTH */
  assign read_data = mem[addr0];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= SIZE)
        $error(
          "std_mem_d1: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "SIZE: %0d", SIZE
        );
    end
  `endif
endmodule

module std_mem_d2 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0];

  assign read_data = mem[addr0][addr1];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "std_mem_d2: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "std_mem_d2: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
    end
  `endif
endmodule

module std_mem_d3 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "std_mem_d3: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "std_mem_d3: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
      if (addr2 >= D2_SIZE)
        $error(
          "std_mem_d3: Out of bounds access\n",
          "addr2: %0d\n", addr2,
          "D2_SIZE: %0d", D2_SIZE
        );
    end
  `endif
endmodule

module std_mem_d4 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D3_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4,
    parameter D3_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [D3_IDX_SIZE-1:0] addr3,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0][D3_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2][addr3];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2][addr3] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end

  // Check for out of bounds access
  `ifdef VERILATOR
    always_comb begin
      if (addr0 >= D0_SIZE)
        $error(
          "std_mem_d4: Out of bounds access\n",
          "addr0: %0d\n", addr0,
          "D0_SIZE: %0d", D0_SIZE
        );
      if (addr1 >= D1_SIZE)
        $error(
          "std_mem_d4: Out of bounds access\n",
          "addr1: %0d\n", addr1,
          "D1_SIZE: %0d", D1_SIZE
        );
      if (addr2 >= D2_SIZE)
        $error(
          "std_mem_d4: Out of bounds access\n",
          "addr2: %0d\n", addr2,
          "D2_SIZE: %0d", D2_SIZE
        );
      if (addr3 >= D3_SIZE)
        $error(
          "std_mem_d4: Out of bounds access\n",
          "addr3: %0d\n", addr3,
          "D3_SIZE: %0d", D3_SIZE
        );
    end
  `endif
endmodule

`default_nettype wire
module main (
    input logic go,
    input logic clk,
    input logic reset,
    output logic done,
    output logic [3:0] A0_addr0,
    output logic [31:0] A0_write_data,
    output logic A0_write_en,
    output logic A0_clk,
    input logic [31:0] A0_read_data,
    input logic A0_done,
    output logic [3:0] B0_addr0,
    output logic [31:0] B0_write_data,
    output logic B0_write_en,
    output logic B0_clk,
    input logic [31:0] B0_read_data,
    input logic B0_done,
    output logic v0_addr0,
    output logic [31:0] v0_write_data,
    output logic v0_write_en,
    output logic v0_clk,
    input logic [31:0] v0_read_data,
    input logic v0_done
);
    logic [31:0] A_read0_0_in;
    logic A_read0_0_write_en;
    logic A_read0_0_clk;
    logic A_read0_0_reset;
    logic [31:0] A_read0_0_out;
    logic A_read0_0_done;
    logic [31:0] B_read0_0_in;
    logic B_read0_0_write_en;
    logic B_read0_0_clk;
    logic B_read0_0_reset;
    logic [31:0] B_read0_0_out;
    logic B_read0_0_done;
    logic [31:0] add0_left;
    logic [31:0] add0_right;
    logic [31:0] add0_out;
    logic [3:0] add1_left;
    logic [3:0] add1_right;
    logic [3:0] add1_out;
    logic [31:0] bin_read0_0_in;
    logic bin_read0_0_write_en;
    logic bin_read0_0_clk;
    logic bin_read0_0_reset;
    logic [31:0] bin_read0_0_out;
    logic bin_read0_0_done;
    logic [3:0] const0_out;
    logic [3:0] const1_out;
    logic const2_out;
    logic [3:0] const3_out;
    logic [31:0] dot_0_in;
    logic dot_0_write_en;
    logic dot_0_clk;
    logic dot_0_reset;
    logic [31:0] dot_0_out;
    logic dot_0_done;
    logic [3:0] i0_in;
    logic i0_write_en;
    logic i0_clk;
    logic i0_reset;
    logic [3:0] i0_out;
    logic i0_done;
    logic [3:0] le0_left;
    logic [3:0] le0_right;
    logic le0_out;
    logic mult_pipe0_clk;
    logic mult_pipe0_reset;
    logic mult_pipe0_go;
    logic [31:0] mult_pipe0_left;
    logic [31:0] mult_pipe0_right;
    logic [31:0] mult_pipe0_out;
    logic mult_pipe0_done;
    logic comb_reg_in;
    logic comb_reg_write_en;
    logic comb_reg_clk;
    logic comb_reg_reset;
    logic comb_reg_out;
    logic comb_reg_done;
    logic [3:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [3:0] fsm_out;
    logic fsm_done;
    logic let0_go_in;
    logic let0_go_out;
    logic let0_done_in;
    logic let0_done_out;
    logic let1_go_in;
    logic let1_go_out;
    logic let1_done_in;
    logic let1_done_out;
    logic let2_go_in;
    logic let2_go_out;
    logic let2_done_in;
    logic let2_done_out;
    logic upd2_go_in;
    logic upd2_go_out;
    logic upd2_done_in;
    logic upd2_done_out;
    logic upd3_go_in;
    logic upd3_go_out;
    logic upd3_done_in;
    logic upd3_done_out;
    logic cond00_go_in;
    logic cond00_go_out;
    logic cond00_done_in;
    logic cond00_done_out;
    logic msp_go_in;
    logic msp_go_out;
    logic msp_done_in;
    logic msp_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        A_read0_0_in = 32'd0;
        A_read0_0_write_en = 1'd0;
        A_read0_0_clk = 1'd0;
        A_read0_0_reset = 1'd0;
        B_read0_0_in = 32'd0;
        B_read0_0_write_en = 1'd0;
        B_read0_0_clk = 1'd0;
        B_read0_0_reset = 1'd0;
        add0_left = 32'd0;
        add0_right = 32'd0;
        add1_left = 4'd0;
        add1_right = 4'd0;
        bin_read0_0_in = 32'd0;
        bin_read0_0_write_en = 1'd0;
        bin_read0_0_clk = 1'd0;
        bin_read0_0_reset = 1'd0;
        dot_0_in = 32'd0;
        dot_0_write_en = 1'd0;
        dot_0_clk = 1'd0;
        dot_0_reset = 1'd0;
        i0_in = 4'd0;
        i0_write_en = 1'd0;
        i0_clk = 1'd0;
        i0_reset = 1'd0;
        le0_left = 4'd0;
        le0_right = 4'd0;
        mult_pipe0_clk = 1'd0;
        mult_pipe0_reset = 1'd0;
        mult_pipe0_go = 1'd0;
        mult_pipe0_left = 32'd0;
        mult_pipe0_right = 32'd0;
        comb_reg_in = 1'd0;
        comb_reg_write_en = 1'd0;
        comb_reg_clk = 1'd0;
        comb_reg_reset = 1'd0;
        fsm_in = 4'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        let0_go_in = 1'd0;
        let0_done_in = 1'd0;
        let1_go_in = 1'd0;
        let1_done_in = 1'd0;
        let2_go_in = 1'd0;
        let2_done_in = 1'd0;
        upd2_go_in = 1'd0;
        upd2_done_in = 1'd0;
        upd3_go_in = 1'd0;
        upd3_done_in = 1'd0;
        cond00_go_in = 1'd0;
        cond00_done_in = 1'd0;
        msp_go_in = 1'd0;
        msp_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_reg # (
        .WIDTH(32)
    ) A_read0_0 (
        .clk(A_read0_0_clk),
        .done(A_read0_0_done),
        .in(A_read0_0_in),
        .out(A_read0_0_out),
        .reset(A_read0_0_reset),
        .write_en(A_read0_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) B_read0_0 (
        .clk(B_read0_0_clk),
        .done(B_read0_0_done),
        .in(B_read0_0_in),
        .out(B_read0_0_out),
        .reset(B_read0_0_reset),
        .write_en(B_read0_0_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add0 (
        .left(add0_left),
        .out(add0_out),
        .right(add0_right)
    );
    std_add # (
        .WIDTH(4)
    ) add1 (
        .left(add1_left),
        .out(add1_out),
        .right(add1_right)
    );
    std_reg # (
        .WIDTH(32)
    ) bin_read0_0 (
        .clk(bin_read0_0_clk),
        .done(bin_read0_0_done),
        .in(bin_read0_0_in),
        .out(bin_read0_0_out),
        .reset(bin_read0_0_reset),
        .write_en(bin_read0_0_write_en)
    );
    std_const # (
        .VALUE(4'd0),
        .WIDTH(4)
    ) const0 (
        .out(const0_out)
    );
    std_const # (
        .VALUE(4'd7),
        .WIDTH(4)
    ) const1 (
        .out(const1_out)
    );
    std_const # (
        .VALUE(1'd0),
        .WIDTH(1)
    ) const2 (
        .out(const2_out)
    );
    std_const # (
        .VALUE(4'd1),
        .WIDTH(4)
    ) const3 (
        .out(const3_out)
    );
    std_reg # (
        .WIDTH(32)
    ) dot_0 (
        .clk(dot_0_clk),
        .done(dot_0_done),
        .in(dot_0_in),
        .out(dot_0_out),
        .reset(dot_0_reset),
        .write_en(dot_0_write_en)
    );
    std_reg # (
        .WIDTH(4)
    ) i0 (
        .clk(i0_clk),
        .done(i0_done),
        .in(i0_in),
        .out(i0_out),
        .reset(i0_reset),
        .write_en(i0_write_en)
    );
    std_le # (
        .WIDTH(4)
    ) le0 (
        .left(le0_left),
        .out(le0_out),
        .right(le0_right)
    );
    std_mult_pipe # (
        .WIDTH(32)
    ) mult_pipe0 (
        .clk(mult_pipe0_clk),
        .done(mult_pipe0_done),
        .go(mult_pipe0_go),
        .left(mult_pipe0_left),
        .out(mult_pipe0_out),
        .reset(mult_pipe0_reset),
        .right(mult_pipe0_right)
    );
    std_reg # (
        .WIDTH(1)
    ) comb_reg (
        .clk(comb_reg_clk),
        .done(comb_reg_done),
        .in(comb_reg_in),
        .out(comb_reg_out),
        .reset(comb_reg_reset),
        .write_en(comb_reg_write_en)
    );
    std_reg # (
        .WIDTH(4)
    ) fsm (
        .clk(fsm_clk),
        .done(fsm_done),
        .in(fsm_in),
        .out(fsm_out),
        .reset(fsm_reset),
        .write_en(fsm_write_en)
    );
    std_wire # (
        .WIDTH(1)
    ) let0_go (
        .in(let0_go_in),
        .out(let0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) let0_done (
        .in(let0_done_in),
        .out(let0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) let1_go (
        .in(let1_go_in),
        .out(let1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) let1_done (
        .in(let1_done_in),
        .out(let1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) let2_go (
        .in(let2_go_in),
        .out(let2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) let2_done (
        .in(let2_done_in),
        .out(let2_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) upd2_go (
        .in(upd2_go_in),
        .out(upd2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) upd2_done (
        .in(upd2_done_in),
        .out(upd2_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) upd3_go (
        .in(upd3_go_in),
        .out(upd3_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) upd3_done (
        .in(upd3_done_in),
        .out(upd3_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) cond00_go (
        .in(cond00_go_in),
        .out(cond00_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) cond00_done (
        .in(cond00_done_in),
        .out(cond00_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp_go (
        .in(msp_go_in),
        .out(msp_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp_done (
        .in(msp_done_in),
        .out(msp_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc_go (
        .in(tdcc_go_in),
        .out(tdcc_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc_done (
        .in(tdcc_done_in),
        .out(tdcc_done_out)
    );
    assign A_read0_0_clk = clk;
    assign A_read0_0_in =
     msp_go_out ? A0_read_data : 32'd0;
    assign A_read0_0_reset = reset;
    assign A_read0_0_write_en = msp_go_out;
    assign B_read0_0_clk = clk;
    assign B_read0_0_in =
     msp_go_out ? B0_read_data : 32'd0;
    assign B_read0_0_reset = reset;
    assign B_read0_0_write_en = msp_go_out;
    assign A0_addr0 =
     msp_go_out ? i0_out : 4'd0;
    assign A0_clk = clk;
    assign B0_addr0 =
     msp_go_out ? i0_out : 4'd0;
    assign B0_clk = clk;
    assign done = tdcc_done_out;
    assign v0_addr0 =
     upd2_go_out ? const2_out : 1'd0;
    assign v0_clk = clk;
    assign v0_write_data =
     upd2_go_out ? add0_out : 32'd0;
    assign v0_write_en = upd2_go_out;
    assign add0_left =
     upd2_go_out ? v0_read_data : 32'd0;
    assign add0_right =
     upd2_go_out ? dot_0_out : 32'd0;
    assign add1_left =
     upd3_go_out ? i0_out : 4'd0;
    assign add1_right =
     upd3_go_out ? const3_out : 4'd0;
    assign bin_read0_0_clk = clk;
    assign bin_read0_0_in =
     let1_go_out ? mult_pipe0_out : 32'd0;
    assign bin_read0_0_reset = reset;
    assign bin_read0_0_write_en =
     let1_go_out ? mult_pipe0_done : 1'd0;
    assign comb_reg_clk = clk;
    assign comb_reg_in =
     cond00_go_out ? le0_out : 1'd0;
    assign comb_reg_reset = reset;
    assign comb_reg_write_en = cond00_go_out;
    assign cond00_done_in = comb_reg_done;
    assign cond00_go_in = ~cond00_done_out & fsm_out == 4'd1 & tdcc_go_out | ~cond00_done_out & fsm_out == 4'd7 & tdcc_go_out;
    assign dot_0_clk = clk;
    assign dot_0_in =
     let2_go_out ? bin_read0_0_out : 32'd0;
    assign dot_0_reset = reset;
    assign dot_0_write_en = let2_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 4'd8 ? 4'd0 :
     fsm_out == 4'd0 & let0_done_out & tdcc_go_out ? 4'd1 :
     fsm_out == 4'd1 & cond00_done_out & comb_reg_out & tdcc_go_out | fsm_out == 4'd7 & cond00_done_out & comb_reg_out & tdcc_go_out ? 4'd2 :
     fsm_out == 4'd2 & msp_done_out & tdcc_go_out ? 4'd3 :
     fsm_out == 4'd3 & let1_done_out & tdcc_go_out ? 4'd4 :
     fsm_out == 4'd4 & let2_done_out & tdcc_go_out ? 4'd5 :
     fsm_out == 4'd5 & upd2_done_out & tdcc_go_out ? 4'd6 :
     fsm_out == 4'd6 & upd3_done_out & tdcc_go_out ? 4'd7 :
     fsm_out == 4'd1 & cond00_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 4'd7 & cond00_done_out & ~comb_reg_out & tdcc_go_out ? 4'd8 : 4'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 4'd8 | fsm_out == 4'd0 & let0_done_out & tdcc_go_out | fsm_out == 4'd1 & cond00_done_out & comb_reg_out & tdcc_go_out | fsm_out == 4'd7 & cond00_done_out & comb_reg_out & tdcc_go_out | fsm_out == 4'd2 & msp_done_out & tdcc_go_out | fsm_out == 4'd3 & let1_done_out & tdcc_go_out | fsm_out == 4'd4 & let2_done_out & tdcc_go_out | fsm_out == 4'd5 & upd2_done_out & tdcc_go_out | fsm_out == 4'd6 & upd3_done_out & tdcc_go_out | fsm_out == 4'd1 & cond00_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 4'd7 & cond00_done_out & ~comb_reg_out & tdcc_go_out;
    assign i0_clk = clk;
    assign i0_in =
     upd3_go_out ? add1_out :
     let0_go_out ? const0_out : 4'd0;
    assign i0_reset = reset;
    assign i0_write_en = let0_go_out | upd3_go_out;
    assign le0_left =
     cond00_go_out ? i0_out : 4'd0;
    assign le0_right =
     cond00_go_out ? const1_out : 4'd0;
    assign let0_done_in = i0_done;
    assign let0_go_in = ~let0_done_out & fsm_out == 4'd0 & tdcc_go_out;
    assign let1_done_in = bin_read0_0_done;
    assign let1_go_in = ~let1_done_out & fsm_out == 4'd3 & tdcc_go_out;
    assign let2_done_in = dot_0_done;
    assign let2_go_in = ~let2_done_out & fsm_out == 4'd4 & tdcc_go_out;
    assign msp_done_in = 1'b1 & A_read0_0_done & 1'b1 & B_read0_0_done;
    assign msp_go_in = ~msp_done_out & fsm_out == 4'd2 & tdcc_go_out;
    assign mult_pipe0_clk = clk;
    assign mult_pipe0_go = ~mult_pipe0_done & let1_go_out;
    assign mult_pipe0_left =
     let1_go_out ? A_read0_0_out : 32'd0;
    assign mult_pipe0_reset = reset;
    assign mult_pipe0_right =
     let1_go_out ? B_read0_0_out : 32'd0;
    assign tdcc_done_in = fsm_out == 4'd8;
    assign tdcc_go_in = go;
    assign upd2_done_in = v0_done;
    assign upd2_go_in = ~upd2_done_out & fsm_out == 4'd5 & tdcc_go_out;
    assign upd3_done_in = i0_done;
    assign upd3_go_in = ~upd3_done_out & fsm_out == 4'd6 & tdcc_go_out;
endmodule

