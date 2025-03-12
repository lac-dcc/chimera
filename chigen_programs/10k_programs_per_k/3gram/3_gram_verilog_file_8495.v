// Seed: 1443166516
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
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = 1'b0;
  parameter id_11 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd86,
    parameter id_8 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  input wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  input wire id_3;
  output wire id_2;
  xnor primCall (id_6, id_7, id_10, id_9, id_5);
  input wire id_1;
  assign id_5[id_4+:id_8] = id_5;
  wire id_9;
  logic [id_4 : 1] id_10;
  ;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_10,
      id_10,
      id_10,
      id_7,
      id_6,
      id_10,
      id_3,
      id_3
  );
endmodule
