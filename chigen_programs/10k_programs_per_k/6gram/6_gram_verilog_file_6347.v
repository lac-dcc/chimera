// Seed: 2403381041
module module_0 (
    input  tri1  id_0,
    output uwire id_1,
    output tri   id_2,
    input  uwire id_3,
    output uwire id_4,
    input  tri   id_5,
    output tri0  id_6,
    output wand  id_7,
    input  tri0  id_8,
    output tri   id_9,
    input  uwire id_10,
    output wand  id_11
);
  always @(posedge 1 or posedge id_0) begin : LABEL_0
    id_2 = 1 - id_8;
  end
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    output tri1 id_7
    , id_17,
    input supply1 id_8,
    input uwire id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12,
    input wor id_13,
    input tri id_14,
    output tri1 id_15
);
  assign id_17 = id_9;
  supply0 id_18 = 1;
  assign id_6 = id_4;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_6,
      id_2,
      id_15,
      id_13,
      id_6,
      id_7,
      id_11,
      id_17,
      id_5,
      id_15
  );
  assign modCall_1.id_10 = 0;
  wor id_19 = 1;
  assign id_6 = 1;
endmodule
