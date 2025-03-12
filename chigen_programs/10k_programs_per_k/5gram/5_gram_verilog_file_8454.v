// Seed: 655932726
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wand id_3,
    output tri id_4,
    output supply1 id_5,
    output wand id_6,
    output wand id_7,
    output tri1 id_8,
    input wor id_9,
    output tri1 id_10,
    output supply0 id_11
);
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input uwire id_4,
    output uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
