// Seed: 17165391
module module_0 (
    output uwire id_0
    , id_4,
    output supply1 id_1,
    output tri id_2
);
  assign id_2 = id_4;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5
    , id_14, id_15,
    input supply0 id_6,
    input wor id_7,
    output tri1 id_8,
    input tri id_9,
    input wand id_10,
    input supply1 id_11,
    output wand id_12
);
  nor primCall (id_12, id_9, id_7, id_3, id_0, id_1, id_5, id_10, id_14, id_2, id_6);
  assign id_12 = 1;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_15
  );
  assign modCall_1.type_1 = 0;
  wire id_16;
  assign id_15 = id_6;
endmodule
