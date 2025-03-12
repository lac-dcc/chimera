// Seed: 3243315033
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_5 = id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd76,
    parameter id_9  = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    _id_11
);
  input wire _id_11;
  output wire id_10;
  output wire _id_9;
  output logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_1,
      id_5
  );
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic [id_9 : -1] id_12 = id_12;
  assign id_8[id_11] = id_3;
endmodule
