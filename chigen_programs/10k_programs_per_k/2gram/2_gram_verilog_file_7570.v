// Seed: 611673414
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    output wor id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri1 id_8
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    output wand id_6,
    output tri id_7,
    input tri0 id_8,
    input wor id_9,
    output supply0 id_10,
    output tri0 id_11,
    output tri0 id_12,
    input wand id_13,
    input uwire id_14,
    input supply1 id_15,
    input tri id_16,
    input wire id_17
);
  wire id_19 = ~id_3;
  id_20(
      .id_0(id_5), .id_1(1)
  );
  nand primCall (id_11, id_16, id_8, id_13, id_2, id_17, id_19, id_3, id_0, id_14);
  module_0 modCall_1 (
      id_15,
      id_1,
      id_15,
      id_4,
      id_3,
      id_2,
      id_13,
      id_9,
      id_15
  );
endmodule
