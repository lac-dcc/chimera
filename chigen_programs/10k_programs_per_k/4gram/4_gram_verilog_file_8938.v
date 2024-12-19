// Seed: 1449688174
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_2;
  assign id_2 = 1;
  assign id_7 = 1;
endmodule
module module_1 (
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
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri  id_9;
  wand id_10 = 1 ? id_3 : 1;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_9 = 1;
endmodule
