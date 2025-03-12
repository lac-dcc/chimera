// Seed: 2107273111
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wand id_3,
    output wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wire id_7,
    input wand id_8,
    input wand id_9,
    input tri id_10,
    input tri0 id_11,
    input wire id_12,
    input wor id_13,
    input wor id_14,
    output tri1 id_15,
    input tri0 id_16,
    input supply1 id_17,
    output wor id_18,
    input wire id_19,
    input tri0 id_20,
    input wire id_21,
    input tri0 id_22,
    output tri1 id_23,
    input wor id_24,
    input tri0 id_25,
    input uwire id_26,
    input supply1 id_27,
    input tri id_28,
    input tri0 id_29,
    input tri id_30,
    output wor id_31,
    output tri0 id_32,
    input tri0 id_33,
    input tri0 id_34,
    output wand id_35,
    input tri1 id_36,
    input tri0 id_37,
    output wor id_38,
    input uwire id_39,
    input wand id_40,
    input tri1 id_41,
    input tri id_42,
    output uwire id_43,
    input wand id_44
    , id_48,
    input uwire id_45,
    output wand id_46
);
  generate
    wire id_49[1 : ""];
  endgenerate
  localparam id_50 = 1;
  assign id_38 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd28
) (
    input supply1 id_0,
    input supply1 _id_1,
    input wor id_2,
    output tri id_3,
    output uwire id_4
);
  bit [1 : id_1] id_6 = -1;
  always @(posedge id_1 + -1 or posedge id_6) id_6 = id_0;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_0,
      id_4,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_4,
      id_2,
      id_0,
      id_0,
      id_0,
      id_4,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
