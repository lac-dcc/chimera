// Seed: 2303757739
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    input uwire id_5,
    output tri1 id_6,
    output wire id_7,
    input uwire id_8,
    output tri0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    input uwire id_12,
    input wire id_13,
    input tri0 id_14,
    output uwire id_15,
    input wor id_16,
    input supply0 id_17,
    output wand id_18
);
  id_20(
      .id_0(id_12), .id_1(id_12 || 1), .id_2(1)
  );
  assign id_9 = (id_16);
  assign id_6 = id_3;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output wand id_3,
    input uwire id_4,
    output wand id_5,
    input uwire id_6,
    output tri id_7,
    input tri id_8,
    input uwire id_9,
    output tri0 id_10,
    input supply0 id_11,
    input wand id_12,
    output wire id_13
);
  supply0 id_15 = id_2, id_16;
  module_0(
      id_6,
      id_10,
      id_15,
      id_1,
      id_1,
      id_1,
      id_15,
      id_5,
      id_15,
      id_16,
      id_12,
      id_8,
      id_6,
      id_11,
      id_1,
      id_15,
      id_0,
      id_6,
      id_13
  );
endmodule
