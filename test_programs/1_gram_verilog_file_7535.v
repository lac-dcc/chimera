// Seed: 3036071221
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input wor id_2,
    output supply0 id_3,
    input wor id_4,
    output wire id_5,
    output supply0 id_6,
    input wor id_7,
    input supply1 id_8,
    output tri id_9,
    output uwire id_10
);
  module_2 modCall_1 ();
  assign modCall_1.type_4 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
  wire id_4, id_5;
endmodule
program module_2;
  wand id_2;
  id_3(
      id_2, {-1, -1'b0}
  );
endmodule
