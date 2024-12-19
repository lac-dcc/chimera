// Seed: 2861073858
module module_0 (
    input uwire id_0,
    output wire id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4,
    output wire id_5,
    output tri0 id_6,
    output wand id_7,
    output tri0 id_8
    , id_12,
    input wor id_9,
    output wand id_10
);
  wire id_13;
  wire id_14;
  wire id_15;
  assign id_6 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    input tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    output supply1 id_8
);
  wand id_10;
  assign id_4  = id_6 - 1;
  assign id_10 = "" ? 1 : 1;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_1,
      id_1,
      id_5,
      id_8,
      id_8,
      id_4,
      id_8,
      id_1,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
