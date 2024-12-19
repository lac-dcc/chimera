// Seed: 4053049737
module module_0 (
    input  uwire id_0,
    output uwire id_1,
    input  tri   id_2,
    output wand  id_3,
    input  wor   id_4,
    output wor   id_5,
    input  uwire id_6,
    input  uwire id_7
);
  logic [7:0] id_9;
  id_10 :
  assert property (@(posedge id_0 + 1) id_9[1] ? 1'b0 : id_2)
  else $display;
  assign module_1.type_0 = 0;
  id_11(
      .id_0(id_4), .id_1(1), .id_2(id_2)
  );
  wire id_12;
  assign id_1 = id_2;
  wire id_13;
  id_14(
      .id_0(id_4), .id_1(1), .id_2(1), .id_3(id_2)
  );
endmodule
module module_1 (
    input  tri  id_0,
    output wand id_1,
    output wire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule
