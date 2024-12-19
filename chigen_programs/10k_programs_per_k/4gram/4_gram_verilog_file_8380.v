// Seed: 1358164097
module module_0 (
    input wor id_0,
    input tri id_1,
    input uwire id_2,
    input supply1 id_3,
    output wire id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wand id_7,
    input supply1 id_8,
    input wand id_9
);
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    output wire id_3,
    input supply1 id_4,
    input wor id_5
);
  id_7(
      .id_0(1'b0), .id_1(1), .id_2(id_3 << 1), .id_3(1'b0), .id_4(1'h0)
  );
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_4,
      id_3,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.id_8 = 0;
endmodule
