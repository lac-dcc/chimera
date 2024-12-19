// Seed: 503536906
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    output supply0 id_5,
    output wand id_6
);
  uwire id_8;
  wire  id_9;
  assign id_8 = id_0;
  assign module_1.type_13 = 0;
  wire id_10;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    output tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output tri id_6,
    output tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wand id_10
);
  wire id_12;
  xor primCall (id_5, id_4, id_12, id_8, id_9, id_10, id_1);
  module_0 modCall_1 (
      id_10,
      id_0,
      id_8,
      id_8,
      id_1,
      id_5,
      id_5
  );
endmodule
