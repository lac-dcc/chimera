// Seed: 2466272522
module module_0 #(
    parameter id_6 = 32'd90
) (
    input tri1 id_0,
    input uwire id_1,
    input wor id_2[-1  !=  id_6 : (  1  )],
    input wor id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri1 _id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    output wire id_11,
    input tri0 id_12,
    input supply0 id_13,
    input supply0 id_14,
    input tri1 id_15,
    output wand id_16
);
  assign id_16 = id_12 == id_12;
  assign id_16 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd23,
    parameter id_4 = 32'd55,
    parameter id_8 = 32'd10
) (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 _id_2,
    input wire id_3,
    input wand _id_4
);
  assign id_0 = id_2;
  logic [7:0][id_4 : {  1  {  id_2  }  }] id_6, id_7, _id_8, id_9, id_10;
  assign id_8 = id_6[id_8];
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_8,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0
  );
endmodule
