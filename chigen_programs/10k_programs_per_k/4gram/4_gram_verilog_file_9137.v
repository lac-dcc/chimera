// Seed: 1870250257
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output wire id_5,
    input tri1 id_6,
    input wand id_7,
    input uwire id_8,
    input tri0 id_9
);
  supply0 id_11 = 1;
  assign id_5 = -1;
  tri0 id_12 = id_8 - 1'd0;
  localparam id_13 = (-1 - 1);
  integer id_14;
  wire id_15 = id_12;
  wire id_16 = id_8;
endmodule
module module_1 (
    input  tri0 id_0
    , id_8, id_9,
    output wand id_1,
    input  wand id_2,
    input  wand id_3,
    input  tri1 id_4,
    input  wand id_5,
    output tri1 id_6
);
  wire id_10 = id_8;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_1,
      id_4,
      id_1,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
