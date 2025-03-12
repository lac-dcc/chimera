// Seed: 4026174965
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic [7:0] id_10;
  assign id_8[1] = id_10[-1];
  wire id_11;
  ;
  wire id_12;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd97,
    parameter id_7 = 32'd65
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  input wire id_3;
  inout wire _id_2;
  inout logic [7:0] id_1;
  parameter id_5 = {-1, -1, -1};
  assign id_4[id_2] = -1;
  wire id_6;
  ;
  wire _id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5
  );
  assign id_1[id_7] = id_2;
endmodule
