// Seed: 1682368135
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    input wand id_7
);
  id_9(
      .id_0(1),
      .id_1(id_3),
      .id_2(1'b0),
      .id_3(id_7),
      .id_4(1 - id_0),
      .id_5(1'd0),
      .id_6(1),
      .id_7(1),
      .id_8(id_5),
      .id_9((1'b0)),
      .id_10(1)
  );
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri id_2
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
