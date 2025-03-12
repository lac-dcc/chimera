// Seed: 1600879826
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output supply1 id_1;
  assign id_1 = -1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_6 = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_3,
      id_4
  );
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire _id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 [1 : (  id_6  )] id_14;
  nor primCall (id_4, id_8, id_10, id_5, id_1, id_13, id_3, id_7, id_2);
  assign id_14 = 1'b0;
endmodule
