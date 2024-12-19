// Seed: 823814656
module module_0 (
    input tri1 id_0,
    output wire id_1
    , id_16,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4
    , id_17,
    input wire id_5,
    output wire id_6,
    input supply0 id_7
    , id_18,
    input wand id_8,
    output tri1 id_9,
    input tri id_10,
    input tri id_11,
    output wire id_12,
    output wand id_13,
    output wand id_14
);
  assign id_9 = id_18;
endmodule
module module_1 (
    input  wire id_0,
    input  tri0 id_1,
    input  tri1 id_2,
    output wire id_3
);
  wand id_5 = id_2;
  assign id_5 = 1;
  tri id_6;
  and primCall (id_3, id_5, id_0, id_6, id_1, id_2);
  assign id_6 = {1{id_2}};
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_1,
      id_0,
      id_2,
      id_5,
      id_5,
      id_2,
      id_6,
      id_6,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_8 = 0;
endmodule
