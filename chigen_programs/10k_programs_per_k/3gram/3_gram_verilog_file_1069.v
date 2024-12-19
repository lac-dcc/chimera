// Seed: 2815103648
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wand id_2,
    input supply1 id_3,
    output wand id_4,
    output wand id_5,
    output supply0 id_6,
    input tri1 id_7,
    output wand id_8,
    input tri id_9
);
  wire id_11, id_12;
  tri0 id_13 = id_3;
  assign id_5 = id_13;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wand id_3,
    input supply0 id_4,
    output wire id_5,
    input wand id_6,
    input tri1 id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_3
  );
  assign modCall_1.type_17 = 0;
  wire id_9;
endmodule
