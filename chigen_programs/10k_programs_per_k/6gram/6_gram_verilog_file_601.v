// Seed: 2701132303
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    output tri id_5,
    output tri0 id_6,
    output wor id_7,
    input supply1 id_8,
    input wand id_9,
    output wire id_10,
    input uwire id_11,
    input tri0 id_12,
    output supply1 id_13,
    input tri0 id_14,
    input wor id_15,
    input wire id_16,
    input tri id_17,
    input wand id_18,
    output tri id_19,
    input tri0 id_20,
    input tri1 id_21,
    input wor id_22,
    input tri id_23,
    output tri0 id_24,
    output tri id_25,
    output wire id_26,
    input tri id_27,
    input wire id_28,
    input tri0 id_29,
    output supply0 id_30,
    input wire id_31
);
  id_33(
      .id_0(1), .id_1(id_12)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input tri1 id_2,
    output logic id_3,
    input wire id_4,
    output wor id_5,
    input wire id_6
);
  assign id_3 = 1 == (1'b0);
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_0,
      id_5,
      id_0,
      id_6,
      id_5,
      id_2,
      id_2,
      id_0,
      id_2,
      id_6,
      id_5,
      id_4,
      id_6,
      id_1,
      id_4,
      id_5,
      id_5,
      id_5,
      id_4,
      id_0,
      id_4,
      id_5,
      id_6
  );
  assign modCall_1.type_16 = 0;
  always @(id_1 or 1'b0) begin : LABEL_0
    id_3 <= 1 & 1;
  end
endmodule
