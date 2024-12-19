// Seed: 1593196334
module module_0 (
    output supply0 id_0,
    input wire id_1,
    input wor id_2,
    output supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    input wor id_7,
    input tri0 id_8,
    output tri1 id_9,
    output tri0 id_10,
    input wire id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wand id_14,
    input supply1 id_15
);
  integer id_17, id_18;
  wor id_19;
  id_20(
      .id_0((1) == id_19), .id_1(id_10), .id_2(id_19)
  );
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    output supply0 id_3,
    input wor id_4,
    input uwire id_5,
    input wand id_6,
    input wor id_7,
    input tri id_8,
    input supply0 id_9,
    output wand id_10,
    input uwire id_11,
    output tri0 id_12,
    input supply1 id_13
);
  logic [7:0] id_15;
  assign id_15[""] = id_7 - 1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_3,
      id_9,
      id_4,
      id_7,
      id_4,
      id_4,
      id_12,
      id_1,
      id_7,
      id_7,
      id_8,
      id_8,
      id_11
  );
  assign modCall_1.type_5 = 0;
endmodule
