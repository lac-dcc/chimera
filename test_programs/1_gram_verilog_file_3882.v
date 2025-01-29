// Seed: 3838409091
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wire id_2,
    output wire id_3,
    output wand id_4,
    input tri0 id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri id_10
);
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    output tri0  id_2,
    input  uwire id_3,
    output wire  id_4,
    output tri0  id_5,
    input  uwire id_6,
    output tri0  id_7,
    output uwire id_8,
    input  wire  id_9,
    output uwire id_10,
    input  uwire id_11,
    input  wor   id_12,
    input  tri0  id_13,
    input  wor   id_14
);
  genvar id_16;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_2,
      id_5,
      id_5,
      id_3,
      id_11,
      id_12,
      id_14,
      id_14,
      id_12
  );
  assign modCall_1.id_5 = 0;
  id_17 :
  assert property (@(negedge id_6) 1'h0) begin : LABEL_0
    id_4 = id_12;
  end
endmodule
