// Seed: 47129425
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output wire id_5,
    input wire id_6,
    output tri id_7,
    output tri0 id_8
    , id_11,
    output supply1 id_9
);
  tri0 id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19 = 1;
  wire id_20;
  assign id_1 = 1 || "";
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6,
    input wand id_7,
    output tri id_8,
    output uwire id_9,
    input uwire id_10,
    output wor id_11,
    output wor id_12,
    input uwire id_13,
    output supply1 id_14
);
  wire id_16;
  wire id_17;
  id_18(
      .id_0(1'd0 - id_7),
      .id_1(id_13),
      .id_2(1),
      .id_3(1),
      .id_4(id_10),
      .id_5(1),
      .id_6(1),
      .id_7(id_13 % 1 == id_6),
      .id_8(id_4)
  );
  module_0 modCall_1 (
      id_4,
      id_11,
      id_14,
      id_2,
      id_2,
      id_3,
      id_4,
      id_5,
      id_11,
      id_5
  );
  assign modCall_1.id_3 = 0;
  assign id_11 = 1;
  wire id_19;
endmodule
