// Seed: 1330487909
module module_0 (
    input wand id_0,
    input uwire id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wand id_7,
    input wor id_8,
    input tri id_9,
    output wor id_10,
    output supply0 id_11,
    output tri id_12
);
  if (1) assign id_11 = id_7;
  else wire id_14;
  wire id_15, id_16;
endmodule
module module_1 (
    output tri1 id_0,
    output wor id_1,
    output uwire id_2,
    id_6,
    input tri0 id_3,
    input supply1 id_4
);
  assign id_0 = id_3 == (id_4);
  wire id_7, id_8, id_9 = id_8, id_10, id_11 = id_6;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_4,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.type_3 = 0;
endmodule
