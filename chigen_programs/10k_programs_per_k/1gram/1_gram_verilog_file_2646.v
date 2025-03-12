// Seed: 2508337697
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wand id_5;
  assign module_1.id_6 = 0;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = (-1'd0);
endmodule
module module_1 #(
    parameter id_4 = 32'd18,
    parameter id_5 = 32'd28
) (
    output wire  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    output tri1  id_3,
    output wire  _id_4,
    input  wor   _id_5,
    output logic id_6,
    input  wor   id_7,
    output wire  id_8
);
  always_comb
  `define pp_10 0
  logic [7:0] id_11, id_12[{  {  !  1  ,  1  }  ,  -1  ,  id_4  }  ?  1 : id_4 : -1  -  -1];
  logic id_13;
  ;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  assign id_8 = id_11[id_5];
  always_latch id_6 = id_13;
endmodule
