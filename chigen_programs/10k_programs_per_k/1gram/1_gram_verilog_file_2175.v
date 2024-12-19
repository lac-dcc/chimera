// Seed: 1270338986
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    output supply0 id_6,
    output supply1 id_7,
    input wand id_8,
    input tri1 id_9
);
  supply0 id_11, id_12;
  wire id_13, id_14;
  wire id_15;
  id_16(
      id_11, 1
  );
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri0 id_5,
    input wor id_6,
    input supply0 id_7,
    input supply0 id_8,
    output tri0 id_9,
    output wand id_10,
    output wire id_11,
    output wire id_12,
    input tri0 id_13,
    input tri1 id_14
);
  uwire id_16;
  assign id_16 = id_7;
  module_0 modCall_1 (
      id_16,
      id_5,
      id_14,
      id_10,
      id_1,
      id_2,
      id_11,
      id_4,
      id_14,
      id_16
  );
  assign modCall_1.id_8 = 0;
  assign id_9 = 1;
  wire id_17;
endmodule
