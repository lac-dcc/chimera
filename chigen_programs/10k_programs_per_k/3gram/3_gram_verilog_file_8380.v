// Seed: 1254310863
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output tri id_2,
    output wor id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    output wor id_8
);
  wire id_10;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    output wire id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    input supply0 id_6
);
  wire id_8;
  wire id_9;
  id_11(
      .id_0(id_8),
      .id_1(id_3),
      .id_2(1),
      .id_3(1),
      .id_4(id_5),
      .id_5((id_3)),
      .id_6(),
      .id_7(id_4),
      .id_8(1'b0)
  );
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
