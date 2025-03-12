// Seed: 991055963
module module_0 #(
    parameter id_18 = 32'd42
) (
    output tri0 id_0,
    input supply0 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri id_4,
    input tri id_5,
    input wand id_6,
    input tri0 id_7,
    output wor id_8,
    output tri0 id_9,
    input wand id_10,
    input wand id_11,
    output wire id_12,
    output uwire id_13,
    input supply0 id_14
);
  logic [7:0]
      id_16,
      id_17,
      _id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      \id_24 ,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    inout supply0 id_3,
    inout supply0 id_4,
    output wor id_5,
    output wire id_6,
    input uwire id_7
);
  always begin : LABEL_0
    assert (-1);
  end
  module_0 modCall_1 (
      id_6,
      id_2,
      id_4,
      id_1,
      id_3,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_7,
      id_5,
      id_3,
      id_2
  );
  assign id_3 = id_1;
endmodule
