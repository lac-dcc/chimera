// Seed: 1958669989
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input wand id_4
    , id_13,
    output tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input tri id_9,
    output wor id_10,
    input wand id_11
);
  assign id_13 = id_7;
  tri0 id_14 = id_13;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply1 id_4
);
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_4 = 0;
  assign id_4 = 1'b0;
endmodule
