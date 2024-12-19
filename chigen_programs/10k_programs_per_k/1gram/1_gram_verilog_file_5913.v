// Seed: 1557229090
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    output tri0 id_2,
    output tri id_3,
    input tri id_4,
    output uwire id_5,
    output uwire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  id_12(
      1
  );
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    output wor id_5,
    output supply0 id_6,
    input wire id_7,
    input tri0 id_8,
    output tri id_9,
    input wand id_10,
    input tri0 id_11,
    input uwire id_12,
    input tri0 id_13
    , id_20,
    output wor id_14,
    output tri0 id_15,
    input tri1 id_16,
    input supply1 id_17,
    input tri1 id_18
);
  id_21(
      .id_0(1), .id_1(1), .id_2(1 && id_11)
  );
  xnor primCall (
      id_14,
      id_11,
      id_7,
      id_3,
      id_20,
      id_8,
      id_21,
      id_10,
      id_22,
      id_18,
      id_16,
      id_23,
      id_1,
      id_13,
      id_12,
      id_2,
      id_17,
      id_4
  );
  wire id_22, id_23;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_5,
      id_6,
      id_11,
      id_0,
      id_14,
      id_6,
      id_2,
      id_10,
      id_11
  );
  assign modCall_1.id_5 = 0;
endmodule
