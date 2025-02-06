// Seed: 1905744133
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
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_11, id_12, id_13, id_14, id_15;
  assign id_13 = id_5 ? id_12 : -1;
  specify
    (id_16 + => id_17) = (-1  : -1  : $realtime, id_13  : (id_1): 1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  \id_13 (
      id_11, (id_11), id_2
  );
  uwire id_14 = $realtime;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_7,
      id_5,
      id_9,
      id_14,
      id_14,
      id_4,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule
