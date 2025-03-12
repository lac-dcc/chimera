// Seed: 1268163357
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8 (id_9),
        .id_10(-1)
    ) [1 : 1'b0],
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_20 = 1;
  localparam id_21 = -1'b0;
  assign id_2 = id_17;
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_3  = 32'd94,
    parameter id_5  = 32'd60
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout tri1 id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  inout wire id_4;
  inout wire _id_3;
  output wire id_2;
  output wand id_1;
  tri0 [id_3 : id_5] id_9;
  localparam id_10 = 1;
  assign id_1 = -1'h0;
  if (-1) logic _id_11;
  ;
  logic id_12;
  ;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_4,
      id_9,
      id_6,
      id_9,
      id_10,
      id_7,
      id_8,
      id_12,
      id_9,
      id_1,
      id_6,
      id_7,
      id_8,
      id_4
  );
  parameter id_13 = id_10[id_11];
  assign id_9  = 1;
  assign id_8  = -1;
  assign id_4  = id_5;
  assign id_12 = id_13;
  xnor primCall (id_1, id_10, id_7, id_6, id_4, id_8, id_9, id_12);
endmodule
