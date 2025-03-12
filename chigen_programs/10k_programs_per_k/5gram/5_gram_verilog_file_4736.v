// Seed: 2459542153
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_12;
  parameter id_13 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd4
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output logic [7:0] id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3
  );
  inout wire id_2;
  input wire id_1;
  wire id_9;
  ;
  wire id_10;
  wire _id_11;
  assign id_7[id_11] = id_6[1'b0 :-1];
endmodule
