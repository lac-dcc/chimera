// Seed: 21767605
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    output supply1 id_5,
    output tri1 id_6,
    input supply1 id_7,
    input wand id_8,
    input tri id_9,
    output wor id_10,
    inout wand id_11
);
  wire id_13;
  assign id_5#(1) = 1;
  assign id_10 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    inout tri0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input wor id_5,
    input uwire id_6,
    input wand id_7,
    input tri1 id_8,
    output wire id_9,
    input supply0 id_10
);
  assign id_3 = ~id_7 == id_5 - 1 ? id_4 : id_0;
  id_12(
      .id_0(~id_7),
      .id_1(1 == id_7),
      .id_2(id_4),
      .id_3(id_8),
      .id_4(1),
      .id_5(id_2),
      .id_6(id_5),
      .id_7(id_10),
      .id_8(id_1),
      .id_9(1),
      .id_10(1),
      .id_11(1)
  );
  tri1 id_13 = id_0;
  wire id_14;
  assign id_3 = id_4 != 1;
  module_0 modCall_1 (
      id_3,
      id_13,
      id_6,
      id_7,
      id_5,
      id_9,
      id_3,
      id_5,
      id_4,
      id_2,
      id_13,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
