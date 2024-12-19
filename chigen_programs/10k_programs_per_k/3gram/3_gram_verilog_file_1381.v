// Seed: 1839285291
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output tri id_3,
    output wand id_4,
    output supply1 module_0,
    input supply0 id_6,
    input wor id_7,
    output wire id_8,
    output wand id_9,
    output tri id_10,
    output uwire id_11,
    input uwire id_12,
    input wor id_13,
    output wor id_14,
    output tri1 id_15
);
  id_17(
      .id_0(id_4 * 1'h0),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1 - 1'b0),
      .id_7(1)
  );
  tri id_18;
  assign id_4 = 1;
  wire id_19;
  assign id_18 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wire id_3,
    output uwire id_4
);
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_0,
      id_4,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.type_0 = 0;
endmodule
