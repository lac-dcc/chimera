// Seed: 4014851317
module module_0 (
    output wand id_0,
    output tri id_1,
    input tri1 id_2,
    input wor id_3,
    output tri id_4,
    output supply1 id_5
);
  id_7(
      .id_0(id_1 >> id_4), .id_1(id_0), .id_2(1), .id_3(1)
  );
  module_2 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.id_2  = 0;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output wire id_0,
    input  wand id_1
);
  assign id_0 = id_1 - 1;
  tri id_3;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0
  );
endmodule
module module_2 (
    input  uwire id_0,
    output wor   id_1,
    output wor   id_2,
    input  tri   id_3,
    output uwire id_4
);
  id_6 :
  assert property (@(posedge id_6) 1)
  else id_4 = 1 - 1;
  id_7(
      .id_0(id_0), .id_1("")
  );
endmodule
