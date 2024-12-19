// Seed: 800742934
module module_0 (
    output wor id_0,
    output supply0 id_1,
    output tri id_2,
    input supply1 id_3,
    output tri1 id_4,
    output uwire id_5,
    input wor id_6,
    input wor id_7,
    input wor id_8,
    output tri0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    input wire id_12
    , id_22,
    input supply1 id_13,
    output supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    output wor id_17,
    output tri1 id_18,
    input tri1 id_19,
    input supply1 id_20
);
  wire id_23;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1
);
  tri0 id_3 = id_1;
  always @(1 or posedge id_1) begin : LABEL_0
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_2 = 0;
  wire id_4;
endmodule
