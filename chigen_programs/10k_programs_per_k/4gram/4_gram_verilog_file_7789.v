// Seed: 2308381462
module module_0 (
    input  wand id_0,
    output tri  id_1
);
  rpmos (1, 1);
  assign module_2.type_3 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    output wor  id_1,
    output wand id_2
);
  assign id_1 = 1;
  not primCall (id_1, id_0);
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    output supply1 id_1,
    output wire id_2,
    output wand id_3,
    input tri id_4,
    output supply1 id_5,
    inout supply0 id_6,
    input supply1 id_7,
    input supply1 id_8
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6
  );
  id_12(
      .id_0(id_1), .id_1(id_4), .id_2((1)), .id_3(1), .id_4(""), .id_5(""), .id_6(1'h0), .id_7(id_6)
  );
endmodule
