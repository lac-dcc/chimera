// Seed: 2808346945
module module_0 (
    output wor id_0,
    output tri id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri id_4,
    output supply1 id_5
    , id_9,
    input supply0 id_6,
    output wor id_7
);
  wire id_10;
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    output supply0 id_2,
    output tri id_3,
    input supply1 id_4,
    output tri0 id_5,
    input tri1 id_6,
    output wand id_7,
    input wand id_8
);
  nor primCall (id_0, id_8, id_4);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_4,
      id_3,
      id_6,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
