// Seed: 1275766440
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd45,
    parameter id_6 = 32'd82
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  inout wire _id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  output logic [7:0] id_3;
  inout wire _id_2;
  output wire id_1;
  tri id_11 = 1 + id_5 | id_7;
  assign id_3[id_6||id_2 : 1] = (id_11) == id_5;
  assign id_7[-1] = id_8;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_10,
      id_9,
      id_9,
      id_5,
      id_11
  );
endmodule
