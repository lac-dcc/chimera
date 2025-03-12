// Seed: 700349820
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    output tri0  id_2,
    output uwire id_3
);
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output logic id_2,
    input  tri1  id_3,
    output tri1  id_4,
    output tri0  id_5,
    output wand  id_6,
    input  wand  id_7,
    output wire  id_8,
    output uwire id_9,
    output wand  id_10,
    input  wand  id_11,
    output logic id_12,
    output tri1  id_13,
    input  tri   id_14
);
  wire id_16 = id_3;
  module_0 modCall_1 (
      id_14,
      id_3,
      id_10,
      id_5
  );
  assign modCall_1.id_0 = 0;
  always @(1) begin : LABEL_0
    id_2  <= id_1 - 1;
    id_12 <= id_7;
  end
endmodule
