// Seed: 492488687
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wire id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wand id_9,
    input tri id_10,
    output wand id_11,
    input supply0 id_12,
    output uwire id_13,
    input uwire id_14,
    output uwire id_15,
    output wire id_16
);
  assign id_16 = id_2;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input wand id_2,
    output wor id_3,
    output uwire id_4,
    output wand id_5,
    input tri id_6
);
  module_0 modCall_1 (
      id_6,
      id_1,
      id_6,
      id_2,
      id_6,
      id_2,
      id_5,
      id_1,
      id_2,
      id_5,
      id_2,
      id_4,
      id_6,
      id_0,
      id_1,
      id_5,
      id_3
  );
  assign modCall_1.id_11 = 0;
endmodule
