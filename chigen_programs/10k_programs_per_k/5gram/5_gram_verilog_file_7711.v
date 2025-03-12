// Seed: 3259564013
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always disable id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd63
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wand [1 : (  id_4  )] id_10;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_9,
      id_6,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
