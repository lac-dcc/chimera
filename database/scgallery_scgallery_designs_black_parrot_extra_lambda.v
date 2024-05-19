// This program was cloned from: https://github.com/siliconcompiler/scgallery
// License: Apache License 2.0

module hard_mem_1rw_d512_w64_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  output [63:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [63:0] data_o;

  la_spram #(.DW(64), .AW(9)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({64{w_i}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule

module hard_mem_1rw_bit_mask_d64_w96_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [95:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [95:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [95:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [95:0] data_o;

  la_spram #(.DW(96), .AW(6)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({96{w_i}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule


module hard_mem_1rw_byte_mask_d512_w64_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, write_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [63:0] data_i;
  input [8:0] addr_i;
  input [7:0] write_mask_i;
  output [63:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [63:0] data_i;
  wire [8:0] addr_i;
  wire [7:0] write_mask_i;
  wire [63:0] data_o;
  wire [63:0] wen;

  la_spram #(.DW(64), .AW(9)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({{8{write_mask_i[7]}},
            {8{write_mask_i[6]}},
            {8{write_mask_i[5]}},
            {8{write_mask_i[4]}},
            {8{write_mask_i[3]}},
            {8{write_mask_i[2]}},
            {8{write_mask_i[1]}},
            {8{write_mask_i[0]}}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule

module hard_mem_1rw_bit_mask_d64_w7_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [6:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [6:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [6:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [6:0] data_o;

  la_spram #(.DW(7), .AW(6)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({7{w_i}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule

module hard_mem_1rw_bit_mask_d64_w15_wrapper(clk_i, reset_i, data_i,
     addr_i, v_i, w_mask_i, w_i, data_o);
  input clk_i, reset_i, v_i, w_i;
  input [14:0] data_i, w_mask_i;
  input [5:0] addr_i;
  output [14:0] data_o;
  wire clk_i, reset_i, v_i, w_i;
  wire [14:0] data_i, w_mask_i;
  wire [5:0] addr_i;
  wire [14:0] data_o;

  la_spram #(.DW(15), .AW(6)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({15{w_i}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule


module hard_mem_1rw_d256_w95_wrapper(clk_i, v_i, reset_i, data_i,
     addr_i, w_i, data_o);
  input clk_i, v_i, reset_i, w_i;
  input [94:0] data_i;
  input [7:0] addr_i;
  output [94:0] data_o;
  wire clk_i, v_i, reset_i, w_i;
  wire [94:0] data_i;
  wire [7:0] addr_i;
  wire [94:0] data_o;

  la_spram #(.DW(95), .AW(8)) mem(
    .clk(clk_i),
    .ce(1'b1),
    .we(w_i),
    .wmask({95{w_i}}),
    .addr(addr_i),
    .din(data_i),
    .dout(data_o)
  );

endmodule
