// Seed: 3677760766
module module_0 (
    output tri0 id_0,
    output wor  id_1,
    output tri0 id_2,
    input  tri0 id_3,
    output wand id_4
);
  always @(*)
    for (id_4 = id_3; id_3; id_0 = id_3) begin : LABEL_0
      cover (1);
    end
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    output tri0  id_1,
    output logic id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  uwire id_7,
    output wire  id_8
);
  reg  id_10;
  wire id_11;
  always @(*) begin : LABEL_0
    id_2 <= id_10;
  end
  module_0 modCall_1 (
      id_8,
      id_8,
      id_1,
      id_6,
      id_8
  );
endmodule
