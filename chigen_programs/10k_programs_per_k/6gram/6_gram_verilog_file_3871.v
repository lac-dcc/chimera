// Seed: 1478172792
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_6(
      .id_0(), .id_1()
  );
  wire id_7 = ~id_2;
  wire id_8;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri   id_0
    , id_11,
    input  wand  id_1,
    output uwire id_2,
    output uwire id_3,
    input  wor   id_4,
    input  wor   id_5,
    output uwire id_6,
    output uwire id_7,
    input  wire  id_8,
    output wor   id_9
);
  xnor primCall (id_6, id_1, id_0, id_12, id_5, id_11, id_4, id_8);
  logic [7:0] id_12;
  assign id_12[1'b0] = 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
endmodule
