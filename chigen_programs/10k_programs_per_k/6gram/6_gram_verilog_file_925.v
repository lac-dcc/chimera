// Seed: 4056575962
module module_0 (
    input  uwire id_0
    , id_20,
    input  tri0  id_1,
    input  wire  id_2,
    output uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  tri1  id_7,
    input  tri0  id_8,
    input  uwire id_9,
    input  wire  id_10,
    input  tri0  id_11,
    output uwire id_12,
    input  tri0  id_13,
    output tri   id_14,
    output wire  id_15,
    input  tri   id_16,
    input  wor   id_17,
    output uwire id_18
);
  always @(id_7 == 1) begin : LABEL_0
    id_3 = 1;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input logic id_2,
    output tri0 id_3,
    input wand id_4,
    output logic id_5,
    input supply0 id_6,
    input uwire id_7,
    output tri id_8
);
  id_10(
      id_4, 1, 1, 1
  );
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_8,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_8,
      id_1,
      id_8,
      id_3,
      id_7,
      id_7,
      id_3
  );
  assign modCall_1.id_16 = 0;
  always @(posedge 1) begin : LABEL_0
    id_5 <= id_2;
  end
endmodule
