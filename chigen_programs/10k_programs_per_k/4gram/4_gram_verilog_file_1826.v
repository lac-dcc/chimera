// Seed: 70908593
module module_0 (
    output tri0 id_0,
    input  tri1 id_1,
    output tri  id_2,
    output wand id_3
);
  module_2 modCall_1 (id_1);
  assign modCall_1.id_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    input supply1 id_0
);
  logic [7:0] id_2;
  id_3(
      .id_0(1), .id_1(id_0), .id_2(id_0), .id_3((id_2)), .id_4(1), .id_5(1), .id_6(1), .id_7(id_0)
  );
  assign id_2 = id_2[1];
endmodule
