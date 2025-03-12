// Seed: 196124849
module module_0 (
    output logic id_0,
    input  uwire id_1,
    output logic id_2
);
  integer id_4 = 1'h0;
  assign id_2 = id_4;
  initial begin : LABEL_0
    id_0 = -1;
  end
  always_comb @(negedge id_1) begin : LABEL_1
    id_2 <= 1;
    id_0 = 1;
    assert (id_1);
  end
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    output logic id_2,
    input  wire  id_3,
    input  wor   id_4,
    output tri0  id_5,
    input  wand  id_6,
    input  tri1  id_7,
    input  wand  id_8,
    input  wire  id_9,
    input  wire  id_10
);
  always @(posedge id_4 - -1 or posedge id_3) id_2 <= -1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
