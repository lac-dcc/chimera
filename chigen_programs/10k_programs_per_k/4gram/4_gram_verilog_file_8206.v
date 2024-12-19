// Seed: 124479388
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri id_2,
    output wire id_3,
    input wor id_4,
    input wire id_5,
    output wand id_6,
    input tri0 id_7,
    output supply1 id_8,
    output tri0 id_9,
    output tri1 id_10,
    input tri1 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wand id_14,
    input tri1 id_15,
    input supply1 id_16
    , id_45,
    input wand id_17,
    input tri1 id_18,
    output tri id_19,
    output supply1 id_20,
    output tri id_21,
    input wor id_22,
    input supply1 id_23,
    input wand id_24,
    input wor id_25,
    input wor id_26,
    input uwire id_27,
    input supply1 id_28,
    output tri id_29
    , id_46,
    input wand id_30,
    input supply0 id_31,
    input wor id_32,
    input tri id_33,
    input wire id_34,
    output wire id_35,
    input supply0 id_36,
    input supply0 id_37,
    output tri1 id_38,
    input wor id_39,
    output uwire id_40,
    output supply0 id_41,
    input uwire id_42,
    input tri1 id_43
);
  generate
    wire id_47;
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wor id_2,
    output uwire id_3,
    input logic id_4,
    input uwire id_5,
    input tri id_6,
    input uwire id_7,
    output uwire id_8,
    input uwire id_9,
    input supply0 id_10,
    input tri id_11,
    output tri id_12,
    output supply1 id_13,
    input wire id_14,
    output wire id_15
    , id_30,
    input tri1 id_16,
    output logic id_17,
    input wand id_18,
    input wire id_19,
    input wor id_20
    , id_31,
    output supply0 id_21,
    output logic id_22,
    input supply1 id_23,
    input wand id_24,
    input supply1 id_25,
    output supply0 id_26,
    input supply1 id_27,
    input tri id_28
);
  always_comb @(negedge id_30 == 1 + 1 + 1, posedge id_10) begin : LABEL_0
    while (id_5) begin : LABEL_0
      #1 begin : LABEL_0
        id_1 <= 1;
      end
      id_22 <= id_4;
      id_26 = id_5;
      id_17 <= 1;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_26,
      id_5,
      id_15,
      id_10,
      id_0,
      id_8,
      id_28,
      id_3,
      id_3,
      id_8,
      id_11,
      id_14,
      id_21,
      id_16,
      id_20,
      id_23,
      id_10,
      id_5,
      id_26,
      id_8,
      id_3,
      id_14,
      id_14,
      id_0,
      id_0,
      id_11,
      id_27,
      id_20,
      id_8,
      id_2,
      id_10,
      id_11,
      id_0,
      id_27,
      id_12,
      id_23,
      id_16,
      id_12,
      id_24,
      id_12,
      id_12,
      id_0,
      id_7
  );
  assign modCall_1.type_7 = 0;
endmodule
