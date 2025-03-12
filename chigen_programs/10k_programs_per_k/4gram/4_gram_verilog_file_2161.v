// Seed: 3356902842
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input wire id_2,
    output uwire id_3,
    input tri id_4,
    input uwire id_5,
    input wand id_6,
    output wand id_7,
    input uwire id_8,
    input tri0 id_9,
    input supply1 id_10,
    output wire id_11,
    input wire id_12,
    input wor id_13,
    input tri0 id_14,
    output tri id_15,
    output tri id_16
);
endmodule
module module_1 #(
    parameter id_14 = 32'd9
) (
    output supply0 id_0,
    output supply1 id_1,
    input wire id_2,
    input tri0 id_3,
    input tri0 id_4
    , id_26,
    output supply0 id_5,
    input wor id_6,
    input wor id_7,
    output wire id_8,
    input supply0 id_9,
    output tri0 id_10,
    input wire id_11,
    input tri id_12,
    input wire id_13,
    output supply1 _id_14,
    output tri0 id_15,
    input tri id_16,
    output supply0 id_17,
    output wor id_18,
    output wor id_19,
    output logic id_20,
    input supply1 id_21,
    input tri1 id_22,
    input uwire id_23,
    output wor id_24
);
  wor id_27 = id_11 && id_2;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_4,
      id_5,
      id_3,
      id_3,
      id_21,
      id_8,
      id_16,
      id_23,
      id_11,
      id_5,
      id_2,
      id_6,
      id_11,
      id_17,
      id_5
  );
  assign id_8 = -1;
  logic [id_14 : 1] id_28;
  wire id_29 = id_2;
  always @(id_22, posedge 1'b0)
    if (1'b0) begin : LABEL_0
      id_20 <= 1 ^ id_4;
    end
endmodule
