// Seed: 1060714344
module module_0 (
    output tri0 id_0,
    output tri id_1,
    output tri id_2,
    output uwire id_3,
    input wor id_4,
    output tri1 id_5,
    input supply0 id_6,
    input uwire id_7
    , id_15,
    input tri0 id_8,
    output uwire id_9,
    input wor id_10,
    input tri id_11,
    input wand id_12,
    input tri0 id_13
);
  wire id_16;
  tri  id_17 = id_8;
  assign id_9 = 1;
  wire id_18, id_19 = id_19;
  supply0 id_20 = id_17, id_21;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wand id_4,
    output wire id_5,
    output wand id_6
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
