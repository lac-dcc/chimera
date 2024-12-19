// Seed: 4040120338
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri1 id_11,
    output tri0 id_12,
    output wire id_13,
    output wire id_14,
    output wand id_15,
    output tri0 id_16,
    output supply0 id_17,
    input supply1 id_18,
    input wand id_19,
    output tri1 id_20,
    output supply0 id_21,
    output wire id_22,
    input tri0 id_23,
    input tri1 id_24,
    output tri0 id_25,
    output wor id_26,
    input supply0 id_27,
    input wire id_28,
    output wor id_29,
    input supply0 id_30,
    output supply1 id_31,
    output tri id_32,
    output supply1 id_33,
    output wor id_34,
    input tri id_35,
    input uwire id_36
);
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input wire id_2,
    output tri id_3,
    input uwire id_4,
    output logic id_5,
    input tri0 id_6,
    output tri id_7,
    input wire id_8,
    output supply0 id_9,
    output uwire id_10,
    output wor id_11,
    input tri id_12,
    input tri id_13,
    input tri0 id_14,
    input wor id_15,
    input wire id_16,
    input tri0 id_17,
    output tri id_18,
    input tri0 id_19,
    input wor id_20,
    output wand id_21,
    input tri0 id_22,
    input tri id_23,
    input uwire id_24,
    input uwire id_25,
    input tri id_26
);
  always begin : LABEL_0
    id_5 <= 1;
    if (1'b0) begin : LABEL_0
      @(posedge id_19) assign id_21 = 1;
    end
    `define pp_28 0
    fork
      if (1) id_21 = 1;
      else id_9 = 1;
    join_none
  end
  module_0 modCall_1 (
      id_20,
      id_16,
      id_25,
      id_22,
      id_26,
      id_10,
      id_11,
      id_14,
      id_15,
      id_7,
      id_17,
      id_21,
      id_11,
      id_7,
      id_7,
      id_9,
      id_9,
      id_21,
      id_20,
      id_23,
      id_11,
      id_10,
      id_21,
      id_24,
      id_8,
      id_11,
      id_9,
      id_25,
      id_23,
      id_7,
      id_15,
      id_10,
      id_10,
      id_10,
      id_18,
      id_20,
      id_25
  );
  assign modCall_1.type_12 = 0;
endmodule
