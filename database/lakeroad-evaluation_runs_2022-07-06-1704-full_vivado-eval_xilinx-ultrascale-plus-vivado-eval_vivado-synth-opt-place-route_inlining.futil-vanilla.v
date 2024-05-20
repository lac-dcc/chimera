// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

/// Unsynthesizable Primitives

module std_unsyn_mult #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left * right;
endmodule

module std_unsyn_div #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left / right;
endmodule

module std_unsyn_mod #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left % right;
endmodule

module std_unsyn_sdiv #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left / right);
endmodule

module std_unsyn_smod #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left % right);
endmodule


module std_unsyn_smult #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left * right);
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
    output logic [1:0] t0_addr0,
    output logic [31:0] t0_write_data,
    output logic t0_write_en,
    output logic t0_clk,
    input logic [31:0] t0_read_data,
    input logic t0_done,
    output logic [1:0] t1_addr0,
    output logic [31:0] t1_write_data,
    output logic t1_write_en,
    output logic t1_clk,
    input logic [31:0] t1_read_data,
    input logic t1_done,
    output logic [1:0] l0_addr0,
    output logic [31:0] l0_write_data,
    output logic l0_write_en,
    output logic l0_clk,
    input logic [31:0] l0_read_data,
    input logic l0_done,
    output logic [1:0] l1_addr0,
    output logic [31:0] l1_write_data,
    output logic l1_write_en,
    output logic l1_clk,
    input logic [31:0] l1_read_data,
    input logic l1_done,
    output logic [2:0] out_mem_addr0,
    output logic [31:0] out_mem_write_data,
    output logic out_mem_write_en,
    output logic out_mem_clk,
    input logic [31:0] out_mem_read_data,
    input logic out_mem_done
);
    logic [1:0] t0_idx_in;
    logic t0_idx_write_en;
    logic t0_idx_clk;
    logic t0_idx_reset;
    logic [1:0] t0_idx_out;
    logic t0_idx_done;
    logic [1:0] t0_add_left;
    logic [1:0] t0_add_right;
    logic [1:0] t0_add_out;
    logic [1:0] t1_idx_in;
    logic t1_idx_write_en;
    logic t1_idx_clk;
    logic t1_idx_reset;
    logic [1:0] t1_idx_out;
    logic t1_idx_done;
    logic [1:0] t1_add_left;
    logic [1:0] t1_add_right;
    logic [1:0] t1_add_out;
    logic [1:0] l0_idx_in;
    logic l0_idx_write_en;
    logic l0_idx_clk;
    logic l0_idx_reset;
    logic [1:0] l0_idx_out;
    logic l0_idx_done;
    logic [1:0] l0_add_left;
    logic [1:0] l0_add_right;
    logic [1:0] l0_add_out;
    logic [1:0] l1_idx_in;
    logic l1_idx_write_en;
    logic l1_idx_clk;
    logic l1_idx_reset;
    logic [1:0] l1_idx_out;
    logic l1_idx_done;
    logic [1:0] l1_add_left;
    logic [1:0] l1_add_right;
    logic [1:0] l1_add_out;
    logic [31:0] top_0_0_in;
    logic top_0_0_write_en;
    logic top_0_0_clk;
    logic top_0_0_reset;
    logic [31:0] top_0_0_out;
    logic top_0_0_done;
    logic [31:0] left_0_0_in;
    logic left_0_0_write_en;
    logic left_0_0_clk;
    logic left_0_0_reset;
    logic [31:0] left_0_0_out;
    logic left_0_0_done;
    logic [31:0] top_0_1_in;
    logic top_0_1_write_en;
    logic top_0_1_clk;
    logic top_0_1_reset;
    logic [31:0] top_0_1_out;
    logic top_0_1_done;
    logic [31:0] left_0_1_in;
    logic left_0_1_write_en;
    logic left_0_1_clk;
    logic left_0_1_reset;
    logic [31:0] left_0_1_out;
    logic left_0_1_done;
    logic [31:0] top_1_0_in;
    logic top_1_0_write_en;
    logic top_1_0_clk;
    logic top_1_0_reset;
    logic [31:0] top_1_0_out;
    logic top_1_0_done;
    logic [31:0] left_1_0_in;
    logic left_1_0_write_en;
    logic left_1_0_clk;
    logic left_1_0_reset;
    logic [31:0] left_1_0_out;
    logic left_1_0_done;
    logic [31:0] top_1_1_in;
    logic top_1_1_write_en;
    logic top_1_1_clk;
    logic top_1_1_reset;
    logic [31:0] top_1_1_out;
    logic top_1_1_done;
    logic [31:0] left_1_1_in;
    logic left_1_1_write_en;
    logic left_1_1_clk;
    logic left_1_1_reset;
    logic [31:0] left_1_1_out;
    logic left_1_1_done;
    logic [31:0] mul_out_in;
    logic mul_out_write_en;
    logic mul_out_clk;
    logic mul_out_reset;
    logic [31:0] mul_out_out;
    logic mul_out_done;
    logic [31:0] acc_in;
    logic acc_write_en;
    logic acc_clk;
    logic acc_reset;
    logic [31:0] acc_out;
    logic acc_done;
    logic [31:0] add_left;
    logic [31:0] add_right;
    logic [31:0] add_out;
    logic [31:0] mult0_left;
    logic [31:0] mult0_right;
    logic [31:0] mult0_out;
    logic [31:0] mul_out0_in;
    logic mul_out0_write_en;
    logic mul_out0_clk;
    logic mul_out0_reset;
    logic [31:0] mul_out0_out;
    logic mul_out0_done;
    logic [31:0] acc0_in;
    logic acc0_write_en;
    logic acc0_clk;
    logic acc0_reset;
    logic [31:0] acc0_out;
    logic acc0_done;
    logic [31:0] add0_left;
    logic [31:0] add0_right;
    logic [31:0] add0_out;
    logic [31:0] mult00_left;
    logic [31:0] mult00_right;
    logic [31:0] mult00_out;
    logic [31:0] mul_out1_in;
    logic mul_out1_write_en;
    logic mul_out1_clk;
    logic mul_out1_reset;
    logic [31:0] mul_out1_out;
    logic mul_out1_done;
    logic [31:0] acc1_in;
    logic acc1_write_en;
    logic acc1_clk;
    logic acc1_reset;
    logic [31:0] acc1_out;
    logic acc1_done;
    logic [31:0] add1_left;
    logic [31:0] add1_right;
    logic [31:0] add1_out;
    logic [31:0] mult01_left;
    logic [31:0] mult01_right;
    logic [31:0] mult01_out;
    logic [31:0] mul_out2_in;
    logic mul_out2_write_en;
    logic mul_out2_clk;
    logic mul_out2_reset;
    logic [31:0] mul_out2_out;
    logic mul_out2_done;
    logic [31:0] acc2_in;
    logic acc2_write_en;
    logic acc2_clk;
    logic acc2_reset;
    logic [31:0] acc2_out;
    logic acc2_done;
    logic [31:0] add2_left;
    logic [31:0] add2_right;
    logic [31:0] add2_out;
    logic [31:0] mult02_left;
    logic [31:0] mult02_right;
    logic [31:0] mult02_out;
    logic pd_in;
    logic pd_write_en;
    logic pd_clk;
    logic pd_reset;
    logic pd_out;
    logic pd_done;
    logic [1:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [1:0] fsm_out;
    logic fsm_done;
    logic pd0_in;
    logic pd0_write_en;
    logic pd0_clk;
    logic pd0_reset;
    logic pd0_out;
    logic pd0_done;
    logic pd1_in;
    logic pd1_write_en;
    logic pd1_clk;
    logic pd1_reset;
    logic pd1_out;
    logic pd1_done;
    logic pd2_in;
    logic pd2_write_en;
    logic pd2_clk;
    logic pd2_reset;
    logic pd2_out;
    logic pd2_done;
    logic pd3_in;
    logic pd3_write_en;
    logic pd3_clk;
    logic pd3_reset;
    logic pd3_out;
    logic pd3_done;
    logic pd4_in;
    logic pd4_write_en;
    logic pd4_clk;
    logic pd4_reset;
    logic pd4_out;
    logic pd4_done;
    logic pd5_in;
    logic pd5_write_en;
    logic pd5_clk;
    logic pd5_reset;
    logic pd5_out;
    logic pd5_done;
    logic pd6_in;
    logic pd6_write_en;
    logic pd6_clk;
    logic pd6_reset;
    logic pd6_out;
    logic pd6_done;
    logic pd7_in;
    logic pd7_write_en;
    logic pd7_clk;
    logic pd7_reset;
    logic pd7_out;
    logic pd7_done;
    logic [1:0] fsm0_in;
    logic fsm0_write_en;
    logic fsm0_clk;
    logic fsm0_reset;
    logic [1:0] fsm0_out;
    logic fsm0_done;
    logic pd8_in;
    logic pd8_write_en;
    logic pd8_clk;
    logic pd8_reset;
    logic pd8_out;
    logic pd8_done;
    logic pd9_in;
    logic pd9_write_en;
    logic pd9_clk;
    logic pd9_reset;
    logic pd9_out;
    logic pd9_done;
    logic pd10_in;
    logic pd10_write_en;
    logic pd10_clk;
    logic pd10_reset;
    logic pd10_out;
    logic pd10_done;
    logic pd11_in;
    logic pd11_write_en;
    logic pd11_clk;
    logic pd11_reset;
    logic pd11_out;
    logic pd11_done;
    logic pd12_in;
    logic pd12_write_en;
    logic pd12_clk;
    logic pd12_reset;
    logic pd12_out;
    logic pd12_done;
    logic pd13_in;
    logic pd13_write_en;
    logic pd13_clk;
    logic pd13_reset;
    logic pd13_out;
    logic pd13_done;
    logic pd14_in;
    logic pd14_write_en;
    logic pd14_clk;
    logic pd14_reset;
    logic pd14_out;
    logic pd14_done;
    logic pd15_in;
    logic pd15_write_en;
    logic pd15_clk;
    logic pd15_reset;
    logic pd15_out;
    logic pd15_done;
    logic pd16_in;
    logic pd16_write_en;
    logic pd16_clk;
    logic pd16_reset;
    logic pd16_out;
    logic pd16_done;
    logic pd17_in;
    logic pd17_write_en;
    logic pd17_clk;
    logic pd17_reset;
    logic pd17_out;
    logic pd17_done;
    logic [1:0] fsm1_in;
    logic fsm1_write_en;
    logic fsm1_clk;
    logic fsm1_reset;
    logic [1:0] fsm1_out;
    logic fsm1_done;
    logic pd18_in;
    logic pd18_write_en;
    logic pd18_clk;
    logic pd18_reset;
    logic pd18_out;
    logic pd18_done;
    logic pd19_in;
    logic pd19_write_en;
    logic pd19_clk;
    logic pd19_reset;
    logic pd19_out;
    logic pd19_done;
    logic pd20_in;
    logic pd20_write_en;
    logic pd20_clk;
    logic pd20_reset;
    logic pd20_out;
    logic pd20_done;
    logic pd21_in;
    logic pd21_write_en;
    logic pd21_clk;
    logic pd21_reset;
    logic pd21_out;
    logic pd21_done;
    logic pd22_in;
    logic pd22_write_en;
    logic pd22_clk;
    logic pd22_reset;
    logic pd22_out;
    logic pd22_done;
    logic pd23_in;
    logic pd23_write_en;
    logic pd23_clk;
    logic pd23_reset;
    logic pd23_out;
    logic pd23_done;
    logic pd24_in;
    logic pd24_write_en;
    logic pd24_clk;
    logic pd24_reset;
    logic pd24_out;
    logic pd24_done;
    logic [4:0] fsm2_in;
    logic fsm2_write_en;
    logic fsm2_clk;
    logic fsm2_reset;
    logic [4:0] fsm2_out;
    logic fsm2_done;
    logic pe_0_0_out_write_go_in;
    logic pe_0_0_out_write_go_out;
    logic pe_0_0_out_write_done_in;
    logic pe_0_0_out_write_done_out;
    logic pe_0_1_out_write_go_in;
    logic pe_0_1_out_write_go_out;
    logic pe_0_1_out_write_done_in;
    logic pe_0_1_out_write_done_out;
    logic pe_1_0_out_write_go_in;
    logic pe_1_0_out_write_go_out;
    logic pe_1_0_out_write_done_in;
    logic pe_1_0_out_write_done_out;
    logic pe_1_1_out_write_go_in;
    logic pe_1_1_out_write_go_out;
    logic pe_1_1_out_write_done_in;
    logic pe_1_1_out_write_done_out;
    logic do_mul_go_in;
    logic do_mul_go_out;
    logic do_mul_done_in;
    logic do_mul_done_out;
    logic do_add_go_in;
    logic do_add_go_out;
    logic do_add_done_in;
    logic do_add_done_out;
    logic do_mul0_go_in;
    logic do_mul0_go_out;
    logic do_mul0_done_in;
    logic do_mul0_done_out;
    logic do_add0_go_in;
    logic do_add0_go_out;
    logic do_add0_done_in;
    logic do_add0_done_out;
    logic do_mul1_go_in;
    logic do_mul1_go_out;
    logic do_mul1_done_in;
    logic do_mul1_done_out;
    logic do_add1_go_in;
    logic do_add1_go_out;
    logic do_add1_done_in;
    logic do_add1_done_out;
    logic do_mul2_go_in;
    logic do_mul2_go_out;
    logic do_mul2_done_in;
    logic do_mul2_done_out;
    logic do_add2_go_in;
    logic do_add2_go_out;
    logic do_add2_done_in;
    logic do_add2_done_out;
    logic msp_go_in;
    logic msp_go_out;
    logic msp_done_in;
    logic msp_done_out;
    logic msp0_go_in;
    logic msp0_go_out;
    logic msp0_done_in;
    logic msp0_done_out;
    logic msp1_go_in;
    logic msp1_go_out;
    logic msp1_done_in;
    logic msp1_done_out;
    logic msp2_go_in;
    logic msp2_go_out;
    logic msp2_done_in;
    logic msp2_done_out;
    logic msp3_go_in;
    logic msp3_go_out;
    logic msp3_done_in;
    logic msp3_done_out;
    logic msp4_go_in;
    logic msp4_go_out;
    logic msp4_done_in;
    logic msp4_done_out;
    logic msp5_go_in;
    logic msp5_go_out;
    logic msp5_done_in;
    logic msp5_done_out;
    logic msp6_go_in;
    logic msp6_go_out;
    logic msp6_done_in;
    logic msp6_done_out;
    logic msp7_go_in;
    logic msp7_go_out;
    logic msp7_done_in;
    logic msp7_done_out;
    logic msp8_go_in;
    logic msp8_go_out;
    logic msp8_done_in;
    logic msp8_done_out;
    logic par_go_in;
    logic par_go_out;
    logic par_done_in;
    logic par_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    logic par0_go_in;
    logic par0_go_out;
    logic par0_done_in;
    logic par0_done_out;
    logic par1_go_in;
    logic par1_go_out;
    logic par1_done_in;
    logic par1_done_out;
    logic par2_go_in;
    logic par2_go_out;
    logic par2_done_in;
    logic par2_done_out;
    logic tdcc0_go_in;
    logic tdcc0_go_out;
    logic tdcc0_done_in;
    logic tdcc0_done_out;
    logic par3_go_in;
    logic par3_go_out;
    logic par3_done_in;
    logic par3_done_out;
    logic par4_go_in;
    logic par4_go_out;
    logic par4_done_in;
    logic par4_done_out;
    logic par5_go_in;
    logic par5_go_out;
    logic par5_done_in;
    logic par5_done_out;
    logic tdcc1_go_in;
    logic tdcc1_go_out;
    logic tdcc1_done_in;
    logic tdcc1_done_out;
    logic par6_go_in;
    logic par6_go_out;
    logic par6_done_in;
    logic par6_done_out;
    logic par7_go_in;
    logic par7_go_out;
    logic par7_done_in;
    logic par7_done_out;
    logic tdcc2_go_in;
    logic tdcc2_go_out;
    logic tdcc2_done_in;
    logic tdcc2_done_out;
    initial begin
        t0_idx_in = 2'd0;
        t0_idx_write_en = 1'd0;
        t0_idx_clk = 1'd0;
        t0_idx_reset = 1'd0;
        t0_add_left = 2'd0;
        t0_add_right = 2'd0;
        t1_idx_in = 2'd0;
        t1_idx_write_en = 1'd0;
        t1_idx_clk = 1'd0;
        t1_idx_reset = 1'd0;
        t1_add_left = 2'd0;
        t1_add_right = 2'd0;
        l0_idx_in = 2'd0;
        l0_idx_write_en = 1'd0;
        l0_idx_clk = 1'd0;
        l0_idx_reset = 1'd0;
        l0_add_left = 2'd0;
        l0_add_right = 2'd0;
        l1_idx_in = 2'd0;
        l1_idx_write_en = 1'd0;
        l1_idx_clk = 1'd0;
        l1_idx_reset = 1'd0;
        l1_add_left = 2'd0;
        l1_add_right = 2'd0;
        top_0_0_in = 32'd0;
        top_0_0_write_en = 1'd0;
        top_0_0_clk = 1'd0;
        top_0_0_reset = 1'd0;
        left_0_0_in = 32'd0;
        left_0_0_write_en = 1'd0;
        left_0_0_clk = 1'd0;
        left_0_0_reset = 1'd0;
        top_0_1_in = 32'd0;
        top_0_1_write_en = 1'd0;
        top_0_1_clk = 1'd0;
        top_0_1_reset = 1'd0;
        left_0_1_in = 32'd0;
        left_0_1_write_en = 1'd0;
        left_0_1_clk = 1'd0;
        left_0_1_reset = 1'd0;
        top_1_0_in = 32'd0;
        top_1_0_write_en = 1'd0;
        top_1_0_clk = 1'd0;
        top_1_0_reset = 1'd0;
        left_1_0_in = 32'd0;
        left_1_0_write_en = 1'd0;
        left_1_0_clk = 1'd0;
        left_1_0_reset = 1'd0;
        top_1_1_in = 32'd0;
        top_1_1_write_en = 1'd0;
        top_1_1_clk = 1'd0;
        top_1_1_reset = 1'd0;
        left_1_1_in = 32'd0;
        left_1_1_write_en = 1'd0;
        left_1_1_clk = 1'd0;
        left_1_1_reset = 1'd0;
        mul_out_in = 32'd0;
        mul_out_write_en = 1'd0;
        mul_out_clk = 1'd0;
        mul_out_reset = 1'd0;
        acc_in = 32'd0;
        acc_write_en = 1'd0;
        acc_clk = 1'd0;
        acc_reset = 1'd0;
        add_left = 32'd0;
        add_right = 32'd0;
        mult0_left = 32'd0;
        mult0_right = 32'd0;
        mul_out0_in = 32'd0;
        mul_out0_write_en = 1'd0;
        mul_out0_clk = 1'd0;
        mul_out0_reset = 1'd0;
        acc0_in = 32'd0;
        acc0_write_en = 1'd0;
        acc0_clk = 1'd0;
        acc0_reset = 1'd0;
        add0_left = 32'd0;
        add0_right = 32'd0;
        mult00_left = 32'd0;
        mult00_right = 32'd0;
        mul_out1_in = 32'd0;
        mul_out1_write_en = 1'd0;
        mul_out1_clk = 1'd0;
        mul_out1_reset = 1'd0;
        acc1_in = 32'd0;
        acc1_write_en = 1'd0;
        acc1_clk = 1'd0;
        acc1_reset = 1'd0;
        add1_left = 32'd0;
        add1_right = 32'd0;
        mult01_left = 32'd0;
        mult01_right = 32'd0;
        mul_out2_in = 32'd0;
        mul_out2_write_en = 1'd0;
        mul_out2_clk = 1'd0;
        mul_out2_reset = 1'd0;
        acc2_in = 32'd0;
        acc2_write_en = 1'd0;
        acc2_clk = 1'd0;
        acc2_reset = 1'd0;
        add2_left = 32'd0;
        add2_right = 32'd0;
        mult02_left = 32'd0;
        mult02_right = 32'd0;
        pd_in = 1'd0;
        pd_write_en = 1'd0;
        pd_clk = 1'd0;
        pd_reset = 1'd0;
        fsm_in = 2'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        pd0_in = 1'd0;
        pd0_write_en = 1'd0;
        pd0_clk = 1'd0;
        pd0_reset = 1'd0;
        pd1_in = 1'd0;
        pd1_write_en = 1'd0;
        pd1_clk = 1'd0;
        pd1_reset = 1'd0;
        pd2_in = 1'd0;
        pd2_write_en = 1'd0;
        pd2_clk = 1'd0;
        pd2_reset = 1'd0;
        pd3_in = 1'd0;
        pd3_write_en = 1'd0;
        pd3_clk = 1'd0;
        pd3_reset = 1'd0;
        pd4_in = 1'd0;
        pd4_write_en = 1'd0;
        pd4_clk = 1'd0;
        pd4_reset = 1'd0;
        pd5_in = 1'd0;
        pd5_write_en = 1'd0;
        pd5_clk = 1'd0;
        pd5_reset = 1'd0;
        pd6_in = 1'd0;
        pd6_write_en = 1'd0;
        pd6_clk = 1'd0;
        pd6_reset = 1'd0;
        pd7_in = 1'd0;
        pd7_write_en = 1'd0;
        pd7_clk = 1'd0;
        pd7_reset = 1'd0;
        fsm0_in = 2'd0;
        fsm0_write_en = 1'd0;
        fsm0_clk = 1'd0;
        fsm0_reset = 1'd0;
        pd8_in = 1'd0;
        pd8_write_en = 1'd0;
        pd8_clk = 1'd0;
        pd8_reset = 1'd0;
        pd9_in = 1'd0;
        pd9_write_en = 1'd0;
        pd9_clk = 1'd0;
        pd9_reset = 1'd0;
        pd10_in = 1'd0;
        pd10_write_en = 1'd0;
        pd10_clk = 1'd0;
        pd10_reset = 1'd0;
        pd11_in = 1'd0;
        pd11_write_en = 1'd0;
        pd11_clk = 1'd0;
        pd11_reset = 1'd0;
        pd12_in = 1'd0;
        pd12_write_en = 1'd0;
        pd12_clk = 1'd0;
        pd12_reset = 1'd0;
        pd13_in = 1'd0;
        pd13_write_en = 1'd0;
        pd13_clk = 1'd0;
        pd13_reset = 1'd0;
        pd14_in = 1'd0;
        pd14_write_en = 1'd0;
        pd14_clk = 1'd0;
        pd14_reset = 1'd0;
        pd15_in = 1'd0;
        pd15_write_en = 1'd0;
        pd15_clk = 1'd0;
        pd15_reset = 1'd0;
        pd16_in = 1'd0;
        pd16_write_en = 1'd0;
        pd16_clk = 1'd0;
        pd16_reset = 1'd0;
        pd17_in = 1'd0;
        pd17_write_en = 1'd0;
        pd17_clk = 1'd0;
        pd17_reset = 1'd0;
        fsm1_in = 2'd0;
        fsm1_write_en = 1'd0;
        fsm1_clk = 1'd0;
        fsm1_reset = 1'd0;
        pd18_in = 1'd0;
        pd18_write_en = 1'd0;
        pd18_clk = 1'd0;
        pd18_reset = 1'd0;
        pd19_in = 1'd0;
        pd19_write_en = 1'd0;
        pd19_clk = 1'd0;
        pd19_reset = 1'd0;
        pd20_in = 1'd0;
        pd20_write_en = 1'd0;
        pd20_clk = 1'd0;
        pd20_reset = 1'd0;
        pd21_in = 1'd0;
        pd21_write_en = 1'd0;
        pd21_clk = 1'd0;
        pd21_reset = 1'd0;
        pd22_in = 1'd0;
        pd22_write_en = 1'd0;
        pd22_clk = 1'd0;
        pd22_reset = 1'd0;
        pd23_in = 1'd0;
        pd23_write_en = 1'd0;
        pd23_clk = 1'd0;
        pd23_reset = 1'd0;
        pd24_in = 1'd0;
        pd24_write_en = 1'd0;
        pd24_clk = 1'd0;
        pd24_reset = 1'd0;
        fsm2_in = 5'd0;
        fsm2_write_en = 1'd0;
        fsm2_clk = 1'd0;
        fsm2_reset = 1'd0;
        pe_0_0_out_write_go_in = 1'd0;
        pe_0_0_out_write_done_in = 1'd0;
        pe_0_1_out_write_go_in = 1'd0;
        pe_0_1_out_write_done_in = 1'd0;
        pe_1_0_out_write_go_in = 1'd0;
        pe_1_0_out_write_done_in = 1'd0;
        pe_1_1_out_write_go_in = 1'd0;
        pe_1_1_out_write_done_in = 1'd0;
        do_mul_go_in = 1'd0;
        do_mul_done_in = 1'd0;
        do_add_go_in = 1'd0;
        do_add_done_in = 1'd0;
        do_mul0_go_in = 1'd0;
        do_mul0_done_in = 1'd0;
        do_add0_go_in = 1'd0;
        do_add0_done_in = 1'd0;
        do_mul1_go_in = 1'd0;
        do_mul1_done_in = 1'd0;
        do_add1_go_in = 1'd0;
        do_add1_done_in = 1'd0;
        do_mul2_go_in = 1'd0;
        do_mul2_done_in = 1'd0;
        do_add2_go_in = 1'd0;
        do_add2_done_in = 1'd0;
        msp_go_in = 1'd0;
        msp_done_in = 1'd0;
        msp0_go_in = 1'd0;
        msp0_done_in = 1'd0;
        msp1_go_in = 1'd0;
        msp1_done_in = 1'd0;
        msp2_go_in = 1'd0;
        msp2_done_in = 1'd0;
        msp3_go_in = 1'd0;
        msp3_done_in = 1'd0;
        msp4_go_in = 1'd0;
        msp4_done_in = 1'd0;
        msp5_go_in = 1'd0;
        msp5_done_in = 1'd0;
        msp6_go_in = 1'd0;
        msp6_done_in = 1'd0;
        msp7_go_in = 1'd0;
        msp7_done_in = 1'd0;
        msp8_go_in = 1'd0;
        msp8_done_in = 1'd0;
        par_go_in = 1'd0;
        par_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
        par0_go_in = 1'd0;
        par0_done_in = 1'd0;
        par1_go_in = 1'd0;
        par1_done_in = 1'd0;
        par2_go_in = 1'd0;
        par2_done_in = 1'd0;
        tdcc0_go_in = 1'd0;
        tdcc0_done_in = 1'd0;
        par3_go_in = 1'd0;
        par3_done_in = 1'd0;
        par4_go_in = 1'd0;
        par4_done_in = 1'd0;
        par5_go_in = 1'd0;
        par5_done_in = 1'd0;
        tdcc1_go_in = 1'd0;
        tdcc1_done_in = 1'd0;
        par6_go_in = 1'd0;
        par6_done_in = 1'd0;
        par7_go_in = 1'd0;
        par7_done_in = 1'd0;
        tdcc2_go_in = 1'd0;
        tdcc2_done_in = 1'd0;
    end
    std_reg # (
        .WIDTH(2)
    ) t0_idx (
        .clk(t0_idx_clk),
        .done(t0_idx_done),
        .in(t0_idx_in),
        .out(t0_idx_out),
        .reset(t0_idx_reset),
        .write_en(t0_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) t0_add (
        .left(t0_add_left),
        .out(t0_add_out),
        .right(t0_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) t1_idx (
        .clk(t1_idx_clk),
        .done(t1_idx_done),
        .in(t1_idx_in),
        .out(t1_idx_out),
        .reset(t1_idx_reset),
        .write_en(t1_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) t1_add (
        .left(t1_add_left),
        .out(t1_add_out),
        .right(t1_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) l0_idx (
        .clk(l0_idx_clk),
        .done(l0_idx_done),
        .in(l0_idx_in),
        .out(l0_idx_out),
        .reset(l0_idx_reset),
        .write_en(l0_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) l0_add (
        .left(l0_add_left),
        .out(l0_add_out),
        .right(l0_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) l1_idx (
        .clk(l1_idx_clk),
        .done(l1_idx_done),
        .in(l1_idx_in),
        .out(l1_idx_out),
        .reset(l1_idx_reset),
        .write_en(l1_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) l1_add (
        .left(l1_add_left),
        .out(l1_add_out),
        .right(l1_add_right)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_0 (
        .clk(top_0_0_clk),
        .done(top_0_0_done),
        .in(top_0_0_in),
        .out(top_0_0_out),
        .reset(top_0_0_reset),
        .write_en(top_0_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_0 (
        .clk(left_0_0_clk),
        .done(left_0_0_done),
        .in(left_0_0_in),
        .out(left_0_0_out),
        .reset(left_0_0_reset),
        .write_en(left_0_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_1 (
        .clk(top_0_1_clk),
        .done(top_0_1_done),
        .in(top_0_1_in),
        .out(top_0_1_out),
        .reset(top_0_1_reset),
        .write_en(top_0_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_1 (
        .clk(left_0_1_clk),
        .done(left_0_1_done),
        .in(left_0_1_in),
        .out(left_0_1_out),
        .reset(left_0_1_reset),
        .write_en(left_0_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_0 (
        .clk(top_1_0_clk),
        .done(top_1_0_done),
        .in(top_1_0_in),
        .out(top_1_0_out),
        .reset(top_1_0_reset),
        .write_en(top_1_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_0 (
        .clk(left_1_0_clk),
        .done(left_1_0_done),
        .in(left_1_0_in),
        .out(left_1_0_out),
        .reset(left_1_0_reset),
        .write_en(left_1_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_1 (
        .clk(top_1_1_clk),
        .done(top_1_1_done),
        .in(top_1_1_in),
        .out(top_1_1_out),
        .reset(top_1_1_reset),
        .write_en(top_1_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_1 (
        .clk(left_1_1_clk),
        .done(left_1_1_done),
        .in(left_1_1_in),
        .out(left_1_1_out),
        .reset(left_1_1_reset),
        .write_en(left_1_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) mul_out (
        .clk(mul_out_clk),
        .done(mul_out_done),
        .in(mul_out_in),
        .out(mul_out_out),
        .reset(mul_out_reset),
        .write_en(mul_out_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) acc (
        .clk(acc_clk),
        .done(acc_done),
        .in(acc_in),
        .out(acc_out),
        .reset(acc_reset),
        .write_en(acc_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add (
        .left(add_left),
        .out(add_out),
        .right(add_right)
    );
    std_unsyn_mult # (
        .WIDTH(32)
    ) mult0 (
        .left(mult0_left),
        .out(mult0_out),
        .right(mult0_right)
    );
    std_reg # (
        .WIDTH(32)
    ) mul_out0 (
        .clk(mul_out0_clk),
        .done(mul_out0_done),
        .in(mul_out0_in),
        .out(mul_out0_out),
        .reset(mul_out0_reset),
        .write_en(mul_out0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) acc0 (
        .clk(acc0_clk),
        .done(acc0_done),
        .in(acc0_in),
        .out(acc0_out),
        .reset(acc0_reset),
        .write_en(acc0_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add0 (
        .left(add0_left),
        .out(add0_out),
        .right(add0_right)
    );
    std_unsyn_mult # (
        .WIDTH(32)
    ) mult00 (
        .left(mult00_left),
        .out(mult00_out),
        .right(mult00_right)
    );
    std_reg # (
        .WIDTH(32)
    ) mul_out1 (
        .clk(mul_out1_clk),
        .done(mul_out1_done),
        .in(mul_out1_in),
        .out(mul_out1_out),
        .reset(mul_out1_reset),
        .write_en(mul_out1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) acc1 (
        .clk(acc1_clk),
        .done(acc1_done),
        .in(acc1_in),
        .out(acc1_out),
        .reset(acc1_reset),
        .write_en(acc1_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add1 (
        .left(add1_left),
        .out(add1_out),
        .right(add1_right)
    );
    std_unsyn_mult # (
        .WIDTH(32)
    ) mult01 (
        .left(mult01_left),
        .out(mult01_out),
        .right(mult01_right)
    );
    std_reg # (
        .WIDTH(32)
    ) mul_out2 (
        .clk(mul_out2_clk),
        .done(mul_out2_done),
        .in(mul_out2_in),
        .out(mul_out2_out),
        .reset(mul_out2_reset),
        .write_en(mul_out2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) acc2 (
        .clk(acc2_clk),
        .done(acc2_done),
        .in(acc2_in),
        .out(acc2_out),
        .reset(acc2_reset),
        .write_en(acc2_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add2 (
        .left(add2_left),
        .out(add2_out),
        .right(add2_right)
    );
    std_unsyn_mult # (
        .WIDTH(32)
    ) mult02 (
        .left(mult02_left),
        .out(mult02_out),
        .right(mult02_right)
    );
    std_reg # (
        .WIDTH(1)
    ) pd (
        .clk(pd_clk),
        .done(pd_done),
        .in(pd_in),
        .out(pd_out),
        .reset(pd_reset),
        .write_en(pd_write_en)
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
    std_reg # (
        .WIDTH(1)
    ) pd0 (
        .clk(pd0_clk),
        .done(pd0_done),
        .in(pd0_in),
        .out(pd0_out),
        .reset(pd0_reset),
        .write_en(pd0_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd1 (
        .clk(pd1_clk),
        .done(pd1_done),
        .in(pd1_in),
        .out(pd1_out),
        .reset(pd1_reset),
        .write_en(pd1_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd2 (
        .clk(pd2_clk),
        .done(pd2_done),
        .in(pd2_in),
        .out(pd2_out),
        .reset(pd2_reset),
        .write_en(pd2_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd3 (
        .clk(pd3_clk),
        .done(pd3_done),
        .in(pd3_in),
        .out(pd3_out),
        .reset(pd3_reset),
        .write_en(pd3_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd4 (
        .clk(pd4_clk),
        .done(pd4_done),
        .in(pd4_in),
        .out(pd4_out),
        .reset(pd4_reset),
        .write_en(pd4_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd5 (
        .clk(pd5_clk),
        .done(pd5_done),
        .in(pd5_in),
        .out(pd5_out),
        .reset(pd5_reset),
        .write_en(pd5_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd6 (
        .clk(pd6_clk),
        .done(pd6_done),
        .in(pd6_in),
        .out(pd6_out),
        .reset(pd6_reset),
        .write_en(pd6_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd7 (
        .clk(pd7_clk),
        .done(pd7_done),
        .in(pd7_in),
        .out(pd7_out),
        .reset(pd7_reset),
        .write_en(pd7_write_en)
    );
    std_reg # (
        .WIDTH(2)
    ) fsm0 (
        .clk(fsm0_clk),
        .done(fsm0_done),
        .in(fsm0_in),
        .out(fsm0_out),
        .reset(fsm0_reset),
        .write_en(fsm0_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd8 (
        .clk(pd8_clk),
        .done(pd8_done),
        .in(pd8_in),
        .out(pd8_out),
        .reset(pd8_reset),
        .write_en(pd8_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd9 (
        .clk(pd9_clk),
        .done(pd9_done),
        .in(pd9_in),
        .out(pd9_out),
        .reset(pd9_reset),
        .write_en(pd9_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd10 (
        .clk(pd10_clk),
        .done(pd10_done),
        .in(pd10_in),
        .out(pd10_out),
        .reset(pd10_reset),
        .write_en(pd10_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd11 (
        .clk(pd11_clk),
        .done(pd11_done),
        .in(pd11_in),
        .out(pd11_out),
        .reset(pd11_reset),
        .write_en(pd11_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd12 (
        .clk(pd12_clk),
        .done(pd12_done),
        .in(pd12_in),
        .out(pd12_out),
        .reset(pd12_reset),
        .write_en(pd12_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd13 (
        .clk(pd13_clk),
        .done(pd13_done),
        .in(pd13_in),
        .out(pd13_out),
        .reset(pd13_reset),
        .write_en(pd13_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd14 (
        .clk(pd14_clk),
        .done(pd14_done),
        .in(pd14_in),
        .out(pd14_out),
        .reset(pd14_reset),
        .write_en(pd14_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd15 (
        .clk(pd15_clk),
        .done(pd15_done),
        .in(pd15_in),
        .out(pd15_out),
        .reset(pd15_reset),
        .write_en(pd15_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd16 (
        .clk(pd16_clk),
        .done(pd16_done),
        .in(pd16_in),
        .out(pd16_out),
        .reset(pd16_reset),
        .write_en(pd16_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd17 (
        .clk(pd17_clk),
        .done(pd17_done),
        .in(pd17_in),
        .out(pd17_out),
        .reset(pd17_reset),
        .write_en(pd17_write_en)
    );
    std_reg # (
        .WIDTH(2)
    ) fsm1 (
        .clk(fsm1_clk),
        .done(fsm1_done),
        .in(fsm1_in),
        .out(fsm1_out),
        .reset(fsm1_reset),
        .write_en(fsm1_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd18 (
        .clk(pd18_clk),
        .done(pd18_done),
        .in(pd18_in),
        .out(pd18_out),
        .reset(pd18_reset),
        .write_en(pd18_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd19 (
        .clk(pd19_clk),
        .done(pd19_done),
        .in(pd19_in),
        .out(pd19_out),
        .reset(pd19_reset),
        .write_en(pd19_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd20 (
        .clk(pd20_clk),
        .done(pd20_done),
        .in(pd20_in),
        .out(pd20_out),
        .reset(pd20_reset),
        .write_en(pd20_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd21 (
        .clk(pd21_clk),
        .done(pd21_done),
        .in(pd21_in),
        .out(pd21_out),
        .reset(pd21_reset),
        .write_en(pd21_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd22 (
        .clk(pd22_clk),
        .done(pd22_done),
        .in(pd22_in),
        .out(pd22_out),
        .reset(pd22_reset),
        .write_en(pd22_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd23 (
        .clk(pd23_clk),
        .done(pd23_done),
        .in(pd23_in),
        .out(pd23_out),
        .reset(pd23_reset),
        .write_en(pd23_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) pd24 (
        .clk(pd24_clk),
        .done(pd24_done),
        .in(pd24_in),
        .out(pd24_out),
        .reset(pd24_reset),
        .write_en(pd24_write_en)
    );
    std_reg # (
        .WIDTH(5)
    ) fsm2 (
        .clk(fsm2_clk),
        .done(fsm2_done),
        .in(fsm2_in),
        .out(fsm2_out),
        .reset(fsm2_reset),
        .write_en(fsm2_write_en)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_0_0_out_write_go (
        .in(pe_0_0_out_write_go_in),
        .out(pe_0_0_out_write_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_0_0_out_write_done (
        .in(pe_0_0_out_write_done_in),
        .out(pe_0_0_out_write_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_0_1_out_write_go (
        .in(pe_0_1_out_write_go_in),
        .out(pe_0_1_out_write_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_0_1_out_write_done (
        .in(pe_0_1_out_write_done_in),
        .out(pe_0_1_out_write_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_1_0_out_write_go (
        .in(pe_1_0_out_write_go_in),
        .out(pe_1_0_out_write_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_1_0_out_write_done (
        .in(pe_1_0_out_write_done_in),
        .out(pe_1_0_out_write_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_1_1_out_write_go (
        .in(pe_1_1_out_write_go_in),
        .out(pe_1_1_out_write_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) pe_1_1_out_write_done (
        .in(pe_1_1_out_write_done_in),
        .out(pe_1_1_out_write_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul_go (
        .in(do_mul_go_in),
        .out(do_mul_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul_done (
        .in(do_mul_done_in),
        .out(do_mul_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add_go (
        .in(do_add_go_in),
        .out(do_add_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add_done (
        .in(do_add_done_in),
        .out(do_add_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul0_go (
        .in(do_mul0_go_in),
        .out(do_mul0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul0_done (
        .in(do_mul0_done_in),
        .out(do_mul0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add0_go (
        .in(do_add0_go_in),
        .out(do_add0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add0_done (
        .in(do_add0_done_in),
        .out(do_add0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul1_go (
        .in(do_mul1_go_in),
        .out(do_mul1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul1_done (
        .in(do_mul1_done_in),
        .out(do_mul1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add1_go (
        .in(do_add1_go_in),
        .out(do_add1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add1_done (
        .in(do_add1_done_in),
        .out(do_add1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul2_go (
        .in(do_mul2_go_in),
        .out(do_mul2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul2_done (
        .in(do_mul2_done_in),
        .out(do_mul2_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add2_go (
        .in(do_add2_go_in),
        .out(do_add2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add2_done (
        .in(do_add2_done_in),
        .out(do_add2_done_out)
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
    ) msp0_go (
        .in(msp0_go_in),
        .out(msp0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp0_done (
        .in(msp0_done_in),
        .out(msp0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp1_go (
        .in(msp1_go_in),
        .out(msp1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp1_done (
        .in(msp1_done_in),
        .out(msp1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp2_go (
        .in(msp2_go_in),
        .out(msp2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp2_done (
        .in(msp2_done_in),
        .out(msp2_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp3_go (
        .in(msp3_go_in),
        .out(msp3_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp3_done (
        .in(msp3_done_in),
        .out(msp3_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp4_go (
        .in(msp4_go_in),
        .out(msp4_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp4_done (
        .in(msp4_done_in),
        .out(msp4_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp5_go (
        .in(msp5_go_in),
        .out(msp5_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp5_done (
        .in(msp5_done_in),
        .out(msp5_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp6_go (
        .in(msp6_go_in),
        .out(msp6_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp6_done (
        .in(msp6_done_in),
        .out(msp6_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp7_go (
        .in(msp7_go_in),
        .out(msp7_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp7_done (
        .in(msp7_done_in),
        .out(msp7_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp8_go (
        .in(msp8_go_in),
        .out(msp8_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) msp8_done (
        .in(msp8_done_in),
        .out(msp8_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par_go (
        .in(par_go_in),
        .out(par_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par_done (
        .in(par_done_in),
        .out(par_done_out)
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
    std_wire # (
        .WIDTH(1)
    ) par0_go (
        .in(par0_go_in),
        .out(par0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par0_done (
        .in(par0_done_in),
        .out(par0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par1_go (
        .in(par1_go_in),
        .out(par1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par1_done (
        .in(par1_done_in),
        .out(par1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par2_go (
        .in(par2_go_in),
        .out(par2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par2_done (
        .in(par2_done_in),
        .out(par2_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc0_go (
        .in(tdcc0_go_in),
        .out(tdcc0_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc0_done (
        .in(tdcc0_done_in),
        .out(tdcc0_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par3_go (
        .in(par3_go_in),
        .out(par3_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par3_done (
        .in(par3_done_in),
        .out(par3_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par4_go (
        .in(par4_go_in),
        .out(par4_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par4_done (
        .in(par4_done_in),
        .out(par4_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par5_go (
        .in(par5_go_in),
        .out(par5_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par5_done (
        .in(par5_done_in),
        .out(par5_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc1_go (
        .in(tdcc1_go_in),
        .out(tdcc1_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc1_done (
        .in(tdcc1_done_in),
        .out(tdcc1_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par6_go (
        .in(par6_go_in),
        .out(par6_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par6_done (
        .in(par6_done_in),
        .out(par6_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par7_go (
        .in(par7_go_in),
        .out(par7_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) par7_done (
        .in(par7_done_in),
        .out(par7_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc2_go (
        .in(tdcc2_go_in),
        .out(tdcc2_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) tdcc2_done (
        .in(tdcc2_done_in),
        .out(tdcc2_done_out)
    );
    assign done = tdcc2_done_out;
    assign l0_addr0 =
     msp1_go_out | msp3_go_out | msp5_go_out ? l0_idx_out : 2'd0;
    assign l0_clk = clk;
    assign l1_addr0 =
     msp3_go_out | msp5_go_out | msp7_go_out ? l1_idx_out : 2'd0;
    assign l1_clk = clk;
    assign out_mem_addr0 =
     pe_0_0_out_write_go_out ? 3'd0 :
     pe_0_1_out_write_go_out ? 3'd1 :
     pe_1_0_out_write_go_out ? 3'd2 :
     pe_1_1_out_write_go_out ? 3'd3 : 3'd0;
    assign out_mem_clk = clk;
    assign out_mem_write_data =
     pe_1_0_out_write_go_out ? acc_out :
     pe_1_1_out_write_go_out ? acc0_out :
     pe_0_1_out_write_go_out ? acc1_out :
     pe_0_0_out_write_go_out ? acc2_out : 32'd0;
    assign out_mem_write_en = pe_0_0_out_write_go_out | pe_0_1_out_write_go_out | pe_1_0_out_write_go_out | pe_1_1_out_write_go_out;
    assign t0_addr0 =
     msp1_go_out | msp3_go_out | msp5_go_out ? t0_idx_out : 2'd0;
    assign t0_clk = clk;
    assign t1_addr0 =
     msp3_go_out | msp5_go_out | msp7_go_out ? t1_idx_out : 2'd0;
    assign t1_clk = clk;
    assign acc_clk = clk;
    assign acc_in =
     do_add_go_out ? add_out : 32'd0;
    assign acc_reset = reset;
    assign acc_write_en = do_add_go_out;
    assign acc0_clk = clk;
    assign acc0_in =
     do_add0_go_out ? add0_out : 32'd0;
    assign acc0_reset = reset;
    assign acc0_write_en = do_add0_go_out;
    assign acc1_clk = clk;
    assign acc1_in =
     do_add1_go_out ? add1_out : 32'd0;
    assign acc1_reset = reset;
    assign acc1_write_en = do_add1_go_out;
    assign acc2_clk = clk;
    assign acc2_in =
     do_add2_go_out ? add2_out : 32'd0;
    assign acc2_reset = reset;
    assign acc2_write_en = do_add2_go_out;
    assign add_left =
     do_add_go_out ? acc_out : 32'd0;
    assign add_right =
     do_add_go_out ? mul_out_out : 32'd0;
    assign add0_left =
     do_add0_go_out ? acc0_out : 32'd0;
    assign add0_right =
     do_add0_go_out ? mul_out0_out : 32'd0;
    assign add1_left =
     do_add1_go_out ? acc1_out : 32'd0;
    assign add1_right =
     do_add1_go_out ? mul_out1_out : 32'd0;
    assign add2_left =
     do_add2_go_out ? acc2_out : 32'd0;
    assign add2_right =
     do_add2_go_out ? mul_out2_out : 32'd0;
    assign do_add0_done_in = acc0_done;
    assign do_add0_go_in = ~(pd15_out | do_add0_done_out) & par4_go_out | ~(pd23_out | do_add0_done_out) & par7_go_out | ~do_add0_done_out & fsm2_out == 5'd13 & tdcc2_go_out;
    assign do_add1_done_in = acc1_done;
    assign do_add1_go_in = ~(pd4_out | do_add1_done_out) & par1_go_out | ~(pd13_out | do_add1_done_out) & par4_go_out | ~(pd24_out | do_add1_done_out) & par7_go_out;
    assign do_add2_done_in = acc2_done;
    assign do_add2_go_in = ~do_add2_done_out & fsm_out == 2'd1 & tdcc_go_out | ~(pd6_out | do_add2_done_out) & par1_go_out | ~(pd16_out | do_add2_done_out) & par4_go_out;
    assign do_add_done_in = acc_done;
    assign do_add_go_in = ~(pd5_out | do_add_done_out) & par1_go_out | ~(pd14_out | do_add_done_out) & par4_go_out | ~(pd22_out | do_add_done_out) & par7_go_out;
    assign do_mul0_done_in = mul_out0_done;
    assign do_mul0_go_in = ~(pd11_out | do_mul0_done_out) & par3_go_out | ~(pd20_out | do_mul0_done_out) & par6_go_out | ~do_mul0_done_out & fsm2_out == 5'd12 & tdcc2_go_out;
    assign do_mul1_done_in = mul_out1_done;
    assign do_mul1_go_in = ~(pd1_out | do_mul1_done_out) & par0_go_out | ~(pd9_out | do_mul1_done_out) & par3_go_out | ~(pd21_out | do_mul1_done_out) & par6_go_out;
    assign do_mul2_done_in = mul_out2_done;
    assign do_mul2_go_in = ~do_mul2_done_out & fsm_out == 2'd0 & tdcc_go_out | ~(pd3_out | do_mul2_done_out) & par0_go_out | ~(pd12_out | do_mul2_done_out) & par3_go_out;
    assign do_mul_done_in = mul_out_done;
    assign do_mul_go_in = ~(pd2_out | do_mul_done_out) & par0_go_out | ~(pd10_out | do_mul_done_out) & par3_go_out | ~(pd19_out | do_mul_done_out) & par6_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 2'd2 ? 2'd0 :
     fsm_out == 2'd0 & do_mul2_done_out & tdcc_go_out ? 2'd1 :
     fsm_out == 2'd1 & do_add2_done_out & tdcc_go_out ? 2'd2 : 2'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 2'd2 | fsm_out == 2'd0 & do_mul2_done_out & tdcc_go_out | fsm_out == 2'd1 & do_add2_done_out & tdcc_go_out;
    assign fsm0_clk = clk;
    assign fsm0_in =
     fsm0_out == 2'd2 ? 2'd0 :
     fsm0_out == 2'd0 & par0_done_out & tdcc0_go_out ? 2'd1 :
     fsm0_out == 2'd1 & par1_done_out & tdcc0_go_out ? 2'd2 : 2'd0;
    assign fsm0_reset = reset;
    assign fsm0_write_en = fsm0_out == 2'd2 | fsm0_out == 2'd0 & par0_done_out & tdcc0_go_out | fsm0_out == 2'd1 & par1_done_out & tdcc0_go_out;
    assign fsm1_clk = clk;
    assign fsm1_in =
     fsm1_out == 2'd2 ? 2'd0 :
     fsm1_out == 2'd0 & par3_done_out & tdcc1_go_out ? 2'd1 :
     fsm1_out == 2'd1 & par4_done_out & tdcc1_go_out ? 2'd2 : 2'd0;
    assign fsm1_reset = reset;
    assign fsm1_write_en = fsm1_out == 2'd2 | fsm1_out == 2'd0 & par3_done_out & tdcc1_go_out | fsm1_out == 2'd1 & par4_done_out & tdcc1_go_out;
    assign fsm2_clk = clk;
    assign fsm2_in =
     fsm2_out == 5'd18 ? 5'd0 :
     fsm2_out == 5'd9 & par6_done_out & tdcc2_go_out ? 5'd10 :
     fsm2_out == 5'd10 & par7_done_out & tdcc2_go_out ? 5'd11 :
     fsm2_out == 5'd11 & msp8_done_out & tdcc2_go_out ? 5'd12 :
     fsm2_out == 5'd12 & do_mul0_done_out & tdcc2_go_out ? 5'd13 :
     fsm2_out == 5'd13 & do_add0_done_out & tdcc2_go_out ? 5'd14 :
     fsm2_out == 5'd14 & pe_0_0_out_write_done_out & tdcc2_go_out ? 5'd15 :
     fsm2_out == 5'd15 & pe_0_1_out_write_done_out & tdcc2_go_out ? 5'd16 :
     fsm2_out == 5'd16 & pe_1_0_out_write_done_out & tdcc2_go_out ? 5'd17 :
     fsm2_out == 5'd17 & pe_1_1_out_write_done_out & tdcc2_go_out ? 5'd18 :
     fsm2_out == 5'd0 & msp_done_out & tdcc2_go_out ? 5'd1 :
     fsm2_out == 5'd1 & msp0_done_out & tdcc2_go_out ? 5'd2 :
     fsm2_out == 5'd2 & msp1_done_out & tdcc2_go_out ? 5'd3 :
     fsm2_out == 5'd3 & par_done_out & tdcc2_go_out ? 5'd4 :
     fsm2_out == 5'd4 & msp3_done_out & tdcc2_go_out ? 5'd5 :
     fsm2_out == 5'd5 & par2_done_out & tdcc2_go_out ? 5'd6 :
     fsm2_out == 5'd6 & msp5_done_out & tdcc2_go_out ? 5'd7 :
     fsm2_out == 5'd7 & par5_done_out & tdcc2_go_out ? 5'd8 :
     fsm2_out == 5'd8 & msp7_done_out & tdcc2_go_out ? 5'd9 : 5'd0;
    assign fsm2_reset = reset;
    assign fsm2_write_en = fsm2_out == 5'd18 | fsm2_out == 5'd0 & msp_done_out & tdcc2_go_out | fsm2_out == 5'd1 & msp0_done_out & tdcc2_go_out | fsm2_out == 5'd2 & msp1_done_out & tdcc2_go_out | fsm2_out == 5'd3 & par_done_out & tdcc2_go_out | fsm2_out == 5'd4 & msp3_done_out & tdcc2_go_out | fsm2_out == 5'd5 & par2_done_out & tdcc2_go_out | fsm2_out == 5'd6 & msp5_done_out & tdcc2_go_out | fsm2_out == 5'd7 & par5_done_out & tdcc2_go_out | fsm2_out == 5'd8 & msp7_done_out & tdcc2_go_out | fsm2_out == 5'd9 & par6_done_out & tdcc2_go_out | fsm2_out == 5'd10 & par7_done_out & tdcc2_go_out | fsm2_out == 5'd11 & msp8_done_out & tdcc2_go_out | fsm2_out == 5'd12 & do_mul0_done_out & tdcc2_go_out | fsm2_out == 5'd13 & do_add0_done_out & tdcc2_go_out | fsm2_out == 5'd14 & pe_0_0_out_write_done_out & tdcc2_go_out | fsm2_out == 5'd15 & pe_0_1_out_write_done_out & tdcc2_go_out | fsm2_out == 5'd16 & pe_1_0_out_write_done_out & tdcc2_go_out | fsm2_out == 5'd17 & pe_1_1_out_write_done_out & tdcc2_go_out;
    assign l0_add_left =
     msp0_go_out | msp2_go_out | msp4_go_out ? 2'd1 : 2'd0;
    assign l0_add_right =
     msp0_go_out | msp2_go_out | msp4_go_out ? l0_idx_out : 2'd0;
    assign l0_idx_clk = clk;
    assign l0_idx_in =
     msp_go_out ? 2'd3 :
     msp0_go_out | msp2_go_out | msp4_go_out ? l0_add_out : 2'd0;
    assign l0_idx_reset = reset;
    assign l0_idx_write_en = msp_go_out | msp0_go_out | msp2_go_out | msp4_go_out;
    assign l1_add_left =
     msp2_go_out | msp4_go_out | msp6_go_out ? 2'd1 : 2'd0;
    assign l1_add_right =
     msp2_go_out | msp4_go_out | msp6_go_out ? l1_idx_out : 2'd0;
    assign l1_idx_clk = clk;
    assign l1_idx_in =
     msp_go_out ? 2'd3 :
     msp2_go_out | msp4_go_out | msp6_go_out ? l1_add_out : 2'd0;
    assign l1_idx_reset = reset;
    assign l1_idx_write_en = msp_go_out | msp2_go_out | msp4_go_out | msp6_go_out;
    assign left_0_0_clk = clk;
    assign left_0_0_in =
     msp1_go_out | msp3_go_out | msp5_go_out ? l0_read_data : 32'd0;
    assign left_0_0_reset = reset;
    assign left_0_0_write_en = msp1_go_out | msp3_go_out | msp5_go_out;
    assign left_0_1_clk = clk;
    assign left_0_1_in =
     msp3_go_out | msp5_go_out | msp7_go_out ? left_0_0_out : 32'd0;
    assign left_0_1_reset = reset;
    assign left_0_1_write_en = msp3_go_out | msp5_go_out | msp7_go_out;
    assign left_1_0_clk = clk;
    assign left_1_0_in =
     msp3_go_out | msp5_go_out | msp7_go_out ? l1_read_data : 32'd0;
    assign left_1_0_reset = reset;
    assign left_1_0_write_en = msp3_go_out | msp5_go_out | msp7_go_out;
    assign left_1_1_clk = clk;
    assign left_1_1_in =
     msp5_go_out | msp7_go_out | msp8_go_out ? left_1_0_out : 32'd0;
    assign left_1_1_reset = reset;
    assign left_1_1_write_en = msp5_go_out | msp7_go_out | msp8_go_out;
    assign msp0_done_in = t0_idx_done & l0_idx_done;
    assign msp0_go_in = ~msp0_done_out & fsm2_out == 5'd1 & tdcc2_go_out;
    assign msp1_done_in = top_0_0_done & left_0_0_done;
    assign msp1_go_in = ~msp1_done_out & fsm2_out == 5'd2 & tdcc2_go_out;
    assign msp2_done_in = t0_idx_done & l0_idx_done & t1_idx_done & l1_idx_done;
    assign msp2_go_in = ~(pd_out | msp2_done_out) & par_go_out;
    assign msp3_done_in = top_0_0_done & top_0_1_done & top_1_0_done & left_0_0_done & left_0_1_done & left_1_0_done;
    assign msp3_go_in = ~msp3_done_out & fsm2_out == 5'd4 & tdcc2_go_out;
    assign msp4_done_in = t0_idx_done & l0_idx_done & t1_idx_done & l1_idx_done;
    assign msp4_go_in = ~(pd7_out | msp4_done_out) & par2_go_out;
    assign msp5_done_in = top_0_0_done & top_0_1_done & top_1_0_done & top_1_1_done & left_0_0_done & left_0_1_done & left_1_0_done & left_1_1_done;
    assign msp5_go_in = ~msp5_done_out & fsm2_out == 5'd6 & tdcc2_go_out;
    assign msp6_done_in = t1_idx_done & l1_idx_done;
    assign msp6_go_in = ~(pd17_out | msp6_done_out) & par5_go_out;
    assign msp7_done_in = top_0_1_done & top_1_0_done & top_1_1_done & left_0_1_done & left_1_0_done & left_1_1_done;
    assign msp7_go_in = ~msp7_done_out & fsm2_out == 5'd8 & tdcc2_go_out;
    assign msp8_done_in = top_1_1_done & left_1_1_done;
    assign msp8_go_in = ~msp8_done_out & fsm2_out == 5'd11 & tdcc2_go_out;
    assign msp_done_in = t0_idx_done & t1_idx_done & l0_idx_done & l1_idx_done;
    assign msp_go_in = ~msp_done_out & fsm2_out == 5'd0 & tdcc2_go_out;
    assign mul_out_clk = clk;
    assign mul_out_in =
     do_mul_go_out ? mult0_out : 32'd0;
    assign mul_out_reset = reset;
    assign mul_out_write_en = do_mul_go_out;
    assign mul_out0_clk = clk;
    assign mul_out0_in =
     do_mul0_go_out ? mult00_out : 32'd0;
    assign mul_out0_reset = reset;
    assign mul_out0_write_en = do_mul0_go_out;
    assign mul_out1_clk = clk;
    assign mul_out1_in =
     do_mul1_go_out ? mult01_out : 32'd0;
    assign mul_out1_reset = reset;
    assign mul_out1_write_en = do_mul1_go_out;
    assign mul_out2_clk = clk;
    assign mul_out2_in =
     do_mul2_go_out ? mult02_out : 32'd0;
    assign mul_out2_reset = reset;
    assign mul_out2_write_en = do_mul2_go_out;
    assign mult0_left =
     do_mul_go_out ? top_1_0_out : 32'd0;
    assign mult0_right =
     do_mul_go_out ? left_1_0_out : 32'd0;
    assign mult00_left =
     do_mul0_go_out ? top_1_1_out : 32'd0;
    assign mult00_right =
     do_mul0_go_out ? left_1_1_out : 32'd0;
    assign mult01_left =
     do_mul1_go_out ? top_0_1_out : 32'd0;
    assign mult01_right =
     do_mul1_go_out ? left_0_1_out : 32'd0;
    assign mult02_left =
     do_mul2_go_out ? top_0_0_out : 32'd0;
    assign mult02_right =
     do_mul2_go_out ? left_0_0_out : 32'd0;
    assign par0_done_in = pd1_out & pd2_out & pd3_out;
    assign par0_go_in = ~par0_done_out & fsm0_out == 2'd0 & tdcc0_go_out;
    assign par1_done_in = pd4_out & pd5_out & pd6_out;
    assign par1_go_in = ~par1_done_out & fsm0_out == 2'd1 & tdcc0_go_out;
    assign par2_done_in = pd7_out & pd8_out;
    assign par2_go_in = ~par2_done_out & fsm2_out == 5'd5 & tdcc2_go_out;
    assign par3_done_in = pd9_out & pd10_out & pd11_out & pd12_out;
    assign par3_go_in = ~par3_done_out & fsm1_out == 2'd0 & tdcc1_go_out;
    assign par4_done_in = pd13_out & pd14_out & pd15_out & pd16_out;
    assign par4_go_in = ~par4_done_out & fsm1_out == 2'd1 & tdcc1_go_out;
    assign par5_done_in = pd17_out & pd18_out;
    assign par5_go_in = ~par5_done_out & fsm2_out == 5'd7 & tdcc2_go_out;
    assign par6_done_in = pd19_out & pd20_out & pd21_out;
    assign par6_go_in = ~par6_done_out & fsm2_out == 5'd9 & tdcc2_go_out;
    assign par7_done_in = pd22_out & pd23_out & pd24_out;
    assign par7_go_in = ~par7_done_out & fsm2_out == 5'd10 & tdcc2_go_out;
    assign par_done_in = pd_out & pd0_out;
    assign par_go_in = ~par_done_out & fsm2_out == 5'd3 & tdcc2_go_out;
    assign pd_clk = clk;
    assign pd_in =
     pd_out & pd0_out ? 1'd0 :
     msp2_done_out & par_go_out ? 1'd1 : 1'd0;
    assign pd_reset = reset;
    assign pd_write_en = pd_out & pd0_out | msp2_done_out & par_go_out;
    assign pd0_clk = clk;
    assign pd0_in =
     pd_out & pd0_out ? 1'd0 :
     tdcc_done_out & par_go_out ? 1'd1 : 1'd0;
    assign pd0_reset = reset;
    assign pd0_write_en = pd_out & pd0_out | tdcc_done_out & par_go_out;
    assign pd1_clk = clk;
    assign pd1_in =
     pd1_out & pd2_out & pd3_out ? 1'd0 :
     do_mul1_done_out & par0_go_out ? 1'd1 : 1'd0;
    assign pd1_reset = reset;
    assign pd1_write_en = pd1_out & pd2_out & pd3_out | do_mul1_done_out & par0_go_out;
    assign pd10_clk = clk;
    assign pd10_in =
     pd9_out & pd10_out & pd11_out & pd12_out ? 1'd0 :
     do_mul_done_out & par3_go_out ? 1'd1 : 1'd0;
    assign pd10_reset = reset;
    assign pd10_write_en = pd9_out & pd10_out & pd11_out & pd12_out | do_mul_done_out & par3_go_out;
    assign pd11_clk = clk;
    assign pd11_in =
     pd9_out & pd10_out & pd11_out & pd12_out ? 1'd0 :
     do_mul0_done_out & par3_go_out ? 1'd1 : 1'd0;
    assign pd11_reset = reset;
    assign pd11_write_en = pd9_out & pd10_out & pd11_out & pd12_out | do_mul0_done_out & par3_go_out;
    assign pd12_clk = clk;
    assign pd12_in =
     pd9_out & pd10_out & pd11_out & pd12_out ? 1'd0 :
     do_mul2_done_out & par3_go_out ? 1'd1 : 1'd0;
    assign pd12_reset = reset;
    assign pd12_write_en = pd9_out & pd10_out & pd11_out & pd12_out | do_mul2_done_out & par3_go_out;
    assign pd13_clk = clk;
    assign pd13_in =
     pd13_out & pd14_out & pd15_out & pd16_out ? 1'd0 :
     do_add1_done_out & par4_go_out ? 1'd1 : 1'd0;
    assign pd13_reset = reset;
    assign pd13_write_en = pd13_out & pd14_out & pd15_out & pd16_out | do_add1_done_out & par4_go_out;
    assign pd14_clk = clk;
    assign pd14_in =
     pd13_out & pd14_out & pd15_out & pd16_out ? 1'd0 :
     do_add_done_out & par4_go_out ? 1'd1 : 1'd0;
    assign pd14_reset = reset;
    assign pd14_write_en = pd13_out & pd14_out & pd15_out & pd16_out | do_add_done_out & par4_go_out;
    assign pd15_clk = clk;
    assign pd15_in =
     pd13_out & pd14_out & pd15_out & pd16_out ? 1'd0 :
     do_add0_done_out & par4_go_out ? 1'd1 : 1'd0;
    assign pd15_reset = reset;
    assign pd15_write_en = pd13_out & pd14_out & pd15_out & pd16_out | do_add0_done_out & par4_go_out;
    assign pd16_clk = clk;
    assign pd16_in =
     pd13_out & pd14_out & pd15_out & pd16_out ? 1'd0 :
     do_add2_done_out & par4_go_out ? 1'd1 : 1'd0;
    assign pd16_reset = reset;
    assign pd16_write_en = pd13_out & pd14_out & pd15_out & pd16_out | do_add2_done_out & par4_go_out;
    assign pd17_clk = clk;
    assign pd17_in =
     pd17_out & pd18_out ? 1'd0 :
     msp6_done_out & par5_go_out ? 1'd1 : 1'd0;
    assign pd17_reset = reset;
    assign pd17_write_en = pd17_out & pd18_out | msp6_done_out & par5_go_out;
    assign pd18_clk = clk;
    assign pd18_in =
     pd17_out & pd18_out ? 1'd0 :
     tdcc1_done_out & par5_go_out ? 1'd1 : 1'd0;
    assign pd18_reset = reset;
    assign pd18_write_en = pd17_out & pd18_out | tdcc1_done_out & par5_go_out;
    assign pd19_clk = clk;
    assign pd19_in =
     pd19_out & pd20_out & pd21_out ? 1'd0 :
     do_mul_done_out & par6_go_out ? 1'd1 : 1'd0;
    assign pd19_reset = reset;
    assign pd19_write_en = pd19_out & pd20_out & pd21_out | do_mul_done_out & par6_go_out;
    assign pd2_clk = clk;
    assign pd2_in =
     pd1_out & pd2_out & pd3_out ? 1'd0 :
     do_mul_done_out & par0_go_out ? 1'd1 : 1'd0;
    assign pd2_reset = reset;
    assign pd2_write_en = pd1_out & pd2_out & pd3_out | do_mul_done_out & par0_go_out;
    assign pd20_clk = clk;
    assign pd20_in =
     pd19_out & pd20_out & pd21_out ? 1'd0 :
     do_mul0_done_out & par6_go_out ? 1'd1 : 1'd0;
    assign pd20_reset = reset;
    assign pd20_write_en = pd19_out & pd20_out & pd21_out | do_mul0_done_out & par6_go_out;
    assign pd21_clk = clk;
    assign pd21_in =
     pd19_out & pd20_out & pd21_out ? 1'd0 :
     do_mul1_done_out & par6_go_out ? 1'd1 : 1'd0;
    assign pd21_reset = reset;
    assign pd21_write_en = pd19_out & pd20_out & pd21_out | do_mul1_done_out & par6_go_out;
    assign pd22_clk = clk;
    assign pd22_in =
     pd22_out & pd23_out & pd24_out ? 1'd0 :
     do_add_done_out & par7_go_out ? 1'd1 : 1'd0;
    assign pd22_reset = reset;
    assign pd22_write_en = pd22_out & pd23_out & pd24_out | do_add_done_out & par7_go_out;
    assign pd23_clk = clk;
    assign pd23_in =
     pd22_out & pd23_out & pd24_out ? 1'd0 :
     do_add0_done_out & par7_go_out ? 1'd1 : 1'd0;
    assign pd23_reset = reset;
    assign pd23_write_en = pd22_out & pd23_out & pd24_out | do_add0_done_out & par7_go_out;
    assign pd24_clk = clk;
    assign pd24_in =
     pd22_out & pd23_out & pd24_out ? 1'd0 :
     do_add1_done_out & par7_go_out ? 1'd1 : 1'd0;
    assign pd24_reset = reset;
    assign pd24_write_en = pd22_out & pd23_out & pd24_out | do_add1_done_out & par7_go_out;
    assign pd3_clk = clk;
    assign pd3_in =
     pd1_out & pd2_out & pd3_out ? 1'd0 :
     do_mul2_done_out & par0_go_out ? 1'd1 : 1'd0;
    assign pd3_reset = reset;
    assign pd3_write_en = pd1_out & pd2_out & pd3_out | do_mul2_done_out & par0_go_out;
    assign pd4_clk = clk;
    assign pd4_in =
     pd4_out & pd5_out & pd6_out ? 1'd0 :
     do_add1_done_out & par1_go_out ? 1'd1 : 1'd0;
    assign pd4_reset = reset;
    assign pd4_write_en = pd4_out & pd5_out & pd6_out | do_add1_done_out & par1_go_out;
    assign pd5_clk = clk;
    assign pd5_in =
     pd4_out & pd5_out & pd6_out ? 1'd0 :
     do_add_done_out & par1_go_out ? 1'd1 : 1'd0;
    assign pd5_reset = reset;
    assign pd5_write_en = pd4_out & pd5_out & pd6_out | do_add_done_out & par1_go_out;
    assign pd6_clk = clk;
    assign pd6_in =
     pd4_out & pd5_out & pd6_out ? 1'd0 :
     do_add2_done_out & par1_go_out ? 1'd1 : 1'd0;
    assign pd6_reset = reset;
    assign pd6_write_en = pd4_out & pd5_out & pd6_out | do_add2_done_out & par1_go_out;
    assign pd7_clk = clk;
    assign pd7_in =
     pd7_out & pd8_out ? 1'd0 :
     msp4_done_out & par2_go_out ? 1'd1 : 1'd0;
    assign pd7_reset = reset;
    assign pd7_write_en = pd7_out & pd8_out | msp4_done_out & par2_go_out;
    assign pd8_clk = clk;
    assign pd8_in =
     pd7_out & pd8_out ? 1'd0 :
     tdcc0_done_out & par2_go_out ? 1'd1 : 1'd0;
    assign pd8_reset = reset;
    assign pd8_write_en = pd7_out & pd8_out | tdcc0_done_out & par2_go_out;
    assign pd9_clk = clk;
    assign pd9_in =
     pd9_out & pd10_out & pd11_out & pd12_out ? 1'd0 :
     do_mul1_done_out & par3_go_out ? 1'd1 : 1'd0;
    assign pd9_reset = reset;
    assign pd9_write_en = pd9_out & pd10_out & pd11_out & pd12_out | do_mul1_done_out & par3_go_out;
    assign pe_0_0_out_write_done_in = out_mem_done;
    assign pe_0_0_out_write_go_in = ~pe_0_0_out_write_done_out & fsm2_out == 5'd14 & tdcc2_go_out;
    assign pe_0_1_out_write_done_in = out_mem_done;
    assign pe_0_1_out_write_go_in = ~pe_0_1_out_write_done_out & fsm2_out == 5'd15 & tdcc2_go_out;
    assign pe_1_0_out_write_done_in = out_mem_done;
    assign pe_1_0_out_write_go_in = ~pe_1_0_out_write_done_out & fsm2_out == 5'd16 & tdcc2_go_out;
    assign pe_1_1_out_write_done_in = out_mem_done;
    assign pe_1_1_out_write_go_in = ~pe_1_1_out_write_done_out & fsm2_out == 5'd17 & tdcc2_go_out;
    assign t0_add_left =
     msp0_go_out | msp2_go_out | msp4_go_out ? 2'd1 : 2'd0;
    assign t0_add_right =
     msp0_go_out | msp2_go_out | msp4_go_out ? t0_idx_out : 2'd0;
    assign t0_idx_clk = clk;
    assign t0_idx_in =
     msp_go_out ? 2'd3 :
     msp0_go_out | msp2_go_out | msp4_go_out ? t0_add_out : 2'd0;
    assign t0_idx_reset = reset;
    assign t0_idx_write_en = msp_go_out | msp0_go_out | msp2_go_out | msp4_go_out;
    assign t1_add_left =
     msp2_go_out | msp4_go_out | msp6_go_out ? 2'd1 : 2'd0;
    assign t1_add_right =
     msp2_go_out | msp4_go_out | msp6_go_out ? t1_idx_out : 2'd0;
    assign t1_idx_clk = clk;
    assign t1_idx_in =
     msp_go_out ? 2'd3 :
     msp2_go_out | msp4_go_out | msp6_go_out ? t1_add_out : 2'd0;
    assign t1_idx_reset = reset;
    assign t1_idx_write_en = msp_go_out | msp2_go_out | msp4_go_out | msp6_go_out;
    assign tdcc0_done_in = fsm0_out == 2'd2;
    assign tdcc0_go_in = ~(pd8_out | tdcc0_done_out) & par2_go_out;
    assign tdcc1_done_in = fsm1_out == 2'd2;
    assign tdcc1_go_in = ~(pd18_out | tdcc1_done_out) & par5_go_out;
    assign tdcc2_done_in = fsm2_out == 5'd18;
    assign tdcc2_go_in = go;
    assign tdcc_done_in = fsm_out == 2'd2;
    assign tdcc_go_in = ~(pd0_out | tdcc_done_out) & par_go_out;
    assign top_0_0_clk = clk;
    assign top_0_0_in =
     msp1_go_out | msp3_go_out | msp5_go_out ? t0_read_data : 32'd0;
    assign top_0_0_reset = reset;
    assign top_0_0_write_en = msp1_go_out | msp3_go_out | msp5_go_out;
    assign top_0_1_clk = clk;
    assign top_0_1_in =
     msp3_go_out | msp5_go_out | msp7_go_out ? t1_read_data : 32'd0;
    assign top_0_1_reset = reset;
    assign top_0_1_write_en = msp3_go_out | msp5_go_out | msp7_go_out;
    assign top_1_0_clk = clk;
    assign top_1_0_in =
     msp3_go_out | msp5_go_out | msp7_go_out ? top_0_0_out : 32'd0;
    assign top_1_0_reset = reset;
    assign top_1_0_write_en = msp3_go_out | msp5_go_out | msp7_go_out;
    assign top_1_1_clk = clk;
    assign top_1_1_in =
     msp5_go_out | msp7_go_out | msp8_go_out ? top_0_1_out : 32'd0;
    assign top_1_1_reset = reset;
    assign top_1_1_write_en = msp5_go_out | msp7_go_out | msp8_go_out;
endmodule

module mac_pe (
    input logic [31:0] top,
    input logic [31:0] left,
    output logic [31:0] out,
    input logic go,
    input logic clk,
    input logic reset,
    output logic done
);
    logic [31:0] mul_out_in;
    logic mul_out_write_en;
    logic mul_out_clk;
    logic mul_out_reset;
    logic [31:0] mul_out_out;
    logic mul_out_done;
    logic [31:0] acc_in;
    logic acc_write_en;
    logic acc_clk;
    logic acc_reset;
    logic [31:0] acc_out;
    logic acc_done;
    logic [31:0] add_left;
    logic [31:0] add_right;
    logic [31:0] add_out;
    logic [31:0] mult0_left;
    logic [31:0] mult0_right;
    logic [31:0] mult0_out;
    logic [1:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [1:0] fsm_out;
    logic fsm_done;
    logic do_mul_go_in;
    logic do_mul_go_out;
    logic do_mul_done_in;
    logic do_mul_done_out;
    logic do_add_go_in;
    logic do_add_go_out;
    logic do_add_done_in;
    logic do_add_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        mul_out_in = 32'd0;
        mul_out_write_en = 1'd0;
        mul_out_clk = 1'd0;
        mul_out_reset = 1'd0;
        acc_in = 32'd0;
        acc_write_en = 1'd0;
        acc_clk = 1'd0;
        acc_reset = 1'd0;
        add_left = 32'd0;
        add_right = 32'd0;
        mult0_left = 32'd0;
        mult0_right = 32'd0;
        fsm_in = 2'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        do_mul_go_in = 1'd0;
        do_mul_done_in = 1'd0;
        do_add_go_in = 1'd0;
        do_add_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_reg # (
        .WIDTH(32)
    ) mul_out (
        .clk(mul_out_clk),
        .done(mul_out_done),
        .in(mul_out_in),
        .out(mul_out_out),
        .reset(mul_out_reset),
        .write_en(mul_out_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) acc (
        .clk(acc_clk),
        .done(acc_done),
        .in(acc_in),
        .out(acc_out),
        .reset(acc_reset),
        .write_en(acc_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add (
        .left(add_left),
        .out(add_out),
        .right(add_right)
    );
    std_unsyn_mult # (
        .WIDTH(32)
    ) mult0 (
        .left(mult0_left),
        .out(mult0_out),
        .right(mult0_right)
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
    ) do_mul_go (
        .in(do_mul_go_in),
        .out(do_mul_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_mul_done (
        .in(do_mul_done_in),
        .out(do_mul_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add_go (
        .in(do_add_go_in),
        .out(do_add_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) do_add_done (
        .in(do_add_done_in),
        .out(do_add_done_out)
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
    assign out = acc_out;
    assign acc_clk = clk;
    assign acc_in =
     do_add_go_out ? add_out : 32'd0;
    assign acc_reset = reset;
    assign acc_write_en = do_add_go_out;
    assign add_left =
     do_add_go_out ? acc_out : 32'd0;
    assign add_right =
     do_add_go_out ? mul_out_out : 32'd0;
    assign do_add_done_in = acc_done;
    assign do_add_go_in = ~do_add_done_out & fsm_out == 2'd1 & tdcc_go_out;
    assign do_mul_done_in = mul_out_done;
    assign do_mul_go_in = ~do_mul_done_out & fsm_out == 2'd0 & tdcc_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 2'd2 ? 2'd0 :
     fsm_out == 2'd0 & do_mul_done_out & tdcc_go_out ? 2'd1 :
     fsm_out == 2'd1 & do_add_done_out & tdcc_go_out ? 2'd2 : 2'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 2'd2 | fsm_out == 2'd0 & do_mul_done_out & tdcc_go_out | fsm_out == 2'd1 & do_add_done_out & tdcc_go_out;
    assign mul_out_clk = clk;
    assign mul_out_in =
     do_mul_go_out ? mult0_out : 32'd0;
    assign mul_out_reset = reset;
    assign mul_out_write_en = do_mul_go_out;
    assign mult0_left =
     do_mul_go_out ? top : 32'd0;
    assign mult0_right =
     do_mul_go_out ? left : 32'd0;
    assign tdcc_done_in = fsm_out == 2'd2;
    assign tdcc_go_in = go;
endmodule

