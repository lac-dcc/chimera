// Seed: 2207594031
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd21,
    parameter id_2 = 32'd62
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3
  );
  output wire _id_2;
  output wire _id_1;
  logic [-1 : 1  -  {  id_1  ,  id_2  }] id_5;
  wire id_6;
  wire id_7;
endmodule
