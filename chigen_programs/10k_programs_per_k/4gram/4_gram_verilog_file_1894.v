// Seed: 1533503154
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
endmodule
module module_1;
  assign id_1 = 1 && 1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign id_2 = id_2;
  assign id_1 = id_2;
endmodule
module module_2 (
    input supply0 id_0,
    input tri id_1,
    input wor id_2,
    output wand id_3,
    output uwire id_4
);
  assign id_4 = 1;
endmodule
module module_3 (
    output wand  id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output wor   id_4,
    input  uwire id_5,
    input  wand  id_6,
    output logic id_7,
    input  tri0  id_8,
    input  tri0  id_9,
    input  wor   id_10
);
  assign id_7 = 1;
  always @(posedge id_6 or posedge 1) id_7 <= #id_6(1);
  nand primCall (id_7, id_9, id_8, id_2, id_5, id_3, id_6, id_10, id_1);
  module_2 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
