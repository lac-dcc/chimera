// Seed: 3157163000
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire \id_13 ;
  assign id_4 = -1;
  wire id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  specify
    (id_8 - => id_9) = (id_8  : -1'b0 : id_1, id_1  : id_7[$realtime] : -1'b0);
    (id_10 + => id_11) = (id_3  : 1  : $realtime, $realtime : 1  : -1);
  endspecify
  module_0 modCall_1 (
      id_1,
      id_8,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11,
      id_8
  );
endmodule
