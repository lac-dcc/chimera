// Seed: 2854190369
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input wire id_3,
    input tri id_4,
    input tri id_5,
    output uwire id_6,
    input tri0 id_7,
    output tri0 id_8,
    input supply1 id_9
);
  wire id_11;
endmodule
module module_1 #(
    parameter id_0  = 32'd98,
    parameter id_10 = 32'd68
) (
    output tri0 _id_0,
    input wand id_1,
    input supply0 id_2,
    input tri0 id_3[id_10 : {  1  {  -1  ==  id_0  }  }],
    input wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    output logic id_8,
    input wand id_9,
    output wand _id_10,
    output tri0 id_11,
    output tri id_12,
    input tri0 id_13
);
  logic id_15;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_11,
      id_3,
      id_13,
      id_9,
      id_12,
      id_9,
      id_12,
      id_9
  );
  assign modCall_1.id_3 = 0;
  always id_8 = id_2;
  xnor primCall (id_8, id_9, id_3, id_6, id_13, id_2, id_1, id_7, id_4, id_15);
endmodule
