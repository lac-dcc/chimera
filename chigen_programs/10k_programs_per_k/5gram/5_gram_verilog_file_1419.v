// Seed: 3995156902
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    output tri id_4,
    output supply1 id_5,
    input wire id_6,
    input tri1 id_7,
    output tri0 id_8,
    output wand id_9,
    output tri id_10,
    input wire id_11,
    output wor id_12
);
  wire id_14;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input wire id_2,
    input tri0 id_3,
    input uwire id_4,
    input wand id_5,
    output tri1 id_6,
    output supply0 id_7,
    output wor id_8
);
  supply0 id_10 = id_3, id_11;
  module_0 modCall_1 (
      id_11,
      id_2,
      id_1,
      id_8,
      id_6,
      id_11,
      id_10,
      id_5,
      id_0,
      id_10,
      id_10,
      id_4,
      id_8
  );
  assign modCall_1.type_17 = 0;
  wire id_12;
  assign id_6 = id_10 >= {id_2, 1};
endmodule
