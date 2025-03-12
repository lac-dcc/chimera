// Seed: 2811692157
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri0 id_2,
    input wor id_3,
    input wand id_4,
    input tri id_5,
    input tri1 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input uwire id_9,
    input wire id_10,
    input tri0 id_11,
    output wand id_12,
    input tri0 id_13,
    input uwire id_14,
    input supply1 id_15,
    output tri id_16,
    input wor id_17,
    output supply1 id_18,
    input wire id_19,
    input tri0 id_20,
    output supply0 id_21,
    output wire id_22,
    input wand id_23,
    input tri0 id_24,
    input wor id_25,
    input supply0 id_26,
    input supply1 id_27,
    input wor id_28,
    output tri id_29,
    input tri0 id_30,
    output wand id_31,
    input tri id_32
);
  wire id_34, id_35;
  assign module_1._id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd24,
    parameter id_4 = 32'd9
) (
    input wor _id_0,
    output tri1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input wire _id_4,
    output supply1 id_5,
    output supply0 id_6
);
  wire [id_4 : id_0  <  1] id_8 = id_8;
  xnor primCall (id_6, id_3, id_8);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_6,
      id_5,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_6,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_6,
      id_3,
      id_6,
      id_3
  );
endmodule
