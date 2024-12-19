// Seed: 27402330
module module_0 (
    input  tri0 id_0,
    input  tri  id_1,
    input  wand id_2,
    output tri  id_3
);
  id_5(
      .id_0(id_0), .id_1(id_0), .id_2(1'b0), .id_3(1)
  );
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  wire  id_2,
    input  tri1  id_3,
    input  uwire id_4
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1
  );
  id_6(
      .id_0(1)
  );
endmodule
