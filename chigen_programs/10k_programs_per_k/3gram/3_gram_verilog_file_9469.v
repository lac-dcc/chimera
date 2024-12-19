// Seed: 1669335838
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  uwire id_7;
  assign id_7 = id_6;
  uwire id_8;
  assign id_6 = (id_8 ^ 1'b0);
  wire id_9;
  wire id_10;
  wire id_11;
  assign id_6 = 1;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always id_9 = #id_12 "";
  wire id_13 = id_4;
  assign id_7 = id_9;
  module_0 modCall_1 (
      id_10,
      id_11,
      id_10,
      id_3,
      id_2,
      id_13
  );
  assign modCall_1.id_6 = 0;
endmodule
