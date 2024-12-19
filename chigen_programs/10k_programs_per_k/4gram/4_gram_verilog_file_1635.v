// Seed: 971638513
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    input supply1 id_4,
    output uwire id_5,
    output tri0 id_6,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input uwire id_10,
    output wand id_11
);
  wire id_13;
  wire id_14;
  assign id_2 = &id_4;
endmodule
module module_1 (
    input  wand  id_0,
    input  wand  id_1,
    output tri   id_2,
    input  uwire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
