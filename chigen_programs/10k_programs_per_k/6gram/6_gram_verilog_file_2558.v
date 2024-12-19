// Seed: 3632466584
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wor id_2,
    input tri1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input uwire id_6,
    output wor id_7,
    output uwire id_8,
    input wire id_9,
    output uwire id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    input tri0 id_14,
    output supply0 id_15,
    input tri1 id_16,
    input tri1 id_17,
    output wor id_18,
    output supply1 id_19
);
  wire id_21;
  id_22(
      .id_0(id_13),
      .id_1(id_5),
      .id_2(1'h0),
      .id_3(1'h0),
      .id_4(1'b0),
      .id_5(1),
      .id_6(id_19 == 1),
      .id_7(id_14)
  );
  assign id_10 = 1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    output uwire id_3,
    output tri1 id_4,
    output wor id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    input wor id_9,
    output tri id_10,
    output wire id_11,
    input wor id_12,
    inout wor id_13,
    input supply1 id_14,
    input wor id_15
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_15,
      id_9,
      id_10,
      id_1,
      id_1,
      id_1,
      id_8,
      id_4,
      id_5,
      id_15,
      id_3,
      id_6,
      id_9,
      id_13,
      id_1,
      id_11,
      id_0,
      id_13,
      id_13,
      id_7
  );
  assign modCall_1.type_8 = 0;
  wire id_17;
endmodule
