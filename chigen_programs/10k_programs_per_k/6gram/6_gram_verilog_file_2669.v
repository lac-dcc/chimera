// Seed: 530372580
module module_0 (
    output wire id_0,
    output tri0 id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    output supply1 id_6,
    input wand id_7,
    input wand id_8,
    input wand id_9,
    input uwire id_10,
    output tri0 id_11,
    input supply1 id_12,
    output wand id_13
);
  wire id_15, id_16;
  wire id_17;
  wire id_18;
  wor  id_19 = id_7;
  wire id_20;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri0 id_2,
    input wand id_3,
    output uwire id_4,
    input wand id_5,
    output wand id_6,
    output wire id_7,
    output tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_0,
      id_2,
      id_3,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
