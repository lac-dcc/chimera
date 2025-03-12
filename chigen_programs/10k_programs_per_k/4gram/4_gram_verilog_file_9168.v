// Seed: 1579996170
module module_0 (
    output uwire id_0,
    output wor   id_1,
    output uwire id_2,
    input  tri0  id_3
);
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd99,
    parameter id_16 = 32'd43,
    parameter id_18 = 32'd46
) (
    output supply1 id_0,
    output wor id_1,
    input tri1 id_2,
    output wand id_3,
    input wor id_4,
    output logic id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wor id_8,
    input uwire id_9,
    output supply1 id_10,
    output wire id_11,
    input tri _id_12,
    input wor id_13,
    output uwire id_14,
    input tri1 id_15,
    output supply1 _id_16,
    input wand id_17,
    input wor _id_18,
    input supply0 id_19,
    output wand id_20,
    input wor id_21,
    output tri id_22,
    input uwire id_23,
    output supply0 id_24,
    output supply0 id_25
);
  always_ff id_5 <= -1'b0;
  supply1 [id_18 : "" *  1  +  1] id_27 = -1'b0;
  logic [id_16 : id_12] id_28;
  parameter id_29 = (-1) + 1'b0;
  assign id_0 = -1 ? -1 & (-1) : 1 ? id_27 : id_8;
  module_0 modCall_1 (
      id_22,
      id_10,
      id_11,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
