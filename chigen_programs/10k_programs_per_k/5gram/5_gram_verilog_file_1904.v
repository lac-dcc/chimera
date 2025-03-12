// Seed: 3512634461
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  wire  id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output tri1  id_8
);
  wire id_10;
  assign id_8 = -1 & 1;
  assign id_2 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    output tri1  id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  tri1  id_5,
    output logic id_6,
    input  tri1  id_7,
    output tri0  id_8
);
  always @(posedge id_5 or posedge 1) begin : LABEL_0
    id_6 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_3,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0
  );
  assign modCall_1.id_8 = 0;
  logic [-1 : 1] id_10;
endmodule
