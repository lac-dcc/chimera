// Seed: 1978674939
module module_0 #(
    parameter id_20 = 32'd55
) (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wand id_5,
    input uwire id_6,
    input tri id_7,
    output supply0 id_8,
    input tri0 id_9,
    output wor id_10,
    input wor id_11,
    input supply0 id_12,
    input wand id_13,
    input wand id_14,
    input tri0 id_15,
    output tri0 id_16,
    output supply0 id_17,
    input tri id_18
);
  assign id_8 = -1 <-> 1;
  parameter id_20 = 1;
  wire [1 'b0 : id_20  ==  1] id_21;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output wire id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_2,
      id_2,
      id_5,
      id_4,
      id_3
  );
  assign modCall_1.id_15 = 0;
endmodule
