// Seed: 3975707691
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd51,
    parameter id_8  = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout logic [7:0] id_11;
  inout wire _id_10;
  inout wire id_9;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_9,
      id_9,
      id_5
  );
  input wire _id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_11[id_8 : (id_10)] = id_5;
endmodule
