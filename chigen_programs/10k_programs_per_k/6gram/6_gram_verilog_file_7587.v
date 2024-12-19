// Seed: 2622053404
module module_0 (
    input wand id_0,
    input wor id_1,
    output tri0 id_2,
    input tri1 id_3,
    output uwire id_4,
    input wand id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wire id_8,
    output supply0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    output uwire id_12,
    output tri1 id_13,
    input supply1 id_14,
    output tri1 id_15,
    input supply0 id_16,
    input tri0 id_17,
    input tri0 id_18,
    input wor id_19,
    input tri id_20,
    input tri0 id_21,
    output tri id_22
);
  generate
    for (id_24 = 1; id_8; id_24 = 1) begin : LABEL_0
      id_25(
          1, id_21,
      );
    end
  endgenerate
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    output tri1 id_2,
    output tri1 id_3,
    output tri1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_4,
      id_0,
      id_1,
      id_4,
      id_0,
      id_1,
      id_3,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3
  );
endmodule
