// Seed: 1807164003
module module_0 (
    input wand id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri1 id_4,
    input supply1 id_5,
    output wand id_6,
    input wor id_7,
    input wand id_8,
    input tri0 id_9,
    output tri id_10,
    input tri0 id_11,
    input tri1 id_12
);
  assign id_4 = id_0 ? 1 : id_9;
  wire id_14;
  supply0 id_15 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    output uwire id_2,
    output wand id_3,
    output supply1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    input wor id_9,
    input tri1 id_10,
    input uwire id_11,
    input uwire id_12,
    output tri id_13,
    input wand id_14
);
  integer id_16 = id_7;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_14,
      id_3,
      id_13,
      id_1,
      id_2,
      id_12,
      id_14,
      id_16,
      id_3,
      id_8,
      id_9
  );
  assign modCall_1.type_18 = 0;
endmodule
