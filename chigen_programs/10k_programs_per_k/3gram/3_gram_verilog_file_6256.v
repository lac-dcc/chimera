// Seed: 368549003
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wor id_2,
    output wire id_3,
    input wor id_4,
    input wor id_5,
    output supply0 id_6,
    output wor id_7,
    input tri0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    output uwire id_12
);
  wire id_14 = 1;
  wire id_15;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input wand id_2
);
  assign id_0 = {id_1, id_2};
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
