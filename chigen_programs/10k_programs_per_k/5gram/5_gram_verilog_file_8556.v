// Seed: 3580305070
module module_0 (
    output logic id_0,
    input tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input wor id_5,
    input tri1 id_6,
    input wand id_7,
    output uwire id_8
);
  integer id_10;
  localparam id_11 = (1 * 1 - ~1 & -1);
  parameter id_12 = $realtime && -1;
  assign module_1.id_2 = 0;
  localparam id_13 = id_12 == id_12[1];
  generate
    for (id_14 = -1; id_11; id_0 = id_13) begin : LABEL_0
      assign id_10 = -1'b0;
    end
  endgenerate
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    output wor   id_2,
    output tri   id_3
);
  initial begin : LABEL_0
    if (1 * -1)
      if (1)
        assume (1 == {id_0, 1'b0});
        else id_1 = id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2
  );
endmodule
