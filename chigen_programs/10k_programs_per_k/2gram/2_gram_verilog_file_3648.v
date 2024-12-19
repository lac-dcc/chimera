// Seed: 1221574848
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input supply0 id_2
);
  assign id_0 = id_2;
  wor id_4;
  not primCall (id_0, id_2);
  module_2 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_2,
      id_2,
      id_4
  );
  assign modCall_1.type_8 = 0;
  assign id_4 = id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    output supply1 id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 (
    input supply1 id_0,
    output wand id_1,
    input uwire id_2,
    input wand id_3,
    input tri0 id_4,
    input tri1 id_5
);
  id_7 :
  assert property (@(posedge (1) && 1 * 1 ^ id_4 ? 1 : id_3) 1'b0)
  else;
endmodule
