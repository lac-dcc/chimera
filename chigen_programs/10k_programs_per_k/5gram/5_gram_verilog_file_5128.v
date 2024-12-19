// Seed: 2075349662
module module_0 (
    output uwire id_0,
    input wand id_1,
    output wire id_2,
    input tri1 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri id_11,
    output supply1 id_12
);
  wire id_14;
  assign id_2 = id_7;
  wire id_15;
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output wand id_5,
    input tri0 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input wor id_9,
    input tri1 id_10,
    input wire id_11,
    input supply0 id_12
);
  assign id_5 = id_12;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_4,
      id_11,
      id_8,
      id_9,
      id_12,
      id_3,
      id_9,
      id_1,
      id_10,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
