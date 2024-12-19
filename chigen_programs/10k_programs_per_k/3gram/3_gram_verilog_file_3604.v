// Seed: 3544430066
module module_0 (
    input tri id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wand id_3,
    output uwire id_4,
    output uwire id_5,
    output wand id_6,
    output supply0 id_7,
    input supply0 id_8,
    input uwire id_9,
    output supply1 id_10,
    input wand id_11
);
  always disable id_13;
  id_14(
      .id_0(id_9 < 1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_13),
      .id_4(1'b0 == 1),
      .id_5(id_0),
      .id_6(id_2),
      .id_7(id_1),
      .id_8(id_0),
      .id_9(),
      .id_10(1)
  );
  assign id_1 = 1;
  wire id_15;
  tri0 id_16 = 1;
  assign id_16 = id_0;
endmodule
module module_1 (
    output logic id_0,
    output supply1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5
);
  always id_0 = #id_7 1;
  always @(id_7) id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_3,
      id_2,
      id_2,
      id_1,
      id_1,
      id_5,
      id_5,
      id_2,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
