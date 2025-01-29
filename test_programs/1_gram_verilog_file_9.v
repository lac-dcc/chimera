// Seed: 3397604995
module module_0 (
    output supply1 id_0,
    output wand void id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wor id_4,
    input wor id_5,
    input tri1 id_6
);
  wire id_8;
  assign id_4 = id_5;
  assign id_1 = id_5;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  wand  id_4,
    output wor   id_5,
    input  uwire id_6,
    input  wand  id_7,
    output tri0  id_8,
    input  tri0  id_9,
    input  wor   id_10,
    input  tri   id_11,
    input  tri0  id_12,
    input  tri   id_13
);
  id_15 :
  assert property (@(posedge 1 or posedge -1) 1) @* id_1 <= -1;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_5,
      id_4,
      id_2,
      id_4,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
