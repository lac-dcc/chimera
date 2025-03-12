// Seed: 3872835212
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = !id_2;
endmodule
module module_1 #(
    parameter id_3 = 32'd29,
    parameter id_6 = 32'd82
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_10,
      id_9,
      id_9,
      id_9,
      id_7
  );
  output wire id_1;
  assign id_8[id_3] = id_6 ? id_4 : id_5 ? -1 : id_5;
  assign id_8 = id_3;
  logic [1 : id_6] id_12;
endmodule
