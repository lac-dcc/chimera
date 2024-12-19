// Seed: 3174668880
module module_0 (
    output wor id_0,
    output tri id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wand id_5
);
  assign id_5 = 1;
  id_7(
      .id_0(1),
      .id_1(id_3),
      .id_2(id_2 != 1),
      .id_3(1),
      .id_4(1'h0),
      .id_5(id_0),
      .id_6("" || ~1 + id_4),
      .id_7(id_5),
      .id_8(id_2 == 1),
      .id_9(1),
      .id_10(id_5),
      .id_11(1'b0)
  );
  assign id_1 = 1;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    input tri id_5,
    output supply1 id_6,
    input wire id_7,
    output uwire id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11,
    output uwire id_12,
    input tri id_13,
    output wand id_14,
    input wire id_15,
    input wor id_16
);
  initial id_0 = #1 1;
  xor primCall (id_14, id_13, id_16, id_7, id_1, id_2, id_11, id_10, id_15, id_3);
  module_0 modCall_1 (
      id_6,
      id_8,
      id_6,
      id_12,
      id_1,
      id_14
  );
  assign modCall_1.id_5 = 0;
endmodule
