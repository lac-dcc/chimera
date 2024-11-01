// Seed: 489785192
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wire id_2,
    output wire id_3
    , id_14,
    input supply1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    output wor id_7
    , id_15,
    input uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    input wor id_11,
    input wor id_12
);
  wire id_16;
  assign id_14[1] = ~1;
  assign id_0 = id_9;
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  wor   id_4
);
  wire id_6;
  wand id_7;
  nand (id_0, id_1, id_3, id_6);
  module_0(
      id_0, id_0, id_4, id_0, id_3, id_3, id_1, id_0, id_2, id_4, id_3, id_2, id_4
  );
  assign id_7 = 1;
endmodule
