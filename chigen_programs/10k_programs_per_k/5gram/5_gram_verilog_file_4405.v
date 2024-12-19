// Seed: 3248850066
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  supply1 id_11 = 1 && (id_2), id_12;
  wand id_13;
  assign id_4 = module_0[1!=1] ? id_13 : 1;
  wire id_14;
  wire id_15;
  timeunit 1ps;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_11 = 0;
endmodule
