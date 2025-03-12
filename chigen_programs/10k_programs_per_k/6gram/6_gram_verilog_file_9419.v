// Seed: 2368343489
module module_0 (
    input  tri1  id_0,
    output wand  id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri   id_4,
    output wand  id_5,
    input  uwire id_6,
    input  wire  id_7,
    input  tri0  id_8,
    input  wor   id_9,
    output uwire id_10,
    output tri1  id_11
);
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input tri id_2,
    output logic id_3,
    input supply1 id_4,
    output uwire id_5,
    output logic id_6,
    input wand id_7,
    input supply0 id_8,
    output wand id_9,
    input tri0 id_10,
    output tri1 id_11
);
  always @(posedge id_2 or id_8) begin : LABEL_0
    id_3 <= id_1;
    id_6 <= -1;
  end
  module_0 modCall_1 (
      id_10,
      id_11,
      id_8,
      id_8,
      id_1,
      id_5,
      id_4,
      id_7,
      id_1,
      id_0,
      id_9,
      id_11
  );
  assign modCall_1.id_10 = 0;
endmodule
