// Seed: 3807311068
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output tri id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    output supply1 id_9,
    input wand id_10
);
  wire id_12;
  assign id_9 = ~id_7;
  wire id_13;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    output wire id_2,
    input wor id_3,
    input wor id_4,
    input supply0 id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
