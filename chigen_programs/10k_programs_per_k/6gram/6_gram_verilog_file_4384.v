// Seed: 3575617031
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  wand id_9;
  wire id_10;
  assign id_4 = id_1 ^ {~id_9{id_7}} != 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  tri id_7 = 1;
  wire id_8, id_9, id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11
  );
  assign modCall_1.type_8 = 0;
  timeprecision 1ps;
endmodule
