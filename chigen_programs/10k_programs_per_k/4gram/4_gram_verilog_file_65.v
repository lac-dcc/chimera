// Seed: 3410050669
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
  assign id_2 = id_6;
  wire id_10;
  wire id_11;
  wire id_12;
  logic [7:0] id_13;
  assign id_13[1] = 1 ? id_6 : id_11;
  assign id_3 = id_12;
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
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_7,
      id_3,
      id_6,
      id_1,
      id_7,
      id_1,
      id_1
  );
endmodule
