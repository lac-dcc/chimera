// Seed: 3951757236
module module_0 (
    input uwire id_0,
    input wor id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    output wor id_8
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output tri1 id_5,
    output tri id_6,
    input uwire id_7,
    output supply1 id_8,
    input wor id_9,
    output logic id_10,
    input wand id_11,
    output supply0 id_12,
    input tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    output supply0 id_16,
    output supply0 id_17,
    input tri id_18,
    input supply0 id_19,
    output tri0 id_20,
    output tri0 id_21,
    output tri1 id_22,
    output supply0 id_23
);
  logic id_25;
  ;
  assign id_16 = id_1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_3,
      id_19,
      id_2,
      id_18,
      id_2,
      id_0,
      id_16
  );
  assign modCall_1.id_1 = 0;
  always @(posedge id_9 or posedge 1 - id_14) begin : LABEL_0
    if (-1) begin : LABEL_1
      id_10 = -1;
    end
  end
endmodule
