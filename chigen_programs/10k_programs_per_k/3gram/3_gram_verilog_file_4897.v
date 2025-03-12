// Seed: 750744007
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output tri0 id_2;
  input wire id_1;
  assign id_2 = 1;
  assign id_5 = -1;
  logic id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd50
) (
    output tri  id_0,
    input  wire id_1,
    input  wand _id_2
);
  logic [7:0] \id_4 ;
  reg id_5;
  logic [7:0][id_2 : 1] id_6;
  wire id_7, id_8;
  assign id_6[1] = -1;
  always @(-1 - 1 or posedge id_6) id_5 <= \id_4 ;
  nand primCall (id_0, \id_4 , id_6, id_7, id_5, id_1, id_8);
  assign \id_4 [-1] = 1;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_2 = 0;
  assign id_8 = id_8;
endmodule
