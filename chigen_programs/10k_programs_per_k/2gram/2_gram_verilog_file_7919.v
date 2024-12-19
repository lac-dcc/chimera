// Seed: 841431050
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output wor id_2,
    input wire id_3,
    input wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    output wand id_7,
    output wand id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input uwire id_12,
    output supply0 id_13,
    output tri id_14,
    input tri id_15,
    output supply1 id_16,
    input wire id_17,
    input tri id_18,
    input supply1 id_19,
    input supply0 id_20,
    output supply1 id_21,
    input tri id_22,
    output wor id_23,
    input tri1 id_24,
    input tri id_25,
    output wand id_26,
    input supply1 id_27,
    output wand id_28,
    input wire id_29,
    input wand id_30
);
endmodule
module module_1 (
    input logic id_0,
    inout supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wire id_4,
    input supply0 id_5,
    input wor id_6,
    input wire id_7,
    output supply1 id_8,
    input wor id_9,
    input tri0 id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input supply0 id_14,
    output tri0 id_15,
    input uwire id_16
    , id_33,
    output uwire id_17,
    output tri id_18,
    input tri id_19,
    output tri0 id_20
    , id_34,
    input tri1 id_21,
    output tri0 id_22,
    input tri0 id_23,
    output supply1 id_24,
    input logic id_25
    , id_35,
    input supply0 id_26,
    input supply1 id_27,
    output logic id_28,
    input tri0 id_29,
    input wire id_30,
    input wire id_31
);
  initial begin : LABEL_0
    id_28 <= {1, 1, id_25, id_0, ""};
  end
  module_0 modCall_1 (
      id_34,
      id_22,
      id_33,
      id_33,
      id_10,
      id_10,
      id_9,
      id_15,
      id_33,
      id_9,
      id_26,
      id_14,
      id_7,
      id_20,
      id_17,
      id_33,
      id_34,
      id_35,
      id_4,
      id_26,
      id_19,
      id_35,
      id_6,
      id_20,
      id_13,
      id_12,
      id_33,
      id_13,
      id_20,
      id_12,
      id_2
  );
  assign modCall_1.type_7 = 0;
  id_36(
      .id_0(id_12), .id_1(1'b0)
  );
endmodule
