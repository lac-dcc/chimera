// Seed: 2459523835
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output wand id_2,
    output supply1 id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    input tri id_7
);
  assign id_4 = id_0;
  assign module_1.id_35 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd68,
    parameter id_15 = 32'd56,
    parameter id_22 = 32'd60
) (
    input wand id_0,
    input tri0 id_1,
    output tri id_2,
    output uwire id_3,
    output tri0 id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7,
    input wor id_8,
    output tri1 id_9,
    output supply0 id_10,
    input uwire id_11[id_22 : id_15],
    output supply0 _id_12,
    input wor id_13,
    input tri1 id_14,
    input tri _id_15,
    output wor id_16,
    input supply1 id_17,
    output supply0 id_18,
    input wor id_19,
    output tri0 id_20#(.id_39(1 + 1'b0)),
    output wand id_21,
    input wire _id_22,
    output supply0 id_23,
    input tri0 id_24,
    input wire id_25,
    output supply1 id_26,
    output tri1 id_27,
    input tri id_28,
    input wand id_29,
    output wor id_30,
    output tri1 id_31,
    inout supply1 id_32,
    output logic id_33,
    output uwire id_34,
    input tri id_35,
    input supply0 id_36,
    input tri id_37
);
  tri1 id_40;
  union {logic id_41[-1 : 1  -  id_12];} id_42;
  wire [1 : 1] id_43;
  wire [1 : -1] id_44;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_30,
      id_9,
      id_3,
      id_35,
      id_13,
      id_11
  );
  wire id_45;
  ;
  always @(1) id_33 = {(-1) {id_6}};
  assign id_40 = 1;
  assign id_40 = id_35;
endmodule
