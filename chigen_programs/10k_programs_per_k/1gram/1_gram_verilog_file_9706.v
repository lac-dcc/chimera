// Seed: 1781366099
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wand id_4,
    output uwire id_5,
    input supply0 id_6,
    output tri id_7,
    input tri0 id_8,
    input tri id_9,
    output supply0 id_10,
    output tri0 id_11,
    input wor id_12,
    output wor id_13,
    input supply0 id_14,
    input wand id_15,
    output wand id_16,
    output tri id_17,
    output wor id_18,
    input uwire id_19,
    output wor id_20
);
  assign id_13 = id_6;
  assign module_1.type_9 = 0;
  uwire id_22, id_23;
  assign id_11 = id_23;
  assign id_17 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output wand id_1
    , id_16 = (1),
    input wand id_2,
    input wire id_3
    , id_17,
    output tri0 id_4,
    input uwire id_5,
    input tri id_6,
    input wor id_7,
    input supply1 id_8
    , id_18 = id_18[1],
    output tri id_9,
    output supply1 id_10,
    output supply0 id_11,
    input wor id_12,
    input wor id_13,
    output tri0 id_14
);
  module_0 modCall_1 (
      id_7,
      id_2,
      id_6,
      id_2,
      id_4,
      id_10,
      id_6,
      id_10,
      id_6,
      id_5,
      id_10,
      id_4,
      id_6,
      id_1,
      id_0,
      id_8,
      id_1,
      id_10,
      id_11,
      id_12,
      id_9
  );
  always id_17[1] = id_8;
  assign id_1 = id_7;
  supply1 id_19, id_20 = id_3, id_21;
  assign id_1 = id_0;
  id_22(
      .sum(id_2), .id_0(id_17), .id_1(1), .id_2(id_11), .id_3(1'b0)
  );
endmodule
