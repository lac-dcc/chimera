// Seed: 1093448581
module module_0 #(
    parameter id_11 = 32'd65,
    parameter id_6  = 32'd86
) (
    output uwire id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  tri1  id_3
);
  logic id_5;
  ;
  localparam id_6 = 1;
  wire [-1 : -1] id_7;
  wire id_8;
  wire id_9;
  assign id_5 = 1'd0;
  wire id_10;
  defparam id_6 = id_6, id_6 = -1'h0;
  wire _id_11;
  assign id_11 = id_3;
  logic id_12;
  parameter id_13[-1 : id_11] = 1;
endmodule
module module_1 #(
    parameter id_0  = 32'd4,
    parameter id_1  = 32'd11,
    parameter id_10 = 32'd57
) (
    input wire _id_0[id_0  .  id_0 : id_0],
    output wand _id_1,
    input tri id_2,
    output tri id_3,
    input supply1 id_4,
    input uwire id_5,
    output supply1 id_6[1 : 1  &  -1]
);
  logic id_8;
  logic id_9 [id_1 : id_0] = ~id_8 ^ 1;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wire _id_10[1  -  -1 'b0 : 1], id_11;
  if (1'h0) assign id_9 = id_8;
  logic id_12 = id_4;
  generate
  endgenerate
  tri0 id_13;
  ;
  assign id_13 = 1'd0;
  assign id_3  = id_13;
  wire id_14;
  wire id_15 [id_10 : 1];
  nand primCall (id_3, id_8, id_9);
endmodule
