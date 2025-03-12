// Seed: 4090801276
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    input tri0 id_6
);
  wire id_8;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  tri   id_2,
    output logic id_3,
    input  tri   id_4,
    output tri1  id_5
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_0,
      id_5,
      id_4
  );
  assign modCall_1.id_4 = 0;
  always_ff @(*) begin : LABEL_0
    if (-1) id_3 <= id_0;
    id_7;
  end
endmodule
