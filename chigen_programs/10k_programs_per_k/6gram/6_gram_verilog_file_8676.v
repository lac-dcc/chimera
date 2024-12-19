// Seed: 2119805126
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    output wand  id_2
);
  id_4(
      .id_0(id_1),
      .id_1(id_2 + id_1),
      .id_2(1),
      .id_3(id_2),
      .id_4(~id_2 | id_1 + 1),
      .id_5(1),
      .id_6(1'd0 == 1),
      .id_7((id_1)),
      .id_8(1)
  );
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    input  tri  id_1,
    output tri1 id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0
  );
  id_8(
      .id_0({1, 1} == 1), .id_1(1)
  );
  assign id_0 = 1 == id_1;
endmodule
