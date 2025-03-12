// Seed: 2499418406
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
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_6;
  wire id_10;
  assign id_10 = id_7 ? id_1 : 1;
  assign id_5  = id_9;
  assign id_7  = id_9 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_7 = 0;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_6 = -1 - id_6;
endmodule
