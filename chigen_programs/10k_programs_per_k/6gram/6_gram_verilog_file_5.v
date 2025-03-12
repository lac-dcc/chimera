// Seed: 1068085909
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
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7, id_8, id_9, id_10, id_11;
endmodule
module module_1 #(
    parameter id_3 = 32'd44
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output supply1 id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  nor primCall (id_9, id_7, id_1, id_2, id_8);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_1,
      id_7,
      id_9
  );
  output wire _id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9 = 1'b0;
  logic [-1 : id_3] id_11;
  ;
  timeunit 1ps;
endmodule
