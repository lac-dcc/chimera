// Seed: 1901305465
module module_0 (
    inout wire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    input wand id_7,
    input tri id_8,
    input wor id_9,
    input tri1 id_10
    , id_13,
    input wand id_11
);
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  wor   id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  wand  id_5,
    inout  tri0  id_6,
    output logic id_7,
    output logic id_8
);
  initial begin : LABEL_0
    id_7 <= 1;
    if (1'b0)
      if (id_5) begin : LABEL_0
        id_8 <= 1 | 1'b0 == 1;
      end
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1,
      id_0,
      id_6,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_4,
      id_0
  );
  wire id_10;
endmodule
