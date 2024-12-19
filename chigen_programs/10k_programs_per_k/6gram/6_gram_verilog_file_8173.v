// Seed: 912643462
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output uwire id_7,
    output tri id_8,
    input wor id_9,
    input wand id_10,
    input supply0 id_11,
    input wor id_12,
    output wand id_13,
    input supply1 id_14,
    input uwire id_15,
    output supply1 id_16,
    output tri0 id_17,
    output supply0 id_18,
    output wire id_19,
    output tri1 id_20,
    input wand id_21,
    input uwire id_22,
    input wor id_23,
    input tri0 id_24,
    input tri1 id_25,
    input wand id_26,
    output tri0 id_27,
    input tri0 id_28,
    input tri0 id_29,
    input wor id_30,
    input tri id_31,
    output tri0 id_32,
    output tri id_33
);
  assign id_1 = 1 < id_14;
  integer id_35 (
      id_1,
      1,
      !id_10
  );
  assign id_27 = 1 ? 1 : 1;
  integer id_36 (
      .id_0(1'b0),
      .id_1(id_9),
      .id_2(1),
      .id_3(1),
      .id_4(id_18)
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    input supply1 id_9,
    input wand id_10
);
  assign id_1 = 1;
  assign id_1 = id_7 !== 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_7,
      id_9,
      id_7,
      id_2,
      id_10,
      id_1,
      id_1,
      id_10,
      id_10,
      id_8,
      id_6,
      id_1,
      id_4,
      id_9,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_9,
      id_9,
      id_3,
      id_6,
      id_6,
      id_5,
      id_1,
      id_2,
      id_10,
      id_3,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
