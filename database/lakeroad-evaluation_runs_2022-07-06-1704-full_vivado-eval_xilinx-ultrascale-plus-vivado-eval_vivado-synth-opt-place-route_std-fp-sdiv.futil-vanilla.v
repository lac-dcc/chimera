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
  assign out = ~in;
endmodule

module std_and #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left & right;
endmodule

module std_or #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left | right;
endmodule

module std_xor #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left ^ right;
endmodule

module std_add #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left + right;
endmodule

module std_sub #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left - right;
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
    output logic [2:0] left_addr0,
    output logic [31:0] left_write_data,
    output logic left_write_en,
    output logic left_clk,
    input logic [31:0] left_read_data,
    input logic left_done,
    output logic [2:0] right_addr0,
    output logic [31:0] right_write_data,
    output logic right_write_en,
    output logic right_clk,
    input logic [31:0] right_read_data,
    input logic right_done,
    output logic [2:0] out_rem_addr0,
    output logic [31:0] out_rem_write_data,
    output logic out_rem_write_en,
    output logic out_rem_clk,
    input logic [31:0] out_rem_read_data,
    input logic out_rem_done,
    output logic [2:0] out_quot_addr0,
    output logic [31:0] out_quot_write_data,
    output logic out_quot_write_en,
    output logic out_quot_clk,
    input logic [31:0] out_quot_read_data,
    input logic out_quot_done
);
    logic div_clk;
    logic div_reset;
    logic div_go;
    logic [31:0] div_left;
    logic [31:0] div_right;
    logic [31:0] div_out_remainder;
    logic [31:0] div_out_quotient;
    logic div_done;
    logic [2:0] add_left;
    logic [2:0] add_right;
    logic [2:0] add_out;
    logic [2:0] idx_in;
    logic idx_write_en;
    logic idx_clk;
    logic idx_reset;
    logic [2:0] idx_out;
    logic idx_done;
    logic [2:0] lt_left;
    logic [2:0] lt_right;
    logic lt_out;
    logic comb_reg_in;
    logic comb_reg_write_en;
    logic comb_reg_clk;
    logic comb_reg_reset;
    logic comb_reg_out;
    logic comb_reg_done;
    logic [31:0] comb_reg0_in;
    logic comb_reg0_write_en;
    logic comb_reg0_clk;
    logic comb_reg0_reset;
    logic [31:0] comb_reg0_out;
    logic comb_reg0_done;
    logic [31:0] comb_reg1_in;
    logic comb_reg1_write_en;
    logic comb_reg1_clk;
    logic comb_reg1_reset;
    logic [31:0] comb_reg1_out;
    logic comb_reg1_done;
    logic [2:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [2:0] fsm_out;
    logic fsm_done;
    logic init_go_in;
    logic init_go_out;
    logic init_done_in;
    logic init_done_out;
    logic incr_go_in;
    logic incr_go_out;
    logic incr_done_in;
    logic incr_done_out;
    logic cond0_go_in;
    logic cond0_go_out;
    logic cond0_done_in;
    logic cond0_done_out;
    logic read_mem_idx0_go_in;
    logic read_mem_idx0_go_out;
    logic read_mem_idx0_done_in;
    logic read_mem_idx0_done_out;
    logic msp_go_in;
    logic msp_go_out;
    logic msp_done_in;
    logic msp_done_out;
    logic invoke_go_in;
    logic invoke_go_out;
    logic invoke_done_in;
    logic invoke_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        div_clk = 1'd0;
        div_reset = 1'd0;
        div_go = 1'd0;
        div_left = 32'd0;
        div_right = 32'd0;
        add_left = 3'd0;
        add_right = 3'd0;
        idx_in = 3'd0;
        idx_write_en = 1'd0;
        idx_clk = 1'd0;
        idx_reset = 1'd0;
        lt_left = 3'd0;
        lt_right = 3'd0;
        comb_reg_in = 1'd0;
        comb_reg_write_en = 1'd0;
        comb_reg_clk = 1'd0;
        comb_reg_reset = 1'd0;
        comb_reg0_in = 32'd0;
        comb_reg0_write_en = 1'd0;
        comb_reg0_clk = 1'd0;
        comb_reg0_reset = 1'd0;
        comb_reg1_in = 32'd0;
        comb_reg1_write_en = 1'd0;
        comb_reg1_clk = 1'd0;
        comb_reg1_reset = 1'd0;
        fsm_in = 3'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        init_go_in = 1'd0;
        init_done_in = 1'd0;
        incr_go_in = 1'd0;
        incr_done_in = 1'd0;
        cond0_go_in = 1'd0;
        cond0_done_in = 1'd0;
        read_mem_idx0_go_in = 1'd0;
        read_mem_idx0_done_in = 1'd0;
        msp_go_in = 1'd0;
        msp_done_in = 1'd0;
        invoke_go_in = 1'd0;
        invoke_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_fp_sdiv_pipe # (
        .FRAC_WIDTH(8),
        .INT_WIDTH(24),
        .WIDTH(32)
    ) div (
        .clk(div_clk),
        .done(div_done),
        .go(div_go),
        .left(div_left),
        .out_quotient(div_out_quotient),
        .out_remainder(div_out_remainder),
        .reset(div_reset),
        .right(div_right)
    );
    std_add # (
        .WIDTH(3)
    ) add (
        .left(add_left),
        .out(add_out),
        .right(add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) idx (
        .clk(idx_clk),
        .done(idx_done),
        .in(idx_in),
        .out(idx_out),
        .reset(idx_reset),
        .write_en(idx_write_en)
    );
    std_lt # (
        .WIDTH(3)
    ) lt (
        .left(lt_left),
        .out(lt_out),
        .right(lt_right)
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
        .WIDTH(32)
    ) comb_reg0 (
        .clk(comb_reg0_clk),
        .done(comb_reg0_done),
        .in(comb_reg0_in),
        .out(comb_reg0_out),
        .reset(comb_reg0_reset),
        .write_en(comb_reg0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) comb_reg1 (
        .clk(comb_reg1_clk),
        .done(comb_reg1_done),
        .in(comb_reg1_in),
        .out(comb_reg1_out),
        .reset(comb_reg1_reset),
        .write_en(comb_reg1_write_en)
    );
    std_reg # (
        .WIDTH(3)
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
    ) init_go (
        .in(init_go_in),
        .out(init_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) init_done (
        .in(init_done_in),
        .out(init_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) incr_go (
        .in(incr_go_in),
        .out(incr_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) incr_done (
        .in(incr_done_in),
        .out(incr_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) cond0_go (
        .in(cond0_go_in),
        .out(cond0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) cond0_done (
        .in(cond0_done_in),
        .out(cond0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) read_mem_idx0_go (
        .in(read_mem_idx0_go_in),
        .out(read_mem_idx0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) read_mem_idx0_done (
        .in(read_mem_idx0_done_in),
        .out(read_mem_idx0_done_out)
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
    ) invoke_go (
        .in(invoke_go_in),
        .out(invoke_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) invoke_done (
        .in(invoke_done_in),
        .out(invoke_done_out)
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
    assign done = tdcc_done_out;
    assign left_addr0 =
     read_mem_idx0_go_out ? idx_out : 3'd0;
    assign left_clk = clk;
    assign out_quot_addr0 =
     msp_go_out ? idx_out : 3'd0;
    assign out_quot_clk = clk;
    assign out_quot_write_data =
     msp_go_out ? div_out_quotient : 32'd0;
    assign out_quot_write_en = msp_go_out;
    assign out_rem_addr0 =
     msp_go_out ? idx_out : 3'd0;
    assign out_rem_clk = clk;
    assign out_rem_write_data =
     msp_go_out ? div_out_remainder : 32'd0;
    assign out_rem_write_en = msp_go_out;
    assign right_addr0 =
     read_mem_idx0_go_out ? idx_out : 3'd0;
    assign right_clk = clk;
    assign add_left =
     incr_go_out ? idx_out : 3'd0;
    assign add_right =
     incr_go_out ? 3'd1 : 3'd0;
    assign comb_reg_clk = clk;
    assign comb_reg_in =
     cond0_go_out ? lt_out : 1'd0;
    assign comb_reg_reset = reset;
    assign comb_reg_write_en = cond0_go_out;
    assign comb_reg0_clk = clk;
    assign comb_reg0_in =
     read_mem_idx0_go_out ? left_read_data : 32'd0;
    assign comb_reg0_reset = reset;
    assign comb_reg0_write_en = read_mem_idx0_go_out;
    assign comb_reg1_clk = clk;
    assign comb_reg1_in =
     read_mem_idx0_go_out ? right_read_data : 32'd0;
    assign comb_reg1_reset = reset;
    assign comb_reg1_write_en = read_mem_idx0_go_out;
    assign cond0_done_in = comb_reg_done;
    assign cond0_go_in = ~cond0_done_out & fsm_out == 3'd1 & tdcc_go_out | ~cond0_done_out & fsm_out == 3'd6 & tdcc_go_out;
    assign div_clk = clk;
    assign div_go = invoke_go_out;
    assign div_left =
     invoke_go_out ? comb_reg0_out : 32'd0;
    assign div_reset = reset;
    assign div_right =
     invoke_go_out ? comb_reg1_out : 32'd0;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 3'd7 ? 3'd0 :
     fsm_out == 3'd0 & init_done_out & tdcc_go_out ? 3'd1 :
     fsm_out == 3'd1 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd6 & cond0_done_out & comb_reg_out & tdcc_go_out ? 3'd2 :
     fsm_out == 3'd2 & read_mem_idx0_done_out & tdcc_go_out ? 3'd3 :
     fsm_out == 3'd3 & invoke_done_out & tdcc_go_out ? 3'd4 :
     fsm_out == 3'd4 & msp_done_out & tdcc_go_out ? 3'd5 :
     fsm_out == 3'd5 & incr_done_out & tdcc_go_out ? 3'd6 :
     fsm_out == 3'd1 & cond0_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 3'd6 & cond0_done_out & ~comb_reg_out & tdcc_go_out ? 3'd7 : 3'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 3'd7 | fsm_out == 3'd0 & init_done_out & tdcc_go_out | fsm_out == 3'd1 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd6 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd2 & read_mem_idx0_done_out & tdcc_go_out | fsm_out == 3'd3 & invoke_done_out & tdcc_go_out | fsm_out == 3'd4 & msp_done_out & tdcc_go_out | fsm_out == 3'd5 & incr_done_out & tdcc_go_out | fsm_out == 3'd1 & cond0_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 3'd6 & cond0_done_out & ~comb_reg_out & tdcc_go_out;
    assign idx_clk = clk;
    assign idx_in =
     init_go_out ? 3'd0 :
     incr_go_out ? add_out : 3'd0;
    assign idx_reset = reset;
    assign idx_write_en = init_go_out | incr_go_out;
    assign incr_done_in = idx_done;
    assign incr_go_in = ~incr_done_out & fsm_out == 3'd5 & tdcc_go_out;
    assign init_done_in = idx_done;
    assign init_go_in = ~init_done_out & fsm_out == 3'd0 & tdcc_go_out;
    assign invoke_done_in = div_done;
    assign invoke_go_in = ~invoke_done_out & fsm_out == 3'd3 & tdcc_go_out;
    assign lt_left =
     cond0_go_out ? idx_out : 3'd0;
    assign lt_right =
     cond0_go_out ? 3'd4 : 3'd0;
    assign msp_done_in = out_rem_done & out_quot_done;
    assign msp_go_in = ~msp_done_out & fsm_out == 3'd4 & tdcc_go_out;
    assign read_mem_idx0_done_in = comb_reg0_done & comb_reg1_done;
    assign read_mem_idx0_go_in = ~read_mem_idx0_done_out & fsm_out == 3'd2 & tdcc_go_out;
    assign tdcc_done_in = fsm_out == 3'd7;
    assign tdcc_go_in = go;
endmodule

