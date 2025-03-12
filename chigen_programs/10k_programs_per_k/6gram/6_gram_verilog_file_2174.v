// Seed: 4055223351
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input supply0 id_7
    , id_14,
    input wand id_8,
    output tri0 id_9,
    input tri0 id_10,
    output supply0 id_11,
    output wor id_12
);
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wor id_3,
    input supply0 id_4,
    output logic id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8,
    input wor id_9,
    input tri1 id_10,
    input wire id_11,
    input wire id_12,
    input tri0 id_13,
    output tri0 id_14,
    input uwire id_15,
    input supply1 id_16,
    output logic id_17,
    output tri1 id_18,
    input supply0 id_19,
    input uwire id_20,
    output logic id_21,
    output supply0 id_22,
    output tri1 id_23,
    output supply0 id_24,
    input wor id_25,
    output logic id_26,
    input wor id_27,
    output supply0 id_28,
    input wor id_29,
    input tri0 id_30
);
  assign id_21 = id_10;
  assign id_22 = 1;
  always
    case (id_13)
      (id_30): begin : LABEL_0
        id_26#(.id_10(1)) <= 1;
      end
      -1: id_21 <= id_30;
      -1: id_5 = 1 + 1;
      default: id_17 <= -1;
    endcase
  xor primCall (
      id_21,
      id_4,
      id_3,
      id_10,
      id_25,
      id_13,
      id_20,
      id_2,
      id_12,
      id_8,
      id_9,
      id_6,
      id_7,
      id_16,
      id_0,
      id_27,
      id_19,
      id_11,
      id_15,
      id_30,
      id_29
  );
  module_0 modCall_1 (
      id_6,
      id_1,
      id_13,
      id_11,
      id_24,
      id_0,
      id_25,
      id_3,
      id_6,
      id_22,
      id_8,
      id_22,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
