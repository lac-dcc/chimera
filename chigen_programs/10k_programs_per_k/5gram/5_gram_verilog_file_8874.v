// Seed: 2665418856
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_3,
      id_4
  );
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  xnor primCall (id_4, id_6, id_5, id_1);
  wire id_7;
  ;
endmodule
module module_2 #(
    parameter id_0 = 32'd75,
    parameter id_1 = 32'd63
) (
    input  uwire _id_0,
    input  wor   _id_1,
    output tri   id_2,
    input  tri   id_3
);
  supply0 id_5, id_6;
  assign id_2 = id_3 ? id_0 + -1 : -1;
  assign id_6 = {-1, -1} | id_5;
  wire [1  -  id_0 : id_1] id_7;
  parameter id_8 = -1;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_10
  );
endmodule
