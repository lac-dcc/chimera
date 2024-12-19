// Seed: 2925973501
module module_0 (
    output uwire id_0,
    output supply1 id_1,
    input wor id_2,
    output tri1 id_3,
    output wire id_4,
    input supply1 id_5
    , id_25,
    input wor id_6,
    output wor id_7,
    input tri id_8,
    output tri0 id_9,
    input uwire id_10,
    input wor id_11,
    output uwire id_12,
    output wire id_13,
    input tri id_14,
    input wand id_15,
    input tri0 id_16,
    output wand id_17,
    input supply1 id_18,
    output tri0 id_19,
    input wor id_20,
    input tri id_21,
    input supply1 id_22,
    input uwire id_23
);
  wor  id_26 = id_11, id_27;
  wire id_28;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input wand id_2,
    output supply1 id_3,
    output logic id_4
);
  tri1 id_6;
  wand id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_7 = 0;
  wire id_8, id_9, id_10;
  always @(posedge 1 or 1) begin : LABEL_0
    id_4 <= 1 * id_6 - "";
  end
  generate
    id_11(
        .id_0(""), .id_1(), .id_2(1), .id_3(1)
    );
    wire id_12 = ~id_7;
  endgenerate
endmodule
