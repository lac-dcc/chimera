// Seed: 2367917430
module module_0 #(
    parameter id_42 = 32'd97,
    parameter id_43 = 32'd53
) (
    input tri1 id_0,
    output uwire id_1,
    input wire id_2,
    input wand id_3,
    input wire id_4,
    input tri0 id_5,
    output supply0 id_6,
    output tri0 id_7
    , id_38,
    input tri1 id_8,
    input tri id_9,
    input tri0 id_10,
    output supply1 id_11,
    input tri0 id_12,
    output supply0 id_13,
    output tri0 id_14,
    input supply1 id_15,
    input wor id_16,
    output tri1 id_17,
    output wor id_18,
    output tri0 id_19,
    output supply1 id_20,
    input tri id_21,
    input tri0 id_22,
    output wor id_23,
    input supply0 id_24,
    input tri0 id_25,
    input tri0 id_26,
    output wand id_27,
    input uwire id_28,
    input supply1 id_29,
    output tri id_30,
    input supply1 id_31,
    input tri id_32,
    output supply0 id_33,
    input uwire id_34,
    input supply0 id_35,
    input wor id_36
);
  wire id_39;
  wire id_40;
  wire id_41;
  defparam id_42 = 1, id_43 = 1;
  wire id_44;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wor id_2,
    input supply0 id_3,
    output wand id_4,
    input wand id_5,
    output tri0 id_6
    , id_17,
    input tri0 id_7,
    output supply0 id_8,
    input logic id_9,
    input tri id_10,
    input tri0 id_11,
    input supply0 id_12,
    output supply1 id_13,
    input supply0 id_14,
    input supply0 id_15
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_3,
      id_5,
      id_15,
      id_5,
      id_8,
      id_4,
      id_2,
      id_7,
      id_7,
      id_8,
      id_10,
      id_6,
      id_8,
      id_12,
      id_2,
      id_4,
      id_6,
      id_4,
      id_8,
      id_7,
      id_3,
      id_6,
      id_0,
      id_0,
      id_11,
      id_6,
      id_0,
      id_5,
      id_4,
      id_7,
      id_15,
      id_4,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.type_48 = 0;
  always @(posedge id_2, negedge id_5)
    if (id_3) id_4 = id_14;
    else id_1 <= id_9;
endmodule
