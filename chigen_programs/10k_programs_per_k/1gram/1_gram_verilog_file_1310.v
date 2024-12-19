// Seed: 761810641
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input tri id_4,
    input uwire id_5
);
  wire id_7;
  module_2 modCall_1 (
      id_3,
      id_5
  );
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input wand id_2,
    input wire id_3
);
  initial id_5 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_1
  );
endmodule
module module_2 (
    input tri1 id_0,
    input wor  id_1
);
  supply0 id_3;
  id_4(
      1, 1'b0, 1 - 1 & id_0 & id_3, 1, id_0
  );
  assign module_0.type_0 = 0;
  supply0 id_5;
  assign id_4 = 1;
  id_6(
      id_6, id_3 + id_5, 1, 1
  );
  genvar id_7;
  id_8 :
  assert property (@(id_0 or id_3) !1) id_4 = id_0;
endmodule
