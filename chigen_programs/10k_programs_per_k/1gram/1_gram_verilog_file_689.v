// Seed: 398048332
module module_0 (
    input  wire id_0,
    output tri0 id_1
);
  generate
    genvar id_3;
    wire [-1 : 1] id_4, id_5;
  endgenerate
  assign id_4 = -1;
  wire id_6, id_7, id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd36,
    parameter id_11 = 32'd11
) (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    input tri id_7,
    input tri id_8,
    input supply1 id_9,
    input wire _id_10,
    input wire _id_11[id_11 : {  id_10  !==  -1  {  1  }  }]
);
  union packed {
    logic   id_13;
    integer id_14;
    logic   id_15;
  } id_16;
  xnor primCall (id_4, id_15, id_8, id_9, id_5, id_16, id_7, id_1, id_6, id_2, id_14);
  module_0 modCall_1 (
      id_8,
      id_4
  );
endmodule
