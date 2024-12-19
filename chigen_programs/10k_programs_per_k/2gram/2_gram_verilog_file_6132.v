// Seed: 1489262339
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    input  tri  id_2,
    output tri0 id_3,
    input  tri  id_4
    , id_15,
    input  wand id_5,
    input  tri  id_6,
    input  tri0 id_7,
    input  tri0 id_8,
    input  tri  id_9,
    output wire id_10
    , id_16,
    input  tri  id_11,
    input  wire id_12,
    input  tri0 id_13
);
  for (id_17 = id_15; id_2; id_17 = id_15) begin : LABEL_0
    assign id_17 = id_12;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wire  id_0,
    input uwire id_1,
    inout wor   id_2,
    input wand  id_3,
    input tri0  id_4
);
  id_6 :
  assert property (@(posedge 1'b0 or posedge 1 - id_4) id_4)
  else;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_6,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_3
  );
endmodule
