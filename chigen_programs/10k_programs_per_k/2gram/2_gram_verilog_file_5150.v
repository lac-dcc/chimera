// Seed: 2413149951
module module_0 (
    input  tri1 id_0,
    input  tri  id_1,
    input  wand id_2,
    output wor  id_3,
    output tri  id_4
);
  assign id_4 = 1'b0;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9 = id_8;
endmodule
module module_1 (
    output wor   id_0,
    input  tri0  id_1,
    output logic id_2,
    input  tri0  id_3
);
  assign id_2 = 1;
  always id_2 <= {id_3 + id_1{1 ? id_3 : 1}} | 1;
  assign id_0 = id_3;
  nand primCall (id_2, id_3, id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule
