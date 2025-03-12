// Seed: 223419011
module module_0 (
    output wire id_0,
    input  tri1 id_1,
    output tri1 id_2,
    input  wire id_3,
    input  tri0 id_4
);
  assign id_0 = 1;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    output tri0  id_2,
    input  uwire id_3,
    output uwire id_4,
    input  tri1  id_5,
    input  wire  id_6,
    input  uwire id_7,
    output uwire id_8,
    output tri   id_9,
    output wand  id_10
);
  parameter id_12 = -1;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_5,
      id_6
  );
  assign modCall_1.id_1 = 0;
  wire id_13;
  ;
  always @(posedge id_13) begin : LABEL_0
    assert (1) $clog2(57);
    ;
    id_0 = -1;
  end
endmodule
