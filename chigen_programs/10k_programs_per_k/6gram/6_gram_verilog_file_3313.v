// Seed: 3054967380
module module_0 (
    input uwire module_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input uwire id_11,
    input supply1 id_12,
    output supply1 id_13,
    input supply1 id_14,
    input uwire id_15,
    output tri id_16,
    input tri1 id_17,
    input supply1 id_18,
    output supply0 id_19,
    output supply1 id_20,
    input supply0 id_21,
    input tri0 id_22,
    output tri id_23,
    output tri1 id_24,
    input supply1 id_25,
    input wire id_26,
    output supply1 id_27,
    output tri0 id_28
);
  wire id_30;
  assign id_19 = id_1;
  assign id_16 = id_11;
endmodule
module module_1 (
    output supply0 id_0
    , id_31,
    input tri1 id_1,
    output wor id_2,
    input supply1 id_3,
    output wor id_4,
    input tri1 id_5,
    output tri1 id_6,
    output supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    output tri1 id_10,
    input wor id_11,
    input tri0 id_12,
    output wor id_13,
    output uwire id_14,
    input supply0 id_15,
    output tri id_16
    , id_32,
    output logic id_17,
    input wor id_18,
    output tri id_19,
    input supply1 id_20,
    input wor id_21,
    input uwire id_22,
    input supply1 id_23,
    input wor id_24,
    output tri1 id_25,
    output uwire id_26,
    input tri id_27,
    input supply1 id_28,
    output supply0 id_29
);
  wire id_33;
  always begin : LABEL_0
    id_17 <= id_22;
    assign id_19 = id_20;
    case ({id_22{id_21}})
      -1: id_31 = 1;
    endcase
  end
  module_0 modCall_1 (
      id_18,
      id_22,
      id_21,
      id_15,
      id_9,
      id_22,
      id_19,
      id_5,
      id_15,
      id_11,
      id_5,
      id_9,
      id_27,
      id_0,
      id_28,
      id_24,
      id_6,
      id_18,
      id_22,
      id_0,
      id_10,
      id_15,
      id_9,
      id_14,
      id_16,
      id_12,
      id_21,
      id_0,
      id_29
  );
  assign modCall_1.id_28 = 0;
endmodule
