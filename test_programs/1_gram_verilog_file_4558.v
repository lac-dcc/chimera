// Seed: 88725849
module module_0 (
    input  uwire id_0,
    input  wire  id_1,
    input  tri   id_2,
    output wand  id_3,
    input  tri   id_4,
    input  tri1  id_5,
    output tri1  id_6,
    output wand  id_7,
    output wor   id_8#(.id_14(1), .id_15(-1'b0), .id_16(1)),
    input  wire  id_9,
    input  tri   id_10,
    output uwire id_11,
    id_17,
    input  wand  id_12
);
  tri id_18 = id_0;
  assign id_16 = id_5;
  assign module_1.id_4 = 0;
  wire id_19;
endmodule
module module_1 (
    input  wor   id_0,
    output wor   id_1,
    output logic id_2,
    input  logic id_3,
    output tri0  id_4
);
  initial @(id_0) id_2 <= id_3;
  not primCall (id_4, id_0);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_1,
      id_4,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
endmodule
