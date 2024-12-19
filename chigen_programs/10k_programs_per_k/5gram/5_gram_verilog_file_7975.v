// Seed: 2056752143
module module_0 (
    input wand id_0,
    input wire id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    output tri id_8,
    input uwire id_9,
    input wor id_10
    , id_28,
    input supply1 id_11,
    input tri1 id_12,
    input tri id_13,
    output uwire id_14,
    output supply0 id_15,
    input supply1 id_16
    , id_29,
    input wire id_17,
    output wand id_18,
    output tri id_19,
    output supply1 id_20,
    output wor id_21,
    output wire id_22,
    input wire id_23,
    input wire id_24,
    output supply1 id_25,
    output tri0 id_26
);
  tri1 id_30 = id_29 > 1;
  id_31(
      .id_0(1), .id_1(1), .sum(id_9 ==? id_26)
  );
  assign id_22 = 1 ? id_30 : id_12;
  wire id_32;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    output tri id_2,
    input wor id_3,
    input tri0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input wire id_7,
    input tri0 id_8
);
  uwire id_10 = id_6;
  not primCall (id_5, id_10);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_1,
      id_4,
      id_0,
      id_6,
      id_10,
      id_10,
      id_8,
      id_7,
      id_0,
      id_10,
      id_0,
      id_10,
      id_2,
      id_7,
      id_3,
      id_5,
      id_10,
      id_5,
      id_10,
      id_1,
      id_0,
      id_8,
      id_2,
      id_5
  );
  assign modCall_1.id_26 = 0;
endmodule
