// Seed: 3874419350
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wire id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wand id_6,
    output supply1 id_7,
    input wor id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12
);
  assign id_7 = id_5 != {id_11, 1};
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    output wor id_2,
    input supply0 id_3,
    output wand id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
