// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

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
    output logic i_addr0,
    output logic [31:0] i_write_data,
    output logic i_write_en,
    output logic i_clk,
    input logic [31:0] i_read_data,
    input logic i_done
);
    logic eq_left;
    logic eq_right;
    logic eq_out;
    logic [31:0] t0_in;
    logic t0_write_en;
    logic t0_clk;
    logic t0_reset;
    logic [31:0] t0_out;
    logic t0_done;
    logic [31:0] t1_in;
    logic t1_write_en;
    logic t1_clk;
    logic t1_reset;
    logic [31:0] t1_out;
    logic t1_done;
    logic [31:0] t2_in;
    logic t2_write_en;
    logic t2_clk;
    logic t2_reset;
    logic [31:0] t2_out;
    logic t2_done;
    logic [31:0] t3_in;
    logic t3_write_en;
    logic t3_clk;
    logic t3_reset;
    logic [31:0] t3_out;
    logic t3_done;
    logic [31:0] t4_in;
    logic t4_write_en;
    logic t4_clk;
    logic t4_reset;
    logic [31:0] t4_out;
    logic t4_done;
    logic [31:0] add_left;
    logic [31:0] add_right;
    logic [31:0] add_out;
    logic comb_reg_in;
    logic comb_reg_write_en;
    logic comb_reg_clk;
    logic comb_reg_reset;
    logic comb_reg_out;
    logic comb_reg_done;
    logic [1:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [1:0] fsm_out;
    logic fsm_done;
    logic true_go_in;
    logic true_go_out;
    logic true_done_in;
    logic true_done_out;
    logic false_go_in;
    logic false_go_out;
    logic false_done_in;
    logic false_done_out;
    logic cond0_go_in;
    logic cond0_go_out;
    logic cond0_done_in;
    logic cond0_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        eq_left = 1'd0;
        eq_right = 1'd0;
        t0_in = 32'd0;
        t0_write_en = 1'd0;
        t0_clk = 1'd0;
        t0_reset = 1'd0;
        t1_in = 32'd0;
        t1_write_en = 1'd0;
        t1_clk = 1'd0;
        t1_reset = 1'd0;
        t2_in = 32'd0;
        t2_write_en = 1'd0;
        t2_clk = 1'd0;
        t2_reset = 1'd0;
        t3_in = 32'd0;
        t3_write_en = 1'd0;
        t3_clk = 1'd0;
        t3_reset = 1'd0;
        t4_in = 32'd0;
        t4_write_en = 1'd0;
        t4_clk = 1'd0;
        t4_reset = 1'd0;
        add_left = 32'd0;
        add_right = 32'd0;
        comb_reg_in = 1'd0;
        comb_reg_write_en = 1'd0;
        comb_reg_clk = 1'd0;
        comb_reg_reset = 1'd0;
        fsm_in = 2'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        true_go_in = 1'd0;
        true_done_in = 1'd0;
        false_go_in = 1'd0;
        false_done_in = 1'd0;
        cond0_go_in = 1'd0;
        cond0_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_eq # (
        .WIDTH(1)
    ) eq (
        .left(eq_left),
        .out(eq_out),
        .right(eq_right)
    );
    std_reg # (
        .WIDTH(32)
    ) t0 (
        .clk(t0_clk),
        .done(t0_done),
        .in(t0_in),
        .out(t0_out),
        .reset(t0_reset),
        .write_en(t0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) t1 (
        .clk(t1_clk),
        .done(t1_done),
        .in(t1_in),
        .out(t1_out),
        .reset(t1_reset),
        .write_en(t1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) t2 (
        .clk(t2_clk),
        .done(t2_done),
        .in(t2_in),
        .out(t2_out),
        .reset(t2_reset),
        .write_en(t2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) t3 (
        .clk(t3_clk),
        .done(t3_done),
        .in(t3_in),
        .out(t3_out),
        .reset(t3_reset),
        .write_en(t3_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) t4 (
        .clk(t4_clk),
        .done(t4_done),
        .in(t4_in),
        .out(t4_out),
        .reset(t4_reset),
        .write_en(t4_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add (
        .left(add_left),
        .out(add_out),
        .right(add_right)
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
        .WIDTH(2)
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
    ) true_go (
        .in(true_go_in),
        .out(true_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) true_done (
        .in(true_done_in),
        .out(true_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) false_go (
        .in(false_go_in),
        .out(false_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) false_done (
        .in(false_done_in),
        .out(false_done_out)
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
    assign i_addr0 =
     false_go_out ? 1'd0 : 1'd0;
    assign i_clk = clk;
    assign i_write_data =
     false_go_out ? add_out : 32'd0;
    assign i_write_en = false_go_out;
    assign add_left =
     false_go_out ? i_read_data : 32'd0;
    assign add_right =
     false_go_out ? 32'd1 : 32'd0;
    assign comb_reg_clk = clk;
    assign comb_reg_in =
     cond0_go_out ? eq_out : 1'd0;
    assign comb_reg_reset = reset;
    assign comb_reg_write_en = cond0_go_out;
    assign cond0_done_in = comb_reg_done;
    assign cond0_go_in = ~cond0_done_out & fsm_out == 2'd0 & tdcc_go_out;
    assign eq_left =
     cond0_go_out ? 1'd0 : 1'd0;
    assign eq_right = cond0_go_out;
    assign false_done_in = i_done;
    assign false_go_in = ~false_done_out & fsm_out == 2'd2 & tdcc_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 2'd3 ? 2'd0 :
     fsm_out == 2'd0 & cond0_done_out & comb_reg_out & tdcc_go_out ? 2'd1 :
     fsm_out == 2'd0 & cond0_done_out & ~comb_reg_out & tdcc_go_out ? 2'd2 :
     fsm_out == 2'd1 & true_done_out & tdcc_go_out | fsm_out == 2'd2 & false_done_out & tdcc_go_out ? 2'd3 : 2'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 2'd3 | fsm_out == 2'd0 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 2'd0 & cond0_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 2'd1 & true_done_out & tdcc_go_out | fsm_out == 2'd2 & false_done_out & tdcc_go_out;
    assign t0_clk = clk;
    assign t0_in =
     true_go_out ? 32'd1 : 32'd0;
    assign t0_reset = reset;
    assign t0_write_en = true_go_out;
    assign t1_clk = clk;
    assign t1_in =
     true_go_out ? t0_out : 32'd0;
    assign t1_reset = reset;
    assign t1_write_en =
     true_go_out ? t0_done : 1'd0;
    assign t2_clk = clk;
    assign t2_in =
     true_go_out ? t1_out : 32'd0;
    assign t2_reset = reset;
    assign t2_write_en =
     true_go_out ? t1_done : 1'd0;
    assign t3_clk = clk;
    assign t3_in =
     true_go_out ? t2_out : 32'd0;
    assign t3_reset = reset;
    assign t3_write_en =
     true_go_out ? t2_done : 1'd0;
    assign t4_clk = clk;
    assign t4_in =
     true_go_out ? t3_out : 32'd0;
    assign t4_reset = reset;
    assign t4_write_en =
     true_go_out ? t3_done : 1'd0;
    assign tdcc_done_in = fsm_out == 2'd3;
    assign tdcc_go_in = go;
    assign true_done_in = t4_done;
    assign true_go_in = ~true_done_out & fsm_out == 2'd1 & tdcc_go_out;
endmodule

