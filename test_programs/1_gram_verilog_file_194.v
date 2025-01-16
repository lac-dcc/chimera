// Seed: 3605968648
module module_0 (
    output wor   id_0,
    output uwire id_1,
    output uwire id_2,
    input  wor   id_3,
    output uwire id_4,
    input  uwire id_5,
    output uwire id_6
);
  wire id_8;
  nor primCall (id_2, id_8, id_5, id_3);
  module_2 modCall_1 (id_5);
  assign modCall_1.type_2 = 0;
  assign id_1 = id_3;
  parameter id_9 = id_9;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    output tri0 void id_3
);
  assign id_3 = -1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.type_2 = 0;
  wire id_5, id_6;
endmodule
module module_2 (
    input tri id_0
);
endmodule
