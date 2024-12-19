// Seed: 74557158
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri id_2,
    output tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    input wire id_6,
    output supply0 id_7,
    input uwire id_8
);
  wand id_10 = 1;
  wire id_11;
  id_12(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(1'b0), .id_5(1'b0), .id_6(id_11)
  );
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    output wire id_2
);
  id_4(
      .id_0(1), .id_1(id_1), .id_2(1)
  );
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.type_4 = 0;
endmodule
