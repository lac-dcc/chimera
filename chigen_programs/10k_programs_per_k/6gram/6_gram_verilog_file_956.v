// Seed: 784675047
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri id_4,
    input wor id_5,
    input tri1 id_6,
    input supply1 id_7,
    output supply0 id_8,
    input wire id_9,
    input tri0 id_10,
    output tri id_11,
    input wand id_12,
    input tri0 id_13,
    input uwire id_14,
    input tri0 id_15,
    output wor id_16,
    input tri0 id_17,
    output logic id_18
);
  always @(negedge -1) begin : LABEL_0
    id_18 <= (id_13);
  end
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output logic id_3
    , id_19,
    output tri0 id_4,
    input supply0 id_5,
    input wire id_6,
    input supply1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input supply0 id_12,
    input uwire id_13,
    input tri id_14,
    output wor id_15,
    output wand id_16,
    input tri1 id_17
);
  always @(posedge "" or id_8) begin : LABEL_0
    id_3 <= (id_13);
  end
  xnor primCall (id_4, id_6, id_5, id_17, id_19, id_13, id_2, id_8, id_14, id_12, id_7, id_0, id_9);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_4,
      id_0,
      id_6,
      id_17,
      id_9,
      id_15,
      id_2,
      id_14,
      id_15,
      id_13,
      id_6,
      id_11,
      id_10,
      id_16,
      id_7,
      id_3
  );
  assign modCall_1.id_11 = 0;
endmodule
