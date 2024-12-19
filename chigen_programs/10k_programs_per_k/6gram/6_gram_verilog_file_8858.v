// Seed: 1966001817
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    output wand id_6,
    input tri id_7,
    output uwire id_8,
    input tri0 id_9,
    input tri1 id_10,
    input wor id_11,
    output tri id_12,
    input tri1 id_13,
    input tri0 id_14,
    input wor id_15,
    input wor id_16,
    input supply1 id_17,
    input wor id_18,
    input wand id_19,
    input tri0 id_20,
    output tri id_21,
    input tri0 id_22,
    input tri1 id_23
);
  always @(posedge id_4 or posedge 1) begin : LABEL_0
    wait (1'b0);
  end
endmodule
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output wor id_3,
    output tri id_4,
    input tri1 id_5,
    input supply0 id_6,
    input wand id_7,
    output tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input tri1 id_11,
    output tri module_1
);
  wire id_14;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_6,
      id_5,
      id_11,
      id_9,
      id_10,
      id_9,
      id_10,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_5,
      id_7,
      id_7,
      id_9,
      id_7,
      id_2,
      id_6,
      id_1,
      id_6,
      id_9
  );
  assign modCall_1.type_3 = 0;
endmodule
