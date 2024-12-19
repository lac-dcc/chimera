// Seed: 1315334313
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    output uwire id_7,
    output tri0  id_8
);
  tri0 id_10 = id_3, id_11;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    output wor id_3,
    output tri1 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    input supply1 id_9,
    input tri id_10,
    output supply1 id_11
);
  always @(id_8 or id_1) begin : LABEL_0
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_5,
      id_10,
      id_4,
      id_8,
      id_6,
      id_7,
      id_8,
      id_3,
      id_11
  );
  assign modCall_1.type_1 = 0;
endmodule
