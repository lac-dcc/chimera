// Seed: 2068189140
module module_0 #(
    parameter id_6 = 32'd25,
    parameter id_7 = 32'd42
) (
    input  tri   id_0,
    output uwire id_1,
    output wand  id_2,
    input  wand  id_3
);
  wire id_5;
  logic _id_6, _id_7 = id_5;
  union packed {
    logic id_8;
    logic id_9;
    logic id_10;
    logic id_11;
    logic id_12 = 1;
    logic id_13;
    logic id_14[$realtime : id_6];
    logic id_15;
    logic id_16;
  } id_17;
  ;
  assign id_17.id_11 = id_3;
  tri id_18 = -1;
  parameter id_19 = -1;
  logic [7:0][id_7] id_20;
  assign id_17.id_8  = -1;
  assign id_17.id_16 = (1) + -1;
  wire id_21 = id_21;
endmodule
module module_1 #(
    parameter id_2 = 32'd26,
    parameter id_4 = 32'd40,
    parameter id_5 = 32'd26
) (
    output wor   id_0,
    output logic id_1 [id_4 : id_5],
    input  wor   _id_2,
    input  uwire id_3,
    input  uwire _id_4,
    input  uwire _id_5,
    input  uwire id_6,
    input  tri   id_7,
    input  wand  id_8
);
  always id_1 <= 1;
  logic id_10 [id_2 : -1];
  wire  id_11;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_0,
      id_6
  );
endmodule
