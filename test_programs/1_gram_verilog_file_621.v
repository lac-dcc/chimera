// Seed: 1566469276
module module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    output uwire id_3,
    output tri id_4,
    output wand id_5,
    output wire id_6,
    input wor id_7,
    output uwire id_8,
    input uwire id_9,
    id_23,
    input uwire id_10,
    output supply0 id_11,
    output tri id_12,
    input tri id_13,
    output supply1 id_14,
    id_24,
    input wire id_15,
    output wire id_16,
    output tri1 id_17,
    input supply0 id_18,
    input supply1 id_19,
    input wand id_20,
    output supply1 id_21
);
  wire id_25, id_26;
  assign id_23 = id_9;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply1 id_4
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_4,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_4,
      id_0,
      id_0,
      id_2,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.id_21 = 0;
  tri1 id_6;
  id_7(
      id_6, -1, -1'b0
  );
  assign id_6 = id_2;
endmodule
