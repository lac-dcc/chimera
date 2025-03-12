// Seed: 370512349
module module_0 (
    input tri id_0
);
  assign module_1._id_8 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd90,
    parameter id_7 = 32'd59,
    parameter id_8 = 32'd63
) (
    output uwire id_0,
    input wor _id_1,
    input uwire id_2,
    input uwire id_3,
    input wor id_4,
    input uwire id_5#(.id_12(1)),
    input tri id_6,
    input wand _id_7,
    input wire _id_8,
    input wor id_9,
    input supply0 id_10
);
  wire [-1 : {  -1  ,  id_1  ,  id_7  ,  {  1  {  (  id_8  )  }  }  }] id_13;
  module_0 modCall_1 (id_5);
  xnor primCall (id_0, id_2, id_9, id_3, id_13);
endmodule
