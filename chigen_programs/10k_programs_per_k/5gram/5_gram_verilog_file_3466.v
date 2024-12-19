// Seed: 184688288
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output wand id_2,
    output wor id_3,
    output supply1 id_4,
    input tri1 id_5,
    output supply1 id_6
);
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    input supply1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    output tri1 id_9,
    output tri id_10,
    input tri id_11
);
  assign id_10 = 1;
  wire id_13;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_1,
      id_1,
      id_1,
      id_8,
      id_9
  );
  assign modCall_1.type_0 = 0;
  assign id_1 = 1 - id_0;
endmodule
