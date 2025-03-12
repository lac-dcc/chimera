// Seed: 220861781
macromodule module_0 (
    output tri id_0,
    output wire id_1,
    input uwire id_2
    , id_24,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    output wor id_12,
    input wand id_13,
    input tri0 id_14,
    output wire id_15,
    output wor id_16,
    inout wor id_17,
    input wand id_18,
    input tri1 id_19,
    input wand id_20,
    output tri0 id_21,
    output wand id_22
);
  wire id_25;
endmodule
module module_1 #(
    parameter id_23 = 32'd85,
    parameter id_28 = 32'd86,
    parameter id_33 = 32'd85
) (
    output wire id_0,
    input supply1 id_1,
    input tri id_2,
    input uwire id_3,
    output tri1 id_4,
    output wire id_5,
    input wor id_6,
    output supply0 id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wor id_10,
    output tri1 id_11,
    input tri1 id_12,
    input wand id_13,
    output logic id_14
    , _id_33, id_34,
    input wire id_15,
    input tri0 id_16,
    output tri0 id_17,
    output supply1 id_18,
    input wand id_19,
    input wor id_20
    , id_35,
    output wire id_21,
    input wor id_22,
    input tri _id_23,
    input supply0 id_24,
    output tri0 id_25,
    input supply1 id_26,
    output logic id_27,
    input tri _id_28,
    output tri1 id_29,
    input tri0 id_30,
    inout wor id_31
);
  initial id_14 <= 1;
  logic [id_28  &  -1 : id_33] id_36;
  localparam id_37 = 1;
  module_0 modCall_1 (
      id_4,
      id_31,
      id_3,
      id_12,
      id_17,
      id_31,
      id_31,
      id_24,
      id_20,
      id_13,
      id_31,
      id_17,
      id_25,
      id_30,
      id_10,
      id_5,
      id_31,
      id_31,
      id_6,
      id_12,
      id_6,
      id_31,
      id_11
  );
  assign modCall_1.id_21 = 0;
  initial begin : LABEL_0
    id_27 = {id_2, {-1'h0 - id_12 != id_9, id_19}} - 1;
  end
  logic [7:0][1 'b0 : id_33] id_38;
  assign id_38[id_23] = 1'h0;
  wire id_39;
  wire id_40;
  wire id_41;
endmodule
