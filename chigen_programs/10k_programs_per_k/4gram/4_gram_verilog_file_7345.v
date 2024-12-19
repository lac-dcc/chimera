// Seed: 341536055
module module_0 (
    input wire id_0,
    output wand id_1,
    input tri id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input uwire id_9,
    output uwire id_10,
    input wor id_11,
    output wor id_12,
    input uwire id_13,
    input uwire id_14,
    input uwire id_15,
    output supply0 id_16,
    input tri id_17,
    input wor id_18,
    input tri id_19,
    output wor id_20,
    output tri1 id_21
);
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input wire id_9,
    input wire id_10,
    output wor id_11
);
  wand id_13 = {id_1{id_9}};
  id_14(
      .id_0(1), .id_1(id_1), .id_2(id_8), .id_3(id_13), .id_4(id_8)
  );
  module_0 modCall_1 (
      id_6,
      id_13,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4,
      id_2,
      id_13,
      id_2,
      id_11,
      id_1,
      id_0,
      id_4,
      id_11,
      id_1,
      id_4,
      id_1,
      id_13,
      id_13
  );
  assign modCall_1.id_1 = 0;
endmodule
