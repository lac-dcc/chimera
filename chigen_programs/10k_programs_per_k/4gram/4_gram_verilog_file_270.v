// Seed: 71831453
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input wire id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply0 id_8,
    input wand id_9,
    input supply0 id_10,
    output tri0 id_11,
    output wor id_12,
    output wor id_13,
    output wire id_14
);
  assign id_11 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    output supply0 id_2,
    input wire id_3,
    output wor id_4,
    output supply1 id_5,
    input tri id_6,
    output tri1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input supply1 id_10
);
  id_12(
      .id_0(id_0), .id_1(id_6), .id_2(1)
  );
  module_0 modCall_1 (
      id_5,
      id_10,
      id_8,
      id_8,
      id_6,
      id_10,
      id_3,
      id_7,
      id_6,
      id_0,
      id_0,
      id_1,
      id_5,
      id_7,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
