// Seed: 466693097
module module_0 (
    output wor id_0,
    output uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    input supply1 id_5,
    output uwire id_6,
    input tri1 id_7
);
  assign id_1 = 1 && id_5 ? id_2 : -1'b0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output wand id_2,
    input tri id_3,
    input wor id_4,
    input tri0 id_5,
    output tri1 id_6,
    output wire id_7,
    output wand id_8,
    output tri id_9
);
  wor id_11;
  parameter id_12 = id_11;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_8,
      id_1,
      id_5,
      id_8,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
