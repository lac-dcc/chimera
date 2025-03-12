// Seed: 2729302358
module module_0 ();
  logic id_1;
  assign module_1.id_2 = 0;
  always @(id_1) begin : LABEL_0
    id_1 = -1;
  end
endmodule
module module_1;
  localparam id_1 = 1;
  wand id_2 = 1'h0, id_3;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wand  id_0,
    input  tri   id_1,
    input  tri   id_2,
    input  tri   id_3,
    output wire  id_4,
    output wor   id_5,
    input  wand  id_6,
    output wire  id_7,
    input  uwire id_8,
    output tri   id_9,
    input  wand  id_10,
    output wand  id_11
);
endmodule
module module_3 (
    input  tri0  id_0,
    output wand  id_1,
    output uwire id_2,
    input  wire  id_3,
    input  tri   id_4,
    output wor   id_5,
    output wor   id_6
);
  wire id_8 = id_0;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_6,
      id_0,
      id_6,
      id_3,
      id_5,
      id_0,
      id_5
  );
endmodule
