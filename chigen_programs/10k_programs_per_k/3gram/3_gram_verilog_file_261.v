// Seed: 2304210916
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5,
    output wor id_6,
    output uwire id_7,
    input wor id_8,
    input tri1 id_9
);
  wand id_11;
  ;
  assign id_11 = 1;
  parameter id_12 = -1;
  parameter id_13 = 1;
endmodule
module module_1 (
    output tri   id_0,
    input  wor   id_1,
    input  uwire id_2
);
  always @(posedge 1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
