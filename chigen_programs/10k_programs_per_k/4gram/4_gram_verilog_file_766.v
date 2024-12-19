// Seed: 3544079500
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    input  wand id_2,
    output tri0 id_3,
    input  tri0 id_4,
    input  wand id_5
);
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output tri id_3
);
  id_5(
      .id_0(id_2 || id_1), .id_1(!1)
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.type_7 = 0;
  id_6 :
  assert property (@(negedge 1) 1)
  else $display;
  id_8(
      .id_0(), .id_1(id_3)
  );
endmodule
