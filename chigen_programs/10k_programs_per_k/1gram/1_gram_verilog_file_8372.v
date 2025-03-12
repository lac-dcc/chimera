// Seed: 2159483466
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_8;
endmodule
module module_1 #(
    parameter id_6 = 32'd42,
    parameter id_8 = 32'd98
) (
    id_1,
    id_2,
    id_3,
    id_4[id_6 : id_6],
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire _id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_1,
      id_7,
      id_5,
      id_7
  );
  output wire _id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9 = id_4;
  wire [id_8 : $realtime] id_11, id_12;
  wire id_13;
endmodule
