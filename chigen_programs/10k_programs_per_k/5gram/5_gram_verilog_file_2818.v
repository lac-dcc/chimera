// Seed: 26283377
module module_0 (
    output wor id_0,
    input wire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output supply1 id_4,
    output wire id_5,
    input uwire id_6,
    output uwire id_7,
    input supply0 id_8,
    output wor id_9,
    output tri0 id_10,
    input uwire id_11,
    input wand id_12,
    input tri1 id_13,
    input supply0 id_14,
    input tri0 id_15,
    output wire id_16,
    output wire id_17,
    input supply0 id_18,
    output tri id_19,
    output tri id_20,
    input tri0 id_21,
    input tri1 id_22,
    output tri0 id_23,
    output tri0 id_24
);
  wire id_26, id_27;
  wire id_28;
endmodule
module module_1 #(
    parameter id_5 = 32'd90,
    parameter id_6 = 32'd59
) (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input wor id_3,
    output logic id_4,
    input tri _id_5,
    input wand _id_6,
    input wire id_7,
    output wor id_8,
    input supply0 id_9,
    input supply1 id_10
);
  always @(id_1) begin : LABEL_0
    id_4 = id_3;
  end
  logic [id_6 : 1] id_12;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_8,
      id_9,
      id_2,
      id_8,
      id_7,
      id_2,
      id_10,
      id_8,
      id_8,
      id_0,
      id_10,
      id_1,
      id_9,
      id_7,
      id_8,
      id_2,
      id_7,
      id_8,
      id_2,
      id_10,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = id_0;
  wire [id_6 : id_5] id_13;
endmodule
