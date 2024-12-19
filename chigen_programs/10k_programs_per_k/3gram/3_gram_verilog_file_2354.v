// Seed: 3353118965
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  wire  id_3,
    input  tri   id_4,
    output tri0  id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output tri   id_8,
    input  wire  id_9,
    input  uwire id_10
);
  wire id_12, id_13, id_14, id_15, id_16;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wand  id_1,
    output wand  id_2,
    output tri0  id_3,
    output logic id_4,
    input  tri0  id_5
);
  always @(posedge id_0) begin : LABEL_0
    id_3 = id_5;
    id_4 <= 1;
  end
  wire id_7;
  wire id_8, id_9;
  tri0 id_10 = 1;
  wire id_11;
  wire id_12;
  integer id_13;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
