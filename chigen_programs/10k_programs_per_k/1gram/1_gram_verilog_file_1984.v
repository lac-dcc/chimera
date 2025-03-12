// Seed: 2628528810
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output uwire id_2,
    output wor id_3,
    output supply1 id_4,
    output tri0 id_5,
    input tri id_6,
    input tri id_7,
    input tri0 id_8,
    input wand id_9
);
  assign id_2 = -1;
  wire id_11, id_12, id_13;
endmodule
module module_1 #(
    parameter id_5 = 32'd42,
    parameter id_6 = 32'd30
) (
    output supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wand id_4,
    input tri _id_5,
    input supply1 _id_6,
    output wor id_7,
    input tri1 id_8
);
  parameter id_10 = 1;
  xnor primCall (id_0, id_2, id_4, id_3, id_1, id_11, id_8);
  wire [{  -1  ,  id_5  }  -  -1 : id_6  +  -1] id_11;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
