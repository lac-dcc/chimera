// Seed: 2930875024
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_4 = 1;
  assign id_1 = id_4[-1][1 : 1];
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd42,
    parameter id_8 = 32'd64
) (
    output supply0 id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri1 _id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wire id_6,
    input tri1 id_7,
    input wand _id_8
);
  logic [-1  *  id_8  -  {  id_3  {  1  }  } : 1 'b0] id_10;
  ;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10
  );
  assign id_4 = -1;
  nor primCall (id_5, id_6, id_2, id_1, id_10, id_7);
endmodule
