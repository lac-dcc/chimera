// Seed: 3176291367
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wire id_6,
    input wire id_7,
    input tri1 id_8,
    input tri0 id_9,
    input tri id_10,
    output tri id_11,
    input uwire id_12,
    input uwire id_13,
    input wire id_14,
    output supply1 id_15,
    input supply1 id_16,
    input wor id_17,
    input wand id_18
    , id_23,
    output supply0 id_19,
    input wand id_20,
    output tri id_21
);
  assign id_11 = id_12;
  generate
    if (id_9)
      if (1 * id_23) begin : LABEL_0
        wire id_24;
        always_comb @(posedge !id_16);
      end else wire id_25, id_26, id_27, id_28;
  endgenerate
  assign id_1 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wor id_3
    , id_15,
    input tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wor id_7,
    input tri1 id_8,
    input wand id_9,
    input supply1 id_10,
    output tri1 id_11,
    output uwire id_12,
    input supply1 id_13
);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_9,
      id_4,
      id_0,
      id_4,
      id_1,
      id_5,
      id_9,
      id_7,
      id_10,
      id_8,
      id_8,
      id_11,
      id_4,
      id_3,
      id_4,
      id_7,
      id_10,
      id_12
  );
  assign modCall_1.id_18 = 0;
  wire id_16;
endmodule
