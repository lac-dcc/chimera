// Seed: 4140320783
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
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  genvar id_11;
  assign id_3 = id_6;
  wire id_12, id_13;
  wire id_14;
  assign id_3 = id_9#1;
  always @(1) #id_15 id_6 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_4;
endmodule
