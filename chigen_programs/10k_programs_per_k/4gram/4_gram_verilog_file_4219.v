// Seed: 1536441088
module module_0 (
    output wor id_0,
    output wire id_1,
    output wand id_2,
    output wand id_3,
    input uwire id_4,
    output uwire id_5,
    output wand id_6,
    output tri1 id_7,
    output supply0 id_8,
    input tri1 id_9,
    input tri id_10,
    input wand id_11,
    output wand id_12,
    input uwire id_13,
    input tri0 id_14,
    input tri0 id_15,
    output tri id_16,
    output supply1 id_17,
    input uwire id_18,
    input uwire id_19
);
  wire id_21;
  assign id_16 = id_14;
  id_22(
      .id_0(1), .id_1(id_15 - id_1)
  );
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    output wand id_5
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_5,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_0,
      id_5,
      id_4,
      id_1,
      id_3
  );
endmodule
