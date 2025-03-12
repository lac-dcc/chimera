// Seed: 1459527472
module module_0 (
    input uwire id_0,
    output tri id_1,
    output uwire id_2,
    input wor id_3
    , id_14,
    input wor id_4,
    input uwire id_5,
    input uwire id_6,
    output wand id_7,
    output wire id_8,
    output wor id_9,
    output supply0 id_10,
    input supply1 id_11,
    output wand id_12
);
  assign id_8 = 1;
  parameter id_15 = -1, id_16 = id_4;
endmodule
module module_1 #(
    parameter id_6 = 32'd93
) (
    output tri0 id_0,
    input  wire id_1,
    output wand id_2,
    output wor  id_3,
    input  tri0 id_4,
    input  tri0 id_5,
    input  wire _id_6,
    input  wor  id_7,
    input  wire id_8
);
  wire id_10;
  integer id_11;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_8,
      id_8,
      id_4,
      id_5,
      id_3,
      id_0,
      id_3,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
  logic id_12;
  tri0  id_13;
  assign id_2  = id_12;
  assign id_13 = id_10 ^ id_4 - -1;
  wire [1 'b0 : id_6] id_14;
  assign id_3 = id_10;
endmodule
