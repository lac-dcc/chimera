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
module copy (
    input logic dest_done,
    input logic [31:0] src_read_data,
    input logic [2:0] length,
    output logic [31:0] dest_write_data,
    output logic dest_write_en,
    output logic [2:0] dest_addr0,
    output logic [2:0] src_addr0,
    input logic go,
    input logic clk,
    input logic reset,
    output logic done
);
    logic [2:0] lt_left;
    logic [2:0] lt_right;
    logic lt_out;
    logic [2:0] N_in;
    logic N_write_en;
    logic N_clk;
    logic N_reset;
    logic [2:0] N_out;
    logic N_done;
    logic [2:0] add_left;
    logic [2:0] add_right;
    logic [2:0] add_out;
    logic comb_reg_in;
    logic comb_reg_write_en;
    logic comb_reg_clk;
    logic comb_reg_reset;
    logic comb_reg_out;
    logic comb_reg_done;
    logic [2:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_reset;
    logic [2:0] fsm_out;
    logic fsm_done;
    logic upd_index_go_in;
    logic upd_index_go_out;
    logic upd_index_done_in;
    logic upd_index_done_out;
    logic copy_index_N_go_in;
    logic copy_index_N_go_out;
    logic copy_index_N_done_in;
    logic copy_index_N_done_out;
    logic cond0_go_in;
    logic cond0_go_out;
    logic cond0_done_in;
    logic cond0_done_out;
    logic tdcc_go_in;
    logic tdcc_go_out;
    logic tdcc_done_in;
    logic tdcc_done_out;
    initial begin
        lt_left = 3'd0;
        lt_right = 3'd0;
        N_in = 3'd0;
        N_write_en = 1'd0;
        N_clk = 1'd0;
        N_reset = 1'd0;
        add_left = 3'd0;
        add_right = 3'd0;
        comb_reg_in = 1'd0;
        comb_reg_write_en = 1'd0;
        comb_reg_clk = 1'd0;
        comb_reg_reset = 1'd0;
        fsm_in = 3'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        fsm_reset = 1'd0;
        upd_index_go_in = 1'd0;
        upd_index_done_in = 1'd0;
        copy_index_N_go_in = 1'd0;
        copy_index_N_done_in = 1'd0;
        cond0_go_in = 1'd0;
        cond0_done_in = 1'd0;
        tdcc_go_in = 1'd0;
        tdcc_done_in = 1'd0;
    end
    std_lt # (
        .WIDTH(3)
    ) lt (
        .left(lt_left),
        .out(lt_out),
        .right(lt_right)
    );
    std_reg # (
        .WIDTH(3)
    ) N (
        .clk(N_clk),
        .done(N_done),
        .in(N_in),
        .out(N_out),
        .reset(N_reset),
        .write_en(N_write_en)
    );
    std_add # (
        .WIDTH(3)
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
    ) upd_index_go (
        .in(upd_index_go_in),
        .out(upd_index_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) upd_index_done (
        .in(upd_index_done_in),
        .out(upd_index_done_out)
    );
    std_wire # (
        .WIDTH(1)
    ) copy_index_N_go (
        .in(copy_index_N_go_in),
        .out(copy_index_N_go_out)
    );
    std_wire # (
        .WIDTH(1)
    ) copy_index_N_done (
        .in(copy_index_N_done_in),
        .out(copy_index_N_done_out)
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
    assign N_clk = clk;
    assign N_in =
     upd_index_go_out ? add_out : 3'd0;
    assign N_reset = reset;
    assign N_write_en = upd_index_go_out;
    assign dest_addr0 =
     copy_index_N_go_out ? N_out : 3'd0;
    assign dest_write_data =
     copy_index_N_go_out ? src_read_data : 32'd0;
    assign dest_write_en = copy_index_N_go_out;
    assign done = tdcc_done_out;
    assign src_addr0 =
     copy_index_N_go_out ? N_out : 3'd0;
    assign add_left =
     upd_index_go_out ? N_out : 3'd0;
    assign add_right =
     upd_index_go_out ? 3'd1 : 3'd0;
    assign comb_reg_clk = clk;
    assign comb_reg_in =
     cond0_go_out ? lt_out : 1'd0;
    assign comb_reg_reset = reset;
    assign comb_reg_write_en = cond0_go_out;
    assign cond0_done_in = comb_reg_done;
    assign cond0_go_in = ~cond0_done_out & fsm_out == 3'd0 & tdcc_go_out | ~cond0_done_out & fsm_out == 3'd3 & tdcc_go_out;
    assign copy_index_N_done_in = dest_done;
    assign copy_index_N_go_in = ~copy_index_N_done_out & fsm_out == 3'd1 & tdcc_go_out;
    assign fsm_clk = clk;
    assign fsm_in =
     fsm_out == 3'd4 ? 3'd0 :
     fsm_out == 3'd0 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd3 & cond0_done_out & comb_reg_out & tdcc_go_out ? 3'd1 :
     fsm_out == 3'd1 & copy_index_N_done_out & tdcc_go_out ? 3'd2 :
     fsm_out == 3'd2 & upd_index_done_out & tdcc_go_out ? 3'd3 :
     fsm_out == 3'd0 & cond0_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 3'd3 & cond0_done_out & ~comb_reg_out & tdcc_go_out ? 3'd4 : 3'd0;
    assign fsm_reset = reset;
    assign fsm_write_en = fsm_out == 3'd4 | fsm_out == 3'd0 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd3 & cond0_done_out & comb_reg_out & tdcc_go_out | fsm_out == 3'd1 & copy_index_N_done_out & tdcc_go_out | fsm_out == 3'd2 & upd_index_done_out & tdcc_go_out | fsm_out == 3'd0 & cond0_done_out & ~comb_reg_out & tdcc_go_out | fsm_out == 3'd3 & cond0_done_out & ~comb_reg_out & tdcc_go_out;
    assign lt_left =
     cond0_go_out ? N_out : 3'd0;
    assign lt_right =
     cond0_go_out ? length : 3'd0;
    assign tdcc_done_in = fsm_out == 3'd4;
    assign tdcc_go_in = go;
    assign upd_index_done_in = N_done;
    assign upd_index_go_in = ~upd_index_done_out & fsm_out == 3'd2 & tdcc_go_out;
endmodule

module main (
    input logic go,
    input logic clk,
    input logic reset,
    output logic done,
    output logic [2:0] d_addr0,
    output logic [31:0] d_write_data,
    output logic d_write_en,
    output logic d_clk,
    input logic [31:0] d_read_data,
    input logic d_done,
    output logic [2:0] s_addr0,
    output logic [31:0] s_write_data,
    output logic s_write_en,
    output logic s_clk,
    input logic [31:0] s_read_data,
    input logic s_done
);
    logic [2:0] length_out;
    logic copy0_dest_done;
    logic [31:0] copy0_src_read_data;
    logic [2:0] copy0_length;
    logic [31:0] copy0_dest_write_data;
    logic copy0_dest_write_en;
    logic [2:0] copy0_dest_addr0;
    logic [2:0] copy0_src_addr0;
    logic copy0_go;
    logic copy0_clk;
    logic copy0_reset;
    logic copy0_done;
    logic invoke_go_in;
    logic invoke_go_out;
    logic invoke_done_in;
    logic invoke_done_out;
    initial begin
        copy0_dest_done = 1'd0;
        copy0_src_read_data = 32'd0;
        copy0_length = 3'd0;
        copy0_go = 1'd0;
        copy0_clk = 1'd0;
        copy0_reset = 1'd0;
        invoke_go_in = 1'd0;
        invoke_done_in = 1'd0;
    end
    std_const # (
        .VALUE(3'd5),
        .WIDTH(3)
    ) length (
        .out(length_out)
    );
    copy copy0 (
        .clk(copy0_clk),
        .dest_addr0(copy0_dest_addr0),
        .dest_done(copy0_dest_done),
        .dest_write_data(copy0_dest_write_data),
        .dest_write_en(copy0_dest_write_en),
        .done(copy0_done),
        .go(copy0_go),
        .length(copy0_length),
        .reset(copy0_reset),
        .src_addr0(copy0_src_addr0),
        .src_read_data(copy0_src_read_data)
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
    assign d_addr0 =
     invoke_go_out ? copy0_dest_addr0 : 3'd0;
    assign d_clk = clk;
    assign d_write_data =
     invoke_go_out ? copy0_dest_write_data : 32'd0;
    assign d_write_en =
     invoke_go_out ? copy0_dest_write_en : 1'd0;
    assign done = invoke_done_out;
    assign s_addr0 =
     invoke_go_out ? copy0_src_addr0 : 3'd0;
    assign s_clk = clk;
    assign copy0_clk = clk;
    assign copy0_dest_done =
     invoke_go_out ? d_done : 1'd0;
    assign copy0_go = invoke_go_out;
    assign copy0_length =
     invoke_go_out ? length_out : 3'd0;
    assign copy0_reset = reset;
    assign copy0_src_read_data =
     invoke_go_out ? s_read_data : 32'd0;
    assign invoke_done_in = copy0_done;
    assign invoke_go_in = go;
endmodule

