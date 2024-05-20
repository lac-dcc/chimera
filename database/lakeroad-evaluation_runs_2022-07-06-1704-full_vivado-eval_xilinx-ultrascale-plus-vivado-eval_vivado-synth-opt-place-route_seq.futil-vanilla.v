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
    output logic in_addr0,
    output logic [31:0] in_write_data,
    output logic in_write_en,
    output logic in_clk,
    input logic [31:0] in_read_data,
    input logic in_done,
    output logic out_addr0,
    output logic [31:0] out_write_data,
    output logic out_write_en,
    output logic out_clk,
    input logic [31:0] out_read_data,
    input logic out_done
);
    logic [31:0] b_in;
    logic b_write_en;
    logic b_clk;
    logic b_reset;
    logic [31:0] b_out;
    logic b_done;
    logic [31:0] c_in;
    logic c_write_en;
    logic c_clk;
    logic c_reset;
    logic [31:0] c_out;
    logic c_done;
    logic [1:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [1:0] fsm_out;
    logic fsm_done;
    logic B_go_in;
    logic B_go_out;
    logic B_done_in;
    logic B_done_out;
    logic C_go_in;
    logic C_go_out;
    logic C_done_in;
    logic C_done_out;
    logic commit_go_in;
    logic commit_go_out;
    logic commit_done_in;
    logic commit_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        b_in = 32'd0;
        b_write_en = 1'd0;
        b_clk = 1'd0;
        b_reset = 1'd0;
        c_in = 32'd0;
        c_write_en = 1'd0;
        c_clk = 1'd0;
        c_reset = 1'd0;
        fsm_in = 2'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        B_go_in = 1'd0;
        B_done_in = 1'd0;
        C_go_in = 1'd0;
        C_done_in = 1'd0;
        commit_go_in = 1'd0;
        commit_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_reg # (
        .WIDTH(32)
    ) b (
        .clk(b_clk),
        .done(b_done),
        .in(b_in),
        .out(b_out),
        .reset(b_reset),
        .write_en(b_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) c (
        .clk(c_clk),
        .done(c_done),
        .in(c_in),
        .out(c_out),
        .reset(c_reset),
        .write_en(c_write_en)
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
    ) B_go (
        .in(B_go_in),
        .out(B_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) B_done (
        .in(B_done_in),
        .out(B_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) C_go (
        .in(C_go_in),
        .out(C_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) C_done (
        .in(C_done_in),
        .out(C_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) commit_go (
        .in(commit_go_in),
        .out(commit_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) commit_done (
        .in(commit_done_in),
        .out(commit_done_out)
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
    assign B_done_in = b_done;
    assign B_go_in = ~B_done_out & fsm_out == 2'd0 & tdcc_go_out;
    assign C_done_in = c_done;
    assign C_go_in = ~C_done_out & fsm_out == 2'd1 & tdcc_go_out;
    assign done = tdcc_done_out;
    assign in_addr0 =
     B_go_out ? 1'd0 : 1'd0;
    assign in_clk = clk;
    assign out_addr0 =
     commit_go_out ? 1'd0 : 1'd0;
    assign out_clk = clk;
    assign out_write_data =
     commit_go_out ? c_out : 32'd0;
    assign out_write_en = commit_go_out;
    assign b_clk = clk;
    assign b_in =
     B_go_out ? in_read_data : 32'd0;
    assign b_reset = reset;
    assign b_write_en = B_go_out;
    assign c_clk = clk;
    assign c_in =
     C_go_out ? b_out : 32'd0;
    assign c_reset = reset;
    assign c_write_en = C_go_out;
    assign commit_done_in = out_done;
    assign commit_go_in = ~commit_done_out & fsm_out == 2'd2 & tdcc_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 2'd3 ? 2'd0 :
     fsm_out == 2'd0 & B_done_out & tdcc_go_out ? 2'd1 :
     fsm_out == 2'd1 & C_done_out & tdcc_go_out ? 2'd2 :
     fsm_out == 2'd2 & commit_done_out & tdcc_go_out ? 2'd3 : 2'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 2'd3 | fsm_out == 2'd0 & B_done_out & tdcc_go_out | fsm_out == 2'd1 & C_done_out & tdcc_go_out | fsm_out == 2'd2 & commit_done_out & tdcc_go_out;
    assign tdcc_done_in = fsm_out == 2'd3;
    assign tdcc_go_in = go;
endmodule

