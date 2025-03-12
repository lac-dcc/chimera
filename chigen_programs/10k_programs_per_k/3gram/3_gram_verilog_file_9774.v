// Seed: 493092764
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_7;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  uwire id_3
);
  wor id_5 = 1'd0;
  parameter id_6 = 1;
  timeunit 1ps;
  assign id_0 = id_2;
  always @(posedge id_3 or id_5) id_0 = id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6
  );
endmodule
