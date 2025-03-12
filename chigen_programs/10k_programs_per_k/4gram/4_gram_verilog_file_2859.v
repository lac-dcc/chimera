// Seed: 852763902
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
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_14;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd30,
    parameter id_9 = 32'd63
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  inout wire _id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_4,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_4,
      id_7,
      id_7,
      id_3,
      id_3
  );
  logic [7:0] id_8;
  ;
  assign id_2 = id_2[-1];
  wire _id_9;
  assign id_8[id_1*-1 : id_9] = id_4;
  logic id_10;
  ;
endmodule
